'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const cp = require('node:child_process');
const read = p => fs.readFileSync(p,'utf8');

test('only the isolated preview build injects demo entry points into the actual session and settings', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-real-demo-'));
  try {
    const files = ['AndroidManifest.xml', 'smali/com/melodix/music/AppSingleton.smali',
      'smali/com/melodix/music/NativeSettingsRowFactory.smali',
      'smali/com/melodix/music/NativeSessionSurface.smali',
      'smali/com/melodix/music/MainActivity.smali', 'res/layout/native_session_surface.xml', 'smali/com/melodix/music/NativeLimitedGlass.smali'];
    for (const f of files) {
      const dst = path.join(dir,f); fs.mkdirSync(path.dirname(dst),{recursive:true});
      fs.copyFileSync(f,dst);
    }
    const originals = Object.fromEntries(files.map(f => [f,read(f)]));
    cp.execFileSync('python3',['scripts/prepare_demo_preview.py',dir]);
    const temp = f => fs.readFileSync(path.join(dir,f),'utf8');
    const surface = temp('smali/com/melodix/music/NativeSessionSurface.smali');
    const main = temp('smali/com/melodix/music/MainActivity.smali');
    const limited = temp('smali/com/melodix/music/NativeLimitedGlass.smali');
    assert.match(limited, /:show_root\s+invoke-static \{p0, v3, v0\}, Lcom\/melodix\/demo\/DemoEntry;->bindSettings/);
    assert.doesNotMatch(read('smali/com/melodix/music/NativeLimitedGlass.smali'), /com\/melodix\/demo/);
    assert.match(surface, /:attach\s+invoke-static \{p0, v0, v1, v2\}, Lcom\/melodix\/demo\/DemoEntry;->bindSession/);
    assert.match(main, /removeAllViews\(\)V\s+iget-object v0, p0, Lcom\/melodix\/music\/MainActivity;->nativeCurrentScreen:[^\n]+\s+invoke-static \{p0, v2, v0\}, Lcom\/melodix\/demo\/DemoEntry;->bindSettings/);
    const layout = temp('res/layout/native_session_surface.xml');
    assert.match(layout, /@drawable\/native_shell_background/);
    assert.match(layout, /@drawable\/native_glass_surface/);
    for (const f of files) assert.equal(read(f), originals[f], `${f} remains unchanged in the real project`);
    const release = read('.github/workflows/release-apk.yml');
    const preview = read('.github/workflows/preview-apk.yml');
    assert.doesNotMatch(release, /prepare_demo_preview|demo\/src|DemoEntry|demo_build/);
    assert.doesNotMatch(originals['AndroidManifest.xml'], /com\.melodix\.demo/);
    assert.doesNotMatch(originals['smali/com/melodix/music/NativeSessionSurface.smali'], /com\/melodix\/demo/);
    assert.doesNotMatch(originals['smali/com/melodix/music/MainActivity.smali'], /com\/melodix\/demo/);
    assert.match(preview, /if \[\[ "\$DEMO_BUILD" == "true" \]\]; then\s+\[\[ "\$BUILD_ONLY" == "true" \]\]/);
    assert.match(preview, /python3 "\$source_dir\/scripts\/prepare_demo_preview.py" "\$work_dir"/);
  } finally { fs.rmSync(dir,{recursive:true,force:true}); }
});

test('visible preview controls retain the hidden shortcut and do not alter session data', () => {
  const helper = read('demo/src/com/melodix/demo/DemoEntry.java');
  const settings = read('demo/src/com/melodix/demo/DemoSettingsActivity.java');
  const demo = read('demo/src/com/melodix/demo/DemoActivity.java');
  assert.match(helper, /state == 0 \|\| state == 3/);
  assert.match(helper, /loginActive/);
  assert.match(helper, /"settings"\.equals\(screen\)/);
  assert.match(helper, /Essayer le mode démo/);
  assert.match(settings, /Essayer le mode démo/);
  assert.match(settings, /version\.setOnLongClickListener/);
  assert.match(demo, /Quitter la démo/);
  assert.match(helper, /FLAG_ACTIVITY_CLEAR_TOP \| Intent.FLAG_ACTIVITY_SINGLE_TOP/);
  assert.doesNotMatch(helper, /CookieManager|WebStorage|removeAllCookies|clearApplicationUserData|NativeSessionGate|NativeSessionEvidence|https?:\/\//);
});
