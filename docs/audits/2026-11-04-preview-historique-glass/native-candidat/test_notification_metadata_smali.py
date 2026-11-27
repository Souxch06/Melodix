#!/usr/bin/env python3
"""Structural check of the smali edits for the notification metadata (not a behaviour test).

Asserts that recMediaStatus (a) keeps the page artist for the same title through artistFor,
and (b) republishes the native MediaSession metadata only when title or artist changed.
Behaviour on a device is NOT covered here.
"""
import os, re, sys
from pathlib import Path

ROOT = Path(os.environ.get('MELODIX_ROOT', Path(__file__).resolve().parents[4]))
bridge = (ROOT / 'smali/com/melodix/music/AndBridge.smali').read_text(encoding='utf8')
m = re.search(r'\.method public final recMediaStatus\(Ljava/lang/String;\)V.*?\.end method', bridge, re.S)
assert m, 'recMediaStatus not found'
body = m.group(0)
assert '.locals 8' in body, 'registers for the new code must be declared'
assert 'PreviewPlayerController;->artistFor(Ljava/lang/String;)' in body, 'artist substitution missing'
assert body.index('artistFor') < body.index('WebService;->u:Ljava/lang/String;\n    # Republish'), 'artist must be set before the republish check'
assert 'Lzi1;->b(Z)V' in body and body.rindex(':skip_meta') > body.index('Lzi1;->b(Z)V'), 'republish guard missing'
assert 'and-int/2addr v4, v5' in body and 'if-nez v4, :skip_meta' in body, 'unchanged-metadata skip missing'
print('notification metadata smali structure: OK')
