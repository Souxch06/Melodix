#!/usr/bin/env python3
"""Lot 1 follow-up: native heading insets, player artist display, root Back.

Only existing display data, no network, playlist fetching, auth or controls.
Inputs are the exact 9017 candidate after prior Lot 1 presentation patches.
"""
import hashlib
import sys
from pathlib import Path

EXPECTED={
 'assets/native_ui_shell.js':'e661438ed81119f2f057f186b85254c832e0d824586f86bee8e8ae60cb904609',
 'smali/com/melodix/music/MainActivity.smali':'78d143623f3a71bf32bb0f81534359d9fe3e5665cf5096da8ee7dcf86b62ebc2',
 'smali/com/melodix/music/NativeHomeShelfPreview.smali':'ddd4c952a6d955bead764499dd985f162eb61c7af253c61bb718fa0ec5193372',
 'smali/com/melodix/music/NativeHomeFeed.smali':'57193fb96d675c890e12c7f0e84e8a2cd5804751b659bcbeecb4bef5e1237d4e',
}
def replace(s, old, new):
 if s.count(old)!=1:raise ValueError('unexpected anchor '+repr(old[:100]))
 return s.replace(old,new,1)

def prepare(root):
 files={}
 for name,digest in EXPECTED.items():
  data=(root/name).read_bytes()
  if hashlib.sha256(data).hexdigest()!=digest:raise ValueError('unexpected input '+name)
  files[name]=data.decode('utf8')
 name='assets/native_ui_shell.js';s=files[name]
 s=replace(s,'    function readNowPlaying() {', '''    // Display-only memory: reuse an artist only for the same exact visible
    // track URI and title during a brief DOM refresh. Never fetch or persist.
    var lot1VisibleTrackKey = '';
    var lot1VisibleArtist = '';
    function readNowPlaying() {''')
 s=replace(s,'''            '[data-testid="context-item-info"] a[href*="/artist/"]'
        ];''','''            '[data-testid="context-item-info"] a[href*="/artist/"]',
            'a[href*="/artist/"]'
        ];''')
 s=replace(s,'''        var artist = bar ? textIn(bar, artistSelectors) : textOf(artistSelectors);
        var cover = bar ? imageIn(bar, coverSelectors) : imageOf(coverSelectors);''','''        var artist = bar ? textIn(bar, artistSelectors) : textOf(artistSelectors);
        // Only the current now-playing bar is a safe source for the fallback.
        // Never take an arbitrary artist link from playlist or page content.
        if (!bar) artist = textOf(artistSelectors.slice(0, -1));
        var trackLink = bar && bar.querySelector && bar.querySelector('a[href*="/track/"], a[href*="/episode/"]');
        var trackUri = trackLink ? spotifyResourceUri(trackLink.getAttribute('href') || '') : '';
        var key = /^spotify:(track|episode):[^:]+$/i.test(trackUri) && title ? trackUri + '\\u0000' + title : '';
        if (key && key === lot1VisibleTrackKey && !artist) artist = lot1VisibleArtist;
        else if (key && artist) { lot1VisibleTrackKey = key; lot1VisibleArtist = artist; }
        else if (!key || key !== lot1VisibleTrackKey) { lot1VisibleTrackKey = ''; lot1VisibleArtist = ''; }
        var cover = bar ? imageIn(bar, coverSelectors) : imageOf(coverSelectors);''')
 files[name]=s
 name='smali/com/melodix/music/NativeHomeShelfPreview.smali';s=files[name]
 s=replace(s,'''    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;''','''    # The 16dp margins already align the origin heading with the cards.
    const/4 v0, 0x0
    invoke-virtual {v1, v0, v3, v0, v3}, Landroid/view/View;->setPadding(IIII)V
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;''')
 files[name]=s
 name='smali/com/melodix/music/NativeHomeFeed.smali';s=files[name]
 s=replace(s,'''    if-eqz v11, :card
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :card''','''    if-eqz v11, :card
    # A padded content parent (settings) already supplies the side inset.
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I
    move-result v10
    if-eqz v10, :lot1_section_inset_done
    const/4 v10, 0x0
    invoke-virtual {v11}, Landroid/view/View;->getPaddingTop()I
    move-result v7
    invoke-virtual {v11}, Landroid/view/View;->getPaddingBottom()I
    move-result v9
    invoke-virtual {v11, v10, v7, v10, v9}, Landroid/view/View;->setPadding(IIII)V
    :lot1_section_inset_done
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :card''')
 files[name]=s
 name='smali/com/melodix/music/MainActivity.smali';s=files[name]
 s=replace(s,'''    const-string v0, "settings"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :not_handled
    :handle''','''    const-string v0, "settings"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :handle
    # At a visible native root, background the task rather than reloading
    # Spotify or finishing the Activity. Hidden WebView paths stay untouched.
    const-string v0, "home"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :background
    const-string v0, "search"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :background
    const-string v0, "library"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :not_handled
    :background
    const/4 v0, 0x1
    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z
    const/4 v0, 0x1
    return v0
    :handle''')
 files[name]=s
 return files

if __name__=='__main__':
 root=Path(sys.argv[1])
 for name,text in prepare(root).items():(root/name).write_text(text,encoding='utf8')
