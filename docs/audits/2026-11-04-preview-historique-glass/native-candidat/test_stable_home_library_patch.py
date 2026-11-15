#!/usr/bin/env python3
import importlib.util,os,shutil,tempfile,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent;SOURCE=Path(os.environ['MELODIX_PREVIEW_ROOT'])
spec=importlib.util.spec_from_file_location('patch',HERE/'apply_stable_home_library.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in (patch.NAME,patch.BRIDGE):
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(SOURCE/name,target)
 def test_both_expected_inputs_produce_changes(self):
  files=patch.prepare(self.root);self.assertEqual(set(files),{patch.NAME,patch.BRIDGE});self.assertIn('function stabilizeHomeRows(rows)',files[patch.NAME]);self.assertIn('showAvailableLibraryCategory',files[patch.NAME]);self.assertIn('window.__sfNativeMediaTokenMatches',files[patch.BRIDGE])
 def test_changed_input_rejected_without_writing(self):
  for name in (patch.NAME,patch.BRIDGE):
   p=self.root/name;old=p.read_bytes();p.write_bytes(old+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   self.assertEqual(p.read_bytes(),old+b'\n');p.write_bytes(old)
if __name__=='__main__':unittest.main(verbosity=2)
