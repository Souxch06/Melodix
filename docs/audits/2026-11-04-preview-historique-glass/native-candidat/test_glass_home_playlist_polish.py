#!/usr/bin/env python3
"""Static source and apktool-decoded checks; not an Android view runtime."""
import importlib.util,os,re,shutil,tempfile,unittest,xml.etree.ElementTree as ET
from pathlib import Path
here=Path(__file__).resolve().parent;spec=importlib.util.spec_from_file_location('patch',here/'apply_glass_home_playlist_polish.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
root=Path(os.environ['MELODIX_PREVIEW_ROOT']);A='{http://schemas.android.com/apk/res/android}'
def method(s,n):
 m=re.search(r'^\.method [^\n]*\b'+re.escape(n)+r'\([^\n]*\n([\s\S]*?)^\.end method',s,re.M)
 if not m:raise AssertionError('missing '+n)
 return m.group(1)
class Tests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):cls.files=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text() for n in (*patch.EXPECTED,*patch.DRAWABLES)}
 def test_pinned_input_and_resource_collision(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('only input')
  with tempfile.TemporaryDirectory() as tmp:
   dst=Path(tmp)
   for name in patch.EXPECTED:
    f=dst/name;f.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/name,f)
   for name in patch.EXPECTED:
    f=dst/name;b=f.read_bytes();f.write_bytes(b+b'\n')
    with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(dst)
    f.write_bytes(b)
   for name in patch.DRAWABLES:
    f=dst/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text('collision')
    with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(dst)
    f.unlink()
 def test_home_banners_remain_distinct_but_more_compact(self):
  shelf=self.files['smali/com/melodix/music/NativeHomeShelfPreview.smali'];paint=method(shelf,'paint');badge=method(shelf,'groupLabel');card=method(shelf,'asCard');heading=method(shelf,'styleShelfHeading')
  for marker in ('"homeOrigin"','groupLabel(', 'createSectionHeader(', 'styleShelfHeading(', 'NativeUiRowFactory;->create(', 'hideRepeatedSection(', 'asCard('):self.assertIn(marker,paint)
  self.assertIn('0x41400000',badge);self.assertRegex(badge,r'const/4 v5, -0x2');self.assertIn('0x90',card);self.assertIn('0x7c',card);self.assertIn('0x41900000',heading)
 def test_only_exact_duplicate_subtitle_is_hidden(self):
  body=method(self.files['smali/com/melodix/music/NativeHomeShelfPreview.smali'],'hideRepeatedSection')
  self.assertRegex(body,r'isEmpty\(\)Z\s+move-result v0\s+if-nez v0, :\w+')
  self.assertRegex(body,r'equals\(Ljava/lang/Object;\)Z\s+move-result v3\s+if-eqz v3, :\w+\s+const/16 v0, 0x8\s+invoke-virtual \{v1, v0\}[^\n]*setVisibility')
  def hide(section,subtitle):return bool(section) and subtitle==section
  for sec,sub,expected in [('Vos playlists','Vos playlists',True),('Vos playlists','Artiste réel',False),('','',False),('Mix','mix',False)]:self.assertEqual(hide(sec,sub),expected)
 def test_playlist_heading_and_subtle_rows_are_screen_gated(self):
  activity=self.files['smali/com/melodix/music/MainActivity.smali'];render=method(activity,'renderNativeRows');heading=method(activity,'addNativePlaylistHeading');style=method(activity,'styleNativeDetailRows')
  self.assertRegex(render,r'"detail"[\s\S]*?if-eqz v0, :\w+\s+invoke-virtual \{p0, v2\}[^\n]*styleNativeDetailRows[\s\S]*?addNativePlaylistHeading')
  for m in (':playlist:', '/playlist/', 'nativeExpectedId', 'Titres de la playlist','native_playlist_heading_glass','addView(Landroid/view/View;I)V'):self.assertIn(m,heading)
  self.assertIn('native_playlist_row_glass',style);self.assertIn('0x40c00000',style)
 def test_resources_are_subtle_and_compilable(self):
  for name in patch.DRAWABLES:
   e=ET.fromstring(self.files[name]);self.assertIn(e.tag,('ripple','shape'))
  ripple=ET.fromstring(self.files['res/drawable/native_playlist_row_glass.xml']);self.assertEqual(ripple.tag,'ripple');self.assertTrue(any(x.get(A+'id')=='@android:id/mask' for x in ripple.iter()))
 def test_existing_public_resource_ids_do_not_shift(self):
  source=os.environ.get('MELODIX_PRIOR_PUBLIC')
  if not source:self.skipTest('decoded comparison requires MELODIX_PRIOR_PUBLIC')
  def ids(path):return {(e.get('type'),e.get('name')):e.get('id') for e in ET.parse(path).getroot() if e.tag=='public'}
  before=ids(source);after=ids(root/'res/values/public.xml')
  self.assertTrue(before)
  for key,value in before.items():self.assertEqual(after.get(key),value,key)
  for name in ('native_playlist_row_glass','native_playlist_heading_glass'):self.assertIn(('drawable',name),after)
 def test_data_paths_and_navigation_not_replaced(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('only input')
  for name,text in self.files.items():
   if name.startswith('assets/'):self.fail('unexpected JS modification')
  old=(root/'smali/com/melodix/music/MainActivity.smali').read_text();new=self.files['smali/com/melodix/music/MainActivity.smali']
  for n in ('openNativeRow','setNativeScreen','applyNativeUiData','spaceNativeLibraryRows','onNativeBackClick','updateNativePlayer'):self.assertEqual(method(old,n),method(new,n),n)
if __name__=='__main__':unittest.main(verbosity=2)
