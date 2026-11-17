#!/usr/bin/env python3
"""WIP: apply the Preview-only native player controller to the lot 1 candidate.

This patch touches no protected assets. Inputs are pinned to the published
follow-up candidate. It fails closed on any unexpected input or missing helper.
"""
import hashlib
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE / 'preview-player' / 'PreviewPlayerController.java'
STORE_SOURCE = HERE / 'preview-player' / 'PreviewLastTrackStore.java'
STORE_SOURCE_SHA = 'e46050ae70d14c0e03720fe9a7d4f58130c93053b9fd022c5e837ddee371c02d'
EXPECTED = {
    'assets/native_ui_shell.js': '7b171ed4773c34571cd5bc4974f764d303edb300f49f13bbdf5f6f3940d84004',
    'smali/com/melodix/music/MainActivity.smali': 'dd14f96c2e3143b1e015e58a4c881911147e8312df1938a59e7ba3fa1b9a6f53',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali': '87af4ac75e344b84f94374db7b94018b524a9af981f2367f8a9631f8b1c8ed63',
    'smali/e6.smali': '71fb560215540abcc1e45899946eb95211c6f6af711f32910ca9111ce6068991',
    'smali/m9.smali': '85110d08bf6c642ea6201c152a4e219721ae542927a16a701d6018bedee83b06',
    'res/layout/activity_main.xml': '245649abbe8e4c683ab5dcfe5bd3cfbe39a1942131fd636b6e3d1ab890707634',
    'res/layout-w600dp/activity_main.xml': '4d110f1df062fdf7676b9aa5e70146dd7ec148da3c0c614a553b5586ad5af8fe',
    'res/drawable/widget_progress_drawable.xml': '3a5f8f51ea984c7a8226d5acd69bf6b20383ca9622843d617b055c9fe18d772f',
}
SOURCE_SHA = 'efcf91ce31afdc84fc15f9bd12a54829395d653365d0628987e97c7e2e4ce2cc'
HELPER_SHA = {
    'PreviewPlayerController$1.smali': '1620cd018bca3e4eea99222d89ef6d52691f5800bca92db3fd90f63cf86600bc',
    'PreviewPlayerController$2.smali': 'f96b04e7b97eb5cdb5c89b7835aed087c60cd553b6054acf3408eef5388fd509',
    'PreviewPlayerController$3.smali': 'ce5646f631247e16cddf7d42e2f676b742269219fa7d507a70520b97efa9648d',
    'PreviewPlayerController$4.smali': '4e969881dc3b99f1fe43d36f578f976bdc15fc7008516a1fd047e543d8133041',
    'PreviewPlayerController$5.smali': '31a9638bc7ee621f32422f8b9f1a6fa80746081807c4288add97c5c8cc216b03',
    'PreviewPlayerController$6.smali': '56f6c23d0acd84aa39cd900a23780fd6fa657ba057523f7fced78d863473473b',
    'PreviewPlayerController.smali': '053ff8880a10a0a77b62e5934cc4d863ce738f7aa788c97b232a20f0f664f349',
    'PreviewLastTrackStore$1$1.smali': '0f08af75a9df2f09d8b8fe674544c0997f260e28d7fa3147022a29808026c810',
    'PreviewLastTrackStore$1.smali': '4ab56f343d94bad9224cd73cc1076ebe8ced0de9ca3acd89c5fb596264160963',
    'PreviewLastTrackStore$2.smali': '013add8fc490eba34135b5e3edf4c584fddc1cf6bc84c8574ccf1786b5bac8f2',
    'PreviewLastTrackStore$3.smali': '37b0b5950c2cc9f0f4270f1d0752866d57882e33a63706bf1fff092c2270501f',
    'PreviewLastTrackStore$Callback.smali': 'c40eda7194ee9effb8c49d786a8193846862f842ebaf48ad0652bfec92c6091e',
    'PreviewLastTrackStore$Record.smali': '669b11f513d658fbf363eda91cc03f7a5e80f3ab1bffb6b28feaa3047fb58607',
    'PreviewLastTrackStore.smali': '6e061549e11f3b9178e25edc9dfc587f6cde97504c926f7fb6dedc3a278ec8b9',
}

def replace(text, old, new):
    if text.count(old) != 1: raise ValueError('unexpected anchor ' + repr(old[:100]))
    return text.replace(old, new, 1)

def prepare(root):
    files = {}
    for path, digest in EXPECTED.items():
        data = (root / path).read_bytes()
        if hashlib.sha256(data).hexdigest() != digest: raise ValueError('unexpected input ' + path)
        files[path] = data.decode('utf8')
    if hashlib.sha256(SOURCE.read_bytes()).hexdigest() != SOURCE_SHA:
        raise ValueError('Java helper changed without regenerating smali')
    if hashlib.sha256(STORE_SOURCE.read_bytes()).hexdigest() != STORE_SOURCE_SHA:
        raise ValueError('store changed without regenerating smali')
    helpers = sorted((HERE / 'preview-player' / 'smali').glob('PreviewPlayerController*.smali')) + sorted((HERE / 'preview-player' / 'smali').glob('PreviewLastTrackStore*.smali'))
    if {p.name for p in helpers} != set(HELPER_SHA): raise ValueError('missing generated native controller')
    for p in helpers:
        if hashlib.sha256(p.read_bytes()).hexdigest() != HELPER_SHA[p.name]:
            raise ValueError('generated native controller digest mismatch: ' + p.name)
        dest = 'smali/com/melodix/music/' + p.name
        if (root / dest).exists(): raise ValueError('controller already exists')
        files[dest] = p.read_text()

    # Only the full player is interactive. Keep the mini progress as a plain
    # ProgressBar. SeekBar supplies a thumb and captures release outside bounds.
    for layout in ('res/layout/activity_main.xml', 'res/layout-w600dp/activity_main.xml'):
        data = files[layout]
        start = data.index('            <ProgressBar\n                android:id="@id/nativePlayerProgress"')
        end = data.index('/>', start) + 2
        bar = data[start:end].replace('<ProgressBar', '<SeekBar', 1)
        bar = bar.replace('style="?android:progressBarStyleHorizontal"', 'style="?android:attr/seekBarStyle"')
        bar = bar.replace('android:layout_height="6.0dip"', 'android:layout_height="32.0dip"\n                android:maxHeight="6.0dip"\n                android:thumbTint="#ffc0a2ff"\n                android:contentDescription="Déplacer la lecture"')
        data = data[:start] + bar + data[end:]
        for ident in ('nativePlayerPositionText', 'nativePlayerDurationText'):
            start = data.index('android:id="@id/' + ident + '"')
            end = data.index('/>', start)
            section = data[start:end].replace('android:text="0:00"', 'android:text="-:--"')
            data = data[:start] + section + data[end:]
        files[layout] = data
    # Visual only: the existing clipped progress drawable is also used by
    # the player widget, so it receives the same restrained gradient. No new
    # resource IDs or always-running animation are introduced.
    path = 'res/drawable/widget_progress_drawable.xml'
    files[path] = '''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@android:id/background">
        <shape>
            <corners android:radius="3.0dip" />
            <gradient android:angle="0" android:startColor="#ff302b3b" android:endColor="#ff433b50" />
        </shape>
    </item>
    <item android:id="@android:id/progress">
        <clip>
            <shape>
                <corners android:radius="3.0dip" />
                <gradient android:angle="0" android:startColor="#ff956fe9" android:centerColor="#ffc0a2ff" android:endColor="#ffe8d9ff" />
            </shape>
        </clip>
    </item>
</layer-list>
'''
    for path in ('res/layout/activity_main.xml', 'res/layout-w600dp/activity_main.xml'):
        s = files[path]
        old = '''android:progressDrawable="@drawable/widget_progress_drawable"
                android:progressTint="#ffa78bfa"
                android:progressBackgroundTint="#ff2a2a2a"'''
        new = '''android:progressDrawable="@drawable/widget_progress_drawable"
                android:progressTint="@null"
                android:progressBackgroundTint="@null"'''
        if s.count(old) != 2: raise ValueError('unexpected player progress layout: ' + path)
        files[path] = s.replace(old, new)

    path = 'assets/native_ui_shell.js'; s = files[path]
    s = replace(s, '''    function readMediaProgress() {''', '''    // Read the actual Spotify player slider already used by the existing
    // bridge. Its max/value are milliseconds; reject absent, invalid or
    // percent-style controls rather than inventing a position or duration.
    function previewReadRange() {
        var input = document.querySelector('div[data-testid="playback-progressbar"] input[type="range"]');
        if (!input || !input.hasAttribute('max') || !input.hasAttribute('value')) return null;
        var rawMax = input.getAttribute('max');
        var rawValue = input.getAttribute('value');
        var rawMin = input.hasAttribute('min') ? input.getAttribute('min') : '0';
        if (!/^\\d+$/.test(rawMax) || !/^\\d+$/.test(rawValue) || !/^\\d+$/.test(rawMin)) return null;
        var max = Number(rawMax), min = Number(rawMin), value = Number(rawValue);
        if (!isFinite(max) || max < 1000 || !isFinite(value) || min !== 0 || value < 0 || value > max) return null;
        return {position: value / 1000, duration: max / 1000, source: 'range'};
    }

    function previewClockStrict(selector) {
        var node = document.querySelector(selector), text = node ? String(node.textContent || '').trim() : '';
        if (!/^(?:\\d+:)?\\d{1,3}:\\d{2}$/.test(text)) return -1;
        var p = text.split(':').map(Number);
        if (p[p.length - 1] >= 60 || (p.length === 3 && p[1] >= 60)) return -1;
        return p.reduce(function(total, n) { return total * 60 + n; }, 0);
    }

    function readMediaProgress() {''')
    s = replace(s, '''        var progress = readMediaProgress();
        var position = progress.position;
        var duration = progress.duration;
        if (position < 0) position = readClock(['[data-testid="playback-position"]']);
        if (duration <= 0) duration = readClock(['[data-testid="playback-duration"]']);''', '''        // Prefer the displayed clock pair (second precision). Do not mix
        // a position and duration from different sources.
        var position = previewClockStrict('[data-testid="playback-position"]');
        var duration = previewClockStrict('[data-testid="playback-duration"]');
        var previewSource = position >= 0 && duration > 0 && position <= duration ? 'clock' : 'none';
        if (previewSource === 'none') {
            var progress = previewReadRange() || readMediaProgress();
            position = progress.position; duration = progress.duration;
            previewSource = progress.source || (isFinite(position) && position >= 0 && isFinite(duration) && duration > 0 && position <= duration ? 'media' : 'none');
            if (previewSource === 'none') { position = -1; duration = -1; }
        }''')
    # Reuse only the bridge's already published in-memory library when the
    # bridge can positively attest it belongs to the current session. This
    # emits existing rows immediately; the existing fetch still owns updates.
    s = replace(s, '''        // Exact same rows that have already appeared in Home, scoped to the
        // current in-memory bearer session. Never copy recommendation shelves.''', '''        if (typeof window.__sfNativeMediaTokenMatches === 'function' &&
            window.__sfNativeMediaTokenMatches() === true && window.mediaLib &&
            Array.isArray(window.mediaLib[category])) {
            window.mediaLib[category].forEach(add);
        }
        // Exact same rows that have already appeared in Home, scoped to the
        // current in-memory bearer session. Never copy recommendation shelves.''')
    # Retry only after the bridge starts or an absent token appears. Never
    # overlap requests or poll a failing authenticated Spotify request.
    s = replace(s, "    var openCollectionTimer = null;\n    var pendingCollectionUri = null;", """    var openCollectionTimer = null;
    var previewCollectionRetry = null;
    var pendingCollectionUri = null;
    function previewLoadState(stage) {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
                window.AndBridge.onNativeUiData('preview-load', stage + (window.spotAuthToken ? ':token' : ':no-token'));
        } catch (_) {}
    }
    function stopPreviewCollectionRetry() {
        if (previewCollectionRetry) window.clearTimeout(previewCollectionRetry);
        previewCollectionRetry = null;
    }""")
    s = replace(s, "    function cancelPendingCollectionNavigation() {\n        stopCollectionFallback();", "    function cancelPendingCollectionNavigation() {\n        stopCollectionFallback();\n        stopPreviewCollectionRetry();")
    s = replace(s, "            window.__sfNativeCollectionHasData = true;\n            stopCollectionFallback();", "            window.__sfNativeCollectionHasData = true;\n            previewLoadState('data');\n            stopPreviewCollectionRetry();\n            stopCollectionFallback();")
    # Never reload Spotify as a side effect of browsing. A false/unknown
    # playing state is not proof that the page is safe to reload. Preserve the
    # outstanding request so an eventual bridge response can still render.
    s = replace(s, '''        function navigate() {
            if (window.__sfNativeCollectionRequest !== requestId) return false;
            stopCollectionFallback();
            return window.__sfNativeOpenUri(uri);
        }''', '''        function navigate() {
            if (window.__sfNativeCollectionRequest !== requestId) return false;
            stopCollectionFallback();
            if (!window.__sfNativeCollectionHasData) {
                if (inFlight) previewLoadState('timeout');
                sendNativeUiData('detail', [{title:'Titres momentanément indisponibles',
                    subtitle:'Spotify n’a pas encore fourni les titres.', settingValue:'Info', uri:''}]);
            }
            return false;
        }''')
    s = replace(s, '''        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                // Arm first: the bridge may synchronously serve its cache.
                openCollectionTimer = window.setTimeout(navigate, 6000);
                Promise.resolve(window.fetchMediaItems(uri, requestId, String(value))).catch(function() {});
                return true;
            } catch (_) {
                stopCollectionFallback();
            }
        }
        return navigate();''', '''        var remaining = 20, attempts = 0, inFlight = false;
        function current() {
            return window.__sfNativeCollectionRequest === requestId && !window.__sfNativeCollectionHasData;
        }
        function waitForReady(needsToken) {
            if (!current()) return;
            if (remaining-- <= 0) { previewLoadState('unavailable'); return; }
            previewLoadState(needsToken ? 'waiting-token' : 'waiting-bridge');
            previewCollectionRetry = window.setTimeout(function() {
                previewCollectionRetry = null;
                if (!current()) return;
                var bridgeReady = window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function';
                if (bridgeReady && (!needsToken || !!window.spotAuthToken)) request();
                else waitForReady(needsToken);
            }, 1000);
        }
        function request() {
            if (!current() || inFlight || attempts >= 2) return;
            var hadToken = !!window.spotAuthToken;
            attempts += 1; inFlight = true; previewLoadState('pending');
            function settled(failed) {
                inFlight = false;
                if (!current()) return;
                previewLoadState(failed ? 'failed' : 'no-data');
                // Only retry a tokenless attempt, after a token becomes
                // available. An authenticated error can be a real empty
                // playlist or a refusal; do not repeatedly hammer Spotify.
                if (!hadToken && attempts < 2) waitForReady(true);
            }
            try {
                Promise.resolve(window.fetchMediaItems(uri, requestId, String(value)))
                    .then(function() { settled(false); }, function() { settled(true); });
            } catch (_) { settled(true); }
        }
        // Arm before requesting: a cache hit can call back synchronously.
        openCollectionTimer = window.setTimeout(navigate, 6000);
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') request();
        else waitForReady(false);
        return true;''')
    s = replace(s, '''        if (shown || path === target || path.indexOf(target + '/') === 0) return true;
        window.location.assign('https://open.spotify.com' + target);''', '''        if (shown || path === target || path.indexOf(target + '/') === 0) return true;
        sendNativeUiData('media:' + key, [{title:'Bibliothèque momentanément indisponible',
            subtitle:'Spotify n’a pas encore fourni les listes. Réessayez dans un instant.', settingValue:'Info', uri:''}]);
        return false;''')
    s = replace(s, "        return false;\n        return true;\n    }\n\n    window.__sfOpenLibrary", "        return false;\n    }\n\n    window.__sfOpenLibrary")
    s = replace(s, '''        if (!isSpotifyHome()) {
            window.location.assign('https://open.spotify.com/');''', '''        if (!isSpotifyHome()) {
            if (playbackSnapshot().playing) return false;
            window.location.assign('https://open.spotify.com/');''')
    s = replace(s, '''            cover: cover || '',
            position: position > 0 ? Math.round(position) : 0,
            duration: duration > 0 ? Math.round(duration) : 0''', '''            cover: cover || '',
            position: position > 0 ? Math.round(position) : 0,
            duration: duration > 0 ? Math.round(duration) : 0,
            previewTrackUri: /^spotify:(?:track|episode):[a-z0-9]+$/i.test(trackUri) ? trackUri : '',
            previewProgressSource: previewSource,
            previewPositionMs: isFinite(position) && position >= 0 ? Math.round(position * 1000) : -1,
            previewDurationMs: isFinite(duration) && duration > 0 ? Math.round(duration * 1000) : -1''')
    s = replace(s, '''    function playerPayload() {
        var info = readNowPlaying();
        return {''', '''    // Preview-only progress samples. No requests or persistent data. Advance
    // only after observing real motion, and freeze while position is unchanged.
    var previewLastTrack = '';
    var previewLastSource = 'none';
    var previewLastPosition = -1;
    var previewLastObservation = 0;
    function playerPayload() {
        var info = readNowPlaying();
        var playing = playbackSnapshot().playing;
        var at = window.performance && typeof window.performance.now === 'function' ? window.performance.now() : Date.now();
        var valid = info.previewDurationMs > 0 && info.previewPositionMs >= 0 && info.previewPositionMs <= info.previewDurationMs;
        var advancing = valid && playing && !!info.previewTrackUri && info.previewTrackUri === previewLastTrack && info.previewProgressSource === previewLastSource &&
            previewLastPosition >= 0 && info.previewPositionMs > previewLastPosition &&
            at >= previewLastObservation && at - previewLastObservation <= 5000;
        previewLastTrack = valid ? info.previewTrackUri : '';
        previewLastSource = valid ? info.previewProgressSource : 'none';
        previewLastPosition = valid ? info.previewPositionMs : -1;
        previewLastObservation = at;
        return {''')
    s = replace(s, '''            playing: playbackSnapshot().playing,
            position: info.position,
            duration: info.duration
        };
    }

    function publishPlayerState''', '''            playing: playing,
            position: info.position,
            duration: info.duration,
            previewTrackUri: info.previewTrackUri,
            previewProgressSource: info.previewProgressSource,
            previewPositionMs: info.previewPositionMs,
            previewDurationMs: info.previewDurationMs,
            previewProgressValid: valid,
            previewAdvancing: advancing
        };
    }

    function publishPlayerState''')
    s = replace(s, '''            payload.duration,
            Math.floor(payload.position / 5)
        ].join('|');''', '''            payload.duration,
            payload.previewTrackUri,
            payload.previewProgressSource,
            Math.floor(payload.previewPositionMs / 1000),
            payload.previewProgressValid ? '1' : '0',
            payload.previewAdvancing ? '1' : '0'
        ].join('|');''')
    s = replace(s, '''    window.__sfTogglePlayback = function() {
        var playing = playbackSnapshot().playing;
        var target = !playing;
        markUserPlaybackIntent(target);''', '''    function previewCommandDispatched() {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
                window.AndBridge.onNativeUiData('preview-command', '');
        } catch (_) {}
    }
    window.__sfTogglePlayback = function(desired) {
        var playing = playbackSnapshot().playing;
        var target = typeof desired === 'boolean' ? desired : !playing;
        markUserPlaybackIntent(target);
        previewCommandDispatched();''')
    s = replace(s, '''        refreshPlayerSoon(350);
        refreshPlayerSoon(1400);
        return target;''', '''        publishPlayerState(true);
        return target;''')
    s = replace(s, '''        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        window.__sfUserRequestedPause = false;''', '''        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        previewCommandDispatched();
        window.__sfUserRequestedPause = false;''')
    if s.count('                refreshPlayerSoon(600);') != 2: raise ValueError('unexpected skip refresh count')
    s = s.replace('                refreshPlayerSoon(600);', '                publishPlayerState(true);')
    s = replace(s, '''        refreshPlayerSoon(700);
        return false;''', '''        publishPlayerState(true);
        return false;''')
    s = replace(s, '''                if (control) refreshPlayerSoon(500);
            }, true);
        } catch (_) {}
    }

    function runUpdate()''', '''                if (control) publishPlayerState(true);
            }, true);
            ['playing', 'pause', 'waiting', 'seeking', 'seeked'].forEach(function(type) {
                document.addEventListener(type, function() { publishPlayerState(true); }, true);
            });
        } catch (_) {}
    }

    function runUpdate()''')
    files[path] = s

    # onStart is final in the framework Activity subclass, so add a guarded
    # Preview-only notification there without changing its lifecycle logic.
    path = 'smali/e6.smali'; s = files[path]
    s = replace(s, ".method public final onStart()V\n    .locals 2\n", """.method public final onStart()V
    .locals 2

    instance-of v0, p0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :preview_start_observed
    move-object v0, p0
    check-cast v0, Lcom/melodix/music/MainActivity;
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->activityStarted()V
    :preview_start_observed
""")
    files[path] = s

    path = 'smali/com/melodix/music/MainActivity.smali'; s = files[path]
    # The inherited onPause remains responsible for its original work.
    s += """
.method public onPause()V
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    if-eqz v0, :preview_pause_done
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->activityPaused()V
    :preview_pause_done
    invoke-super {p0}, Le6;->onPause()V
    return-void
.end method
"""
    # WebView can be created later in onResume, after the first listener hook.
    start=s.index('.method public final C()V'); end=s.index('.end method', start)
    body=s[start:end]
    body=replace(body, "    iput-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;", """    iput-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v1
    invoke-virtual {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->attachSeek(Landroid/webkit/WebView;)V""")
    s=s[:start]+body+s[end:]
    s = replace(s, '''.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0''', '''.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v1
    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerController;->activityCreated()V''')
    # Restore only after successful layout inflation; no Spotify bridge required.
    s = replace(s, "    :native_content_ok\n", """    :native_content_ok
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v1
    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerController;->layoutReady()V
""")
    s = replace(s, ".method public final A()V\n    .locals 4\n", """.method public final A()V
    .locals 4
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->clearLastTrack()V
""")
    s = replace(s, '''.method public final onResume()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroidx/activity/a;->onResume()V''', '''.method public final onResume()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroidx/activity/a;->onResume()V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->activityResumed()V
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    invoke-virtual {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->attachSeek(Landroid/webkit/WebView;)V''')
    s = replace(s, '''.method public final onStop()V
    .locals 2

    const/4 v0, 0x1''', '''.method public final onStop()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    if-eqz v0, :preview_animation_stopped
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->activityStopped()V
    :preview_animation_stopped
    const/4 v0, 0x1''')
    s = replace(s, '''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    const-string v1, "detail"''', '''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p1}, Lcom/melodix/music/PreviewPlayerController;->playlistOpened(Ljava/lang/String;)V
    const-string v1, "detail"''')
    s = replace(s, '''    if-lez v3, :preview_historical_feed
    return-void''', '''    if-lez v3, :preview_historical_feed
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {v0, v1, v2, p2}, Lcom/melodix/music/PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    return-void''')
    s = replace(s, '''    :native_rows_rendered
    return-void''', '''    :native_rows_rendered
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {v0, v1, v2, p2}, Lcom/melodix/music/PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    return-void''')
    s = replace(s, '.field private nativeBackStack:Ljava/util/ArrayDeque;\n', '.field private nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;\n.field private nativeBackStack:Ljava/util/ArrayDeque;\n')
    s = replace(s, '''.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :apply_done''', '''.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :apply_done
    const-string v0, "preview-command"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :preview_not_command
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->command()V
    return-void
    :preview_not_command
    const-string v0, "preview-load"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :preview_not_load
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p2}, Lcom/melodix/music/PreviewPlayerController;->loadState(Ljava/lang/String;)V
    return-void
    :preview_not_load''')
    s = replace(s, '''    :check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_home
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->updateNativePlayer(Ljava/lang/String;)V
    return-void''', '''    :check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_home
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p2}, Lcom/melodix/music/PreviewPlayerController;->acceptPlayerPayload(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :preview_player_payload_accepted
    return-void
    :preview_player_payload_accepted
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->updateNativePlayer(Ljava/lang/String;)V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p2}, Lcom/melodix/music/PreviewPlayerController;->snapshot(Ljava/lang/String;)V
    return-void''')
    s = replace(s, '''.method public final onNativePlayPauseClick(Landroid/view/View;)V
    .locals 1

    # __sfTogglePlayback''', '''.method public final onNativePlayPauseClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->tapPlayPause()I
    move-result v1
    if-gez v1, :preview_known_toggle
    return-void
    :preview_known_toggle
    if-eqz v1, :preview_pause_command
    const-string v0, "(function(){var t=true;if(typeof window.__sfTogglePlayback=='function'){window.__sfTogglePlayback(t);return;}try{if(window.AndBridge)window.AndBridge.onNativeUiData('preview-command','');if(typeof window.__sfMarkUserPlaybackIntent=='function')window.__sfMarkUserPlaybackIntent(t);if(typeof window.actPlayPause=='function'){window.actPlayPause(t);return;}var b=document.querySelector('button[data-testid=control-button-playpause]')||window.pBtn;if(b)b.click();}catch(e){}})();"
    goto :preview_send_toggle
    :preview_pause_command
    const-string v0, "(function(){var t=false;if(typeof window.__sfTogglePlayback=='function'){window.__sfTogglePlayback(t);return;}try{if(window.AndBridge)window.AndBridge.onNativeUiData('preview-command','');if(typeof window.__sfMarkUserPlaybackIntent=='function')window.__sfMarkUserPlaybackIntent(t);if(typeof window.actPlayPause=='function'){window.actPlayPause(t);return;}var b=document.querySelector('button[data-testid=control-button-playpause]')||window.pBtn;if(b)b.click();}catch(e){}})();"
    :preview_send_toggle
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
    # __sfTogglePlayback''')
    for method, kind in [('onNativePlayerPreviousClick', '0x2'), ('onNativePlayerNextClick', '0x3')]:
        old = '.method public final ' + method + '(Landroid/view/View;)V\n    .locals 1\n'
        new = '.method public final ' + method + '(Landroid/view/View;)V\n    .locals 2\n\n    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;\n    move-result-object v0\n    const/4 v1, ' + kind + '\n    invoke-virtual {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V\n'
        s = replace(s, old, new)
    s += '''\n.method public final previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    if-nez v0, :preview_player_return
    new-instance v0, Lcom/melodix/music/PreviewPlayerController;
    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController;-><init>(Landroid/app/Activity;)V
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    :preview_player_return
    return-object v0
.end method

.method public final attachPreviewAbout(Landroid/view/View;)V
    .locals 1
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p1}, Lcom/melodix/music/PreviewPlayerController;->attachAbout(Landroid/view/View;)V
    return-void
.end method
'''
    files[path] = s

    # Larger playlist title uses only the title already selected natively;
    # no invented artwork, count, availability, or playback action.
    s = files['smali/com/melodix/music/MainActivity.smali']
    s = replace(s, '''    const-string v3, "Titres de la playlist"
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v3, 0x41600000    # 14sp''', '''    const-string v3, "Titres de la playlist"
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    if-eqz v4, :preview_heading_title_ready
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z
    move-result v5
    if-nez v5, :preview_heading_title_ready
    move-object v3, v4
    :preview_heading_title_ready
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v3, 0x41a00000    # 20sp''')
    files['smali/com/melodix/music/MainActivity.smali'] = s

    path = 'smali/m9.smali'; s = files[path]
    s = replace(s, '''.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    :try_start_0
    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V''', '''.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    # Preserve the historical v0=1 for cookie and WebView settings, including
    # every exception path. The package check must use separate registers.
    const/4 v0, 0x1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "com.melodix.music.preview"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V''')
    files[path] = s

    path = 'smali/com/melodix/music/NativeSettingsRowFactory.smali'; s = files[path]
    s = replace(s, '''    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V''', '''    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    # Discreet Preview-only diagnostic: long press the existing About row.
    const-string v10, "Melodix • Client Spotify Natif"
    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-eqz v10, :preview_not_about
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->attachPreviewAbout(Landroid/view/View;)V
    :preview_not_about
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V''')
    # Modern glass card; keep settings text, enabled state and click wiring.
    s = replace(s, '''    const v0, 0xcc141222
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    const/high16 v0, 0x41600000
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V''', '''    const/4 v0, 0x2
    new-array v0, v0, [I
    const/4 v1, 0x0
    const v10, 0xee302342
    aput v10, v0, v1
    const/4 v1, 0x1
    const v10, 0xee171421
    aput v10, v0, v1
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    const/16 v0, 0x12
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSettingsRowFactory;->dp(Landroid/content/Context;I)I
    move-result v0
    int-to-float v0, v0
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V''')
    files[path] = s
    return files

if __name__ == '__main__':
    root = Path(sys.argv[1]); files = prepare(root)
    for name, text in files.items():
        target = root / name; target.parent.mkdir(parents=True, exist_ok=True); target.write_text(text, encoding='utf8')
