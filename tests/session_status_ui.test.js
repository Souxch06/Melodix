'use strict';
const {test}=require('node:test');const assert=require('node:assert/strict');const fs=require('node:fs');const read=p=>fs.readFileSync(p,'utf8');
test('phase1 scalable card, scroll fallback and 48dp wrapping actions',()=>{
 const xml=read('res/layout/native_session_surface.xml');
 assert.match(xml,/fillViewport="true"/);assert.match(xml,/<FrameLayout[\s\S]*?layout_gravity="center"/);
 for(const id of ['sessionAction','sessionSecondary','sessionDisclosure','sessionCopy'])assert.match(xml,new RegExp('id="@\\+id/'+id+'"[^>]*layout_height="wrap_content"[^>]*minHeight="48dp"'));
 assert.match(read('smali/com/melodix/music/NativeSessionCard.smali'),/480dp[\s\S]*?if-le[\s\S]*?makeMeasureSpec/);
 assert.doesNotMatch(xml,/maxLines|singleLine|ellipsize|backdrop/);
});
test('expired and post-fresh refusal have distinct labels, explicit secondary retry, scoped copy',()=>{
 const src=read('smali/com/melodix/music/NativeSessionSurface.smali'),ex=read('smali/com/melodix/music/NativeSessionSurfaceExtras.smali');
 for(const t of ['Ta session Spotify semble expirée','Spotify refuse l’accès avec ce compte','Se reconnecter']) assert.ok(src.includes(t));
 assert.match(ex,/sessionSecondary[\s\S]*?Réessayer/);assert.match(ex,/->details\(\)Ljava\/lang\/String;[\s\S]*?ClipData;->newPlainText/);
 assert.doesNotMatch(ex,/buildDiagnosticText|getCookie|evaluateJavascript|RenderEffect/);
 assert.match(ex,/animator_duration_scale/);assert.match(ex,/if-nez p2, :done/);
 assert.match(src,/renderedReason/);
});
