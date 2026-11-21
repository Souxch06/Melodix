#!/usr/bin/env python3
"""Preview-only native Back routing, keeping the inherited path when hidden."""
import hashlib
import sys
from pathlib import Path

ACTIVITY = 'smali/com/melodix/music/MainActivity.smali'
DISPATCHER = 'smali/androidx/activity/b.smali'
EXPECTED = {
    ACTIVITY: '9435c9791670851aec72d2efc5e99518b90169b50726a87c629f06bd1b458462',
    DISPATCHER: '229800f86572b62c01b2eae60f7fb0f6dec97433da4f47d04fde2264c98ee88b',
}
FIELDS = [('nativeCurrentScreen','nativeReturnScreen'), ('nativeCurrentTitle','nativeReturnTitle'),
          ('nativeCurrentJson','nativeReturnJson'), ('nativeExpectedId','nativeReturnExpectedId'),
          ('nativeExpectedSearch','nativeReturnSearch')]


def replace(s, old, new):
    if s.count(old) != 1: raise ValueError('expected exact block: ' + repr(old[:120]))
    return s.replace(old, new, 1)


def back_helpers():
    s = '''.method private final lot1ClearBack()V
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeBackStack:Ljava/util/ArrayDeque;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V
    :done
    return-void
.end method

.method private final lot1PushBack()V
    .locals 4
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeBackStack:Ljava/util/ArrayDeque;
    if-nez v0, :ready
    new-instance v0, Ljava/util/ArrayDeque;
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeBackStack:Ljava/util/ArrayDeque;
    :ready
    const/4 v1, 0x5
    new-array v1, v1, [Ljava/lang/String;
'''
    for i,(current,_) in enumerate(FIELDS):
        s += f'''    const/4 v2, 0x{i:x}
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->{current}:Ljava/lang/String;
    aput-object v3, v1, v2
'''
    s += '''    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V
    return-void
.end method

.method private final lot1PopBack()V
    .locals 4
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeBackStack:Ljava/util/ArrayDeque;
    if-eqz v0, :empty
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z
    move-result v1
    if-nez v1, :empty
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
'''
    for i,(_,saved) in enumerate(FIELDS):
        s += f'''    const/4 v2, 0x{i:x}
    aget-object v3, v1, v2
    iput-object v3, p0, Lcom/melodix/music/MainActivity;->{saved}:Ljava/lang/String;
'''
    s += '''    return-void
    :empty
    const/4 v0, 0x0
'''
    for _,saved in FIELDS:
        s += f'    iput-object v0, p0, Lcom/melodix/music/MainActivity;->{saved}:Ljava/lang/String;\n'
    s += '''    return-void
.end method

# Called only for the activity's existing AndroidX callback. When the native
# shell is not shown, the original WebView/login Back path stays untouched.
.method public final tryLot1NativeBack()Z
    .locals 4
    const v0, 0x7f09022f
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :not_handled
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :not_handled
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v1, :not_handled
    const-string v0, "detail"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :handle
    const-string v0, "player"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :handle
    const-string v0, "settings"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :not_handled
    :handle
    const/4 v0, 0x0
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->onNativeBackClick(Landroid/view/View;)V
    const/4 v0, 0x1
    return v0
    :not_handled
    const/4 v0, 0x0
    return v0
.end method

'''
    return s


def prepare(root):
    files = {}
    for name, digest in EXPECTED.items():
        raw=(root/name).read_bytes()
        if hashlib.sha256(raw).hexdigest()!=digest: raise ValueError('unexpected input '+name)
        files[name]=raw.decode('utf8')
    s=files[ACTIVITY]
    s=replace(s, '.field private nativeCurrentScreen:Ljava/lang/String;', '.field private nativeBackStack:Ljava/util/ArrayDeque;\n.field private nativeCurrentScreen:Ljava/lang/String;')
    s=replace(s, '.method public final onNativeBackClick(', back_helpers()+'.method public final onNativeBackClick(')
    s=replace(s, '.method public final onNativeBackClick(Landroid/view/View;)V\n    .locals 6\n', '.method public final onNativeBackClick(Landroid/view/View;)V\n    .locals 6\n    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PopBack()V\n')
    s=replace(s, '''    :native_back_render
    invoke-virtual {p0, v2, v4}, Lcom/melodix/music/MainActivity;->renderNativeRows''', '''    :native_back_render
    # The full player already has its own panel. Rendering rows here would
    # reveal a second weighted panel underneath it.
    const-string v5, "player"
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :lot1_back_render_rows
    return-void
    :lot1_back_render_rows
    invoke-virtual {p0, v2, v4}, Lcom/melodix/music/MainActivity;->renderNativeRows''')
    for label in (':try_start_home', ':try_start_search', ':try_start_lib'):
        s=replace(s, '    '+label+'\n', '    '+label+'\n    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1ClearBack()V\n')
    s=replace(s, '    if-eqz v1, :native_open_single\n\n    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:', '    if-eqz v1, :native_open_single\n\n    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V\n    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:')
    s=replace(s, '    :native_settings_show\n    const-string v0, "settings"', '    :native_settings_show\n    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V\n    const-string v0, "settings"')
    s=replace(s, '    :save_player_return_state\n    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:', '    :save_player_return_state\n    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V\n    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:')
    files[ACTIVITY]=s
    s=files[DISPATCHER]
    s=replace(s, '''    packed-switch p0, :pswitch_data_0

    .line 38''', '''    packed-switch p0, :pswitch_data_0

    # Only the MainActivity callback's default branch can consume native Back.
    # Every other callback and a hidden native shell use the original path.
    iget-object v0, v1, Lr70;->e:Ljava/lang/Object;
    instance-of v2, v0, Lcom/melodix/music/MainActivity;
    if-eqz v2, :lot1_original_back
    check-cast v0, Lcom/melodix/music/MainActivity;
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->tryLot1NativeBack()Z
    move-result v2
    if-eqz v2, :lot1_original_back
    return-void
    :lot1_original_back
    .line 38''')
    files[DISPATCHER]=s
    return files


if __name__=='__main__':
    root=Path(sys.argv[1])
    for name,text in prepare(root).items(): (root/name).write_text(text,encoding='utf8')
