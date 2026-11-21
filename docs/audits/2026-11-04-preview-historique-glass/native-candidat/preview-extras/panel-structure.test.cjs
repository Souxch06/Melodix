'use strict';
const {test}=require('node:test'), assert=require('node:assert/strict'), fs=require('fs'),path=require('path'),{JSDOM}=require('jsdom');
const script=fs.readFileSync(path.join(__dirname,'panel-structure.js'),'utf8');
function run(html,kind){const d=new JSDOM(html,{url:'https://open.spotify.com/',runScripts:'outside-only'});try{return JSON.parse(d.window.eval(script)(kind))}finally{d.window.close()}}
test('panel probe reports only bounded structural counts without content or identifiers',()=>{const x=run('<div data-testid="queue-page"><div role="listitem" data-testid="secret-track">A private track</div><button aria-label="Account Alice">hello</button></div>','queue');assert.equal(x.reason,'observed');assert.equal(x.roots,1);assert.equal(x.rows,1);assert.equal(x.buttons,1);assert.ok(!JSON.stringify(x).includes('private'));assert.ok(!JSON.stringify(x).includes('secret'));assert.ok(!JSON.stringify(x).includes('Alice'))});
test('absent panels and unknown kinds do not invent content',()=>{assert.equal(run('<div></div>','lyrics').reason,'absent');assert.equal(run('<div></div>','devices').roots,0);assert.equal(run('<div></div>','private').reason,'kind')});
test('probe is passive and does not use session data or the network',()=>{for(const s of ['.click(', 'fetch(', 'XMLHttpRequest','cookie','localStorage','sessionStorage','api.spotify.com','textContent','innerText','setVisibility'])assert.ok(!script.includes(s),s)});


test('device trigger counts as a control, not as an open panel',()=>{const x=run('<button data-testid="connect-device-picker" aria-label="Secret speaker"></button>','devices');assert.equal(x.controls,1);assert.equal(x.roots,0);assert.ok(!JSON.stringify(x).includes('Secret'))});
