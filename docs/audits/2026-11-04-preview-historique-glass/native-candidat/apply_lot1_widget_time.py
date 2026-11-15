#!/usr/bin/env python3
"""Preview widget display formatting only; its existing inputs are milliseconds."""
import hashlib
import re
import sys
from pathlib import Path
from apply_lot1_time import FORMATTER

SOURCE = 'smali/com/melodix/music/a.smali'
EXPECTED_SHA256 = '1e96a39cb92d308a353f197a5feb404a28227f3c2a2023b526169bad81e02b76'
PATTERN = r'^\.method public static b\(J\)Ljava/lang/String;\n[\s\S]*?^\.end method'


def prepare(root):
    raw = (root / SOURCE).read_bytes()
    if hashlib.sha256(raw).hexdigest() != EXPECTED_SHA256:
        raise ValueError('not the exact 9016 widget formatter input')
    original = raw.decode('utf8')
    replacement = FORMATTER.replace('.method private static formatNativeTime(J)Ljava/lang/String;',
                                    '.method public static b(J)Ljava/lang/String;', 1)
    replacement = replacement.replace('    # Native shell player payloads are already seconds, not milliseconds.\n',
        '    # Existing widget state is in milliseconds; convert to seconds first.\n'
        '    const-wide/16 v0, 0x3e8\n'
        '    div-long p0, p0, v0\n', 1)
    output, count = re.subn(PATTERN, lambda _: replacement, original, flags=re.M)
    if count != 1: raise ValueError('expected exactly one widget formatter')
    return output


if __name__ == '__main__':
    root = Path(sys.argv[1])
    (root / SOURCE).write_text(prepare(root), encoding='utf8')
