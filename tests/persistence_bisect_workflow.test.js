'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('optional bisect changes only the after APK source while fixture and before APK stay fixed',()=>{
 const w=fs.readFileSync('.github/workflows/test-preview-emulator.yml','utf8'),s=fs.readFileSync('.github/workflows/test-session-gate.yml','utf8');
 assert.match(w,/update_after_ref:[\s\S]*?default: ""/);assert.match(w,/update_after_ref: \${{ inputs.update_after_ref \|\| inputs.source_ref \|\| github.sha }}/);
 const a=s.slice(s.indexOf('  update-before:'),s.indexOf('  update-persistence:'));
 assert.match(a,/update-before:[\s\S]*?source_ref: c6d598d507c970bfab82837e35378e4319cb3d62/);
 assert.match(a,/update-after:[\s\S]*?source_ref: \${{ inputs.update_after_ref \|\| inputs.source_ref }}/);
 const p=s.slice(s.indexOf('  update-persistence:'));assert.match(p,/ref: \${{ inputs.source_ref }}/);assert.match(p,/update_persistence_emulator\.sh/);
});
