#!/usr/bin/env python3
"""Check compiled Smali, not just Java source, for damaged player text."""
import os
import re
from pathlib import Path

here = Path(__file__).resolve().parent
root = os.environ.get('MELODIX_PREVIEW_ROOT')
smali = (Path(root) / 'smali/com/melodix/music') if root else here / 'smali'

def text(path):
    raw = path.read_text(encoding='utf-8')
    return re.sub(r'\\u([0-9a-fA-F]{4})', lambda m: chr(int(m.group(1), 16)), raw)

for prefix in ('PreviewPlayerMode', 'PreviewPlayerTiles', 'PreviewPlayerVolume'):
    files = sorted(smali.glob(prefix + '*.smali'))
    assert files, f'missing {prefix} Smali in {smali}'
    for path in files:
        assert '\ufffd' not in text(path), f'Unicode replacement character in {path}'

tiles = text(smali / 'PreviewPlayerTiles.smali')
for value in ('☰\\nFile', '♬\\nParoles', '▣\\nAppareils', '◖))\\nVolume'):
    assert value in tiles, f'missing compiled tile text {value!r}'
mode = text(smali / 'PreviewPlayerMode.smali')
for value in ('Titre aimé', 'Action non confirmée. Réessayer', 'Lecture aléatoire activée'):
    assert value in mode, f'missing compiled mode text {value!r}'
assert 'Indisponible dans cette version' in ''.join(text(p) for p in smali.glob('PreviewPlayerTiles*.smali'))
volume = text(smali / 'PreviewPlayerVolume.smali')
assert 'Volume du lecteur' in volume
assert '◖×  Silence' in volume and '↻  Actualiser' in volume
assert 'setCompoundDrawablesWithIntrinsicBounds' not in volume
chrome = text(smali / 'PreviewPlayerChrome.smali')
assert 'captureBeforeExpand' in chrome and 'previousScreen' in chrome
if root:
    activity = text(smali / 'MainActivity.smali')
    expand = activity.split('.method public final onNativePlayerExpandClick',1)[1].split('.end method',1)[0]
    assert expand.index('captureBeforeExpand') < expand.index('setNativeScreen')

print('Player tile glyphs and French text verified in compiled Smali')
