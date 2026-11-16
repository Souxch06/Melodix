#!/usr/bin/env python3
"""Presentation invariants and SeekBar geometry model; not a device rendering test."""
import os,unittest,xml.etree.ElementTree as ET
from pathlib import Path
A='{http://schemas.android.com/apk/res/android}'
APP='{http://schemas.android.com/apk/res-auto}'
ROOT=Path(os.environ['MELODIX_PREVIEW_ROOT'])
PRIOR=Path(os.environ['MELODIX_PREVIEW_VISUAL_PRIOR'])
HERE=Path(__file__).resolve().parent

class Polish(unittest.TestCase):
 def test_four_layouts(self):
  for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
   with self.subTest(folder=folder):
    x=ET.parse(ROOT/'res'/folder/'activity_main.xml').getroot()
    panel=next(e for e in x.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
    parent={c:p for p in panel.iter() for c in p}
    find=lambda id:next(e for e in panel.iter() if e.get(A+'id')=='@id/'+id)
    bar=find('nativePlayerProgress')
    self.assertEqual(bar.get(A+'layout_marginLeft'),'-12.0dip')
    self.assertEqual(bar.get(A+'layout_marginRight'),'-12.0dip')
    self.assertEqual(bar.get(A+'max'),'1000')
    self.assertEqual(find('nativePlayerLargeTitle').get(A+'textSize'),'23.0sp')
    self.assertEqual(find('nativePlayerLargeTitle').get(A+'textFontWeight'),'800')
    play=find('nativePlayerLargePlayPauseButton');row=parent[play]
    self.assertEqual(row.get(A+'clipChildren'),'false')
    self.assertEqual(row.get(A+'clipToPadding'),'false')
    self.assertEqual(play.get(A+'onClick'),'onNativePlayPauseClick')
    menu=next(e for e in panel.iter() if e.get(A+'contentDescription')=='Menu indisponible')
    self.assertEqual(menu.get(A+'visibility'),'invisible')
    self.assertEqual(menu.get(A+'layout_width'),'48.0dip')
    card=next(e for e in panel.iter() if e.get(A+'tag')=='previewPlayerArtCard')
    self.assertEqual(card.get(APP+'cardBackgroundColor').lower(),'#1fffffff')
 def test_geometry_for_requested_portrait_widths(self):
  # Android AbsSeekBar: track starts at view-left + padding; thumb centre
  # travels the same interval when offset == half the thumb intrinsic width.
  for screen in (360,390):
   content_left,content_right=24,screen-24
   view_left,view_right=content_left-12,content_right+12
   track_left,track_right=view_left+12,view_right-12
   self.assertEqual((track_left,track_right),(content_left,content_right))
   self.assertGreaterEqual(track_left-12,0)
   self.assertLessEqual(track_right+12,screen)
   for x,expected in ((track_left,0.0),(track_right,1.0)):
    self.assertAlmostEqual((x-track_left)/(track_right-track_left),expected)
  chrome=(HERE/'PreviewPlayerChrome.java').read_text()
  self.assertIn('bar.setThumbOffset(dp(12))',chrome)
  self.assertIn('bar.setPadding(dp(12),bar.getPaddingTop(),dp(12),bar.getPaddingBottom())',chrome)
  self.assertIn('setClipChildren(false)',chrome)
  self.assertIn('setClipToPadding(false)',chrome)
 def test_styles_and_playback_are_scoped(self):
  tiles=(HERE/'PreviewPlayerTiles.java').read_text();chrome=(HERE/'PreviewPlayerChrome.java').read_text()
  self.assertIn('tile.setColor(0x14ffffff)',tiles);self.assertIn('tile.setStroke(dp(1),0x1fffffff)',tiles)
  self.assertIn('b.setEnabled(i==3);b.setAlpha(1f);b.setSelected(false);b.setActivated(false)',tiles)
  self.assertIn('LayoutParams.WRAP_CONTENT:dp(56),1f)',tiles)
  self.assertIn('available>=frame.getWidth())limit=frame.getWidth()',chrome)
  self.assertIn('setDuration(250)',chrome)
  for n in ['assets/native_ui_shell.js','assets/spotify_bridge.js','smali/com/melodix/music/MainActivity.smali',
            *['smali/com/melodix/music/PreviewPlayerController'+x+'.smali' for x in ('','$1','$2','$3','$4','$5')],
            *['smali/com/melodix/music/PreviewPlayerMode'+x+'.smali' for x in ('','$1','$2','$3','$4','$5','$6')],
            'smali/com/melodix/music/PreviewPlayerTiles$1.smali']:
   self.assertEqual((ROOT/n).read_bytes(),(PRIOR/n).read_bytes(),n)

if __name__=='__main__':unittest.main(verbosity=2)
