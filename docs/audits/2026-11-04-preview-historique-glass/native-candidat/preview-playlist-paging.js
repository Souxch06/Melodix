    // User-approved (after Preview 1022239): the protected bridge reads only the
    // first 100 tracks of a playlist (sometimes fewer). Read every page the same way and hand the
    // full list to the bridge's own native callback. Token used as a header only.
    var previewPages = {gen: 0, full: {}, last: {}};
    // User report (1022315): a late, shorter bridge reply still cut the list to 26 for up to 15 s.
    // Guard the native callback: for a playlist whose full list is known, a shorter reply is
    // replaced by the full list at once. The bridge object itself is untouched (proxy around it).
    (function guardBridge() {
        var real = window.AndBridge;
        if (!real || real.__sfPagingGuard || typeof window.Proxy !== 'function') return;
        try {
            var guarded = function(uri, json) {
                var full = previewPages.full[uri];
                // Known full list: every reply for this playlist shows it, so rows never jump (1022324/1022326).
                if (full && full.length) json = JSON.stringify(full);
                // User report (1022336): the list went empty. An empty reply never replaces shown rows.
                else if (/^\s*\[\s*\]\s*$/.test(String(json)) && previewPages.last[uri] && previewPages.last[uri].length > 2) return;
                previewPages.last[uri] = json;
                return real.onMediaItemsLoaded(uri, json);
            };
            window.AndBridge = new window.Proxy(real, {get: function(t, k) {
                if (k === '__sfPagingGuard') return true;
                if (k === 'onMediaItemsLoaded') return guarded;
                var v = t[k]; return typeof v === 'function' ? v.bind(t) : v;
            }});
        } catch (_) {}
    })();
    function previewPlaylistPages(uri) {
        if (!/^spotify:playlist:[A-Za-z0-9]+$/.test(String(uri || ''))) return;
        var gen = ++previewPages.gen, all = [], offset = 0, limit = 100, pages = 0;
        var hash = window.spHashes && window.spHashes.fetchPlaylist;
        if (!hash && typeof window.getGqlHash === 'function') try { hash = window.getGqlHash('fetchPlaylist', ''); } catch (_) {}
        if (!/^[a-f0-9]{64}$/i.test(String(hash || ''))) hash = '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763';
        function live() { return gen === previewPages.gen && window.__sfNativeCollectionUri === uri; }
        function deliver() {
            if (all.length && live()) previewPages.full[uri] = all;
            // Already showing this exact list: a resend would only redraw it (blink).
            if (previewPages.last[uri] === JSON.stringify(all)) return;
            try { if (all.length && live() && window.AndBridge && typeof window.AndBridge.onMediaItemsLoaded === 'function') window.AndBridge.onMediaItemsLoaded(uri, JSON.stringify(all)); } catch (_) {}
        }
        function page() {
            var token = window.spotAuthToken;
            if (!live() || !token || ++pages > 50) return;
            var headers = {'Authorization': token, 'Content-Type': 'application/json;charset=UTF-8', 'app-platform': 'WebPlayer', 'spotify-app-version': '1.2.40.0'};
            if (window.spotCliToken) headers['Client-Token'] = window.spotCliToken;
            var deadline, controller = typeof window.AbortController === 'function' ? new window.AbortController() : null;
            var opts = {method: 'POST', mode: 'cors', credentials: 'include', headers: headers,
                body: JSON.stringify({variables: {uri: uri, offset: offset, limit: limit, enableWatchFeedEntrypoint: false}, operationName: 'fetchPlaylist', extensions: {persistedQuery: {version: 1, sha256Hash: hash}}})};
            if (controller) opts.signal = controller.signal;
            Promise.race([
                window.fetch('https://api-partner.spotify.com/pathfinder/v2/query', opts).then(function(r) { if (!r || !r.ok) throw Error('unavailable'); return r.json(); }),
                new Promise(function(_, reject) { deadline = window.setTimeout(function() { if (controller) try { controller.abort(); } catch (_) {} reject(Error('timeout')); }, 10000); })
            ]).then(function(json) {
                if (!live()) return;
                if (!json || (json.errors && (!Array.isArray(json.errors) || json.errors.length))) return;
                var data = json.data || {}, obj = data.playlistV2 || data.playlist || data.playlistUnion, content = obj && (obj.content || obj.tracks || obj);
                var items = content && (content.items || obj.items), total = content && content.totalCount;
                if (!Array.isArray(items) || items.length > limit) return;
                items.forEach(function(elem) {
                    var wrapper = elem && (elem.itemV2 || elem.item), track = wrapper && wrapper.data || elem && elem.track || wrapper || elem;
                    var id = track && (track.uri || track._uri || (track.id && 'spotify:track:' + track.id)), name = track && (track.name || track.title);
                    if (!/^spotify:track:[A-Za-z0-9]+$/.test(String(id || '')) || typeof name !== 'string' || !name.trim()) return;
                    var artists = track.artists && (track.artists.items || track.artists), album = track.albumOfTrack || track.album || {};
                    var sources = album.coverArt && album.coverArt.sources || album.images || [];
                    var names = Array.isArray(artists) ? artists.map(function(a) { return a && (a.profile && a.profile.name || a.name) || ''; }).filter(Boolean) : [];
                    // Like Spotify: each row shows its length ("Artist • 3:24"), same format as the DOM rows.
                    var ms = track.trackDuration && track.trackDuration.totalMilliseconds || track.duration && (track.duration.totalMilliseconds || track.duration_ms) || track.duration_ms;
                    if (typeof ms === 'number' && ms > 0 && names.length) {
                        var t = Math.round(ms / 1000), h = Math.floor(t / 3600), m = Math.floor(t / 60) % 60, sec = t % 60;
                        names[names.length - 1] += ' • ' + (h ? h + ':' + (m < 10 ? '0' : '') + m : m) + ':' + (sec < 10 ? '0' : '') + sec;
                    }
                    all.push({id: id, name: name, image: sources[0] && sources[0].url || null, browsable: false, artists: names});
                });
                offset += items.length;
                if (items.length === limit && (typeof total !== 'number' || offset < total)) { if (offset > limit) deliver(); page(); }
                // Complete list (any size: the bridge can also stop short of 100, e.g. 26 of 60).
                // Late bridge replies cut it back (phone 1022277: 48 shown, then 26, reply ~90 s late):
                // keep re-sending the full list while this playlist stays open.
                // User report (1022308): cut back to 26 after the last fixed resend; resend every 15 s while open.
                else { deliver(); [2500, 6000, 12000].forEach(function(ms) { window.setTimeout(deliver, ms); });
                    (function keep() { window.setTimeout(function() { if (!live()) return; deliver(); keep(); }, 15000); })(); }
            }).catch(function() {}).then(function() { if (deadline) window.clearTimeout(deadline); });
        }
        // Start at once: late bridge replies are re-covered by the repeated resends above.
        window.setTimeout(page, 0);
    }
