#!/usr/bin/env python3
"""Fail closed if a user-facing Preview cannot replace Preview145.

The public signer pin was verified against Preview137 and Preview138. The
Preview145 build in CI run 42693148831 verified that pin and reported package
com.melodix.music.preview and versionCode 1021482 (APK SHA-256
fd2ff3cfc17513c8b841c419b365bae0e847496d0d1361d59334f3275d252c67).
The baseline is a floor, not a substitute for checking each installed version.
"""
import pathlib
import re
import sys

PACKAGE = 'com.melodix.music.preview'
PUBLIC_CERT_SHA256 = 'e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f'
BASELINE_VERSION_CODE = 1021482


def verify(cert_output: str, badging: str) -> int:
    signers = re.findall(r'^Signer #(\d+) certificate SHA-256 digest: ([0-9a-fA-F]{64})\s*$', cert_output, re.M)
    if len(signers) != 1 or signers[0][0] != '1' or signers[0][1].lower() != PUBLIC_CERT_SHA256:
        raise ValueError('Preview signer mismatch or ambiguous signer list')
    rows = re.findall(r"^package: name='([^']+)' versionCode='([0-9]+)'", badging, re.M)
    if len(rows) != 1 or rows[0][0] != PACKAGE:
        raise ValueError('Preview package mismatch or ambiguous metadata')
    version = int(rows[0][1])
    if version <= BASELINE_VERSION_CODE:
        raise ValueError('Preview versionCode must exceed the Preview145 baseline')
    return version


def main() -> int:
    if len(sys.argv) != 3:
        print('usage: verify_preview_update.py CERT_OUTPUT BADGING', file=sys.stderr)
        return 2
    try:
        cert = pathlib.Path(sys.argv[1]).read_text(encoding='utf-8')
        badging = pathlib.Path(sys.argv[2]).read_text(encoding='utf-8')
        version = verify(cert, badging)
    except (OSError, UnicodeError, ValueError) as error:
        print('::error title=Preview update compatibility::' + str(error), file=sys.stderr)
        return 1
    print(f'::notice title=Preview update compatibility::reference=145 signer=pinned versionCode={version}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
