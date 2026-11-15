#!/usr/bin/env python3
"""Exercise direct byte comparison and fail-closed ZIP handling."""
import contextlib
import hashlib
import io
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch
import compare_9016_artifact as c

def apk(path, altered=False, duplicate=False):
    with zipfile.ZipFile(path, 'w') as z:
        for name in c.ASSET_SHA256: z.writestr(name, b'changed' if altered and name.endswith('spotify_bridge.js') else name.encode())
        if duplicate:
            import warnings
            with warnings.catch_warnings():
                warnings.simplefilter('ignore'); z.writestr('assets/spotify_bridge.js', b'duplicate')

class Tests(unittest.TestCase):
    def test_exact_bytes_mutation_digest_and_duplicate(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp); ref = tmp/'ref.apk'; candidate=tmp/'candidate.apk'; bundle=tmp/'ref.zip'
            apk(ref); apk(candidate)
            with zipfile.ZipFile(bundle,'w') as z: z.write(ref,c.APK_NAME)
            expected={name:hashlib.sha256(name.encode()).hexdigest() for name in c.ASSET_SHA256}
            with patch.object(c,'ZIP_SHA256',hashlib.sha256(bundle.read_bytes()).hexdigest()), patch.object(c,'ASSET_SHA256',expected), contextlib.redirect_stdout(io.StringIO()):
                c.compare(bundle,candidate)
                apk(candidate,altered=True)
                with self.assertRaises(ValueError):c.compare(bundle,candidate)
                apk(candidate,duplicate=True)
                with self.assertRaises(ValueError):c.compare(bundle,candidate)
                bundle.write_bytes(bundle.read_bytes()+b'x')
                with self.assertRaises(ValueError):c.compare(bundle,candidate)

if __name__ == '__main__': unittest.main(verbosity=2)
