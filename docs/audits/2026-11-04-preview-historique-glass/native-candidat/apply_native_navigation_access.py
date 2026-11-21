#!/usr/bin/env python3
"""Enable existing native detail/settings actions with bounded race-safe fallback."""
from pathlib import Path
import hashlib,sys
SHA={
 'assets/native_ui_shell.js':'b43ceaa1b99470e6c2d7dfe8fc435ff4ce3978e9b5aa0ea78d3c4e7bff6584ea',
 'assets/spotify_bridge.js':'4affc74e0c893d6191dd0a2a222325f3563d36b7d6c10615d106724c4c67d490',
 'smali/com/melodix/music/MainActivity.smali':'bcc622e3b4b09a0572255c6c5c8d25d12b8d612cb6f0123ea9ccefb10a67ef02',
 'smali/com/melodix/music/NativeSettingsRowFactory.smali':'34481f840ab3316e73a82a375e8c16786c1f47bd32df1ece21c20ab47094127a',
 'smali/com/melodix/music/NativeUiRowFactory.smali':'2491bcf80ddb7813d42114c9e88e7025cdf37282241fa2793210f84264969002',
}
def change(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block '+repr(a[:100]))
 return s.replace(a,b,1)
def prepare(root):
 data={}
 for name,sha in SHA.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected base '+name)
  data[name]=raw.decode('utf8')
 a='smali/com/melodix/music/MainActivity.smali';s=data[a]
 s=change(s,'''    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_click_done''','''    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_click_done''')
 s=change(s,'''    if-nez v1, :native_settings_save_return
    return-void''','''    if-eqz v1, :native_settings_save_return
    return-void''')
 s=change(s,'''    move-result v0
    if-eqz v0, :native_profile_done
    const v0, 0x7f090249''','''    move-result v0
    if-nez v0, :native_profile_done
    const v0, 0x7f090249''')
 s=change(s,'''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;

    # The browse grid''','''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;

    # Leaving detail invalidates its pending JS fallback and stale result.
    const-string v2, "detail"
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :native_collection_cancel_done
    const-string v2, "window.__sfCancelPendingCollection && window.__sfCancelPendingCollection();"
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    :native_collection_cancel_done

    # The browse grid''')
 data[a]=s
 row='smali/com/melodix/music/NativeUiRowFactory.smali';s=data[row]
 s=change(s,'''    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :native_row_return''','''    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_return''')
 s=change(s,'''    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :banner_done''','''    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :banner_done''')
 s=change(s,'''    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-eqz v11, :native_artists_next''','''    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v11
    if-nez v11, :native_artists_next''')
 s=change(s,'''    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :banner_title''','''    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :banner_title''')
 data[row]=s
 settings='smali/com/melodix/music/NativeSettingsRowFactory.smali';s=data[settings]
 for reg,label in [('v9','native_settings_no_avatar'),('v5','native_settings_pill'),('v7','native_settings_return')]:
  s=change(s,'    invoke-virtual {'+reg+'}, Ljava/lang/String;->isEmpty()Z\n    move-result v0\n    if-eqz v0, :'+label,'    invoke-virtual {'+reg+'}, Ljava/lang/String;->isEmpty()Z\n    move-result v0\n    if-nez v0, :'+label)
 s=change(s,'''    const/4 v0, 0x1
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_settings_return
    new-instance v0, Lcom/melodix/music/NativeRowClickListener;''','''    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_settings_return
    const/4 v0, 0x1
    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V
    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V
    new-instance v0, Lcom/melodix/music/NativeRowClickListener;''')
 data[settings]=s
 shell='assets/native_ui_shell.js';s=data[shell]
 s=change(s,'''        if (path !== lastDetailPath) {
            lastDetailPath = path;''','''        // A previous Spotify page may still be visible in the WebView while
        // the native screen is loading a different collection.
        if (window.__sfNativeCollectionUri &&
            nativeSpotifyUri(window.location.href) !== window.__sfNativeCollectionUri) return;
        if (path !== lastDetailPath) {
            lastDetailPath = path;''')
 s=change(s,"        overrideStatus.sync_status = 'Bibliothèque Spotify synchronisée ✓';", "        overrideStatus.sync_status = 'Synchronisation demandée';")
 s=change(s,'''        ];
    }

    window.__sfRequestSpotifySettings = function(overrideStatus) {''','''        ].map(function(row) {
            // These legacy switches only change local flags and do not prove
            // the corresponding Spotify setting actually changed. Do not
            // expose them as functioning controls until integrated and verified.
            var unsupported = /^(audio_quality|normalize_volume|data_saver|gapless|autoplay|shuffle|repeat|explicit|canvas|bg_audio)$/;
            var key = String(row.uri || '').replace(/^spotify:settings:/, '');
            if (key === 'account_info' || key === 'about') row.uri = '';
            if (unsupported.test(key)) {
                row.subtitle = 'Réglage Spotify non disponible dans cette Preview';
                row.settingValue = 'Indisponible';
                row.uri = '';
            }
            return row;
        });
    }

    window.__sfRequestSpotifySettings = function(overrideStatus) {''')
 s=change(s,'''    var openCollectionTimer = null;

    function cancelPendingCollectionNavigation() {
        if (openCollectionTimer) {
            window.clearTimeout(openCollectionTimer);
            openCollectionTimer = null;
        }
    }

    window.__sfOpenCollection = function(value) {
        var uri = nativeSpotifyUri(value);
        var navigated = false;
        if (!uri) return false;
        cancelPendingCollectionNavigation();

        function navigate() {
            if (navigated) return false;
            navigated = true;
            openCollectionTimer = null;
            return window.__sfNativeOpenUri(uri);
        }

        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                window.fetchMediaItems(uri);
                // If the bridge never answers, load the real page instead of
                // leaving the user on an empty screen.
                openCollectionTimer = window.setTimeout(navigate, 6000);
                return true;
            } catch (_) {
                cancelPendingCollectionNavigation();
            }
        }
        return navigate();
    };''','''    var openCollectionTimer = null;
    var pendingCollectionUri = null;
    var nativeCollectionSequence = 0;

    function stopCollectionFallback() {
        if (openCollectionTimer) window.clearTimeout(openCollectionTimer);
        openCollectionTimer = null;
        pendingCollectionUri = null;
    }
    function cancelPendingCollectionNavigation() {
        stopCollectionFallback();
        window.__sfNativeCollectionRequest = null;
        window.__sfNativeCollectionUri = null;
    }
    window.__sfCancelPendingCollection = cancelPendingCollectionNavigation;
    window.__sfNativeCollectionLoaded = function(uri, requestId) {
        if (requestId && requestId === window.__sfNativeCollectionRequest && uri === pendingCollectionUri) {
            stopCollectionFallback();
        }
    };

    window.__sfOpenCollection = function(value) {
        var uri = nativeSpotifyUri(value);
        var requestId;
        if (!uri) return false;
        cancelPendingCollectionNavigation();
        requestId = ++nativeCollectionSequence;
        window.__sfNativeCollectionRequest = requestId;
        window.__sfNativeCollectionUri = uri;
        pendingCollectionUri = uri;

        function navigate() {
            if (window.__sfNativeCollectionRequest !== requestId) return false;
            stopCollectionFallback();
            return window.__sfNativeOpenUri(uri);
        }
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                // Arm first: the bridge may synchronously serve its cache.
                openCollectionTimer = window.setTimeout(navigate, 6000);
                Promise.resolve(window.fetchMediaItems(uri, requestId, String(value))).catch(function() {});
                return true;
            } catch (_) {
                stopCollectionFallback();
            }
        }
        return navigate();
    };''')
 s=change(s,'''    window.__sfNativeOpenUri = function(value) {
        var raw''','''    window.__sfNativeOpenUri = function(value) {
        cancelPendingCollectionNavigation();
        var raw''')
 data[shell]=s
 bridge='assets/spotify_bridge.js';s=data[bridge]
 s=change(s,'''    async function fetchMediaItems(parentId) {
        try {''','''    async function fetchMediaItems(parentId, nativeRequestId, nativeCallbackId) {
        // Optional ID is used only by the native shell. Calls from other
        // clients keep their existing behavior.
        let nativeToken = window.spotAuthToken;
        function isCurrentNativeRequest() {
            return !nativeRequestId || (window.__sfNativeCollectionRequest === nativeRequestId &&
                (!nativeToken || window.spotAuthToken === nativeToken));
        }
        function publishNativeCollection(items) {
            if (!isCurrentNativeRequest()) return false;
            if (nativeRequestId && Array.isArray(items) && items.length &&
                typeof window.__sfNativeCollectionLoaded === 'function') {
                try { window.__sfNativeCollectionLoaded(parentId, nativeRequestId); } catch (_) {}
            }
            // Keep media-browser fields and add the fields expected by the
            // native row renderer; do not alter external media-browser calls.
            const rows = nativeRequestId ? items.map(item => ({...item,
                title: item.title || item.name || '', uri: item.uri || item.id || ''
            })) : items;
            AndBridge.onMediaItemsLoaded(nativeCallbackId || parentId, JSON.stringify(rows));
            return true;
        }
        try {''')
 s=change(s,'''                rememberCurrentTracks(parentId, cachedTracks);
                AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(cachedTracks));''','''                if (!isCurrentNativeRequest()) return;
                rememberCurrentTracks(parentId, cachedTracks);
                publishNativeCollection(cachedTracks);''')
 s=change(s,'''            await ensureAuthToken();
            // 1. Root categories''','''            await ensureAuthToken();
            if (!isCurrentNativeRequest()) return;
            if (!nativeToken) nativeToken = window.spotAuthToken;
            // 1. Root categories''')
 # Liked, playlist, album and artist each set playback context only if this
 # native request still owns the selected detail screen.
 old='rememberCurrentTracks(parentId, tracks);';new='rememberCurrentTracks(parentId, tracks);'
 # Guard before writing cache as well as playback context; late data must not
 # populate a cache belonging to a different account or a superseded request.
 cache='                if (tracks.length > 0) window.__sfMediaItemsCache.set(parentId, tracks);'
 if s.count(cache)!=3:raise ValueError('unexpected track cache calls')
 s=s.replace(cache,'                if (!isCurrentNativeRequest()) return;\n'+cache)
 s=change(s,'            rememberCurrentTracks(parentId, tracks);\n            console.log(`[Spotifuck] Returning','            if (!isCurrentNativeRequest()) return;\n            rememberCurrentTracks(parentId, tracks);\n            console.log(`[Spotifuck] Returning')
 # The four call sites have two indentation levels; replacement matches their
 # final spaces, preserving the caller's indentation around the inserted guard.
 if s.count(old)!=4:raise ValueError('unexpected track context calls')
 # Deliver rows through a guarded callback, including cached and show results.
 for value in ('tracks','episodes'):
  old='AndBridge.onMediaItemsLoaded(parentId, JSON.stringify('+value+'));'
  count=s.count(old);expected=4 if value=='tracks' else 1
  if count!=expected:raise ValueError('unexpected item callbacks '+value+': '+str(count))
  s=s.replace(old,'publishNativeCollection('+value+');')
 s=change(s,'''            AndBridge.onMediaItemsLoaded(parentId, "[]");
        } catch (e) {
            console.error("Error loading media items for " + parentId, e);
            AndBridge.onMediaItemsLoaded(parentId, "[]");''','''            if (isCurrentNativeRequest()) AndBridge.onMediaItemsLoaded(parentId, "[]");
        } catch (e) {
            console.error("Error loading media items for " + parentId, e);
            if (isCurrentNativeRequest()) AndBridge.onMediaItemsLoaded(parentId, "[]");''')
 data[bridge]=s
 return data
if __name__=='__main__':
 root=Path(sys.argv[1]);files=prepare(root)
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied native navigation access:',root)
