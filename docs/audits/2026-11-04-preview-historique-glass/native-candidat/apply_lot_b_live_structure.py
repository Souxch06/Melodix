#!/usr/bin/env python3
"""Lot B / B1: add a passive live structural probe to the on-demand diagnostic.

Edits exactly two files in the build tree:
- assets/runtime_diagnostic.js : inserts lot_b_live_structure.js before the
  stateKey guard (the probe is defined only when the existing host guard passes);
- smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali : replaces the
  one JavaScript expression so the copy action returns {live, samples}.
Fails closed if any anchor is missing or not unique. Never touches the seven
protected Preview assets.
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
PROBE = (HERE / 'lot_b_live_structure.js').read_text(encoding='utf-8')
GUARD = '  if (window[stateKey]) return false;\n'
FETCH = 'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali'
OLD_PREFIX = '    const-string v2, "(function(){if(!window.location'
NEW_LINE = (
    '    const-string v2, "(function(){if(!window.location||window.location.protocol!==\'https:\''
    '||window.location.hostname!==\'open.spotify.com\'||(window.location.port&&window.location.port!==\'443\'))return null;'
    'var out={live:null,samples:null};'
    'try{if(typeof window.__melodixLiveStructure===\'function\')out.live=window.__melodixLiveStructure();}'
    'catch(e){out.live={error:\'probe-failed\'};}'
    'var s=window.__melodixRuntimeDiagnosticV2;'
    'if(s&&s.complete===true&&Array.isArray(s.samples)&&s.samples.length===4)out.samples=s.samples;'
    'return out;})()"'
)


def unique_index(text, needle, label):
    count = text.count(needle)
    if count != 1:
        raise SystemExit(f'{label}: expected exactly one anchor, found {count}')
    return text.index(needle)


def main(work):
    work = Path(work)
    js_path = work / 'assets/runtime_diagnostic.js'
    js = js_path.read_text(encoding='utf-8')
    if '__melodixLiveStructure' in js:
        raise SystemExit('runtime_diagnostic.js already patched')
    at = unique_index(js, GUARD, 'runtime_diagnostic.js guard')
    js_path.write_text(js[:at] + PROBE + js[at:], encoding='utf-8')

    smali_path = work / FETCH
    lines = smali_path.read_text(encoding='utf-8').split('\n')
    hits = [i for i, line in enumerate(lines) if line.startswith(OLD_PREFIX)]
    if len(hits) != 1:
        raise SystemExit(f'FetchRunnable: expected exactly one expression line, found {len(hits)}')
    lines[hits[0]] = NEW_LINE
    smali_path.write_text('\n'.join(lines), encoding='utf-8')
    print('lot-b live structure probe applied: runtime_diagnostic.js and FetchRunnable')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_lot_b_live_structure.py <work-dir>')
    main(sys.argv[1])
