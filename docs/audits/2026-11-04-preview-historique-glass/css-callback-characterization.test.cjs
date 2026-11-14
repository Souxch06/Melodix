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

// Execute the unmodified scrape asset in a local DOM; WebView serialization is
// represented by JSON.stringify, not an Android WebView execution.
const {JSDOM}=require('jsdom');
const scrape=fs.readFileSync(path.join(root,'assets/native_home_scrape.js'),'utf8');
function withScrape(html,setup,check){
    const dom=new JSDOM(html,{url:'https://open.spotify.com/',runScripts:'outside-only'});
    try {if(setup) setup(dom.window); check(JSON.parse(JSON.stringify(dom.window.eval(scrape))));}
    finally {dom.window.close();}
}
test('actual scrape asset collects a fictional DOM link, then the native null guard rejects its serialized result',()=>{
    withScrape('<a href="/playlist/fake1" aria-label=" Playlist fictive "><img src="https://example.invalid/fake.jpg"></a>',null,rows=>{
        assert.deepEqual(rows,[{title:'Playlist fictive',uri:'https://open.spotify.com/playlist/fake1',image:'https://example.invalid/fake.jpg',section:''}]);
        assert.equal(passesNullGuard(JSON.stringify(rows)),false);
    });
});
test('scrape cached rows take precedence over current DOM and mediaLib',()=>{
    withScrape('<a href="/playlist/new">New</a>',w=>{
        w.__sfNativeHomeRowsJson=JSON.stringify([{title:'Cached',uri:'spotify:playlist:old'}]);
        w.mediaLib={playlists:[{name:'From library',uri:'spotify:playlist:lib'}]};
    },rows=>assert.deepEqual(rows,[{title:'Cached',uri:'spotify:playlist:old'}]));
});
test('scrape invalid cached JSON returns empty instead of inspecting existing DOM',()=>{
    withScrape('<a href="/playlist/fake1">Fictive</a>',w=>{w.__sfNativeHomeRowsJson='[broken';},rows=>assert.deepEqual(rows,[]));
});
test('scrape limits DOM rows to 40 but adds all distinct in-memory library rows afterward',()=>{
    const html=Array.from({length:45},(_,i)=>`<a href="/playlist/dom${i}">DOM ${i}</a>`).join('');
    withScrape(html,w=>{w.mediaLib={playlists:Array.from({length:5},(_,i)=>({name:`Lib ${i}`,uri:`spotify:playlist:lib${i}`}))};},rows=>{
        assert.equal(rows.length,45);
        assert.equal(rows.filter(r=>r.section==='').length,40);
        assert.equal(rows.filter(r=>r.section==='Vos playlists').length,5);
        assert.ok(!rows.some(r=>r.uri.endsWith('/dom40')));
    });
});
test('scrape deduplicates exact URIs but not Web URL and Spotify URI representations',()=>{
    withScrape('<a href="/playlist/fake1">A</a><a href="/playlist/fake1">Duplicate</a>',w=>{
        w.mediaLib={playlists:[{name:'Same underlying ID',uri:'spotify:playlist:fake1'}]};
    },rows=>{
        assert.deepEqual(rows.map(r=>r.uri),['https://open.spotify.com/playlist/fake1','spotify:playlist:fake1']);
    });
});
