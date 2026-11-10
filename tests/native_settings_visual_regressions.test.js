'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
const settings=read('smali/com/melodix/music/NativeSettingsRowFactory.smali');
const section=(text,a,b)=>{const i=text.indexOf(a),j=text.indexOf(b,i+1);assert.ok(i>=0&&j>i);return text.slice(i,j);};
test('empty settings images reach a visible glyph and nonempty images use the loader',()=>{
 const block=section(settings,'invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z','\n    :native_settings_no_avatar');
 assert.match(block,/move-result v3\s+if-nez v3, :native_settings_icon_placeholder/);
 assert.match(block,/NativeImageLoader;->load[\s\S]*?goto :native_settings_no_avatar[\s\S]*?:native_settings_icon_placeholder[\s\S]*?native_cover_placeholder/);
});
test('nonempty subtitles are shown, empty ones skipped',()=>{
 const block=section(settings,'invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z','\n    :native_settings_pill');
 assert.match(block,/move-result v0\s+if-nez v0, :native_settings_pill/);
 assert.match(block,/TextView;->setText\(Ljava\/lang\/CharSequence;\)V/);
});
test('ON and OFF switches have an explicit density-scaled track before applying both state colors',()=>{
 const block=section(settings,'\n    :native_settings_switch_build','\n    :native_settings_pill_text');
 assert.match(block,/NativeUiMetrics;->settingsSwitchTrackWidth[\s\S]*?NativeUiMetrics;->settingsSwitchTrackHeight[\s\S]*?setSize\(II\)V[\s\S]*?setTrackDrawable/);
 assert.match(block,/setTrackDrawable[\s\S]*?setTrackTintList/);assert.match(block,/setSplitTrack\(Z\)V/);
});
