#!/usr/bin/env python3
"""Guard follow-up scope and structural insets; no Android layout engine."""
import os
import re
import unittest
from pathlib import Path
import apply_lot1_followup as patch

root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
def method(text,name):
 m=re.search(r'^\.method [^\n]*\b'+name+r'\([^\n]*\n([\s\S]*?)^\.end method',text,re.M)
 if not m:raise AssertionError('missing '+name)
 return m.group(1)

class Tests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.files=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text(encoding='utf8') for n in patch.EXPECTED}
 def test_only_pinned_presentation_and_back_files(self):
  self.assertEqual(set(self.files),set(patch.EXPECTED))
  self.assertNotIn('assets/spotify_bridge.js',self.files)
  if os.environ.get('MELODIX_PATCH_INPUT'):
   for f,s in self.files.items():self.assertNotEqual(s,(root/f).read_text())
 def test_home_heading_only_one_horizontal_inset(self):
  s=method(self.files['smali/com/melodix/music/NativeHomeShelfPreview.smali'],'groupLabel')
  self.assertIn('->leftMargin:I',s)
  self.assertRegex(s,r'const/4 v0, 0x0\s+invoke-virtual \{v1, v0, v3, v0, v3\}, Landroid/view/View;->setPadding')
  self.assertNotIn('setOnClickListener',s)
 def test_padded_parent_compensates_heading_not_rows(self):
  s=method(self.files['smali/com/melodix/music/NativeHomeFeed.smali'],'paint')
  self.assertIn('->getPaddingLeft()I',s)
  self.assertIn('->getPaddingTop()I',s)
  self.assertIn('->getPaddingBottom()I',s)
  self.assertRegex(s,r'invoke-virtual \{v11, v10, v7, v10, v9\}, Landroid/view/View;->setPadding')
  self.assertIn('NativeSettingsRowFactory;->create',s)
 def test_root_back_backgrounds_without_reload(self):
  s=method(self.files['smali/com/melodix/music/MainActivity.smali'],'tryLot1NativeBack')
  self.assertIn('->moveTaskToBack(Z)Z',s)
  self.assertIn('->onNativeBackClick(',s)
  self.assertNotIn('runNativeJavascript',s)
  self.assertNotIn('->finish(',s)
if __name__=='__main__':unittest.main(verbosity=2)
