'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const cp = require('node:child_process');
const read = p => fs.readFileSync(p, 'utf8');

test('preview hooks preserve the real gate and include active login and settings entry', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-persistent-demo-'));
  try {
    const files = ['AndroidManifest.xml', 'smali/com/melodix/music/AppSingleton.smali',
      'smali/com/melodix/music/NativeSettingsRowFactory.smali',
      'smali/com/melodix/music/NativeSessionSurface.smali',
      'smali/com/melodix/music/MainActivity.smali', 'res/layout/native_session_surface.xml'];
    for (const f of files) {
      const dest = path.join(dir, f);
      fs.mkdirSync(path.dirname(dest), {recursive:true});
      fs.copyFileSync(f, dest);
    }
    cp.execFileSync('python3', ['scripts/prepare_demo_preview.py', dir]);
    const surface = fs.readFileSync(path.join(dir, files[3]), 'utf8');
    assert.match(surface, /->bindSession\(Landroid\/app\/Activity;Landroid\/view\/View;IZ\)V\s+invoke-static \{p0, v0, v1, v2\}, Lcom\/melodix\/demo\/DemoEntry;->bindSessionOtherStates/);
    assert.match(surface, /if-nez v2, :done/);
    assert.match(surface, /NativeSessionSurfaceLayout;-><init>/);
    assert.doesNotMatch(read(files[3]), /com\/melodix\/demo/);
    assert.doesNotMatch(read(files[4]), /com\/melodix\/demo/);
  } finally { fs.rmSync(dir, {recursive:true, force:true}); }
});

test('login entry lives in the measured header and real settings use the requested label', () => {
  const helper = read('demo/src/com/melodix/demo/DemoEntry.java');
  const login = helper.slice(helper.indexOf('public static void bindSessionOtherStates'), helper.indexOf('public static void bindSettings'));
  const settings = helper.slice(helper.indexOf('public static void bindSettings'), helper.indexOf('public static void returnToApp'));
  assert.match(login, /state == 3 \|\| \(!loginActive && state != 0\)/);
  assert.match(login, /\(\(ScrollView\) overlay\)\.getChildAt\(0\)/);
  assert.match(login, /parent\.addView\(demo, 0, lp\)/);
  assert.match(login, /sessionCard/);
  assert.match(settings, /"settings"\.equals\(screen\)/);
  assert.match(settings, /button\(a, "Mode démo"\)/);
  assert.doesNotMatch(helper, /CookieManager|WebStorage|removeAllCookies|clearApplicationUserData|NativeSessionGate|NativeSessionEvidence|https?:\/\//);
});
