(function() {
    'use strict';

    // Keep native activation independent from the remotely hotfixable bridge.
    if (window.__sfNativeUiShellStarted) return;
    window.__sfNativeUiShellStarted = true;
    window.__sfNativeUiShellErrors = 0;

    var HOME_PATHS = ['/', '/home'];
    var SUPPORTED_TYPES = ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook'];
    var MAX_READY_RETRIES = 60;
    var MAX_HOME_RETRIES = 40;
    var readyRetries = 0;
    var homeRetries = 0;
    var readyRetryTimer = null;
    var homeRetryTimer = null;
    var updateTimer = null;
    var observer = null;
    var lastHomeSignature = null;
    var initialPath = '';
    var initialScreen = 'home';
    var lastInitialDetailSignature = null;
    var lastInitialDetailTitle = null;
    var mediaLibWarmupRequested = false;

    function normalizedPath() {
        var path = window.location.pathname || '/';
        if (path.length > 1) path = path.replace(/\/+$/, '');
        return path || '/';
    }

    function spotifyRoutePath() {
        var parts = normalizedPath().split('/').filter(Boolean);
        // Spotify may prefix app routes with a locale, for example /intl-fr/.
        // Strip only that known locale segment; never inspect or retain IDs here.
        if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
        return parts.length ? '/' + parts.join('/') : '/';
    }

    function isSpotifyHome() {
        return window.location.hostname === 'open.spotify.com' && HOME_PATHS.indexOf(spotifyRoutePath()) >= 0;
    }

    function nativeScreenForPath() {
        var path = spotifyRoutePath();
        if (HOME_PATHS.indexOf(path) >= 0) return 'home';
        if (path === '/search' || path.indexOf('/search/') === 0) return 'search';
        if (path === '/collection' || path.indexOf('/collection/') === 0 || path.indexOf('/your-library') === 0) return 'library';
        var firstSegment = path.split('/')[1];
        if (SUPPORTED_TYPES.indexOf(firstSegment) >= 0 && path.split('/')[2]) return 'detail';
        return 'home';
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

    function initialSearchQuery() {
        var url;
        var pathParts;
        if (initialScreen !== 'search') return '';
        try {
            url = new URL(window.location.href);
            var query = url.searchParams.get('query') || url.searchParams.get('q') || '';
            if (query) return String(query).trim().slice(0, 100);
        } catch (_) {}
        pathParts = spotifyRoutePath().split('/').filter(Boolean);
        if (pathParts.length > 1 && pathParts[0] === 'search') {
            try {
                return decodeURIComponent(pathParts.slice(1).join('/')).trim().slice(0, 100);
            } catch (_) {
                return pathParts.slice(1).join('/').trim().slice(0, 100);
            }
        }
        return '';
    }

    function safeSpotifyImage(value) {
        var url;
        var hostname;
        try {
            url = new URL(String(value || '').trim(), window.location.href);
            hostname = url.hostname.toLowerCase();
            if (url.protocol !== 'https:') return '';
            if (
                hostname !== 'scdn.co' && !hostname.endsWith('.scdn.co') &&
                hostname !== 'spotifycdn.com' && !hostname.endsWith('.spotifycdn.com')
            ) return '';
            return url.href;
        } catch (_) {
            return '';
        }
    }

    function sendNativeUiData(screen, items) {
        var bridge = window.AndBridge;
        var rows;
        if (!bridge || typeof bridge.onNativeUiData !== 'function') return false;

        rows = (Array.isArray(items) ? items : []).map(function(item) {
            var title = String(item && (item.title || item.name || item.label) || '').trim();
            var subtitle = String(item && (item.subtitle || item.artist || item.description) || '').trim();
            var section = String(item && (item.section || item.sectionTitle) || '').trim();
            var rawUri = item && (item.uri || item.id || item.href) || '';
            var rawImage = item && (item.image || item.cover || item.artwork) || '';
            return {
                title: title,
                subtitle: subtitle,
                section: section,
                image: safeSpotifyImage(rawImage),
                uri: nativeSpotifyUri(rawUri)
            };
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

    function closest(element, selector) {
        try {
            return element && typeof element.closest === 'function' ? element.closest(selector) : null;
        } catch (_) {
            return null;
        }
    }

    function extractImgUrl(image) {
        if (!image) return '';
        var raw = image.currentSrc ||
            (typeof image.getAttribute === 'function' && (image.getAttribute('src') || image.getAttribute('data-src'))) ||
            image.src ||
            '';
        if (!raw && typeof image.getAttribute === 'function') {
            var srcset = image.getAttribute('srcset') || '';
            var firstEntry = String(srcset).split(',')[0] || '';
            raw = firstEntry.trim().split(/\s+/)[0] || '';
        }
        return raw ? safeSpotifyImage(raw) : '';
    }

    function findCardContainer(sourceAnchor, candidate, rootView) {
        var container = closest(sourceAnchor, '[data-testid="card"]') ||
            closest(sourceAnchor, '[data-encore-id="card"]') ||
            closest(sourceAnchor, '[data-testid="tracklist-row"]') ||
            closest(candidate, '[data-testid="card"]') ||
            closest(candidate, '[data-encore-id="card"]') ||
            closest(candidate, '[data-testid="tracklist-row"]');
        if (container) return container;

        var node = sourceAnchor || candidate;
        var depth = 0;
        while (node && node.parentElement && node.parentElement !== rootView && depth < 4) {
            var parent = node.parentElement;
            if (parent.tagName === 'SECTION') break;
            if (typeof parent.querySelector === 'function' && parent.querySelector('img')) {
                return parent;
            }
            node = parent;
            depth += 1;
        }
        return candidate || sourceAnchor;
    }

    function findImageUrl(element, sourceAnchor, rootView) {
        var image = sourceAnchor && sourceAnchor.querySelector && sourceAnchor.querySelector('img');
        var url = extractImgUrl(image);
        var styledNode;
        var background;
        var match;
        var node;
        var depth;

        if (url) return url;
        if (element && element.querySelector) {
            url = extractImgUrl(element.querySelector('img'));
            if (url) return url;
        }

        node = sourceAnchor || element;
        depth = 0;
        while (node && node.parentElement && node.parentElement !== rootView && depth < 4) {
            node = node.parentElement;
            if (node.tagName === 'SECTION') break;
            if (typeof node.querySelector === 'function') {
                url = extractImgUrl(node.querySelector('img'));
                if (url) return url;
            }
            depth += 1;
        }

        styledNode = element && element.querySelector
            ? element.querySelector('[style*="background-image"]')
            : null;
        if (!styledNode) return '';
        background = styledNode.style && styledNode.style.backgroundImage || '';
        if (!background && typeof window.getComputedStyle === 'function') {
            try {
                background = window.getComputedStyle(styledNode).backgroundImage || '';
            } catch (_) {}
        }
        match = /url\((?:['"])?(.*?)(?:['"])?\)/i.exec(background);
        return match ? safeSpotifyImage(match[1]) : '';
    }

    function collectHomeRows(mainView) {
        var cardNodes = Array.prototype.slice.call(mainView.querySelectorAll('[data-testid="card"]'));
        var anchors = Array.prototype.slice.call(mainView.querySelectorAll('a[href]'));
        // Keep anchors as a fallback even when Spotify renders non-link cards or
        // card anchors without an <img>. A card and its nested anchor are de-duped
        // by their Spotify URI below.
        var candidates = cardNodes.concat(anchors);
        var seen = new Set();
        var rows = [];

        candidates.forEach(function(candidate) {
            var sourceAnchor = candidate.matches && candidate.matches('a[href]')
                ? candidate
                : candidate.querySelector && candidate.querySelector('a[href]');
            var href = sourceAnchor && (sourceAnchor.href || sourceAnchor.getAttribute('href'));
            var uri = spotifyResourceUri(href);
            var card = findCardContainer(sourceAnchor, candidate, mainView);
            var lines;
            var title;
            var subtitle;
            var imageUrl;
            var section;
            var headingNode;
            var headings;
            var sectionTitle;

            if (!sourceAnchor || !uri || seen.has(uri)) return;
            lines = textLines(card);
            imageUrl = findImageUrl(card, sourceAnchor, mainView);
            title = String(
                card.getAttribute && card.getAttribute('aria-label') ||
                sourceAnchor.getAttribute && sourceAnchor.getAttribute('aria-label') ||
                lines[0] ||
                ''
            ).replace(/\s+/g, ' ').trim().slice(0, 100);
            if (!title && sourceAnchor.querySelector) {
                var image = sourceAnchor.querySelector('img');
                title = String(image && image.getAttribute('alt') || '').replace(/\s+/g, ' ').trim().slice(0, 100);
            }
            if (!title) return;
            seen.add(uri);

            subtitle = lines.find(function(line) { return line !== title; }) || '';
            section = closest(card, 'section') || closest(candidate, 'section') || mainView;
            headings = section === mainView || !section.querySelectorAll
                ? []
                : Array.prototype.slice.call(section.querySelectorAll('h1, h2, h3, [data-testid="shelf-title"]'));
            headingNode = headings.find(function(node) {
                return !closest(node, '[data-testid="card"]');
            });
            sectionTitle = String(headingNode && headingNode.textContent || '')
                .replace(/\s+/g, ' ').trim().slice(0, 80);

            rows.push({
                title: title,
                subtitle: subtitle.slice(0, 120),
                section: sectionTitle,
                image: imageUrl,
                uri: uri
            });
        });

        return rows.slice(0, 32);
    }

    function supplementHomeRowsWithLibrary(rows) {
        var library = window.mediaLib;
        var groups = [
            ['playlists', 'Your playlists'],
            ['albums', 'Saved albums'],
            ['artists', 'Followed artists'],
            ['podcasts', 'Podcasts']
        ];
        var seen = new Set(rows.map(function(row) { return row.uri; }).filter(Boolean));
        var result = rows.slice();
        var sidebar;

        if (!library && !mediaLibWarmupRequested && typeof window.checkMediaLib === 'function') {
            mediaLibWarmupRequested = true;
            try {
                window.checkMediaLib();
            } catch (_) {}
        }

        if (library && result.length < 8) {
            groups.forEach(function(group) {
                var items = Array.isArray(library[group[0]]) ? library[group[0]] : [];
                items.forEach(function(item) {
                    var uri = nativeSpotifyUri(item && (item.uri || item.id || item.href));
                    var title = String(item && (item.name || item.title) || '').trim();
                    var artistList = item && Array.isArray(item.artists)
                        ? item.artists.filter(Boolean).join(', ')
                        : '';
                    var subtitle = String(artistList || item && (item.owner || item.description || item.type) || '').trim();
                    if (!uri || !title || seen.has(uri) || result.length >= 8) return;
                    seen.add(uri);
                    result.push({
                        title: title,
                        subtitle: subtitle,
                        section: group[1],
                        image: safeSpotifyImage(item.image || item.cover || item.artwork || ''),
                        uri: uri
                    });
                });
            });
        }

        if (result.length < 8 && document && typeof document.querySelector === 'function') {
            sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
            if (sidebar && typeof sidebar.querySelectorAll === 'function') {
                collectHomeRows(sidebar).forEach(function(row) {
                    if (!row.uri || !row.title || seen.has(row.uri) || result.length >= 8) return;
                    seen.add(row.uri);
                    result.push({
                        title: row.title,
                        subtitle: row.subtitle,
                        section: row.section || 'Your library',
                        image: row.image,
                        uri: row.uri
                    });
                });
            }
        }
        return result;
    }

    function clearHomeRetry() {
        if (homeRetryTimer) window.clearTimeout(homeRetryTimer);
        homeRetryTimer = null;
        homeRetries = 0;
    }

    function scheduleHomeRetry() {
        if (homeRetryTimer || homeRetries >= MAX_HOME_RETRIES) return;
        homeRetries += 1;
        homeRetryTimer = window.setTimeout(function() {
            homeRetryTimer = null;
            if (isSpotifyHome()) runUpdate();
        }, 500);
    }

    function updateHomeRows(mainView) {
        var rows;
        var signature;
        var homeRoute = window.location.hostname === 'open.spotify.com' && isSpotifyHome();
        window.__sfNativeUiHomeRouteRecognized = homeRoute;
        if (!homeRoute || !mainView) {
            clearHomeRetry();
            return;
        }

        rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView));
        signature = JSON.stringify(rows);
        window.__sfNativeUiHomeRowsCount = rows.length;
        if (lastHomeSignature !== signature && sendNativeUiData('home', rows)) {
            // This state is intentionally closure-local. Older hotfixable bridge
            // code used the same window property and could suppress the first
            // native Home update with a stale/empty signature.
            lastHomeSignature = signature;
            window.__sfNativeUiHomeDataSent = true;
        }

        if (rows.length > 0 && rows.some(function(row) { return Boolean(row && row.image); })) clearHomeRetry();
        else scheduleHomeRetry();
    }

    function updateInitialDetailRows(mainView) {
        var titleNode;
        var title;
        var rows;
        var signature;
        var bridge;
        if (initialScreen !== 'detail' || spotifyRoutePath() !== initialPath || !mainView) return;

        titleNode = mainView.querySelector
            ? mainView.querySelector('h1, [data-testid="entityTitle"], [data-testid="entity-title"]')
            : null;
        title = String(titleNode && (titleNode.innerText || titleNode.textContent) || '')
            .replace(/\s+/g, ' ').trim().slice(0, 100);
        bridge = window.AndBridge;
        if (title && title !== lastInitialDetailTitle && bridge && typeof bridge.onNativeUiData === 'function') {
            try {
                bridge.onNativeUiData('screen-title', title);
                lastInitialDetailTitle = title;
            } catch (_) {}
        }

        rows = collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiDetailRowsCount = rows.length;
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', rows)) {
            lastInitialDetailSignature = signature;
        }
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
        var searchQuery;
        if (!mainView || window.location.hostname !== 'open.spotify.com' || window.__sfNativeUiReadyNotified) return false;

        // Do not cover Spotify's page until its signed-in account control is present.
        userWidget = document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]');
        if (!userWidget || !bridge || typeof bridge.onNativeUiReady !== 'function') return false;

        if (typeof bridge.onNativeUiRoute === 'function') {
            try {
                bridge.onNativeUiRoute(initialScreen);
            } catch (_) {}
        }

        try {
            bridge.onNativeUiReady();
            window.__sfNativeUiReadyNotified = true;
            window.__sfNativeUiReadyRetries = 0;
            if (readyRetryTimer) window.clearTimeout(readyRetryTimer);
            readyRetryTimer = null;
        } catch (_) {
            return false;
        }

        searchQuery = initialSearchQuery();
        if (searchQuery && typeof bridge.onNativeUiData === 'function') {
            try {
                bridge.onNativeUiData('initial-search', searchQuery);
            } catch (_) {}
        }
        return true;
    }

    function runUpdate() {
        var mainView;
        if (window.location.hostname !== 'open.spotify.com') return;
        try {
            mainView = document.querySelector('#main-view');
            if (mainView) {
                notifyNativeUiReady(mainView);
                updateHomeRows(mainView);
                updateInitialDetailRows(mainView);
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
        if (!isSpotifyHome()) {
            window.location.assign('https://open.spotify.com/');
            return false;
        }
        lastHomeSignature = null;
        homeRetries = 0;
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
        initialPath = spotifyRoutePath();
        initialScreen = nativeScreenForPath();
        window.__sfNativeUiRoute = initialScreen;

        window.addEventListener('popstate', scheduleUpdate);
        window.addEventListener('hashchange', scheduleUpdate);
        window.addEventListener('load', scheduleUpdate, { once: true });
        document.addEventListener('DOMContentLoaded', scheduleUpdate, { once: true });

        if (window.MutationObserver && document.documentElement) {
            observer = new window.MutationObserver(scheduleUpdate);
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
