#!/usr/bin/env python3
"""Stop spotify_bridge.js from freezing every non-Home page (accounts.spotify.com included).

deactivateMelodixHome() called body.classList.remove('sf-melodix-home-active') even when
the class was absent. classList.remove() still rewrites the class attribute, so the body
MutationObserver (attributes: class) fired syncMobileNavigation -> updateMelodixHome ->
deactivateMelodixHome again, forever: the login page went blank and DevTools stopped
answering (Android 16 emulator; reproduced in Chromium on the real login page).
"""
import sys
from pathlib import Path
SOURCE = 'assets/spotify_bridge.js'
OLD = "        document.body?.classList.remove('sf-melodix-home-active');\n"
NEW = ("        // classList.remove() rewrites the class attribute even when the class is absent; that\n"
       "        // mutation re-triggers the body observer (syncMobileNavigation) forever.\n"
       "        if (document.body?.classList.contains('sf-melodix-home-active')) document.body.classList.remove('sf-melodix-home-active');\n")
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected deactivateMelodixHome anchor')
    return text.replace(OLD, NEW, 1)
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
