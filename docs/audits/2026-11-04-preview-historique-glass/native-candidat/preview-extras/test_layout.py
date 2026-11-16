#!/usr/bin/env python3
"""Structural checks on built Preview; does not prove on-device rendering."""
import os,xml.etree.ElementTree as ET
from pathlib import Path
r=Path(os.environ['MELODIX_PREVIEW_ROOT']); A='{http://schemas.android.com/apk/res/android}'
ids={e.get('name'):e.get('id') for e in ET.parse(r/'res/values/public.xml').getroot() if e.get('type')=='id'}
assert ids['nativePlayerLargeTitle']=='0x7f09023b'
for folder in ('layout','layout-land','layout-w600dp','layout-w600dp-land'):
 x=ET.parse(r/'res'/folder/'activity_main.xml').getroot(); panel=next(e for e in x.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
 buttons=[e for e in panel.iter() if e.tag=='com.melodix.music.PreviewPlayerMode']
 assert sorted(e.get(A+'tag') for e in buttons)==['like','repeat','shuffle']
 assert len([e for e in panel.iter() if e.tag=='com.melodix.music.PreviewPlayerTiles'])==1
 assert any(e.tag=='Space' and e.get(A+'tag')=='previewPlayerHeaderSpacer' and e.get(A+'layout_width') in ('48.0dip','48.0dp') for e in panel.iter())
 for e in buttons: assert e.get(A+'layout_height') in (('44.0dip','44.0dp') if e.get(A+'tag')=='like' else ('48.0dip','48.0dp'))
for name in ('PreviewPlayerMode','PreviewPlayerTiles'):
 assert (r/'smali/com/melodix/music'/f'{name}.smali').exists()
print('Optional player controls in all four layouts; title ID verified')
