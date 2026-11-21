#!/usr/bin/env python3
"""Experimental native Glass skin for the disposable d0f206b Preview only.

All inputs are checked before any write. The historical data, login and routing
are deliberately untouched. This candidate is not wired into the APK workflow.
"""
import hashlib
from pathlib import Path
import sys

EXPECTED = {
    'res/layout/activity_main.xml': 'e81d1063a91eae951610679e123a0dff305ad99c7d59c2ca7d8d5a6616aa6896',
    'res/drawable/native_shell_background.xml': 'd55f81135c3a2011d3ca9f1122815644799ed98e43e28cff1d9df53fd42d3404',
    'res/drawable/native_mini_player_bg.xml': '7435ff82040e682838aba3ba706252fd68297ecaa21088846c790758a28b3c97',
    'res/drawable/native_player_background.xml': '3a591353c9cadd7e98e415810a3e41599be9df97331bea5432541c3d534df734',
    'res/drawable/native_button_dark.xml': 'dac579a34ece11887195bb9c50e1cdc20de2d1bd9eb7605bcebd223c01ddc177',
    'res/drawable/native_button_green.xml': 'bddae661704b5780ae25165ea570768edf37e095fb5496d283d1551615a3aee2',
    'res/drawable/native_row_ripple.xml': 'c7e7d04e42d37fea50a0af992697685dcdab5817dbd9a1ed1282e7407a451bda',
    'res/drawable/native_nav_item.xml': 'a06eb2ee2349c5a0c404a4413db2fce45e986335c3e121d78ea6d4400a973bbd',
    'smali/com/melodix/music/NativeImageLoader.smali': '00dbc319618ee92d2e87c1508c9166c5424189bb89343fdb4a93a6b695db30f8',
    'smali/com/melodix/music/NativeUiRowFactory.smali': '385dfff595be307aa8c185f1d763abe1d3d9a4942764d8be6f73338d181488c9',
}
XML = '<?xml version="1.0" encoding="utf-8"?>\n'
NS = 'xmlns:android="http://schemas.android.com/apk/res/android"'
SHELL = XML + f'''<layer-list {NS}>
    <item><shape><solid android:color="#ff100b1b" /></shape></item>
    <item android:gravity="top|left" android:width="720dp" android:height="720dp"><shape><gradient android:type="radial" android:gradientRadius="360dp" android:centerX="0.0" android:centerY="0.0" android:startColor="#7b6d28a9" android:endColor="#00000000" /></shape></item>
    <item android:gravity="center_vertical|right" android:width="720dp" android:height="720dp"><shape><gradient android:type="radial" android:gradientRadius="360dp" android:centerX="1.0" android:centerY="0.5" android:startColor="#604a247e" android:endColor="#00000000" /></shape></item>
    <item android:gravity="bottom|left" android:width="720dp" android:height="720dp"><shape><gradient android:type="radial" android:gradientRadius="360dp" android:centerX="0.0" android:centerY="1.0" android:startColor="#536e205b" android:endColor="#00000000" /></shape></item>
</layer-list>
'''
def surface(radius, fill='#302c2041'):
    return XML + f'''<layer-list {NS}>
    <item><shape><solid android:color="{fill}" /><corners android:radius="{radius}dp" /><stroke android:width="1dp" android:color="#38ffffff" /></shape></item>
    <item><shape><gradient android:angle="270" android:startColor="#20ffffff" android:endColor="#00ffffff" /><corners android:radius="{radius}dp" /></shape></item>
</layer-list>
'''
def shape(color):
    return XML + f'<shape {NS} android:shape="oval"><solid android:color="{color}" /></shape>\n'

def replace_once(text, old, new, name):
    if text.count(old) != 1:
        raise ValueError(f'unexpected {name}: found {text.count(old)} matches')
    return text.replace(old, new, 1)

def prepare(root):
    files = {}
    for name, expected in EXPECTED.items():
        content = (root / name).read_bytes()
        if hashlib.sha256(content).hexdigest() != expected:
            raise ValueError(f'unexpected historical file: {name}')
        files[name] = content.decode('utf-8')
    layout = files['res/layout/activity_main.xml']
    layout = replace_once(layout, '''        <View
            android:background="#1fffffff"
            android:layout_width="fill_parent"
            android:layout_height="1.0dip" />''', '''        <View
            android:visibility="gone"
            android:layout_width="fill_parent"
            android:layout_height="1.0dip" />''', 'tab divider')
    layout = replace_once(layout, '''            android:id="@id/nativeTabBar"
            android:orientation="horizontal"
            android:gravity="center"
            android:paddingTop="6.0dip"
            android:paddingBottom="4.0dip"
            android:background="#ff181818"
            android:layout_width="fill_parent"
            android:layout_height="70.0dip">''', '''            android:id="@id/nativeTabBar"
            android:orientation="horizontal"
            android:gravity="center"
            android:paddingTop="6.0dip"
            android:paddingBottom="4.0dip"
            android:background="@drawable/native_nav_item"
            android:layout_marginLeft="12.0dip"
            android:layout_marginRight="12.0dip"
            android:layout_marginBottom="8.0dip"
            android:layout_width="fill_parent"
            android:layout_height="70.0dip">''', 'tab bar')
    # Only native colors change; no IDs, handlers, view hierarchy or data sources.
    start = layout.index('        android:id="@id/nativeRoot"')
    end = layout.index('    <ImageButton\n        android:id="@id/btnSettings"')
    before, native, after = layout[:start], layout[start:end], layout[end:]
    native = native.replace('#ff1ed760', '#ffa78bfa')
    files['res/layout/activity_main.xml'] = before + native + after
    files['res/drawable/native_shell_background.xml'] = SHELL
    files['res/drawable/native_player_background.xml'] = SHELL
    files['res/drawable/native_mini_player_bg.xml'] = surface(18, '#70403055')
    files['res/drawable/native_nav_item.xml'] = surface(25, '#70403055')
    files['res/drawable/native_button_dark.xml'] = shape('#704f3b65')
    files['res/drawable/native_button_green.xml'] = shape('#ffa78bfa')
    files['res/drawable/native_row_ripple.xml'] = XML + f'''<ripple {NS} android:color="#30ffffff">
    <item><shape><solid android:color="#12ffffff" /><corners android:radius="14dp" /><stroke android:width="1dp" android:color="#1effffff" /></shape></item>
    <item android:id="@android:id/mask"><shape><solid android:color="#ffffffff" /><corners android:radius="14dp" /></shape></item>
</ripple>
'''
    image = 'smali/com/melodix/music/NativeImageLoader.smali'
    files[image] = replace_once(files[image], '''    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :clear_native_image''', '''    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :clear_native_image''', 'image URL guard')
    rows = 'smali/com/melodix/music/NativeUiRowFactory.smali'
    files[rows] = replace_once(files[rows], '''    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :native_row_text_column''', '''    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_text_column''', 'row artwork guard')
    return files

def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_native_candidate.py DISPOSABLE_HISTORICAL_PROJECT')
    root = Path(sys.argv[1])
    try:
        files = prepare(root)
    except (ValueError, OSError) as exc:
        raise SystemExit(str(exc)) from exc
    for name, text in files.items():
        (root / name).write_text(text, encoding='utf-8')
    print(f'Applied experimental native skin to {len(files)} files in {root}')

if __name__ == '__main__':
    main()
