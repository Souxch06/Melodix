#!/usr/bin/env python3
"""Check patch inputs and semantics in source or apktool-decoded output.

These branch simulations inspect Smali; they do not execute Android/ART.
"""
import hashlib,importlib.util,os,re,shutil,sys,tempfile,unittest
from pathlib import Path
here=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('patch',here/'apply_native_navigation_access.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
def method(s,name):
 m=re.search(r'^\.method [^\n]*\b'+re.escape(name)+r'\([^\n]*\n([\s\S]*?)^\.end method',s,re.M)
 if not m:raise AssertionError('missing method '+name)
 return m.group(1)
def allows(s,reg,result,action,value):
 m=re.search(r'invoke-virtual \{'+reg+r'\}, Ljava/lang/String;->isEmpty\(\)Z\s+move-result '+result+r'\s+if-(eqz|nez) '+result+r', :(\w+)',s)
 if not m:raise AssertionError('missing guard '+reg+' '+result)
 label=re.search(r'^\s*:'+m.group(2)+r'\s*$',s[m.end():],re.M)
 if not label or action not in s[m.end():m.end()+label.start()]:raise AssertionError('guard does not skip '+action)
 return not ((len(value)==0) if m.group(1)=='nez' else (len(value)!=0))
class Tests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.files=patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {name:(root/name).read_text() for name in patch.SHA}
 def test_pins(self):
  if not os.environ.get('MELODIX_PATCH_INPUT'):self.skipTest('source pin test')
  with tempfile.TemporaryDirectory() as tmp:
   dst=Path(tmp)
   for name in patch.SHA:
    p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/name,p)
   for name in patch.SHA:
    p=dst/name;old=p.read_bytes();p.write_bytes(old+b'\n')
    with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(dst)
    p.write_bytes(old)
 def test_click_guards(self):
  a=self.files['smali/com/melodix/music/MainActivity.smali'];r=self.files['smali/com/melodix/music/NativeUiRowFactory.smali'];s=self.files['smali/com/melodix/music/NativeSettingsRowFactory.smali']
  fixtures=[(method(a,'openNativeRow'),'p1','v0','window.__sfOpenCollection'),(method(r,'create'),'v8','v10','->setOnClickListener('),(method(r,'createPlaylistBanner'),'p4','v1','->setOnClickListener('),(method(s,'create'),'v7','v0','->setOnClickListener('),(method(s,'create'),'v9','v0','NativeImageLoader;->load'),(method(s,'create'),'v5','v0','Landroid/widget/TextView;->setText'),(method(a,'setNativeProfileImage'),'p1','v0','NativeImageLoader;->load'),(method(r,'create'),'v10','v11','StringBuilder;->append(Ljava/lang/String;)'),(method(r,'createPlaylistBanner'),'p3','v1','NativeImageLoader;->load')]
  for text,reg,result,action in fixtures:
   with self.subTest(reg=reg,action=action):
    self.assertTrue(allows(text,reg,result,action,'nonempty'));self.assertFalse(allows(text,reg,result,action,''))
 def test_settings_return_and_collection_wiring(self):
  a=self.files['smali/com/melodix/music/MainActivity.smali'];settings=method(a,'openNativeSettings');row=method(a,'openNativeRow');screen=method(a,'setNativeScreen');back=method(a,'onNativeBackClick')
  # Both arms of equals("settings"): already there returns; other screens save.
  self.assertRegex(settings,r'equals\(Ljava/lang/Object;\)Z\s+move-result v1\s+if-eqz v1, :\w+\s+return-void')
  for field in ['nativeReturnScreen','nativeReturnTitle','nativeReturnJson','nativeReturnExpectedId','nativeReturnSearch']:self.assertIn(field,settings)
  for marker in ['window.__sfToggleSpotifySetting','window.__sfOpenCollection','window.__sfNativeOpenUri','nativeExpectedId']:self.assertIn(marker,row)
  self.assertIn('window.__sfCancelPendingCollection',screen);self.assertIn('setNativeScreen',back)
 def test_real_detail_payload_keeps_media_browser_fields_and_native_fields(self):
  bridge=self.files['assets/spotify_bridge.js'];self.assertIn('nativeCallbackId || parentId',bridge);self.assertIn("title: item.title || item.name || '', uri: item.uri || item.id || ''",bridge)
if __name__=='__main__':unittest.main(verbosity=2)
