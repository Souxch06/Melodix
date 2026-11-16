#!/usr/bin/env python3
"""Re-embed the page scripts into their Java helpers (exact json.dumps form).

The build checks that each script file appears verbatim, JSON-escaped, in its
Java helper; this keeps them identical after any script change.
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
EMBEDS = [
    ('PreviewPlayerMode.java', 'SCRIPT', 'control.js'),
    ('PreviewPlayerMode.java', 'DIAGNOSTIC', 'control-diagnostic.js'),
    ('PreviewPlayerMode.java', 'JOB', 'mode-job.js'),
    ('PreviewPlayerVolume.java', 'SCRIPT', 'volume-control.js'),
    ('PreviewPlayerTiles.java', 'PANEL_PROBE', 'panel-structure.js'),
    ('PreviewPlayerTiles.java', 'PANEL_READ', 'panel-read.js'),
    ('PreviewPlayerTiles.java', 'QUEUE_JOB', 'queue-job.js'),
]


def main(check):
    changed = []
    for java, name, script in EMBEDS:
        path = HERE / java
        source = path.read_text(encoding='utf8')
        literal = json.dumps((HERE / script).read_text(encoding='utf8'), ensure_ascii=True)
        pattern = re.compile(r'(private static final String ' + name + r' = )("(?:[^"\\]|\\.)*")(;)')
        matches = pattern.findall(source)
        if len(matches) != 1:
            raise SystemExit(f'{java}: expected one {name} constant, found {len(matches)}')
        if matches[0][1] != literal:
            changed.append(f'{java}:{name}')
            source = pattern.sub(lambda m: m.group(1) + literal + m.group(3), source)
            if not check:
                path.write_text(source, encoding='utf8')
    if check and changed:
        raise SystemExit('embedded scripts out of date: ' + ', '.join(changed))
    print('embedded scripts ' + ('checked' if check else 'synchronised') + (': ' + ', '.join(changed) if changed else ''))


if __name__ == '__main__':
    main('--check' in sys.argv)
