#!/usr/bin/env python3
"""Inspect decoded dex and resources; no Android views are executed here."""
from pathlib import Path
import re
import sys
import xml.etree.ElementTree as ET

root = Path(sys.argv[1])
activity = (root/'smali/com/melodix/music/MainActivity.smali').read_text()
start=activity.index('.method public final renderNativeRows(')
end=activity.index('.end method', start)
body=activity[start:end]
assert re.search(r'nativeCurrentScreen:Ljava/lang/String;[\s\S]+?const-string v0, "Accueil"[\s\S]+?NativeHomeShelfPreview;->paint[\s\S]+?if-lez v3, :(\w+)[\s\S]+?:\1\s+invoke-static \{p0, v2, p2\}, Lcom/melodix/music/NativeHomeFeed;->paint', body)
renderer = (root/'smali/com/melodix/music/NativeHomeShelfPreview.smali').read_text()
assert 'NativeUiRowFactory;->create(' in renderer
assert 'Landroid/widget/HorizontalScrollView;-><init>' in renderer
assert 'Landroid/view/ViewGroup;->removeViewAt' in renderer
assert '.catch Ljava/lang/Throwable;' in renderer
android='{http://schemas.android.com/apk/res/android}'
phone=ET.parse(root/'res/layout/activity_main.xml').getroot()
wide=ET.parse(root/'res/layout-w600dp/activity_main.xml').getroot()
def get(root,id):
    return next(e for e in root.iter() if e.get(android+'id')=='@id/'+id)
assert get(phone,'nativeRoot').get(android+'fitsSystemWindows')=='true'
assert get(phone,'nativeTabBar').get(android+'layout_width')=='fill_parent'
assert get(wide,'nativeTabBar').get(android+'layout_width') in ('480.0dip','480.0dp')
assert get(wide,'nativeTabBar').get(android+'layout_gravity')=='center_horizontal'
print('Decoded APK: Home-only shelf path, fallback, factory and wide dock present')
