#!/usr/bin/env python3
"""Fail closed unless protected assets are byte-identical to the 9016 project.

The digests pin the project used for Preview 9016 (delivery commit f5f32ffe).
Run against both the transformed project and the final signed APK. SHA-256
checks byte content; it is not a test of Spotify behaviour or authentication.
"""
import argparse
import hashlib
import sys
import zipfile
from pathlib import Path

ASSET_SHA256 = {
    'assets/spotify_bridge.js': 'cc3ba74935cbee42a995d404fa491031d5c48c53deabe7ee14dbe2ffe652fcb7',
    'assets/classic_login.js': 'f15a464d4626ea9a769ac52b6aabfe0327116ebd44e212048a88868e52e052a7',
    'assets/desktop_spoof.js': 'f80deaa04f0baa8412ca9c06315b389dcf206d02a3d05a1d62d6183368036110',
    'assets/google_spoof.js': 'c3f2032fd25555c06eac4aa77670dce5b622f160ef2f2d1110646d829752a372',
    'assets/facebook_consent.js': '8e7aeffb78491c810932dffcbbb217ad4cee9bc0fd21a315d955550f1f3ec019',
    'assets/adblock_hosts.txt': '87fbf348fcf2ba88a80f6c95820c1792cf93b1c1bb9734f88639bdd20be8114c',
    'assets/playlist_sort.js': '3cb0dd8d3b13bc69fdf0342cab92dab69d1a16d5ad98be88b853e98068dce0b7',
}


def verify(read_bytes, expected=ASSET_SHA256):
    errors = []
    for name, digest in expected.items():
        try:
            data = read_bytes(name)
        except (OSError, KeyError, ValueError, zipfile.BadZipFile) as exc:
            errors.append(f'{name}: unavailable ({type(exc).__name__})')
            continue
        actual = hashlib.sha256(data).hexdigest()
        if actual != digest:
            errors.append(f'{name}: SHA-256 mismatch (actual {actual})')
    if errors:
        raise ValueError('\n'.join(errors))


def verify_project(root):
    verify(lambda name: (root / name).read_bytes())


def verify_apk(apk):
    with zipfile.ZipFile(apk) as archive:
        names = archive.namelist()
        def read(name):
            if names.count(name) != 1:
                raise ValueError('expected exactly one entry')
            return archive.read(name)
        verify(read)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('kind', choices=('project', 'apk'))
    parser.add_argument('path', type=Path)
    args = parser.parse_args()
    try:
        if args.kind == 'project':
            verify_project(args.path)
        else:
            verify_apk(args.path)
    except (OSError, ValueError, zipfile.BadZipFile) as exc:
        print(f'Protected Preview assets check failed: {exc}', file=sys.stderr)
        return 1
    print(f'Protected Preview assets match 9016: {args.kind} ({len(ASSET_SHA256)} files)')
    return 0


if __name__ == '__main__':
    sys.exit(main())
