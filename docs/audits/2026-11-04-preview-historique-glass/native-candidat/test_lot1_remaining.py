#!/usr/bin/env python3
"""Structural checks for remaining-time presentation (not an Android UI test)."""
import importlib.util
import os
import unittest
import xml.etree.ElementTree as ET
from pathlib import Path

here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('patch', here/'apply_lot1_remaining.py')
patch = importlib.util.module_from_spec(spec); spec.loader.exec_module(patch)
root = Path(os.environ['MELODIX_PREVIEW_ROOT'])
A = '{http://schemas.android.com/apk/res/android}'

class Tests(unittest.TestCase):
    def test_scope_and_layout(self):
        files = patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text(encoding='utf8') for n in patch.EXPECTED}
        self.assertEqual(set(files), set(patch.EXPECTED))
        layout = ET.fromstring(files['res/layout/activity_main.xml'])
        players = [n for n in layout.iter() if n.get(A+'id') == '@id/nativePlayerPanel']
        self.assertEqual(len(players), 1)
        labels = [n for n in players[0].iter() if n.get(A+'tag') == 'nativePlayerRemaining']
        self.assertEqual(len(labels), 1)
        self.assertEqual(labels[0].get(A+'text'), 'Temps restant : —')
        activity = files['smali/com/melodix/music/MainActivity.smali']
        self.assertIn('->updateLot1Remaining(JJ)V', activity)
        self.assertIn('->formatNativeTime(J)Ljava/lang/String;', activity)
        self.assertNotIn('@id/nativePlayerRemaining', files['res/layout/activity_main.xml'])

if __name__ == '__main__': unittest.main(verbosity=2)
