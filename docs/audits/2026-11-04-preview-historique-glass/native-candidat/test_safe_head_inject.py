#!/usr/bin/env python3
"""Regression: Melodix style injection must not throw when <head> does not exist yet."""
import importlib.util, json, re, subprocess, sys, tempfile, unittest
from pathlib import Path
HERE = Path(__file__).parent
spec = importlib.util.spec_from_file_location('apply', HERE / 'apply_safe_head_inject.py'); apply = importlib.util.module_from_spec(spec); spec.loader.exec_module(apply)
# The exact c91.smali template (smali-escaped quotes), as shipped in 1.2.2-d0f206b-glass.
TEMPLATE = r"""    const-string v2, "(function() {  let style = document.getElementById(\'sf-custom-style\');  if(!style) { style = document.createElement(\'style\'); style.id = \'sf-custom-style\'; document.head.appendChild(style); }  style.textContent = %s + %s;  %s})();"
"""
JS_CHECK = r"""
const nodes = {}; const html = { children: [], appendChild(n) { this.children.push(n); nodes[n.id] = n; } };
global.document = { head: null, documentElement: html, getElementById: id => nodes[id] || null,
  createElement: () => ({ id: '', textContent: '' }) };
const src = process.argv[1];
eval(src); eval(src);                      // two injections, as on two page events
console.log(JSON.stringify({ styles: html.children.length, text: html.children[0] && html.children[0].textContent }));
"""
class T(unittest.TestCase):
    def tree(self, c91, o6='x', bridge='x'):
        d = Path(tempfile.mkdtemp()); (d/'smali').mkdir(); (d/'assets').mkdir()
        (d/'smali/c91.smali').write_text(c91); (d/'smali/o6.smali').write_text(o6); (d/'assets/spotify_bridge.js').write_text(bridge); return d
    def test_patched_template_runs_without_head_and_injects_once(self):
        d = self.tree(TEMPLATE * 2, 'document.head.appendChild(s)', 'document.head.appendChild(a);document.head.appendChild(b);document.head.appendChild(c)')
        out = apply.prepare(d, 'smali/c91.smali', 2)
        self.assertNotIn('document.head.appendChild(', out)
        js = re.search(r'const-string v2, "(.*)"\n', out).group(1).replace("\\'", "'") % ('"a{}"', '"b{}"', '')
        r = json.loads(subprocess.run(['node', '-e', JS_CHECK, js], capture_output=True, text=True, check=True).stdout)
        self.assertEqual(r, {'styles': 1, 'text': 'a{}b{}'})
    def test_original_template_throws_without_head(self):
        js = re.search(r'const-string v2, "(.*)"\n', TEMPLATE).group(1).replace("\\'", "'") % ('"a"', '"b"', '')
        p = subprocess.run(['node', '-e', JS_CHECK, js], capture_output=True, text=True)
        self.assertIn("reading 'appendChild'", p.stderr)
    def test_refuses_unexpected_count(self):
        with self.assertRaises(ValueError): apply.prepare(self.tree(TEMPLATE), 'smali/c91.smali', 2)
if __name__ == '__main__': unittest.main()
