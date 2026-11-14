'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const {spawnSync} = require('node:child_process');
const fs = require('node:fs');

test('production shell acceptance rejects demo, hidden controls and tab text as route proof', () => {
  const python = String.raw`
import sys, xml.etree.ElementTree as ET
sys.path.insert(0, 'scripts')
import acceptance_production_shell as a
P=a.PACKAGE

def node(name, **attrs):
    d={'resource-id':P+':id/'+name, 'package':P, 'enabled':'true', 'bounds':'[0,0][20,20]', **attrs}
    return ET.Element('node', d)
root=node('nativeRoot')
for name in ('nativeHomeTab','nativeSearchTab','nativeLibraryTab'):
    root.append(node(name, clickable='true', text='Bibliothèque' if name=='nativeLibraryTab' else ''))
title=node('nativeScreenTitle', text='Accueil');root.append(title)
tree=ET.Element('hierarchy');tree.append(root)
assert a.production_root(tree) is root
assert a.screen_title(tree,'Accueil')
assert not a.screen_title(tree,'Bibliothèque') # tab label is not screen title
badge=node('other', text=a.DEMO_BADGE);root.append(badge)
assert a.production_root(tree) is None
root.remove(badge)
root[1].set('clickable','false');assert a.production_root(tree) is None
root[1].set('clickable','true');root[1].set('bounds','[0,0][0,0]');assert a.production_root(tree) is None
root[1].set('bounds','[0,0][20,20]');root[1].set('package','other');assert a.production_root(tree) is None
root[1].set('package',P); title.set('text','Votre bibliothèque')
assert a.screen_title(tree,'Votre bibliothèque')
assert not a.connection_state(tree)
root.append(node('state',text='Connexion Spotify nécessaire'))
assert a.connection_state(tree)
assert a.bounds(node('bad',bounds='junk')) is None
`;
  const r=spawnSync('python3',['-c',python],{encoding:'utf8'});
  assert.equal(r.status,0,r.stderr);
});

test('strict baseline uses exact APK, three sizes, offline MainActivity and never passes a demo or pending Spotify', () => {
  const w=fs.readFileSync('.github/workflows/test162-production-baseline.yml','utf8');
  const s=fs.readFileSync('scripts/acceptance_production_shell.py','utf8');
  assert.match(w,/profile: \[small, phone, tablet\]/);
  assert.match(w,/43168233767/);assert.match(w,/7d3288bca24b8316aa80316d5f9a606fbd850c4d3c058cc7c7477a26227623aa/);
  assert.doesNotMatch(w,/continue-on-error:\s*true/);
  assert.match(s,/foreground_main\(\)/);assert.match(s,/has_demo\(tree\)/);
  assert.match(s,/spotify_real_session': 'PENDING'/);
  assert.match(s,/raise RuntimeError\(name \+ ' not observed/);
  assert.doesNotMatch(s,/setCookie|removeAllCookies|setBlockNetworkLoads|inject|Essayer le mode démo/);
});
