#!/usr/bin/env python3
import tempfile
import unittest
import xml.dom.minidom
from pathlib import Path

from apply_preview_redesign import DRAWABLES, apply


class RedesignTest(unittest.TestCase):
    def test_writes_valid_xml_only_to_existing_drawables(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp) / 'res' / 'drawable'; d.mkdir(parents=True)
            for n in DRAWABLES: (d / f'{n}.xml').write_text('<shape/>')
            (d / 'other.xml').write_text('<keep/>')
            apply(tmp)
            for n in DRAWABLES: xml.dom.minidom.parse(str(d / f'{n}.xml'))
            self.assertEqual((d / 'other.xml').read_text(), '<keep/>')

    def test_fails_closed_without_writing(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp) / 'res' / 'drawable'; d.mkdir(parents=True)
            (d / 'native_mini_player_bg.xml').write_text('<shape/>')
            with self.assertRaises(ValueError): apply(tmp)
            self.assertEqual((d / 'native_mini_player_bg.xml').read_text(), '<shape/>')


if __name__ == '__main__':
    unittest.main()
