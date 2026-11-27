#!/usr/bin/env python3
"""Back from the Library returns to Home; only Home leaves the app (last patch, no pinned hash).

Uses the Home tab action: onNativeBackClick restores the saved return screen, which on device was still Library.

The followup patch sends a Library Back straight to moveTaskToBack, so Back looks like an exit.
Spotify goes Library -> Home first. Only the Library check changes: Home and Search still background.
"""
import sys
from pathlib import Path
SOURCE = 'smali/com/melodix/music/MainActivity.smali'
OLD = ('    if-eqz v2, :not_handled\n    :background\n    const/4 v0, 0x1\n'
       '    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z\n    const/4 v0, 0x1\n    return v0\n    :handle')
NEW = ('    if-nez v2, :lib_home\n    goto :not_handled\n    :lib_home\n'
       '    const/4 v0, 0x0\n    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->onNativeHomeClick(Landroid/view/View;)V\n'
       '    const/4 v0, 0x1\n    return v0\n'
       '    :background\n    const/4 v0, 0x1\n'
       '    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z\n    const/4 v0, 0x1\n    return v0\n    :handle')
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected Library Back block in MainActivity')
    return text.replace(OLD, NEW, 1)
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
