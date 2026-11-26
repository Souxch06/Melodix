#!/usr/bin/env python3
"""Regression: the body observer must not be re-triggered by a no-op class removal."""
import importlib.util, json, os, subprocess, tempfile, unittest
from pathlib import Path
HERE = Path(__file__).parent; REPO = HERE.parents[3]
spec = importlib.util.spec_from_file_location('apply', HERE / 'apply_bridge_observer_loop.py'); apply = importlib.util.module_from_spec(spec); spec.loader.exec_module(apply)
# Count observer callbacks for one deactivation, in jsdom (real DOM semantics).
JS = r"""
const { JSDOM } = require('jsdom');
const dom = new JSDOM('<body class="sf-mobile-shell"></body>'); const { document, MutationObserver } = dom.window;
let calls = 0; new MutationObserver(() => calls++).observe(document.body, { attributes: true, attributeFilter: ['class'] });
eval(process.argv[1]);
setTimeout(() => console.log(JSON.stringify(calls)), 50);
"""
def observer_calls(line):
    env = dict(os.environ, NODE_PATH=str(REPO / 'node_modules'))
    return json.loads(subprocess.run(['node', '-e', JS, line], capture_output=True, text=True, check=True, env=env).stdout)
class T(unittest.TestCase):
    def test_original_removal_retriggers_observer(self):
        self.assertEqual(observer_calls(apply.OLD.strip()), 1)
    def test_patched_removal_is_silent_when_class_absent(self):
        line = [l for l in apply.NEW.splitlines() if not l.strip().startswith('//')][0].strip()
        self.assertEqual(observer_calls(line), 0)
    def test_patch_applies_once(self):
        d = Path(tempfile.mkdtemp()); (d/'assets').mkdir(); (d/apply.SOURCE).write_text('x\n' + apply.OLD + 'y\n')
        out = apply.prepare(d); self.assertNotIn(apply.OLD, out); (d/apply.SOURCE).write_text(out)
        with self.assertRaises(ValueError): apply.prepare(d)
if __name__ == '__main__': unittest.main()
