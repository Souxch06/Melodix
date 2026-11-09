'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
function method(file,name){const s=fs.readFileSync(file,'utf8'),a=s.indexOf('.method public '+name),b=s.indexOf('.end method',a);assert.ok(a>=0&&b>a);return s.slice(a,b);}
test('native search field has distinct focus feedback without changing its fill',()=>{
 const s=fs.readFileSync('res/drawable/native_search_field.xml','utf8');
 assert.match(s,/<selector/);assert.match(s,/state_focused="true"/);assert.match(s,/@color\/mel_accent_deep/);assert.equal((s.match(/@color\/mel_search_bg/g)||[]).length,2);
});
test('library selection is also exposed as an accessibility selected state',()=>{
 const m=method('smali/com/melodix/music/MainActivity.smali','final styleNativeLibraryChips(');
 assert.match(m,/invoke-virtual \{v3, v5\}, Landroid\/view\/View;->setSelected\(Z\)V/);assert.match(m,/setBackgroundTintList/);
});
test('playlist banner uses named accent pill and the density-aware shelf radius',()=>{
 const m=method('smali/com/melodix/music/NativeUiRowFactory.smali','static createPlaylistBanner(');
 assert.match(m,/NativeUiMetrics;->shelfRadius/);assert.match(m,/"native_button_green"[\s\S]*?->applyDrawableBackground/);
 assert.match(m,/NativeRowClickListener/);assert.match(m,/"native_cover_placeholder"/);assert.doesNotMatch(m,/-0xe128a0/);
});
