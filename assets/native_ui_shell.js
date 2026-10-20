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
    var lastMediaActiveAt = 0;

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
            var row = {
                title: title,
                subtitle: subtitle,
                section: section,
                image: safeSpotifyImage(rawImage),
                uri: nativeSpotifyUri(rawUri)
            };
            if (item && typeof item.settingValue === 'string' && item.settingValue) {
                row.settingValue = item.settingValue;
            }
            return row;
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
            ['playlists', 'Vos playlists'],
            ['albums', 'Albums enregistrés'],
            ['artists', 'Artistes suivis'],
            ['podcasts', 'Podcasts']
        ];
        var seen = new Set();
        var userRows = [];
        var spotifyRows = [];
        var sidebar;

        if (!library && !mediaLibWarmupRequested && typeof window.checkMediaLib === 'function') {
            mediaLibWarmupRequested = true;
            try {
                window.checkMediaLib();
            } catch (_) {}
        }

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
                    if (!img && (title === 'Liked Songs' || /collection/i.test(uri))) {
                        img = 'https://misc.scdn.co/liked-songs/liked-songs-640.png';
                    }
                    if (!uri || !title || seen.has(uri) || userRows.length >= 12) return;
                    seen.add(uri);
                    userRows.push({
                        title: title,
                        subtitle: subtitle,
                        section: group[1],
                        image: img,
                        uri: uri
                    });
                });
            });
        }

        if (userRows.length < 12 && document && typeof document.querySelector === 'function') {
            sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
            if (sidebar && typeof sidebar.querySelectorAll === 'function') {
                collectHomeRows(sidebar).forEach(function(row) {
                    var img = row.image;
                    if (!row.uri || !row.title || seen.has(row.uri) || userRows.length >= 12) return;
                    if (!img && /collection/i.test(row.uri)) {
                        img = 'https://misc.scdn.co/liked-songs/liked-songs-640.png';
                    }
                    seen.add(row.uri);
                    userRows.push({
                        title: row.title,
                        subtitle: row.subtitle,
                        section: 'Vos playlists',
                        image: img,
                        uri: row.uri
                    });
                });
            }
        }

        rows.forEach(function(row) {
            if (!row || !row.uri || !row.title || seen.has(row.uri)) return;
            seen.add(row.uri);
            spotifyRows.push({
                title: row.title,
                subtitle: row.subtitle,
                section: row.section || (userRows.length > 0 ? 'Sélections Spotify' : ''),
                image: row.image,
                uri: row.uri
            });
        });

        return userRows.concat(spotifyRows);
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

    function runUpdate() {
        var mainView;
        if (window.location.hostname !== 'open.spotify.com') return;
        try {
            installPlaybackStateGuard();
            mainView = document.querySelector('#main-view');
            if (mainView) {
                notifyNativeUiReady(mainView);
                detectSpotifyProfile();
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

    var SETTINGS_STORAGE_KEY = 'melodix_spotify_settings_v1';
    var AUDIO_QUALITIES = [
        'Très élevée (320 kbit/s)',
        'Élevée (160 kbit/s)',
        'Normale (96 kbit/s)',
        'Automatique'
    ];
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
            if (avatar && avatar !== profileAvatarSent && window.AndBridge && typeof window.AndBridge.onNativeProfileImage === 'function') {
                profileAvatarSent = avatar;
                window.AndBridge.onNativeProfileImage(avatar);
            }
            if (name && name !== profileNameSent && window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function' && isSpotifyHome()) {
                profileNameSent = name;
                var first = name.split(/\s+/)[0] || name;
                var greeting = greetingPrefix() + ', ' + first;
                if (greeting !== greetingSent || (Date.now() - lastGreetingAt) > 8000) {
                    greetingSent = greeting;
                    lastGreetingAt = Date.now();
                    window.AndBridge.onNativeUiData('screen-title', greeting);
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

    function buildSpotifySettingsRows(overrideStatus) {
        var state = getSpotifySettingsState();
        var profile = detectSpotifyProfile();
        var accountName = profile.name ? ('Compte : ' + profile.name) : 'Compte Spotify connecté';
        if (overrideStatus && overrideStatus.cache_status) state.cache_status = overrideStatus.cache_status;
        if (overrideStatus && overrideStatus.sync_status) state.sync_status = overrideStatus.sync_status;

        return [
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
                title: 'Se déconnecter de Spotify',
                subtitle: 'Fermer la session actuelle ou changer de compte Spotify',
                image: '',
                uri: 'spotify:settings:logout',
                settingValue: 'Déconnexion'
            },
            {
                section: 'Qualité sonore',
                title: 'Qualité du streaming audio',
                subtitle: 'Débit de lecture en Wi-Fi et données mobiles (appuyez pour changer)',
                image: '',
                uri: 'spotify:settings:audio_quality',
                settingValue: state.audio_quality
            },
            {
                section: 'Qualité sonore',
                title: 'Normaliser le volume',
                subtitle: 'Appliquer le même niveau sonore à tous les titres',
                image: '',
                uri: 'spotify:settings:normalize_volume',
                settingValue: state.normalize_volume ? 'ON' : 'OFF'
            },
            {
                section: 'Qualité sonore',
                title: 'Économiseur de données',
                subtitle: 'Réduire la consommation réseau et optimiser les pochettes',
                image: '',
                uri: 'spotify:settings:data_saver',
                settingValue: state.data_saver ? 'ON' : 'OFF'
            },
            {
                section: 'Lecture',
                title: 'Lecture sans blanc (Gapless)',
                subtitle: 'Enchaîner les morceaux de manière fluide sans coupure',
                image: '',
                uri: 'spotify:settings:gapless',
                settingValue: state.gapless ? 'ON' : 'OFF'
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
                title: 'Contenu explicite',
                subtitle: 'Autoriser la lecture des titres marqués du badge Explicit',
                image: '',
                uri: 'spotify:settings:explicit',
                settingValue: state.explicit ? 'ON' : 'OFF'
            },
            {
                section: 'Vidéos et Arrière-plan',
                title: 'Canvas (visuels en boucle)',
                subtitle: 'Afficher les courtes vidéos animées sur les morceaux compatibles',
                image: '',
                uri: 'spotify:settings:canvas',
                settingValue: state.canvas ? 'ON' : 'OFF'
            },
            {
                section: 'Vidéos et Arrière-plan',
                title: 'Lecture en arrière-plan',
                subtitle: 'Maintenir le moteur audio actif lorsque l’écran est verrouillé',
                image: '',
                uri: 'spotify:settings:bg_audio',
                settingValue: state.bg_audio ? 'ON' : 'OFF'
            },
            {
                section: 'Stockage et Bibliothèque',
                title: 'Vider le cache de l’application',
                subtitle: state.cache_status,
                image: '',
                uri: 'spotify:settings:clear_cache',
                settingValue: 'Vider'
            },
            {
                section: 'Stockage et Bibliothèque',
                title: 'Synchroniser la bibliothèque Spotify',
                subtitle: state.sync_status,
                image: '',
                uri: 'spotify:settings:resync',
                settingValue: 'Actualiser'
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
    }

    window.__sfRequestSpotifySettings = function(overrideStatus) {
        var rows = buildSpotifySettingsRows(overrideStatus);
        return sendNativeUiData('settings', rows);
    };

    window.__sfToggleSpotifySetting = function(uri) {
        var key = String(uri || '').replace(/^spotify:settings:/i, '').trim();
        var state = getSpotifySettingsState();
        var overrideStatus = {};

        if (key === 'audio_quality') {
            var idx = AUDIO_QUALITIES.indexOf(state.audio_quality);
            state.audio_quality = AUDIO_QUALITIES[(idx + 1) % AUDIO_QUALITIES.length];
            saveSpotifySettingsState(state);
        } else if (key === 'normalize_volume') {
            state.normalize_volume = !state.normalize_volume;
            saveSpotifySettingsState(state);
        } else if (key === 'data_saver') {
            state.data_saver = !state.data_saver;
            if (state.data_saver) state.canvas = false;
            saveSpotifySettingsState(state);
            try {
                if (window.AndBridge && typeof window.AndBridge.setCanvasDisabled === 'function') {
                    window.AndBridge.setCanvasDisabled(!state.canvas);
                }
            } catch (_) {}
        } else if (key === 'gapless') {
            state.gapless = !state.gapless;
            saveSpotifySettingsState(state);
        } else if (key === 'autoplay') {
            state.autoplay = !state.autoplay;
            if (window.SF_CONFIG) {
                window.SF_CONFIG.autoPlayMode = state.autoplay ? 'permanent' : 'disabled';
            }
            saveSpotifySettingsState(state);
        } else if (key === 'shuffle') {
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
        } else if (key === 'explicit') {
            state.explicit = !state.explicit;
            saveSpotifySettingsState(state);
        } else if (key === 'canvas') {
            state.canvas = !state.canvas;
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
            try {
                if (typeof window.checkMediaLib === 'function') window.checkMediaLib();
            } catch (_) {}
            overrideStatus.sync_status = 'Bibliothèque Spotify synchronisée ✓';
        } else if (key === 'logout') {
            try {
                if (window.localStorage) window.localStorage.clear();
                if (window.sessionStorage) window.sessionStorage.clear();
            } catch (_) {}
            window.location.assign('https://accounts.spotify.com/logout');
            return true;
        }

        return window.__sfRequestSpotifySettings(overrideStatus);
    };

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

        if (/^spotify:track:/i.test(normalized) && typeof window.playFromUri === 'function') {
            try {
                window.playFromUri(normalized);
                return true;
            } catch (_) {}
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

    function install() {
        if (window._sfNativeUiShellListenersAttached) return;
        window._sfNativeUiShellListenersAttached = true;
        window.__sfNativeUiShellReady = true;
        window.playing = false;
        installPlaybackStateGuard();
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
                subtree: true
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
