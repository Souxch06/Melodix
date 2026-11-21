#!/usr/bin/env python3
"""Structural checks, not Android rendering or font measurement."""
import os
import re
import unittest
from pathlib import Path
import apply_lot1_empty_subtitle as patch

root = Path(os.environ['MELODIX_PREVIEW_ROOT'])

class Tests(unittest.TestCase):
    def test_input_and_only_target_block_changes(self):
        if not os.environ.get('MELODIX_PATCH_INPUT'): self.skipTest('requires unpatched project')
        old = (root/patch.SOURCE).read_text()
        new = patch.prepare(root)
        self.assertEqual(new.replace(patch.NEW, patch.OLD), old)

    def test_decoded_hides_only_empty_subtitle_without_duration_column(self):
        src = patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else (root/patch.SOURCE).read_text()
        create = re.search(r'^\.method public static create\(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;\)Landroid/widget/LinearLayout;\n(.*?)^\.end method', src, re.S|re.M).group(1)
        create = '\n'.join(x.strip() for x in create.splitlines() if x.strip() and not x.strip().startswith(('#','.line')))
        self.assertRegex(create, r'invoke-virtual \{v4, v7\}, Landroid/widget/TextView;->setText\(Ljava/lang/CharSequence;\)V\s+invoke-virtual \{v7\}, Ljava/lang/String;->isEmpty\(\)Z\s+move-result v10\s+if-eqz v10, :\w+\s+const/16 v10, 0x8\s+invoke-virtual \{v4, v10\}, Landroid/view/View;->setVisibility\(I\)V')
        self.assertNotIn('"0:00"',create)
        self.assertNotIn('"duration"',create)
        self.assertIn('Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V',create)

if __name__ == '__main__': unittest.main(verbosity=2)
