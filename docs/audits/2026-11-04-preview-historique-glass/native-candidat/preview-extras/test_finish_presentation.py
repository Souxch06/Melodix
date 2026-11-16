#!/usr/bin/env python3
"""Source and generated structure checks, not on-device acceptance tests."""
import os, unittest, xml.etree.ElementTree as ET
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=Path(os.environ['MELODIX_PREVIEW_ROOT'])
A='{http://schemas.android.com/apk/res/android}'

class PresentationFinish(unittest.TestCase):
    def test_view_scoped_controls_and_constants(self):
        for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
            root=ET.parse(ROOT/'res'/folder/'activity_main.xml').getroot()
            panel=next(e for e in root.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
            play=next(e for e in panel.iter() if e.get(A+'id')=='@id/nativePlayerLargePlayPauseButton')
            self.assertEqual(play.tag,'com.melodix.music.PreviewPlayerPlayButton')
            self.assertEqual(play.get(A+'onClick'),'onNativePlayPauseClick')
            self.assertEqual(panel.get(A+'paddingLeft'),'24.0dip')
            self.assertEqual(panel.get(A+'paddingRight'),'24.0dip')
            self.assertEqual(len([e for e in panel.iter() if e.tag=='SeekBar']),1)
        ids={(e.get('type'),e.get('name')):e.get('id') for e in ET.parse(ROOT/'res/values/public.xml').getroot()}
        self.assertEqual(ids['drawable','pause'],'0x7f080121')
        self.assertEqual(ids['drawable','play'],'0x7f080122')
        self.assertEqual(ids['drawable','native_player_background'],'0x7f08013c')

    def test_visual_only_sources(self):
        chrome=(HERE/'PreviewPlayerChrome.java').read_text()
        art=(HERE/'PreviewPlayerDecoration.java').read_text()
        play=(HERE/'PreviewPlayerPlayButton.java').read_text()
        tiles=(HERE/'PreviewPlayerTiles.java').read_text()
        self.assertIn('GradientDrawable.Orientation.BR_TL',chrome)
        self.assertIn('0xff7b3fe4,0xffe0489e',chrome)
        self.assertIn('bar.setThumb(thumb)',chrome)
        self.assertIn('bar.setPadding(0,bar.getPaddingTop(),0,bar.getPaddingBottom())',chrome)
        self.assertIn('return false;',chrome)
        self.assertIn('root.setBackground(rootBackground)',chrome)
        self.assertIn('panel.setBackground(panelBackground)',chrome)
        self.assertIn('canvas.drawText("1"',art)
        self.assertIn('Lecture aléatoire activée',art)
        self.assertIn('id == 0x7f080122 ? 0.92f : 1f',play)
        self.assertIn('new LinearLayout.LayoutParams(dp(64)',tiles)
        for source in (chrome,art,play):
            for forbidden in ('evaluateJavascript','performClick','setOnSeekBarChangeListener','http://','https://'):
                self.assertNotIn(forbidden,source)

if __name__=='__main__': unittest.main(verbosity=2)
