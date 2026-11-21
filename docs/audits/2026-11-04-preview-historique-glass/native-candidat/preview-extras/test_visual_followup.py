#!/usr/bin/env python3
"""Structural regression checks; not an Android visual or touch test."""
from pathlib import Path
import os, xml.etree.ElementTree as ET
r=Path(os.environ['MELODIX_PREVIEW_ROOT']); prior=Path(os.environ['MELODIX_PREVIEW_VISUAL_PRIOR'])
a='{http://schemas.android.com/apk/res/android}'; app='{http://schemas.android.com/apk/res-auto}'
protected=['assets/native_ui_shell.js','assets/spotify_bridge.js','smali/com/melodix/music/MainActivity.smali',
           *['smali/com/melodix/music/PreviewPlayerController'+suffix+'.smali' for suffix in ('','$1','$2','$3','$4','$5')],
           *['smali/com/melodix/music/PreviewPlayerMode'+suffix+'.smali' for suffix in ('','$1','$2','$3','$4','$5','$6')],
           'smali/com/melodix/music/PreviewPlayerTiles$1.smali']
for path in protected:
 assert (r/path).read_bytes()==(prior/path).read_bytes(),path
for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
 def parse(root):
  x=ET.parse(root/'res'/folder/'activity_main.xml').getroot()
  p=next(e for e in x.iter() if e.get(a+'id')=='@id/nativePlayerPanel')
  return x,p
 x,p=parse(r);old,op=parse(prior)
 def cmds(p):return [(e.get(a+'id'),e.get(a+'tag'),e.get(a+'onClick')) for e in p.iter() if e.get(a+'onClick') or e.tag=='com.melodix.music.PreviewPlayerMode']
 assert cmds(p)==cmds(op),folder
 def byid(root,name):return next(e for e in root.iter() if e.get(a+'id')=='@id/'+name)
 seek=byid(p,'nativePlayerProgress');oldseek=byid(op,'nativePlayerProgress')
 for attr in ('id','max','progress','indeterminate','onClick','enabled'):
  assert seek.get(a+attr)==oldseek.get(a+attr),(folder,attr)
 assert seek.get(a+'thumbTint') in ('#ffffffff','#FFFFFFFF')
 title=byid(p,'nativePlayerLargeTitle');assert title.get(a+'textSize') in ('23.0sp','23sp') and title.get(a+'maxLines')=='2' and title.get(a+'ellipsize')=='end'
 assert byid(p,'nativePlayerLargeArtist').get(a+'maxLines')=='2'
 art=byid(p,'nativePlayerLargeArtwork');assert art.get(a+'src')=='@drawable/native_cover_placeholder'
 card=next(e for e in p.iter() if e.tag.endswith('CardView'));assert card.get(app+'contentPadding') in ('1.0dip','1.0dp') and card.get(app+'cardCornerRadius') in ('30.0dip','30.0dp')
 assert byid(p,'nativePlayerLargePlayPauseButton').get(a+'background')=='@drawable/native_button_white'
 assert next(e for e in p.iter() if e.get(a+'tag')=='shuffle').get(a+'background')=='@null'
 assert any(e.tag=='TextView' and e.get(a+'text')=='LECTURE EN COURS' for e in p.iter())
 assert any(e.get(a+'contentDescription')=='Paramètres' and e.get(a+'onClick')=='onNativeSettingsClick' for e in x.iter())
 assert any(e.tag=='Space' and e.get(a+'layout_weight')=='1.0' for e in p.iter())
 assert len([e for e in p.iter() if e.tag=='com.melodix.music.PreviewPlayerTiles'])==1
def resource_ids(root):
 return {(e.get('type'),e.get('name')):e.get('id') for e in ET.parse(root/'res/values/public.xml').getroot() if e.tag=='public'}
assert resource_ids(r)==resource_ids(prior), 'resource IDs changed'
print('Four layouts: visual structure and unchanged player/DOM/action bytecode checked')
