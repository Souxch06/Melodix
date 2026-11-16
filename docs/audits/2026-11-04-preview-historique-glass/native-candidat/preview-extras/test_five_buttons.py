#!/usr/bin/env python3
"""Player structure and scoped accessibility checks; not an Android rendering test."""
import os, xml.etree.ElementTree as ET
from pathlib import Path
A='{http://schemas.android.com/apk/res/android}'
here=Path(__file__).resolve().parent
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
for folder in ('layout','layout-land','layout-w600dp','layout-w600dp-land'):
    xml=ET.parse(root/'res'/folder/'activity_main.xml').getroot()
    panel=next(x for x in xml.iter() if x.get(A+'id')=='@id/nativePlayerPanel')
    header=next(x for x in panel.iter() if any(c.get(A+'tag')=='previewPlayerHeaderSpacer' for c in x))
    left,label,right=list(header)
    assert left.get(A+'onClick')=='onNativeBackClick'
    assert left.get(A+'layout_width') in ('48dp','48.0dip')
    assert right.get(A+'layout_width')==left.get(A+'layout_width')
    assert label.get(A+'text')=='LECTURE EN COURS' and label.get(A+'gravity')=='center'
    assert label.get(A+'layout_width') in ('0dp','0.0dip') and label.get(A+'layout_weight')=='1.0'
art=(here/'PreviewPlayerLikeArt.java').read_text(encoding='utf-8')
mode=(here/'PreviewPlayerMode.java').read_text(encoding='utf-8')
tiles=(here/'PreviewPlayerTiles.java').read_text(encoding='utf-8')
assert '0xd9ffffff' in art and 'kind.equals("like")?(pending?0.65f:1f)' in mode
assert 'Chargement :' in mode and 'Indisponible :' in mode and 'reasonText()' in mode
assert 'reasonText(reasons[i])' in tiles and 'disponible quand le contrôle Spotify est présent' in tiles
assert 'FLAG_NOT_TOUCH_MODAL' in tiles and 'root.setVisibility(previous)' in tiles
for forbidden in ('loadUrl(', 'reload(', 'fetch(', 'api.spotify.com'):
    assert forbidden not in tiles
print('Symmetric player headers, like contrast and disabled reasons checked structurally')
