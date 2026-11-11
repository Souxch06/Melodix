'use strict';
const test = require('node:test'), assert = require('node:assert/strict');
const cp = require('node:child_process'), fs = require('node:fs');
test('diagnostic replay retains strict acceptance source, only adds two markers and fails closed on drift', () => {
 const code=`import sys\nsys.path.insert(0,'scripts')\nimport diagnose_demo_return as d\ns=open('scripts/capture_launcher_acceptance.py').read()\nr=d.replay_source(s)\nassert r.replace("    mark('before-exit')\\n",'').replace("\\n    mark('after-exit')",'')==s\ntry: d.replay_source('wrong')\nexcept RuntimeError: pass\nelse: raise AssertionError('anchor drift')\n`;
 const r=cp.spawnSync('python3',['-c',code],{encoding:'utf8'});assert.equal(r.status,0,r.stderr);
});
test('diagnostic log filters do not export URL, arbitrary console text or cookie values', () => {
 const code=`import sys\nsys.path.insert(0,'scripts')\nfrom diagnose_demo_return import safe_event\nassert safe_event('I/MDXTRACE( 123): sid=1234abcd t=100 navigation source=finish route=accounts')\nassert safe_event('I/MDXDEMOREPLAY( 123): after-exit')=='MARK after-exit'\nassert safe_event('I/MDXTRACE( 123): sid=1234abcd t=100 navigation source=finish route=accounts token=secret') is None\nassert safe_event('I/chromium(123): secret cookie=abc') is None\n`;
 const r=cp.spawnSync('python3',['-c',code],{encoding:'utf8'});assert.equal(r.status,0,r.stderr);
});
test('diagnostic workflow is pinned to the exact test157 and retains failing acceptance', () => {
 const w=fs.readFileSync('.github/workflows/demo-existing-apk-replay.yml','utf8');
 assert.match(w,/run-id: 43074770471/);assert.match(w,/00ce34bf864e0678d88906eab43b4f529398cc63624394edc4b80aefde880fec/);
 const job=w.slice(w.indexOf('  test157-diagnostics:'));
 assert.doesNotMatch(job,/continue-on-error/);assert.match(job,/python3 scripts\/diagnose_demo_return.py/);
});
