#!/usr/bin/env python3
"""WIP: apply the Preview-only native player controller to the lot 1 candidate.

This patch touches no protected assets. Inputs are pinned to the published
follow-up candidate. It fails closed on any unexpected input or missing helper.
"""
import hashlib
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE / 'preview-player' / 'PreviewPlayerController.java'
EXPECTED = {
    'assets/native_ui_shell.js': '7b171ed4773c34571cd5bc4974f764d303edb300f49f13bbdf5f6f3940d84004',
    'smali/com/melodix/music/MainActivity.smali': 'dd14f96c2e3143b1e015e58a4c881911147e8312df1938a59e7ba3fa1b9a6f53',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali': '87af4ac75e344b84f94374db7b94018b524a9af981f2367f8a9631f8b1c8ed63',
}
SOURCE_SHA = 'd5314463593f83ea1b7bdcce9f24f18050bd3f4ddb066864a55a10675dc6a279'
HELPER_SHA = {
    'PreviewPlayerController$1.smali': '0aad79d348e0a7886a0a2e11646d4ca1b6b1a4c5c8eb4bf3e29c7d0feab89e54',
    'PreviewPlayerController$2.smali': '23aca4b26eeb9683bd9898bf059485ed8a75a391288752ee050c6922c65ab6d1',
    'PreviewPlayerController$3.smali': 'fdc41b1bbf98bff5b81b254ac3a0c833fbab8c01b57bb34ce2e069a2667c5678',
    'PreviewPlayerController.smali': 'fa7aed165c7a707d3bfc2f02b66c0b6370c607b7dca05d66acb0e8efd1672b14',
}

def replace(text, old, new):
    if text.count(old) != 1: raise ValueError('unexpected anchor ' + repr(old[:100]))
    return text.replace(old, new, 1)

def prepare(root):
    files = {}
    for path, digest in EXPECTED.items():
        data = (root / path).read_bytes()
        if hashlib.sha256(data).hexdigest() != digest: raise ValueError('unexpected input ' + path)
        files[path] = data.decode('utf8')
    if hashlib.sha256(SOURCE.read_bytes()).hexdigest() != SOURCE_SHA:
        raise ValueError('Java helper changed without regenerating smali')
    helpers = sorted((HERE / 'preview-player' / 'smali').glob('PreviewPlayerController*.smali'))
    if {p.name for p in helpers} != set(HELPER_SHA): raise ValueError('missing generated native controller')
    for p in helpers:
        if hashlib.sha256(p.read_bytes()).hexdigest() != HELPER_SHA[p.name]:
            raise ValueError('generated native controller digest mismatch: ' + p.name)
        dest = 'smali/com/melodix/music/' + p.name
        if (root / dest).exists(): raise ValueError('controller already exists')
        files[dest] = p.read_text()

    path = 'assets/native_ui_shell.js'; s = files[path]
    s = replace(s, '''            cover: cover || '',
            position: position > 0 ? Math.round(position) : 0,
            duration: duration > 0 ? Math.round(duration) : 0''', '''            cover: cover || '',
            position: position > 0 ? Math.round(position) : 0,
            duration: duration > 0 ? Math.round(duration) : 0,
            previewTrackUri: /^spotify:(?:track|episode):[a-z0-9]+$/i.test(trackUri) ? trackUri : '',
            previewPositionMs: isFinite(position) && position >= 0 ? Math.round(position * 1000) : -1,
            previewDurationMs: isFinite(duration) && duration > 0 ? Math.round(duration * 1000) : -1''')
    s = replace(s, '''    function playerPayload() {
        var info = readNowPlaying();
        return {''', '''    // Preview-only progress samples. No requests or persistent data. Advance
    // only after observing real motion, and freeze while position is unchanged.
    var previewLastTrack = '';
    var previewLastPosition = -1;
    var previewLastObservation = 0;
    function playerPayload() {
        var info = readNowPlaying();
        var playing = playbackSnapshot().playing;
        var at = window.performance && typeof window.performance.now === 'function' ? window.performance.now() : Date.now();
        var valid = !!info.previewTrackUri && info.previewDurationMs > 0 && info.previewPositionMs >= 0 && info.previewPositionMs <= info.previewDurationMs;
        var advancing = valid && playing && info.previewTrackUri === previewLastTrack &&
            previewLastPosition >= 0 && info.previewPositionMs > previewLastPosition &&
            at >= previewLastObservation && at - previewLastObservation <= 5000;
        previewLastTrack = valid ? info.previewTrackUri : '';
        previewLastPosition = valid ? info.previewPositionMs : -1;
        previewLastObservation = at;
        return {''')
    s = replace(s, '''            playing: playbackSnapshot().playing,
            position: info.position,
            duration: info.duration
        };
    }

    function publishPlayerState''', '''            playing: playing,
            position: info.position,
            duration: info.duration,
            previewTrackUri: info.previewTrackUri,
            previewPositionMs: info.previewPositionMs,
            previewDurationMs: info.previewDurationMs,
            previewProgressValid: valid,
            previewAdvancing: advancing
        };
    }

    function publishPlayerState''')
    s = replace(s, '''            payload.duration,
            Math.floor(payload.position / 5)
        ].join('|');''', '''            payload.duration,
            payload.previewTrackUri,
            Math.floor(payload.previewPositionMs / 1000),
            payload.previewProgressValid ? '1' : '0',
            payload.previewAdvancing ? '1' : '0'
        ].join('|');''')
    s = replace(s, '''    window.__sfTogglePlayback = function() {
        var playing = playbackSnapshot().playing;
        var target = !playing;
        markUserPlaybackIntent(target);''', '''    function previewCommandDispatched() {
        try {
            if (window.AndBridge && typeof window.AndBridge.onNativeUiData === 'function')
                window.AndBridge.onNativeUiData('preview-command', '');
        } catch (_) {}
    }
    window.__sfTogglePlayback = function(desired) {
        var playing = playbackSnapshot().playing;
        var target = typeof desired === 'boolean' ? desired : !playing;
        markUserPlaybackIntent(target);
        previewCommandDispatched();''')
    s = replace(s, '''        refreshPlayerSoon(350);
        refreshPlayerSoon(1400);
        return target;''', '''        publishPlayerState(true);
        return target;''')
    s = replace(s, '''        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        window.__sfUserRequestedPause = false;''', '''        var back = String(direction || '') === 'back' || String(direction || '') === 'previous';
        previewCommandDispatched();
        window.__sfUserRequestedPause = false;''')
    if s.count('                refreshPlayerSoon(600);') != 2: raise ValueError('unexpected skip refresh count')
    s = s.replace('                refreshPlayerSoon(600);', '                publishPlayerState(true);')
    s = replace(s, '''        refreshPlayerSoon(700);
        return false;''', '''        publishPlayerState(true);
        return false;''')
    s = replace(s, '''                if (control) refreshPlayerSoon(500);
            }, true);
        } catch (_) {}
    }

    function runUpdate()''', '''                if (control) publishPlayerState(true);
            }, true);
            ['playing', 'pause', 'waiting', 'seeking', 'seeked'].forEach(function(type) {
                document.addEventListener(type, function() { publishPlayerState(true); }, true);
            });
        } catch (_) {}
    }

    function runUpdate()''')
    files[path] = s

    path = 'smali/com/melodix/music/MainActivity.smali'; s = files[path]
    s = replace(s, '''.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0''', '''.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v1
    invoke-virtual {v1}, Lcom/melodix/music/PreviewPlayerController;->activityCreated()V''')
    s = replace(s, '''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    const-string v1, "detail"''', '''    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p1}, Lcom/melodix/music/PreviewPlayerController;->playlistOpened(Ljava/lang/String;)V
    const-string v1, "detail"''')
    s = replace(s, '''    if-lez v3, :preview_historical_feed
    return-void''', '''    if-lez v3, :preview_historical_feed
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {v0, v1, v2, p2}, Lcom/melodix/music/PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    return-void''')
    s = replace(s, '''    :native_rows_rendered
    return-void''', '''    :native_rows_rendered
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {v0, v1, v2, p2}, Lcom/melodix/music/PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    return-void''')
    s = replace(s, '.field private nativeBackStack:Ljava/util/ArrayDeque;\n', '.field private nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;\n.field private nativeBackStack:Ljava/util/ArrayDeque;\n')
    s = replace(s, '''.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :apply_done''', '''.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :apply_done
    const-string v0, "preview-command"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :preview_not_command
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->command()V
    return-void
    :preview_not_command''')
    s = replace(s, '''    :check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_home
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->updateNativePlayer(Ljava/lang/String;)V
    return-void''', '''    :check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_home
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->updateNativePlayer(Ljava/lang/String;)V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p2}, Lcom/melodix/music/PreviewPlayerController;->snapshot(Ljava/lang/String;)V
    return-void''')
    s = replace(s, '''.method public final onNativePlayPauseClick(Landroid/view/View;)V
    .locals 1

    # __sfTogglePlayback''', '''.method public final onNativePlayPauseClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerController;->tapPlayPause()I
    move-result v1
    if-ltz v1, :preview_legacy_toggle
    if-eqz v1, :preview_pause_command
    const-string v0, "(function(){var t=true;if(typeof window.__sfTogglePlayback=='function'){window.__sfTogglePlayback(t);return;}try{if(window.AndBridge)window.AndBridge.onNativeUiData('preview-command','');if(typeof window.__sfMarkUserPlaybackIntent=='function')window.__sfMarkUserPlaybackIntent(t);if(typeof window.actPlayPause=='function'){window.actPlayPause(t);return;}var b=document.querySelector('button[data-testid=control-button-playpause]')||window.pBtn;if(b)b.click();}catch(e){}})();"
    goto :preview_send_toggle
    :preview_pause_command
    const-string v0, "(function(){var t=false;if(typeof window.__sfTogglePlayback=='function'){window.__sfTogglePlayback(t);return;}try{if(window.AndBridge)window.AndBridge.onNativeUiData('preview-command','');if(typeof window.__sfMarkUserPlaybackIntent=='function')window.__sfMarkUserPlaybackIntent(t);if(typeof window.actPlayPause=='function'){window.actPlayPause(t);return;}var b=document.querySelector('button[data-testid=control-button-playpause]')||window.pBtn;if(b)b.click();}catch(e){}})();"
    :preview_send_toggle
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
    :preview_legacy_toggle
    # __sfTogglePlayback''')
    for method, kind in [('onNativePlayerPreviousClick', '0x2'), ('onNativePlayerNextClick', '0x3')]:
        old = '.method public final ' + method + '(Landroid/view/View;)V\n    .locals 1\n'
        new = '.method public final ' + method + '(Landroid/view/View;)V\n    .locals 2\n\n    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;\n    move-result-object v0\n    const/4 v1, ' + kind + '\n    invoke-virtual {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->begin(I)V\n'
        s = replace(s, old, new)
    s += '''\n.method public final previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    if-nez v0, :preview_player_return
    new-instance v0, Lcom/melodix/music/PreviewPlayerController;
    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerController;-><init>(Landroid/app/Activity;)V
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativePreviewPlayer:Lcom/melodix/music/PreviewPlayerController;
    :preview_player_return
    return-object v0
.end method

.method public final attachPreviewAbout(Landroid/view/View;)V
    .locals 1
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->previewPlayer()Lcom/melodix/music/PreviewPlayerController;
    move-result-object v0
    invoke-virtual {v0, p1}, Lcom/melodix/music/PreviewPlayerController;->attachAbout(Landroid/view/View;)V
    return-void
.end method
'''
    files[path] = s

    path = 'smali/com/melodix/music/NativeSettingsRowFactory.smali'; s = files[path]
    s = replace(s, '''    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V''', '''    new-instance v2, Landroid/widget/LinearLayout;
    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    # Discreet Preview-only diagnostic: long press the existing About row.
    const-string v10, "Melodix • Client Spotify Natif"
    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-eqz v10, :preview_not_about
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->attachPreviewAbout(Landroid/view/View;)V
    :preview_not_about
    const/4 v0, 0x0
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V''')
    files[path] = s
    return files

if __name__ == '__main__':
    root = Path(sys.argv[1]); files = prepare(root)
    for name, text in files.items():
        target = root / name; target.parent.mkdir(parents=True, exist_ok=True); target.write_text(text, encoding='utf8')
