#!/usr/bin/env python3
"""Visual-only Home and playlist polish after the 9015 candidate."""
from pathlib import Path
import hashlib,sys
EXPECTED={
 'smali/com/melodix/music/MainActivity.smali':'b36c5171d1550ea86eedd9cae5333c09401a16c4e9b2cc65a19d1251e9edab12',
 'smali/com/melodix/music/NativeHomeShelfPreview.smali':'688d84e647be4a54443272addae69501e8d140afe4e5882cee5142e469e50823',
}
DRAWABLES={
 'res/drawable/native_playlist_row_glass.xml':'''<?xml version="1.0" encoding="utf-8"?>
<ripple xmlns:android="http://schemas.android.com/apk/res/android" android:color="#407C3AED">
  <item><shape><solid android:color="#0DFFFFFF"/><stroke android:width="1dp" android:color="#18FFFFFF"/><corners android:radius="14dp"/></shape></item>
  <item android:id="@android:id/mask"><shape><solid android:color="#FFFFFFFF"/><corners android:radius="14dp"/></shape></item>
</ripple>
''',
 'res/drawable/native_playlist_heading_glass.xml':'''<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android">
  <gradient android:angle="0" android:startColor="#287C3AED" android:endColor="#13DB2777"/>
  <stroke android:width="1dp" android:color="#30A78BFA"/>
  <corners android:radius="14dp"/>
</shape>
''',
}
def replace(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:120]))
 return s.replace(a,b,1)
def prepare(root):
 files={}
 for name,sha in EXPECTED.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected input '+name)
  files[name]=raw.decode('utf8')
 for name,value in DRAWABLES.items():
  if (root/name).exists():raise ValueError('unexpected existing drawable '+name)
  files[name]=value
 a='smali/com/melodix/music/NativeHomeShelfPreview.smali';s=files[a]
 s=replace(s,'''    if-eqz v7, :no_header
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V''','''    if-eqz v7, :no_header
    invoke-static {p0, v7}, Lcom/melodix/music/NativeHomeShelfPreview;->styleShelfHeading(Landroid/content/Context;Landroid/widget/TextView;)V
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V''')
 s=replace(s,'''    if-eqz v6, :next
    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfPreview;->asCard''','''    if-eqz v6, :next
    const-string v7, "section"
    const-string v10, ""
    invoke-virtual {v5, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static {v6, v7}, Lcom/melodix/music/NativeHomeShelfPreview;->hideRepeatedSection(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    invoke-static {p0, v6}, Lcom/melodix/music/NativeHomeShelfPreview;->asCard''')
 # Scope both changes to the group pill method.
 start=s.index('.method private static groupLabel(');end=s.index('.end method',start)+len('.end method');old=s[start:end];new=old
 new=replace(new,'    const/high16 v0, 0x41600000','    const/high16 v0, 0x41400000')
 new=replace(new,'    const/16 v3, 0xa','    const/4 v3, 0x6')
 new=replace(new,'    const/4 v5, -0x1\n    const/4 v0, -0x2','    const/4 v5, -0x2\n    const/4 v0, -0x2')
 s=replace(s,old,new)
 start=s.index('.method private static asCard(');end=s.index('.end method',start)+len('.end method');old=s[start:end];new=old.replace('const/16 v2, 0x9c','const/16 v2, 0x90').replace('const/16 v5, 0x88','const/16 v5, 0x7c');s=replace(s,old,new)
 marker='# The factory\'s two children are the artwork and the text column.'
 helpers='''.method private static styleShelfHeading(Landroid/content/Context;Landroid/widget/TextView;)V
    .locals 4
    const/high16 v0, 0x41900000    # 18sp
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const/16 v0, 0x10
    invoke-static {p0, v0}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v0
    const/16 v1, 0xc
    invoke-static {p0, v1}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v1
    const/16 v2, 0x8
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v2
    invoke-virtual {p1, v0, v1, v0, v2}, Landroid/view/View;->setPadding(IIII)V
    return-void
.end method

.method private static hideRepeatedSection(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 4
    if-eqz p1, :home_subtitle_done
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :home_subtitle_done
    const/4 v0, 0x1
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    instance-of v2, v1, Landroid/widget/LinearLayout;
    if-eqz v2, :home_subtitle_done
    check-cast v1, Landroid/widget/LinearLayout;
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    instance-of v2, v1, Landroid/widget/TextView;
    if-eqz v2, :home_subtitle_done
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;
    move-result-object v2
    if-eqz v2, :home_subtitle_done
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :home_subtitle_done
    const/16 v0, 0x8
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
    :home_subtitle_done
    return-void
.end method

'''
 s=replace(s,marker,helpers+marker);files[a]=s
 a='smali/com/melodix/music/MainActivity.smali';s=files[a]
 start=s.index('.method public final styleNativeDetailRows(');end=s.index('.end method',start)+len('.end method');old=s[start:end];new=old
 new=replace(new,'0x40800000    # 4dp between tracks','0x40c00000    # 6dp between tracks')
 new=replace(new,'const-string v7, "native_mini_row_ripple"','const-string v7, "native_playlist_row_glass"')
 s=replace(s,old,new)
 old='''    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->styleNativeDetailRows(Landroid/view/ViewGroup;)V
    :native_rows_rendered'''
 new='''    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->styleNativeDetailRows(Landroid/view/ViewGroup;)V
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->addNativePlaylistHeading(Landroid/view/ViewGroup;)V
    :native_rows_rendered'''
 s=replace(s,old,new)
 marker='.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V'
 helper='''.method public final addNativePlaylistHeading(Landroid/view/ViewGroup;)V
    .locals 7
    # Only identify playlists from the already selected URI, never infer
    # playlist metadata or count from individual track artwork.
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    if-eqz v0, :native_playlist_heading_done
    const-string v1, ":playlist:"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-nez v2, :native_playlist_heading_make
    const-string v1, "/playlist/"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :native_playlist_heading_done
    :native_playlist_heading_make
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    instance-of v2, v1, Landroid/view/ViewGroup;
    if-eqz v2, :native_playlist_heading_done
    check-cast v1, Landroid/view/ViewGroup;
    new-instance v2, Landroid/widget/TextView;
    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    const-string v3, "Titres de la playlist"
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v3, 0x41600000    # 14sp
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V
    const v3, 0xffeee9ff
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v3, 0x0
    const/4 v4, 0x1
    invoke-virtual {v2, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v3
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F
    const/high16 v4, 0x41600000    # 14dp horizontal
    mul-float/2addr v4, v3
    invoke-static {v4}, Ljava/lang/Math;->round(F)I
    move-result v4
    const/high16 v5, 0x41200000    # 10dp vertical
    mul-float/2addr v5, v3
    invoke-static {v5}, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-virtual {v2, v4, v5, v4, v5}, Landroid/view/View;->setPadding(IIII)V
    const-string v3, "native_playlist_heading_glass"
    invoke-static {p0, v2, v3}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, -0x1
    const/4 v6, -0x2
    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V
    :native_playlist_heading_done
    return-void
.end method

'''
 s=replace(s,marker,helper+marker);files[a]=s
 return files
if __name__=='__main__':
 root=Path(sys.argv[1]);files=prepare(root)
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied visual-only Home and playlist polish:',root)
