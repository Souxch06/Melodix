#!/usr/bin/env python3
"""Post-compile resource/Smali sanity checks (not an Android visual test)."""
from pathlib import Path
import re,sys,xml.etree.ElementTree as ET
root=Path(sys.argv[1]);A='{http://schemas.android.com/apk/res/android}'
for layout in ('layout','layout-w600dp'):
 xml=ET.parse(root/'res'/layout/'activity_main.xml');nodes=list(xml.iter())
 player=next(x for x in nodes if x.get(A+'id')=='@id/nativePlayerPanel');assert player.tag=='ScrollView' and len(player)==1
 for name in ('nativePlayerLargeArtwork','nativePlayerLargePlayPauseButton','nativePlayerProgress'):
  assert any(x.get(A+'id')=='@id/'+name for x in player.iter())
 search=next(x for x in nodes if x.get(A+'id')=='@id/nativeSearchInput');assert search.get(A+'textColor').lower()=='#fff5f5fa'
 tabs=[next(x for x in nodes if x.get(A+'id')=='@id/'+n) for n in ('nativeHomeTab','nativeSearchTab','nativeLibraryTab')]
 assert [x.get(A+'onClick') for x in tabs]==['onNativeHomeClick','onNativeSearchClick','onNativeLibraryClick']
for n in ('native_nav_item','native_search_field','native_category_chip','native_button_white','native_button_green','native_shell_background','native_row_ripple','native_player_background','native_mini_player_bg','native_button_icon','native_tab_selected'):
 ET.parse(root/'res/drawable'/(n+'.xml'))
a=(root/'smali/com/melodix/music/MainActivity.smali').read_text();m=a[a.index('.method public final styleNativeTab('):];m=m[:m.index('.end method')]
# Active tab: own pill drawable (white since 1022333), inactive tabs keep the ripple.
assert ('native_button_green' in m or 'native_tab_selected' in m) and 'native_tab_ripple' in m and 'setBackgroundResource(I)V' in m
m=a[a.index('.method public final styleNativeLibraryChips('):];m=m[:m.index('.end method')]
assert '.locals 8' in m and 'move-result-object p1' not in m and 'native_category_chip' in m
rows=(root/'smali/com/melodix/music/NativeUiRowFactory.smali').read_text()
for method in ('applyDrawableBackground','applyDrawableImage'):
 m=rows[rows.index('.method public static '+method+'('):];m=m[:m.index('.end method')]
 guards=re.findall(r'if-(eqz|nez) (p0|p1|p2|v0), :[\w]+',m)
 assert guards==[('eqz','p0'),('eqz','p1'),('eqz','p2'),('eqz','v0')]
print('Decoded Glass: resource XML, navigation backgrounds, player hierarchy and callbacks present')
