'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const cp = require('node:child_process');
const read = p => fs.readFileSync(p, 'utf8');

test('test-only session layouts place the tracer next to the demo and keep the production project intact', () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'melodix-local-tracer-'));
  const files = ['AndroidManifest.xml', 'smali/com/melodix/music/AppSingleton.smali',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali', 'smali/com/melodix/music/NativeSessionSurface.smali',
    'smali/com/melodix/music/MainActivity.smali', 'res/layout/native_session_surface.xml',
    'res/layout/native_session_login_header.xml', 'smali/com/melodix/music/NativeLimitedGlass.smali'];
  try {
    const original = Object.fromEntries(files.map(f => [f, read(f)]));
    for (const f of files) { const out=path.join(dir,f); fs.mkdirSync(path.dirname(out),{recursive:true}); fs.copyFileSync(f,out); }
    cp.execFileSync('python3',['scripts/prepare_demo_preview.py',dir]);
    cp.execFileSync('python3',['-c', String.raw`
import sys, pathlib, xml.etree.ElementTree as ET
root=pathlib.Path(sys.argv[1]); a='{http://schemas.android.com/apk/res/android}'
app=ET.parse(root/'AndroidManifest.xml').getroot().find('application')
local=[x for x in app.findall('activity') if x.get(a+'name')=='com.melodix.local.LocalMusicActivity']
assert len(local)==1 and local[0].get(a+'exported')=='false' and local[0].get(a+'process')==':demo'
for name in ('native_session_surface.xml','native_session_login_header.xml'):
    layout=ET.parse(root/'res/layout'/name).getroot()
    found=[(parent,list(parent).index(child),child) for parent in layout.iter() for child in parent if child.get(a+'tag')=='preview-local-music-entry']
    assert len(found)==1
    parent,index,button=found[0]
    assert list(parent)[index-1].get(a+'tag')=='preview-demo-entry'
    assert button.get(a+'text')=='Ma musique' and button.get(a+'contentDescription')=='Ma musique'
    assert button.get(a+'onClick')=='onPreviewLocalMusicClick' and button.get(a+'minHeight')=='48dp'
    assert button.get(a+'visibility','visible')=='visible'
`,dir]);
    const main=read(path.join(dir,'smali/com/melodix/music/MainActivity.smali'));
    assert.match(main,/onPreviewLocalMusicClick\(Landroid\/view\/View;\)V[\s\S]*?const-class v1, Lcom\/melodix\/local\/LocalMusicActivity;[\s\S]*?->startActivity/);
    for (const f of files) assert.equal(read(f),original[f],f);
  } finally { fs.rmSync(dir,{recursive:true,force:true}); }
});

test('local UI uses a document picker without networking and its DEX remains test-only', () => {
  const local=read('local/src/com/melodix/local/LocalMusicActivity.java');
  assert.match(local,/class LocalMusicActivity extends Activity/);
  assert.match(local,/text\("nativeScreenTitle","Ma musique"\)/);
  assert.match(local,/setAllCaps\(false\)/);
  assert.match(local,/setOnClickListener\(view -> finish\(\)\)/);
  assert.match(local,/Intent\.ACTION_OPEN_DOCUMENT/);
  assert.doesNotMatch(local,/MediaStore|java\.net|https?:\/\//);
  const preview=read('.github/workflows/preview-apk.yml'), release=read('.github/workflows/release-apk.yml');
  assert.match(preview,/if \[\[ "\$DEMO_BUILD" == "true" \]\]; then[\s\S]*?"\$source_dir\/demo\/src" "\$source_dir\/local\/src"[\s\S]*?\$build_tools\/d8[\s\S]*?classes2\.dex[\s\S]*?check_preview_dex\.py/);
  assert.doesNotMatch(release,/local\/src|LocalMusicActivity/);
  const acceptance=read('scripts/acceptance_autonomous.py');
  assert.match(acceptance,/tap\(wait\(text='Ma musique'\)\)[\s\S]*?musique-locale-tracer[\s\S]*?tap\(wait\(text='Retour'\)\)/);
  assert.match(acceptance,/musique-locale-depuis-session[\s\S]*?retour-session/);
});

test('DEX verifier detects missing and duplicate class definitions across actual DEX entries', () => {
  const py=String.raw`
import pathlib, struct, subprocess, sys, tempfile, zipfile
script=pathlib.Path('scripts/check_preview_dex.py').resolve()
with tempfile.TemporaryDirectory() as d:
  apk=pathlib.Path(d)/'x.apk'
  def dex(classes):
    strings=[s.encode('ascii') for s in classes]; n=len(strings); so=112; to=so+4*n; co=to+4*n; off=co+32*n
    data=bytearray(off)
    data[:8]=b'dex\n035\0'
    def put(i,v): struct.pack_into('<I',data,i,v)
    for i,v in [(56,n),(60,so),(64,n),(68,to),(96,n),(100,co)]: put(i,v)
    for i,s in enumerate(strings):
      assert len(s)<128
      put(so+4*i,len(data)); put(to+4*i,i); put(co+32*i,i)
      data.extend(bytes([len(s)])+s+b'\0')
    return data
  demo='Lcom/melodix/demo/DemoEntry;'; local='Lcom/melodix/local/LocalMusicActivity;'; service='Lcom/melodix/local/LocalPlaybackService;'; base='Lcom/example/Base;'
  def run(first,second):
    with zipfile.ZipFile(apk,'w') as z:
      z.writestr('classes.dex',dex(first)); z.writestr('classes2.dex',dex(second))
    return subprocess.run([sys.executable,str(script),str(apk)],capture_output=True,text=True)
  good=run([base],[demo,local,service]); assert good.returncode==0,good.stderr
  missing=run([base],[demo]); assert missing.returncode!=0 and 'must be defined' in missing.stderr
  duplicate=run([base,local],[demo,local,service]); assert duplicate.returncode!=0 and 'duplicate DEX class' in duplicate.stderr
`;
  cp.execFileSync('python3',['-c',py]);
});
