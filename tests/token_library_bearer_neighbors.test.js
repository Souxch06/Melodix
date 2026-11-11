'use strict';
// Supplemental executions of unchanged legacy assertions under their now-required
// precondition: a synthetic player token. The original tests remain untouched
// and still report their historical, tokenless expectations honestly.
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const {test} = require('node:test');
const source = fs.readFileSync('tests/p0_library_fetch.test.js', 'utf8');
const positions = [...source.matchAll(/^test\('/gm)].map(m => m.index);
const expected = [
 'loading clears an earlier raw count', 'concurrent and forced checks',
 'the library paginates', 'HTTP refusals and server responses',
 'library request diagnostics', 'a 401 invalidates earlier proof',
 'a later-page 401', 'a 403 invalidates private library proof',
 'a later-page 403', 'a 429 honours', 'network failure, invalid JSON',
 'login navigation aborts', 'unknown DOM may verify',
 'a confirmed player UI', 'a valid empty library', 'unexpected JSON shape',
 'a successful API response', 'a transient network error',
 'partial real data', 'parseLibrary handles', 'a stalled request',
 'a stalled response body', 'concurrent checkMediaLib calls',
 'MEL-BUG-036: with a web-player token'
];
let header = source.slice(0, positions[0]);
const old = 'tokenResponse = null, tokenStatus = 404';
if (!header.includes(old)) throw new Error('fixture setup changed: review before replay');
header = header.replace(old, "tokenResponse = { accessToken: 'SYNTHETIC_NEIGHBOR_TOKEN', accessTokenExpirationTimestampMs: Date.now()+3600000 }, tokenStatus = 404");
const chunks = positions.map((p,i) => source.slice(p, positions[i+1] || source.length));
const selected = expected.map(prefix => {
 const matches = chunks.filter(x => x.startsWith("test('" + prefix));
 if (matches.length !== 1) throw new Error('legacy assertion missing/ambiguous: ' + prefix);
 return matches[0];
});
const nodeRequire = name => name === 'node:test' ? ((name, fn) => test('[bearer fixture] ' + name, fn)) : require(name);
const context = {require:nodeRequire, __dirname:path.resolve('tests'), console, setTimeout, clearTimeout, AbortController};
vm.createContext(context);
vm.runInContext(header + '\n' + selected.join('\n'), context, {filename:'legacy-library-with-bearer.fixture.js'});
