'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
test('settings cards and ripple masks use the same density-aware token',()=>{
 const p=loadDimens(PHONE),t=loadDimens(TABLET);
 assert.equal(resolveSize('@dimen/mel_settings_card_radius',p),16);assert.equal(resolveSize('@dimen/mel_settings_card_radius',t),18);
 const m=fs.readFileSync('smali/com/melodix/music/NativeUiMetrics.smali','utf8');
 assert.match(m,/settingsCardRadius\([\s\S]*?"mel_settings_card_radius"[\s\S]*?const\/16 v1, 0x10[\s\S]*?->metric/);
 const r=fs.readFileSync('smali/com/melodix/music/NativeSettingsRowFactory.smali','utf8');
 const card=fs.readFileSync('res/drawable/native_settings_card.xml','utf8');
 assert.match(r,/"native_settings_card"[\s\S]*?applyDrawableBackground/);
 assert.equal((card.match(/@dimen\/mel_settings_card_radius/g)||[]).length,3,'both layers and mask share the density-aware radius');
 assert.match(card,/@android:id\/mask/);assert.match(card,/<ripple/);
 assert.match(r,/->settingsRowHeight/);assert.match(r,/NativeRowClickListener/);
});
