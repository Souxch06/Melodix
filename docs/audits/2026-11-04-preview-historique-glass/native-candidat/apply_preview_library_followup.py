#!/usr/bin/env python3
"""Pin and patch non-protected native shell after the 1022134 feedback fixes."""
import hashlib,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
EXPECTED='ed18ae0b137951fc9b9f1d9fbc65a3f596fad94f38d6f31c8b22c7fa74462984'
HELPER_SHA='a090f2dd6fa8eb642a1041d456159d9d66dd98c5c92d6f692b8784f00f4205ca'

def one(text, old, new):
    if text.count(old)!=1: raise ValueError('unexpected anchor: '+old[:90])
    return text.replace(old,new,1)

def apply(root):
    p=root/'assets/native_ui_shell.js';raw=p.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=EXPECTED: raise ValueError('unexpected shell input; no changes made')
    helper_bytes=(HERE/'preview-collection-retry.js').read_bytes()
    if hashlib.sha256(helper_bytes).hexdigest()!=HELPER_SHA: raise ValueError('unexpected helper; no changes made')
    s=raw.decode('utf8'); helper=helper_bytes.decode('utf8')
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
            previewLoadState('unavailable');
            sendNativeUiData('detail', [
                {title:'Titres likés indisponibles', subtitle:'Spotify n’affiche pas encore de titres.', settingValue:'Info', uri:''},
                {title:'Réessayer', subtitle:'Une nouvelle tentative', uri:'melodix:retry-collection'}
            ]);
        }
        if (rows.length || path !== '/collection/tracks') previewLikedUnavailableShown = false;
        var displayedRows = rows;
        if (rows.length && (path === '/collection/tracks'""")
    s=one(s, '    function updateDetailRows(mainView) {', '    var previewLikedUnavailableShown = false;\n    function updateDetailRows(mainView) {')
    # Only an anonymous timing event; retain the previous collection route,
    # readiness guard, navigation policy and one-call retrieval flow unchanged.
    s=one(s, """        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {""", """        if (rows.length > 0 && signature !== lastInitialDetailSignature) previewPhase('rows-received');
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {""")
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
    if hashlib.sha256(tuple_bytes).hexdigest() != '8e92cbbee432ee2ea2aa14e94e4d3260e7a36855f9ac3b4e920da83b61eb06eb': raise ValueError('unexpected tuple helper')
    start=s.index('    // Preview-only progress samples.')
    end=s.index('    function publishPlayerState(force)', start)
    s=s[:start]+tuple_bytes.decode('utf8')+'\n'+s[end:]
    s=one(s, "            payload.playing ? '1' : '0',\n            payload.duration,", "            payload.playing ? '1' : '0',\n            payload.previewPlaybackState,\n            payload.previewConfirmPositionMs,\n            payload.duration,")
    # Native timing spans survive a WebView reload; include only the already
    # visible route to reject a stale ready event from a different collection.
    s=one(s, "        try {\n            bridge.onNativeUiReady();", "        try {\n            previewPhase('page-ready|' + spotifyResourceUri(window.location.href));\n            bridge.onNativeUiReady();")
    # Replace the entire previous auto-retry/token-aware flow with one bridge
    # attempt and the historical paused-only navigation fallback.
    start=s.index('    var openCollectionTimer = null;')
    end=s.index('    // Search normally goes through the bridge.', start)
    s=s[:start]+helper+'\n'+s[end:]
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
    anchor_player='.method public final updateNativePlayer(Ljava/lang/String;)V'
    prefix, method = a.split(anchor_player, 1)
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
    if-eqz v3, :preview_playlist_loading_done
    :preview_playlist_loading_rows
    const-string v2, "[{\\\"title\\\":\\\"Chargement…\\\",\\\"settingValue\\\":\\\"Info\\\"},{\\\"title\\\":\\\"────────────\\\",\\\"settingValue\\\":\\\"Info\\\"},{\\\"title\\\":\\\"──────────\\\",\\\"settingValue\\\":\\\"Info\\\"}]"
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
