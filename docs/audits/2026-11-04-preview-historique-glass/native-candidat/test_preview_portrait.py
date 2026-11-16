#!/usr/bin/env python3
import subprocess
import unittest
from pathlib import Path

from apply_preview_portrait import patch

HERE = Path(__file__).resolve().parent


def base():
    return subprocess.run(['git', 'show', 'd0f206b:smali/com/melodix/music/MainActivity.smali'],
                          cwd=HERE, capture_output=True, text=True, check=True).stdout


class PortraitTest(unittest.TestCase):
    def test_only_fallback_becomes_portrait(self):
        before = base()
        after = patch(before)
        self.assertNotEqual(before, after)
        diff = [(a, b) for a, b in zip(before.splitlines(), after.splitlines()) if a != b]
        self.assertEqual(diff, [('    const/4 v0, -0x1', '    const/4 v0, 0x1')])
        self.assertIn('"bigwindow"', after)

    def test_fails_closed(self):
        with self.assertRaises(ValueError):
            patch('no orientation here')
        with self.assertRaises(ValueError):
            patch(patch(base()))


if __name__ == '__main__':
    unittest.main()
