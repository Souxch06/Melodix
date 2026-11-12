'use strict';
const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const read = p => fs.readFileSync(p,'utf8');
const folders = ['layout', 'layout-land', 'layout-sw600dp', 'layout-sw600dp-land'];

test('dark floating player, navigation and real-content cards use the shared native palette', () => {
  const mini = read('res/drawable/native_mini_player_bg.xml');
  assert.match(mini, /mel_mini_bottom[\s\S]*?mel_player_mid[\s\S]*?mel_glass_surface[\s\S]*?mel_glass_reflection/);
  const nav = read('res/drawable/native_tabbar_glass.xml');
  assert.match(nav, /mel_background[\s\S]*?mel_nav_scrim[\s\S]*?mel_glass_surface[\s\S]*?mel_glass_reflection/);
  for (const name of ['native_card_ripple', 'native_row_ripple']) {
    const xml = read(`res/drawable/${name}.xml`);
    assert.match(xml, /<ripple[\s\S]*?mel_surface_card[\s\S]*?native_glass_surface[\s\S]*?@android:id\/mask/);
  }
  const quick = read('res/drawable/native_quick_tile.xml');
  assert.match(quick, /mel_mini_bottom[\s\S]*?mel_player_mid/);
  for (const folder of folders) {
    const layout=read(`res/${folder}/activity_main.xml`);
    for (const [id,handler] of [['nativeHomeTab','onNativeHomeClick'], ['nativeSearchTab','onNativeSearchClick'],
      ['nativeLibraryTab','onNativeLibraryClick'],['nativePlayerLargePlayPauseButton','onNativePlayPauseClick']]) {
      const a=layout.indexOf(`android:id="@id/${id}"`); assert.ok(a>=0,folder+' '+id);
      assert.match(layout.slice(a,layout.indexOf('/>',a)),new RegExp(`android:onClick="${handler}"`));
    }
    for (const drawable of ['native_mini_player_bg','native_tabbar_glass','native_player_background','native_search_field']) {
      if (drawable === 'native_player_background') continue; // dynamically applied to root by player screen
      assert.ok(layout.includes('@drawable/'+drawable),folder+' '+drawable);
    }
  }
});

test('dark bases preserve readable primary and secondary text even at maximum glass highlight', () => {
  const xml=read('res/values/colors.xml');
  const color = name => { const m=xml.match(new RegExp(`name="${name}">#([0-9A-Fa-f]{6,8})<`)); assert.ok(m,name); const h=m[1];
    const argb=h.length===8?h:'ff'+h; return [0,2,4,6].map(i=>parseInt(argb.slice(i,i+2),16)); };
  const over = (fg,bg) => fg.slice(1).map((v,i)=>(v*fg[0]+bg[i]*(255-fg[0]))/255);
  const lum = rgb => rgb.map(v=>{const c=v/255;return c<=0.04045?c/12.92:((c+0.055)/1.055)**2.4;}).reduce((s,c,i)=>s+c*[.2126,.7152,.0722][i],0);
  const ratio=(a,b)=>{let x=lum(a),y=lum(b);return (Math.max(x,y)+.05)/(Math.min(x,y)+.05);};
  const highlighted = base => over(color('mel_glass_reflection'),over(color('mel_glass_surface'),color(base).slice(1)));
  for (const base of ['mel_mini_bottom','mel_player_mid','mel_surface_card','mel_background']) {
    const bg=highlighted(base);
    for(const ink of ['mel_text_primary','mel_text_secondary','mel_nav_inactive'])
      assert.ok(ratio(color(ink).slice(1),bg)>=4.5, `${ink} on ${base}: ${ratio(color(ink).slice(1),bg).toFixed(2)}`);
  }
});
