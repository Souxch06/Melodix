'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
test('settings cards and ripple masks use the same density-aware token',()=>{
 const p=loadDimens(PHONE),t=loadDimens(TABLET);
 assert.equal(resolveSize('@dimen/mel_settings_card_radius',p),16);assert.equal(resolveSize('@dimen/mel_settings_card_radius',t),18);
 const m=fs.readFileSync('smali/com/melodix/music/NativeUiMetrics.smali','utf8');
 assert.match(m,/settingsCardRadius\([\s\S]*?"mel_settings_card_radius"[\s\S]*?const\/16 v1, 0x10[\s\S]*?->metric/);
 const r=fs.readFileSync('smali/com/melodix/music/NativeSettingsRowFactory.smali','utf8');
 assert.equal((r.match(/->settingsCardRadius\(/g)||[]).length,2);
 assert.match(r,/settingsCardRadius[\s\S]*?int-to-float v0, v0[\s\S]*?\{v3, v0\}.*setCornerRadius/);
 assert.match(r,/settingsCardRadius[\s\S]*?int-to-float v0, v0[\s\S]*?\{v13, v0\}.*setCornerRadius/);
 assert.match(r,/->settingsRowHeight/);assert.match(r,/RippleDrawable/);assert.match(r,/NativeRowClickListener/);
});
