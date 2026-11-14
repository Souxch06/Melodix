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
 for(const t of ['Spotify refuse l’accès avec ta session actuelle','Spotify refuse l’accès avec ce compte','Se reconnecter']) assert.ok(src.includes(t));
 assert.match(ex,/sessionSecondary[\s\S]*?Se reconnecter/);assert.match(ex,/->details\(\)Ljava\/lang\/String;[\s\S]*?ClipData;->newPlainText/);
 assert.doesNotMatch(ex,/buildDiagnosticText|getCookie|evaluateJavascript|RenderEffect/);
 assert.match(ex,/animator_duration_scale/);assert.match(ex,/if-nez p2, :done/);
 assert.match(src,/renderedReason/);
});
test('phase1 white button text and primary/secondary copy meet AA on defined opaque bases',()=>{
 const lum=hex=>{const rgb=hex.match(/[a-f0-9]{2}/gi).map(s=>parseInt(s,16)/255).map(n=>n<=.04045?n/12.92:((n+.055)/1.055)**2.4);return rgb[0]*.2126+rgb[1]*.7152+rgb[2]*.0722;};
 const contrast=(a,b)=>(Math.max(lum(a),lum(b))+.05)/(Math.min(lum(a),lum(b))+.05);
 for(const bg of ['7C3AED','DB2777'])assert.ok(contrast('FFFFFF',bg)>=4.5,bg);
 for(const fg of ['F5F5FA','A1A1B5'])assert.ok(contrast(fg,'0B0B14')>=4.5,fg);
});

test('technical details and copied output include locally installed build identity without accessing session data',()=>{
 const gate=read('smali/com/melodix/music/NativeSessionGate.smali'),info=read('smali/com/melodix/music/NativeSessionBuildInfo.smali');
 assert.match(gate,/NativeSessionAttemptDiagnostic;->appendTo[\s\S]*?NativeSessionBuildInfo;->append/);
 for(const v of ['getPackageInfo','getLongVersionCode','versionCode:I','versionName:Ljava/lang/String;','VersionCode=','build='])assert.ok(info.includes(v),v);
 assert.match(info,/\[A-Za-z0-9\._-\]\{1,48\}/);assert.doesNotMatch(info,/Cookie|WebStorage|loadUrl|Authorization|token/i);
});

test('retry component failure uses a precise message and keeps the retry action',()=>{
 const s=read('smali/com/melodix/music/NativeSessionSurface.smali'),a=s.indexOf('const-string v5, "retry-js-unavailable"'),b=s.indexOf('    :retry_other',a);
 assert.ok(a>=0&&b>a);assert.match(s.slice(a,b),/Le composant de connexion ne répond pas\. Réessaie\./);
 assert.match(read('smali/com/melodix/music/NativeSessionSurfaceExtras.smali'),/sessionSecondary[\s\S]*?Se reconnecter/);
});

test('error and expired screens both show an explicit warned secondary reconnect action',()=>{
 const x=read('smali/com/melodix/music/NativeSessionSurfaceExtras.smali'),ui=read('smali/com/melodix/music/NativeSessionSurface.smali'),xml=read('res/layout/native_session_surface.xml');
 assert.match(x,/if-eq p2, v0, :reconnect[\s\S]*?if-ne p2, v0, :details[\s\S]*?sessionSecondary[\s\S]*?Se reconnecter[\s\S]*?const\/4 v1, 0x2/);
 assert.match(xml,/session actuelle, tous les cookies et données Web de cette application, uniquement après ton appui/);
 assert.match(ui,/if-eq v1, v4, :retry_action/);
});
