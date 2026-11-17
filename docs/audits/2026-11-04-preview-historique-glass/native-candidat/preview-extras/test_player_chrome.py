#!/usr/bin/env python3
"""Static player-presentation checks; these do not validate Android rendering or interaction."""
from pathlib import Path
import os
import unittest
import xml.etree.ElementTree as ET

A='{http://schemas.android.com/apk/res/android}'
APP='{http://schemas.android.com/apk/res-auto}'
ROOT=Path(os.environ['MELODIX_PREVIEW_ROOT'])
HERE=Path(__file__).resolve().parent

class ChromeTests(unittest.TestCase):
    def test_layouts(self):
        for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
            with self.subTest(folder=folder):
                x=ET.parse(ROOT/'res'/folder/'activity_main.xml').getroot()
                p=next(e for e in x.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
                byid=lambda name: next(e for e in p.iter() if e.get(A+'id')=='@id/'+name)
                tagged=lambda tag: next(e for e in p.iter() if e.get(A+'tag')==tag)
                self.assertEqual(len([e for e in p.iter() if e.tag=='com.melodix.music.PreviewPlayerChrome']),1)
                self.assertEqual(tagged('previewPlayerDragHandle').get(A+'contentDescription'),'Glisser vers le bas pour réduire le lecteur')
                self.assertEqual(tagged('previewPlayerChrome').tag,'com.melodix.music.PreviewPlayerChrome')
                self.assertEqual(tagged('previewPlayerArtCard').get(APP+'layout_constraintWidth_max'),'318.0dip') if ROOT.name.endswith('decoded') else self.assertEqual(tagged('previewPlayerArtCard').get(APP+'layout_constraintWidth_max'),'318dp')
                self.assertIn(byid('nativePlayerProgress').get(A+'maxHeight'),('5.0dip','5dp'))
                self.assertEqual(byid('nativePlayerLargeTitle').get(A+'maxLines'),'2')
                self.assertIn(tagged('like').get(A+'layout_marginLeft'),('16.0dip','16dp'))
                self.assertEqual(tagged('nativePlayerRemaining').get(A+'textColor').lower(),'#00ffffff')
                self.assertEqual(tagged('nativePlayerRemaining').get(A+'labelFor'),'@id/nativePlayerProgress')
                self.assertIn(byid('nativePlayerLargePlayPauseButton').get(A+'layout_width'),('76.0dip','76dp'))
                self.assertIsNotNone(next(e for e in x.iter() if e.get(A+'contentDescription')=='Paramètres' and e.get(A+'onClick')=='onNativeSettingsClick'))
    def test_back_hook_and_guarded_gesture(self):
        activity=(ROOT/'smali/com/melodix/music/MainActivity.smali').read_text()
        start=activity.index('.method public final onNativeBackClick(')
        back=activity[start:activity.index('.end method',start)]
        self.assertLess(back.index('PreviewPlayerChrome;->interceptBack'),back.index('->lot1PopBack'))
        s=(HERE/'PreviewPlayerChrome.java').read_text()
        self.assertIn('if(chrome.bypassClose)return false',s)
        self.assertIn('if(chrome.closing)return true',s)
        self.assertIn('ACTION_CANCEL',s)
        self.assertIn('ACTION_POINTER_DOWN',s)
        self.assertIn('dy>Math.max(dp(90),p.getHeight()*.16f)',s)
        self.assertIn('handle.setOnTouchListener(new DismissGesture())',s)
        self.assertIn('art.setOnTouchListener(new DismissGesture())',s)
        self.assertNotIn('bar.setOnTouchListener',s)

    def test_presentation_source_is_scoped(self):
        s=(HERE/'PreviewPlayerChrome.java').read_text()
        self.assertIn('previousHeaderVisibility=candidate.getVisibility()',s)
        self.assertIn('header.setVisibility(previousHeaderVisibility)',s)
        self.assertIn('candidate.getParent()!=nativeRoot',s)
        self.assertIn('fontScale>1.3f',s)
        self.assertIn('Math.min(dp(318),frame.getWidth())',s)
        for forbidden in ('WebView','evaluateJavascript','performClick','Spotify','http://','https://'):
            # The doc comment mentions WebView only to explain the boundary.
            self.assertNotIn(forbidden, '\n'.join(line for line in s.splitlines() if not line.strip().startswith('/**')))

if __name__=='__main__': unittest.main(verbosity=2)
