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
selected = sys.argv[2] if len(sys.argv) > 2 else ''
for path in sorted(root.glob('*.png'))[:8]:
    if path.stem != selected:
        continue
    if not re.fullmatch(r'(phone|tablet|small-large-font|keyboard)-(status|details)\.png', path.name):
        continue
    image = Image.open(path).convert('RGB')
    image.thumbnail((800, 960))
    buffer = io.BytesIO()
    image.save(buffer, format='JPEG', quality=65, optimize=True)
    data = base64.b64encode(buffer.getvalue()).decode('ascii')
    # GitHub truncates annotation messages at 4096 bytes. Each fragment is
    # bounded below that limit; the receiver requires ALL fragments + SHA256.
    import hashlib
    chunks = [data[i:i+3600] for i in range(0,len(data),3600)]
    if len(chunks) > 9:
        raise ValueError('thumbnail too large for bounded annotation step')
    digest=hashlib.sha256(buffer.getvalue()).hexdigest()
    for index,chunk in enumerate(chunks):
        print(f'::notice title=Session image {path.stem} {index+1} of {len(chunks)} sha256 {digest}::jpeg-part={chunk}')
if selected == 'metrics':
    lines = []
    for path in sorted(root.glob('*perf.txt')):
        for line in path.read_text(errors='replace').splitlines():
            if re.fullmatch(r'sid=[0-9a-f]{8} t=[0-9]+ session-state from=[a-z-]+ state=[a-z-]+ reason=[a-z-]+',line):
                lines.append(path.stem+' '+line)
            elif re.fullmatch(r'\s*(Total frames rendered:|Janky frames:|[0-9]+th percentile:|Number Missed Vsync:)[0-9a-zA-Z .%():]+',line):
                lines.append(path.stem+' '+line.strip())
    text='\n'.join(lines)[-3800:].replace('%','%25').replace('\n','%0A')
    print('::notice title=Session safe metrics::'+text)
    raise SystemExit(0)
if selected:
    raise SystemExit(0)
lines = []
for path in sorted(root.glob('*.txt')):
    for line in path.read_text(errors='replace').splitlines():
        if re.fullmatch(r'INSTRUMENTATION_(STATUS|RESULT): (phase=[a-z0-9_]+|result=passed|overall=(passed|failed)|error_class=[A-Za-z]+|(?:viewport_height|viewport_width|action_height|card_height|card_width|center_delta)=[0-9]+)', line):
            lines.append(path.stem + ' ' + line)
        elif re.fullmatch(r'\s*(Total frames rendered:|Janky frames:|[0-9]+th percentile:|Number Missed Vsync:).*', line):
            lines.append(path.stem + ' ' + line.strip())
text = '\n'.join(lines)[:3900].replace('%','%25').replace('\r','%0D').replace('\n','%0A')
print('::notice title=Session bounded outcomes::' + text)
