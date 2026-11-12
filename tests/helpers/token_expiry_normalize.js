'use strict';
// Preserve the historical byte-for-byte comparisons outside the reviewed token
// change. Pin BOTH changed blocks exactly before substituting the historical
// implementation. Any future modification in these blocks must be reviewed.
const assert=require('node:assert/strict');
const crypto=require('node:crypto');
const cp=require('node:child_process');
const digest=s=>crypto.createHash('sha256').update(s).digest('hex');
const segment=(s,a,b)=>{const x=s.indexOf(a),y=s.indexOf(b,x);assert.ok(x>=0&&y>x,'token block boundaries');return s.slice(x,y);};
module.exports=function normalizeTokenExpiry(source) {
 // Full sources additionally carry the bounded debug helpers and getter.
 source=source.includes('    // Debug-only, closed enums;')
   ? require('./session_debug_normalize').full(source)
   : require('./session_debug_normalize').token(source);
 const start='    async function fetchWebPlayerToken(',end='    function dropWebPlayerToken';
 const current=source.includes(end) ? segment(source,start,end) : source.slice(source.indexOf(start));
 assert.ok(current.startsWith(start),'token function present');
 assert.equal(digest(current),'23cfb9b0b2dfa429223034a7910912f2669ac9086b0c2f53ef20eb3f7ebad6ac','exact reviewed token transport and decoding use');
 const old=cp.execFileSync('git',['show','9e55740c:scripts/spotify_bridge.source.js'],{encoding:'utf8'});
 source=source.replace(current,segment(old,start,end));
 const marker='    // Decode only successful token responses.';
 if(source.includes(marker)) {
  const decoder=segment(source,marker,start);
  assert.equal(digest(decoder),'1cc4cfe3787a4f42564895c875b59323a51865abd5fee76a64afa004e3739fa3','exact reviewed token decoder');
  const meta=segment(source,'    // Closed metadata only;',marker);
  assert.equal(digest(meta),'6ec1ad87cb979d8be77661cba6727394cef9659bbabcd8a3b5e3cd5497218db9','exact reviewed closed response metadata');
  source=source.replace(meta,'');
  source=source.replace(decoder,'');
  const currentEnum='/^(ok|none|ko-network|ko-non-json|ko-invalid|ko-expired|ko-http[1-5][0-9]{2})$/';
  const oldEnum='/^(ok|none|ko-network|ko-http[1-5][0-9]{2})$/';
  assert.equal(source.split(currentEnum).length,2,'exact reviewed sanitized token enum');
  source=source.replace(currentEnum,oldEnum);
  // A manual retry now requires and coalesces a verified native generation.
  // Pin the entire reviewed hook, then compare all other bytes historically.
  const retryStart='    // Each native generation admits at most one manual retry';
  const retryEnd='    window.checkMediaLib = checkMediaLib;';
  const retry=segment(source,retryStart,retryEnd);
  assert.equal(digest(retry),'6aaeca44573b32f38334b1e94486e6c63015448121354b4a6d6a354e30d963ce','exact reviewed retry admission');
  source=source.replace(retry,segment(old,'    // Native retry queues behind an older attempt',retryEnd));
  const anchor='        const requestGeneration = mediaLibraryRequestGeneration;\n';
  assert.equal(source.split(anchor).length,2,'exact location of moved acknowledgement');
  source=source.replace(anchor,`        // Independent acknowledgement before queuing work: the detailed channel
        // may fail, but this attempt must still be visible with unknown observations.
        if (source === 'native-retry') acknowledgeSessionAttemptStart(diagnostic);
`+anchor);
 }
 return source;
};
