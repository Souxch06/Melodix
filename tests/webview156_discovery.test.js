'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('Chromium snapshot discovery is metadata only and isolated from the session-gate run',()=>{
 const w=fs.readFileSync('.github/workflows/test-preview-emulator.yml','utf8'),s=fs.readFileSync('scripts/explore_webview156.sh','utf8');
 assert.match(w,/session_gate_only == true && inputs.source_ref != 'webview-discovery'/);assert.match(w,/session_gate_only == true && inputs.source_ref == 'webview-discovery'/);
 assert.match(s,/storage\.googleapis\.com\/storage\/v1/);assert.match(s,/AndroidDesktop_x64\/1706000/);assert.doesNotMatch(s,/adb install|unzip|actions\/upload-artifact|\.apk\b/);
});
