#!/usr/bin/env python3
"""Optional Home shelf experiment, applied only on the prepared 9004 copy."""
import hashlib
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
EXPECTED_ACTIVITY = '12ec85bd184b98e6af3f7dafd49fc24b328f748ede5c5f5095f5457d8a3206ea'
EXPECTED_SKIN_LAYOUT = '358b6988dccffe1a24ede1a20708fb087b22e9d024ceb8df66b62790cf126fa3'
OLD = '''    check-cast v2, Landroid/widget/LinearLayout;
    invoke-static {p0, v2, p2}, Lcom/melodix/music/NativeHomeFeed;->paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I'''
NEW = '''    check-cast v2, Landroid/widget/LinearLayout;
    # Only Home uses the experimental cards. Other screens keep the old feed.
    const-string v0, "home"
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :preview_historical_feed
    const-string v0, "Accueil"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :preview_historical_feed
    invoke-static {p0, v2, p2}, Lcom/melodix/music/NativeHomeShelfPreview;->paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    move-result v3
    if-lez v3, :preview_historical_feed
    return-void
    :preview_historical_feed
    invoke-static {p0, v2, p2}, Lcom/melodix/music/NativeHomeFeed;->paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I'''

def digest(text):
    return hashlib.sha256(text.encode('utf8')).hexdigest()

def replace_once(text, old, new):
    if text.count(old) != 1:
        raise ValueError('unexpected input: expected one matching block')
    return text.replace(old, new, 1)

def prepare(root):
    activity_name = 'smali/com/melodix/music/MainActivity.smali'
    layout_name = 'res/layout/activity_main.xml'
    wide_name = 'res/layout-w600dp/activity_main.xml'
    renderer_name = 'smali/com/melodix/music/NativeHomeShelfPreview.smali'
    activity = (root/activity_name).read_text(encoding='utf8')
    normalized = activity.replace('com.melodix.music.preview.PIP_', 'com.melodix.music.PIP_')
    if digest(normalized) != EXPECTED_ACTIVITY:
        raise ValueError('unexpected historical MainActivity')
    layout = (root/layout_name).read_text(encoding='utf8')
    if digest(layout) != EXPECTED_SKIN_LAYOUT:
        raise ValueError('expected the checked 9004 native layout')
    if (root/wide_name).exists() or (root/renderer_name).exists():
        raise ValueError('unexpected existing wide layout or renderer')
    activity = replace_once(activity, OLD, NEW)
    # Let the platform account for transparent status/navigation bars.
    layout = replace_once(layout, '        android:fitsSystemWindows="false"', '        android:fitsSystemWindows="true"')
    dock = '''            android:layout_marginBottom="8.0dip"
            android:layout_width="fill_parent"
            android:layout_height="70.0dip">'''
    wide_dock = '''            android:layout_marginBottom="8.0dip"
            android:layout_gravity="center_horizontal"
            android:layout_width="480.0dip"
            android:layout_height="70.0dip">'''
    wide = replace_once(layout, dock, wide_dock)
    return {activity_name: activity, layout_name: layout, wide_name: wide,
            renderer_name: (HERE/'NativeHomeShelfPreview.smali').read_text(encoding='utf8')}

def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_home_shelves.py DISPOSABLE_PREVIEW_PROJECT')
    root = Path(sys.argv[1])
    try:
        files = prepare(root)
    except (OSError, ValueError) as exc:
        raise SystemExit(str(exc)) from exc
    for name, text in files.items():
        target = root/name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf8')
    print('Applied experimental Home shelves and wide dock:', root)

if __name__ == '__main__':
    main()
