#!/usr/bin/env python3
import importlib.util,os,shutil,tempfile,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent;SOURCE=Path(os.environ['MELODIX_HISTORICAL_ROOT'])
spec=importlib.util.spec_from_file_location('patch',HERE/'apply_home_library.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in patch.EXPECTED:
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(SOURCE/name,target)
 def test_only_pinned_files_change(self):
  changed=patch.prepare(self.root);self.assertEqual(set(changed),set(patch.EXPECTED))
  self.assertIn('if-nez v1, :done',changed['smali/com/melodix/music/NativeHomeJsonCallback.smali'])
  self.assertIn("if (!category) return;",changed['assets/native_ui_shell.js'])
  self.assertIn('isSpotifyHome()) scheduleUpdate()',changed['assets/native_ui_shell.js'])
 def test_any_changed_input_rejected_before_writing(self):
  for name in patch.EXPECTED:
   p=self.root/name;old=p.read_bytes();p.write_bytes(old+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   self.assertEqual(p.read_bytes(),old+b'\n');p.write_bytes(old)
if __name__=='__main__':unittest.main(verbosity=2)
