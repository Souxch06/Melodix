#!/usr/bin/env python3
"""Deterministic layout/source checks; no claim of Android or Spotify validation."""
import os,unittest,xml.etree.ElementTree as ET
from pathlib import Path
A='{http://schemas.android.com/apk/res/android}';APP='{http://schemas.android.com/apk/res-auto}'
ROOT=Path(os.environ['MELODIX_PREVIEW_ROOT']);PRIOR=Path(os.environ['MELODIX_PREVIEW_VISUAL_PRIOR']);HERE=Path(__file__).resolve().parent

class FinalPlayer(unittest.TestCase):
 def test_structure_and_seek_unchanged(self):
  for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
   def panel(root):
    xml=ET.parse(root/'res'/folder/'activity_main.xml').getroot()
    return next(e for e in xml.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
   p=panel(ROOT);prior=panel(PRIOR)
   bar=lambda e:next(x for x in e.iter() if x.get(A+'id')=='@id/nativePlayerProgress')
   self.assertEqual(bar(p).attrib,bar(prior).attrib,folder)
   self.assertEqual(p.get(A+'paddingBottom'),'24.0dip')
   spacer=next(e for e in p.iter() if e.get(A+'tag')=='previewPlayerHeaderSpacer')
   self.assertEqual((spacer.tag,spacer.get(A+'layout_width')),('Space','48.0dip'))
   like=next(e for e in p.iter() if e.get(A+'tag')=='like')
   self.assertEqual(like.get(A+'layout_width'),'44.0dip');self.assertEqual(like.get(A+'layout_height'),'44.0dip')
   card=next(e for e in p.iter() if e.get(A+'tag')=='previewPlayerArtCard')
   self.assertEqual(card.get(APP+'cardElevation'),'26.0dip')
  for name in ['assets/native_ui_shell.js','assets/spotify_bridge.js','smali/com/melodix/music/MainActivity.smali',
               *['smali/com/melodix/music/PreviewPlayerController'+x+'.smali' for x in ('','$1','$2','$3','$4','$5')],
               *['smali/com/melodix/music/PreviewPlayerMode'+x+'.smali' for x in ('','$1','$2','$3','$4','$5','$6')],
               'smali/com/melodix/music/PreviewPlayerTiles$1.smali']:
   self.assertEqual((ROOT/name).read_bytes(),(PRIOR/name).read_bytes(),name)
 def test_cosmetics_are_noninteractive(self):
  chrome=(HERE/'PreviewPlayerChrome.java').read_text();tile=(HERE/'PreviewPlayerTiles.java').read_text()
  like=(HERE/'PreviewPlayerLikeArt.java').read_text();play=(HERE/'PreviewPlayerPlayButton.java').read_text()
  for s in ('b.setTextColor(0xffb4aec5)','b.setBackgroundTintList(null)','b.setStateListAnimator(null)','b.setElevation(0f)','b.setTranslationZ(0f)','b.setForeground(null)','tile.setColor(0x14ffffff)','tile.setStroke(dp(1),0x1fffffff)'):
   self.assertIn(s,tile)
  for s in ('glass.setColor(0x17ffffff)','glass.setStroke(dp(1),0x24ffffff)','((ImageView)like).setImageAlpha(0)','new PreviewPlayerLikeArt(like)'):
   self.assertIn(s,chrome)
  for s in ('getContentDescription()','Retirer des titres likés','0xfff5f5f7','0xd9ffffff','canvas.drawPath(heart,paint)'):
   self.assertIn(s,like)
  self.assertIn('id != lastIcon',play);self.assertIn('id == 0x7f080122 ? 0.92f : 1f',play)
  for code in (chrome,like,play):
   for term in ('evaluateJavascript','setOnSeekBarChangeListener','performClick','http://','https://'):
    self.assertNotIn(term,code)
  bg=(ROOT/'res/drawable/native_player_background.xml').read_text()
  self.assertIn('bottom="150.0dip"' if ROOT.name.endswith('decoded') else 'bottom="150dp"',bg)
 def test_artwork_geometry_model(self):
  def size(width,available):
   limit=min(318,width)
   if available>=limit:limit=min(342,width)
   return min(limit,max(80,available))
  self.assertEqual(size(342,350),342)
  self.assertEqual(size(342,330),330)
  self.assertEqual(size(342,318),318)
  self.assertEqual(size(342,300),300)
  self.assertEqual(size(312,400),312)
  self.assertEqual(size(500,400),342)
  src=(HERE/'PreviewPlayerChrome.java').read_text()
  self.assertIn('available>=limit)limit=Math.min(dp(342),frame.getWidth())',src)

if __name__=='__main__':unittest.main(verbosity=2)
