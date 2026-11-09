#!/usr/bin/env bash
# Metadata only. Never download, install, run or publish a WebView package.
set -euo pipefail
curl --fail --silent --show-error --get \
  'https://storage.googleapis.com/storage/v1/b/chromium-browser-snapshots/o' \
  --data-urlencode 'prefix=AndroidDesktop_x64/' \
  --data-urlencode 'delimiter=/' \
  --data-urlencode 'startOffset=AndroidDesktop_x64/1706000/' \
  --data-urlencode 'endOffset=AndroidDesktop_x64/1706600/' \
  --data-urlencode 'maxResults=1000' > "$RUNNER_TEMP/snapshots.json"
python3 - "$RUNNER_TEMP/snapshots.json" <<'PYTHON'
import json, re, sys
x=json.load(open(sys.argv[1])); revisions=[]
for p in x.get('prefixes', []):
    m=re.fullmatch(r'AndroidDesktop_x64/(170[0-9]{4})/',p)
    if m and 1706000 <= int(m[1]) < 1706600: revisions.append(int(m[1]))
print('::notice title=Chromium snapshot discovery::revisions='+(','.join(map(str, sorted(revisions)[-20:])) or 'none'))
if x.get('nextPageToken'): print('::warning::Snapshot listing is incomplete')
PYTHON
