#!/usr/bin/env python3
"""Structural checks for the pinned, disposable native Glass adaptation."""
import importlib.util,os,re,shutil,tempfile,unittest,xml.etree.ElementTree as ET
from pathlib import Path
here=Path(__file__).resolve().parent;source=Path(os.environ['MELODIX_PREVIEW_ROOT'])
spec=importlib.util.spec_from_file_location('patch',here/'apply_glass_native_ui.py');patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
A='{http://schemas.android.com/apk/res/android}'
def tree(s):return ET.fromstring(s)
def indexed(s):
 return {e.get(A+'id'):(e.tag,e.get(A+'onClick')) for e in tree(s).iter() if e.get(A+'id')}
def handlers(s):return sorted(e.get(A+'onClick') for e in tree(s).iter() if e.get(A+'onClick'))
def luminance(rgb):
 vals=[int(rgb[i:i+2],16)/255 for i in (0,2,4)]
 vals=[x/12.92 if x<=.04045 else ((x+.055)/1.055)**2.4 for x in vals]
 return sum(x*y for x,y in zip(vals,(.2126,.7152,.0722)))
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=Path(self.tmp.name)
  for name in patch.EXPECTED:
   target=self.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source/name,target)
 def test_all_inputs_are_pinned_and_tampered_base_rejected(self):
  for name in patch.EXPECTED:
   p=self.root/name;old=p.read_bytes();p.write_bytes(old+b'\n')
   with self.subTest(name=name),self.assertRaises(ValueError):patch.prepare(self.root)
   p.write_bytes(old)
 def test_main_view_ids_callbacks_and_player_widgets_preserved_both_sizes(self):
  data=patch.prepare(self.root)
  for name in ('res/layout/activity_main.xml','res/layout-w600dp/activity_main.xml'):
   old=(self.root/name).read_text();new=data[name];before=indexed(old);after=indexed(new)
   self.assertEqual(set(before),set(after));self.assertEqual(handlers(old),handlers(new))
   for key,(tag,click) in before.items():
    self.assertEqual(click,after[key][1]);self.assertEqual(after[key][0], 'ScrollView' if key=='@id/nativePlayerPanel' else tag)
   root=tree(new);player=next(e for e in root.iter() if e.get(A+'id')=='@id/nativePlayerPanel')
   self.assertEqual(player.tag,'ScrollView');self.assertEqual(player.get(A+'layout_height'),'0.0dip');self.assertEqual(player.get(A+'layout_weight'),'1.0');self.assertEqual(len(player),1)
   ids={e.get(A+'id') for e in player.iter()};self.assertTrue({'@id/nativePlayerLargeArtwork','@id/nativePlayerLargePlayPauseButton','@id/nativePlayerProgress'}<=ids)
   search=next(e for e in root.iter() if e.get(A+'id')=='@id/nativeSearchInput');self.assertEqual(search.get(A+'textColor'),'#fff5f5fa');self.assertEqual(search.get(A+'background'),'@drawable/native_search_field')
   for key in ('nativePlayerLargePlayPauseButton','nativePlayPauseButton'):
    e=next(e for e in root.iter() if e.get(A+'id')=='@id/'+key);self.assertEqual(e.get(A+'tint'),'#ffffffff')
   tab=next(e for e in root.iter() if e.get(A+'id')=='@id/nativeTabBar');self.assertEqual(tab.get(A+'layout_height'),'64.0dip');self.assertEqual(tab.get(A+'background'),'@drawable/native_nav_item')
 def test_glass_drawables_are_resolved_and_gradient_labels_readable(self):
  data=patch.prepare(self.root)
  for name in patch.EXPECTED:
   if name.startswith('res/drawable/'):
    e=tree(data[name]);self.assertNotIn('@color/mel_',data[name]);self.assertNotIn('@dimen/mel_',data[name])
  for name in ('native_button_green','native_button_white'):
   s=data['res/drawable/'+name+'.xml'].lower();self.assertIn('#7c3aed',s);self.assertIn('#db2777',s)
  for color in ('7c3aed','db2777'):
   self.assertGreaterEqual(1.05/(luminance(color)+.05),4.5)
 def test_native_navigation_and_data_paths_are_not_replaced(self):
  data=patch.prepare(self.root);name='smali/com/melodix/music/MainActivity.smali';old=(self.root/name).read_text();new=data[name]
  for method in ('setNativeScreen','openNativeRow','applyNativeUiData','onNativeHomeClick','onNativeLibraryClick','onNativeSearchClick','updateNativePlayer'):
   def body(s):
    start=s.index('.method public final '+method+'(');return s[start:s.index('.end method',start)+len('.end method')]
   self.assertEqual(body(old),body(new),method)
  chips=new[new.index('.method public final styleNativeLibraryChips('):];chips=chips[:chips.index('.end method')]
  self.assertIn('move-result-object v7',chips);self.assertNotIn('move-result-object p1',chips);self.assertIn('native_category_chip',chips);self.assertIn('native_button_green',chips)
  self.assertIn('native_tab_ripple',new);self.assertIn('invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V',new)
 def test_drawable_guards_allow_non_null_views_and_real_resources(self):
  rows=patch.prepare(self.root)['smali/com/melodix/music/NativeUiRowFactory.smali']
  for method in ('applyDrawableBackground','applyDrawableImage'):
   part=rows[rows.index('.method public static '+method+'('):];part=part[:part.index('.end method')]
   guards=re.findall(r'if-(eqz|nez) (p0|p1|p2|v0), :([a-z_0-9]+)',part)
   self.assertEqual([(op,reg) for op,reg,_ in guards],[('eqz','p0'),('eqz','p1'),('eqz','p2'),('eqz','v0')])
   self.assertEqual(len({label for _,_,label in guards}),1)
   def reaches_set(context,view,name,identifier):
    regs=dict(p0=context,p1=view,p2=name,v0=identifier)
    return not any((regs[reg]==0 if op=='eqz' else regs[reg]!=0) for op,reg,_ in guards)
   self.assertTrue(reaches_set(1,1,1,123))
   for i in range(4):
    args=[1,1,1,123];args[i]=0;self.assertFalse(reaches_set(*args))
   self.assertIn('->setBackgroundResource(I)V' if method.endswith('Background') else '->setImageResource(I)V',part)
 def test_second_application_is_rejected(self):
  data=patch.prepare(self.root)
  for name,text in data.items():(self.root/name).write_text(text,encoding='utf8')
  with self.assertRaises(ValueError):patch.prepare(self.root)
if __name__=='__main__':unittest.main(verbosity=2)
