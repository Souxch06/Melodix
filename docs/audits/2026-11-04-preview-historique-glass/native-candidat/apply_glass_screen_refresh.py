#!/usr/bin/env python3
"""Visual-only settings and playlist details after the Preview player patch.

Pinned inputs/helpers. No changes to bridge, retrieval, playback or navigation.
"""
import argparse
import hashlib
from pathlib import Path
HERE=Path(__file__).resolve().parent
ACTIVITY='smali/com/melodix/music/MainActivity.smali'
HELPER='smali/com/melodix/music/GlassScreenStyler.smali'
EXPECTED='01a66bb8c2da219a47dda338b620d93a48698d899bdfafec8d87364841b387dd'
SOURCE_SHA='1ad0da37b2964996f2efc4638ca9ab00c01624a56172b1559f466a3ae22b03f3'
HELPER_SHA='0fc8d76f46cf325fd7a980f7c7e237b66542634a134f3aacd20c1accbdb5c157'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def replace(s,a,b):
    if s.count(a)!=1:raise ValueError('unexpected anchor '+repr(a[:100]))
    return s.replace(a,b,1)
def method(s,name):
    i=s.index('.method public final '+name+'(');j=s.index('.end method',i)+len('.end method');return i,j,s[i:j]
def prepare(root):
    root=Path(root);src=HERE/'glass-refresh/GlassScreenStyler.java';helper=HERE/'glass-refresh/smali/GlassScreenStyler.smali'
    if sha(root/ACTIVITY)!=EXPECTED:raise ValueError('unexpected MainActivity input')
    if sha(src)!=SOURCE_SHA or sha(helper)!=HELPER_SHA:raise ValueError('refresh helper not regenerated')
    if (root/HELPER).exists():raise ValueError('refresh helper already present')
    s=(root/ACTIVITY).read_text(encoding='utf-8')
    a,b,old=method(s,'openNativeRow')
    new=replace(old,'''    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V''','''    # Retain only the selected collection's real, in-memory image metadata.
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    invoke-static {p0, p1, v0}, Lcom/melodix/music/GlassScreenStyler;->rememberSelection(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V''')
    s=s[:a]+new+s[b:]
    a,b,old=method(s,'addNativePlaylistHeading')
    new=replace(old,'''    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    const-string v3, "Titres de la playlist"''','''    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    const-string v3, "glass-old-playlist-heading"
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V
    const-string v3, "Titres de la playlist"''')
    s=s[:a]+new+s[b:]
    a,b,old=method(s,'renderNativeRows')
    decorate='''    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    iget-object v5, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    invoke-static {p0, v2, v1, v4, v5}, Lcom/melodix/music/GlassScreenStyler;->style(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
'''
    new=replace(old,'''    :native_rows_rendered
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()''','''    :native_rows_rendered
'''+decorate+'''    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()''')
    new=replace(new,'''    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    return-void''','''    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
'''+decorate+'''    return-void''')
    s=s[:a]+new+s[b:]
    return {ACTIVITY:s,HELPER:helper.read_text(encoding='utf-8')}
def main():
    ap=argparse.ArgumentParser();ap.add_argument('root',type=Path);args=ap.parse_args()
    for name,data in prepare(args.root).items():
        p=args.root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(data,encoding='utf-8')
    print('Applied settings and playlist Glass visual refresh')
if __name__=='__main__':main()
