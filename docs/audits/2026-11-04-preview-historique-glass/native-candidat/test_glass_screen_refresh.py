#!/usr/bin/env python3
"""Check patch isolation and exact visual wiring (not visual/device testing)."""
import hashlib,importlib.util,os,unittest
from pathlib import Path
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('refresh',HERE/'apply_glass_screen_refresh.py');refresh=importlib.util.module_from_spec(spec);spec.loader.exec_module(refresh)
ROOT=Path(os.environ['MELODIX_PREVIEW_ROOT']);INPUT=os.environ.get('MELODIX_PATCH_INPUT')=='1'
def body(text,name):
 start=text.index('.method public final '+name+'(');end=text.index('.end method',start);return text[start:end]
class TestRefresh(unittest.TestCase):
 @classmethod
 def setUpClass(cls):cls.data=refresh.prepare(ROOT) if INPUT else None
 def get(self,name):return self.data[name] if INPUT else (ROOT/name).read_text(encoding='utf8')
 def test_pinned_and_protected(self):
  if INPUT:
   self.assertEqual(set(self.data),{refresh.ACTIVITY,refresh.HELPER})
   from verify_9016_protected_assets import ASSET_SHA256
   self.assertFalse(set(self.data)&set(ASSET_SHA256))
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/GlassScreenStyler.java').read_bytes()).hexdigest(),refresh.SOURCE_SHA)
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/smali/GlassScreenStyler.smali').read_bytes()).hexdigest(),refresh.HELPER_SHA)
 def test_visual_hook_and_original_click_routes(self):
  activity=self.get(refresh.ACTIVITY);render=body(activity,'renderNativeRows');openrow=body(activity,'openNativeRow')
  self.assertEqual(render.count('GlassScreenStyler;->style('),2)
  self.assertIn('NativeHomeFeed;->paint',render);self.assertIn('removeAllViews()',render)
  self.assertIn('GlassScreenStyler;->rememberSelection(',openrow)
  for call in ('window.__sfOpenCollection','window.__sfNativeOpenUri','playlistOpened','lot1PushBack'):self.assertIn(call,openrow)
  self.assertIn('glass-old-playlist-heading',body(activity,'addNativePlaylistHeading'))
 def test_no_playback_or_fake_metadata(self):
  src=(HERE/'glass-refresh/GlassScreenStyler.java').read_text()
  for value in ('playFromUri','__sfTogglePlayback','setOnClickListener','fetch(', 'java.net.', 'Runtime.getRuntime'):
   self.assertNotIn(value,src)
  for value in ('uri.equals(id)','NativeImageLoader.load(image,imageUrl','row.isClickable()', 'IMPORTANT_FOR_ACCESSIBILITY_NO','setMaxLines(3)', 'weak', '"Indisponible"'):
   self.assertIn(value.lower(),src.lower())
  self.assertIn('if("detail".equals(screen)&&playlist(uri))',src)
  self.assertIn('if("settings".equals(screen))',src)
  helper=self.get(refresh.HELPER)
  self.assertNotIn('setOnClickListener',helper);self.assertNotIn('playFromUri',helper)
  self.assertNotIn('\ufffd',helper)
 def test_no_change_to_protected_and_input(self):
  if not INPUT:self.skipTest('input only')
  orig=(ROOT/refresh.ACTIVITY).read_text();new=self.get(refresh.ACTIVITY)
  for name in ('onNativeLibraryClick','onNativePlayPauseClick','onNativeBackClick','setNativeScreen','applyNativeUiData'):
   self.assertEqual(body(orig,name),body(new,name))
if __name__=='__main__':unittest.main(verbosity=2)
