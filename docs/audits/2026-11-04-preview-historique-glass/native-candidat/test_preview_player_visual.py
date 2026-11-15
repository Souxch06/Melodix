#!/usr/bin/env python3
"""Layout invariants only; not rendering, gestures, audio or accessibility on device."""
import os,xml.etree.ElementTree as ET
from pathlib import Path
root=Path(os.environ['MELODIX_PREVIEW_ROOT']);prior=Path(os.environ['MELODIX_PREVIEW_VISUAL_PRIOR'])
A='{http://schemas.android.com/apk/res/android}'
for name in ['assets/native_ui_shell.js','smali/com/melodix/music/MainActivity.smali',
             *['smali/com/melodix/music/PreviewPlayerController'+x+'.smali' for x in ('','$1','$2','$3','$4','$5')]]:
    assert (root/name).read_bytes()==(prior/name).read_bytes(),name
for folder in ('layout','layout-w600dp','layout-land','layout-w600dp-land'):
    x=ET.parse(root/'res'/folder/'activity_main.xml').getroot()
    panel=next(n for n in x.iter() if n.get(A+'id')=='@id/nativePlayerPanel')
    by_id={n.get(A+'id'):n for n in panel.iter() if n.get(A+'id')}
    progress=by_id['@id/nativePlayerProgress']
    assert progress.tag=='SeekBar' and progress.get(A+'max')=='1000'
    assert progress.get(A+'progressDrawable')=='@drawable/widget_progress_drawable'
    assert progress.get(A+'progressTint')=='@null' and progress.get(A+'progressBackgroundTint')=='@null'
    for n in ('nativePlayerShuffleButton','nativePlayerRepeatButton'):
        assert by_id['@id/'+n].get(A+'visibility')=='gone'
    for n,fn in [('nativePlayerPreviousButton','onNativePlayerPreviousClick'),('nativePlayerNextButton','onNativePlayerNextClick'),('nativePlayerLargePlayPauseButton','onNativePlayPauseClick')]:
        node=by_id['@id/'+n];assert node.get(A+'onClick')==fn and node.get(A+'contentDescription')
    assert any(n.tag=='ImageButton' and n.get(A+'onClick')=='onNativeBackClick' and n.get(A+'contentDescription')=='Réduire le lecteur' for n in panel.iter())
    assert not any(n.get(A+'onClick') not in (None,'onNativeBackClick','onNativePlayerPreviousClick','onNativePlayerNextClick','onNativePlayPauseClick','onNativePlayerShuffleClick','onNativePlayerRepeatClick') for n in panel.iter())
    card=next(n for n in panel.iter() if n.tag.endswith('CardView'))
    assert card.get('{http://schemas.android.com/apk/res-auto}cardCornerRadius') in ('30.0dip','30.0dp')
    mini=next(n for n in x.iter() if n.get(A+'id')=='@id/nativeMiniProgress')
    assert mini.tag=='ProgressBar' and mini.get(A+'onClick') is None
    if '-land' in folder:
        assert any(n.tag=='LinearLayout' and n.get(A+'orientation')=='horizontal' and any(c.tag.endswith('ConstraintLayout') for c in n) for n in panel.iter())
print('Player layout structure, existing commands and playback bytes checked')
