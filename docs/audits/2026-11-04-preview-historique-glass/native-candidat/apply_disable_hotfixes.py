#!/usr/bin/env python3
"""Stop downloaded Firebase hotfixes from replacing the shipped Melodix assets.

On a release (non-debuggable) Preview, m9.d() read filesDir/hotfixes/<asset>
first. After the first launch those files exist and silently replace the Glass
css_hacks.css (seen on Android 16: Glass login on first launch, plain black on
relaunch). Same one-line change as the current smali/m9.smali: reads go to a
directory that never exists and fall through to the APK asset.
"""
import sys
from pathlib import Path

SOURCE = 'smali/m9.smali'
OLD = '    const-string v4, "hotfixes/"\n'
NEW = '    # Downloaded hotfixes must not replace the shipped Melodix assets.\n    const-string v4, "hotfixes_off/"\n'

def prepare(root):
    # Runs after the other patches, which change m9.smali: anchor check only.
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected hotfix anchor')
    return text.replace(OLD, NEW, 1)

if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
