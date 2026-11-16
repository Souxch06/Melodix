#!/usr/bin/env python3
"""Preview only: keep the screen in portrait unless the "bigwindow" mode is set.

The historical MainActivity picks the orientation once: landscape for the
"bigwindow" mode, portrait when its lock flag is set, otherwise unspecified
(free rotation). This patch changes only that last fallback to portrait.
Fails closed unless exactly one matching block is found. Touches no asset.
"""
import re
import sys
from pathlib import Path

TARGET = 'smali/com/melodix/music/MainActivity.smali'
BLOCK = re.compile(
    r'(:cond_3\n\s*const/4 v0, )-0x1(\n(?:[ \t]*(?:\.line \d+)?\n)*[ \t]*:goto_0\n[ \t]*'
    r'invoke-virtual \{p0, v0\}, Landroid/app/Activity;->setRequestedOrientation\(I\)V)')


def patch(text):
    if text.count('setRequestedOrientation') != 1:
        raise ValueError('expected exactly one orientation call; no changes made')
    if len(BLOCK.findall(text)) != 1:
        raise ValueError('orientation fallback block not found; no changes made')
    return BLOCK.sub(lambda m: m.group(1) + '0x1' + m.group(2), text, count=1)


def apply(root):
    path = Path(root) / TARGET
    path.write_text(patch(path.read_text(encoding='utf-8')), encoding='utf-8')
    print('preview portrait fallback applied')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_preview_portrait.py <work-dir>')
    apply(sys.argv[1])
