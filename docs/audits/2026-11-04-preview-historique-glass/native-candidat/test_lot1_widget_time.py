#!/usr/bin/env python3
"""Verify that the widget patch only replaces the pinned display formatter."""
import hashlib
import os
import re
import shutil
import tempfile
import unittest
from pathlib import Path
import apply_lot1_widget_time as patch

root = Path(os.environ['MELODIX_PREVIEW_ROOT'])

class Tests(unittest.TestCase):
    def test_only_formatter_changes(self):
        original = (root / patch.SOURCE).read_text(encoding='utf8')
        updated = patch.prepare(root)
        self.assertEqual(re.sub(patch.PATTERN, '', original, flags=re.M),
                         re.sub(patch.PATTERN, '', updated, flags=re.M))
        self.assertEqual(hashlib.sha256(original.encode()).hexdigest(), patch.EXPECTED_SHA256)
        self.assertIn('div-long p0, p0, v0', updated)

    def test_changed_input_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            file = Path(tmp) / patch.SOURCE
            file.parent.mkdir(parents=True)
            shutil.copyfile(root / patch.SOURCE, file)
            file.write_bytes(file.read_bytes() + b'\n')
            with self.assertRaises(ValueError): patch.prepare(Path(tmp))

if __name__ == '__main__': unittest.main(verbosity=2)
