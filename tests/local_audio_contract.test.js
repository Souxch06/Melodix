'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const cp=require('node:child_process');
const os=require('node:os');
const path=require('node:path');
const read=p=>fs.readFileSync(p,'utf8');

test('local playback is separate from the Spotify service and limited to selected content URIs',()=>{
 const a=read('local/src/com/melodix/local/LocalMusicActivity.java');
 const s=read('local/src/com/melodix/local/LocalPlaybackService.java');
 assert.match(a,/Intent\.ACTION_OPEN_DOCUMENT/);assert.match(a,/Intent\.CATEGORY_OPENABLE/);
 assert.match(a,/setType\("audio\/\*"\)/);assert.match(a,/FLAG_GRANT_READ_URI_PERMISSION/);
 assert.match(a,/takePersistableUriPermission\(uri,Intent\.FLAG_GRANT_READ_URI_PERMISSION\)/);
 assert.match(a,/requestCode != PICK_AUDIO \|\| resultCode != RESULT_OK/);
 assert.match(s,/!"content"\.equals\(uri\.getScheme\(\)\)/);
 for(const source of [a,s]) assert.doesNotMatch(source,/https?:\/\/|java\.net|okhttp|WebView|MediaStore|READ_MEDIA_AUDIO|READ_EXTERNAL_STORAGE|WebService|Spotify/);
 const manifest=read('AndroidManifest.xml');
 assert.match(manifest,/FOREGROUND_SERVICE_MEDIA_PLAYBACK/);assert.match(manifest,/POST_NOTIFICATIONS/);
 assert.doesNotMatch(manifest,/READ_MEDIA_AUDIO|READ_EXTERNAL_STORAGE/);
 assert.match(read('smali/com/melodix/music/WebService.smali'),/spotify:/);
});

test('selected file has background media, focus handling, safe metadata fallback and live UI',()=>{
 const a=read('local/src/com/melodix/local/LocalMusicActivity.java');
 const s=read('local/src/com/melodix/local/LocalPlaybackService.java');
 for(const token of ['startForeground','Notification.MediaStyle','setMediaSession','FLAG_IMMUTABLE',
  'AUDIOFOCUS_LOSS_TRANSIENT','AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK','AUDIOFOCUS_LOSS',
  'AUDIOFOCUS_GAIN','ACTION_AUDIO_BECOMING_NOISY','MediaMetadataRetriever','getEmbeddedPicture',
  'Artiste inconnu','MediaPlayer','prepareAsync','onDestroy']) assert.ok(s.includes(token),token);
 assert.match(a,/requestPermissions\(new String\[\]\{Manifest\.permission\.POST_NOTIFICATIONS\}/);
 assert.match(a,/if \(requestCode == NOTIFICATIONS\) openPicker\(\)/);
 for(const id of ['nativePlayerPanel','nativeMiniPlayerContainer','nativePlayerPositionText','nativePlayerDurationText','nativeMiniProgress','nativePlayerProgress']) assert.ok(a.includes(id),id);
 assert.match(a,/service\.position\(\)/);assert.match(a,/service\.duration\(\)/);
 assert.match(a,/service\.toggle\(\)/);assert.match(a,/handler\.removeCallbacks\(tick\)/);
});

test('preview manifest declares one private local media service only in the temporary build',()=>{
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'melodix-local-manifest-'));
 try {
  for(const f of ['AndroidManifest.xml','smali/com/melodix/music/AppSingleton.smali','smali/com/melodix/music/NativeSettingsRowFactory.smali']) {
   const dest=path.join(dir,f);fs.mkdirSync(path.dirname(dest),{recursive:true});fs.copyFileSync(f,dest);
  }
  cp.execFileSync('python3',['scripts/prepare_demo_preview.py',dir]);
  const py=String.raw`import xml.etree.ElementTree as E,sys
n='{http://schemas.android.com/apk/res/android}'
a=E.parse(sys.argv[1]).getroot().find('application')
s=[x for x in a.findall('service') if x.get(n+'name')=='com.melodix.local.LocalPlaybackService']
assert len(s)==1 and s[0].get(n+'exported')=='false' and s[0].get(n+'process')==':demo' and s[0].get(n+'foregroundServiceType')=='mediaPlayback'
`;
  cp.execFileSync('python3',['-c',py,path.join(dir,'AndroidManifest.xml')]);
  assert.doesNotMatch(read('AndroidManifest.xml'),/LocalPlaybackService/);
 } finally {fs.rmSync(dir,{recursive:true,force:true});}
});
