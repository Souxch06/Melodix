'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
test('player and mini-player radii follow the design tokens on phone and tablet',()=>{
 for(const [cfg,player,mini,container] of [[PHONE,36,12,16],[TABLET,36,14,18]]){
  const d=loadDimens(cfg);
  assert.equal(resolveSize('@dimen/mel_player_art_radius',d),player);
  assert.equal(resolveSize('@dimen/mel_mini_art_radius',d),mini);
  assert.equal(resolveSize('@dimen/mel_mini_container_radius',d),container);
  for(const control of ['mel_player_side_control','mel_player_control','mel_player_play','mel_mini_play']) assert.ok(resolveSize('@dimen/'+control,d)>=44,control);
 }
 const bg=fs.readFileSync('res/drawable/native_mini_player_bg.xml','utf8');
 assert.match(bg,/@dimen\/mel_mini_container_radius/);assert.doesNotMatch(bg,/blur|RenderEffect/);
});
test('player control handlers and artwork tokens remain wired on all layouts',()=>{
 for(const variant of ['layout','layout-land','layout-sw600dp','layout-sw600dp-land']){
  const s=fs.readFileSync(`res/${variant}/activity_main.xml`,'utf8');
  for(const handler of ['onNativePlayerShuffleClick','onNativePlayerPreviousClick','onNativePlayPauseClick','onNativePlayerNextClick','onNativePlayerRepeatClick']) assert.ok(s.includes(handler),variant+' '+handler);
  assert.ok(s.includes('@dimen/mel_player_art_radius'));assert.ok(s.includes('@dimen/mel_mini_art_radius'));
 }
});
