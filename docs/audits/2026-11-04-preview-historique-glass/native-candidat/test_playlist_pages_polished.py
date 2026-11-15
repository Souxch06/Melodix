#!/usr/bin/env python3
"""Tests for pinned input, routing and compiled view-structure (not ART)."""
import importlib.util,os,re,shutil,tempfile,unittest
from pathlib import Path
here=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('patch',here/'apply_playlist_pages_home_sections.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
def method(s,n):
 m=re.search(r'^\.method [^\n]*\b'+re.escape(n)+r'\([^\n]*\n([\s\S]*?)^\.end method',s,re.M)
 if not m:raise AssertionError('missing method '+n)
 return m.group(1)
class Tests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):cls.files=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {n:(root/n).read_text() for n in patch.EXPECTED}
 def test_pinned_sources(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source-only pin test')
  with tempfile.TemporaryDirectory() as tmp:
   dst=Path(tmp)
   for n in patch.EXPECTED:
    f=dst/n;f.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/n,f)
   for n in patch.EXPECTED:
    f=dst/n;b=f.read_bytes();f.write_bytes(b+b'\n')
    with self.subTest(path=n),self.assertRaises(ValueError):patch.prepare(dst)
    f.write_bytes(b)
   for n,s in patch.prepare(dst).items():(dst/n).write_text(s)
   with self.assertRaises(ValueError):patch.prepare(dst)
 def test_home_group_headers_preserve_shelf_and_factory(self):
  shelf=self.files['smali/com/melodix/music/NativeHomeShelfPreview.smali'];paint=method(shelf,'paint');label=method(shelf,'groupLabel')
  self.assertIn('"homeOrigin"',paint);self.assertIn('->groupLabel(',paint);self.assertIn('->createSectionHeader(',paint);self.assertIn('NativeUiRowFactory;->create(',paint);self.assertIn('HorizontalScrollView',paint)
  self.assertRegex(paint,r'move-object v11, v12\s+const/4 v4, 0x0\s+invoke-static')
  label=re.sub(r'\\u([0-9a-fA-F]{4})',lambda m:chr(int(m.group(1),16)),label)
  self.assertIn('Votre bibliothèque',label);self.assertIn('À découvrir sur Spotify',label);self.assertIn('native_category_chip',label)
 def test_detail_style_is_isolated_from_library(self):
  activity=self.files['smali/com/melodix/music/MainActivity.smali'];render=method(activity,'renderNativeRows');detail=method(activity,'styleNativeDetailRows');library=method(activity,'spaceNativeLibraryRows')
  self.assertRegex(render,r'"library"[\s\S]*?spaceNativeLibraryRows[\s\S]*?"detail"[\s\S]*?if-eqz v0, :\w+\s+invoke-virtual \{p0, v2\}[^\n]*styleNativeDetailRows')
  self.assertIn('native_playlist_row_glass',detail);self.assertIn('0x40c00000',detail);self.assertIn('0x41000000',library)
  self.assertIn('bottomMargin:I',detail);self.assertIn('setPadding(IIII)V',detail)
 def test_paging_is_scoped_to_native_playlist(self):
  bridge=self.files['assets/spotify_bridge.js'];self.assertIn('if (isNativePlaylist) {',bridge);self.assertIn('const maxPages = 125',bridge);self.assertIn('offset += items.length',bridge);self.assertIn('showStatus(',bridge);self.assertIn('__sfCompleteNativePlaylistTokens',bridge)
  self.assertIn('window.__sfNativeCollectionDomReady',bridge)
 def test_legacy_fallbacks_remain(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source-only comparison')
  old=(root/'assets/spotify_bridge.js').read_text();new=self.files['assets/spotify_bridge.js']
  def section(s,start,end):return s[s.index(start):s.index(end,s.index(start))]
  self.assertEqual(section(old,'        async function getLikedSongsTracks()',"        // 2. Liked Songs"),section(new,'        async function getLikedSongsTracks()',"        // 2. Liked Songs"))
  shell=self.files['assets/native_ui_shell.js'];self.assertIn("homeOrigin: 'library'",shell);self.assertIn("homeOrigin: 'spotify'",shell)
if __name__=='__main__':unittest.main(verbosity=2)
