#!/usr/bin/env python3
"""Assemble a TEST-ONLY Activity containing exact production invalidator methods.

The rest of the Activity/bridge/Picasso is deliberately stubbed; never evidence
of the real shell, Spotify session or production bridge. Output only in argv[1].
"""
import pathlib, re, sys

root = pathlib.Path(__file__).resolve().parent.parent
out = pathlib.Path(sys.argv[1]) / 'com/melodix/music'
out.mkdir(parents=True, exist_ok=True)
main = (root / 'smali/com/melodix/music/MainActivity.smali').read_text()

def method(name):
    match = re.search(r'^\.method public final ' + re.escape(name) + r'\(\)V\n[\s\S]*?^\.end method$', main, re.M)
    if not match: raise RuntimeError('missing method ' + name)
    return match.group(0)

fields = ['nativeCurrentScreen','nativeCurrentTitle','nativeCurrentJson','nativeExpectedId','nativeExpectedSearch',
          'nativeReturnScreen','nativeReturnTitle','nativeReturnJson','nativeReturnExpectedId','nativeReturnSearch',
          'nativeHasTrack','melodixWebHomeActive','nativeSettingsLoading','nativeSettingsReadyGeneration',
          'nativeSettingsGeneration','nativeSessionUnproven','nativeHomeCardsAttached','nativeHomeStatusAttached',
          'nativeHomeSessionUnprovenStatusAttached','nativeHomeContentReady','nativeHomeVisibilityDiagnosticReported',
          'nativeHomeFirstCard','nativeHomeStatusView']
decls=[]
for name in fields:
    match=re.search(r'^\.field [^\n]*\b'+name+r':[^\n]+$',main,re.M)
    if not match: raise RuntimeError('missing field '+name)
    decls.append(match.group(0))
init='''\n.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method\n'''
def stub(name, signature):
    return '.method public final '+name+signature+'\n    .locals 0\n    return-void\n.end method\n'
def count(name):
    return '.method public final '+name+'(Ljava/lang/String;Ljava/lang/String;)V\n    .locals 1\n    sget v0, Lcom/melodix/music/MainActivity;->received:I\n    add-int/lit8 v0, v0, 0x1\n    sput v0, Lcom/melodix/music/MainActivity;->received:I\n    return-void\n.end method\n'
content='.class public final Lcom/melodix/music/MainActivity;\n.super Landroid/app/Activity;\n'+ '\n'.join(decls)+'\n.field public static received:I\n'+init+method('invalidateNativePrivateUi')+'\n'+method('beginNativeHomeRender')+'\n'
content += count('applyNativeUiData')+count('renderNativeRows')
for name,sig in [('showNativeUi','()V'),('setNativeScreen','(Ljava/lang/String;)V'),('activateNativeUiRoute','(Ljava/lang/String;)V'),('setMelodixHomeVisibility','(ZZ)V')]: content+=stub(name,sig)
(out/'MainActivity.smali').write_text(content)
for name in ['NativePrivateUiReset','NativeUiUpdateRunnable']:
    (out/(name+'.smali')).write_text((root/'smali/com/melodix/music'/(name+'.smali')).read_text())
(out/'NativeSessionGate.smali').write_text('''.class public final Lcom/melodix/music/NativeSessionGate;
.super Ljava/lang/Object;
.field public static volatile state:I
.field public static volatile generation:I
.field public static volatile privateUiEpoch:I
''')
(out/'NativePlayerTint.smali').write_text('''.class public final Lcom/melodix/music/NativePlayerTint;
.super Ljava/lang/Object;
.method public static reset(Landroid/widget/ImageView;)V
    .locals 0
    return-void
.end method
''')
for name in ['NativeCrashGuard','StartupDiagnosticOverlay']:
    methods=['diagLine','appendDiagnosticLine']
    (out/(name+'.smali')).write_text('.class public final Lcom/melodix/music/'+name+';\n.super Ljava/lang/Object;\n'+''.join('.method public static '+m+'(Ljava/lang/String;)V\n    .locals 0\n    return-void\n.end method\n' for m in methods))
