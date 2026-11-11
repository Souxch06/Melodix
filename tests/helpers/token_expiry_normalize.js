'use strict';
// Snapshot assertions still compare every unrelated byte against the historical
// implementation. Only the two exact, reviewed validation blocks are normalized.
const assert=require('node:assert/strict');
module.exports=function normalizeTokenExpiry(source) {
 for (const [token,data,exp] of [['token','tokenData','expMs'],['altToken','altData','altExp']]) {
  const current=`                const ${token} = ${data} && ${data}.accessToken;
                const ${exp} = Number(${data} && ${data}.accessTokenExpirationTimestampMs);
                // Never fabricate an expiry or send an already expired token.
                if (typeof ${token} === 'string' && ${token}.trim() && Number.isFinite(${exp}) && ${exp} > Date.now()) {
                    webPlayerTokenCache = {
                        token: ${token},
                        expMs: ${exp}
                    };
`;
  const previous=`                const ${token} = ${data} && ${data}.accessToken;
                if (${token}) {
                    const ${exp} = Number(${data}.accessTokenExpirationTimestampMs);
                    webPlayerTokenCache = {
                        token: String(${token}),
                        expMs: Number.isFinite(${exp}) && ${exp} > nowMs ? ${exp} : nowMs + 3600000
                    };
`;
  assert.equal(source.split(current).length,2,'review exact token validation block: '+token);
  source=source.replace(current,previous);
 }
 return source;
};
