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
assert '0xd9ffffff' in art and 'kind.equals("like")?(pending?0.65f:known?1f:0.35f)' in mode
assert 'Chargement :' in mode and 'Indisponible :' in mode and 'reasonText()' in mode
assert 'Indisponible dans cette version' in tiles and 'setOnDismissListener' in tiles
for forbidden in ('import android.webkit', 'evaluateJavascript(', 'setVisibility(', 'AudioManager', 'FLAG_NOT_TOUCH_MODAL'):
    assert forbidden not in tiles, forbidden
for forbidden in ('loadUrl(', 'reload(', 'fetch(', 'api.spotify.com'):
    assert forbidden not in tiles
print('Symmetric player headers, like contrast and disabled reasons checked structurally')

# This guard checks the actual packaged implementation, not the Java source alone.
compiled='\n'.join(p.read_text(encoding='utf8') for p in (root/'smali/com/melodix/music').glob('PreviewPlayerTiles*.smali'))
assert compiled
for forbidden in ('Landroid/webkit/WebView;', 'evaluateJavascript', '->setVisibility(', 'Landroid/media/AudioManager;', 'FLAG_NOT_TOUCH_MODAL'):
    assert forbidden not in compiled, forbidden
print('Native panel Smali cannot reveal WebView or alter Android audio via this component')
