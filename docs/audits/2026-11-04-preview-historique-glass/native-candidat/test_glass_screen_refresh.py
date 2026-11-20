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
   self.assertEqual(set(self.data),{refresh.ACTIVITY,refresh.RETRY,refresh.HELPER,refresh.MOTION})
   from verify_9016_protected_assets import ASSET_SHA256
   self.assertFalse(set(self.data)&set(ASSET_SHA256))
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/GlassScreenStyler.java').read_bytes()).hexdigest(),refresh.SOURCE_SHA)
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/smali/GlassScreenStyler.smali').read_bytes()).hexdigest(),refresh.HELPER_SHA)
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/GlassLikedMotion.java').read_bytes()).hexdigest(),refresh.MOTION_SOURCE_SHA)
  self.assertEqual(hashlib.sha256((HERE/'glass-refresh/smali/GlassLikedMotion.smali').read_bytes()).hexdigest(),refresh.MOTION_HELPER_SHA)
 def test_visual_hook_and_original_click_routes(self):
  activity=self.get(refresh.ACTIVITY);render=body(activity,'renderNativeRows');openrow=body(activity,'openNativeRow')
  self.assertEqual(render.count('GlassScreenStyler;->style('),3)
  self.assertIn('NativeHomeFeed;->paint',render);self.assertIn('removeAllViews()',render)
  self.assertIn('GlassScreenStyler;->rememberSelection(',openrow)
  for call in ('window.__sfOpenCollection','window.__sfNativeOpenUri','playlistOpened','lot1PushBack'):self.assertIn(call,openrow)
  self.assertIn('glass-old-playlist-heading',body(activity,'addNativePlaylistHeading'))
  self.assertIn('GlassScreenStyler;->genreQuery(',body(activity,'onNativeGenreClick'))
  self.assertIn(':glass_home_changed',body(activity,'applyNativeUiData'))
 def test_no_playback_or_fake_metadata(self):
  src=(HERE/'glass-refresh/GlassScreenStyler.java').read_text()
  for value in ('playFromUri','__sfTogglePlayback','setOnClickListener','fetch(', 'java.net.', 'Runtime.getRuntime'):
   self.assertNotIn(value,src)
  for value in ('uri.equals(id)','NativeImageLoader.load(image,imageUrl','row.isClickable()', 'IMPORTANT_FOR_ACCESSIBILITY_NO','setMaxLines(3)', 'weak', '"Indisponible"'):
   self.assertIn(value.lower(),src.lower())
  self.assertIn('if("detail".equals(screen)&&playlist(uri))',src)
  self.assertIn('if("settings".equals(screen))',src)
  self.assertIn('GlassLikedMotion.bind(a,content,screen,uri)',src)
  helper=self.get(refresh.HELPER)
  self.assertNotIn('setOnClickListener',helper);self.assertNotIn('playFromUri',helper)
  self.assertNotIn('\ufffd',helper)
 def test_liked_motion_is_scoped_and_does_not_handle_input_or_playback(self):
  src=(HERE/'glass-refresh/GlassLikedMotion.java').read_text()
  helper=self.get(refresh.MOTION)
  for unsafe in ('setOnClickListener','setOnTouchListener','playFromUri','fetch(', 'java.net.', 'Runtime.getRuntime'):
   self.assertNotIn(unsafe,src);self.assertNotIn(unsafe,helper)
  for required in ('GlassScreenStyler.liked(uri)','ValueAnimator.areAnimatorsEnabled()',
                   'removeOnScrollChangedListener','removeOnGlobalLayoutListener','onViewDetachedFromWindow',
                   'getLocalVisibleRect','while(lo<hi)','getScrollY()'):
   self.assertIn(required,src)
 def test_home_retry_register_does_not_alias_receiver(self):
  text=self.get(refresh.RETRY);start=text.index('.method public final run()V');run=text[start:text.index('.end method',start)]
  self.assertIn('.locals 5',run)
  self.assertIn('const-wide/16 v3, 0x190',run)
  self.assertIn('invoke-virtual {v2, p0, v3, v4}',run)
 def test_no_change_to_protected_and_input(self):
  if not INPUT:self.skipTest('input only')
  orig=(ROOT/refresh.ACTIVITY).read_text();new=self.get(refresh.ACTIVITY)
  for name in ('onNativeLibraryClick','onNativePlayPauseClick','onNativeBackClick','setNativeScreen'):
   self.assertEqual(body(orig,name),body(new,name))
  # applyNativeUiData: only the identical-Home early exit (1022321) may be added; nothing else changes.
  skip='''    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeHomeJson:Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :glass_home_changed
    return-void
    :glass_home_changed
'''
  data=body(new,'applyNativeUiData');self.assertEqual(data.count(skip),1)
  self.assertEqual(body(orig,'applyNativeUiData'),data.replace(skip,''))
if __name__=='__main__':unittest.main(verbosity=2)
