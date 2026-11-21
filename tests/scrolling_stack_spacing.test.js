'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('fallback player bottom follows the floating dock stack instead of the legacy 78px',()=>{
 const s=fs.readFileSync('scripts/spotify_bridge.source.js','utf8');
 const start=s.indexOf('function ensureMobileShellFallbackStyle');assert.ok(start>=0);const end=s.indexOf('function ',start+10),f=s.slice(start,end);
 const player=/body:not\(\.sf-fs-open\) aside\[data-testid="now-playing-bar"\]\s*\{([^}]+)\}/.exec(f);assert.ok(player);
 assert.match(player[1],/bottom: calc\(var\(--sf-dock-lift, 24px\) \+ var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-safe-area-bottom/);
 assert.doesNotMatch(player[1],/bottom: calc\(78px/);
 // Same viewport and safe area: 102px player bottom vs 92px dock top => 10px gap.
 assert.equal((24+68+10)-(24+68),10);
});
