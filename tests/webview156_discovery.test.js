'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('Chromium snapshot discovery is metadata only and isolated from the session-gate run',()=>{
 const w=fs.readFileSync('.github/workflows/test-preview-emulator.yml','utf8'),s=fs.readFileSync('scripts/explore_webview156.sh','utf8');
 assert.match(w,/session_gate_only == true && !contains/);assert.match(w,/webview-discovery.*webview-inspect/);
 assert.match(s,/storage\.googleapis\.com\/storage\/v1/);assert.match(s,/AndroidDesktop_x64\/1706000/);assert.doesNotMatch(s,/adb install|actions\/upload-artifact/);assert.match(s,/unzip -p/);assert.match(s,/sha256sum/);
});

test('modern fixture pins both hashes and cannot silently fall back to another provider',()=>{
 const w=fs.readFileSync('.github/workflows/test-session-gate.yml','utf8'),s=fs.readFileSync('scripts/webview156_emulator.sh','utf8');
 assert.match(w,/bridge-navigation-webview156:[\s\S]*?4b88c258aedd5158df224e2e52a3e59911126110a0fb75c6d28e587789c39cc7[\s\S]*?7fb34cbe3f9bf69ed24866144b0279944a0fb13136a756b68f2afee79dfe007b[\s\S]*?api-level: 34/);
 assert.match(s,/getprop ro.build.type/);assert.match(s,/set-webview-implementation/);assert.match(s,/check_provider[\s\S]*?bridge_navigation_emulator.sh[\s\S]*?check_provider/);assert.match(s,/\[\[ "\$major" == 156 \]\]/);
 assert.doesNotMatch(s,/pm clear|uninstall|open\.spotify\.com|sp_dc/);
});
