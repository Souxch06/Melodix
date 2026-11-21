#!/usr/bin/env python3
"""Preview-only player time display fix, applied to the pinned 9016 project.

This changes only the display formatter; player payload values are seconds.
It does not touch the bridge, player state, progress calculations or routing.
"""
import hashlib
import re
import sys
from pathlib import Path

SOURCE = 'smali/com/melodix/music/MainActivity.smali'
EXPECTED_SHA256 = '45f9febba528b5f22c9276114b9fa436af3abc8897ee28a620ae7bde8dd7e025'
FORMATTER = '''.method private static formatNativeTime(J)Ljava/lang/String;
    .locals 12

    # Native shell player payloads are already seconds, not milliseconds.
    const-wide/16 v0, 0x0
    cmp-long v6, p0, v0
    if-gez v6, :native_time_nonnegative
    const-wide/16 p0, 0x0
    :native_time_nonnegative
    const-wide/16 v4, 0x3c
    rem-long v0, p0, v4
    div-long v2, p0, v4
    cmp-long v6, v2, v4
    if-ltz v6, :native_time_under_hour

    div-long v4, v2, v4
    const-wide/16 v8, 0x3c
    rem-long/2addr v2, v8
    const/4 v6, 0x3
    new-array v7, v6, [Ljava/lang/Object;
    const/4 v8, 0x0
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v7, v8
    const/4 v8, 0x1
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v7, v8
    const/4 v8, 0x2
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v7, v8
    const-string v11, "%d:%02d:%02d"
    goto :native_time_format

    :native_time_under_hour
    const/4 v6, 0x2
    new-array v7, v6, [Ljava/lang/Object;
    const/4 v8, 0x0
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v7, v8
    const/4 v8, 0x1
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v9
    aput-object v9, v7, v8
    const-string v11, "%d:%02d"

    :native_time_format
    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-static {v10, v11, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method'''


def prepare(root):
    raw = (root / SOURCE).read_bytes()
    if hashlib.sha256(raw).hexdigest() != EXPECTED_SHA256:
        raise ValueError('not the exact 9016 MainActivity input')
    text = raw.decode('utf8')
    pattern = r'^\.method private static formatNativeTime\(J\)Ljava/lang/String;\n[\s\S]*?^\.end method'
    updated, count = re.subn(pattern, lambda _: FORMATTER, text, flags=re.M)
    if count != 1:
        raise ValueError('expected exactly one native time formatter')
    return updated


if __name__ == '__main__':
    root = Path(sys.argv[1])
    (root / SOURCE).write_text(prepare(root), encoding='utf8')
