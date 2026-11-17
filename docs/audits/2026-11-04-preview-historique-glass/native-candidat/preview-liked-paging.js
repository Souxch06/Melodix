    // Native liked collection: use the same Spotify operation as the protected
    // bridge, but paginate on each explicit open instead of using its shared,
    // account-unscoped first-page cache. Never controls playback.
    // A partially initialised bridge may have already exposed a valid session
    // in memory. The liked reader does not need the bridge's fetchMediaItems.
    // Never read a token from storage or expose it to diagnostics here.
    function previewLikedSessionReady() {
        try { return typeof window.spotAuthToken === 'string' && /^Bearer \S+$/.test(window.spotAuthToken); }
        catch (_) { return false; }
    }
    var previewLikedController = null;
    function cancelPreviewLikedRequest() {
        if (previewLikedController) { try { previewLikedController.abort(); } catch (_) {} }
        previewLikedController = null;
    }
    async function previewLoadLiked(rawValue, requestId, active, failed) {
        var token = window.spotAuthToken;
        if (!token && typeof window.ensureAuthToken === 'function') {
            try { await window.ensureAuthToken(); } catch (_) {}
            token = window.spotAuthToken;
        }
        function live() { return active() && !!token && window.spotAuthToken === token; }
        if (!live() || !/^Bearer \S+$/.test(String(token || ''))) { if (active()) failed('failed'); return; }
        var hash = window.spHashes && window.spHashes.fetchLibraryTracks;
        if (!hash) { try { hash = window.localStorage.getItem('sp_hash_fetchLibraryTracks'); } catch (_) {} }
        if (!/^[a-f0-9]{64}$/i.test(String(hash || ''))) hash = '087278b20b743578a6262c2b0b4bcd20d879c503cc359a2285baf083ef944240';
        var controller = typeof window.AbortController === 'function' ? new window.AbortController() : null;
        previewLikedController = controller;
        var rows = [], tracks = [], offset = 0, total = null, previous = '', skipped = false;
        var limit = 50, maxPages = 125, uri = 'spotify:collection:tracks';
        function publish(message, subtitle) {
            if (!live()) return;
            // Keep the bridge's playback context aligned with the observed
            // current-session rows, including partial results. Never publish a
            // previous account's cached queue alongside new clickable rows.
            if (rows.length || (message === 'Aucun titre liké')) {
                window.likedSongsCache = tracks.slice();
                if (tracks.length) {
                    window.__sfCurrentContextUri = uri;
                    window.__sfCurrentTrackUris = tracks.map(function(t) { return t.id; });
                }
            }
            var data = rows.slice();
            if (message) data.push({title:message, subtitle:subtitle || '', settingValue:'Info', uri:''});
            if (message === 'Titres partiellement chargés') data.push({title:'Réessayer', subtitle:'Une nouvelle tentative', uri:'melodix:retry-collection'});
            window.__sfNativeCollectionLoaded(uri, requestId);
            sendNativeUiData('media:' + rawValue, data);
        }
        function incomplete() {
            if (!live()) return;
            if (!rows.length) { failed('failed'); return; }
            publish('Titres partiellement chargés', 'La suite est indisponible. Réessaie plus tard.');
        }
        try {
            for (var page=0; page<maxPages; page++) {
                if (!live()) return;
                var headers = {'Authorization':token, 'Content-Type':'application/json;charset=UTF-8', 'app-platform':'WebPlayer', 'spotify-app-version':'1.2.40.0'};
                if (window.spotCliToken) headers['Client-Token'] = window.spotCliToken;
                var options = {method:'POST', mode:'cors', credentials:'include', headers:headers,
                    body:JSON.stringify({variables:{offset:offset,limit:limit},operationName:'fetchLibraryTracks',extensions:{persistedQuery:{version:1,sha256Hash:hash}}})};
                if (controller) options.signal=controller.signal;
                var pageTimer;
                var result;
                try {
                    result = await Promise.race([
                        (async function() {
                            var response = await window.fetch('https://api-partner.spotify.com/pathfinder/v2/query',options);
                            return response && response.ok ? {data:await response.json()} : {error:true};
                        })(),
                        new Promise(function(_, reject) { pageTimer=window.setTimeout(function() {
                            if (controller) { try { controller.abort(); } catch (_) {} }
                            reject(new Error('timeout'));
                        }, 8000); })
                    ]);
                } finally { if (pageTimer) window.clearTimeout(pageTimer); }
                if (!live()) return;
                if (!result || result.error) { incomplete(); return; }
                var data = result.data;
                var list = data && data.data && (data.data.me && data.data.me.library && data.data.me.library.tracks || data.data.me && data.data.me.libraryV3 || data.data.libraryTracks || data.data);
                if ((data.errors && (!Array.isArray(data.errors) || data.errors.length)) || !list || !Array.isArray(list.items) || list.items.length > limit) { incomplete(); return; }
                var items = list.items, announced = list.totalCount;
                if (announced === undefined) announced = list.total;
                if (announced !== undefined && (!Number.isSafeInteger(announced) || announced < 0 || offset + items.length > announced || (total !== null && total !== announced))) { incomplete(); return; }
                if (announced !== undefined) total = announced;
                var signature = JSON.stringify(items.map(function(e) { var w=e && (e.track || e.itemV2 || e); var t=w && (w.data || w); return w && (w._uri || w.uri) || t && (t.uri || t.id) || ''; }));
                if (page && items.length && signature === previous) { incomplete(); return; }
                previous = signature;
                items.forEach(function(elem) {
                    var wrap = elem && (elem.track || elem.itemV2 || elem), track = wrap && (wrap.data || wrap);
                    var id = wrap && (wrap._uri || wrap.uri) || track && (track.uri || (track.id && 'spotify:track:' + track.id)) || '';
                    var title = track && (track.name || track.title);
                    if (!/^spotify:track:[a-z0-9]+$/i.test(String(id)) || typeof title !== 'string' || !title.trim()) { skipped=true; return; }
                    var source = track.artists && (track.artists.items || track.artists);
                    var artists = Array.isArray(source) ? source.map(function(a) { return a && (a.profile && a.profile.name || a.name) || ''; }).filter(function(s) {return typeof s === 'string' && s.trim();}).slice(0,10) : [];
                    var album = track.albumOfTrack || track.album || {}, images = album.coverArt && album.coverArt.sources || album.images || [];
                    var image = Array.isArray(images) && images[0] ? safeSpotifyImage(images[0].url) : '';
                    var disabled = track.is_playable === false || !!track.restrictions;
                    rows.push({title:title.trim().slice(0,120),subtitle:artists.join(', ').slice(0,160),image:image,uri:disabled?'':id,settingValue:disabled?'Indisponible':''});
                    if (!disabled) tracks.push({id:id,name:title.trim(),image:image,artists:artists,browsable:false});
                });
                offset += items.length;
                if ((total !== null && offset < total && items.length < limit) || (total !== null && !items.length && offset < total)) { incomplete(); return; }
                var done = total !== null ? offset === total : items.length < limit;
                if (done) {
                    if (!rows.length && total === 0) publish('Aucun titre liké', 'Cette liste Spotify est vide.');
                    else if (!rows.length) incomplete();
                    else publish(skipped ? 'Certains titres sont indisponibles' : total === null ? 'Liste possiblement incomplète' : '', total === null ? 'Spotify n’a pas fourni le nombre total.' : '');
                    return;
                }
                if (rows.length) publish('Chargement des titres', 'Les titres suivants arrivent…');
            }
            incomplete();
        } catch (_) { incomplete(); }
        finally { if (previewLikedController === controller) previewLikedController = null; }
    }
