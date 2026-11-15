#!/usr/bin/env python3
"""Guard scope and input of the Preview-only time formatter change."""
import hashlib
import importlib.util
import os
import re
import shutil
import tempfile
import unittest
from pathlib import Path

here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('patch', here / 'apply_lot1_time.py')
patch = importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
root = Path(os.environ['MELODIX_PREVIEW_ROOT'])


class TimePatchTests(unittest.TestCase):
    def test_only_formatter_is_changed(self):
        original = (root / patch.SOURCE).read_text(encoding='utf8')
        updated = patch.prepare(root)
        pattern = r'^\.method private static formatNativeTime\(J\)Ljava/lang/String;\n[\s\S]*?^\.end method'
        self.assertEqual(re.sub(pattern, '', original, flags=re.M), re.sub(pattern, '', updated, flags=re.M))
        self.assertNotEqual(original, updated)
        self.assertEqual(hashlib.sha256(original.encode()).hexdigest(), patch.EXPECTED_SHA256)

    def test_modified_input_is_refused_without_writing(self):
        with tempfile.TemporaryDirectory() as d:
            target = Path(d) / patch.SOURCE
            target.parent.mkdir(parents=True)
            shutil.copyfile(root / patch.SOURCE, target)
            target.write_bytes(target.read_bytes() + b'\n')
            before = target.read_bytes()
            with self.assertRaises(ValueError): patch.prepare(Path(d))
            self.assertEqual(target.read_bytes(), before)


if __name__ == '__main__':
    unittest.main(verbosity=2)
