'use strict';
const assert=require('node:assert/strict');
const exact=`            // A token can expire while an earlier page is being read. Do not
            // send it on a later page or retain partial private proof.
            if (!webPlayerTokenCache || webPlayerTokenCache.token !== bearerToken ||
                !Number.isFinite(webPlayerTokenCache.expMs) || webPlayerTokenCache.expMs <= Date.now()) {
                trace.phase = 'request';
                trace.http = 0;
                trace.mime = 'missing';
                trace.error = 'token-missing';
                trace.bearer = false;
                observeSessionAttempt(trace, 'tokenResult', 'unknown');
                window.__sfMediaLibError = 'token-missing';
                window.__sfMediaLibSessionProofKnown = false;
                window.__sfMediaLibSessionProven = false;
                window.__sfMediaLibRawItemCount = 0;
                window.__sfMediaLibUpdatedAt = 0;
                window.__sfMediaLibProofAuthEpoch = 0;
                window.mediaLib = null;
                return [];
            }
`;
module.exports=function normalizePageExpiry(source){
 assert.equal(source.split(exact).length,2,'review exact pagination expiry guard');
 return source.replace(exact,'');
};
