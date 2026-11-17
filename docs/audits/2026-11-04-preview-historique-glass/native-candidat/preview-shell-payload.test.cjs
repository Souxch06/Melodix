'use strict';
// Checks the actual decoded Preview asset and the build-only formatter.
// This is not a WebView performance or device test.
const test=require('node:test'), assert=require('node:assert/strict');
const fs=require('node:fs'), os=require('node:os'), path=require('node:path'), vm=require('node:vm'), cp=require('node:child_process');
const root=process.env.MELODIX_CANDIDATE_ROOT;
if(!root) throw Error('MELODIX_CANDIDATE_ROOT required');
const formatter=path.join(__dirname,'minify-preview-shell.cjs');
test('the decoded Preview shell is parseable and below the existing historical injection ceiling',()=>{
 const code=fs.readFileSync(path.join(root,'assets/native_ui_shell.js'),'utf8');
 assert.ok(Buffer.byteLength(code)<108867);assert.doesNotThrow(()=>new vm.Script(code));
 for(const marker of ['__sfOpenCollection','__sfLoadBundledBridge','__sfPreviewBridgeCopyAvoided','__sfTogglePlayback']) assert.ok(code.includes(marker));
});
test('formatter retains code and names without compressing and is idempotent',()=>{
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'melodix-format-test-'));try{
  const assets=path.join(dir,'assets');fs.mkdirSync(assets);const file=path.join(assets,'native_ui_shell.js');
  fs.writeFileSync(file,'/* comment */ function visibleName(x) { var localValue = x + 0; return localValue; }\n');
  cp.execFileSync(process.execPath,[formatter,file]);const first=fs.readFileSync(file,'utf8');
  assert.ok(first.includes('visibleName'));assert.ok(first.includes('localValue'));assert.match(first,/x\+0/);assert.ok(!first.includes('comment'));
  cp.execFileSync(process.execPath,[formatter,file]);assert.equal(fs.readFileSync(file,'utf8'),first);
 }finally{fs.rmSync(dir,{recursive:true,force:true})}
});
test('formatter rejects oversized output without modifying its input',()=>{
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'melodix-format-large-'));try{
  const assets=path.join(dir,'assets');fs.mkdirSync(assets);const file=path.join(assets,'native_ui_shell.js');
  const source='var oversizedName="'+ 'x'.repeat(110000) +'";';fs.writeFileSync(file,source);
  assert.throws(()=>cp.execFileSync(process.execPath,[formatter,file],{stdio:'ignore'}));assert.equal(fs.readFileSync(file,'utf8'),source);
 }finally{fs.rmSync(dir,{recursive:true,force:true})}
});
