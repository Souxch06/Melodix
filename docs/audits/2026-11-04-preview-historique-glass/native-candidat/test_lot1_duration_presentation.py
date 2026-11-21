#!/usr/bin/env python3
"""Pinned scope for the unprotected shell presentation patch."""
import os
import shutil
import tempfile
import unittest
from pathlib import Path
import apply_lot1_duration_presentation as patch

root = Path(os.environ['MELODIX_PREVIEW_ROOT'])

class Tests(unittest.TestCase):
    def test_exact_input_and_narrow_scope(self):
        before = (root / patch.SOURCE).read_text(encoding='utf8')
        after = patch.prepare(root)
        self.assertNotEqual(before, after)
        self.assertNotIn('fetch(', patch.HELPERS)
        self.assertNotIn('onMediaItemsLoaded', patch.HELPERS)
        self.assertNotIn('spotAuthToken', patch.HELPERS)
        self.assertIn('if (window.__sfNativeCollectionHasData) return;', after)
        self.assertEqual(patch.SOURCE, 'assets/native_ui_shell.js')

    def test_unexpected_input_refused(self):
        with tempfile.TemporaryDirectory() as tmp:
            file = Path(tmp) / patch.SOURCE
            file.parent.mkdir(parents=True)
            shutil.copyfile(root / patch.SOURCE, file)
            file.write_bytes(file.read_bytes() + b'\n')
            with self.assertRaises(ValueError): patch.prepare(Path(tmp))

if __name__ == '__main__': unittest.main(verbosity=2)
