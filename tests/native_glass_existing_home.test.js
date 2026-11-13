'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const read=f=>fs.readFileSync(f,'utf8');
const renderer=read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
const glass=read('smali/com/melodix/music/NativeLimitedGlass.smali');
const method=(s,sig)=>{const a=s.indexOf(sig);assert.ok(a>=0);return s.slice(a,s.indexOf('.end method',a));};
test('unproven Home uses existing Glass status renderer with fixed messages only',()=>{
 const show=method(glass,'.method public static show(');
 const status=method(renderer,'.method public static renderLimitedHomeStatus(');
 assert.match(show,/"home"[\s\S]*?renderLimitedHomeStatus[\s\S]*?:limited_actions/);
 assert.match(status,/NativeLimitedGlass;->available\(\)Z[\s\S]*?if-eqz v0, :no/);
 assert.match(status,/findViewById[\s\S]*?if-ne v0, p1, :no/);
 for(const s of ['"loading"','HTTP 401','HTTP 403','HTTP 429','cause n’est pas établie']) assert.ok(status.replaceAll('\\"','"').includes(s),s);
 assert.match(status,/beginNativeHomeRender[\s\S]*?renderHomeStatus[\s\S]*?noteNativeHomeSessionUnprovenStatusAttached/);
 assert.doesNotMatch(status,/->render\(|recordVerified|sput.*state:I|WebView|Cookie|token/);
});
test('verified Home keeps proof gate and adds connected state only after real cards attach',()=>{
 const render=method(renderer,'.method public static render(');
 assert.match(render,/state:I[\s\S]*?if-eq v0, v1, :private_render_proven\s+return-void/);
 assert.match(render,/hasNativeHomeCardsAttached\(\)Z[\s\S]*?if-eqz v5, :shelf_no_cards[\s\S]*?Bibliothèque · Connecté/);
 assert.match(render,/createSectionHeader/);
});
