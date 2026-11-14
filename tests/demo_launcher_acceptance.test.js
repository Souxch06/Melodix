'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const cp = require('node:child_process');
const read = p => fs.readFileSync(p, 'utf8');

test('delivery depends on real launcher acceptance, not nonblocking old captures', () => {
  const workflow = read('.github/workflows/demo-preview.yml');
  const strict = workflow.slice(workflow.indexOf('  launcher-acceptance:'), workflow.indexOf('  validate-captures:'));
  assert.match(strict, /needs: build/);
  assert.doesNotMatch(strict, /continue-on-error/);
  assert.match(strict, /inspect_demo_apk\.py/);
  assert.match(strict, /07-reglages-reels/);
  assert.match(strict, /Upload validated APK and real captures together/);
  assert.match(strict, /if: always\(\)/);
  const capture = read('scripts/capture_launcher_acceptance.py');
  assert.match(capture, /'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER'/);
  assert.doesNotMatch(capture, /DemoSettingsActivity|am', 'start', '-n|evaluateJavascript|pm', 'clear/);
  assert.match(capture, /real settings inaccessible: session gate/);
  assert.match(capture, /'MODE DÉMO · HORS LIGNE'/);
});

test('DEX inspector requires an actual class definition, not just a descriptor string', () => {
  const py = String.raw`
import os, pathlib, struct, subprocess, sys, tempfile, zipfile
inspector = pathlib.Path('scripts/inspect_demo_apk.py').resolve()
with tempfile.TemporaryDirectory() as d:
    root = pathlib.Path(d); tools = root / 'sdk/build-tools/35.0.0'; tools.mkdir(parents=True)
    cert = 'e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f'
    for tool, output in [('aapt', "package: name='com.melodix.music.preview' versionCode='1021500' versionName='1.2.2-abcdef0'"), ('apksigner', 'Signer #1 certificate SHA-256 digest: '+cert)]:
        p = tools / tool; p.write_text('#!/bin/sh\nprintf "%s\\n" "'+output+'"\n'); p.chmod(0o755)
    env = dict(os.environ, ANDROID_HOME=str(root/'sdk'))
    descriptor = b'Lcom/melodix/demo/DemoEntry;'
    def make_dex(defined):
        data = bytearray(112 + 4 + 4 + 32 + 1 + len(descriptor) + 1)
        data[:8] = b'dex\n035\0'
        def put(offset, value): struct.pack_into('<I', data, offset, value)
        put(56, 1); put(60, 112); put(64, 1); put(68, 116)
        put(96, 1 if defined else 0); put(100, 120)
        put(112, 152); put(116, 0); put(120, 0)
        data[152] = len(descriptor); data[153:153+len(descriptor)] = descriptor
        return data
    apk = root / 'test.apk'
    def inspect(defined):
        with zipfile.ZipFile(apk, 'w') as z: z.writestr('classes2.dex', make_dex(defined))
        return subprocess.run([sys.executable, str(inspector), str(apk), 'abcdef0123456789012345678901234567890123', str(root/'output')], env=env, capture_output=True, text=True)
    absent = inspect(False)
    assert absent.returncode != 0 and 'must be defined' in absent.stderr, absent.stderr
    present = inspect(True)
    assert present.returncode == 0, present.stderr
    assert 'classes2.dex' in (root/'output/inspection.json').read_text()
`;
  const r = cp.spawnSync('python3', ['-c', py], {encoding:'utf8'});
  assert.equal(r.status, 0, r.stderr || r.stdout);
});
