#!/usr/bin/env python3
"""Start a native Home library fetch as soon as its bridge is ready."""
from pathlib import Path
import hashlib,sys
SHELL='assets/native_ui_shell.js';BRIDGE='assets/spotify_bridge.js'
SHA={SHELL:'b43ceaa1b99470e6c2d7dfe8fc435ff4ce3978e9b5aa0ea78d3c4e7bff6584ea',BRIDGE:'ab62ab6e1a67c992854383fd36a0e655b9feb54ee8673e2d09e9558eefe7b805'}
def change(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:100]))
 return s.replace(a,b,1)
def prepare(root):
 data={}
 for name,sha in SHA.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected base: '+name)
  data[name]=raw.decode('utf8')
 s=data[BRIDGE]
 s=change(s,'''                    if (window.spHashes[opName] !== hash) {
                        window.spHashes[opName] = hash;''','''                    if (window.spHashes[opName] !== hash) {
                        const previousHash = getGqlHash(opName, opName === 'libraryV3'
                            ? '0082bf82412db50128add72dbdb73e2961d59100b9cbf41fb25c568bd8bc358b' : '');
                        window.spHashes[opName] = hash;''')
 s=change(s,'''                        if (opName === 'libraryV3' || opName === 'fetchLibraryTracks') {
                            typeof checkMediaLib === 'function' && checkMediaLib(true);
                        }''','''                        // A Liked Songs hash is unrelated to the library query.
                        // Do not discard an in-flight first page when the captured
                        // library hash is already the one being used.
                        if (opName === 'libraryV3' && previousHash !== hash) {
                            typeof checkMediaLib === 'function' && checkMediaLib(true);
                        }''')
 s=change(s,'''    window.checkMediaLib = checkMediaLib;

    async function fetchAllLibrary''','''    window.checkMediaLib = checkMediaLib;
    // Native Home can start the request without waiting for another DOM
    // mutation or the shell retry. Never fabricate data or persist snapshots.
    // A missing token is handled by the existing token interception path.
    if (window.__sfNativeUiShellReady && window.location.hostname === 'open.spotify.com' &&
        /^\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?(?:home\\/?)?$/i.test(window.location.pathname || '/') &&
        typeof window.spotAuthToken === 'string' && window.spotAuthToken.indexOf('Bearer ') === 0) {
        checkMediaLib();
    }

    async function fetchAllLibrary''')
 data[BRIDGE]=s
 return data
if __name__=='__main__':
 root=Path(sys.argv[1]);out=prepare(root)
 for name,content in out.items():(root/name).write_text(content,encoding='utf8')
 print('Applied fast cold Home candidate:',root)
