/* Native Home recovery: read only visible, real Spotify resource cards. */
(function () {
    'use strict';

    var SUPPORTED_TYPES = ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook'];
    var imageHosts = ['scdn.co', 'spotifycdn.com'];
    var result = {
        mode: 'empty',
        hostOK: false,
        homeRoute: false,
        mainView: false,
        bridge: 'undefined',
        shellStarted: false,
        shellCompleted: false,
        nativeDataSent: false,
        shellRows: 0,
        root: false,
        anchors: 0,
        validLinks: 0,
        rows: []
    };

    function textOf(node) {
        return String(node && (node.innerText || node.textContent) || '')
            .replace(/\u00a0/g, ' ')
            .split(/\n+/)
            .map(function (line) { return line.replace(/\s+/g, ' ').trim(); })
            .filter(Boolean);
    }

    function visible(node) {
        try {
            if (!node || (typeof node.getClientRects === 'function' && !node.getClientRects().length)) return false;
            if (typeof window.getComputedStyle !== 'function') return true;
            var style = window.getComputedStyle(node);
            var opacity = Number(style.opacity);
            return style.display !== 'none' && style.visibility !== 'hidden' &&
                !(isFinite(opacity) && opacity <= 0);
        } catch (_) {
            return false;
        }
    }

    function safeImage(value) {
        try {
            var url = new URL(String(value || '').trim(), window.location.href);
            var host = url.hostname.toLowerCase();
            var allowed = imageHosts.some(function (suffix) {
                return host === suffix || host.endsWith('.' + suffix);
            });
            return url.protocol === 'https:' && allowed ? url.href : '';
        } catch (_) {
            return '';
        }
    }

    function spotifyResource(value) {
        try {
            var url = new URL(String(value || '').trim(), window.location.href);
            if (url.protocol !== 'https:' || url.hostname.toLowerCase() !== 'open.spotify.com' ||
                url.username || url.password || url.port) return null;
            var parts = url.pathname.split('/').filter(Boolean);
            if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
            if (parts.length < 2 || SUPPORTED_TYPES.indexOf(parts[0].toLowerCase()) < 0 ||
                !/^[A-Za-z0-9]{22}$/.test(parts[1])) return null;
            return { type: parts[0].toLowerCase(), id: parts[1] };
        } catch (_) {
            return null;
        }
    }

    function closest(element, selector) {
        try {
            return element && typeof element.closest === 'function' ? element.closest(selector) : null;
        } catch (_) {
            return null;
        }
    }

    function cardFor(anchor) {
        var node = anchor;
        var depth = 0;
        while (node && depth < 6) {
            try {
                if (typeof node.matches === 'function' && node.matches(
                    '[data-testid="card"], [data-encore-id="card"], [data-testid="tracklist-row"], ' +
                    '[data-testid*="card-container"], [role="listitem"], article')) return node;
            } catch (_) {}
            var parent = node.parentElement;
            if (!parent || parent === document.body || String(parent.tagName || '').toUpperCase() === 'SECTION') break;
            try {
                if (typeof parent.querySelector === 'function' && parent.querySelector('img')) return parent;
            } catch (_) {}
            node = parent;
            depth += 1;
        }
        return anchor;
    }

    function query(node, selector) {
        try {
            return node && typeof node.querySelector === 'function' ? node.querySelector(selector) : null;
        } catch (_) {
            return null;
        }
    }

    function cleanTitle(value) {
        var title = String(value || '').replace(/\s+/g, ' ').trim();
        title = title.replace(/^cover art for\s+/i, '');
        title = title.replace(/^go to (?:playlist|album|artist|track|show|episode),?\s*/i, '');
        title = title.replace(/^(?:playlist|album|artist|track|show|episode):\s*/i, '');
        if (/^(?:play|open|more options|playlist|album|artist|track|show|episode)$/i.test(title)) return '';
        return title.slice(0, 120);
    }

    function splitTitle(value) {
        var text = String(value || '').replace(/\s+/g, ' ').trim();
        var match = /^(.{2,70}?)[\s.,;:–—-]*(?:avec|with)\s+(.{3,})$/i.exec(text);
        return match ? { title: match[1].trim(), subtitle: match[2].trim() } : { title: text, subtitle: '' };
    }

    function sectionTitle(card) {
        var node = card;
        var depth = 0;
        while (node && depth < 8) {
            try {
                if (String(node.tagName || '').toUpperCase() === 'SECTION') {
                    var heading = query(node, 'h1, h2, h3');
                    return textOf(heading)[0] || '';
                }
            } catch (_) {}
            node = node.parentElement;
            depth += 1;
        }
        return '';
    }

    try {
        window.__sfNativeHomeFallbackRows = 0;
        var location = window.location || {};
        var hostname = String(location.hostname || '').toLowerCase();
        result.hostOK = hostname === 'open.spotify.com';
        result.bridge = typeof window.AndBridge;
        result.shellStarted = window.__sfNativeUiShellStarted === true;
        result.shellCompleted = window.__sfNativeUiShellCompleted === true;
        result.nativeDataSent = window.__sfNativeUiHomeDataSent === true;
        result.shellRows = Math.max(0, Number(window.__sfNativeUiHomeRowsCount || 0) || 0);
        // The selector is page structure, not diagnostic data. Export only its
        // presence so private/test-specific selector IDs never reach prefs.
        result.root = Boolean(window.__sfNativeUiContentRootSelector &&
            window.__sfNativeUiContentRootSelector !== 'none');
        result.mainView = !!(document && typeof document.querySelector === 'function' && document.querySelector('#main-view'));

        if (!result.hostOK) {
            result.mode = 'not-spotify';
            return result;
        }

        var pathParts = String(location.pathname || '/').split('/').filter(Boolean);
        if (pathParts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(pathParts[0])) pathParts.shift();
        var route = pathParts.length ? '/' + pathParts.join('/') : '/';
        result.homeRoute = route === '/' || route === '/home';
        if (!result.homeRoute) {
            result.mode = 'not-home';
            return result;
        }

        // A normal payload owns rendering when it already sent rows. Still
        // inspect the live DOM for diagnostic counts and navigation safety; the
        // Java callback will avoid dispatching a duplicate payload.
        var shellDataReady = result.nativeDataSent && result.shellRows > 0;
        var anchors = document.querySelectorAll('a[href], [role="link"][href]');
        result.anchors = anchors ? Math.min(anchors.length, 500) : 0;
        var seen = Object.create(null);
        var rows = [];
        var navigationSelector = 'nav, [role="navigation"], header, footer, aside, #global-nav-bar, ' +
            '#Desktop_LeftSidebar_Id, #sf-mobile-nav, #sf-mobile-navigation, #sf-melodix-home, ' +
            '[data-testid="now-playing-bar"], [data-testid="mobile-playback-bar"], ' +
            '[data-testid="now-playing-widget"], [data-testid="mini-player"], [data-testid*="sidebar"]';
        for (var i = 0; anchors && i < anchors.length && i < 500 && rows.length < 24; i += 1) {
            var anchor = anchors[i];
            if (!visible(anchor) || closest(anchor, navigationSelector)) continue;
            var resource = spotifyResource(anchor.href || (anchor.getAttribute && anchor.getAttribute('href')));
            if (!resource) continue;
            result.validLinks += 1;
            var uri = 'spotify:' + resource.type + ':' + resource.id;
            if (seen[uri]) continue;
            var card = cardFor(anchor);
            var lines = textOf(card);
            var titleNode = query(card, '[data-testid="card-title"], [data-encore-id="text"]');
            var imageNode = query(card, 'img');
            var titleCandidates = textOf(titleNode).concat([
                lines[0],
                card.getAttribute && card.getAttribute('aria-label'),
                anchor.getAttribute && anchor.getAttribute('aria-label'),
                imageNode && imageNode.alt
            ]);
            var title = '';
            var foldedSubtitle = '';
            for (var titleIndex = 0; titleIndex < titleCandidates.length && !title; titleIndex += 1) {
                var parsedTitle = splitTitle(titleCandidates[titleIndex]);
                title = cleanTitle(parsedTitle.title);
                if (title) foldedSubtitle = parsedTitle.subtitle;
            }
            if (!title) continue;
            var subtitleNode = query(card, '[data-testid="card-subtitle"], [data-encore-id="cardSubtitle"], [data-testid*="subtitle"]');
            var subtitle = textOf(subtitleNode)[0] || foldedSubtitle;
            if (!subtitle) {
                for (var lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
                    if (lines[lineIndex] !== title) { subtitle = lines[lineIndex]; break; }
                }
            }
            var image = imageNode && (imageNode.currentSrc || imageNode.src ||
                (imageNode.getAttribute && (imageNode.getAttribute('src') || imageNode.getAttribute('data-src'))));
            seen[uri] = true;
            rows.push({
                title: title,
                subtitle: String(subtitle || '').slice(0, 160),
                section: sectionTitle(card).slice(0, 100),
                image: safeImage(image),
                uri: uri
            });
        }

        result.rows = rows;
        result.mode = rows.length ? (shellDataReady ? 'home-data-sent' : 'fallback') : 'empty';
        window.__sfNativeHomeFallbackRows = rows.length || (shellDataReady ? result.shellRows : 0);
        return result;
    } catch (error) {
        result.mode = 'error';
        result.error = String(error && error.name || 'unknown').slice(0, 32);
        return result;
    }
})();
