#!/usr/bin/env python3
"""Remove the empty subtitle view from native row layout, presentation only."""
import hashlib
import sys
from pathlib import Path

SOURCE = 'smali/com/melodix/music/NativeUiRowFactory.smali'
EXPECTED_SHA256 = '26068d0e186cd5e81e4f1455782a792d679099581ee50a022eaa581a765e4338'
OLD = '''    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v10, 0x41500000'''
NEW = '''    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    # No subtitle (including no duration) means no empty text line or margin.
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :lot1_subtitle_present
    const/16 v10, 0x8
    invoke-virtual {v4, v10}, Landroid/view/View;->setVisibility(I)V
    :lot1_subtitle_present
    const/high16 v10, 0x41500000'''

def prepare(root):
    raw = (root/SOURCE).read_bytes()
    if hashlib.sha256(raw).hexdigest() != EXPECTED_SHA256: raise ValueError('unexpected native row factory')
    text = raw.decode('utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected subtitle anchor')
    return text.replace(OLD, NEW, 1)

if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
