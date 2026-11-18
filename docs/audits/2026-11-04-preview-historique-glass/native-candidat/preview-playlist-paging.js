    // User-approved (after Preview 1022239): the protected bridge reads only the
    // first 100 tracks of a playlist. Read every page the same way and hand the
    // full list to the bridge's own native callback. Token used as a header only.
    var previewPages = {gen: 0};
    function previewPlaylistPages(uri) {
        if (!/^spotify:playlist:[A-Za-z0-9]+$/.test(String(uri || ''))) return;
        var gen = ++previewPages.gen, all = [], offset = 0, limit = 100, pages = 0;
        var hash = window.spHashes && window.spHashes.fetchPlaylist;
        if (!hash && typeof window.getGqlHash === 'function') try { hash = window.getGqlHash('fetchPlaylist', ''); } catch (_) {}
        if (!/^[a-f0-9]{64}$/i.test(String(hash || ''))) hash = '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763';
        function live() { return gen === previewPages.gen && window.__sfNativeCollectionUri === uri; }
        function deliver() {
            try { if (all.length > limit && live() && window.AndBridge && typeof window.AndBridge.onMediaItemsLoaded === 'function') window.AndBridge.onMediaItemsLoaded(uri, JSON.stringify(all)); } catch (_) {}
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
                    all.push({id: id, name: name, image: sources[0] && sources[0].url || null, browsable: false,
                        artists: Array.isArray(artists) ? artists.map(function(a) { return a && (a.profile && a.profile.name || a.name) || ''; }).filter(Boolean) : []});
                });
                offset += items.length;
                if (offset > limit) deliver();
                if (items.length === limit && (typeof total !== 'number' || offset < total)) page();
                // A late bridge reply would cut the list back to 100: send the full list once more.
                else if (offset > limit) window.setTimeout(deliver, 2500);
            }).catch(function() {}).then(function() { if (deadline) window.clearTimeout(deadline); });
        }
        // Let the bridge's own first page land first; ours then extends it.
        window.setTimeout(page, 1200);
    }
