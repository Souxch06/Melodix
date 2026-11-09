'use strict';
const {test}=require('node:test'),assert=require('node:assert/strict'),fs=require('node:fs');
test('Chromium snapshot discovery never downloads, installs, executes or publishes an APK',()=>{
 const w=fs.readFileSync('.github/workflows/explore-webview156.yml','utf8');
 assert.match(w,/workflow_dispatch/);assert.match(w,/storage\.googleapis\.com\/storage\/v1/);assert.match(w,/AndroidDesktop_x64\/1706000/);assert.doesNotMatch(w,/adb install|unzip|actions\/upload-artifact|\.apk\b/);
});
