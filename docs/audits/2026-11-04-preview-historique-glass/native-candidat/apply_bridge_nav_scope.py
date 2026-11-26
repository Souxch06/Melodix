#!/usr/bin/env python3
"""Keep spotify_bridge.js's body observer off pages other than open.spotify.com.

On accounts.spotify.com the bridge's body MutationObserver re-ran
syncMobileNavigation -> updateMelodixHome -> deactivateMelodixHome, whose
classList.remove() rewrites the class attribute even when the class is absent,
so the observer fired again without end: the login page froze (blank classic
login, DevTools unanswered; Android 16 emulator, reproduced in Chromium/jsdom).

spotify_bridge.js is a 9016-protected asset and stays byte-identical. The bridge
only creates the observer when window._sfMobileNavObserver is unset, so the
SF_CONFIG script that c91 injects right before the bridge marks it as already
handled outside open.spotify.com, where the Melodix mobile dock has no role.
"""
import sys
from pathlib import Path
SOURCE = 'smali/c91.smali'
OLD = " dockLeftSidebar: %b, touchInput: %b };\"\n"
NEW = (" dockLeftSidebar: %b, touchInput: %b }; if (location.hostname !== \\'open.spotify.com\\'"
       " && !window._sfMobileNavObserver) { window._sfMobileNavObserver = true; }\"\n")
GUARD_JS = "if (location.hostname !== 'open.spotify.com' && !window._sfMobileNavObserver) { window._sfMobileNavObserver = true; }"
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected SF_CONFIG anchor')
    return text.replace(OLD, NEW, 1)
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
