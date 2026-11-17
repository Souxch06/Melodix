#!/usr/bin/env python3
"""Inspect the packaged row-size request, not a visual/device test."""
import os, re, unittest
from pathlib import Path
R=Path(os.environ['MELODIX_PREVIEW_ROOT'])
class CoverSizeTest(unittest.TestCase):
 def test_row_image_target_is_density_aware_and_bounded(self):
  text=(R/'smali/com/melodix/music/NativeUiRowFactory.smali').read_text()
  body=text.split('.method public static create(')[1].split('.end method')[0]
  normalized=' '.join(body.split())
  pattern=(r'const/16 v10, 0x30 invoke-static \{p0, v10\}, Lcom/melodix/music/NativeUiRowFactory;->dp\(Landroid/content/Context;I\)I '
           r'move-result v10 const/16 v11, 0xb0 if-ge v10, v11, :(?P<min>\w+) move v10, v11 :(?P=min) '
           r'const/16 v11, 0x180 if-le v10, v11, :(?P<max>\w+) move v10, v11 :(?P=max) '
           r'invoke-static \{v1, v9, v10\}, Lcom/melodix/music/NativeImageLoader;->load')
  self.assertRegex(normalized,pattern)
  self.assertIn('CENTER_CROP',body)
  for density in (1,2,3,4,6,10):
   target=min(384,max(176,round(48*density)))
   self.assertLessEqual(target,384)
   if density<=8:self.assertGreaterEqual(target,48*density)
 def test_loader_keeps_existing_recycling_and_placeholder(self):
  text=(R/'smali/com/melodix/music/NativeImageLoader.smali').read_text()
  for call in ('cancelRequest','placeholder','error','resize','centerCrop','into'):
   self.assertIn(call,text)
if __name__=='__main__':unittest.main(verbosity=2)
