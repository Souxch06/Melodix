#!/usr/bin/env python3
"""Input pin and semantic/structural checks; not an Android runtime test."""
import importlib.util,os,re,shutil,tempfile,unittest
from pathlib import Path
here=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('patch',here/'apply_glass_detail_library.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
def method(s,name):
 m=re.search(r'^\.method [^\n]*\b'+re.escape(name)+r'\([^\n]*\n([\s\S]*?)^\.end method',s,re.M)
 if not m:raise AssertionError('missing method '+name)
 return m.group(1)
class Tests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.data=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text() for n in patch.EXPECTED}
 def test_all_inputs_pinned_and_no_partial_apply(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source pin test')
  with tempfile.TemporaryDirectory() as tmp:
   dest=Path(tmp)
   for name in patch.EXPECTED:
    f=dest/name;f.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/name,f)
   for name in patch.EXPECTED:
    f=dest/name;old=f.read_bytes();f.write_bytes(old+b'\n')
    with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(dest)
    f.write_bytes(old)
   for name,text in patch.prepare(dest).items():(dest/name).write_text(text)
   with self.assertRaises(ValueError):patch.prepare(dest)
 def test_library_spacing_gated_after_successful_paint(self):
  activity=self.data['smali/com/melodix/music/MainActivity.smali'];render=method(activity,'renderNativeRows');spacing=method(activity,'spaceNativeLibraryRows')
  self.assertRegex(render,r'NativeHomeFeed;->paint[\s\S]*?move-result v3\s+if-lez v3, :\w+\s+const-string v0, "library"[\s\S]*?if-eqz v0, :\w+\s+invoke-virtual \{p0, v2\}[^\n]*->spaceNativeLibraryRows')
  for ins in ('getDisplayMetrics()','->density:F','0x41400000','0x41000000','setPadding(IIII)V','bottomMargin:I','Landroid/widget/LinearLayout;','setLayoutParams'):self.assertIn(ins,spacing)
  self.assertIn('getChildCount()I',spacing);self.assertIn('getChildAt(I)',spacing)
 def test_subtitle_and_accessibility_branches_have_correct_truth_values(self):
  row=method(self.data['smali/com/melodix/music/NativeUiRowFactory.smali'],'create')
  # Section is only used as fallback for an absent subtitle; in particular,
  # an empty section must not erase a real artist returned by the bridge.
  self.assertRegex(row,r'invoke-virtual \{v10\}, Ljava/lang/String;->isEmpty\(\)Z\s+move-result v0\s+if-nez v0, :\w+\s+invoke-virtual \{v7\}, Ljava/lang/String;->isEmpty\(\)Z\s+move-result v0\s+if-eqz v0, :\w+\s+move-object v7, v10')
  self.assertRegex(row,r'isEmpty\(\)Z\s+move-result v0\s+if-eqz v0, :\w+\s+const-string v0, ":track:"')
  self.assertRegex(row,r'isEmpty\(\)Z\s+move-result v10\s+if-nez v10, :\w+\s+const-string v10, ", "')
 def test_detail_title_only_nonempty_and_detail_screen(self):
  activity=method(self.data['smali/com/melodix/music/MainActivity.smali'],'applyNativeUiData')
  segment=activity[activity.index('"screen-title"'):activity.index('"detail"',activity.index('"screen-title"'))+8]
  self.assertRegex(segment,r'isEmpty\(\)Z\s+move-result v1\s+if-nez v1')
  self.assertIn('nativeCurrentScreen',segment);self.assertIn('"detail"',segment)
 def test_home_and_library_fetch_untouched(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source comparison')
  old=(root/'assets/native_ui_shell.js').read_text();new=self.data['assets/native_ui_shell.js']
  def function(s,name):
   start=s.index('    function '+name+'(');end=s.find('\n    function ',start+5)
   return s[start:end]
  for name in ('collectHomeRows','updateHomeRows','updateLibraryRows','supplementHomeRowsWithLibrary'):
   self.assertTrue(function(new,name).startswith(function(old,name).rstrip()),name)
  self.assertEqual((root/'smali/com/melodix/music/NativeHomeFeed.smali').read_text(),self.data['smali/com/melodix/music/NativeHomeFeed.smali'])
if __name__=='__main__':unittest.main(verbosity=2)
