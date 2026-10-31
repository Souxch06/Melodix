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
        root: 'none',
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
                    'article, [role="listitem"], [data-testid="card"], [data-encore-id="card"], [data-testid*="card-container"]')) {
                    return node;
                }
            } catch (_) {}
            node = node.parentElement;
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
        result.root = String(window.__sfNativeUiContentRootSelector || 'none').slice(0, 36);
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

        // The ordinary shell has already delivered real Home rows. Do not
        // replace that payload; this recovery path is only for missing/empty data.
        if (result.nativeDataSent && result.shellRows > 0) {
            result.mode = 'home-data-sent';
            window.__sfNativeHomeFallbackRows = result.shellRows;
            return result;
        }

        var anchors = document.querySelectorAll('a[href]');
        result.anchors = anchors ? Math.min(anchors.length, 500) : 0;
        var seen = Object.create(null);
        var rows = [];
        for (var i = 0; anchors && i < anchors.length && i < 500 && rows.length < 24; i += 1) {
            var anchor = anchors[i];
            if (!visible(anchor) || closest(anchor, 'nav, [role="navigation"], header, footer, aside, [data-testid*="sidebar"]')) continue;
            var resource = spotifyResource(anchor.href || (anchor.getAttribute && anchor.getAttribute('href')));
            if (!resource) continue;
            result.validLinks += 1;
            var uri = 'spotify:' + resource.type + ':' + resource.id;
            if (seen[uri]) continue;
            var card = cardFor(anchor);
            var lines = textOf(card);
            var titleNode = query(card, '[data-testid="card-title"], [data-encore-id="text"]');
            var imageNode = query(card, 'img');
            var title = cleanTitle(textOf(titleNode)[0] ||
                (anchor.getAttribute && anchor.getAttribute('aria-label')) ||
                (imageNode && imageNode.alt) || lines[0] || '');
            if (!title) continue;
            var subtitleNode = query(card, '[data-testid*="subtitle"]');
            var subtitle = textOf(subtitleNode)[0] || (lines.length > 1 ? lines[1] : '');
            var image = imageNode && (imageNode.currentSrc || imageNode.src ||
                (imageNode.getAttribute && imageNode.getAttribute('src')));
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
        result.mode = rows.length ? 'fallback' : 'empty';
        window.__sfNativeHomeFallbackRows = rows.length;
        return result;
    } catch (error) {
        result.mode = 'error';
        result.error = String(error && error.name || 'unknown').slice(0, 32);
        return result;
    }
})();
