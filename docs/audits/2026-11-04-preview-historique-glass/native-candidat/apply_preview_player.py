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
STORE_SOURCE_SHA = '194662c8da926900bfe3aa4695121b19248f431f31e4a7ff343be374fa99a082'
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
SOURCE_SHA = '5e992fcb1d7e5450d16427e0f204193d25e17500a6e991848df6195765cbbd92'
HELPER_SHA = {
    'PreviewPlayerController$1.smali': '04b724419c430be5f4ebacc3a1d443d30f480de152d809128c94ac4f13f4296c',
    'PreviewPlayerController$2.smali': 'ff9f8f02b423a2b9de58a5fb8ed5244f555f3bf9478776834d9e5bcb3616d39e',
    'PreviewPlayerController$3.smali': 'b7242cc87f281ba849b6eb9d8f41660c4778e73b6e6ba5701ac972d52addc583',
    'PreviewPlayerController$4.smali': 'bc0a1d6ea01403a3be3546e38bcf335a06ad9736285147e1a8fbfb9096102b69',
    'PreviewPlayerController$5.smali': '2c610a8161ced13781161b68fa72291810cbc1ae2f279c0f6e5a10026cf6afbc',
    'PreviewPlayerController$6.smali': '22c33031d8a51537b4487a0958e83e9c221358659f88c83e0a17cea34fbcb7a9',
    'PreviewPlayerController$7.smali': '74be0a9bab39ad09c755aae64bbc155eb6eeb9bcda61c04c369226e484f4217c',
    'PreviewPlayerController$8.smali': '9af4d4f319a024a261ac836b768b0951e6929cddf188c8460ef4f37a3ed7a224',
    'PreviewPlayerController$9.smali': 'fadbf6d314b5fd562a2c6bf37819a7029db162704e479b66b1bcec1dbfd8f40f',
    'PreviewPlayerController$10.smali': 'f795b0a29814d95527c8bae7ab58cdad83ecb3322aebe9b1d11395be42796a89',
    'PreviewPlayerController$11.smali': 'e7d8b93e5fecba443efbada977142063f47909a45e41e574f982b03ea9c4b6fa',
    'PreviewPlayerController$12.smali': '8c3c7c0d7e2976f3a65b737f2c9c5058c958f7da43df4199f72785fda21c79b6',
    'PreviewPlayerController$6$1.smali': 'e60dffcc09789606dd092763b707d607076e636ec92c383c1e7fa3566efb6505',
    'PreviewPlayerController$13.smali': 'fd0d454e59216969b7aed07482908c10be6f72d5d7a1c00a32f0191a2defc9b6',
    'PreviewPlayerController$14.smali': 'b91c1f8643dee99b13114f5d98ac66a7c515ee80cc297371e01088ed8c2a6ce2',
    'PreviewPlayerController$15.smali': '97b84739332069fbc4927dba88dfaa5d06da52952b8a39a7e43dffc23c0edddb',
    'PreviewPlayerController$16.smali': '24ab6b8ffd9a9ebaeaaa5175683bba7a9a32a65c1fa9d4789d5ccd4ebda7ac5f',
    'PreviewPlayerControllerPlayAll$1.smali': 'a0ddbef9f8e4d3ea373fc2f0386198d05255b4b9541ae8ca3ae3d85c580523b4',
    'PreviewPlayerControllerPlayAll$2.smali': 'afddf0716256901d75a643461526967c12bb6359f60d153005f0fd93053af800',
    'PreviewPlayerControllerPlayAll.smali': 'baa96a4aff03610621f9c5bb4d5fc91f735a13c81f7c36ce4479d7fb37c5e02d',
    'PreviewPlayerControllerPlayAll$3.smali': 'e63d02315e7d432dc7090f6b751f08454282866c69e3dbb24144ea49fe5fb4ce',
    'PreviewPlayerControllerPlayAll$4.smali': 'c51e1ac9cd765354dc26dce0987dd260a8c2674ae6b0d0d9365899529c8b1ba7',
    'PreviewPlayerControllerPlayAll$10.smali': '941b991763f4406ea381a025eab1cab2e3205c200817b58d5a1756ebecb67caf',
    'PreviewPlayerControllerPlayAll$5.smali': '355a08fbbc58c88d689318b17775747a4ff705f7c4067bd0d8626bc487d42f8b',
    'PreviewPlayerControllerPlayAll$6.smali': '459bdc8eba8a7c7b084320a018594a5b2d29368d122ad9d919d402930c8f0722',
    'PreviewPlayerControllerPlayAll$7.smali': 'fa137d51eefb874a6b33132cd59c86f267469931f2e24bcbe2fe39319bae6a52',
    'PreviewPlayerControllerPlayAll$8.smali': 'd4a273a3ab2c6d9079a85d39aabea7e67738f040c043952db03c437578d81d46',
    'PreviewPlayerControllerPlayAll$9.smali': '332f6af776652e1e366ef33f0029a7758458dc0331f0b22d1cc313836ec4b2a4',
    'PreviewPlayerControllerPlayAll$1$1.smali': '13687799de02655f05c0795d283d0473500d8cc7ec568af0ea12b143e7246033',
    'PreviewPlayerControllerPlayAll$11.smali': '1d7f94155fe399baf80ab7a45e776e789ac2e02aacf3c3e7aa402fdac150de19',
    'PreviewPlayerControllerPlayAll$12.smali': '5058466b8fa979ec72fab0474d8b83e5f978c502e59c2dabb0b625c551f7320e',
    'PreviewPlayerControllerPlayAll$13.smali': 'f8bc17a442216e0b5cb3139bec7b8b52634ccd7443d27073c5af6e617adda566',
    'PreviewPlayerControllerPlayAll$14.smali': '03ace07ec02d3f5106aa4a7e4db7366a91d3d33bd35a3652918e7a6fec0a0a18',
    'PreviewPlayerControllerPlayAll$15.smali': '7820bd1df48db3f794f76bb2848186066ccc8220d4a1ec33020d558dfcf115b3',
    'PreviewPlayerControllerPlayAll$16.smali': 'ff48198f866ffd300e7f1240e2956408827d889d99a0639c5b40533566526838',
    'PreviewPlayerController$17.smali': '2abc9a2f2bfccb40281fc396da9aead9eb297177da0c78a540cbc9783c0316d0',
    'PreviewPlayerControllerPlayAll$12$1.smali': 'bf15b18801d220d575a62acbd04401c74aa80211547cb10dc44733bc574a57c8',
    'PreviewPlayerControllerPlayAll$17.smali': '4cfa2fa2ce2b72f2b9b86c4148077dc2af31bdf9b114d08570c229f00ce722d8',
    'PreviewPlayerControllerPlayAll$18$1$1.smali': 'ea805a63ca5078a952fac640c393f28abb938f6fc5afd4b89c84b79b1c91a2c9',
    'PreviewPlayerControllerPlayAll$18$1.smali': '262de707b3ea716f4454b57056728b866dc783a4651ddd732dc855639a87a245',
    'PreviewPlayerControllerPlayAll$18.smali': 'eba0ff13ca63da091b6eec207e6f5c706506bb68f47e5386825eff78cebab1ce',
    'PreviewPlayerController.smali': 'fdac620f09f30a9eb3c06de6aec603f8ffa99e89c6da3ca38e1aa7df09004437',
    'PreviewLastTrackStore$1$1.smali': '945ee7420a49b41550b889369932b30e3f0f43943fdb46700d0dbfaf550792dc',
    'PreviewLastTrackStore$1.smali': '8f54f12ff47b7a995072f2255a1c28ffa996e311e8865cd8550330758557ace2',
    'PreviewLastTrackStore$2.smali': '1e3ffc3af8858e6b6f609c18bdf689f5d00d0aaf1c592a201844e24fb91c5aaa',
    'PreviewLastTrackStore$3.smali': '35a948ee2b225f73cca0de5917fbe07ab8edb837d07c0cae27334ee4046b6426',
    'PreviewLastTrackStore$Callback.smali': 'b471eb4dd8bada9467995bf6d582dccf8a8d79b4ea51686075883033675fe37c',
    'PreviewLastTrackStore$Record.smali': 'add6ce9f75189b2f4de95480fd50ed2d31d922253a442ee9c88c0d8e63efa67d',
    'PreviewLastTrackStore.smali': '70c2e4182d6910a241ddccbb4a2fccc20e70c0ddf680d4f90726e6e40609bb2d',
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
    # User report 1022399: the old PR-6 runtime diagnostic dialog popped up on
    # every Spotify page load. Disable only its entry point; Settings keeps its own diagnostic.
    path = 'smali/com/melodix/music/RuntimeDiagnostic.smali'
    files[path] = replace((root / path).read_text(), '.method public static runIfPreview(Landroid/webkit/WebView;Ljava/lang/String;)V\n    .locals 4\n', '.method public static runIfPreview(Landroid/webkit/WebView;Ljava/lang/String;)V\n    .locals 4\n\n    return-void\n')

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
