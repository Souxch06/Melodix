#!/usr/bin/env python3
"""Self-tests for the protected-assets guard, including every pinned filename."""
import hashlib
import importlib.util
import tempfile
import unittest
import warnings
import zipfile
from pathlib import Path

here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('guard', here / 'verify_9016_protected_assets.py')
guard = importlib.util.module_from_spec(spec)
spec.loader.exec_module(guard)


class ProtectedAssetsTests(unittest.TestCase):
    def setUp(self):
        self.fixture = {name: ('fixture:' + name).encode() for name in guard.ASSET_SHA256}
        self.expected = {name: hashlib.sha256(data).hexdigest() for name, data in self.fixture.items()}

    def test_every_single_byte_change_and_missing_file_fails(self):
        guard.verify(self.fixture.__getitem__, self.expected)
        for name in self.fixture:
            with self.subTest(name=name):
                changed = self.fixture.copy()
                changed[name] += b'!'
                with self.assertRaisesRegex(ValueError, 'SHA-256 mismatch'):
                    guard.verify(changed.__getitem__, self.expected)
                del changed[name]
                with self.assertRaisesRegex(ValueError, 'unavailable'):
                    guard.verify(changed.__getitem__, self.expected)

    def test_apk_rejects_duplicate_missing_and_mutated_entries(self):
        old = guard.ASSET_SHA256
        guard.ASSET_SHA256 = self.expected
        try:
            # verify() has a default pinned mapping; patch the reader entry point
            # instead so these fixtures test the same zip entry checks and digests.
            original_verify = guard.verify
            guard.verify = lambda reader: original_verify(reader, self.expected)
            with tempfile.TemporaryDirectory() as d:
                apk = Path(d) / 'preview.apk'
                def write(entries):
                    with warnings.catch_warnings():
                        warnings.simplefilter('ignore', UserWarning)
                        with zipfile.ZipFile(apk, 'w') as z:
                            for name, data in entries:
                                z.writestr(name, data)
                entries = list(self.fixture.items())
                write(entries)
                guard.verify_apk(apk)
                write(entries[:-1])
                with self.assertRaises(ValueError): guard.verify_apk(apk)
                write(entries + [entries[0]])
                with self.assertRaises(ValueError): guard.verify_apk(apk)
                write([(name, data + b'!' if name == entries[0][0] else data) for name, data in entries])
                with self.assertRaises(ValueError): guard.verify_apk(apk)
        finally:
            guard.verify = original_verify
            guard.ASSET_SHA256 = old

    def test_list_of_protected_files_is_exact(self):
        self.assertEqual(set(guard.ASSET_SHA256), {'assets/' + x for x in (
            'spotify_bridge.js', 'classic_login.js', 'desktop_spoof.js', 'google_spoof.js',
            'facebook_consent.js', 'adblock_hosts.txt', 'playlist_sort.js')})


if __name__ == '__main__':
    unittest.main(verbosity=2)
