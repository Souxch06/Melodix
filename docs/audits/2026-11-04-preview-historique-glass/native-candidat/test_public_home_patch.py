#!/usr/bin/env python3
import importlib.util,os,shutil,tempfile,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent;SOURCE=Path(os.environ['MELODIX_PREVIEW_ROOT'])
spec=importlib.util.spec_from_file_location('patch',HERE/'apply_public_home.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in patch.EXPECTED:
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(SOURCE/name,target)
 def test_both_assets_patched(self):
  files=patch.prepare(self.root);self.assertEqual(set(files),set(patch.EXPECTED));self.assertIn('function observeHomeContent(root)',files['assets/native_ui_shell.js']);self.assertIn('if (window.__sfNativeUiShellReady)',files['assets/spotify_bridge.js'])
 def test_wrong_inputs_rejected_without_write(self):
  for name in patch.EXPECTED:
   p=self.root/name;old=p.read_bytes();p.write_bytes(old+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   self.assertEqual(p.read_bytes(),old+b'\n');p.write_bytes(old)
if __name__=='__main__':unittest.main(verbosity=2)
