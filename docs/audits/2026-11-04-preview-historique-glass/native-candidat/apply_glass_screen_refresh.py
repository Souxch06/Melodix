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
MOTION='smali/com/melodix/music/GlassLikedMotion.smali'
MOTION_SOURCE_SHA='c19746d98c553b28168b03263a6749da44e83a4345ccec810a26d620cff616d5'
MOTION_HELPER_SHA='461d0e2653f730d7002a6421a813525975bc7b091d4ffef57e7e83758badd4d4'
RETRY='smali/com/melodix/music/NativeHomeRetryRunnable.smali'
RETRY_SHA='95c78f85877e64c390743dcb77fcd4ff98541638fad8c8d3c85904ef3fd5b703'
EXPECTED='197e84fa4374e28dccad1ea0ef7b58f085c5230167237edbe81d4a9bd4cfe6d8'
SOURCE_SHA='51fb2f02fa2f0aee266f1031bcff484b3b045df71eb5486acaa643b54bbe1a17'
HELPER_SHA='8c854929bba3648b5d955a288c0f340c8d88d1a9a5d06b3af777bd569b3e3897'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def replace(s,a,b):
    if s.count(a)!=1:raise ValueError('unexpected anchor '+repr(a[:100]))
    return s.replace(a,b,1)
def method(s,name):
    i=s.index('.method public final '+name+'(');j=s.index('.end method',i)+len('.end method');return i,j,s[i:j]
def prepare(root):
    root=Path(root);src=HERE/'glass-refresh/GlassScreenStyler.java';helper=HERE/'glass-refresh/smali/GlassScreenStyler.smali'
    if sha(root/ACTIVITY)!=EXPECTED or sha(root/RETRY)!=RETRY_SHA:raise ValueError('unexpected native input')
    if sha(src)!=SOURCE_SHA or sha(helper)!=HELPER_SHA:raise ValueError('refresh helper not regenerated')
    motion_src=HERE/'glass-refresh/GlassLikedMotion.java';motion=HERE/'glass-refresh/smali/GlassLikedMotion.smali'
    if sha(motion_src)!=MOTION_SOURCE_SHA or sha(motion)!=MOTION_HELPER_SHA:raise ValueError('motion helper not regenerated')
    if (root/HELPER).exists() or (root/MOTION).exists():raise ValueError('refresh helper already present')
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
    # v3/v4 are a wide delay. With .locals 4, p0 aliases v4 and ART
    # rejects run(): p0 is overwritten by the high half of the delay.
    retry=(root/RETRY).read_text(encoding='utf-8')
    retry=replace(retry, '.method public final run()V\n    .locals 4', '.method public final run()V\n    .locals 5')
    return {ACTIVITY:s,RETRY:retry,HELPER:helper.read_text(encoding='utf-8'),MOTION:motion.read_text(encoding='utf-8')}
def main():
    ap=argparse.ArgumentParser();ap.add_argument('root',type=Path);args=ap.parse_args()
    for name,data in prepare(args.root).items():
        p=args.root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(data,encoding='utf-8')
    print('Applied settings and playlist Glass visual refresh')
if __name__=='__main__':main()
