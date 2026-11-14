'use strict';
const test=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const crypto=require('node:crypto');
const cssom=require('rrweb-cssom');
const root=process.env.MELODIX_HISTORICAL_ROOT;
if(!root) throw new Error('Set MELODIX_HISTORICAL_ROOT');
const smaliRoot=process.env.MELODIX_SMALI_ROOT||root;
const css=fs.readFileSync(path.join(root,'assets/css_hacks.css'),'utf8');
function allRules(rules){return Array.from(rules).flatMap(rule=>[rule,...(rule.cssRules?allRules(rule.cssRules):[])]);}

test('Glass CSS bytes match published full stylesheet',()=>{
    assert.equal(crypto.createHash('sha256').update(css).digest('hex'),'0d1ab6aa71f6978c5b5e1268566306d2811dfcf30c83831027293d36c38ab2f3');
    assert.equal(css,fs.readFileSync(path.join(__dirname,'css_hacks_glass_complet.css'),'utf8'));
});
test('rrweb-cssom parses Glass stylesheet and retains representative rules',()=>{
    const rules=allRules(cssom.parse(css).cssRules);
    assert.ok(rules.length>300);
    assert.ok(rules.some(r=>r.selectorText?.includes('body.sf-melodix-home-active #main-view') && r.style.getPropertyValue('display')==='none' && r.style.getPropertyPriority('display')==='important'));
    assert.ok(rules.some(r=>r.selectorText?.includes('body.sf-melodix-home-active #sf-melodix-home') && r.style.getPropertyValue('display')==='flex'));
    assert.ok(rules.some(r=>r.selectorText==='#sf-mobile-nav' && r.style.getPropertyValue('display')==='grid'));
});

// Interpret only the first literal-null guard, NOT Android JSONTokener or WebView.
const callback=fs.readFileSync(path.join(smaliRoot,'smali/com/melodix/music/NativeHomeJsonCallback.smali'),'utf8');
function passesNullGuard(value){
    const match=callback.match(/const-string (v\d+), "null"\s+invoke-virtual \{\1, (v\d+)\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z\s+move-result (v\d+)\s+if-(eqz|nez) \3, :([\w]+)/);
    assert.ok(match,'literal-null comparison and branch must be present');
    assert.match(callback,new RegExp(':' + match[5] + '(?:\\s+:[\\w]+)*\\s+return-void'), 'branch must exit callback');
    const equals=value==='null';
    return match[4]==='eqz'?equals:!equals;
}
test('Home scrape callback: non-null JSON array is rejected by literal-null guard',()=>{
    assert.equal(passesNullGuard('[{"title":"Fictive"}]'),false);
    assert.equal(passesNullGuard(JSON.stringify('[{"title":"Fictive"}]')),false);
});
test('Home scrape callback: literal null alone passes the first guard',()=>{
    assert.equal(passesNullGuard('null'),true);
    // This only reaches JSONTokener; it does not assert anything about its result.
});
