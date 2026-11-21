#!/usr/bin/env python3
"""Static and fixture checks; these do not execute Android or network requests."""
import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest
import xml.etree.ElementTree as ET

HERE = Path(__file__).resolve().parent
SOURCE = Path(os.environ['MELODIX_HISTORICAL_ROOT'])
spec = importlib.util.spec_from_file_location('native_candidate', HERE/'apply_native_candidate.py')
candidate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(candidate)
ANDROID = '{http://schemas.android.com/apk/res/android}'

class NativeCandidateTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        for name in candidate.EXPECTED:
            dst = self.root/name
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(SOURCE/name, dst)

    def write_candidate(self):
        for name, text in candidate.prepare(self.root).items():
            (self.root/name).write_text(text, encoding='utf-8')

    def test_fail_closed_before_any_write_if_any_input_changed(self):
        victim = self.root/'smali/com/melodix/music/NativeImageLoader.smali'
        victim.write_text(victim.read_text()+'\n# changed\n')
        before = {name:(self.root/name).read_bytes() for name in candidate.EXPECTED}
        with self.assertRaisesRegex(ValueError, 'unexpected historical file'):
            candidate.prepare(self.root)
        self.assertEqual(before, {name:(self.root/name).read_bytes() for name in candidate.EXPECTED})

    def test_no_hierarchy_ids_or_handlers_changed(self):
        old = ET.parse(self.root/'res/layout/activity_main.xml').getroot()
        self.write_candidate()
        new = ET.parse(self.root/'res/layout/activity_main.xml').getroot()
        def signatures(root):
            return [(e.tag, e.get(ANDROID+'id'), e.get(ANDROID+'onClick'), e.get(ANDROID+'tag')) for e in root.iter()]
        self.assertEqual(signatures(old), signatures(new))
        self.assertIn('nativeTabBar', (self.root/'res/layout/activity_main.xml').read_text())
        self.assertIn('@drawable/native_nav_item', (self.root/'res/layout/activity_main.xml').read_text())

    def test_all_drawables_remain_well_formed(self):
        self.write_candidate()
        for name in candidate.EXPECTED:
            if name.startswith('res/drawable/'):
                with self.subTest(name=name):
                    ET.parse(self.root/name)

    def test_artwork_guards_only_change_two_branches(self):
        old_loader = (self.root/'smali/com/melodix/music/NativeImageLoader.smali').read_text()
        old_rows = (self.root/'smali/com/melodix/music/NativeUiRowFactory.smali').read_text()
        self.write_candidate()
        loader = (self.root/'smali/com/melodix/music/NativeImageLoader.smali').read_text()
        rows = (self.root/'smali/com/melodix/music/NativeUiRowFactory.smali').read_text()
        self.assertEqual(loader, old_loader.replace('if-eqz v1, :clear_native_image\n\n    invoke-virtual {v0, p1}', 'if-nez v1, :clear_native_image\n\n    invoke-virtual {v0, p1}'))
        self.assertEqual(rows, old_rows.replace('if-eqz v10, :native_row_text_column', 'if-nez v10, :native_row_text_column'))
        self.assertIn('if-eqz v1, :clear_native_image\n    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z', loader)
        self.assertIn('if-eqz v10, :native_row_return', rows) # routing is intentionally unchanged

    def test_cannot_apply_twice(self):
        self.write_candidate()
        with self.assertRaises(ValueError):
            candidate.prepare(self.root)

if __name__ == '__main__':
    unittest.main(verbosity=2)
