#!/usr/bin/env python3
"""Compare each protected byte directly to the original 9016 CI artifact."""
import hashlib
import io
import sys
import zipfile
from pathlib import Path
from verify_9016_protected_assets import ASSET_SHA256

ZIP_SHA256 = 'c7739009ddcd737c4c10537da1375e9f1c4ff4d0cb1c23df91d981d4c36feecf'
APK_NAME = 'Melodix-Preview-historique-glass.apk'

def one(archive, name):
    matches = [x for x in archive.namelist() if x == name]
    if len(matches) != 1: raise ValueError(f'{name}: expected exactly one entry, got {len(matches)}')
    return archive.read(matches[0])

def compare(reference_zip, candidate):
    data = Path(reference_zip).read_bytes()
    if hashlib.sha256(data).hexdigest() != ZIP_SHA256: raise ValueError('9016 artifact ZIP digest mismatch')
    with zipfile.ZipFile(io.BytesIO(data)) as outer:
        names = [n for n in outer.namelist() if Path(n).name == APK_NAME and not n.endswith('/')]
        if len(names) != 1: raise ValueError('9016 ZIP must contain exactly one reference APK')
        apk = one(outer, names[0])
    with zipfile.ZipFile(io.BytesIO(apk)) as reference, zipfile.ZipFile(candidate) as built:
        for name, expected in ASSET_SHA256.items():
            before, after = one(reference, name), one(built, name)
            if hashlib.sha256(before).hexdigest() != expected: raise ValueError(name + ': 9016 digest mismatch')
            if before != after: raise ValueError(name + ': bytes differ')
            print(name + ': identical to original signed 9016 APK')

if __name__ == '__main__':
    try: compare(sys.argv[1], sys.argv[2])
    except (ValueError, OSError, zipfile.BadZipFile) as e:
        print('9016 artifact comparison failed: ' + str(e), file=sys.stderr)
        sys.exit(1)
