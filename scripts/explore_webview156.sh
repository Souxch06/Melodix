#!/usr/bin/env bash
# Discovery and archive inspection only; never install, run or publish an APK.
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

if [[ "${DISCOVERY_MODE:-webview-discovery}" == webview-inspect ]]; then
  # Immutable Chromium CI revision near the M156 branch point, not a stable
  # Google WebView release. Inspection here is not execution or installation.
  d="$RUNNER_TEMP/chromium156"; mkdir -p "$d"
  url='https://storage.googleapis.com/chromium-browser-snapshots/AndroidDesktop_x64/1706493/chrome-android-desktop.zip'
  curl --fail --silent --show-error --location --retry 2 --max-time 600 -o "$d/archive.zip" "$url"
  ziphash=$(sha256sum "$d/archive.zip" | cut -d' ' -f1)
  unzip -p "$d/archive.zip" chrome-android-desktop/apks/SystemWebView.apk > "$d/webview.apk"
  test -s "$d/webview.apk"
  apkhash=$(sha256sum "$d/webview.apk" | cut -d' ' -f1)
  tools="$ANDROID_HOME/build-tools/35.0.0"
  "$tools/aapt" dump badging "$d/webview.apk" > "$d/badging.txt"
  python3 - "$d/badging.txt" "$ziphash" "$apkhash" <<'PYTHON'
import re,sys
s=open(sys.argv[1]).read(); m=re.search(r"^package: name='([^']+)' versionCode='[0-9]+' versionName='([^']+)'",s,re.M)
if not m or m[1]!='com.android.webview' or not re.match(r'^156\.[0-9.]+$',m[2]) or "'x86_64'" not in s:
    print('::error::Not the expected x86_64 Chromium 156 WebView fixture');sys.exit(1)
print(f'::notice title=Chromium fixture inspection::version={m[2]} zip_sha256={sys.argv[2]} apk_sha256={sys.argv[3]}')
PYTHON
fi
