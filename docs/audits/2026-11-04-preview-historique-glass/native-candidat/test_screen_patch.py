#!/usr/bin/env python3
"""Fixture checks for the disposable screen-routing patch, not Android tests."""
import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest

HERE=Path(__file__).resolve().parent
SOURCE=Path(os.environ['MELODIX_HISTORICAL_ROOT'])
def load(name):
    spec=importlib.util.spec_from_file_location(name,HERE/(name+'.py'))
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);return mod
skin=load('apply_native_candidate'); shelves=load('apply_home_shelves'); screens=load('apply_screen_routing')

class ScreenPatchTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
        for name in [*skin.EXPECTED,'smali/com/melodix/music/MainActivity.smali','smali/com/melodix/music/AndBridge.smali','smali/com/melodix/music/NativeSearchWatcher.smali']:
            p=self.root/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(SOURCE/name,p)
        for patch in (skin,shelves):
            for name,text in patch.prepare(self.root).items():
                p=self.root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf8')
    def test_only_activity_bridge_and_search_watcher_change(self):
        changes=screens.prepare(self.root)
        self.assertEqual(set(changes),{'smali/com/melodix/music/MainActivity.smali','smali/com/melodix/music/AndBridge.smali','smali/com/melodix/music/NativeSearchWatcher.smali'})
        self.assertIn('if-nez v1, :got_activity',changes['smali/com/melodix/music/AndBridge.smali'])
    def test_incompatible_input_fails_before_any_writes(self):
        for name in ('smali/com/melodix/music/MainActivity.smali','smali/com/melodix/music/AndBridge.smali','smali/com/melodix/music/NativeSearchWatcher.smali'):
            p=self.root/name;old=p.read_text();p.write_text(old+'\n')
            with self.subTest(name=name),self.assertRaises(ValueError): screens.prepare(self.root)
            self.assertEqual(p.read_text(),old+'\n');p.write_text(old)
    def test_prepare_can_follow_preview_package_rename(self):
        p=self.root/'smali/com/melodix/music/MainActivity.smali'
        p.write_text(p.read_text().replace('com.melodix.music.PIP_', 'com.melodix.music.preview.PIP_'))
        self.assertEqual(len(screens.prepare(self.root)),3)

if __name__=='__main__':unittest.main(verbosity=2)
