#!/usr/bin/env python3
"""Pin and patch non-protected native shell after the 1022134 feedback fixes."""
import hashlib,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
EXPECTED='7143bd2a1d8ba4719412d200d4d14a86b5a3bc855feffc6fb282c301d8555b4e'
HELPER_SHA='d7f2a7ef57f60c6c78ef5ba94e3e530da80b550ec188555fa4706032889738cb'

def one(text, old, new):
    if text.count(old)!=1: raise ValueError('unexpected anchor: '+old[:90])
    return text.replace(old,new,1)

def apply(root):
    p=root/'assets/native_ui_shell.js';raw=p.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=EXPECTED: raise ValueError('unexpected shell input; no changes made')
    helper_bytes=(HERE/'preview-liked-fallback.js').read_bytes()
    if hashlib.sha256(helper_bytes).hexdigest()!=HELPER_SHA: raise ValueError('unexpected helper; no changes made')
    s=raw.decode('utf8'); helper=helper_bytes.decode('utf8')
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
        // A duplicate callback within one second of observed movement must not
        // freeze the native clock. Extended buffering and pause still stop it.
        var advancing = !!(same && (increased || (info.previewPositionMs === previewLastPosition &&
            previewLastMovementAt >= 0 && at >= previewLastMovementAt && at - previewLastMovementAt <= 1000)));
        previewLastTrack = valid ? info.previewTrackUri : '';""")
    s=one(s, '    var openCollectionTimer = null;', helper+'\n    var openCollectionTimer = null;')
    s=one(s, '    function cancelPendingCollectionNavigation() {\n        stopCollectionFallback();',
             '    function cancelPendingCollectionNavigation() {\n        cancelPreviewLiked();\n        stopCollectionFallback();')
    s=one(s, '''                previewLoadState(failed ? 'failed' : 'no-data');
                // Only retry a tokenless attempt''', '''                previewLoadState(failed ? 'failed' : 'no-data');
                // Try once after the existing bridge yields no usable data.
                if (previewFallbackCollection(uri, String(value), requestId)) return;
                // Only retry a tokenless attempt''')
    s=one(s, """                if (bridgeReady && (!needsToken || !!window.spotAuthToken)) request();
                else waitForReady(needsToken);""", """                if (bridgeReady && (!needsToken || !!window.spotAuthToken)) request();
                else if (!bridgeReady && previewFallbackCollection(uri, String(value), requestId)) return;
                else waitForReady(needsToken);""")
    s=one(s, """        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') request();
        else waitForReady(false);""", """        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') request();
        else if (!previewFallbackCollection(uri, String(value), requestId)) waitForReady(false);""")
    p.write_text(s,encoding='utf8')
if __name__=='__main__':
    if len(sys.argv)!=2: raise SystemExit('usage: apply_preview_library_followup.py PROJECT')
    apply(Path(sys.argv[1]))
