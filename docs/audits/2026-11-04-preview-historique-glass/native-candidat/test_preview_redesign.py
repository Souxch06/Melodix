#!/usr/bin/env python3
import tempfile
import unittest
import xml.dom.minidom
from pathlib import Path

from apply_preview_redesign import DRAWABLES, LAYOUTS, add_restyler, apply


class RedesignTest(unittest.TestCase):
    def test_writes_valid_xml_only_to_existing_drawables(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp) / 'res' / 'drawable'; d.mkdir(parents=True)
            for n in DRAWABLES: (d / f'{n}.xml').write_text('<shape/>')
            (d / 'other.xml').write_text('<keep/>')
            for n in LAYOUTS:
                f = Path(tmp) / n; f.parent.mkdir(parents=True, exist_ok=True)
                f.write_text('<A xmlns:android="http://schemas.android.com/apk/res/android"><LinearLayout\n android:id="@id/nativeRoot"\n android:orientation="vertical"><B/></LinearLayout></A>')
            apply(tmp)
            for n in DRAWABLES: xml.dom.minidom.parse(str(d / f'{n}.xml'))
            self.assertEqual((d / 'other.xml').read_text(), '<keep/>')
            for n in LAYOUTS:
                x = (Path(tmp) / n).read_text(); xml.dom.minidom.parseString(x)
                self.assertLess(x.index('nativeRoot'), x.index('PreviewUiRestyle')); self.assertLess(x.index('PreviewUiRestyle'), x.index('<B/>'))
            with self.assertRaises(ValueError): add_restyler((Path(tmp) / LAYOUTS[0]).read_text())

    def test_fails_closed_without_writing(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp) / 'res' / 'drawable'; d.mkdir(parents=True)
            (d / 'native_mini_player_bg.xml').write_text('<shape/>')
            with self.assertRaises(ValueError): apply(tmp)
            self.assertEqual((d / 'native_mini_player_bg.xml').read_text(), '<shape/>')


if __name__ == '__main__':
    unittest.main()
