'use strict';
// The sole intentional change to the request function: fail closed if token is
// absent. Historical snapshot invariants still compare every other byte.
const assert=require('node:assert/strict');
const guard=`        // Never turn a failed token request into a library 401 or session-expiry
        // claim. A stale attempt must not clear a newer session's state either.
        if (requestGeneration !== mediaLibraryRequestGeneration ||
            authEpoch !== boundedMediaLibraryCount(window.__sfSpotifyAuthEpoch, 999999)) return [];
        if (!bearerToken) {
            trace.phase = 'request';
            trace.error = 'token-missing';
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
module.exports=function normalizeTokenGuard(source) {
 assert.equal(source.split(guard).length,2,'reviewed fail-closed guard must occur exactly once');
 return source.replace(guard,'');
};
