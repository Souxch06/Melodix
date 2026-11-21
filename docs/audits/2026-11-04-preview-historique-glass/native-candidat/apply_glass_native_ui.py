#!/usr/bin/env python3
"""Adapt reference Glass surfaces to the historical native shell, without swapping logic."""
from pathlib import Path
import hashlib,re,sys,xml.etree.ElementTree as ET
HERE=Path(__file__).resolve().parent
EXPECTED = {
 'res/layout/activity_main.xml': '083070c5c0bed306a0d3529056027128bd26207d912fc86c5e729e6aeed48dd8',
 'res/layout-w600dp/activity_main.xml': '4f4d0c7440a5d73e1861b7663a54bede5f340c3607e0fb4ca54849b9c70203e8',
 'smali/com/melodix/music/MainActivity.smali': 'f898898e1907aca095df343c7d8b587bfc66926b887d7be56044735dc7583720',
 'smali/com/melodix/music/NativeSettingsRowFactory.smali': 'd5e0993b6af90026ec0ccb804403ba59ac87fe26c33c73dd0a8d031d946b521f',
 'smali/com/melodix/music/NativeUiRowFactory.smali': '31ba7381d66d8cd9b2657107b0799a1ee0e49ac6eaf7b98983593b55098c9100',
 'res/drawable/native_button_icon.xml': '6072d1ef2251c9265b9fefb69be57214aafe6ef323fcb334e0000a257d3564b2',
 'res/drawable/native_button_dark.xml': '898906daed054ebadc67dae683fe85c40c30ec496fffe0e9be09d862b4b65704',
 'res/drawable/native_button_green.xml': 'd00943eae17693182e167ff418d91de7b1594caed45da3f57e242971a275a312',
 'res/drawable/native_button_white.xml': '17997174e4dce0809824a2b54a932f28a530856db74adf985913fdcd7b12d93f',
 'res/drawable/native_category_chip.xml': '195197084c53af1cf114534d67a1667d5bdebf14f384c1154159ace23a254035',
 'res/drawable/native_mini_player_bg.xml': '58c00351af04605e6034ce64c70e2489d681f46ba936a71e51cb3b794e2a5a32',
 'res/drawable/native_mini_row_ripple.xml': '1186d136bbe89a07108952215d08a65e51a7c8d254f1b20a2a62ba2407f6decc',
 'res/drawable/native_player_background.xml': 'c120a887757327ae3d1dcc36aadc31251ffbd483dda44f42053ba2ad6a160f2d',
 'res/drawable/native_quick_tile.xml': '11c4ad073526fcc259e8488ff0e4303d5049feb819b4d2042bd4b46075c40563',
 'res/drawable/native_row_ripple.xml': 'cae17ba5d30eb00e0704b32e72ece1897dbd2b03e345d0e8b026d5a4164bd871',
 'res/drawable/native_search_field.xml': '4d47d362e688a0802f9eecc7ddde86a8b607cd5198d906b28c35cb35da167985',
 'res/drawable/native_shell_background.xml': 'c120a887757327ae3d1dcc36aadc31251ffbd483dda44f42053ba2ad6a160f2d',
 'res/drawable/native_nav_item.xml': '1eaf8bffc82a2cc6684ac251d14030c7784e4c616fdebddfdd7031998c94c664',
 'res/drawable/native_tab_ripple.xml': 'bbb1ae18a899db1e2e86df213eb9d39896ca461755d70434eb1149027fc017e7',
}
REFERENCE_SHA = {
 'colors.xml': '61e7a181fd6358d4786e55d5d233ac192a0b53925e43cdec57a4952f38e4504a',
 'mel_dimens.xml': '72482cdf2daeb2bacb01e7ee8e2f878aca47ddfca0a27f1dd1dd87084a3733f4',
 'native_button_dark.xml': 'f7bea6690e5345ef1021e44854c1800f53750a4a5e2ecf5cd5b8efd78aee5d76',
 'native_button_green.xml': '6a1c8d2186be544011ee91aa47e709fc44209b58f78dd6feab7c363a2acdeaab',
 'native_button_white.xml': '6b44ce444a440ace1678373ae9a93739b756df8b8dae2ba2df92d60b76b0c91f',
 'native_category_chip.xml': '03387087124af3c303b3cd65590df4110fc4e0ee7bb1ebee14a15ba106267f38',
 'native_glass_pill.xml': '03387087124af3c303b3cd65590df4110fc4e0ee7bb1ebee14a15ba106267f38',
 'native_glass_surface.xml': 'bd724bf299cc62201c8af39f5b85af2b1e8db15df4d890d95524c61e444261b5',
 'native_icon_glass.xml': '14657055fa2ef3d44c286733c649bafc203d1e205afd01c9a03493023376df4f',
 'native_mini_player_bg.xml': 'a1910cec49fc8ab967f0104b91999e3cbdb6c614a076d039e128de3551e12eb3',
 'native_mini_row_ripple.xml': '0950f2d1471a436bce4999a95b5d6ee22246058c8d5ce4eff85c0ef8394352db',
 'native_player_background.xml': '32d9b252d1ad109564cb8974b83a0b10fac17cfe960962490bff3598a503da90',
 'native_quick_tile.xml': 'c8a5e8c95f8beab7654086345ee6ab8ef21f3d0c2a45643edf4cf8fa3ae37241',
 'native_row_ripple.xml': 'ffb3904d052103111a7483db829b8cefcb581922e2b3689f5689f7f59cf82d4b',
 'native_search_field.xml': 'f8edcbe61be0e7b132d9b09b53a29cda7c145b966ad1bb38afc03dafa4463569',
 'native_shell_background.xml': 'c4d34cd53098fbce81b5de75282d4d1e2ab03242be445173757e677c0c8d1c85',
 'native_tab_active.xml': 'f5e1825f08ff633848153ee904e982fc116107a49136095f0a8c48adba6ac79a',
 'native_tab_ripple.xml': '882f925175693e27b66e1caeca30df79f910018c477e9ee48925196641b0fa81',
 'native_tabbar_glass.xml': '5d9ced0232f809a10c883915e12ac8fba669e41d7e1c700a09b912d0f2b4ef55',
}
def replace(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:100]))
 return s.replace(a,b,1)
def prepare(root):
 files={}
 for name,sha in EXPECTED.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected base: '+name)
  files[name]=raw.decode('utf8')
 ref={}
 for name,sha in REFERENCE_SHA.items():
  raw=(HERE/'glass-reference'/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected reference: '+name)
  ref[name]=raw.decode('utf8')
 colors={e.get('name'):e.text.strip() for e in ET.fromstring(ref['colors.xml']) if e.tag=='color' and e.text and e.text.strip().startswith('#')}
 dims={e.get('name'):e.text.strip() for e in ET.fromstring(ref['mel_dimens.xml']) if e.tag=='dimen' and e.text}
 def resolve(src):
  src=re.sub(r'@color/(mel_[\w]+)',lambda m:colors[m.group(1)],src)
  src=re.sub(r'@dimen/(mel_[\w]+)',lambda m:dims[m.group(1)],src)
  return src
 def drawable(name):
  s=resolve(ref[name+'.xml'])
  for inner in ('native_glass_pill','native_glass_surface','native_tab_active'):
   tag='<item android:drawable="@drawable/'+inner+'"/>'
   if tag in s:
    content=resolve(ref[inner+'.xml']).split('?>',1)[1].strip()
    s=s.replace(tag,'<item>'+content+'</item>')
  ET.fromstring(s)
  if re.search(r'@(color|dimen)/mel_',s):raise ValueError('missing token: '+name)
  return s
 for name in ('native_button_dark','native_button_green','native_button_white','native_category_chip','native_mini_player_bg','native_mini_row_ripple','native_player_background','native_quick_tile','native_row_ripple','native_search_field','native_shell_background','native_tab_ripple'):
  files['res/drawable/'+name+'.xml']=drawable(name)
 files['res/drawable/native_nav_item.xml']=drawable('native_tabbar_glass')
 files['res/drawable/native_button_icon.xml']=drawable('native_icon_glass')
 for name in ('res/layout/activity_main.xml','res/layout-w600dp/activity_main.xml'):
  s=files[name]
  # Match the reference dark search field and white controls, scoped to native views.
  start=s.index('        android:id="@id/nativeRoot"');end=s.index('    <ImageButton\n        android:id="@id/btnSettings"')
  pre,body,post=s[:start],s[start:end],s[end:]
  search_start=body.index('            <EditText\n                android:id="@id/nativeSearchInput"')
  search_end=body.index('        </LinearLayout>',search_start)
  search=body[search_start:search_end].replace('android:textColor="#ff121212"','android:textColor="#fff5f5fa"').replace('android:textColorHint="#ff777777"','android:textColorHint="#ffa1a1b5"').replace('android:tint="#ff121212"','android:tint="#ffffffff"')
  body=body[:search_start]+search+body[search_end:]
  for id in ('nativePlayerLargePlayPauseButton','nativePlayPauseButton'):
   pattern=r'(<ImageView\s+android:id="@id/'+id+r'"[\s\S]*?/>)'
   found=re.findall(pattern,body);assert len(found)==1,id
   body=replace(body,found[0],found[0].replace('android:tint="#ff121212"','android:tint="#ffffffff"'))
  # Header action sizes and labels remain attached to their existing callbacks.
  hdr=body.index('            <ImageView\n                android:id="@id/nativeBackButton"')
  hdrend=body.index('        </LinearLayout>',hdr)
  head=body[hdr:hdrend]
  head=head.replace('android:layout_width="40.0dip"\n                android:layout_height="40.0dip"\n                android:layout_marginRight="8.0dip"','android:layout_width="48.0dip"\n                android:layout_height="48.0dip"\n                android:layout_marginRight="8.0dip"')
  head=head.replace('android:layout_width="42.0dip"\n                android:layout_height="42.0dip"','android:layout_width="48.0dip"\n                android:layout_height="48.0dip"')
  head=head.replace('android:maxLines="1"\n                android:ellipsize="end"','android:maxLines="2"\n                android:ellipsize="end"',1)
  body=body[:hdr]+head+body[hdrend:]
  # 64dp glass bar and larger breathing room, preserving the centered tablet dock.
  startbar=body.index('        <LinearLayout\n            android:id="@id/nativeTabBar"')
  endbar=body.index('>',startbar)+1
  bar=body[startbar:endbar].replace('android:paddingTop="6.0dip"','android:paddingTop="4.0dip"').replace('android:paddingBottom="4.0dip"','android:paddingBottom="4.0dip"').replace('android:layout_marginLeft="12.0dip"','android:layout_marginLeft="16.0dip"').replace('android:layout_marginRight="12.0dip"','android:layout_marginRight="16.0dip"').replace('android:layout_marginBottom="8.0dip"','android:layout_marginBottom="10.0dip"').replace('android:layout_height="70.0dip"','android:layout_height="64.0dip"')
  body=body[:startbar]+bar+body[endbar:]
  # Full player becomes scrollable in short landscape windows without altering IDs or actions.
  marker='        <LinearLayout\n            android:id="@id/nativePlayerPanel"'
  body=replace(body,marker,'        <ScrollView\n            android:id="@id/nativePlayerPanel"')
  begin=body.index('        <ScrollView\n            android:id="@id/nativePlayerPanel"')
  mini=body.index('        <LinearLayout\n            android:id="@id/nativeMiniPlayerContainer"',begin)
  player=body[begin:mini]
  player=replace(player,'            android:orientation="vertical"\n            android:gravity="center"\n','            android:fillViewport="true"\n            android:overScrollMode="never"\n            android:scrollbars="none"\n')
  player=replace(player,'            android:layout_weight="1.0">\n','            android:layout_weight="1.0">\n            <LinearLayout android:orientation="vertical" android:gravity="center" android:layout_width="fill_parent" android:layout_height="wrap_content">\n')
  k=player.rfind('        </LinearLayout>');assert k>0
  player=player[:k]+player[k:].replace('        </LinearLayout>','            </LinearLayout>\n        </ScrollView>',1)
  body=body[:begin]+player+body[mini:]
  result=pre+body+post;ET.fromstring(result);files[name]=result
 # Style the active native tab with the reference gradient, leave event handlers untouched.
 name='smali/com/melodix/music/MainActivity.smali';s=files[name]
 s=replace(s,'''    if-eqz v0, :native_tab_inactive
    const v2, -0x1
    const v4, -0xe128a0
    goto :native_tab_apply

    :native_tab_inactive
    const v2, -0x4c4c4d
    const v4, -0x4c4c4d

    :native_tab_apply''','''    if-eqz v0, :native_tab_inactive
    const v2, -0x1
    const v4, -0x1
    const-string v7, "native_button_green"
    goto :native_tab_background

    :native_tab_inactive
    const v2, 0xffe6e6f2
    const v4, 0xffe6e6f2
    const-string v7, "native_tab_ripple"

    :native_tab_background
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const-string v5, "drawable"
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v3, v7, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v3
    if-eqz v3, :native_tab_apply
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    :native_tab_apply''')
 # Selected category uses the same gradient with white label; inactive glass.
 s=replace(s,'''    if-eqz v5, :chip_inactive
    const v4, 0xffa78bfa
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v6
    invoke-virtual {v3, v6}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    const v4, -0xededee
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V
    goto :chip_next

    :chip_inactive
    const/4 v4, 0x0
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    const v4, -0x1
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V
''','''    if-eqz v5, :chip_inactive
    const-string v4, "native_button_green"
    goto :chip_background

    :chip_inactive
    const-string v4, "native_category_chip"

    :chip_background
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
    const-string v6, "drawable"
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual {v5, v4, v6, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v4
    if-eqz v4, :chip_text
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V
    :chip_text
    const v4, -0x1
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V
''')
 # p1 must survive the loop: use an additional local for package name.
 s=replace(s,'.method public final styleNativeLibraryChips(Ljava/lang/String;)V\n    .locals 7', '.method public final styleNativeLibraryChips(Ljava/lang/String;)V\n    .locals 8')
 s=replace(s,'    move-result-object p1\n    invoke-virtual {v5, v4, v6, p1}, Landroid/content/res/Resources;->getIdentifier', '    move-result-object v7\n    invoke-virtual {v5, v4, v6, v7}, Landroid/content/res/Resources;->getIdentifier')
 files[name]=s
 for name in ('smali/com/melodix/music/NativeSettingsRowFactory.smali','smali/com/melodix/music/NativeUiRowFactory.smali'):
  s=files[name];assert s.count('-0xe128a0')==1
  files[name]=s.replace('-0xe128a0','0xffa78bfa')
 settings='smali/com/melodix/music/NativeSettingsRowFactory.smali'
 files[settings]=replace(files[settings], 'const v0, -0xe7e7e8\n    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V','const v0, 0xcc141222\n    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V')
 files[settings]=replace(files[settings], 'const v1, -0xd5d5d6\n    invoke-virtual {v3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V','const v1, 0x24ffffff\n    invoke-virtual {v3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V')
 rows='smali/com/melodix/music/NativeUiRowFactory.smali'
 files[rows]=replace(files[rows], 'const/4 v11, 0x4\n    invoke-static {p0, v11}, Lcom/melodix/music/NativeUiRowFactory;->dp', 'const/16 v11, 0x10\n    invoke-static {p0, v11}, Lcom/melodix/music/NativeUiRowFactory;->dp')
 # The historical helpers currently return for every non-null argument and
 # every existing resource ID. Correct those guards so card glass/placeholder
 # can actually be attached, without changing the row data or handlers.
 for method,label in (('applyDrawableBackground','background_done'),('applyDrawableImage','image_done')):
  s=files[rows];start=s.index('.method public static '+method+'(');end=s.index('.end method',start)
  block=s[start:end]
  for reg in ('p0','p1','p2','v0'):
   old='if-nez '+reg+', :'+label
   if block.count(old)!=1:raise ValueError('unexpected drawable guard: '+method+' '+reg)
   block=block.replace(old,'if-eqz '+reg+', :'+label)
  files[rows]=s[:start]+block+s[end:]
 return files
if __name__=='__main__':
 root=Path(sys.argv[1]);data=prepare(root)
 for name,text in data.items():(root/name).write_text(text,encoding='utf8')
 print('Applied native Glass adaptation to:',root)
