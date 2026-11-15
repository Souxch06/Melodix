#!/usr/bin/env python3
"""Pin and patch non-protected native shell after the 1022134 feedback fixes."""
import hashlib,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
EXPECTED='7143bd2a1d8ba4719412d200d4d14a86b5a3bc855feffc6fb282c301d8555b4e'

def one(text, old, new):
    if text.count(old)!=1: raise ValueError('unexpected anchor: '+old[:90])
    return text.replace(old,new,1)

def apply(root):
    p=root/'assets/native_ui_shell.js';raw=p.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=EXPECTED: raise ValueError('unexpected shell input; no changes made')
    s=raw.decode('utf8'); helper=(HERE/'preview-liked-fallback.js').read_text(encoding='utf8')
    s=one(s, '''        if (!isSpotifyHome()) {
            if (playbackSnapshot().playing) return false;
            window.location.assign('https://open.spotify.com/');
            return false;
        }''', '''        // A stale Home request can execute after a native browse tap. Never
        // destroy the player document based on a false or unknown state.
        if (!isSpotifyHome()) return false;''')
    # Non-Home rows used to overwrite the Home-only text cache and send two
    # unnecessary native text callbacks on every library/detail refresh.
    s=one(s, "            if (lines.length) {\n                var listText = lines.join('\\n');",
             "            if (screen === 'home' && lines.length) {\n                var listText = lines.join('\\n');")
    s=one(s, '    var openCollectionTimer = null;', helper+'\n    var openCollectionTimer = null;')
    s=one(s, '    function cancelPendingCollectionNavigation() {\n        stopCollectionFallback();',
             '    function cancelPendingCollectionNavigation() {\n        cancelPreviewLiked();\n        stopCollectionFallback();')
    s=one(s, '''                previewLoadState(failed ? 'failed' : 'no-data');
                // Only retry a tokenless attempt''', '''                previewLoadState(failed ? 'failed' : 'no-data');
                // Try once after the existing bridge yields no usable data.
                if (previewFallbackLiked(uri, String(value), requestId)) return;
                // Only retry a tokenless attempt''')
    p.write_text(s,encoding='utf8')
if __name__=='__main__':
    if len(sys.argv)!=2: raise SystemExit('usage: apply_preview_library_followup.py PROJECT')
    apply(Path(sys.argv[1]))
