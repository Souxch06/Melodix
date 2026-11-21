'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const read=p=>fs.readFileSync(p,'utf8');
const section=(text,a,b)=>{const i=text.indexOf(a),j=text.indexOf(b,i+1);assert.ok(i>=0&&j>i);return text.slice(i,j);};
test('settings header indicates current screen on each layout and clears on other routes',()=>{
 const main=read('smali/com/melodix/music/MainActivity.smali');
 assert.match(main,/:screen_done[\s\S]*?0x7f090250[\s\S]*?"settings"[\s\S]*?equals\(Ljava\/lang\/Object;\)Z[\s\S]*?setSelected\(Z\)V/);
 for(const name of ['layout','layout-land','layout-sw600dp','layout-sw600dp-land']) {
  const xml=read(`res/${name}/activity_main.xml`),block=section(xml,'android:id="@id/nativeSettingsButton"','/>');
  assert.match(block,/android:background="@drawable\/native_settings_selected"/);
 }
 const selector=read('res/drawable/native_settings_selected.xml');assert.match(selector,/state_selected="true"/);assert.match(selector,/native_icon_glass/);
});
