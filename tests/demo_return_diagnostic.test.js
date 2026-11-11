'use strict';
const test = require('node:test'), assert = require('node:assert/strict');
const cp = require('node:child_process'), fs = require('node:fs');
test('diagnostic replay retains strict acceptance source, only adds two markers and fails closed on drift', () => {
 const code=`import sys\nsys.path.insert(0,'scripts')\nimport diagnose_demo_return as d\ns=open('scripts/capture_launcher_acceptance.py').read()\nr=d.replay_source(s)\nr=r.replace("    mark('before-exit')\\n",'').replace("\\n    mark('after-exit')",'')\nr=r.replace("    items = list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))\\n    observe_node_sample(items)\\n    return items", "    return list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))")\nassert r==s\ntry: d.replay_source('wrong')\nexcept RuntimeError: pass\nelse: raise AssertionError('anchor drift')\n`;
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
 assert.doesNotMatch(job,/continue-on-error/);assert.match(job,/bash scripts\/replay_demo_with_probe.sh/);
 assert.match(fs.readFileSync('scripts/replay_demo_with_probe.sh','utf8'),/python3 scripts\/diagnose_demo_return.py/);
});
test('DOM probe only emits allowlisted facts and is strictly opt-in on fresh CI', () => {
 const code=`import sys\nsys.path.insert(0,'scripts')\nfrom diagnose_demo_return import safe_event\ngood='I/MDXDOM( 123): progress=100 nativehost=accounts host=accounts ready=complete started=undefined bootstrap=undefined home=false interface=false'\nassert safe_event(good)=='DOM '+good.split(': ',1)[1]\nassert safe_event(good+' cookie=secret') is None\n`;
 const r=cp.spawnSync('python3',['-c',code],{encoding:'utf8'});assert.equal(r.status,0,r.stderr);
 const java=fs.readFileSync('tests/android/demo-return-probe/DemoReturnProbe.java','utf8');
 assert.match(java,/getElementById\('sf-melodix-home'\)/);
 assert.doesNotMatch(java,/localStorage|document\.cookie|authorization|fetch\(/i);
 const workflow=fs.readFileSync('.github/workflows/demo-existing-apk-replay.yml','utf8');
 assert.match(workflow,/if: inputs\.dom_probe == true/);assert.doesNotMatch(workflow,/upload-artifact[\s\S]{0,180}probe\.apk/);
});
