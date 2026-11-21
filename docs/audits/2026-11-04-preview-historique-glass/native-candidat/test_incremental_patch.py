#!/usr/bin/env python3
import importlib.util,os,shutil,tempfile,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent;SOURCE=Path(os.environ['MELODIX_PREVIEW_ROOT'])
spec=importlib.util.spec_from_file_location('patch',HERE/'apply_incremental_library.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in patch.EXPECTED:
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(SOURCE/name,target)
 def test_expected_inputs_produce_both_patches(self):
  files=patch.prepare(self.root);self.assertEqual(set(files),set(patch.EXPECTED));self.assertIn('onPage(allItems, complete)',files['assets/spotify_bridge.js']);self.assertIn('showSidebarCategory',files['assets/native_ui_shell.js'])
 def test_changed_input_is_rejected_before_writing(self):
  for name in patch.EXPECTED:
   p=self.root/name;old=p.read_bytes();p.write_bytes(old+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   self.assertEqual(p.read_bytes(),old+b'\n');p.write_bytes(old)
if __name__=='__main__':unittest.main(verbosity=2)
