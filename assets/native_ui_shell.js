(function() {
    'use strict';

    // This small, versioned entry point is intentionally separate from the
    // remotely hotfixable spotify_bridge.js so a stale remote bridge cannot
    // prevent the Android shell from being activated.
    if (window.__sfNativeUiShellStarted) return;
    window.__sfNativeUiShellStarted = true;
    window.__sfNativeUiShellErrors = 0;

    var HOME_PATHS = ['/', '/home'];
    var SUPPORTED_TYPES = ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook'];
    var MAX_READY_RETRIES = 60;
    var readyRetries = 0;
    var readyRetryTimer = null;
    var updateTimer = null;
    var observer = null;

    function normalizedPath() {
        var path = window.location.pathname || '/';
        if (path.length > 1) path = path.replace(/\/+$/, '');
        return path || '/';
    }

    function isSpotifyHome() {
        return window.location.hostname === 'open.spotify.com' && HOME_PATHS.indexOf(normalizedPath()) >= 0;
    }

    function nativeSpotifyUri(value) {
        var raw = String(value || '').trim();
        var parts;
        var typeIndex;
        var url;
        if (!raw) return '';

        if (/^spotify:/i.test(raw)) {
            parts = raw.slice(raw.indexOf(':') + 1).split(':').filter(Boolean);
            typeIndex = parts.findIndex(function(part) {
                return SUPPORTED_TYPES.indexOf(part.toLowerCase()) >= 0;
            });
            if (typeIndex >= 0 && parts[typeIndex + 1]) {
                return 'spotify:' + parts[typeIndex].toLowerCase() + ':' + parts[typeIndex + 1];
            }
            return raw;
        }

        try {
            url = new URL(raw, window.location.href);
            if (url.hostname !== 'open.spotify.com') return raw;
            parts = url.pathname.split('/').filter(Boolean);
            typeIndex = parts.findIndex(function(part) {
                return SUPPORTED_TYPES.indexOf(part.toLowerCase()) >= 0;
            });
            if (typeIndex >= 0 && parts[typeIndex + 1]) {
                return 'spotify:' + parts[typeIndex].toLowerCase() + ':' + parts[typeIndex + 1];
            }
        } catch (_) {}
        return raw;
    }

    function sendNativeUiData(screen, items) {
        var bridge = window.AndBridge;
        var rows;
        if (!bridge || typeof bridge.onNativeUiData !== 'function') return false;

        rows = (Array.isArray(items) ? items : []).map(function(item) {
            var title = String(item && (item.title || item.name || item.label) || '').trim();
            var subtitle = String(item && (item.subtitle || item.artist || item.description) || '').trim();
            var rawUri = item && (item.uri || item.id || item.href) || '';
            return { title: title, subtitle: subtitle, uri: nativeSpotifyUri(rawUri) };
        }).filter(function(item) {
            return item.title || item.uri;
        });

        try {
            bridge.onNativeUiData(screen, JSON.stringify(rows));
            return true;
        } catch (_) {
            return false;
        }
    }

    function spotifyResourceUri(href) {
        var url;
        try {
            url = new URL(href, window.location.href);
        } catch (_) {
            return '';
        }
        if (url.hostname !== 'open.spotify.com') return '';

        var parts = url.pathname.split('/').filter(Boolean);
        var typeIndex = parts.findIndex(function(part) {
            return SUPPORTED_TYPES.indexOf(part.toLowerCase()) >= 0;
        });
        if (typeIndex < 0 || !parts[typeIndex + 1]) return '';
        return nativeSpotifyUri(url.href);
    }

    function textLines(element) {
        var text = String(element && (element.innerText || element.textContent) || '');
        return text.split('\n').map(function(line) {
            return line.replace(/\s+/g, ' ').trim();
        }).filter(Boolean);
    }

    function collectHomeRows(mainView) {
        var cardNodes = Array.prototype.slice.call(mainView.querySelectorAll('[data-testid="card"]'));
        var candidates = cardNodes.length
            ? cardNodes
            : Array.prototype.slice.call(mainView.querySelectorAll('a[href]')).filter(function(anchor) {
                return !!anchor.querySelector('img');
            });
        var seen = new Set();
        var rows = [];

        candidates.forEach(function(candidate) {
            var sourceAnchor = candidate.matches('a[href]') ? candidate : candidate.querySelector('a[href]');
            var uri = sourceAnchor && spotifyResourceUri(sourceAnchor.href);
            var image = sourceAnchor && sourceAnchor.querySelector('img') || candidate.querySelector('img');
            var lines;
            var title;
            var subtitle;
            var section;
            var headingNode;
            var sectionTitle;

            if (!sourceAnchor || !uri || seen.has(uri)) return;
            seen.add(uri);
            lines = textLines(candidate);
            title = String(
                candidate.getAttribute('aria-label') ||
                sourceAnchor.getAttribute('aria-label') ||
                lines[0] ||
                image && image.getAttribute('alt') ||
                ''
            ).replace(/\s+/g, ' ').trim().slice(0, 100);
            if (!title) return;

            subtitle = lines.find(function(line) { return line !== title; }) || '';
            section = candidate.closest('section') || mainView;
            headingNode = section === mainView
                ? null
                : Array.prototype.slice.call(section.querySelectorAll('h2, h3, [data-testid="shelf-title"]'))
                    .find(function(node) { return !node.closest('[data-testid="card"]'); });
            sectionTitle = String(headingNode && headingNode.textContent || '')
                .replace(/\s+/g, ' ').trim().slice(0, 80);

            rows.push({
                title: title,
                subtitle: [sectionTitle, subtitle.slice(0, 120)].filter(Boolean).join(' · '),
                uri: uri
            });
        });

        return rows.slice(0, 32);
    }

    function updateHomeRows(mainView) {
        var rows;
        var signature;
        if (!isSpotifyHome() || !mainView) return;
        rows = collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        if (window._sfNativeHomeSignature === signature) return;
        if (sendNativeUiData('home', rows)) window._sfNativeHomeSignature = signature;
    }

    function scheduleReadinessRetry() {
        if (window.__sfNativeUiReadyNotified || readyRetryTimer || readyRetries >= MAX_READY_RETRIES) return;
        readyRetries += 1;
        readyRetryTimer = window.setTimeout(function() {
            readyRetryTimer = null;
            runUpdate();
            scheduleReadinessRetry();
        }, 500);
    }

    function notifyNativeUiReady(mainView) {
        var bridge = window.AndBridge;
        var userWidget;
        if (!mainView || window.location.hostname !== 'open.spotify.com' || window.__sfNativeUiReadyNotified) return false;

        // Wait for Spotify's signed-in account control before covering the page,
        // preserving the existing login and authentication flow.
        userWidget = document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]');
        if (!userWidget || !bridge || typeof bridge.onNativeUiReady !== 'function') return false;

        try {
            bridge.onNativeUiReady();
            window.__sfNativeUiReadyNotified = true;
            window.__sfNativeUiReadyRetries = 0;
            if (readyRetryTimer) window.clearTimeout(readyRetryTimer);
            readyRetryTimer = null;
            return true;
        } catch (_) {
            return false;
        }
    }

    function runUpdate() {
        var mainView;
        if (window.location.hostname !== 'open.spotify.com') return;
        try {
            mainView = document.querySelector('#main-view');
            if (mainView) {
                notifyNativeUiReady(mainView);
                updateHomeRows(mainView);
            }
        } catch (_) {
            window.__sfNativeUiShellErrors += 1;
        }
        if (!window.__sfNativeUiReadyNotified) scheduleReadinessRetry();
    }

    function scheduleUpdate() {
        if (updateTimer) return;
        updateTimer = window.setTimeout(function() {
            updateTimer = null;
            runUpdate();
        }, 120);
    }

    window.__sfNativeUiRefresh = function() {
        runUpdate();
        return true;
    };

    window.__sfNativeRequestHome = function() {
        if (window.location.hostname !== 'open.spotify.com') return false;
        if (HOME_PATHS.indexOf(normalizedPath()) < 0) {
            window.location.assign('https://open.spotify.com/');
            return false;
        }
        window._sfNativeHomeSignature = null;
        runUpdate();
        return true;
    };

    window.__sfNativeOpenUri = function(value) {
        var raw = String(value || '').trim();
        var normalized;
        var target;
        var url;
        if (!raw) return false;
        normalized = nativeSpotifyUri(raw);
        target = normalized;

        if (/^spotify:/i.test(normalized)) {
            var parts = normalized.slice(normalized.indexOf(':') + 1).split(':');
            if (parts.length < 2) return false;
            target = 'https://open.spotify.com/' + parts[0] + '/' + parts[1];
        } else {
            try {
                url = new URL(normalized, window.location.href);
                if (url.hostname !== 'open.spotify.com') return false;
                target = url.href;
            } catch (_) {
                return false;
            }
        }

        window.location.assign(target);
        return true;
    };

    function install() {
        if (window._sfNativeUiShellListenersAttached) return;
        window._sfNativeUiShellListenersAttached = true;
        window.__sfNativeUiShellReady = true;

        window.addEventListener('popstate', scheduleUpdate);
        window.addEventListener('hashchange', scheduleUpdate);
        window.addEventListener('load', scheduleUpdate, { once: true });
        document.addEventListener('DOMContentLoaded', scheduleUpdate, { once: true });

        if (window.MutationObserver && document.documentElement) {
            observer = new MutationObserver(scheduleUpdate);
            observer.observe(document.documentElement, {
                childList: true,
                subtree: true,
                characterData: true
            });
        }

        runUpdate();
        if (document.readyState === 'loading') scheduleReadinessRetry();
    }

    try {
        install();
        window.__sfNativeUiShellCompleted = true;
    } catch (_) {
        window.__sfNativeUiShellErrors += 1;
        window.__sfNativeUiShellCompleted = false;
    }
})();
