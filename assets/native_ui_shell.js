(function() {
    'use strict';

    // Keep native activation independent from the remotely hotfixable bridge.
    if (window.__sfNativeUiShellStarted) return;
    window.__sfNativeUiShellStarted = true;
    window.__sfNativeUiShellErrors = 0;

    // Shell execution probe (read-only): journalize begin/end through the
    // existing AndBridge.logDiagEvent channel so the native journal proves
    // whether this file executed and reached the end of its initialization.
    try {
        if (window.AndBridge && typeof window.AndBridge.logDiagEvent === 'function') {
            window.AndBridge.logDiagEvent('js-shell begin');
        }
    } catch (_) {}

    var HOME_PATHS = ['/', '/home'];
    var SUPPORTED_TYPES = ['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook'];
    var MAX_READY_RETRIES = 60;
    var MAX_HOME_RETRIES = 40;
    var readyRetries = 0;
    var homeRetries = 0;
    var readyRetryTimer = null;
    var homeRetryTimer = null;
    var detailRetryTimer = null;
    var detailRetries = 0;
    var updateTimer = null;
    var observer = null;
    var lastHomeSignature = null;
    var pendingHomeCount = 0;
    var pendingHomeSignature = null;
    var initialPath = '';
    var initialScreen = 'home';
    var lastInitialDetailSignature = null;
    var lastInitialDetailTitle = null;
    var lastDetailPath = '';
    var lastSearchPath = '';
    var lastSearchSignature = null;
    var lastLibraryPath = '';
    var lastLibrarySignature = null;
    var mediaLibWarmupRequested = 0;
    var mediaLibWarmupCount = 0;
    var lastMediaActiveAt = 0;
    var sessionLoggedOut = false;
    var loggedOutProfileName = '';
    var loggedOutProfileAvatar = '';
    var sawSignedOutDom = false;

    function isSessionBlockedByLogout() {
        if (!sessionLoggedOut) return false;
        try {
            var w = document && document.querySelector
                ? document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]')
                : null;
            if (!w) {
                sawSignedOutDom = true;
                return true;
            }
            var curName = cleanText(w.getAttribute && (w.getAttribute('aria-label') || w.getAttribute('title')) || '');
            var curImg = typeof w.querySelector === 'function' ? w.querySelector('img') : null;
            var curAvatar = curImg ? extractImgUrl(curImg) : '';
            if (sawSignedOutDom || (curName && curName !== loggedOutProfileName) || (curAvatar && curAvatar !== loggedOutProfileAvatar)) {
                sessionLoggedOut = false;
                loggedOutProfileName = '';
                loggedOutProfileAvatar = '';
                sawSignedOutDom = false;
                return false;
            }
        } catch (_) {}
        return true;
    }

    function sanitizeDiagnostic(value) {
        var text = String(value && value.message || value || '');
        text = text.replace(/Set-Cookie:\s*[^;\r\n]+/gi, 'Set-Cookie:[redacted]');
        text = text.replace(/Cookie:\s*[^\r\n]+/gi, 'Cookie:[redacted]');
        text = text.replace(/Authorization:\s+\S+(?:\s+\S+)?/gi, 'Authorization:[redacted]');
        text = text.replace(/Bearer\s+\S+/gi, 'Bearer [redacted]');
        text = text.replace(/\b(?:access_token|refresh_token|id_token|client_secret|code|sp_dc|sp_key|sessionid)=[^&\s;]+/gi, function(match) {
            return match.slice(0, match.indexOf('=') + 1) + '[redacted]';
        });
        text = text.replace(/spotify:user:[^\s,;]+/gi, 'spotify:user:[redacted]');
        text = text.replace(/[A-Za-z0-9_-]{8,}\.[A-Za-z0-9._-]{8,}\.[A-Za-z0-9._-]{8,}/g, '[redacted-jwt]');
        return text.slice(0, 160);
    }

    function recordShellError(error, op) {
        window.__sfNativeUiShellErrors += 1;
        window.__sfNativeUiShellLastErrorOp = String(op || '');
        window.__sfNativeUiShellLastError = (window.__sfNativeUiShellLastErrorOp
            ? window.__sfNativeUiShellLastErrorOp + ': '
            : '') + sanitizeDiagnostic(error);
    }

    function clearShellError(op) {
        if (op && window.__sfNativeUiShellLastErrorOp && window.__sfNativeUiShellLastErrorOp !== op) return;
        window.__sfNativeUiShellLastError = null;
        window.__sfNativeUiShellLastErrorOp = '';
    }

    function normalizedPath() {
        var path = window.location.pathname || '/';
        if (path.length > 1) path = path.replace(/\/+$/, '');
        return path || '/';
    }

    function cleanText(value) {
        if (value === null || value === undefined) return '';
        return String(value).replace(/\s+/g, ' ').trim();
    }

    function spotifyRoutePath() {
        var parts = normalizedPath().split('/').filter(Boolean);
        // Spotify may prefix app routes with a locale, for example /intl-fr/.
        // Strip only that known locale segment; never inspect or retain IDs here.
        if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
        return parts.length ? '/' + parts.join('/') : '/';
    }

    function isSpotifyHome() {
        var path = spotifyRoutePath();
        return window.location.hostname === 'open.spotify.com' && (
            HOME_PATHS.indexOf(path) >= 0 || path === '' || path === '/intl'
        );
    }

    function homeScrapeRoot() {
        if (!document || typeof document.querySelector !== 'function') return null;
        return document.querySelector('#main-view') ||
            document.querySelector('.main-view-container') ||
            document.querySelector('[data-testid="home-page"]') ||
            document.querySelector('#sf-melodix-home') ||
            document.querySelector('main') ||
            document.body;
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
        if (isSessionBlockedByLogout() && screen !== 'settings') return false;
        if (!bridge || typeof bridge.onNativeUiData !== 'function') return false;

        rows = (Array.isArray(items) ? items : []).map(function(item) {
            var title = String(item && (item.title || item.name || item.label) || '').trim();
            var subtitle = String(item && (item.subtitle || item.artist || item.description) || '').trim();
            var section = String(item && (item.section || item.sectionTitle) || '').trim();
            var rawUri = item && (item.uri || item.id || item.href) || '';
            var image = String(item && (item.image || item.cover || item.artwork) || '').trim();
            var row = {
                title: title,
                subtitle: subtitle,
                section: section,
                uri: nativeSpotifyUri(rawUri)
            };
            if (image) {
                row.image = image;
            }
            if (item && typeof item.settingValue === 'string' && item.settingValue) {
                row.settingValue = item.settingValue;
            }
            // Status rows keep their retry target and kind: the native row
            // factory turns actionUri into a real tap (spotify:retry:media:…).
            if (item && item.actionUri) {
                row.actionUri = String(item.actionUri);
            }
            if (item && typeof item.kind === 'string' && item.kind) {
                row.kind = item.kind;
            }
            return row;
        }).filter(function(item) {
            return item.title || item.uri;
        });

        // Bridge payloads above 256 KB are dropped silently by dispatchNativeUi:
        // cap the rows here and say so instead of losing the whole screen.
        var cappedRows = 0;
        while (rows.length > 1 && JSON.stringify(rows).length > 230000) {
            rows.pop();
            cappedRows += 1;
        }
        if (cappedRows > 0) {
            rows.push({
                title: '… ' + cappedRows + ' éléments supplémentaires non affichés',
                subtitle: 'Limite d’affichage atteinte',
                section: rows.length ? rows[rows.length - 1].section : ''
            });
        }

        try {
            var payload = JSON.stringify(rows);
            var lastSection = '';
            var lines = [];
            var playlistCount = 0;
            rows.forEach(function(row) {
                if (row.section && row.section !== lastSection) {
                    lastSection = row.section;
                    if (lines.length) lines.push('');
                    lines.push(row.section);
                }
                if (row.uri && row.uri.indexOf(':playlist:') >= 0) {
                    playlistCount += 1;
                }
                if (row.title) {
                    lines.push(row.subtitle ? (row.title + ' — ' + row.subtitle) : row.title);
                }
            });
            if (screen === 'home') {
                window.__sfNativeHomeRowCount = rows.length;
                window.__sfNativeHomePlaylistCount = playlistCount;
                window.__sfNativeHomeRejectedCount = (Array.isArray(items) ? items.length : 0) - rows.length;
                window.__sfNativeHomeRowsJson = payload;
            }
            bridge.onNativeUiData(screen, payload);
            if (typeof window.__sfLibDiagRecord === 'function'
                && (screen === 'home' || String(screen).indexOf('media:') === 0)) {
                // Temporary pipeline diagnostic: record how many rows (and how
                // many real playlists) actually reached the native shell.
                window.__sfLibDiagRecord('deliver', true, screen + ' rows=' + rows.length + ' playlists=' + playlistCount);
                if (typeof window.__sfLibDiagUpdate === 'function') {
                    var deliveryPatch = { seen: true, afterReady: window.__sfMediaLibState === 'ready' };
                    if (screen === 'home') {
                        deliveryPatch.homeRows = rows.length;
                        deliveryPatch.homePlaylistRows = playlistCount;
                    } else {
                        deliveryPatch.mediaRows = rows.length;
                        deliveryPatch.mediaPlaylistRows = playlistCount;
                    }
                    window.__sfLibDiagUpdate({ delivered: deliveryPatch });
                }
            }
            if (screen === 'home' && typeof bridge.onNativeHomeRows === 'function') {
                window.AndBridge.onNativeHomeRows(payload);
            }
            if (lines.length) {
                var listText = lines.join('\n');
                window.__sfNativeHomeListText = listText;
                bridge.onNativeUiData('list-text', listText);
                if (typeof bridge.onNativeListText === 'function') {
                    window.AndBridge.onNativeListText(listText);
                }
            }
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

    // Spotify folds a card title and its description into one string in
    // aria-label and in some shelves' innerText: "Radio ecstasyAvec
    // SUICIDAL-IDOL, Rebzyyx…". Rows must show the real title on one line and
    // the description underneath, so split on the French/English connector.
    function splitCardTitle(value) {
        var text = String(value || '').replace(/\s+/g, ' ').trim();
        var match;
        if (!text) return { title: '', subtitle: '' };
        match = /^(.{2,70}?)[\s.,;:–—-]*(?:avec|with)\s+(.{3,})$/i.exec(text);
        if (match) {
            return { title: match[1].trim(), subtitle: match[2].trim() };
        }
        return { title: text, subtitle: '' };
    }

    function firstCardText(card, selector) {
        var node = null;
        if (!card || typeof card.querySelector !== 'function') return '';
        try {
            node = card.querySelector(selector);
        } catch (_) {
            return '';
        }
        return String(node && (node.textContent || node.innerText) || '').replace(/\s+/g, ' ').trim();
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
        var root = mainView && mainView.querySelectorAll ? mainView : homeScrapeRoot();
        if (!root || typeof root.querySelectorAll !== 'function') return [];
        var cardNodes = Array.prototype.slice.call(root.querySelectorAll('[data-testid="card"]'));
        if (!cardNodes.length && document && typeof document.querySelectorAll === 'function') {
            cardNodes = Array.prototype.slice.call(document.querySelectorAll('[data-testid="card"]'));
        }
        var anchors = Array.prototype.slice.call(root.querySelectorAll('a[href]'));
        if (!anchors.length && document && typeof document.querySelectorAll === 'function') {
            anchors = Array.prototype.slice.call(document.querySelectorAll('a[href*="/playlist/"], a[href*="/album/"], a[href*="/collection"]'));
        }
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
            var heading;
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
            // Prefer the visible first line (the real title) and only fall back
            // to aria-label, which glues the title to its description.
            heading = splitCardTitle(
                (lines[0] && lines[0].length <= 90 ? lines[0] : '') ||
                (card.getAttribute && card.getAttribute('aria-label')) ||
                (sourceAnchor.getAttribute && sourceAnchor.getAttribute('aria-label')) ||
                lines[0] ||
                ''
            );
            title = heading.title.slice(0, 100);
            if (!title && sourceAnchor.querySelector) {
                var image = sourceAnchor.querySelector('img');
                title = String(image && image.getAttribute('alt') || '').replace(/\s+/g, ' ').trim().slice(0, 100);
            }
            if (!title) return;
            seen.add(uri);

            subtitle = heading.subtitle ||
                firstCardText(card, '[data-testid="card-subtitle"], [data-encore-id="cardSubtitle"]') ||
                lines.find(function(line) { return line !== title && line !== lines[0]; }) ||
                '';
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

        return rows.slice(0, 120);
    }

    function supplementHomeRowsWithLibrary(rows) {
        var library = window.mediaLib;
        var groups = [
            ['playlists', 'Vos playlists'],
            ['albums', 'Albums enregistrés'],
            ['artists', 'Artistes suivis'],
            ['podcasts', 'Podcasts']
        ];
        var seen = new Set();
        var userRows = [];
        var spotifyRows = [];
        var userOverflow = 0;
        var diagIgnored = 0;

        function looksPublicPlaylist(row) {
            var title = String(row && row.title || '');
            var subtitle = String(row && row.subtitle || '');
            var uri = String(row && row.uri || '');
            if (/collection/i.test(uri)) return false;
            if (/daily mix|discover weekly|release radar|\bradio\b|mix \d|on repeat|repeat rewind|time capsule|blend/i.test(title)) return true;
            if (/et bien d['’]autres artistes|and more artists/i.test(subtitle)) return true;
            return false;
        }

        if (!library && typeof window.checkMediaLib === 'function') {
            var warmupNow = Date.now();
            // First wave: 8 quick attempts. Then one slow recovery attempt
            // every 15 s so a transient failure can still heal, while every
            // individual fetch stays bounded (libFetch timeout) and the
            // visible state always reaches a terminal row.
            if ((mediaLibWarmupCount < 8 || (warmupNow - mediaLibWarmupRequested) > 15000) && (!mediaLibWarmupRequested || (warmupNow - mediaLibWarmupRequested) > 3000)) {
                mediaLibWarmupRequested = warmupNow;
                mediaLibWarmupCount += 1;
                try {
                    window.checkMediaLib();
                } catch (_) {}
            }
        }

        var feedUris = {};
        (rows || []).forEach(function(row) {
            if (row && row.uri) feedUris[row.uri] = true;
        });

        if (library) {
            groups.forEach(function(group) {
                var items = Array.isArray(library[group[0]]) ? library[group[0]] : [];
                items.forEach(function(item) {
                    var uri = nativeSpotifyUri(item && (item.uri || item.id || item.href));
                    var title = String(item && (item.name || item.title) || '').trim();
                    var artistList = item && Array.isArray(item.artists)
                        ? item.artists.filter(Boolean).join(', ')
                        : '';
                    var subtitle = String(artistList || item && (item.owner || item.description || item.type) || '').trim();
                    var img = safeSpotifyImage(item && (item.image || item.cover || item.artwork) || '');
                    var publicItem = looksPublicPlaylist({ title: title, subtitle: subtitle, uri: uri });
                    var bucket;
                    if (!img && (title === 'Liked Songs' || /collection/i.test(uri))) {
                        img = 'https://misc.scdn.co/liked-songs/liked-songs-640.png';
                    }
                    if (!uri || !title || seen.has(uri)) { diagIgnored += 1; return; }
                    if (userRows.length >= 40) {
                        userOverflow += 1;
                        return;
                    }
                    // Official mixes that also sit on Home are shown once under Playlists Spotify.
                    if (publicItem && feedUris[uri]) { diagIgnored += 1; return; }
                    seen.add(uri);
                    bucket = publicItem ? spotifyRows : userRows;
                    bucket.push({
                        title: title,
                        subtitle: subtitle,
                        section: publicItem ? 'Playlists Spotify' : group[1],
                        image: img,
                        uri: uri
                    });
                });
            });
        }

        var mineUris = {};
        if (library && Array.isArray(library.playlists)) {
            library.playlists.forEach(function(item) {
                var uri = nativeSpotifyUri(item && (item.uri || item.id || item.href));
                var title = String(item && (item.name || item.title) || '').trim();
                if (uri && !looksPublicPlaylist({ title: title, uri: uri })) mineUris[uri] = true;
            });
        }

        rows.forEach(function(row) {
            if (!row || !row.uri || !row.title || seen.has(row.uri)) { diagIgnored += 1; return; }
            seen.add(row.uri);
            var section;
            if (/collection/i.test(row.uri) || (mineUris[row.uri] && !looksPublicPlaylist(row))) {
                section = 'Vos playlists';
            } else if (/:playlist:/i.test(row.uri) || looksPublicPlaylist(row)) {
                section = 'Playlists Spotify';
            } else {
                section = row.section || '';
            }
            spotifyRows.push({
                title: row.title,
                subtitle: row.subtitle,
                section: section,
                image: row.image,
                uri: row.uri
            });
        });

        if (userOverflow > 0) {
            // Never pretend the feed holds the whole account: say how many
            // playlists did not fit and where to find them, without a URI.
            userRows.push({
                title: '… et ' + userOverflow + ' playlists de plus',
                subtitle: 'Ouvrez Votre bibliothèque pour tout voir',
                section: 'Vos playlists'
            });
        }
        try {
            if (typeof window.__sfLibDiagUpdate === 'function') {
                window.__sfLibDiagUpdate({ delivered: { ignored: userOverflow + diagIgnored } });
            }
        } catch (_) {}
        return userRows.concat(spotifyRows);
    }

    function clearHomeRetry() {
        if (homeRetryTimer) window.clearTimeout(homeRetryTimer);
        homeRetryTimer = null;
        homeRetries = 0;
    }

    function userPlaylistLibraryState() {
        var lib = window.mediaLib;
        if (lib && Array.isArray(lib.playlists)) {
            return lib.playlists.length ? 'ready' : 'empty';
        }
        // No session at all after a real token check: say so instead of
        // pretending the library is still loading.
        if (window.__sfAuthMissing) return 'login';
        // The bridge publishes the real fetch outcome: pending, empty and error
        // must never be confused — only "pending" may show a loading state.
        var state = window.__sfMediaLibState;
        if (state === 'ready' || state === 'empty' || state === 'error') return state;
        return 'pending';
    }

    function homeHasUserPlaylists(rows) {
        var i;
        for (i = 0; i < (rows || []).length; i += 1) {
            if (rows[i] && rows[i].section === 'Vos playlists' && rows[i].uri) return true;
        }
        return false;
    }

    function homeStatusRows(kind) {
        if (kind === 'loading') {
            return [{ title: 'Chargement des playlists…', section: 'Accueil' }];
        }
        if (kind === 'login') {
            return [{
                title: 'Connecte-toi à Spotify',
                subtitle: 'Aucune session détectée — touche pour ouvrir la connexion',
                section: 'Accueil',
                actionUri: 'spotify:lib:login',
                kind: 'login'
            }];
        }
        if (kind === 'empty') {
            return [{
                title: 'Aucune playlist dans ce compte',
                subtitle: 'Revenez à Accueil après en avoir créé une sur Spotify',
                section: 'Accueil'
            }];
        }
        if (kind === 'error') {
            // Honest classification: distinguish an access denial, a network
            // failure, an unexpected response and a rendering gap instead of a
            // generic message. Falls back to the retry hint when the temporary
            // diagnostic is unavailable.
            var detail = 'Appuyez sur Accueil pour réessayer';
            try {
                if (typeof window.__sfGetLibDiagReport === 'function') {
                    var report = window.__sfGetLibDiagReport();
                    var kindMap = {
                        'token-missing': 'Jeton d’accès indisponible',
                        'network': 'Erreur réseau pendant la récupération',
                        'access-denied': 'Accès refusé par Spotify (compte ou droits)',
                        'no-session': 'Session Spotify non reconnue',
                        'graphql-error': 'Requête bibliothèque rejetée par Spotify',
                        'http-error': 'Réponse en erreur du serveur Spotify',
                        'shape-mismatch': 'Réponse Spotify inattendue',
                        'fetch-error': 'Récupération impossible',
                        'parse-gap': 'Réponse reçue mais inexploitable',
                        'render-gap': 'Playlists chargées mais non affichées'
                    };
                    if (report && kindMap[report.failureKind]) {
                        detail = kindMap[report.failureKind] + ' — appuyez sur Accueil pour réessayer';
                    }
                }
            } catch (_) {}
            return [{
                title: 'Impossible de charger les playlists',
                subtitle: detail,
                section: 'Accueil'
            }];
        }
        return [];
    }

    function scheduleHomeRetry(delay) {
        if (homeRetryTimer || homeRetries >= MAX_HOME_RETRIES) return;
        homeRetries += 1;
        homeRetryTimer = window.setTimeout(function() {
            homeRetryTimer = null;
            if (isSpotifyHome()) runUpdate();
        }, delay || 100);
    }

    function updateHomeRows(mainView) {
        var rows;
        var signature;
        var libraryState;
        var hasUser;
        var hasPublic = false;
        var i;
        var homeRoute = window.location.hostname === 'open.spotify.com' && isSpotifyHome();
        window.__sfNativeUiHomeRouteRecognized = homeRoute;
        if (!homeRoute) {
            clearHomeRetry();
            return;
        }

        try {
            rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView || homeScrapeRoot()));
        } catch (error) {
            window.__sfNativeUiHomeError = true;
            window.__sfNativeUiHomeErrorMessage = sanitizeDiagnostic(error);
            recordShellError(error, 'home');
            if (!lastHomeSignature) sendNativeUiData('home', homeStatusRows('error'));
            scheduleHomeRetry(400);
            return;
        }

        libraryState = userPlaylistLibraryState();
        hasUser = homeHasUserPlaylists(rows);
        signature = JSON.stringify(rows);
        window.__sfNativeUiHomeRowsCount = rows.length;
        window.__sfNativeUiHomeLibraryState = libraryState;
        for (i = 0; i < rows.length; i += 1) {
            if (rows[i] && rows[i].section === 'Playlists Spotify') hasPublic = true;
        }

        if (!rows.length) {
            if (libraryState === 'empty') {
                if (lastHomeSignature !== 'empty') {
                    sendNativeUiData('home', homeStatusRows('empty'));
                    lastHomeSignature = 'empty';
                }
                clearHomeRetry();
                return;
            }
            if (libraryState === 'error') {
                // Replace the loading state with an explicit error and stop:
                // the bridge retries the fetch itself and notifies us if it
                // later succeeds. "Accueil" is the manual retry action.
                if (lastHomeSignature !== 'error') {
                    sendNativeUiData('home', homeStatusRows('error'));
                    lastHomeSignature = 'error';
                }
                clearHomeRetry();
                return;
            }
            if (homeRetries >= MAX_HOME_RETRIES) {
                // The bounded retry budget is spent: never freeze a loading
                // row forever. The terminal state is an honest error row
                // (Accueil is the manual retry action) and a late mediaLib
                // success repaints through __sfNativeUiMediaLibUpdated.
                if (lastHomeSignature !== 'error') {
                    sendNativeUiData('home', homeStatusRows('error'));
                    lastHomeSignature = 'error';
                }
                return;
            }
            if (lastHomeSignature !== 'loading') {
                sendNativeUiData('home', homeStatusRows('loading'));
                lastHomeSignature = 'loading';
            }
            scheduleHomeRetry(libraryState === 'pending' ? 400 : 100);
            return;
        }

        if (lastHomeSignature === signature) {
            if (!hasUser && libraryState === 'pending') scheduleHomeRetry(400);
            return;
        }
        if (sendNativeUiData('home', rows)) {
            lastHomeSignature = signature;
            window.__sfNativeUiHomeRowsSent = rows.length;
            window.__sfNativeUiHomeHadPublic = hasPublic;
            window.__sfNativeUiHomeDataSent = true;
            window.__sfNativeUiHomeError = false;
            window.__sfNativeUiHomeErrorMessage = null;
            clearShellError('home');
            if (!hasUser && libraryState === 'pending') {
                scheduleHomeRetry(400);
            } else {
                clearHomeRetry();
            }
        } else {
            scheduleHomeRetry();
        }
    }

    function currentSearchQuery() {
        var parts = spotifyRoutePath().split('/').filter(Boolean);
        var url;
        if (parts.length > 1 && parts[0] === 'search') {
            try {
                return decodeURIComponent(parts.slice(1).join('/')).trim().slice(0, 100);
            } catch (_) {
                return parts.slice(1).join('/').trim().slice(0, 100);
            }
        }
        try {
            url = new URL(window.location.href);
            return String(url.searchParams.get('query') || url.searchParams.get('q') || '').trim().slice(0, 100);
        } catch (_) {
            return '';
        }
    }

    // Search results also come from the bridge normally. When it is absent the
    // shell reads the real Spotify search page, so tapping the search tab and
    // typing still returns something instead of an empty list.
    function updateSearchRows(mainView) {
        var query = currentSearchQuery();
        var path = spotifyRoutePath();
        var rows;
        var signature;
        if (nativeScreenForPath() !== 'search' || !mainView || !query) {
            lastSearchPath = '';
            lastSearchSignature = null;
            return;
        }
        if (path !== lastSearchPath) {
            lastSearchPath = path;
            lastSearchSignature = null;
        }
        rows = collectHomeRows(mainView);
        if (!rows.length) {
            rows = collectDetailRows(mainView);
        }
        signature = JSON.stringify(rows);
        window.__sfNativeUiSearchRowsCount = rows.length;
        if (rows.length > 0 && signature !== lastSearchSignature && sendNativeUiData('search:' + query, rows)) {
            lastSearchSignature = signature;
        }
    }

    function libraryCategoryForPath(path) {
        var match = /^\/collection\/([a-z]+)/.exec(String(path || ''));
        var key = match && match[1];
        if (key === 'albums' || key === 'artists' || key === 'podcasts' || key === 'playlists') return key;
        return 'playlists';
    }

    var libraryEmptyScrapes = 0;
    function updateLibraryRows(mainView) {
        var path = spotifyRoutePath();
        var rows;
        var signature;
        if (nativeScreenForPath() !== 'library' || !mainView) {
            lastLibraryPath = '';
            lastLibrarySignature = null;
            libraryEmptyScrapes = 0;
            return;
        }
        if (path.indexOf('/collection') !== 0 && path.indexOf('/your-library') !== 0) return;
        if (path !== lastLibraryPath) {
            lastLibraryPath = path;
            lastLibrarySignature = null;
            libraryEmptyScrapes = 0;
        }
        rows = collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiLibraryRowsCount = rows.length;
        // "media:playlists" is the payload the native library screen already
        // renders; using it keeps one code path for bridge and shell data.
        if (rows.length > 0 && signature !== lastLibrarySignature && sendNativeUiData('media:' + libraryCategoryForPath(path), rows)) {
            lastLibrarySignature = signature;
            libraryEmptyScrapes = 0;
            return;
        }
        if (rows.length > 0) return;
        // Zero rows on a fully-loaded collection page is a valid empty source
        // response. After a few consecutive empty scrapes the native screen
        // receives the terminal empty state instead of waiting forever on a
        // channel nothing else will answer.
        if (typeof document === 'undefined' || document.readyState !== 'complete') return;
        libraryEmptyScrapes += 1;
        if (libraryEmptyScrapes < 3) return;
        libraryEmptyScrapes = 0;
        lastLibrarySignature = 'empty';
        sendNativeUiData('media:' + libraryCategoryForPath(path), [{
            title: 'Aucun élément à afficher ici',
            subtitle: 'Spotify ne montre aucun élément dans cette catégorie',
            section: 'Votre bibliothèque',
            actionUri: 'spotify:retry:media:' + libraryCategoryForPath(path),
            playable: false,
            kind: 'empty'
        }]);
    }

    function collectDetailRows(mainView) {
        var root = mainView && mainView.querySelectorAll ? mainView : homeScrapeRoot();
        var seen = new Set();
        var rows = [];
        var pageUri = nativeSpotifyUri(window.location && window.location.href);
        var nodes;
        if (!root || typeof root.querySelectorAll !== 'function') return [];
        nodes = Array.prototype.slice.call(root.querySelectorAll('[data-testid="tracklist-row"]'));
        if (!nodes.length) {
            nodes = Array.prototype.slice.call(root.querySelectorAll('[role="row"]'));
        }
        nodes.forEach(function(row) {
            var trackAnchor = null;
            if (row && typeof row.querySelector === 'function') {
                trackAnchor = row.querySelector('a[href*="/track/"]')
                    || row.querySelector('a[href*="/episode/"]')
                    || row.querySelector('[data-testid="internal-track-link"]');
            }
            var href = trackAnchor && (trackAnchor.href || (trackAnchor.getAttribute && trackAnchor.getAttribute('href')));
            var uri = spotifyResourceUri(href);
            var lines;
            var title;
            var subtitle;
            var artistNode;
            if (!uri || seen.has(uri)) return;
            lines = textLines(row);
            title = String(
                (trackAnchor && (trackAnchor.textContent || trackAnchor.innerText)) ||
                lines[0] ||
                ''
            ).replace(/\s+/g, ' ').trim().slice(0, 100);
            if (!title) return;
            subtitle = '';
            if (row && typeof row.querySelector === 'function') {
                artistNode = row.querySelector('a[href*="/artist/"]');
                if (artistNode) {
                    subtitle = String(artistNode.textContent || artistNode.innerText || '')
                        .replace(/\s+/g, ' ').trim();
                }
            }
            if (!subtitle) {
                subtitle = lines.find(function(line) { return line && line !== title; }) || '';
            }
            seen.add(uri);
            rows.push({
                title: title,
                subtitle: subtitle.slice(0, 120),
                section: '',
                image: findImageUrl(row, trackAnchor, root),
                uri: uri
            });
        });
        if (rows.length) return rows.slice(0, 80);
        Array.prototype.slice.call(root.querySelectorAll('a[href*="/track/"], a[href*="/episode/"]')).forEach(function(anchor) {
            var href = anchor && (anchor.href || (anchor.getAttribute && anchor.getAttribute('href')));
            var uri = spotifyResourceUri(href);
            var title;
            if (!uri || seen.has(uri)) return;
            title = String(anchor.textContent || anchor.innerText || '').replace(/\s+/g, ' ').trim().slice(0, 100);
            if (!title) return;
            seen.add(uri);
            rows.push({
                title: title,
                subtitle: '',
                section: '',
                image: '',
                uri: uri
            });
        });
        if (rows.length) return rows.slice(0, 80);
        collectHomeRows(root).forEach(function(row) {
            if (!row || !row.uri || seen.has(row.uri)) return;
            if (pageUri && row.uri === pageUri) return;
            seen.add(row.uri);
            rows.push(row);
        });
        return rows.slice(0, 80);
    }

    function updateDetailRows(mainView) {
        var titleNode;
        var title;
        var rows;
        var signature;
        var bridge;
        var path = spotifyRoutePath();
        if (isSessionBlockedByLogout()) return;
        if (nativeScreenForPath() !== 'detail' || !mainView) {
            lastDetailPath = '';
            lastInitialDetailSignature = null;
            return;
        }
        if (path !== lastDetailPath) {
            lastDetailPath = path;
            lastInitialDetailSignature = null;
            lastInitialDetailTitle = null;
        }

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

        rows = collectDetailRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiDetailRowsCount = rows.length;
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', rows)) {
            lastInitialDetailSignature = signature;
            detailRetries = 0;
            if (detailRetryTimer) {
                window.clearTimeout(detailRetryTimer);
                detailRetryTimer = null;
            }
            if (typeof cancelPendingCollectionNavigation === 'function') cancelPendingCollectionNavigation();
        } else if (rows.length === 0 && detailRetries < 20 && !detailRetryTimer) {
            detailRetries += 1;
            detailRetryTimer = window.setTimeout(function() {
                detailRetryTimer = null;
                runUpdate();
            }, 160);
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
        if (isSessionBlockedByLogout() || !mainView || window.location.hostname !== 'open.spotify.com' || window.__sfNativeUiReadyNotified) return false;

        // Do not cover Spotify's page until its signed-in account control is present.
        userWidget = document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]');
        if (!userWidget || !bridge || typeof bridge.onNativeUiReady !== 'function') return false;

        if (typeof bridge.onNativeUiRoute === 'function') {
            try {
                window.AndBridge.onNativeUiRoute(initialScreen);
            } catch (_) {}
        }

        try {
            window.AndBridge.onNativeUiReady();
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

    function hasPlayingMediaElement() {
        var list = [];
        var domMedia;
        var i;
        var el;
        if (Array.isArray(window.activeMediaElements)) {
            list = list.concat(window.activeMediaElements);
        }
        if (document && typeof document.querySelectorAll === 'function') {
            domMedia = document.querySelectorAll('audio, video');
            for (i = 0; i < domMedia.length; i += 1) {
                list.push(domMedia[i]);
            }
        }
        for (i = 0; i < list.length; i += 1) {
            el = list[i];
            if (!el || el.paused !== false || el.ended) continue;
            if (String(el.tagName || '').toUpperCase() === 'VIDEO' && el.muted) continue;
            if (typeof el.readyState === 'number' && el.readyState < 2) continue;
            return true;
        }
        return false;
    }

    function getPlayPauseDomState() {
        var pb;
        var label;
        if (!document || typeof document.querySelector !== 'function') return null;
        pb = document.querySelector('button[data-testid="control-button-playpause"]') || window.pBtn;
        if (!pb || typeof pb.getAttribute !== 'function') return null;
        label = String(pb.getAttribute('aria-label') || '').trim().toLowerCase();
        if (!label) return null;
        if (label.indexOf('paus') !== -1 || label.indexOf('stop') !== -1) {
            return true;
        }
        return false;
    }

    function isSpotifyActuallyPlaying() {
        if (hasPlayingMediaElement()) {
            lastMediaActiveAt = Date.now();
            return true;
        }
        if (window.__sfLastPlayRequestAt && (Date.now() - window.__sfLastPlayRequestAt < 4000) && !window.__sfUserRequestedPause) {
            return true;
        }
        if (lastMediaActiveAt && (Date.now() - lastMediaActiveAt < 3000) && !window.__sfUserRequestedPause) {
            return true;
        }
        var domState = getPlayPauseDomState();
        if (domState === false) return false;
        if (domState === true) return true;
        return false;
    }

    function installPlaybackStateGuard() {
        if (window.__sfNativeUiReadyNotified && window.gobserver && typeof window.gobserver.disconnect === 'function') {
            try {
                window.gobserver.disconnect();
            } catch (_) {}
        }
        if (typeof window.searchMediaItems === 'function' && !window.searchMediaItems._sfCached) {
            var origSearch = window.searchMediaItems;
            window.__sfSearchCache = window.__sfSearchCache || new Map();
            var cachedSearch = function(query) {
                if (isSessionBlockedByLogout()) return;
                var norm = String(query || '').trim().toLowerCase();
                if (norm && window.__sfSearchCache && window.__sfSearchCache.has(norm) && window.AndBridge && typeof window.AndBridge.onSearchCompleted === 'function') {
                    try {
                        window.AndBridge.onSearchCompleted(query, JSON.stringify(window.__sfSearchCache.get(norm)));
                        return;
                    } catch (_) {}
                }
                return origSearch.call(this, query);
            };
            cachedSearch._sfCached = true;
            window.searchMediaItems = cachedSearch;
        }
        if (typeof window.updMedia === 'function' && !window.updMedia._sfGuarded) {
            var origUpdMedia = window.updMedia;
            var guardedUpdMedia = function(force) {
                window.playing = isSpotifyActuallyPlaying();
                return origUpdMedia.call(this, force);
            };
            guardedUpdMedia._sfGuarded = true;
            window.updMedia = guardedUpdMedia;
        }
        if (typeof window.manageAll === 'function' && !window.manageAll._sfGuarded) {
            var origManageAll = window.manageAll;
            var guardedManageAll = function(play) {
                var actual = play ? isSpotifyActuallyPlaying() : false;
                return origManageAll.call(this, actual);
            };
            guardedManageAll._sfGuarded = true;
            window.manageAll = guardedManageAll;
        }
        var actualPlaying = isSpotifyActuallyPlaying();
        if (Boolean(window.playing) !== actualPlaying) {
            window.playing = actualPlaying;
            if (typeof window.updMedia === 'function') {
                try {
                    window.updMedia(true);
                } catch (_) {}
            }
        }
    }

    // ---- Now-playing feed -------------------------------------------------
    // The playback bridge normally publishes the player state, but it does not
    // start on every device. The shell always runs, so it reads the real
    // Spotify now-playing bar itself and keeps the native mini player, the full
    // player and every button state accurate without the bridge.
    var PLAYER_SEND_INTERVAL_MS = 1000;
    var playerFeedTimer = null;
    var lastPlayerSignature = '';
    var lastPlayerSentAt = 0;

    function playPauseButton() {
        var pb = null;
        if (document && typeof document.querySelector === 'function') {
            try {
                pb = document.querySelector('[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]') ||
                    document.querySelector('aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]') ||
                    document.querySelector('button[data-testid="control-button-playpause"]');
            } catch (_) {
                pb = null;
            }
        }
        return pb || window.pBtn || null;
    }

    function playPauseLabelPlaying() {
        var pb = playPauseButton();
        var label = '';
        if (!pb || typeof pb.getAttribute !== 'function') return null;
        try {
            label = String(pb.getAttribute('aria-label') || '').trim();
        } catch (_) {
            return null;
        }
        if (!label) return null;
        // French labels are "Mettre en pause" / "Lire"; both match this test.
        return /paus/i.test(label);
    }

    function mediaNodes() {
        var nodes = [];
        var list;
        var i;
        if (typeof document.querySelectorAll !== 'function') return nodes;
        try {
            list = document.querySelectorAll('audio, video');
        } catch (_) {
            return nodes;
        }
        if (!list || typeof list.length !== 'number') return nodes;
        for (i = 0; i < list.length; i += 1) nodes.push(list[i]);
        return nodes;
    }

    function isSilentMedia(el) {
        return !el || /silent\.mp3/i.test(String(el.currentSrc || el.src || ''));
    }

    function isAudibleElement(el) {
        if (!el || el.paused !== false || el.ended || el.muted) return false;
        if (String(el.tagName || '').toUpperCase() === 'VIDEO' && el.muted) return false;
        return !isSilentMedia(el);
    }

    function isMediaPlaying() {
        var nodes = mediaNodes();
        var i;
        for (i = 0; i < nodes.length; i += 1) {
            if (isAudibleElement(nodes[i])) return true;
        }
        return false;
    }

    var lastAudibleTime = -1;

    // Real, audible content only, and only when the playhead actually moves.
    // A paused player keeps its position, a buffering element does not advance
    // and the silent keep-alive media never counts.
    function isAudiblePlaybackAdvancing() {
        var nodes = mediaNodes();
        var position = -1;
        var i;
        var el;
        var current;
        for (i = 0; i < nodes.length; i += 1) {
            el = nodes[i];
            if (!isAudibleElement(el)) continue;
            current = Number(el.currentTime || 0);
            if (current > position) position = current;
        }
        var advancing = position >= 0 && lastAudibleTime >= 0 && position > lastAudibleTime + 0.05;
        lastAudibleTime = position;
        return advancing;
    }

    function playbackSnapshot() {
        var labelState = playPauseLabelPlaying();
        var playing = labelState === null ? Boolean(window.playing) : labelState;
        if (!playing && isMediaPlaying()) playing = true;
        return { playing: playing, hasButton: Boolean(playPauseButton()) };
    }

    window.__sfGetPlaybackSnapshot = playbackSnapshot;

    var PAUSE_HOLD_MS = 45000;
    var PAUSE_HOLD_SETTLE_MS = 1200;
    var PAUSE_HOLD_TICK_MS = 300;
    var PAUSE_HOLD_MAX_REAPPLIES = 5;
    var PAUSE_HOLD_REAPPLY_GAP_MS = 1500;
    var pauseHoldTimer = null;
    var pauseHoldSince = 0;
    var pauseHoldUntil = 0;
    var pauseHoldReapplies = 0;
    var pauseHoldLastReapplyAt = 0;

    function endPauseHold() {
        if (pauseHoldTimer) {
            try {
                window.clearInterval(pauseHoldTimer);
            } catch (_) {}
            pauseHoldTimer = null;
        }
        pauseHoldUntil = 0;
        pauseHoldReapplies = 0;
        window.__sfPauseHoldActive = false;
    }

    function pauseHoldTick() {
        if (!window.__sfUserRequestedPause) {
            endPauseHold();
            return;
        }
        var now = Date.now();
        if (now > pauseHoldUntil || pauseHoldReapplies >= PAUSE_HOLD_MAX_REAPPLIES) {
            endPauseHold();
            return;
        }
        if (now - pauseHoldSince < PAUSE_HOLD_SETTLE_MS) return;
        if (now - pauseHoldLastReapplyAt < PAUSE_HOLD_REAPPLY_GAP_MS) return;
        if (window.__sfLastPlayRequestAt && now - window.__sfLastPlayRequestAt < PAUSE_HOLD_SETTLE_MS) return;

        // Two independent signals are required before touching the player: the
        // playhead must really move AND the button must label itself as playing.
        // A pause that is still settling is therefore never toggled back on.
        var pb = playPauseButton();
        if (!pb || typeof pb.click !== 'function') return;
        if (playPauseLabelPlaying() !== true) return;
        if (!isAudiblePlaybackAdvancing()) return;

        try {
            pb.click();
        } catch (_) {
            return;
        }
        pauseHoldReapplies += 1;
        pauseHoldLastReapplyAt = now;
        lastAudibleTime = -1;
        window.__sfPauseHoldReapplies = (window.__sfPauseHoldReapplies || 0) + 1;
    }

    function startPauseHold() {
        var now = Date.now();
        if (pauseHoldTimer && now < pauseHoldUntil) return;
        pauseHoldSince = now;
        pauseHoldUntil = now + PAUSE_HOLD_MS;
        pauseHoldReapplies = 0;
        pauseHoldLastReapplyAt = 0;
        lastAudibleTime = -1;
        window.__sfPauseHoldActive = true;
        if (pauseHoldTimer) {
            try {
                window.clearInterval(pauseHoldTimer);
            } catch (_) {}
        }
        if (typeof window.setInterval === 'function') {
            pauseHoldTimer = window.setInterval(pauseHoldTick, PAUSE_HOLD_TICK_MS);
        }
    }

    // A pause the user explicitly asked for must stay a pause. Automatic
    // resumes are ignored until an explicit play or the hold window ends.
    function markUserPlaybackIntent(playing, options) {
        var explicit = !options || options.explicit !== false;
        var paused = !playing;
        if (!paused && !explicit) return;
        window.__sfUserRequestedPause = paused;
        if (paused) {
            window.__sfUserPausedAt = Date.now();
            startPauseHold();
        } else {
            window.__sfLastPlayRequestAt = Date.now();
            endPauseHold();
        }
    }

    window.__sfMarkUserPlaybackIntent = markUserPlaybackIntent;
    window.__sfIsUserPaused = function() {
        return Boolean(window.__sfUserRequestedPause);
    };
    window.__sfEndPauseHold = endPauseHold;

    function clockSeconds(value) {
        var parts = String(value || '').trim().split(':');
        var total = 0;
        var i;
        var n;
        if (parts.length < 2 || parts.length > 3) return -1;
        for (i = 0; i < parts.length; i += 1) {
            n = parseInt(parts[i], 10);
            if (isNaN(n) || n < 0) return -1;
            total = total * 60 + n;
        }
        return total;
    }

    function readClock(selectors) {
        var i;
        var node;
        var seconds;
        for (i = 0; i < selectors.length; i += 1) {
            node = document.querySelector(selectors[i]);
            if (!node) continue;
            seconds = clockSeconds(node.textContent);
            if (seconds >= 0) return seconds;
        }
        return -1;
    }

    function readMediaProgress() {
        var nodes = mediaNodes();
        var fallback = { position: -1, duration: -1 };
        var i;
        var el;
        for (i = 0; i < nodes.length; i += 1) {
            el = nodes[i];
            if (!el || !isFinite(el.duration) || el.duration <= 0) continue;
            if (isSilentMedia(el)) continue;
            if (!isAudibleElement(el)) {
                if (fallback.position < 0) {
                    fallback.position = Number(el.currentTime || 0);
                    fallback.duration = Number(el.duration);
                }
                continue;
            }
            return { position: Number(el.currentTime || 0), duration: Number(el.duration) };
        }
        return fallback;
    }

    function textOf(selectors) {
        var i;
        var node;
        for (i = 0; i < selectors.length; i += 1) {
            node = document.querySelector(selectors[i]);
            if (!node) continue;
            var text = String(node.textContent || '').replace(/\s+/g, ' ').trim();
            if (text) return text;
        }
        return '';
    }

    function imageOf(selectors) {
        var i;
        var node;
        var img;
        for (i = 0; i < selectors.length; i += 1) {
            node = document.querySelector(selectors[i]);
            if (!node) continue;
            img = node.tagName && String(node.tagName).toUpperCase() === 'IMG' ? node : node.querySelector && node.querySelector('img');
            if (img) {
                var url = safeSpotifyImage(img.currentSrc || img.src || '');
                if (url) return url;
            }
        }
        return '';
    }

    function readNowPlaying() {
        var bar = null;
        try {
            bar = document.querySelector('[data-testid="now-playing-bar"], [data-testid="now-playing-widget"]');
        } catch (_) {
            bar = null;
        }
        var titleSelectors = [
            '[data-testid="context-item-link"]',
            '[data-testid="nowplaying-track-link"]',
            '[data-testid="now-playing-widget"] a[href*="/track/"]'
        ];
        var artistSelectors = [
            '[data-testid="context-item-info-artist"]',
            '[data-testid="nowplaying-artist"]',
            '[data-testid="context-item-info"] a[href*="/artist/"]'
        ];
        var coverSelectors = [
            '[data-testid="cover-art-image"]',
            '[data-testid="now-playing-widget"] img',
            '[data-testid="now-playing-bar"] img'
        ];
        var title = bar ? textIn(bar, titleSelectors) : textOf(titleSelectors);
        var artist = bar ? textIn(bar, artistSelectors) : textOf(artistSelectors);
        var cover = bar ? imageIn(bar, coverSelectors) : imageOf(coverSelectors);
        var progress = readMediaProgress();
        var position = progress.position;
        var duration = progress.duration;
        if (position < 0) position = readClock(['[data-testid="playback-position"]']);
        if (duration <= 0) duration = readClock(['[data-testid="playback-duration"]']);
        return {
            title: String(title || '').slice(0, 120),
            artist: String(artist || '').slice(0, 120),
            cover: cover || '',
            uri: readNowPlayingUri(bar),
            // HTMLMediaElement and the on-screen clocks are seconds.
            // Native formatNativeTime / recMediaStatus expect milliseconds.
            position: position > 0 ? Math.round(position * 1000) : 0,
            duration: duration > 0 ? Math.round(duration * 1000) : 0
        };
    }

    // Real track URI of the now-playing item, read from the on-page track link.
    // Returns '' when the link is absent; callers must treat that as unknown.
    function readNowPlayingUri(bar) {
        var link = null;
        var href = '';
        var m;
        try {
            link = (bar && bar.querySelector && bar.querySelector('a[href*="/track/"]')) ||
                document.querySelector('[data-testid="now-playing-widget"] a[href*="/track/"], [data-testid="now-playing-bar"] a[href*="/track/"]');
            href = link && link.getAttribute ? String(link.getAttribute('href') || '') : '';
        } catch (_) {
            href = '';
        }
        m = href.match(/\/track\/([A-Za-z0-9]+)/);
        return m ? ('spotify:track:' + m[1]) : '';
    }

    function textIn(root, selectors) {
        var i;
        var node;
        var text;
        if (!root || typeof root.querySelector !== 'function') return '';
        for (i = 0; i < selectors.length; i += 1) {
            node = root.querySelector(selectors[i]);
            if (!node) continue;
            text = String(node.textContent || '').replace(/\s+/g, ' ').trim();
            if (text) return text;
        }
        return '';
    }

    function imageIn(root, selectors) {
        var i;
        var node;
        var img;
        var url;
        if (!root || typeof root.querySelector !== 'function') return '';
        for (i = 0; i < selectors.length; i += 1) {
            node = root.querySelector(selectors[i]);
            if (!node) continue;
            img = node.tagName && String(node.tagName).toUpperCase() === 'IMG' ? node : node.querySelector && node.querySelector('img');
            if (!img) continue;
            url = safeSpotifyImage(img.currentSrc || img.src || '');
            if (url) return url;
        }
        return '';
    }

    function readControlPressed(testId) {
        var btn;
        try {
            btn = document.querySelector('button[data-testid="' + testId + '"]');
        } catch (_) {
            return false;
        }
        if (!btn || typeof btn.getAttribute !== 'function') return false;
        var checked = btn.getAttribute('aria-checked');
        return checked === 'true' || checked === 'mixed';
    }

    function playerPayload() {
        var info = readNowPlaying();
        return {
            track: info.title || 'Aucune lecture en cours',
            artist: info.artist || '',
            cover: info.cover || '',
            playing: playbackSnapshot().playing,
            position: info.position,
            duration: info.duration,
            shuffle: readControlPressed('control-button-shuffle'),
            repeat: readControlPressed('control-button-repeat')
        };
    }

    function publishPlayerState(force) {
        var bridge = window.AndBridge;
        var payload;
        var signature;
        var now;
        if (isSessionBlockedByLogout() || !bridge || typeof bridge.onNativeUiData !== 'function') return false;
        payload = playerPayload();
        // Nothing is playing yet: leave the native defaults alone instead of
        // pushing an empty "Aucune lecture en cours" player to the UI.
        if (!payload.playing && (!payload.track || payload.track === 'Aucune lecture en cours')) return false;
        now = Date.now();
        signature = [
            payload.track,
            payload.artist,
            payload.playing ? '1' : '0',
            payload.duration,
            payload.shuffle ? '1' : '0',
            payload.repeat ? '1' : '0',
            Math.floor(payload.position / 5000)
        ].join('|');
        if (!force && signature === lastPlayerSignature && now - lastPlayerSentAt < 4000) return false;
        lastPlayerSignature = signature;
        lastPlayerSentAt = now;
        window.__sfPlayerPayload = payload;
        try {
            bridge.onNativeUiData('player', JSON.stringify(payload));
            return true;
        } catch (_) {
            return false;
        }
    }

    function refreshPlayerSoon(delay) {
        window.setTimeout(function() {
            publishPlayerState(true);
        }, delay || 400);
    }

    // Single entry point for the native play/pause button.
    window.__sfTogglePlayback = function() {
        var playing = playbackSnapshot().playing;
        var target = !playing;
        markUserPlaybackIntent(target);
        if (typeof window.actPlayPause === 'function') {
            try {
                window.actPlayPause(target);
            } catch (_) {}
        } else {
            var pb = playPauseButton();
            if (pb && typeof pb.click === 'function') {
                try {
                    pb.click();
                } catch (_) {}
            }
        }
        refreshPlayerSoon(350);
        refreshPlayerSoon(1400);
        return target;
    };

    // Single entry point for the native previous/next buttons. A skip is an
    // explicit user action, so it releases the pause latch and the hold.
    window.__sfSkip = function(direction) {
        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        window.__sfUserRequestedPause = false;
        window.__sfLastPlayRequestAt = Date.now();
        endPauseHold();
        if (back && typeof window.actSkipBack === 'function') {
            try {
                window.actSkipBack();
                refreshPlayerSoon(600);
                return true;
            } catch (_) {}
        }
        if (!back && typeof window.actSkipForward === 'function') {
            try {
                window.actSkipForward();
                refreshPlayerSoon(600);
                return true;
            } catch (_) {}
        }
        var btn = document.querySelector(back
            ? '[data-testid="control-button-skip-back"]'
            : '[data-testid="control-button-skip-forward"]');
        if (btn && typeof btn.click === 'function') {
            try {
                btn.click();
            } catch (_) {}
        }
        refreshPlayerSoon(700);
        return false;
    };

    window.__sfToggleShuffle = function() {
        if (typeof window.actShuffle === 'function') {
            try { window.actShuffle(); } catch (_) {}
        } else {
            var b = document.querySelector('[data-testid="control-button-shuffle"]');
            if (b && typeof b.click === 'function') {
                try { b.click(); } catch (_) {}
            }
        }
        refreshPlayerSoon(350);
        return true;
    };

    window.__sfToggleRepeat = function() {
        if (typeof window.actRepeat === 'function') {
            try { window.actRepeat(); } catch (_) {}
        } else {
            var b = document.querySelector('[data-testid="control-button-repeat"]');
            if (b && typeof b.click === 'function') {
                try { b.click(); } catch (_) {}
            }
        }
        refreshPlayerSoon(350);
        return true;
    };

    // Fraction 0..1 against the on-page progress control. Unknown duration is a no-op.
    window.__sfSeekFraction = function(fraction) {
        var n = Number(fraction);
        var bar;
        if (!(n >= 0) || n > 1) return false;
        try {
            bar = document.querySelector('[data-testid="progress-bar"]') ||
                document.querySelector('input[data-testid="playback-progressbar"]') ||
                document.querySelector('[data-testid="playback-progressbar"]');
        } catch (_) {
            bar = null;
        }
        if (!bar) return false;
        try {
            if (typeof bar.value !== 'undefined' && bar.max) {
                bar.value = String(Math.round(Number(bar.max) * n));
                if (typeof bar.dispatchEvent === 'function') {
                    bar.dispatchEvent(new Event('input', { bubbles: true }));
                    bar.dispatchEvent(new Event('change', { bubbles: true }));
                }
            } else if (typeof bar.click === 'function') {
                bar.click();
            }
        } catch (_) {
            return false;
        }
        refreshPlayerSoon(300);
        return true;
    };

    function installPlayerFeed() {
        if (window.__sfPlayerFeedInstalled) return;
        window.__sfPlayerFeedInstalled = true;
        publishPlayerState(true);
        if (typeof window.setInterval === 'function') {
            playerFeedTimer = window.setInterval(function() {
                if (shellIsHidden()) return;
                publishPlayerState(false);
            }, PLAYER_SEND_INTERVAL_MS);
        }
        try {
            document.addEventListener('click', function(event) {
                var target = event && event.target;
                if (!target || typeof target.closest !== 'function') return;
                var control = target.closest(
                    '[data-testid="control-button-playpause"], [data-testid="control-button-skip-forward"], ' +
                    '[data-testid="control-button-skip-back"], [data-testid="control-button-shuffle"], ' +
                    '[data-testid="control-button-repeat"]'
                );
                if (control) refreshPlayerSoon(500);
            }, true);
        } catch (_) {}
    }

    function shellIsHidden() {
        return typeof document !== 'undefined' && document.hidden === true;
    }

    // Playlist titles are scraped from card/anchor textContent after childList
    // changes (Spotify replaces the card). characterData is not observed: a
    // document-wide listener would fire on player clocks, and there is no local
    // proof that Accueil rewrites titles in place without replacing the node.
    function mutationLooksRelevant(mutations) {
        var i;
        var j;
        var node;
        var nodes;
        var tag;
        if (!mutations || !mutations.length) return false;
        for (i = 0; i < mutations.length; i += 1) {
            nodes = mutations[i].addedNodes;
            for (j = 0; j < (nodes && nodes.length || 0); j += 1) {
                node = nodes[j];
                if (!node) continue;
                if (node.nodeType === 3) {
                    if (String(node.data || '').trim()) return true;
                    continue;
                }
                if (node.nodeType !== 1) continue;
                tag = String(node.tagName || '').toUpperCase();
                if (tag === 'SCRIPT' || tag === 'STYLE' || tag === 'LINK' || tag === 'META' || tag === 'NOSCRIPT') continue;
                return true;
            }
            nodes = mutations[i].removedNodes;
            for (j = 0; j < (nodes && nodes.length || 0); j += 1) {
                node = nodes[j];
                if (!node) continue;
                if (node.nodeType === 3) {
                    if (String(node.data || '').trim()) return true;
                    continue;
                }
                if (node.nodeType !== 1) continue;
                tag = String(node.tagName || '').toUpperCase();
                if (tag === 'SCRIPT' || tag === 'STYLE' || tag === 'LINK' || tag === 'META' || tag === 'NOSCRIPT') continue;
                return true;
            }
        }
        return false;
    }

    function runUpdate() {
        var mainView;
        if (window.location.hostname !== 'open.spotify.com') return;
        if (shellIsHidden()) return;
        try {
            installPlaybackStateGuard();
            installSearchFallback();
            mainView = homeScrapeRoot();
            if (mainView) {
                notifyNativeUiReady(mainView);
                detectSpotifyProfile();
                updateHomeRows(mainView);
                updateDetailRows(mainView);
                updateSearchRows(mainView);
                updateLibraryRows(mainView);
            }
            clearShellError('update');
        } catch (error) {
            recordShellError(error, 'update');
        }
        if (!window.__sfNativeUiReadyNotified) scheduleReadinessRetry();
    }

    function scheduleUpdate() {
        if (updateTimer || shellIsHidden()) return;
        updateTimer = window.setTimeout(function() {
            updateTimer = null;
            runUpdate();
        }, 120);
    }

    var SETTINGS_STORAGE_KEY = 'melodix_spotify_settings_v1';
    var AUDIO_QUALITIES = [
        'Très élevée (320 kbit/s)',
        'Élevée (160 kbit/s)',
        'Normale (96 kbit/s)',
        'Automatique'
    ];
    var CROSSFADE_VALUES = ['Off', '2 s', '6 s', '12 s'];
    var profileAvatarSent = '';
    var profileNameSent = '';
    var greetingSent = '';
    var lastGreetingAt = 0;

    function greetingPrefix() {
        var hour = new Date().getHours();
        if (hour >= 6 && hour < 18) return 'Bonjour';
        if (hour >= 18 && hour < 23) return 'Bonsoir';
        return 'Bonne nuit';
    }

    function detectSpotifyProfile() {
        var name = '';
        var avatar = '';
        var widget;
        var img;
        var fig;
        try {
            widget = document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]');
            if (widget) {
                name = cleanText(widget.getAttribute && (widget.getAttribute('aria-label') || widget.getAttribute('title')) || '');
                if (!name && typeof widget.querySelector === 'function') {
                    fig = widget.querySelector('[data-testid="user-widget-name"], figure[title]');
                    if (fig) {
                        name = cleanText((fig.getAttribute && fig.getAttribute('title')) || fig.textContent || '');
                    }
                }
                if (typeof widget.querySelector === 'function') {
                    img = widget.querySelector('img');
                    if (img) avatar = extractImgUrl(img);
                }
            }
            var blockedByLogout = isSessionBlockedByLogout();
            if (!blockedByLogout && avatar && /^https:\/\//i.test(avatar) && avatar !== profileAvatarSent && window.AndBridge && typeof window.AndBridge.onNativeProfileImage === 'function') {
                profileAvatarSent = avatar;
                window.AndBridge.onNativeProfileImage(avatar);
            }
            if (!blockedByLogout && name && window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function' && isSpotifyHome()) {
                var first = name.split(/\s+/)[0] || name;
                var greeting = greetingPrefix() + ', ' + first;
                if (greeting !== greetingSent || (Date.now() - lastGreetingAt) > 8000) {
                    profileNameSent = name;
                    greetingSent = greeting;
                    lastGreetingAt = Date.now();
                    window.AndBridge.onNativeUiData('home-greeting', greeting);
                }
            }
        } catch (_) {}
        return { name: name, avatar: avatar };
    }

    function getSpotifySettingsState() {
        var state = {
            audio_quality: 'Très élevée (320 kbit/s)',
            normalize_volume: true,
            gapless: true,
            autoplay: !(window.SF_CONFIG && window.SF_CONFIG.autoPlayMode === 'disabled'),
            shuffle: false,
            repeat: false,
            explicit: true,
            canvas: !(window.SF_CONFIG && window.SF_CONFIG.isCanvasDisabled),
            data_saver: false,
            bg_audio: true,
            private_session: false,
            crossfade: 'Off',
            automix: true,
            mono: false,
            lyrics: true,
            show_unplayable: false,
            notifications: true,
            hardware_volume: true,
            podcast_boost: false,
            cache_status: 'Effacer le cache des recherches, playlists et pochettes',
            sync_status: 'Actualiser vos playlists, albums et titres likés'
        };
        try {
            if (window.localStorage) {
                var raw = window.localStorage.getItem(SETTINGS_STORAGE_KEY);
                if (raw) {
                    var parsed = JSON.parse(raw);
                    if (parsed && typeof parsed === 'object') {
                        Object.keys(parsed).forEach(function(k) {
                            if (parsed[k] !== undefined) state[k] = parsed[k];
                        });
                    }
                }
            }
        } catch (_) {}
        try {
            var shuffleBtn = document.querySelector && document.querySelector('button[data-testid="control-button-shuffle"]');
            if (shuffleBtn && shuffleBtn.getAttribute) {
                var sc = shuffleBtn.getAttribute('aria-checked');
                if (sc === 'true' || sc === 'false') state.shuffle = (sc === 'true');
            }
            var repeatBtn = document.querySelector && document.querySelector('button[data-testid="control-button-repeat"]');
            if (repeatBtn && repeatBtn.getAttribute) {
                var rc = repeatBtn.getAttribute('aria-checked');
                if (rc === 'true' || rc === 'false' || rc === 'mixed') state.repeat = (rc !== 'false');
            }
        } catch (_) {}
        return state;
    }

    function saveSpotifySettingsState(state) {
        try {
            if (window.localStorage) {
                window.localStorage.setItem(SETTINGS_STORAGE_KEY, JSON.stringify(state));
            }
        } catch (_) {}
    }

    // Temporary pipeline diagnostic rows (Paramètres). They only surface what
    // window.__sfGetLibDiagReport() really recorded — booleans, counts and
    // short labels — never tokens, cookies or account data. To be removed once
    // the real-account validation is done.
    function libDiagReport() {
        try {
            if (typeof window.__sfGetLibDiagReport === 'function') {
                return window.__sfGetLibDiagReport();
            }
        } catch (_) {}
        return null;
    }

    function libDiagSummaryLine() {
        var report = libDiagReport();
        if (!report) return 'Module diagnostic indisponible (pont bibliothèque absent)';
        return String(report.conclusion || 'En attente du premier chargement de la bibliothèque.').slice(0, 120);
    }

    function libDiagShortValue() {
        var report = libDiagReport();
        if (!report) return 'Indisponible';
        if (report.failureKind) return 'Échec étape';
        if (report.lastRun && report.lastRun.status === 'ready') return 'OK';
        if (report.lastRun && report.lastRun.status === 'empty') return 'Vide';
        return 'En cours';
    }

    function libDiagHttpSummary(run) {
        var attempts = run.attempts || [];
        var i;
        for (i = attempts.length - 1; i >= 0; i -= 1) {
            if (attempts[i].networkError) return 'Erreur réseau';
            if (attempts[i].httpStatus) return 'HTTP ' + attempts[i].httpStatus;
        }
        return 'Non évalué';
    }

    function libDiagShapeSummary(run) {
        var attempts = run.attempts || [];
        var i;
        for (i = attempts.length - 1; i >= 0; i -= 1) {
            if (attempts[i].shape === 'ok') return 'Attendue (' + (attempts[i].items === null ? '?' : attempts[i].items) + ' items)';
            if (attempts[i].shape === 'me-null') return 'me=null (session)';
            if (attempts[i].shape === 'mismatch') return 'Inattendue';
        }
        return 'Non évaluée';
    }

    function libDiagSettingsRows() {
        var report = libDiagReport();
        var rows = [{
            section: 'Bibliothèque et données',
            title: 'Diagnostic de récupération (temporaire)',
            subtitle: libDiagSummaryLine(),
            image: '',
            uri: 'spotify:settings:lib_diag',
            settingValue: libDiagShortValue()
        }];
        if (!window.__sfLibDiagExpanded || !report) return rows;
        var run = report.lastRun || {};
        var steps = [
            {
                title: '1. Session Spotify détectée',
                value: run.session === 'detected' ? 'Oui' : run.session === 'not-detected' ? 'Non (déconnectée)' : 'Indéterminée'
            },
            {
                title: '2. Jeton d’accès disponible',
                value: run.token === 'bearer' ? 'Oui (format Bearer)' : run.token === 'malformed' ? 'Format inattendu' : run.token === 'missing' ? 'Non' : 'Non évalué'
            },
            {
                title: '3. Appel bibliothèque (libraryV3, requête interne)',
                value: (run.attempts || []).length
                    ? ((run.attempts.length) + ' tentative(s), hash ' + (run.hashSource === 'dynamic' ? 'capté + intégré' : 'intégré'))
                    : 'Aucune tentative'
            },
            {
                title: '4. Statut HTTP de la réponse',
                value: libDiagHttpSummary(run)
            },
            {
                title: '5. Structure de la réponse',
                value: libDiagShapeSummary(run)
            },
            {
                title: '6. Éléments analysés',
                value: (run.itemsTotal || 0) + ' reçu(s) → ' + (run.parsed ? run.parsed.playlists : 0) + ' playlist(s), '
                    + (run.parsed ? run.parsed.skipped : 0) + ' ignoré(s)'
            },
            {
                title: '7. Playlists transmises au shell natif',
                value: run.delivered
                    ? ((run.delivered.homePlaylistRows + run.delivered.mediaPlaylistRows) + ' transmise(s)')
                    : '0 transmise(s)'
            },
            {
                title: 'Conclusion du parcours',
                value: String(report.conclusion || '').slice(0, 90)
            }
        ];
        steps.forEach(function(step, index) {
            rows.push({
                section: 'Diagnostic bibliothèque (temporaire)',
                title: step.title,
                subtitle: 'Étape réelle du parcours — aucune donnée sensible enregistrée',
                image: '',
                uri: 'spotify:settings:lib_diag_step' + (index + 1),
                settingValue: String(step.value).slice(0, 60)
            });
        });
        return rows;
    }

    function buildSpotifySettingsRows(overrideStatus) {
        var state = getSpotifySettingsState();
        var profile = detectSpotifyProfile();
        var accountName = profile.name ? ('Compte : ' + profile.name) : 'Compte Spotify connecté';
        if (overrideStatus && overrideStatus.cache_status) state.cache_status = overrideStatus.cache_status;
        if (overrideStatus && overrideStatus.sync_status) state.sync_status = overrideStatus.sync_status;

        // Honest live diagnostics: the settings screen must show what the app
        // really knows, never a fabricated success state.
        var libState = userPlaylistLibraryState();
        var libCount = window.mediaLib && Array.isArray(window.mediaLib.playlists)
            ? window.mediaLib.playlists.length
            : null;
        var libLabel = libState === 'ready'
            ? (libCount + ' playlist' + (libCount > 1 ? 's' : '') + ' chargée' + (libCount > 1 ? 's' : ''))
            : libState === 'empty'
                ? 'Aucune playlist'
                : libState === 'error'
                    ? 'Erreur de chargement'
                    : 'Chargement en cours…';
        var lastError = window.__sfNativeUiShellLastError || null;

        var rows = [
            {
                section: 'Diagnostic',
                title: 'Diagnostic Melodix',
                subtitle: 'Vérifier pourquoi vos listes ne s’affichent pas',
                image: '',
                uri: 'spotify:diag:open',
                settingValue: 'Ouvrir'
            },
            {
                section: 'Compte Spotify',
                title: accountName,
                subtitle: 'Session Spotify active • Streaming Web Player',
                image: profile.avatar || '',
                uri: 'spotify:settings:account_info',
                settingValue: 'Connecté'
            },
            {
                section: 'Compte Spotify',
                title: 'Session privée',
                subtitle: 'Réglage de votre compte Spotify : ouvrez les paramètres Spotify pour l’activer',
                image: '',
                uri: 'spotify:settings:private_session',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Compte Spotify',
                title: 'Se déconnecter de Spotify',
                subtitle: 'Fermer la session actuelle, vider les données locales et changer de compte',
                image: '',
                uri: 'spotify:settings:logout',
                settingValue: 'Déconnexion'
            },
            {
                section: 'Lecture',
                title: 'Lecture aléatoire (Shuffle)',
                subtitle: 'Mélanger l’ordre de lecture des titres de la file d’attente',
                image: '',
                uri: 'spotify:settings:shuffle',
                settingValue: state.shuffle ? 'ON' : 'OFF'
            },
            {
                section: 'Lecture',
                title: 'Mode Répétition (Repeat)',
                subtitle: 'Répéter automatiquement la playlist ou le titre en cours',
                image: '',
                uri: 'spotify:settings:repeat',
                settingValue: state.repeat ? 'ON' : 'OFF'
            },
            {
                section: 'Lecture',
                title: 'Lecture automatique (Autoplay)',
                subtitle: 'Continuer à écouter des titres similaires à la fin d’une playlist',
                image: '',
                uri: 'spotify:settings:autoplay',
                settingValue: state.autoplay ? 'ON' : 'OFF'
            },
            {
                section: 'Lecture',
                title: 'Audio en arrière-plan',
                subtitle: 'Continuer la lecture quand Melodix passe au second plan',
                image: '',
                uri: 'spotify:settings:bg_audio',
                settingValue: state.bg_audio ? 'ON' : 'OFF'
            },
            {
                section: 'Vidéos et Arrière-plan',
                title: 'Vidéos Canvas',
                subtitle: 'Laisser lire les animations visuelles des titres compatibles',
                image: '',
                uri: 'spotify:settings:canvas',
                settingValue: state.canvas ? 'ON' : 'OFF'
            },
            {
                section: 'Vidéos et Arrière-plan',
                title: 'Économiseur de données',
                subtitle: 'Désactive les vidéos Canvas pour réduire la consommation réseau',
                image: '',
                uri: 'spotify:settings:data_saver',
                settingValue: state.data_saver ? 'ON' : 'OFF'
            },
            {
                section: 'Bibliothèque et données',
                title: 'État de la bibliothèque Spotify',
                subtitle: 'Données réellement récupérées pour le compte connecté',
                image: '',
                uri: 'spotify:settings:lib_status',
                settingValue: libLabel
            },
            {
                section: 'Bibliothèque et données',
                title: 'Dernier problème de chargement',
                subtitle: lastError || 'Aucun problème enregistré',
                image: '',
                uri: 'spotify:settings:diag_errors',
                settingValue: lastError ? 'Diagnostic' : 'Aucun'
            },
            {
                section: 'Bibliothèque et données',
                title: 'Vider le cache de l’application',
                subtitle: state.cache_status,
                image: '',
                uri: 'spotify:settings:clear_cache',
                settingValue: 'Vider'
            },
            {
                section: 'Bibliothèque et données',
                title: 'Synchroniser la bibliothèque Spotify',
                subtitle: state.sync_status,
                image: '',
                uri: 'spotify:settings:resync',
                settingValue: 'Actualiser'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Qualité du streaming audio',
                subtitle: 'Définie par votre abonnement et vos paramètres Spotify',
                image: '',
                uri: 'spotify:settings:audio_quality',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Normaliser le volume',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:normalize_volume',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Lecture sans blanc (Gapless)',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:gapless',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Contenu explicite',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:explicit',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Fondu enchaîné (Crossfade)',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:crossfade',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Automix',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:automix',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Audio mono',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:mono',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Volume matériel',
                subtitle: 'Géré par Android et Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:hardware_volume',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Podcasts plus forts',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:podcast_boost',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Paroles (Lyrics)',
                subtitle: 'Affichées automatiquement quand Spotify les fournit',
                image: '',
                uri: 'spotify:settings:lyrics',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Titres indisponibles',
                subtitle: 'Réglage du compte Spotify, non modifiable depuis Melodix',
                image: '',
                uri: 'spotify:settings:show_unplayable',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'Réglages gérés par Spotify',
                title: 'Notifications Spotify',
                subtitle: 'Gérées par Spotify et les réglages Android de notification',
                image: '',
                uri: 'spotify:settings:notifications',
                settingValue: 'Géré par Spotify'
            },
            {
                section: 'À propos',
                title: 'Melodix • Client Spotify Natif',
                subtitle: 'Version 1.2.2 • Interface native Android • Spotify Web Player',
                image: '',
                uri: 'spotify:settings:about',
                settingValue: 'v1.2.2'
            }
        ];
        // Temporary diagnostic rows are inserted right before the cache
        // actions, driven by the real pipeline state only.
        var diagRows = libDiagSettingsRows();
        if (diagRows.length) {
            var insertAt = rows.length;
            var rowIndex;
            for (rowIndex = 0; rowIndex < rows.length; rowIndex += 1) {
                if (rows[rowIndex] && rows[rowIndex].uri === 'spotify:settings:clear_cache') {
                    insertAt = rowIndex;
                    break;
                }
            }
            rows = rows.slice(0, insertAt).concat(diagRows, rows.slice(insertAt));
        }
        return rows;
    }

    // ---- Queue / prochains titres -----------------------------------------
    // Builds the native "File d'attente" rows from the REAL playback context
    // tracked by the bridge (ordered URIs of the current context plus the
    // metadata cached when the list was loaded). Nothing is invented: without
    // live context data the screen shows an honest unavailable state, and the
    // true runtime queue stays the one managed by the Spotify engine.
    window.__sfRequestQueue = function() {
        var bridge = window.AndBridge;
        var rows = [];
        var uris;
        var ctx;
        var meta;
        var byUri = {};
        var i;
        var now;
        var nowUri;
        var start = 0;
        if (!bridge || typeof bridge.onNativeUiData !== 'function') return false;
        if (isSessionBlockedByLogout()) return false;
        uris = Array.isArray(window.__sfCurrentTrackUris) ? window.__sfCurrentTrackUris : [];
        ctx = window.__sfCurrentContextUri || null;
        meta = (window.__sfMediaItemsCache && ctx && typeof window.__sfMediaItemsCache.get === 'function' && window.__sfMediaItemsCache.has(ctx))
            ? (window.__sfMediaItemsCache.get(ctx) || []) : [];
        for (i = 0; i < meta.length; i += 1) {
            var item = meta[i];
            var itemUri = item && (item.id || item.uri);
            if (itemUri) byUri[String(itemUri)] = item;
        }
        now = readNowPlaying();
        nowUri = now && now.uri ? String(now.uri) : '';
        if (now && now.title) {
            rows.push({
                title: now.title,
                subtitle: (now.artist ? now.artist + ' — ' : '') + 'En cours',
                image: now.cover || '',
                uri: nowUri || '',
                section: 'En lecture'
            });
        }
        if (uris.length > 0) {
            if (nowUri && uris.indexOf(nowUri) >= 0) {
                start = uris.indexOf(nowUri) + 1;
            } else if (now && now.title) {
                // No track link on the page: fall back to matching the real
                // now-playing title against the loaded context metadata.
                for (i = 0; i < uris.length; i += 1) {
                    var named = byUri[String(uris[i])];
                    if (named && (named.name || named.title) === now.title) {
                        start = i + 1;
                        break;
                    }
                }
            }
            for (i = start; i < uris.length && rows.length < 40; i += 1) {
                var trackUri = String(uris[i]);
                var known = byUri[trackUri];
                var artists = known && Array.isArray(known.artists) ? known.artists.filter(Boolean).join(', ') : '';
                rows.push({
                    title: (known && (known.name || known.title)) || 'Piste non nommée',
                    subtitle: artists || trackUri,
                    image: (known && known.image) || '',
                    uri: trackUri,
                    section: 'À suivre'
                });
            }
            if (rows.length === 1) {
                rows.push({
                    title: 'Fin de la liste',
                    subtitle: 'Aucun autre titre dans la liste en cours.',
                    section: 'À suivre'
                });
            }
        }
        if (rows.length === 0) {
            rows.push({
                title: 'File indisponible',
                subtitle: 'Lancez une lecture depuis une playlist ou un album pour afficher les prochains titres.',
                section: 'File d\'attente'
            });
        }
        try {
            bridge.onNativeUiData('queue', JSON.stringify(rows));
            return true;
        } catch (_) {
            return false;
        }
    };

    window.__sfRequestSpotifySettings = function(overrideStatus) {
        var rows = buildSpotifySettingsRows(overrideStatus);
        return sendNativeUiData('settings', rows);
    };

    window.__sfToggleSpotifySetting = function(uri) {
        var key = String(uri || '').replace(/^spotify:settings:/i, '').trim();
        var state = getSpotifySettingsState();
        var overrideStatus = {};

        if (key === 'shuffle') {
            state.shuffle = !state.shuffle;
            saveSpotifySettingsState(state);
            try {
                if (typeof window.actShuffle === 'function') {
                    window.actShuffle();
                } else if (document.querySelector) {
                    var sb = document.querySelector('button[data-testid="control-button-shuffle"]');
                    if (sb && typeof sb.click === 'function') sb.click();
                }
            } catch (_) {}
        } else if (key === 'repeat') {
            state.repeat = !state.repeat;
            saveSpotifySettingsState(state);
            try {
                if (typeof window.actRepeat === 'function') {
                    window.actRepeat();
                } else if (document.querySelector) {
                    var rb = document.querySelector('button[data-testid="control-button-repeat"]');
                    if (rb && typeof rb.click === 'function') rb.click();
                }
            } catch (_) {}
        } else if (key === 'autoplay') {
            state.autoplay = !state.autoplay;
            if (window.SF_CONFIG) {
                window.SF_CONFIG.autoPlayMode = state.autoplay ? 'permanent' : 'disabled';
            }
            saveSpotifySettingsState(state);
        } else if (key === 'data_saver') {
            state.data_saver = !state.data_saver;
            if (state.data_saver) state.canvas = false;
            saveSpotifySettingsState(state);
            try {
                if (window.AndBridge && typeof window.AndBridge.setCanvasDisabled === 'function') {
                    window.AndBridge.setCanvasDisabled(!state.canvas);
                }
                if (document.body && document.body.classList) {
                    document.body.classList.toggle('sf-hide-canvas', !state.canvas);
                }
            } catch (_) {}
        } else if (key === 'canvas') {
            state.canvas = !state.canvas;
            if (state.canvas) state.data_saver = false;
            if (window.SF_CONFIG) {
                window.SF_CONFIG.isCanvasDisabled = !state.canvas;
            }
            saveSpotifySettingsState(state);
            try {
                if (document.body && document.body.classList) {
                    document.body.classList.toggle('sf-hide-canvas', !state.canvas);
                }
                if (window.AndBridge && typeof window.AndBridge.setCanvasDisabled === 'function') {
                    window.AndBridge.setCanvasDisabled(!state.canvas);
                }
            } catch (_) {}
        } else if (key === 'bg_audio') {
            state.bg_audio = !state.bg_audio;
            saveSpotifySettingsState(state);
            try {
                if (window.AndBridge && typeof window.AndBridge.manageTSleep === 'function') {
                    window.AndBridge.manageTSleep(Boolean(state.bg_audio && window.playing));
                }
            } catch (_) {}
        } else if (key === 'clear_cache') {
            if (window.__sfSearchCache && typeof window.__sfSearchCache.clear === 'function') {
                window.__sfSearchCache.clear();
            } else {
                window.__sfSearchCache = new Map();
            }
            if (window.__sfMediaItemsCache && typeof window.__sfMediaItemsCache.clear === 'function') {
                window.__sfMediaItemsCache.clear();
            } else {
                window.__sfMediaItemsCache = new Map();
            }
            overrideStatus.cache_status = 'Cache vidé avec succès ✓';
        } else if (key === 'resync') {
            if (window.__sfMediaItemsCache && typeof window.__sfMediaItemsCache.clear === 'function') {
                window.__sfMediaItemsCache.clear();
            } else {
                window.__sfMediaItemsCache = new Map();
            }
            lastHomeSignature = null;
            clearHomeRetry();
            overrideStatus.sync_status = 'Synchronisation en cours…';
            try {
                if (typeof window.checkMediaLib === 'function') {
                    window.checkMediaLib(true);
                    // Report the real outcome of the fetch instead of a
                    // fabricated success message.
                    window.setTimeout(function() {
                        var st = userPlaylistLibraryState();
                        var msg = st === 'ready'
                            ? 'Synchronisation réussie ✓'
                            : st === 'empty'
                                ? 'Synchronisée — aucune playlist dans ce compte'
                                : st === 'error'
                                    ? 'Échec de la synchronisation — réessayez'
                                    : 'Synchronisation toujours en cours…';
                        window.__sfRequestSpotifySettings({ sync_status: msg });
                    }, 2500);
                } else {
                    overrideStatus.sync_status = 'Synchronisation indisponible (module bibliothèque absent)';
                }
            } catch (_) {
                overrideStatus.sync_status = 'Échec de la synchronisation — réessayez';
            }
        } else if (key === 'lib_diag') {
            // Temporary diagnostic panel: shows/hides the real step rows. It
            // must never fabricate a state — it only re-renders what the
            // pipeline recorded.
            window.__sfLibDiagExpanded = !window.__sfLibDiagExpanded;
        } else if (key === 'logout') {
            var logoutWidget = document && document.querySelector
                ? document.querySelector('button[data-testid="user-widget-link"], a[data-testid="user-widget-link"]')
                : null;
            var domName = logoutWidget
                ? cleanText(logoutWidget.getAttribute && (logoutWidget.getAttribute('aria-label') || logoutWidget.getAttribute('title')) || '')
                : '';
            var domImg = logoutWidget && typeof logoutWidget.querySelector === 'function' ? logoutWidget.querySelector('img') : null;
            var domAvatar = domImg ? extractImgUrl(domImg) : '';
            loggedOutProfileName = domName || profileNameSent || '';
            loggedOutProfileAvatar = domAvatar || profileAvatarSent || '';
            sawSignedOutDom = false;
            sessionLoggedOut = true;
            profileAvatarSent = '';
            profileNameSent = '';
            greetingSent = '';
            lastGreetingAt = 0;
            lastHomeSignature = null;
            lastPlayerSignature = '';
            window.__sfNativeHomeRowsJson = '';
            window.__sfNativeHomeListText = '';
            window.__sfPlayerPayload = null;
            if (updateTimer) {
                try { window.clearTimeout(updateTimer); } catch (_) {}
                updateTimer = null;
            }
            if (readyRetryTimer) {
                try { window.clearTimeout(readyRetryTimer); } catch (_) {}
                readyRetryTimer = null;
            }
            if (homeRetryTimer) {
                try { window.clearTimeout(homeRetryTimer); } catch (_) {}
                homeRetryTimer = null;
            }
            if (detailRetryTimer) {
                try { window.clearTimeout(detailRetryTimer); } catch (_) {}
                detailRetryTimer = null;
            }
            if (playerFeedTimer) {
                try { window.clearInterval(playerFeedTimer); } catch (_) {}
                playerFeedTimer = null;
            }
            if (window.__sfBridgeDiagTimer) {
                // Contract: logout clears every active interval. The bridge
                // load observer re-arms on the next shell injection.
                try { window.clearInterval(window.__sfBridgeDiagTimer); } catch (_) {}
                window.__sfBridgeDiagTimer = 0;
            }
            endPauseHold();
            if (observer && typeof observer.disconnect === 'function') {
                try { observer.disconnect(); } catch (_) {}
            }
            if (window.__sfSearchCache && typeof window.__sfSearchCache.clear === 'function') {
                window.__sfSearchCache.clear();
            }
            if (window.__sfMediaItemsCache && typeof window.__sfMediaItemsCache.clear === 'function') {
                window.__sfMediaItemsCache.clear();
            }
            window.mediaLib = undefined;
            window.__sfMediaLibState = undefined;
            window.__sfMediaLibError = null;
            window.__sfLibDiagExpanded = false;
            if (window.__sfLibDiag && window.__sfLibDiag.lastRun) {
                try {
                    window.__sfLibDiag.steps.length = 0;
                    window.__sfLibDiag.lastRun.status = null;
                    window.__sfLibDiag.lastRun.attempts.length = 0;
                    window.__sfLibDiag.lastRun.token = null;
                    window.__sfLibDiag.lastRun.session = null;
                } catch (_) {}
            }
            mediaLibWarmupRequested = 0;
            mediaLibWarmupCount = 0;
            try {
                if (window.localStorage) window.localStorage.clear();
                if (window.sessionStorage) window.sessionStorage.clear();
            } catch (_) {}
            if (window.AndBridge && typeof window.AndBridge.nativeLogout === 'function') {
                window.AndBridge.nativeLogout();
                return true;
            }
            window.location.assign('https://accounts.spotify.com/logout');
            return true;
        }
        // Every other row (quality, gapless, private session, crossfade, mono,
        // notifications...) is managed by the Spotify account itself: tapping
        // it must not pretend to change anything, only redraw the honest state.

        return window.__sfRequestSpotifySettings(overrideStatus);
    };

    window.__sfNativeUiRefresh = function() {
        if (isSessionBlockedByLogout()) return false;
        runUpdate();
        return true;
    };

    // Called by spotify_bridge.js when the real library fetch reaches a
    // terminal state (ready / empty / error): repaint Accueil immediately
    // instead of waiting for the next DOM mutation, and restart the bounded
    // home retry budget that a previous loading phase may have exhausted.
    window.__sfNotifyMediaLibReady = function() {
        if (isSessionBlockedByLogout()) return false;
        clearHomeRetry();
        lastHomeSignature = null;
        runUpdate();
        return true;
    };

    window.__sfNativeRequestHome = function() {
        if (isSessionBlockedByLogout() || window.location.hostname !== 'open.spotify.com') return false;
        if (!isSpotifyHome()) {
            window.location.assign('https://open.spotify.com/');
            return false;
        }
        clearHomeRetry();
        lastHomeSignature = null;
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

        if (/^spotify:track:/i.test(normalized) && typeof window.playFromUri === 'function') {
            try {
                window.playFromUri(normalized);
                return true;
            } catch (_) {}
        }

        if (/^spotify:search:/i.test(normalized)) {
            var rawSearch = normalized.slice('spotify:search:'.length);
            try {
                rawSearch = decodeURIComponent(rawSearch);
            } catch (_) {}
            return navigateToSearch(rawSearch);
        }

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

    // Opening a playlist, album, artist or show must not depend on the playback
    // bridge: fetchMediaItems only exists there, and when the bridge is absent a
    // tap produced an empty "detail" screen and nothing else. Prefer the bridge
    // (it avoids a page reload), then fall back to real navigation so the shell
    // can stream the detail rows from the page it just loaded.
    var openCollectionTimer = null;

    function cancelPendingCollectionNavigation() {
        if (openCollectionTimer) {
            window.clearTimeout(openCollectionTimer);
            openCollectionTimer = null;
        }
    }

    window.__sfOpenCollection = function(value) {
        var uri = nativeSpotifyUri(value);
        if (!uri) return false;
        cancelPendingCollectionNavigation();
        // Always load the real playlist/album page so the shell can scrape
        // tracklist rows. The playback bridge is optional and often absent.
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                window.fetchMediaItems(uri);
            } catch (_) {}
        }
        return window.__sfNativeOpenUri(uri);
    };

    // Search normally goes through the bridge. Without it the only source of
    // results is Spotify's own search page, so the shell navigates there and
    // harvests the rows afterwards. Live typing is debounced so a burst of
    // keystrokes cannot reload the page on every character.
    var searchNavigateTimer = 0;

    var lastSearchNavigation = { query: '', at: 0 };

    function currentSearchPathQuery() {
        var path = spotifyRoutePath();
        if (path === '/search') return '';
        if (path.indexOf('/search/') !== 0) return '';
        try {
            return decodeURIComponent(path.slice('/search/'.length));
        } catch (_) {
            return path.slice('/search/'.length);
        }
    }

    function navigateToSearch(query) {
        var q = String(query || '').trim().slice(0, 100);
        var now = Date.now();
        if (!q) return false;
        if (searchNavigateTimer) {
            window.clearTimeout(searchNavigateTimer);
            searchNavigateTimer = 0;
        }
        // The search field is re-filled from the URL after each load; without
        // these guards the live search would reload its own page in a loop.
        if (currentSearchPathQuery().toLowerCase() === q.toLowerCase()) return true;
        if (lastSearchNavigation.query === q && now - lastSearchNavigation.at < 4000) return true;
        lastSearchNavigation.query = q;
        lastSearchNavigation.at = now;
        window.location.assign('https://open.spotify.com/search/' + encodeURIComponent(q));
        return true;
    }

    function installSearchFallback() {
        var current = window.searchMediaItems;
        var fallback;
        if (current && current._sfFallback === true) return;
        if (typeof current === 'function') return;
        fallback = function(query) {
            var q = String(query || '').trim();
            if (!q) return;
            if (searchNavigateTimer) window.clearTimeout(searchNavigateTimer);
            searchNavigateTimer = window.setTimeout(function() {
                searchNavigateTimer = 0;
                navigateToSearch(q);
            }, 900);
        };
        fallback._sfFallback = true;
        window.searchMediaItems = fallback;
        window.__sfSubmitSearch = function(query) {
            return navigateToSearch(query);
        };
    }

    // The library tab used to call the bridge's fetchMediaItems directly. Open
    // the real collection page when the bridge is unavailable.
    window.__sfOpenLibrary = function() {
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                window.fetchMediaItems('playlists');
                return true;
            } catch (_) {}
        }
        // The tab always means the playlists filter, so only that route is a
        // no-op; another collection page is reloaded to match the selected chip.
        if (spotifyRoutePath() === '/collection/playlists') return true;
        window.location.assign('https://open.spotify.com/collection/playlists');
        return true;
    };

    // Library filters. The chips used to call fetchMediaItems directly, which
    // only exists in the bridge; without it every chip was a dead button.
    var LIBRARY_CATEGORY_PATHS = {
        playlists: '/collection/playlists',
        albums: '/collection/albums',
        artists: '/collection/artists',
        podcasts: '/collection/podcasts'
    };

    window.__sfOpenLibraryCategory = function(tag) {
        var key = String(tag || '').trim().toLowerCase();
        var target = LIBRARY_CATEGORY_PATHS[key] || '/collection/playlists';
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                window.fetchMediaItems(key || 'playlists');
                return true;
            } catch (_) {}
        }
        var path = spotifyRoutePath();
        if (path === target || path.indexOf(target + '/') === 0) return true;
        window.location.assign('https://open.spotify.com' + target);
        return true;
    };

    // ---- Bundled bridge loader ---------------------------------------------
    // spotify_bridge.js carries every playback guard (explicit pause intent,
    // pause hold, media tracing) plus the Spotify CSS shell. It is ~200 KB, and
    // a single evaluateJavascript call of that size is silently dropped by the
    // WebView on device: the native shell starts, the bridge never does, and a
    // pause can then jump to another track without any trace. The asset is
    // fetched through AndBridge.readBundledAsset and executed here, trying each
    // strategy until the bridge reports that it started.
    var bridgeLoadAttempts = 0;
    var bridgeRetryTimer = null;
    var bridgeBlobUrl = null;
    var bridgeCspListenerAttached = false;

    function bridgeHasStarted() {
        return window.__sfMelodixBridgeStarted === true;
    }

    function recordBridgeFailure(stage, error) {
        var message = sanitizeDiagnostic(error);
        window.__sfBridgeLastError = sanitizeDiagnostic(stage + (message ? ': ' + message : ''));
        // Startup must announce its failures on the native journal: the
        // state fields above are only readable through the very channel that
        // just failed. Stage only (never the error text) keeps secrets out.
        try {
            var announce = window.AndBridge;
            if (announce && typeof announce.logDiagEvent === 'function') {
                announce.logDiagEvent('js-bridge err ' + String(stage || 'unknown'));
            }
        } catch (_) {}
    }

    function sameOriginBridgeSrc() {
        var origin = (window.location && window.location.origin) || 'https://open.spotify.com';
        return origin + '/__melodix__/spotify_bridge.js';
    }

    var BRIDGE_STAGE_RANK = {
        start: 0,
        'inject-src': 1,
        'src-pending': 2,
        'asset-response-created': 3,
        'script-load': 4,
        'script-error': 4,
        'prefix-only': 4,
        'script-exec-error': 4,
        'iife-throw': 4,
        'bridge-entered': 5,
        'bridge-initialized': 6,
        'home-initialized': 7,
        'native-src': 3
    };

    function setBridgeLoadStage(stage) {
        var next = String(stage || '');
        var current = typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage : '';
        var currentRank = BRIDGE_STAGE_RANK[current];
        var nextRank = BRIDGE_STAGE_RANK[next];
        if (typeof currentRank === 'number' && typeof nextRank === 'number' && nextRank < currentRank) {
            return;
        }
        window.__sfBridgeLoadStage = next;
    }

    function attachBridgeScriptEvents(node, src) {
        node.onload = function() {
            if (window.__sfBridgeEntered === true) return;
            if (window.__sfBridgePrefixExec === true) {
                if (!window.__sfBridgeLastError) {
                    window.__sfBridgeLastError = 'prefix-only: iife-not-entered';
                }
                setBridgeLoadStage('prefix-only');
                return;
            }
            setBridgeLoadStage('script-load');
        };
        node.onerror = function() {
            recordBridgeFailure('script-error', 'load-failed');
            setBridgeLoadStage('script-error');
        };
        if (!window.__sfBridgeErrorHooked) {
            window.__sfBridgeErrorHooked = true;
            try {
                window.addEventListener('error', function(event) {
                    var file = String(event && event.filename || '');
                    if (file.indexOf('spotify_bridge.js') < 0 && file.indexOf('__melodix__') < 0) return;
                    var name = String(event && event.message || 'error').slice(0, 120);
                    var line = event && event.lineno ? String(event.lineno) : '0';
                    if (!window.__sfBridgeLastError) {
                        window.__sfBridgeLastError = sanitizeDiagnostic('exec-error: ' + name + ':L' + line);
                    }
                    if (window.__sfBridgeEntered !== true) setBridgeLoadStage('script-exec-error');
                }, true);
            } catch (_) {}
        }
    }

    function injectSameOriginBridge() {
        var node;
        var src = sameOriginBridgeSrc();
        window.__sfBridgeExecMode = 'same-origin-src';
        node = document.querySelector('script[data-sf-melodix-bridge="1"]');
        if (node) {
            if (!node.onload) attachBridgeScriptEvents(node, src);
            if (!window.__sfBridgeLoadStage || window.__sfBridgeLoadStage === 'inject-src') {
                setBridgeLoadStage('src-pending');
            }
            return true;
        }
        setBridgeLoadStage('inject-src');
        node = document.createElement('script');
        node.async = false;
        node.defer = false;
        node.type = 'text/javascript';
        node.charset = 'utf-8';
        node.setAttribute('data-sf-melodix-bridge', '1');
        attachBridgeScriptEvents(node, src);
        node.src = src;
        (document.head || document.documentElement).appendChild(node);
        window.__sfBridgeInjected = (window.__sfBridgeInjected || 0) + 1;
        return true;
    }

    function loadBundledBridge(name) {
        window.__sfLoaderCalls = (window.__sfLoaderCalls || 0) + 1;
        if (bridgeHasStarted()) return true;
        if (!window.__sfBridgeLoadStage) setBridgeLoadStage('start');
        try {
            if (window.AndBridge && typeof window.AndBridge.readBundledAsset === 'function' &&
                !Number.isInteger(window.__sfBridgeSourceChars)) {
                window.__sfBridgeSourceChars = String(window.AndBridge.readBundledAsset(name) || '').length;
                window.__sfBridgeBytes = window.__sfBridgeSourceChars;
            }
        } catch (error) {
            recordBridgeFailure('read-asset', error);
        }
        // Spotify's CSP is script-src-elem without unsafe-inline. Inline
        // textContent, eval, Function and blob: URLs are rejected
        // (bridgeCspViolation "script-src-elem inline"). A same-origin
        // <script src> is served by WebViewClient.shouldInterceptRequest.
        try {
            return injectSameOriginBridge();
        } catch (error) {
            recordBridgeFailure('src-script', error);
        }
        try {
            if (window.AndBridge && typeof window.AndBridge.injectBundledAsset === 'function') {
                window.AndBridge.injectBundledAsset(name);
                window.__sfBridgeExecMode = window.__sfBridgeExecMode || 'native-src';
                setBridgeLoadStage('native-src');
            }
        } catch (error) {
            recordBridgeFailure('native-src', error);
        }
        return false;
    }
    window.__sfLoadBundledBridge = loadBundledBridge;

    // ------------------------------------------------------------------
    // Observabilite temporaire : etat de chargement du bridge pour l'ecran
    // Diagnostic ("Bridge (temporaire)"). LECTURE SEULE des variables
    // ci-dessous : aucune ecriture, aucun effet de bord sur le chargement du
    // bridge, la CSP, la file de commandes, la bibliotheque ou la navigation.
    // Envoi par le canal existant AndBridge.onLibDiagState (DiagCounters.libState).
    // ------------------------------------------------------------------
    function bridgeDiagWatchCopy() {
        try {
            var source = window.__sfBridgeWatch;
            if (!source || typeof source !== 'object') return null;
            var out = {};
            var keys = Object.keys(source).slice(0, 8);
            for (var i = 0; i < keys.length; i += 1) {
                var value = source[keys[i]];
                if (typeof value === 'string') {
                    out[keys[i]] = value.replace(/["\\]/g, ' ').slice(0, 24);
                } else if (typeof value === 'number' || typeof value === 'boolean' || value === null) {
                    out[keys[i]] = value;
                } else {
                    out[keys[i]] = null;
                }
            }
            return out;
        } catch (_) {
            return null;
        }
    }

    function bridgeDiagStateJson() {
        var asText = function (value, max) {
            if (typeof value !== 'string' || !value) return null;
            return sanitizeDiagnostic(value).replace(/["\\]/g, ' ').slice(0, max);
        };
        var asBool = function (value) {
            return value === true ? true : (value === false ? false : null);
        };
        var asInt = function (value) {
            return Number.isInteger(value) ? value : null;
        };
        var chainSlots = [
            asInt(window.__sfDiagTicks),
            asInt(window.__sfDiagPushes),
            asInt(window.__sfDiagSent),
            asInt(window.__sfDiagSendErr),
            asInt(window.__sfLoaderCalls),
            asInt(window.__sfBridgeInjected),
            asInt(window.__sfBridgeStartedSets)
        ];
        var chainStr = chainSlots.every(function (v) { return v === null; })
            ? null
            : chainSlots.map(function (v) {
                return v === null ? '' : String(v);
            }).join('/');
        var obj = {
            stage: typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage : null,
            // Compteurs de la chaine de chargement (c->h) en champ compact
            // "ticks/pushes/sent/sendErr/loaderCalls/bridgeInjected/bridgeStarted" :
            // le canal natif ne garde que 400 caracteres, les compteurs restent
            // alors que les champs elagables soient sacrifices.
            chain: chainStr,
            started: asBool(window.__sfMelodixBridgeStarted),
            entered: asBool(window.__sfBridgeEntered),
            intercepted: asBool(window.__sfBridgeIntercepted),
            assetServed: asBool(window.__sfBridgeAssetServed),
            prefixExec: asBool(window.__sfBridgePrefixExec),
            bytes: asInt(window.__sfBridgeBytes),
            lastError: asText(window.__sfBridgeLastError, 160),
            cspViolation: asText(window.__sfBridgeCspViolation, 120),
            execMode: asText(window.__sfBridgeExecMode, 24),
            recoveryAttempts: asInt(window.__sfNativeUiBridgeRecoveryAttempts),
            watch: bridgeDiagWatchCopy(),
            tagPresent: null
        };
        try {
            obj.tagPresent = !!document.querySelector('script[data-sf-melodix-bridge="1"]');
        } catch (_) {
            obj.tagPresent = null;
        }
        var json = JSON.stringify(obj);
        // Mission bound: 2 Ko. The native channel (DiagCounters.libState) also
        // clips snapshots at 400 chars and keeps only its first part: shrink
        // the values until the whole JSON fits so every field survives the
        // channel and none is cut mid-JSON (absent stays "non recu", never
        // invented).
        if (json.length > 2048) {
            obj.watch = null;
            json = JSON.stringify(obj);
        }
        if (json.length > 400) {
            obj.watch = null;
            obj.lastError = asText(window.__sfBridgeLastError, 80);
            obj.cspViolation = asText(window.__sfBridgeCspViolation, 32);
            json = JSON.stringify(obj);
        }
        if (json.length > 400) {
            obj.lastError = asText(window.__sfBridgeLastError, 24);
            obj.cspViolation = asText(window.__sfBridgeCspViolation, 16);
            obj.stage = typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage.slice(0, 24) : null;
            json = JSON.stringify(obj);
        }
        return json;
    }

    var bridgeDiagLastStage;
    var bridgeDiagLastAt = 0;
    var bridgeDiagOkLogged = false;

    var libPushBlockedLogged = null;
    function markLibPushBlocked(reason) {
        var next = String(reason || '');
        window.__sfLibPushBlocked = next;
        if (next === libPushBlockedLogged) return;
        libPushBlockedLogged = next;
        if (!next) return;
        window.__sfLibPushBlockedCount = (window.__sfLibPushBlockedCount || 0) + 1;
        if (typeof window.__sfLibDiagUpdate === 'function') {
            try {
                window.__sfLibDiagUpdate({ delivered: { pushBlocked: window.__sfLibPushBlockedCount } });
            } catch (_) {}
        }
        // A dead channel must not be a silent one: journal the blocking reason
        // through logDiagEvent when that channel still exists, and always keep
        // it on a window field so recovery can clear it visibly.
        try {
            var announce = window.AndBridge;
            if (announce && typeof announce.logDiagEvent === 'function') {
                announce.logDiagEvent('lib-push blocked ' + next);
            }
        } catch (_) {}
    }
    function pushBridgeDiagState() {
        window.__sfDiagPushes = (window.__sfDiagPushes || 0) + 1;
        try {
            var bridge = window.AndBridge;
            if (!bridge || typeof bridge.onLibDiagState !== 'function') {
                markLibPushBlocked(!bridge ? 'no-bridge' : 'no-method');
                return;
            }
            markLibPushBlocked('');
            bridgeDiagLastAt = Date.now();
            bridgeDiagLastStage = typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage : null;
            bridge.onLibDiagState(bridgeDiagStateJson());
            window.__sfDiagSent = (window.__sfDiagSent || 0) + 1;
            if (!bridgeDiagOkLogged) {
                bridgeDiagOkLogged = true;
                if (typeof bridge.logDiagEvent === 'function') bridge.logDiagEvent('lib-push ok');
            }
            if (typeof window.__sfLibDiagUpdate === 'function') {
                window.__sfLibDiagUpdate({ delivered: { pushOk: window.__sfDiagSent || 1 } });
            }
        } catch (err) {
            window.__sfDiagSendErr = (window.__sfDiagSendErr || 0) + 1;
            if (typeof window.__sfLibDiagUpdate === 'function') {
                try {
                    window.__sfLibDiagUpdate({ delivered: { pushErr: window.__sfDiagSendErr } });
                } catch (_) {}
            }
            try {
                var w = window.AndBridge;
                if (w && typeof w.logDiagEvent === 'function') {
                    var n = (err && err.name) ? String(err.name) : 'unknown';
                    w.logDiagEvent('lib-push err ' + n.slice(0, 40));
                }
            } catch (_) {}
        }
    }

    function startBridgeDiagWatch() {
        if (window.__sfBridgeDiagTimer) return;
        try {
            window.__sfBridgeDiagTimer = window.setInterval(function () {
                window.__sfDiagTicks = (window.__sfDiagTicks || 0) + 1;
                try {
                    var stage = typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage : null;
                    if (stage !== bridgeDiagLastStage) {
                        // A stage change is always reported.
                        pushBridgeDiagState();
                    } else if (Date.now() - bridgeDiagLastAt >= 2000) {
                        // Regular cadence: at least every 2 s.
                        pushBridgeDiagState();
                    }
                } catch (_) {}
            }, 500);
        } catch (_) {}
    }
    startBridgeDiagWatch();
    window.__sfBridgeDiagStateJson = bridgeDiagStateJson;
    window.__sfBridgeDiagPush = pushBridgeDiagState;

    function installBridgeRecovery() {
        var bridge = window.AndBridge;
        if (!bridge) return;
        if (typeof bridge.readBundledAsset !== 'function' && typeof bridge.injectBundledAsset !== 'function') return;

        // A CSP violation explains why an execution strategy was rejected.
        if (!bridgeCspListenerAttached) {
            bridgeCspListenerAttached = true;
            try {
                document.addEventListener('securitypolicyviolation', function(event) {
                    var directive = String(event && (event.effectiveDirective || event.violatedDirective) || '');
                    var blocked = String(event && event.blockedURI || '');
                    window.__sfBridgeCspViolation = (directive + ' ' + blocked).trim().slice(0, 120);
                }, true);
            } catch (_) {}
        }

        function snapshotWatchdog() {
            var node = document.querySelector('script[data-sf-melodix-bridge="1"]');
            window.__sfBridgeWatch = {
                stage: typeof window.__sfBridgeLoadStage === 'string' ? window.__sfBridgeLoadStage : null,
                entered: window.__sfBridgeEntered === true,
                started: window.__sfMelodixBridgeStarted === true,
                tagPresent: !!node,
                srcHost: node && node.src ? String(node.src).slice(0, 80) : null,
                bytes: Number.isInteger(window.__sfBridgeBytes) ? window.__sfBridgeBytes : null,
                error: typeof window.__sfBridgeLastError === 'string'
                    ? window.__sfBridgeLastError.slice(0, 160)
                    : null
            };
        }

        function attempt() {
            bridgeRetryTimer = null;
            if (bridgeHasStarted()) {
                window.__sfNativeUiBridgeRecovered = bridgeLoadAttempts > 0;
                snapshotWatchdog();
                return;
            }
            bridgeLoadAttempts += 1;
            window.__sfNativeUiBridgeRecoveryAttempts = bridgeLoadAttempts;
            if (!document.querySelector('script[data-sf-melodix-bridge="1"]')) {
                loadBundledBridge('spotify_bridge.js');
            }
            snapshotWatchdog();
            if (bridgeHasStarted()) {
                window.__sfNativeUiBridgeRecovered = true;
                return;
            }
            if (bridgeLoadAttempts < 4) {
                bridgeRetryTimer = window.setTimeout(attempt, 2500);
            } else {
                // Terminal startup failure: announce it once on the journal so
                // "no bridge" is never a silent state. Stage only, no payload.
                try {
                    var giveUp = window.AndBridge;
                    if (giveUp && typeof giveUp.logDiagEvent === 'function') {
                        giveUp.logDiagEvent('js-bridge gave-up ' + String(window.__sfBridgeLoadStage || 'unknown'));
                    }
                } catch (_) {}
            }
        }

        if (bridgeHasStarted()) return;
        window.setTimeout(attempt, 1200);
        window.setTimeout(snapshotWatchdog, 8000);
    }

    function install() {
        if (window._sfNativeUiShellListenersAttached) return;
        window._sfNativeUiShellListenersAttached = true;
        window.__sfNativeUiShellReady = true;
        window.playing = false;
        installPlaybackStateGuard();
        installPlayerFeed();
        installBridgeRecovery();
        initialPath = spotifyRoutePath();
        initialScreen = nativeScreenForPath();
        window.__sfNativeUiRoute = initialScreen;

        window.addEventListener('popstate', scheduleUpdate);
        window.addEventListener('hashchange', scheduleUpdate);
        window.addEventListener('load', scheduleUpdate, { once: true });
        document.addEventListener('DOMContentLoaded', scheduleUpdate, { once: true });
        document.addEventListener('visibilitychange', function() {
            if (!shellIsHidden()) scheduleUpdate();
        });

        if (window.MutationObserver && document.documentElement) {
            observer = new window.MutationObserver(function(mutations) {
                if (mutationLooksRelevant(mutations)) scheduleUpdate();
            });
            observer.observe(document.documentElement, {
                childList: true,
                subtree: true
            });
        }

        runUpdate();
        if (document.readyState === 'loading') scheduleReadinessRetry();
    }

    try {
        install();
        window.__sfNativeUiShellCompleted = true;
    } catch (error) {
        recordShellError(error, 'install');
        window.__sfNativeUiShellCompleted = false;
    }
    try {
        if (window.AndBridge && typeof window.AndBridge.logDiagEvent === 'function') {
            // The end marker alone must never prove a successful start: the
            // suffix carries the install() outcome (both still count as
            // "js-shell end" for the native prefix counter).
            window.AndBridge.logDiagEvent('js-shell end ' + (window.__sfNativeUiShellCompleted ? 'ok' : 'install-threw'));
        }
    } catch (_) {}
})();
