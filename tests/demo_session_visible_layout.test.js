'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const cp = require('node:child_process');

test('preview session layouts always contain an actionable button before diagnostics', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-visible-session-'));
  try {
    const files = ['AndroidManifest.xml', 'smali/com/melodix/music/AppSingleton.smali',
      'smali/com/melodix/music/NativeSettingsRowFactory.smali',
      'smali/com/melodix/music/NativeSessionSurface.smali',
      'smali/com/melodix/music/MainActivity.smali',
      'res/layout/native_session_surface.xml', 'res/layout/native_session_login_header.xml'];
    const original = Object.fromEntries(files.map(f => [f, fs.readFileSync(f, 'utf8')]));
    for (const file of files) {
      const dest = path.join(dir, file);
      fs.mkdirSync(path.dirname(dest), {recursive: true});
      fs.copyFileSync(file, dest);
    }
    cp.execFileSync('python3', ['scripts/prepare_demo_preview.py', dir]);
    const py = String.raw`
import sys, xml.etree.ElementTree as ET, pathlib
root = pathlib.Path(sys.argv[1]); a='{http://schemas.android.com/apk/res/android}'
for name in ('native_session_surface.xml', 'native_session_login_header.xml'):
    layout = ET.parse(root/'res/layout'/name).getroot()
    found = [(parent, list(parent).index(child), child) for parent in layout.iter() for child in parent if child.get(a+'tag') == 'preview-demo-entry']
    assert len(found) == 1, (name, len(found))
    parent, index, button = found[0]
    assert button.get(a+'text') == 'Essayer le mode démo'
    assert button.get(a+'contentDescription') == 'Essayer le mode démo'
    assert button.get(a+'onClick') == 'onPreviewDemoClick'
    assert button.get(a+'visibility', 'visible') == 'visible'
    assert list(parent)[index-1].get(a+'id') == '@+id/sessionAction'
    for child in list(parent):
        if child.get(a+'id') in ('@+id/sessionDisclosure', '@+id/sessionDetailPanel'):
            assert list(parent).index(child) > index, name
`;
    cp.execFileSync('python3', ['-c', py, dir]);
    const smali = fs.readFileSync(path.join(dir, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    assert.match(smali, /\.method public final onPreviewDemoClick\(Landroid\/view\/View;\)V\s+\.locals 0\s+invoke-static \{p0\}, Lcom\/melodix\/demo\/DemoEntry;->open\(Landroid\/app\/Activity;\)V/);
    const surface = fs.readFileSync(path.join(dir, 'smali/com/melodix/music/NativeSessionSurface.smali'), 'utf8');
    const start = surface.indexOf('->retryState()V');
    const early = surface.slice(start, surface.indexOf('    :remove_old', start));
    assert.match(early, /DemoEntry;->bindSession\(/);
    assert.match(early, /DemoEntry;->bindSessionOtherStates\(/);
    assert.match(early, /bringToFront/);
    for (const file of files) assert.equal(fs.readFileSync(file, 'utf8'), original[file], `${file} must remain untouched in source project`);
  } finally { fs.rmSync(dir, {recursive: true, force: true}); }
});

test('entry remains isolated and has no session-changing code', () => {
  const helper = fs.readFileSync('demo/src/com/melodix/demo/DemoEntry.java', 'utf8');
  assert.match(helper, /public static void open\(Activity a\)[\s\S]*?new Intent\(a, DemoActivity\.class\)/);
  assert.match(helper, /parent\.findViewWithTag\("preview-demo-entry"\) != null/);
  assert.match(helper, /parent\.addView\(demo, actionIndex < 0 \? 0 : actionIndex \+ 1, lp\)/);
  assert.doesNotMatch(helper, /CookieManager|WebStorage|removeAllCookies|clearApplicationUserData|NativeSessionGate|NativeSessionEvidence|https?:\/\//);
});
