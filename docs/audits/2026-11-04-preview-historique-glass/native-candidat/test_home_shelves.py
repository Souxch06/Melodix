#!/usr/bin/env python3
"""Fixture/static checks, not an Android or Spotify end-to-end test."""
import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest
import xml.etree.ElementTree as ET

HERE = Path(__file__).resolve().parent
SOURCE = Path(os.environ['MELODIX_HISTORICAL_ROOT'])
def load(name):
    spec = importlib.util.spec_from_file_location(name, HERE/(name+'.py'))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod
skin = load('apply_native_candidate')
shelves = load('apply_home_shelves')
A = '{http://schemas.android.com/apk/res/android}'

class ShelfTests(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        for name in [*skin.EXPECTED, 'smali/com/melodix/music/MainActivity.smali']:
            path = self.root/name
            path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(SOURCE/name, path)
        for name, text in skin.prepare(self.root).items():
            (self.root/name).write_text(text, encoding='utf8')

    def test_activity_only_adds_home_path_and_preserves_historical_fallback(self):
        before=(self.root/'smali/com/melodix/music/MainActivity.smali').read_text()
        after=shelves.prepare(self.root)['smali/com/melodix/music/MainActivity.smali']
        self.assertEqual(after, before.replace(shelves.OLD, shelves.NEW))
        self.assertIn('nativeCurrentScreen:Ljava/lang/String;', shelves.NEW)
        self.assertIn('if-lez v3, :preview_historical_feed', shelves.NEW)
        self.assertIn('NativeHomeFeed;->paint', shelves.NEW)

    def test_layout_identity_handlers_and_wide_dock(self):
        files=shelves.prepare(self.root)
        before=ET.parse(self.root/'res/layout/activity_main.xml').getroot()
        phone=ET.fromstring(files['res/layout/activity_main.xml'])
        wide=ET.fromstring(files['res/layout-w600dp/activity_main.xml'])
        signature=lambda root:[(e.tag,e.get(A+'id'),e.get(A+'onClick'),e.get(A+'tag')) for e in root.iter()]
        self.assertEqual(signature(before),signature(phone))
        self.assertEqual(signature(before),signature(wide))
        def view(root, name):
            return next(e for e in root.iter() if e.get(A+'id')=='@id/'+name)
        self.assertEqual(view(phone,'nativeRoot').get(A+'fitsSystemWindows'),'true')
        self.assertEqual(view(wide,'nativeTabBar').get(A+'layout_width'),'480.0dip')
        self.assertEqual(view(wide,'nativeTabBar').get(A+'layout_gravity'),'center_horizontal')
        self.assertEqual(view(phone,'nativeTabBar').get(A+'layout_width'),'fill_parent')

    def test_renderer_uses_existing_rows_and_detached_then_replaces(self):
        text=shelves.prepare(self.root)['smali/com/melodix/music/NativeHomeShelfPreview.smali']
        self.assertIn('NativeUiRowFactory;->create(',text)
        self.assertIn('HorizontalScrollView;-><init>',text)
        self.assertIn('const-string v6, "settingValue"',text)
        self.assertIn('if-eqz v6, :empty',text)
        self.assertLess(text.index('NativeUiRowFactory;->create('),text.index('invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->addView'))
        self.assertLess(text.index('invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->addView'),text.index('removeViewAt'))
        self.assertIn('.catch Ljava/lang/Throwable;',text)
        self.assertNotIn('setOnClickListener',text)
        self.assertNotIn('fetch',text)

    def test_rejects_changed_activity_layout_and_existing_files_without_writes(self):
        targets=['smali/com/melodix/music/MainActivity.smali', 'res/layout/activity_main.xml']
        for name in targets:
            path=self.root/name
            original=path.read_text()
            path.write_text(original+'\n')
            with self.subTest(name=name), self.assertRaises(ValueError): shelves.prepare(self.root)
            path.write_text(original)
        unexpected=self.root/'res/layout-w600dp/activity_main.xml'
        unexpected.parent.mkdir(parents=True,exist_ok=True)
        unexpected.write_text('existing')
        with self.assertRaises(ValueError): shelves.prepare(self.root)
        self.assertEqual(unexpected.read_text(),'existing')

if __name__ == '__main__':
    unittest.main(verbosity=2)
