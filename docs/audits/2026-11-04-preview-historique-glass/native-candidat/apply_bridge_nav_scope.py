#!/usr/bin/env python3
"""Stop spotify_bridge.js freezing any page (login and open.spotify.com) and keep its dock off Spotify's own pages.

On accounts.spotify.com the bridge's body MutationObserver re-ran
syncMobileNavigation -> updateMelodixHome -> deactivateMelodixHome, whose
classList.remove() rewrites the class attribute even when the class is absent,
so the observer fired again without end: the login page froze (blank classic
login, DevTools unanswered; Android 16 emulator, reproduced in Chromium/jsdom).

spotify_bridge.js is a 9016-protected asset and stays byte-identical. The bridge
only creates the observer when window._sfMobileNavObserver is unset, so the
SF_CONFIG script that c91 injects right before the bridge marks it as already
handled outside open.spotify.com, where the Melodix mobile dock has no role,
and leaves a hidden #sf-mobile-nav so the bridge does not draw that dock there.
"""
import sys
from pathlib import Path
SOURCE = 'smali/c91.smali'
OLD = " dockLeftSidebar: %b, touchInput: %b };\"\n"
# 1) Every page (open.spotify.com included): classList.remove() of an absent class still rewrites the class
#    attribute, which re-fires the bridge's body observer without end (renderer at 100 % CPU, native shell empty).
#    Making that call a no-op when nothing is removed leaves every real removal untouched.
# 2) Outside open.spotify.com: no body observer and a hidden #sf-mobile-nav placeholder, so the bridge does not
#    draw its Melodix dock over Spotify's own pages (seen on the login page).
SAFE_REMOVE_JS = ("(function(){ if (window.__sfSafeClassRemove) return; window.__sfSafeClassRemove = true; var r = DOMTokenList.prototype.remove;"
                  " DOMTokenList.prototype.remove = function(){ for (var i = 0; i < arguments.length; i++) if (this.contains(arguments[i])) return r.apply(this, arguments); }; })();")
HOST_GUARD_JS = ("if (location.hostname !== 'open.spotify.com') { if (!window._sfMobileNavObserver) window._sfMobileNavObserver = true;"
                 " if (document.body && !document.getElementById('sf-mobile-nav')) { var n = document.createElement('nav'); n.id = 'sf-mobile-nav';"
                 " n.style.setProperty('display', 'none', 'important'); document.body.appendChild(n); } }")
GUARD_JS = SAFE_REMOVE_JS + " " + HOST_GUARD_JS
NEW = " dockLeftSidebar: %b, touchInput: %b }; " + GUARD_JS.replace("'", "\\'") + "\"\n"
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected SF_CONFIG anchor')
    return text.replace(OLD, NEW, 1)
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
