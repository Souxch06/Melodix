'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const cp = require('node:child_process');

test('strict launcher acceptance crosses the watchdog deadline in demo and checks the returned surface', () => {
  const source = fs.readFileSync('scripts/capture_launcher_acceptance.py', 'utf8');
  const player = source.indexOf("screenshot('05-lecteur-demo'");
  const watch = source.indexOf("observe_watchdog(nodes, 'demo', 70)");
  const exit = source.indexOf("text_node(n, 'Quitter la démo')");
  const stable = source.indexOf("observe_watchdog(nodes, 'after-exit', 10)");
  const screenshot = source.indexOf("screenshot('06-apres-sortie'");
  assert.ok(player < watch && watch < exit && exit < stable && stable < screenshot);
  assert.match(source, /real settings inaccessible: session gate/);
  assert.doesNotMatch(source, /evaluateJavascript|pm', 'clear|DemoSettingsActivity/);
});

test('watchdog observer rejects blocked, missing and unstable surfaces using deterministic fake samples', () => {
  const py = String.raw`
import sys
sys.path.insert(0, 'scripts')
from session_watchdog_observation import observe_watchdog

def n(text='', id='', desc=''): return {'text':text, 'resource-id':id, 'content-desc':desc}
class Clock:
    def __init__(self): self.t=0
    def now(self): return self.t
    def sleep(self, seconds): self.t += seconds

def run(mode, duration, frames):
    clock=Clock(); index=[0]
    def sample():
        i=min(index[0],len(frames)-1); index[0]+=1; return frames[i]
    try: observe_watchdog(sample, mode, duration, clock.now, clock.sleep)
    except RuntimeError as ex: return str(ex), clock.t, index[0]
    return 'ok', clock.t, index[0]

demo=[n('MODE DÉMO · HORS LIGNE')]
session=[n(id='com.melodix.music.preview:id/sessionTitle'),n('Essayer le mode démo')]
settings=[n(id='com.melodix.music.preview:id/nativeSettingsButton')]
blocked=[n('MELODIX DIAGNOSTIC - CONTENT STUCK')]
assert run('demo',70,[demo]) == ('ok',70,36)
assert run('after-exit',10,[session])[0]=='ok'
assert run('after-exit',10,[settings])[0]=='ok'
assert 'diagnostic' in run('demo',70,[demo,blocked])[0]
assert 'diagnostic' in run('after-exit',10,[session,[n(desc='CONTENT STUCK')]])[0]
assert 'disappeared' in run('demo',70,[demo,[]])[0]
assert 'disappeared' in run('after-exit',10,[session,[]])[0]
assert 'entry disappeared' in run('after-exit',10,[[n(id='com.melodix.music.preview:id/sessionTitle')]])[0]
try: observe_watchdog(lambda:[], 'unknown', 1, lambda:0, lambda _:None)
except ValueError: pass
else: raise AssertionError('invalid mode accepted')
`;
  const r = cp.spawnSync('python3', ['-c', py], {encoding:'utf8'});
  assert.equal(r.status, 0, r.stderr || r.stdout);
});
