#!/usr/bin/env python3
"""The dex compiler may inline these scripts: verify both runtime copies."""
import json
import os
from pathlib import Path

here = Path(__file__).resolve().parent
root = os.environ.get('MELODIX_PREVIEW_ROOT')
smali = (Path(root) / 'smali/com/melodix/music/PreviewPlayerMode.smali') if root else here / 'smali/PreviewPlayerMode.smali'
content = smali.read_text(encoding='utf-8')
for name in ('control.js', 'control-diagnostic.js', 'mode-job.js'):
    encoded = json.dumps((here / name).read_text(encoding='utf-8'), ensure_ascii=True).replace("'", "\\'")[1:-1]
    assert content.count(encoded) == 2, f'{name}: expected field and inlined runtime code'
print('Player mode scripts match both compiled copies')

tiles = (Path(root) / 'smali/com/melodix/music/PreviewPlayerTiles.smali') if root else here / 'smali/PreviewPlayerTiles.smali'
content = tiles.read_text(encoding='utf-8')
for name in ('panel-structure.js', 'panel-read.js', 'queue-job.js', 'panel-job.js'):
    encoded = json.dumps((here / name).read_text(encoding='utf-8'), ensure_ascii=True).replace("'", "\\'")[1:-1]
    assert content.count(encoded) == 2, f'{name}: expected field and inlined runtime code'
print('Player panel scripts match both compiled copies')
