#!/usr/bin/env python3
import importlib.util,os,shutil,tempfile,unittest
from pathlib import Path
here=Path(__file__).resolve().parent; source=Path(os.environ['MELODIX_PREVIEW_ROOT'])
spec=importlib.util.spec_from_file_location('patch',here/'apply_fast_cold_home.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in patch.SHA:
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source/name,target)
 def test_applies_only_to_expected_base(self):
  result=patch.prepare(self.root);self.assertIn('Native Home can start the request',result[patch.BRIDGE]);self.assertEqual(result[patch.SHELL],(self.root/patch.SHELL).read_text())
 def test_modified_base_rejected_without_writes(self):
  for name in patch.SHA:
   p=self.root/name;original=p.read_bytes();p.write_bytes(original+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   self.assertEqual(p.read_bytes(),original+b'\n');p.write_bytes(original)
if __name__=='__main__':unittest.main(verbosity=2)
