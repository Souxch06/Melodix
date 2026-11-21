'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
const {loadDimens,resolveSize,PHONE,TABLET}=require('./helpers/mel_dimens');
const css=fs.readFileSync('assets/css_hacks.css','utf8');
function rule(selector){const a=css.indexOf(selector+' {');assert.ok(a>=0,selector);return css.slice(a,css.indexOf('}',a)+1);}
test('home cards use the shared dark palette and artwork radius without scroll-surface blur',()=>{
 const card=rule('#sf-melodix-home .sf-melodix-home__card'),art=rule('#sf-melodix-home .sf-melodix-home__artwork');
 for(const r of [card,art]){assert.match(r,/border-radius: var\(--mel-radius-art\)/);assert.doesNotMatch(r,/backdrop-filter|filter:.*blur/);}
 assert.match(art,/object-fit: cover/);assert.match(art,/background: var\(--mel-surface-dark-2\)/);
 assert.match(card,/min-height: 44px/);assert.match(card,/scroll-snap-align: start/);
});
test('home typographic hierarchy remains readable and reduced motion removes active scaling',()=>{
 assert.match(rule('#sf-melodix-home .sf-melodix-home__title'),/700 14px\/1\.3/);
 assert.match(rule('#sf-melodix-home .sf-melodix-home__subtitle'),/450 12px\/1\.35/);
 const reduced=css.slice(css.indexOf('@media (prefers-reduced-motion: reduce) {',css.indexOf('#sf-melodix-home .sf-melodix-home__status')));
 assert.match(reduced,/\.sf-melodix-home__card:active\s*\{\s*transform: none/);
});
test('native home artwork radius is tokenised and matches its phone fallback',()=>{
 const phone=loadDimens(PHONE),tablet=loadDimens(TABLET);
 assert.equal(resolveSize('@dimen/mel_shelf_radius',phone),16);assert.equal(resolveSize('@dimen/mel_shelf_radius',tablet),18);
 const s=fs.readFileSync('smali/com/melodix/music/NativeUiMetrics.smali','utf8');const a=s.indexOf('.method public static shelfRadius('),b=s.indexOf('.end method',a);
 assert.match(s.slice(a,b),/"mel_shelf_radius"[\s\S]*?const\/16 v1, 0x10/);
});
