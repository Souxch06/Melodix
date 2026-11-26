#!/usr/bin/env python3
"""Regression: the shipped spotify_bridge.js must not freeze accounts.spotify.com once the guard runs first.
Usage: test_bridge_nav_scope.py <apktool project root with assets/spotify_bridge.js>  (jsdom via NODE_PATH)."""
import importlib.util, os, subprocess, sys, tempfile, unittest
from pathlib import Path
HERE = Path(__file__).parent; REPO = HERE.parents[3]
spec = importlib.util.spec_from_file_location('apply', HERE / 'apply_bridge_nav_scope.py'); apply = importlib.util.module_from_spec(spec); spec.loader.exec_module(apply)
ROOT = Path(sys.argv.pop(1)) if len(sys.argv) > 1 else None
JS = r"""
const { JSDOM } = require('jsdom'); const fs = require('fs');
const dom = new JSDOM('<html><head></head><body><div id="root"></div></body></html>', { url: 'https://accounts.spotify.com/en/login', runScripts: 'outside-only', pretendToBeVisual: true });
const w = dom.window; w.SF_CONFIG = { guiMode: 'csshack', touchInput: true };
if (process.argv[2]) w.eval(process.argv[2]);
try { w.eval(fs.readFileSync(process.argv[1], 'utf8')); } catch (e) {}
w.setTimeout(() => { const navs = [...w.document.querySelectorAll('#sf-mobile-nav')]; console.log(navs.length === 1 && navs[0].style.display === 'none' && !w.document.querySelector('[data-sf-mobile-action]') ? 'alive-no-dock' : 'alive-with-dock'); process.exit(0); }, 200);
"""
def alive(guard):
    env = dict(os.environ, NODE_PATH=os.environ.get('NODE_PATH') or str(REPO / 'node_modules'))
    try:
        return subprocess.run(['node', '-e', JS, str(ROOT / 'assets/spotify_bridge.js'), guard], capture_output=True, text=True, timeout=20, env=env).stdout.strip()
    except subprocess.TimeoutExpired:
        return ''
class T(unittest.TestCase):
    @unittest.skipIf(ROOT is None, 'needs the project root')
    def test_shipped_bridge_freezes_login_page_without_guard(self): self.assertEqual(alive(''), '')  # frozen: no output before the timeout
    @unittest.skipIf(ROOT is None, 'needs the project root')
    def test_shipped_bridge_stays_responsive_with_guard(self): self.assertEqual(alive(apply.GUARD_JS), 'alive-no-dock')
    def test_smali_guard_matches_tested_js(self):
        self.assertEqual(apply.NEW.split('}; ', 1)[1].rsplit('"', 1)[0].replace("\\'", "'"), apply.GUARD_JS)
    def test_applies_once(self):
        d = Path(tempfile.mkdtemp()); (d/'smali').mkdir(); (d/apply.SOURCE).write_text('x' + apply.OLD)
        out = apply.prepare(d); (d/apply.SOURCE).write_text(out)
        with self.assertRaises(ValueError): apply.prepare(d)
if __name__ == '__main__': unittest.main()
