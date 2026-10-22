const assert = require('assert');
const fs = require('fs');
const path = require('path');
const { test } = require('node:test');

function read(rel) {
    return fs.readFileSync(path.join(__dirname, '..', rel), 'utf8');
}

test('expanding the mini player switches to the full player screen and records failures', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const expandAt = activity.indexOf('.method public final onNativePlayerExpandClick(Landroid/view/View;)V');
    const expand = activity.slice(expandAt, activity.indexOf('.end method', expandAt));
    assert.match(expand, /const-string v2, "player"/);
    assert.match(expand, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.match(expand, /:try_start_expand/);
    assert.match(expand, /NativeCrashGuard;->record/);
    assert.match(expand, /nativeReturnScreen/);
});

test('setNativeScreen shows the full player panel only on the player destination', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const screenAt = activity.indexOf('.method public final setNativeScreen(Ljava/lang/String;)V');
    const screen = activity.slice(screenAt, activity.indexOf('.end method', screenAt));
    assert.match(screen, /:native_full_player_panel/);
    assert.match(screen, /const v2, 0x7f09023a/);
    assert.match(screen, /if-eqz v1, :hide_native_full_player/);
    assert.match(screen, /if-nez v1, :hide_native_mini_player/);
    assert.match(screen, /const\/4 v0, 0x1/);
    assert.match(screen, /fadeNativeScreen/);
});

test('full player artwork flexes instead of a fixed 280dp square', () => {
    const layout = read('res/layout/activity_main.xml');
    const at = layout.indexOf('android:id="@id/nativePlayerPanel"');
    const panel = layout.slice(at, layout.indexOf('android:id="@id/nativeMiniPlayerContainer"'));
    assert.doesNotMatch(panel, /280\.0dip/);
    assert.match(panel, /android:layout_height="0\.0dip"/);
    assert.match(panel, /android:layout_weight="1\.0"/);
    assert.match(read('res/layout/activity_main.xml'), /android:animateLayoutChanges="true"/);
    assert.match(panel, /nativePlayerShuffleButton[\s\S]{0,500}48\.0dip/);
});

test('player updates catch any exception and load a bounded cover', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const at = activity.indexOf('.method public final updateNativePlayer(Ljava/lang/String;)V');
    const method = activity.slice(at, activity.indexOf('.end method', at));
    assert.match(method, /catch Ljava\/lang\/Exception;/);
    assert.doesNotMatch(method, /catch Lorg\/json\/JSONException;/);
    assert.match(method, /const\/16 v8, 0x140/);
    assert.doesNotMatch(method, /const\/16 v8, 0x2d0/);
    assert.match(method, /NativeCrashGuard;->record/);
});

test('opening then closing the player restores the previous native screen', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const backAt = activity.indexOf('.method public final onNativeBackClick(Landroid/view/View;)V');
    const back = activity.slice(backAt, activity.indexOf('.end method', backAt));
    assert.match(back, /nativeReturnScreen/);
    assert.match(back, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.match(back, /renderNativeRows/);
});
