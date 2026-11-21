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

for prefix in ('PreviewPlayerMode', 'PreviewPlayerTiles', 'PreviewPlayerVolume', 'PreviewPlayerSheet', 'PreviewPanelIcon'):
    files = sorted(smali.glob(prefix + '*.smali'))
    assert files, f'missing {prefix} Smali in {smali}'
    for path in files:
        assert '\ufffd' not in text(path), f'Unicode replacement character in {path}'

tiles = text(smali / 'PreviewPlayerTiles.smali')
for value in ('File', 'Paroles', 'Appareils', 'Volume'):
    assert value in tiles, f'missing compiled tile text {value!r}'
assert 'Lcom/melodix/music/PreviewPanelIcon;' in tiles
mode = text(smali / 'PreviewPlayerMode.smali')
for value in ('Titre aimé', 'Action non confirmée. Réessayer', 'Lecture aléatoire activée'):
    assert value in mode, f'missing compiled mode text {value!r}'
assert 'Indisponible dans cette version' in ''.join(text(p) for p in smali.glob('PreviewPlayerTiles*.smali'))
volume = text(smali / 'PreviewPlayerVolume.smali')
assert 'Volume du lecteur' in volume
assert 'Réactiver' in volume and 'Actualiser' in volume
icon = text(smali / 'PreviewPanelIcon.smali')
assert 'Landroid/text/style/ImageSpan;' in icon
assert 'Lcom/melodix/music/PreviewPanelIcon;' in volume
assert 'setCompoundDrawablesWithIntrinsicBounds' not in volume
sheet = text(smali / 'PreviewPlayerSheet.smali')
assert 'showSheet' in sheet and 'dismissImmediately' in sheet and 'dragListener' in sheet
assert 'Lcom/melodix/music/PreviewPlayerSheet;' in volume and 'Lcom/melodix/music/PreviewPlayerSheet;' in tiles
chrome = text(smali / 'PreviewPlayerChrome.smali')
assert 'captureBeforeExpand' in chrome and 'previousScreen' in chrome and 'drawNativeSnapshot' in chrome
if root:
    activity = text(smali / 'MainActivity.smali')
    expand = activity.split('.method public final onNativePlayerExpandClick',1)[1].split('.end method',1)[0]
    assert expand.index('captureBeforeExpand') < expand.index('setNativeScreen')

# Every synthetic accessor an inner class calls must exist in its outer class.
# Mixing javac and ECJ output (access$000 vs access$0) crashed 1022254 at launch.
for path in sorted(smali.glob('Preview*.smali')):
    for owner, name in re.findall(r'Lcom/melodix/music/(Preview[A-Za-z0-9]*);->(access\$[0-9]+)\(', path.read_text(encoding='utf-8')):
        outer = smali / (owner + '.smali')
        assert outer.exists() and re.search(r'^\.method[^\n]* ' + re.escape(name) + r'\(', outer.read_text(encoding='utf-8'), re.M), path.name + ' calls missing ' + owner + '.' + name

print('Player tile glyphs and French text verified in compiled Smali')
