#!/usr/bin/env python3
"""Review only the fresh emulator's synthetic screenshots through the GitHub API.
Full PNGs remain in the artifact. Never call this on real-account evidence.
One small JPEG per annotation allows pixel review where artifact-host downloads
are unavailable. No URLs, clipboard values, cookies, or WebView log dumping.
"""
import base64
import io
from pathlib import Path
import re
import sys
from PIL import Image

root = Path(sys.argv[1])
for path in sorted(root.glob('*.png'))[:8]:
    if not re.fullmatch(r'(phone|tablet|small-large-font|keyboard)-(status|details)\.png', path.name):
        continue
    image = Image.open(path).convert('RGB')
    image.thumbnail((800, 960))
    buffer = io.BytesIO()
    image.save(buffer, format='JPEG', quality=65, optimize=True)
    data = base64.b64encode(buffer.getvalue()).decode('ascii')
    if len(data) <= 58000:
        print(f'::notice title=Session screenshot {path.stem}::jpeg-base64={data}')
lines = []
for path in sorted(root.glob('*.txt')):
    for line in path.read_text(errors='replace').splitlines():
        if re.fullmatch(r'INSTRUMENTATION_(STATUS|RESULT): (phase=[a-z0-9_]+|result=passed|overall=(passed|failed)|error_class=[A-Za-z]+|(?:viewport_height|viewport_width|action_height|card_height|card_width|center_delta)=[0-9]+)', line):
            lines.append(path.stem + ' ' + line)
        elif re.fullmatch(r'\s*(Total frames rendered:|Janky frames:|[0-9]+th percentile:|Number Missed Vsync:).*', line):
            lines.append(path.stem + ' ' + line.strip())
text = '\n'.join(lines)[:16000].replace('%','%25').replace('\r','%0D').replace('\n','%0A')
print('::notice title=Session bounded outcomes::' + text)
