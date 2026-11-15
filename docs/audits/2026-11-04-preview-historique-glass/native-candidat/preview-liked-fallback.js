    // Fallback for the native Liked Songs screen only. The protected bridge
    // remains the primary source; no browsing operation controls playback.
    // The token stays in memory and is sent only to this fixed Spotify origin.
    var previewLikedAbort = null;
    function cancelPreviewLiked() {
        if (previewLikedAbort) { try { previewLikedAbort.abort(); } catch (_) {} }
        previewLikedAbort = null;
    }
    function previewFallbackLiked(uri, rawValue, requestId) {
        if (uri !== 'spotify:collection:tracks' || typeof window.fetch !== 'function') return false;
        var token = window.spotAuthToken;
        if (typeof token !== 'string' || !/^Bearer \S+$/.test(token)) return false;
        var controller = typeof window.AbortController === 'function' ? new window.AbortController() : null;
        previewLikedAbort = controller;
        var rows = [], skipped = false, published = false, limit = 50, maxPages = 40;
        function live() {
            return window.__sfNativeCollectionRequest === requestId &&
                window.__sfNativeCollectionUri === uri && window.spotAuthToken === token;
        }
        function publish(status, subtitle) {
            if (!live()) return;
            var payload = rows.slice();
            if (status) payload.push({title:status, subtitle:subtitle || '', settingValue:'Info', uri:''});
            sendNativeUiData('media:' + rawValue, payload);
        }
        function unavailable() {
            if (!live()) return;
            previewLoadState('unavailable');
            if (rows.length) publish('Titres partiellement chargés', 'La suite est momentanément indisponible.');
            else publish('Titres likés indisponibles', 'Spotify n’a pas autorisé ou fourni cette liste.');
        }
        (async function() {
            try {
                for (var page = 0; page < maxPages; page++) {
                    if (!live()) return;
                    var options = {method:'GET', headers:{Authorization:token}, credentials:'omit', redirect:'error'};
                    if (controller) options.signal = controller.signal;
                    var offset = page * limit;
                    var response = await window.fetch('https://api.spotify.com/v1/me/tracks?limit=50&offset=' + offset, options);
                    if (!live()) return;
                    if (!response || !response.ok) { unavailable(); return; }
                    var data = await response.json();
                    if (!live()) return;
                    if (!data || !Array.isArray(data.items) || data.items.length > limit ||
                        !Number.isInteger(data.offset) || data.offset !== offset ||
                        !Number.isInteger(data.total) || data.total < 0 || offset > data.total) {
                        unavailable(); return;
                    }
                    var received = data.items;
                    received.forEach(function(item) {
                        var track = item && item.track;
                        var trackUri = track && typeof track.uri === 'string' ? track.uri : '';
                        var title = track && typeof track.name === 'string' ? track.name.trim() : '';
                        if (!track || !/^spotify:track:[a-z0-9]+$/i.test(trackUri) || !title) { skipped = true; return; }
                        var artists = Array.isArray(track.artists) ? track.artists.map(function(a) {
                            return a && typeof a.name === 'string' ? a.name.trim() : '';
                        }).filter(Boolean).slice(0, 10) : [];
                        var images = track.album && Array.isArray(track.album.images) ? track.album.images : [];
                        var image = images.length && images[0] && typeof images[0].url === 'string' ? safeSpotifyImage(images[0].url) : '';
                        // Explicit restrictions are not playable. Unknown is
                        // retained as the legacy row behavior, not a guarantee.
                        var disabled = track.is_playable === false || !!track.restrictions;
                        rows.push({title:title.slice(0, 120), subtitle:artists.join(', ').slice(0, 160), image:image,
                            uri:disabled ? '' : trackUri, settingValue:disabled ? 'Indisponible' : ''});
                    });
                    var end = offset + received.length;
                    if (end > data.total || (!received.length && end < data.total)) { unavailable(); return; }
                    var done = end >= data.total;
                    if (!done && received.length !== limit) { unavailable(); return; }
                    if (rows.length && (!published || (page + 1) % 4 === 0 || done)) {
                        // Stop the old six-second placeholder but keep this
                        // request alive for subsequent pages and cancellation.
                        window.__sfNativeCollectionLoaded(uri, requestId);
                        published = true;
                        publish(done && skipped ? 'Certains titres sont indisponibles' :
                            (!done ? 'Chargement des titres likés' : ''),
                            !done ? 'Les titres suivants arrivent…' : '');
                    } else if (!rows.length && done && data.total === 0) {
                        window.__sfNativeCollectionLoaded(uri, requestId);
                        publish('Aucun titre liké', 'Cette liste Spotify est vide.');
                    } else if (!rows.length && done) { unavailable(); return; }
                    if (done) return;
                }
                if (live()) publish('Titres partiellement chargés', 'La limite de chargement a été atteinte.');
            } catch (_) { unavailable(); }
            finally { if (previewLikedAbort === controller) previewLikedAbort = null; }
        })();
        return true;
    }
