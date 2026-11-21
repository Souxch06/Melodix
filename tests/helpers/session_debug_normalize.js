'use strict';
// These historical comparisons remain byte-for-byte tests. Normalize only the
// reviewed debug additions, verifying exact snapshots before substitution.
// Revisions are full immutable commits: never substitute from the working tree.
const assert=require('node:assert/strict');
const cp=require('node:child_process');
const readAt=ref=>cp.execFileSync('git',['show',ref+':scripts/spotify_bridge.source.js'],{encoding:'utf8'});
const reviewed=readAt('d73c84cb2b1ce1007d16c4f2c1f91b6aabcd172b');
const before=readAt('89a02b1c88f8e4bf909f231da0b0eefd4343cdfe');
const tokenRefusalReviewed=readAt('44d7e7a4fb5d39557d20c7b1ef997213c17f5521');
const cookieReviewed=readAt('d6e7c5fffeb61d2c7bf064f6b9a420d2c69fac41');
const cookieBefore=readAt('0acafb25');
function block(source,start,end){
 const a=source.indexOf(start);assert.ok(a>=0,`missing ${start}`);
 const b=source.indexOf(end,a);assert.ok(b>a,`missing ${end}`);
 return source.slice(a,b);
}
function replaceOnce(source,current,previous,label){
 assert.equal(source.split(current).length,2,`${label}: exact reviewed block occurs once`);
 return source.replace(current,previous);
}
const tokenStart='    async function fetchWebPlayerToken(',tokenEnd='    function dropWebPlayerToken';
const tokenReviewed=block(reviewed,tokenStart,tokenEnd),tokenBefore=block(before,tokenStart,tokenEnd);
const debugStart='    // Debug-only, closed enums;',debugEnd='    function traceTokenEndpoint(';
const debugBlock=block(reviewed,debugStart,debugEnd);
// Preserve the earlier exact metadata/decoder comparison by substituting only
// the complete, immutable reviewed token-refusal debug addition.
const refusalStart='    // Closed metadata only;', refusalEnd='    async function decodeWebPlayerToken(';
const refusalCurrent=block(tokenRefusalReviewed,refusalStart,refusalEnd);
const refusalBefore=block(reviewed,refusalStart,refusalEnd);
const getterStart='    function readNativeSessionGeneration()',getterEnd='    function checkMediaLib(';
const getterReviewed=block(reviewed,getterStart,getterEnd),getterBefore=block(before,getterStart,getterEnd);
const libraryLine="                if (typeof traceDebugLibraryResponse === 'function') void traceDebugLibraryResponse(resp, trace.debugTokenOrigin);\n";
assert.equal(reviewed.split(libraryLine).length,2,'reviewed library hook occurs once');
assert.equal(before.includes(libraryLine),false,'library hook absent in historical reference');
exports.token=function(source){return replaceOnce(source,tokenReviewed,tokenBefore,'token provenance');};
// Normalize only the reviewed cookie-only fallback, preserving full historical
// comparisons of every other byte and failing if either reviewed block changes.
const cookieStart='        // Match the historical WebView flow:', cookieOldStart='        // Never turn a failed token request';
const cookieEnd='        while (hasMore &&';
const cookieCurrent=block(cookieReviewed,cookieStart,cookieEnd),cookieOld=block(cookieBefore,cookieOldStart,cookieEnd);
const pageStart='            // A token can expire while an earlier page';
const pageEnd="            const activeHash = getGqlHash('libraryV3'";
const pageCurrent=block(cookieReviewed,pageStart,pageEnd),pageOld=block(cookieBefore,pageStart,pageEnd);
exports.library=function(source){
 source=replaceOnce(source,cookieCurrent,cookieOld,'cookie-only request path');
 source=replaceOnce(source,pageCurrent,pageOld,'bearer pagination guard');
 return replaceOnce(source,libraryLine,'','library response diagnostic');
};
exports.full=function(source){
 source=replaceOnce(source,refusalCurrent,refusalBefore,'token refusal diagnostics');
 source=exports.token(source);
 source=replaceOnce(source,debugBlock,'','debug helpers');
 source=replaceOnce(source,getterReviewed,getterBefore,'getter diagnostics and origin guard');
 return exports.library(source);
};
