    // Speculative, first-page-only cache for visible and library playlists.
    // Never call the bridge's fetchMediaItems: it changes playback context and
    // publishes native UI callbacks. No persistent storage or playback actions.
    var previewPrefetch = {token:null, entries:new Map(), attempted:new Set(), timer:0, busy:false, controller:null, activeUri:null, generation:0, readyWait:0, failures:0, halted:false};
    function previewPrefetchSession() {
        var token=currentHomeToken();
        if (previewPrefetch.token !== token) {
            previewPrefetch.generation++;
            if (previewPrefetch.controller) try { previewPrefetch.controller.abort(); } catch (_) {}
            previewPrefetch.token=token; previewPrefetch.entries.clear(); previewPrefetch.attempted.clear();
            previewPrefetch.controller=null; previewPrefetch.activeUri=null; previewPrefetch.busy=false; previewPrefetch.readyWait=0; previewPrefetch.failures=0; previewPrefetch.halted=false;
        }
        return token;
    }
    function previewPausePrefetch() {
        if (previewPrefetch.timer) window.clearTimeout(previewPrefetch.timer);
        previewPrefetch.timer=0;
        if (previewPrefetch.controller) try { previewPrefetch.controller.abort(); } catch (_) {}
        // A cancelled foreground-interrupted task did not really fail.
        if (previewPrefetch.activeUri) previewPrefetch.attempted.delete(previewPrefetch.activeUri);
        previewPrefetch.generation++; previewPrefetch.controller=null; previewPrefetch.activeUri=null; previewPrefetch.busy=false;
    }
    function previewPrefetchSnapshot(uri) {
        if (!previewPrefetch.token || !previewPrefetch.entries.has(uri)) return null;
        var token=previewPrefetchSession(), entry=previewPrefetch.entries.get(uri), age=entry && Date.now()-entry.at;
        if (!token || !entry || age < 0 || age > 600000) return null;
        return entry;
    }
    function previewSchedulePrefetch() {
        if (previewPrefetch.timer || previewPrefetch.busy || !isSpotifyHome()) return;
        previewPrefetch.timer=window.setTimeout(function() {
            previewPrefetch.timer=0;
            var token=previewPrefetchSession();
            if (!isSpotifyHome() || window.__sfNativeCollectionUri || typeof window.fetch !== 'function') return;
            if (!token || window.__sfMelodixBridgeCompleted !== true || latestObservedHomeToken !== token) {
                // The bridge or its Home data can arrive after the first frame.
                // Retry for at most 30 seconds, with no network or playback work.
                if (++previewPrefetch.readyWait <= 40) {
                    if (token && latestObservedHomeToken !== token) scheduleUpdate();
                    previewSchedulePrefetch();
                }
                return;
            }
            previewPrefetch.readyWait=0;
            if (previewPrefetch.halted || previewPrefetch.attempted.size >= 24) return;
            // Personal playlists first, including ones not represented by the
            // limited Home shelf. Never trust an unverified account's library.
            var library=[];
            if (typeof window.__sfNativeMediaTokenMatches==='function' && window.__sfNativeMediaTokenMatches() === true &&
                window.mediaLib && Array.isArray(window.mediaLib.playlists)) library=window.mediaLib.playlists.slice(0,100);
            var home=latestObservedHomeRows || [];
            var personal=home.filter(function(r){return r && r.homeOrigin==='library';});
            var candidates=personal.concat(library,home).map(function(r){return nativeSpotifyUri(r && (r.uri || r.id || r.href));})
                .filter(function(uri){return /^spotify:playlist:[a-z0-9]+$/i.test(uri) && !previewPrefetch.attempted.has(uri);});
            if (!candidates.length) return;
            var uri=candidates[0], generation=previewPrefetch.generation;
            previewPrefetch.attempted.add(uri);previewPrefetch.busy=true;previewPrefetch.activeUri=uri;
            var controller=typeof window.AbortController==='function'?new window.AbortController():null;
            previewPrefetch.controller=controller;
            var hash=window.spHashes && window.spHashes.fetchPlaylist;
            if (!hash && typeof window.getGqlHash==='function') try { hash=window.getGqlHash('fetchPlaylist',''); } catch (_) {}
            if (!/^[a-f0-9]{64}$/i.test(String(hash || ''))) hash='346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763';
            var headers={'Authorization':token,'Content-Type':'application/json;charset=UTF-8','app-platform':'WebPlayer','spotify-app-version':'1.2.40.0'};
            if (window.spotCliToken) headers['Client-Token']=window.spotCliToken;
            var opts={method:'POST',mode:'cors',credentials:'include',headers:headers,
                body:JSON.stringify({variables:{uri:uri,offset:0,limit:50,enableWatchFeedEntrypoint:false},operationName:'fetchPlaylist',extensions:{persistedQuery:{version:1,sha256Hash:hash}}})};
            if(controller)opts.signal=controller.signal;
            var deadline;
            Promise.race([
                Promise.resolve().then(function(){if(generation!==previewPrefetch.generation || token!==currentHomeToken() || window.__sfNativeCollectionUri)throw Error('cancelled');return window.fetch('https://api-partner.spotify.com/pathfinder/v2/query',opts);})
                    .then(function(r){if(r && r.status===429 && generation===previewPrefetch.generation)previewPrefetch.halted=true;if(!r || !r.ok)throw Error('unavailable');return r.json();}),
                new Promise(function(_,reject){deadline=window.setTimeout(function(){if(controller)try{controller.abort();}catch(_){}reject(Error('timeout'));},8000);})
            ]).then(function(json){
                if (generation!==previewPrefetch.generation || token!==currentHomeToken() || window.__sfNativeCollectionUri) return;
                if (!json || (json.errors && (!Array.isArray(json.errors) || json.errors.length))) throw Error('invalid response');
                var data=json.data||{}, obj=data.playlistV2||data.playlist||data.playlistUnion, content=obj&&(obj.content||obj.tracks||obj), items=content&&(content.items||obj.items);
                if (!Array.isArray(items) || items.length>50) throw Error('invalid page');
                var rows=[];
                items.forEach(function(elem){
                    var wrapper=elem&&(elem.itemV2||elem.item), track=wrapper&&wrapper.data || elem&&elem.track || wrapper || elem;
                    var id=track&&(track.uri||track._uri||(track.id&&'spotify:track:'+track.id)), name=track&&(track.name||track.title);
                    if (!/^spotify:track:[a-z0-9]+$/i.test(String(id||'')) || typeof name!=='string' || !name.trim() || track.is_playable===false || track.restrictions) return;
                    var artists=track.artists&&(track.artists.items||track.artists), names=Array.isArray(artists)?artists.map(function(a){return a&&(a.profile&&a.profile.name||a.name)||'';}).filter(function(a){return typeof a==='string'&&a.trim();}).slice(0,10):[];
                    rows.push({title:name.trim().slice(0,120),subtitle:names.join(', ').slice(0,160),uri:id});
                });
                if (rows.length) previewPrefetch.entries.set(uri,{at:Date.now(),rows:rows});
                previewPrefetch.failures=0;
            }).catch(function(){
                if(generation===previewPrefetch.generation && ++previewPrefetch.failures>=3)previewPrefetch.halted=true;
            }).then(function(){
                if(deadline)window.clearTimeout(deadline);
                if(generation!==previewPrefetch.generation)return;
                previewPrefetch.busy=false;previewPrefetch.controller=null;previewPrefetch.activeUri=null;
                if(isSpotifyHome() && !window.__sfNativeCollectionUri)previewSchedulePrefetch();
            });
        },750);
    }
