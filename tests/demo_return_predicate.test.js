'use strict';
const test = require('node:test'), assert = require('node:assert/strict');
const cp = require('node:child_process');

test('real returned surface predicate recognizes leaf XML nodes without accepting missing surfaces', () => {
 const py = String.raw`
import ast, pathlib, xml.etree.ElementTree as ET
p=pathlib.Path('scripts/capture_launcher_acceptance.py')
tree=ast.parse(p.read_text())
functions=[x for x in tree.body if isinstance(x,ast.FunctionDef) and x.name in ('find_id','real_surface')]
assert {x.name for x in functions}=={'find_id','real_surface'}
import sys; sys.path.insert(0,'scripts')
from launcher_surface import demo_visible, login_surface
ns={'login_surface':login_surface,'demo_visible':demo_visible};exec(compile(ast.Module(body=functions,type_ignores=[]),str(p),'exec'),ns)
node=lambda ident:ET.fromstring('<node resource-id="com.melodix.music.preview:id/'+ident+'"/>')
session=node('sessionTitle'); settings=node('nativeSettingsButton'); unrelated=node('other')
assert len(session)==0 and not bool(session)
assert ns['real_surface']([session]) is session
assert ns['real_surface']([settings]) is settings
assert ns['real_surface']([session,settings]) is session
demo=ET.fromstring('<node text="MODE DÉMO · HORS LIGNE"/>')
assert ns['real_surface']([settings,demo]) is None
assert ns['real_surface']([unrelated]) is None
assert ns['real_surface']([]) is None
`;
 const r=cp.spawnSync('python3',['-c',py],{encoding:'utf8'}); assert.equal(r.status,0,r.stderr || r.stdout);
});
