'use strict';
// Build-only formatting: same pinned parser/printer as the production assets,
// no compression, no identifier mangling. Spotify bridge is never modified.
const fs=require('node:fs');
const {minify}=require('terser');
if(require('terser/package.json').version!=='5.51.2') throw Error('unexpected Terser version');
const path=process.argv[2];
if(!path || !path.endsWith('/assets/native_ui_shell.js')) throw Error('expected Preview shell asset');
(async()=>{
 const source=fs.readFileSync(path,'utf8');
 const options={compress:false,mangle:false,format:{comments:false}};
 const first=await minify(source,options);
 if(!first.code) throw Error('empty Preview shell');
 const roundtrip=await minify(first.code,options);
 if(roundtrip.code!==first.code) throw Error('shell parse/print is not stable');
 const result=first.code+'\n', bytes=Buffer.byteLength(result);
 // This is the existing historical single-evaluation ceiling, not a claim
 // about an Android/WebView hard limit. Never increase it to fit output.
 if(bytes>=108867) throw Error('Preview shell exceeds historical injection ceiling: '+bytes);
 fs.writeFileSync(path,result,'utf8');
 console.log(`Preview shell formatted: ${Buffer.byteLength(source)} -> ${bytes} bytes (no compress, no mangle)`);
})().catch(e=>{console.error(e.message);process.exitCode=1});
