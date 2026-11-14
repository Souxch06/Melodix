'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const cp = require('node:child_process');
const os = require('node:os');
const path = require('node:path');

test('login removes the top banner while preserving a compact preview demo entry', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-login-layout-'));
  try {
    for (const name of ['AndroidManifest.xml', 'smali/com/melodix/music/AppSingleton.smali',
      'smali/com/melodix/music/NativeSettingsRowFactory.smali', 'smali/com/melodix/music/NativeSessionSurface.smali',
      'smali/com/melodix/music/MainActivity.smali', 'res/layout/native_session_surface.xml',
      'res/layout/native_session_login_header.xml', 'smali/com/melodix/music/NativeLimitedGlass.smali']) {
      const dest = path.join(dir, name);
      fs.mkdirSync(path.dirname(dest), {recursive:true}); fs.copyFileSync(name, dest);
    }
    cp.execFileSync('python3', ['scripts/prepare_demo_preview.py', dir]);
    const check = String.raw`
import sys, pathlib, xml.etree.ElementTree as ET
root = pathlib.Path(sys.argv[1]); a='{http://schemas.android.com/apk/res/android}'
layout=ET.parse(root/'res/layout/native_session_login_header.xml').getroot()
assert layout.get(a+'background') == '@android:color/transparent'
for ident in ('sessionTitle','sessionSubtitle','sessionAction','sessionDisclosure','sessionDetails','sessionCopy'):
    items=[n for n in layout.iter() if n.get(a+'id')=='@+id/'+ident]
    assert len(items)==1 and items[0].get(a+'visibility')=='gone', ident
items=[n for n in layout.iter() if n.get(a+'tag')=='preview-demo-entry']
assert len(items)==1
entry=items[0]
assert entry.get(a+'text')=='Essayer le mode démo'
assert entry.get(a+'onClick')=='onPreviewDemoClick'
assert entry.get(a+'layout_marginTop')=='0dp'
assert entry.get(a+'minHeight')=='48dp'
assert entry.get(a+'visibility','visible')=='visible'
# Do not change the normal session surface's permanent entry.
session=ET.parse(root/'res/layout/native_session_surface.xml').getroot()
assert len([n for n in session.iter() if n.get(a+'tag')=='preview-demo-entry'])==1
`;
    cp.execFileSync('python3', ['-c', check, dir]);
  } finally { fs.rmSync(dir, {recursive:true, force:true}); }
});

test('only login uses bottom gravity and reserves its measured height, removed on exit', () => {
  const surface=fs.readFileSync('smali/com/melodix/music/NativeSessionSurface.smali','utf8');
  const listener=fs.readFileSync('smali/com/melodix/music/NativeSessionSurfaceLayout.smali','utf8');
  assert.match(surface, /const\/16 v3, 0x30\s+if-eqz v2, :set_gravity\s+const\/16 v3, 0x50\s+:set_gravity\s+iput v3, v5, Landroid\/widget\/FrameLayout\$LayoutParams;->gravity:I/);
  assert.match(listener, /loginActive:Z[\s\S]*if-eqz v0, :done/);
  assert.match(listener, /sub-int v2, p5, p3[\s\S]*getPaddingTop\(\)I[\s\S]*getPaddingBottom\(\)I[\s\S]*if-eq v2, v3, :done[\s\S]*setPadding\(IIII\)V/);
  assert.match(listener, /invoke-virtual \{v1, v3, v3, v3, v2\}, Landroid\/view\/View;->setPadding/);
  assert.match(surface, /:remove[\s\S]*?:padding[\s\S]*?invoke-virtual \{v3, v4, v4, v4, v4\}.*setPadding/);
});
