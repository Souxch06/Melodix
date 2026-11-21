'use strict';
// Deliberately failing diagnostic outside npm's passing-suite count. It loads
// the existing bridge IIFE via the established synthetic VM harness. No real
// Spotify account, network response, or production UI is claimed.
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const source = fs.readFileSync('tests/p0_library_fetch.test.js', 'utf8');
const stop = source.indexOf('// One libraryV3 item');
if (stop < 0) throw new Error('bridge fixture boundary missing');
const ctx = {require, __dirname:path.resolve('tests'), console, setTimeout, clearTimeout, AbortController, URL};
vm.runInNewContext(source.slice(0, stop)+'\nglobalThis.fixture=loadBridge;',ctx);
const w = ctx.fixture();
w.__sfSearchCache.set('synthetic query', [{title:'SYNTHETIC OLD SEARCH'}]);
w.__sfMediaItemsCache.set('synthetic id', [{title:'SYNTHETIC OLD MEDIA'}]);
w.__sfCurrentContextUri='synthetic-old-context';
w.__sfCurrentTrackUris=['synthetic-old-track'];
w.__sfPlayerPayload={track:'SYNTHETIC OLD PLAYER'};
w.__testSetAuthSignals({pathname:'/login'});
if (w.__sfGetSpotifyAuthUiState() !== 'required') throw new Error('fixture login route was not recognized');
const retained = [
  ['search cache',w.__sfSearchCache.size], ['media cache',w.__sfMediaItemsCache.size],
  ['context',w.__sfCurrentContextUri], ['track ids',w.__sfCurrentTrackUris.length], ['player',w.__sfPlayerPayload]
].filter(([,value])=>Boolean(value)).map(([name])=>name);
if (retained.length) {
  console.error('FAIL: recognized login route retained synthetic private stores: '+retained.join(', '));
  process.exitCode=1;
} else console.log('PASS: login invalidated the synthetic WebView stores');
