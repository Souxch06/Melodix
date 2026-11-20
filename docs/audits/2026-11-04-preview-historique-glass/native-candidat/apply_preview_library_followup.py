#!/usr/bin/env python3
"""Pin and patch non-protected native shell after the 1022134 feedback fixes."""
import hashlib,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
EXPECTED='ed18ae0b137951fc9b9f1d9fbc65a3f596fad94f38d6f31c8b22c7fa74462984'
HELPER_SHA='8e50e4ef814b37decbf9f0f410fe622797f76b4ddf4df4f450881dab66caff34'
LIKED_SHA='5355232ea283e1081f5051533a73c803a749c0678360fad7d3c88f37fc67fc0a'
SETTINGS_SHA='244388d7b6f84d1b81c91bc20966ef9f62221020702b8fb3fe222cc275c569f8'
PAGING_SHA='bb8f02baec23ebf033389c89e14c41cbe7e0beb0e5b75f48245f7277f4f7dc34'
PREWARM_SHA='382c3558cd9485f835fa22a05fcf710c11588be33cc9431c2a4252d049564963'
PREFETCH_SHA='272a7608bd2e2b0c539a63bd778895aa87f1d2fdc7a3a86c2e13076e63c0fd6d'

def one(text, old, new):
    if text.count(old)!=1: raise ValueError('unexpected anchor: '+old[:90])
    return text.replace(old,new,1)

MELODIX_TRACE = r"""    window.__melodixOpenTrace = window.__melodixOpenTrace || {kind: '', phase: 'none', nav: 0, ready: 0, dom: 0, classified: 0, rendered: 0, tap: 0, first: -1, full: -1, updates: 0};
    function melodixTrace(step, n) {
        try {
            var t = window.__melodixOpenTrace, now = Date.now();
            if (step === 'open') { t.kind = n; t.phase = 'open'; t.nav = 1; t.ready = 0; t.dom = 0; t.classified = 0; t.rendered = 0; t.tap = now; t.first = -1; t.full = -1; t.updates = 0; return; }
            if (!t.tap) return;
            if (step === 'ready') { t.ready++; t.phase = 'ready'; }
            else if (step === 'dom') { t.dom = n; t.phase = n ? 'dom' : 'dom-empty'; }
            else if (step === 'classified') { t.classified = n; t.phase = n ? 'classified' : 'classified-empty'; }
            else if (step === 'rendered') { if (n > t.rendered) { t.rendered = n; t.updates++; if (t.first < 0) t.first = now - t.tap; t.full = now - t.tap; } t.phase = 'rendered'; }
            else if (step === 'unavailable') t.phase = 'unavailable';
        } catch (_) {}
    }
"""

def apply(root):
    p=root/'assets/native_ui_shell.js';raw=p.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=EXPECTED: raise ValueError('unexpected shell input; no changes made')
    helper_bytes=(HERE/'preview-collection-retry.js').read_bytes()
    if hashlib.sha256(helper_bytes).hexdigest()!=HELPER_SHA: raise ValueError('unexpected helper; no changes made')
    liked_bytes=(HERE/'preview-liked-paging.js').read_bytes()
    if hashlib.sha256(liked_bytes).hexdigest()!=LIKED_SHA: raise ValueError('unexpected liked helper; no changes made')
    prefetch_bytes=(HERE/'preview-playlist-prefetch.js').read_bytes()
    if hashlib.sha256(prefetch_bytes).hexdigest()!=PREFETCH_SHA: raise ValueError('unexpected prefetch helper; no changes made')
    prefetch=prefetch_bytes.decode('utf8')
    paging_bytes=(HERE/'preview-playlist-paging.js').read_bytes()
    if hashlib.sha256(paging_bytes).hexdigest()!=PAGING_SHA: raise ValueError('unexpected paging helper; no changes made')
    prefetch=prefetch+'\n'+paging_bytes.decode('utf8')
    settings_bytes=(HERE/'preview-settings.js').read_bytes()
    if hashlib.sha256(settings_bytes).hexdigest()!=SETTINGS_SHA: raise ValueError('unexpected settings helper; no changes made')
    prefetch=prefetch+'\n'+settings_bytes.decode('utf8')
    s=raw.decode('utf8'); helper=liked_bytes.decode('utf8')+'\n'+prefetch+'\n'+helper_bytes.decode('utf8')
    # The upstream recovery loop used to leave a definitively failed script
    # node in place forever. Retry only an explicit resource-load failure;
    # never replace a pending node or re-execute a bridge that has entered.
    # Reset the stage before injection so the new pending node is not mistaken
    # for the old failure on the following bounded retry.
    s=one(s, """        node.onerror = function() {
            recordBridgeFailure('script-error', 'load-failed');""", """        node.onerror = function() {
            node.__sfBridgeResourceFailed = true;
            recordBridgeFailure('script-error', 'load-failed');""")
    s=one(s, """            if (!node.onload) attachBridgeScriptEvents(node, src);
            if (!window.__sfBridgeLoadStage""", """            if (!node.onload) attachBridgeScriptEvents(node, src);
            else if (!node.__sfBridgeErrorObserved) {
                node.__sfBridgeErrorObserved = true;
                node.addEventListener('error', function() { node.__sfBridgeResourceFailed = true; }, {once:true});
            }
            if (!window.__sfBridgeLoadStage""")
    s=one(s, """            if (!document.querySelector('script[data-sf-melodix-bridge=\"1\"]')) {
                loadBundledBridge('spotify_bridge.js');
            }
            snapshotWatchdog();""", """            var tag = document.querySelector('script[data-sf-melodix-bridge=\"1\"]');
            if (tag && tag.__sfBridgeResourceFailed === true && window.__sfBridgeEntered !== true) {
                tag.remove();
                tag = null;
                window.__sfBridgeLoadStage = 'start';
            }
            if (!tag) loadBundledBridge('spotify_bridge.js');
            snapshotWatchdog();""")
    # Loading is done by the same-origin script response below, not by this
    # diagnostic getter. Avoid synchronously marshalling the entire 200+ KB
    # protected bridge through the JavaScript interface just to count chars.
    # The existing served-byte diagnostic is populated by NativeBridgeAsset;
    # unknown source-character counts remain unknown rather than fabricated.
    s=one(s, """        try {
            if (window.AndBridge && typeof window.AndBridge.readBundledAsset === 'function' &&
                !Number.isInteger(window.__sfBridgeSourceChars)) {
                window.__sfBridgeSourceChars = String(window.AndBridge.readBundledAsset(name) || '').length;
                window.__sfBridgeBytes = window.__sfBridgeSourceChars;
            }
        } catch (error) {
            recordBridgeFailure('read-asset', error);
        }
""", """        window.__sfPreviewBridgeCopyAvoided = true;
""")
    # The liked tracks page is a detail view, not the library's category
    # index. The 9016 page fallback otherwise cannot publish its track rows.
    s=one(s, "        if (path === '/collection' || path.indexOf('/collection/') === 0 || path.indexOf('/your-library') === 0) return 'library';",
          "        if (path === '/collection/tracks') return 'detail';\n        if (path === '/collection' || path.indexOf('/collection/') === 0 || path.indexOf('/your-library') === 0) return 'library';")
    s=one(s, "        rows = /^\\/(playlist|album|show)\\//i.test(path)\n            ? collectDetailRows(mainView) : collectHomeRows(mainView);",
          "        rows = (path === '/collection/tracks' || /^\\/(playlist|album|show)\\//i.test(path))\n            ? collectDetailRows(mainView) : collectHomeRows(mainView);")
    s=one(s, "        if (rows.length && /^\\/(playlist|album|show)\\//i.test(path)) {",
          "        if (rows.length && (path === '/collection/tracks' || /^\\/(playlist|album|show)\\//i.test(path))) {")
    # Only the liked URL needs special canonicalization; preserve every other
    # collection's existing ownership guard, including stale playlist pages.
    s=one(s, """        if (window.__sfNativeCollectionUri &&
            nativeSpotifyUri(window.location.href) !== window.__sfNativeCollectionUri) return;""", """        if (window.__sfNativeCollectionUri &&
            (window.__sfNativeCollectionUri === 'spotify:collection:tracks'
                ? spotifyResourceUri(window.location.href) : nativeSpotifyUri(window.location.href)) !== window.__sfNativeCollectionUri) {
            if (window.__sfNativeCollectionUri === 'spotify:collection:tracks') previewPhase('liked-route-other');
            return;
        }""")
    s=one(s, """        signature = JSON.stringify(rows);
        window.__sfNativeUiDetailRowsCount = rows.length;""", """        signature = JSON.stringify(rows);
        if (path === '/collection/tracks') previewPhase(rows.length ? 'liked-dom-rows' : 'liked-dom-empty');
        window.__sfNativeUiDetailRowsCount = rows.length;""")
    s=one(s, """        var displayedRows = rows;
        if (rows.length && (path === '/collection/tracks'""", """        // On a ready, freshly navigated liked page, empty DOM is not proof of
        // an empty library. Show a manual retry; a later real row replaces it.
        if (path === '/collection/tracks' && !window.__sfNativeCollectionUri && window.__sfNativeUiReadyNotified && !rows.length && !previewLikedUnavailableShown) {
            previewLikedUnavailableShown = true;
            melodixTrace('unavailable', 0);
            previewLoadState('unavailable');
            sendNativeUiData('detail', [
                {title:'Titres likés indisponibles', subtitle:'Spotify n’affiche pas encore de titres.', settingValue:'Info', uri:''},
                {title:'Réessayer', subtitle:'Une nouvelle tentative', uri:'melodix:retry-collection'}
            ]);
        }
        if (rows.length || path !== '/collection/tracks') previewLikedUnavailableShown = false;
        var displayedRows = rows;
        if (rows.length && (path === '/collection/tracks'""")
    s=one(s, '    function updateDetailRows(mainView) {', '    var previewLikedUnavailableShown = false;\n' + MELODIX_TRACE + '    function updateDetailRows(mainView) {')
    # Counts and timings only (no title, artist or identifier): which step of
    # an opened collection fails, and how long the first and full lists take.
    s=one(s, """        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {""",
             """        if (path === '/collection/tracks' || /^\\/(playlist|album)\\//i.test(path)) {
            melodixTrace('dom', mainView ? mainView.querySelectorAll('[data-testid="tracklist-row"]').length : 0);
            melodixTrace('classified', rows.length);
        }
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {
            melodixTrace('rendered', displayedRows.length);""")
    # Only an anonymous timing event; retain the previous collection route,
    # readiness guard, navigation policy and one-call retrieval flow unchanged.
    s=one(s, """        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {""", """        if (rows.length > 0 && signature !== lastInitialDetailSignature) previewPhase('rows-received');
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {""")
    # Start only a small, bounded, account-scoped background preview after
    # visible Home rows exist. A foreground collection always has priority.
    s=one(s, '        rows = stabilizeHomeRows(rows);\n        signature = JSON.stringify(rows);',
          '        rows = stabilizeHomeRows(rows);\n        previewSchedulePrefetch();\n        signature = JSON.stringify(rows);')
    # Non-Home rows used to overwrite the Home-only text cache and send two
    # unnecessary native text callbacks on every library/detail refresh.
    s=one(s, "            if (lines.length) {\n                var listText = lines.join('\\n');",
             "            if (screen === 'home' && lines.length) {\n                var listText = lines.join('\\n');")
    # Only now-playing-specific anchors are allowed as a fallback when Spotify
    # renders the widget without its usual enclosing bar.
    s=one(s, "        var trackUri = trackLink ? spotifyResourceUri(trackLink.getAttribute('href') || '') : '';",
          """        if (!trackLink && !bar) trackLink = document.querySelector('a[data-testid=\"context-item-link\"], a[data-testid=\"nowplaying-track-link\"]');
        var trackUri = trackLink ? spotifyResourceUri(trackLink.getAttribute('href') || '') : '';""")
    s=one(s, '    var previewLastObservation = 0;\n    function playerPayload()',
          '    var previewLastObservation = 0;\n    var previewLastMovementAt = -1;\n    function playerPayload()')
    s=one(s, """        var advancing = valid && playing && !!info.previewTrackUri && info.previewTrackUri === previewLastTrack && info.previewProgressSource === previewLastSource &&
            previewLastPosition >= 0 && info.previewPositionMs > previewLastPosition &&
            at >= previewLastObservation && at - previewLastObservation <= 5000;
        previewLastTrack = valid ? info.previewTrackUri : '';""", """        var same = valid && playing && !!info.previewTrackUri && info.previewTrackUri === previewLastTrack &&
            info.previewProgressSource === previewLastSource && previewLastPosition >= 0 &&
            at >= previewLastObservation && at - previewLastObservation <= 5000;
        var increased = same && info.previewPositionMs > previewLastPosition;
        if (increased) previewLastMovementAt = at;
        else if (!same || info.previewPositionMs < previewLastPosition) previewLastMovementAt = -1;
        // A duplicate callback within two seconds of observed movement must not
        // freeze the native clock. Extended buffering and pause still stop it.
        var advancing = !!(same && (increased || (info.previewPositionMs === previewLastPosition &&
            previewLastMovementAt >= 0 && at >= previewLastMovementAt && at - previewLastMovementAt <= 2000)));
        previewLastTrack = valid ? info.previewTrackUri : '';""")
    tuple_bytes=(HERE/'preview-player-tuple.js').read_bytes()
    if hashlib.sha256(tuple_bytes).hexdigest() != 'f49bb4b0093c4fd3bd587683fe0d5bf833edfd3095e7500c07598549d96f80c8': raise ValueError('unexpected tuple helper')
    prewarm_bytes=(HERE/'preview-prewarm.js').read_bytes()
    if hashlib.sha256(prewarm_bytes).hexdigest() != PREWARM_SHA: raise ValueError('unexpected prewarm helper')
    start=s.index('    // Preview-only progress samples.')
    end=s.index('    function publishPlayerState(force)', start)
    s=s[:start]+tuple_bytes.decode('utf8')+'\n'+prewarm_bytes.decode('utf8')+'\n'+s[end:]
    s=one(s, "            payload.playing ? '1' : '0',\n            payload.duration,", "            payload.playing ? '1' : '0',\n            payload.previewPlaybackState,\n            payload.previewConfirmPositionMs,\n            payload.duration,")
    # Artwork can arrive after metadata; include its URL in the update signature.
    # It is passed only to the native player, never included in diagnostics.
    s=one(s, "            payload.artist,\n            payload.playing ? '1' : '0',", "            payload.artist,\n            payload.cover,\n            payload.playing ? '1' : '0',")
    # Recognise the new widget only as an explicit current-player container.
    s=one(s, "bar = document.querySelector('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"]');", "bar = document.querySelector('[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"now-playing-widget-v2\"]');")
    # Native timing spans survive a WebView reload; include only the already
    # visible route to reject a stale ready event from a different collection.
    s=one(s, "        try {\n            bridge.onNativeUiReady();", "        try {\n            previewPhase('page-ready|' + spotifyResourceUri(window.location.href));\n            melodixTrace('ready', 0);\n            bridge.onNativeUiReady();")
    # Replace the entire previous auto-retry/token-aware flow with one bridge
    # attempt and the historical paused-only navigation fallback.
    start=s.index('    var openCollectionTimer = null;')
    end=s.index('    // Search normally goes through the bridge.', start)
    s=s[:start]+helper+'\n'+s[end:]
    s=one(s, "        if (!uri) return false;\n        previewPausePrefetch();\n        cancelPendingCollectionNavigation();",
             "        if (!uri) return false;\n        melodixTrace('open', uri === 'spotify:collection:tracks' ? 'liked' : 'playlist');\n        previewPausePrefetch();\n        cancelPendingCollectionNavigation();")
    activity=root/'smali/com/melodix/music/MainActivity.smali'
    a=activity.read_text(encoding='utf8')
    anchor = ".method public final openNativeRow(Ljava/lang/String;Ljava/lang/String;)V"
    prefix, rest = a.split(anchor, 1)
    rest=one(rest, """    const-string v2, "spotify:settings:"
""", """    # Dedicated retry action, never treat it as a Spotify URI or push Back.
    const-string v2, "melodix:retry-collection"
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :preview_not_retry_collection
    const-string v2, "window.__sfRetryCollection"
    invoke-virtual {p0, v2, p1}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V
    return-void
    :preview_not_retry_collection

    const-string v2, "spotify:settings:"
""")
    a=prefix+anchor+rest
    a=one(a, """    :preview_not_load
    if-eqz p2, :apply_done
""", """    :preview_not_load
    const-string v0, "preview-phase"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :preview_not_phase
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p2}, Lcom/melodix/music/PreviewPlayerController;->phase(Ljava/lang/String;)V
    return-void
    :preview_not_phase
    if-eqz p2, :apply_done
""")
    # The existing image loader cancels every outstanding Picasso request. The
    # player is refreshed each second, so an unchanged cover used to be
    # cancelled and restarted repeatedly. Reuse it for 15 seconds; retry even
    # after failure, and reload immediately on URL changes. No player command.
    a=one(a, '.field private nativeBackStack:Ljava/util/ArrayDeque;\n',
          '.field private nativePreviewArtworkUrl:Ljava/lang/String;\n.field private nativePreviewArtworkAt:J\n.field private nativeBackStack:Ljava/util/ArrayDeque;\n')
    anchor_player='.method public final updateNativePlayer(Ljava/lang/String;)V'
    prefix, method = a.split(anchor_player, 1)
    method=one(method, """    const-string v1, "cover"
    const-string v2, ""
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    const v8, 0x7f090244""", """    const-string v1, "cover"
    const-string v2, ""
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v4
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->nativePreviewArtworkUrl:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :preview_artwork_reload
    iget-wide v6, p0, Lcom/melodix/music/MainActivity;->nativePreviewArtworkAt:J
    sub-long v6, v4, v6
    const-wide/16 v8, 0x0
    cmp-long v3, v6, v8
    if-ltz v3, :preview_artwork_reload
    const-wide/16 v8, 0x3a98
    cmp-long v3, v6, v8
    if-ltz v3, :native_player_progress
    :preview_artwork_reload
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->nativePreviewArtworkUrl:Ljava/lang/String;
    iput-wide v4, p0, Lcom/melodix/music/MainActivity;->nativePreviewArtworkAt:J
    const v8, 0x7f090244""")
    method=one(method, """    move-result-object v3

    const v1, 0x7f090236""", """    move-result-object v3

    const-string v1, "No Track"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :preview_empty_title
    const-string v1, "Aucune lecture en cours"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :preview_empty_title
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :preview_title_localized
    :preview_empty_title
    const-string v2, "Aucun titre"
    :preview_title_localized
    const-string v1, "No Artist"
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :preview_empty_artist
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :preview_artist_localized
    :preview_empty_artist
    const-string v3, "Lecture arrêtée"
    :preview_artist_localized

    const v1, 0x7f090236""")
    a=prefix+anchor_player+method
    # Playlist-only placeholders are inert, local presentation. The original
    # image/title rendering call already occurs here; no image or list fetch is
    # added. rowsPainted ignores these entries because they have no track URI.
    a=one(a, """    const-string v2, "[]"
    if-eqz p2, :native_collection_default_title""", """    const-string v2, "[]"
    const-string v3, ":playlist:"
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-nez v3, :preview_playlist_loading_rows
    const-string v3, "/playlist/"
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-nez v3, :preview_playlist_loading_rows
    const-string v3, "collection:tracks"
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-nez v3, :preview_playlist_loading_rows
    const-string v3, "/collection/tracks"
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :preview_playlist_loading_done
    :preview_playlist_loading_rows
    const-string v2, "[{\\\"title\\\":\\\"Chargement…\\\",\\\"settingValue\\\":\\\"Info\\\"},{\\\"title\\\":\\\"────────────\\\",\\\"settingValue\\\":\\\"Info\\\"},{\\\"title\\\":\\\"──────────\\\",\\\"settingValue\\\":\\\"Info\\\"}]"
    invoke-static {p0, p1, v2}, Lcom/melodix/music/PreviewPlayerController;->cachedRows(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    :preview_playlist_loading_done
    if-eqz p2, :native_collection_default_title""")
    activity.write_text(a,encoding='utf8')
    rows=root/'smali/com/melodix/music/NativeUiRowFactory.smali'
    r=rows.read_text(encoding='utf8')
    anchor='.method public static create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;\n    .locals 12\n'
    r=one(r, anchor, anchor+"""
    const-string v0, "uri"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const-string v3, "melodix:retry-collection"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :preview_normal_row
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    new-instance v1, Landroid/widget/Button;
    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    const-string v4, "Réessayer"
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v5, 0x0
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setAllCaps(Z)V
    new-instance v5, Lcom/melodix/music/NativeRowClickListener;
    invoke-direct {v5, p0, v2, v4}, Lcom/melodix/music/NativeRowClickListener;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v6, -0x1
    const/4 v7, -0x2
    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v0, v1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-object v0
    :preview_normal_row
""")
    # Decode row covers at least at their actual 48dp pixel size. The previous
    # fixed 176px target could upscale high-density displays; cap memory use.
    r=one(r, """    const/16 v10, 0xb0
    invoke-static {v1, v9, v10}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V""", """    const/16 v10, 0x30
    invoke-static {p0, v10}, Lcom/melodix/music/NativeUiRowFactory;->dp(Landroid/content/Context;I)I
    move-result v10
    const/16 v11, 0xb0
    if-ge v10, v11, :preview_cover_min_done
    move v10, v11
    :preview_cover_min_done
    const/16 v11, 0x180
    if-le v10, v11, :preview_cover_max_done
    move v10, v11
    :preview_cover_max_done
    invoke-static {v1, v9, v10}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V""")
    # User-specific next-button policy: in positively identified repeat-one,
    # do not move to the next item. No seek, pause, play or retry is issued.
    s=one(s, """        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        previewCommandDispatched();
        window.__sfUserRequestedPause = false;""", """        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        if (!back) {
            var repeatButtons = document.querySelectorAll('button[data-testid=\"control-button-repeat\"], [role=\"button\"][data-testid=\"control-button-repeat\"]');
            if (repeatButtons.length === 1) {
                var checked = repeatButtons[0].getAttribute('aria-checked');
                var pressed = repeatButtons[0].getAttribute('aria-pressed');
                if ((checked === 'mixed' && (pressed === null || pressed === 'mixed')) ||
                    (pressed === 'mixed' && checked === null)) {
                    previewCommandDispatched();
                    return false; // keep the current item; never invent a restart
                }
            }
        }
        previewCommandDispatched();
        window.__sfUserRequestedPause = false;""")
    rows.write_text(r,encoding='utf8')
    p.write_text(s,encoding='utf8')
    # Separate player presentation, with pinned inputs and no playback changes.
    import importlib.util
    visual=HERE/'apply_preview_player_visual.py'
    spec=importlib.util.spec_from_file_location('preview_player_visual',visual)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.apply(root)
if __name__=='__main__':
    if len(sys.argv)!=2: raise SystemExit('usage: apply_preview_library_followup.py PROJECT')
    apply(Path(sys.argv[1]))
