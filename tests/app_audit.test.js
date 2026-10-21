const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.resolve(__dirname, '..');
const read = (relative) => fs.readFileSync(path.join(repo, relative), 'utf8');

test('every layout onClick has a MainActivity method', () => {
    const layout = read('res/layout/activity_main.xml');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const clicks = [...layout.matchAll(/android:onClick="([^"]+)"/g)].map((m) => m[1]);
    assert.ok(clicks.length >= 10, 'the shell should wire the header, tabs, player and library chips');
    for (const name of clicks) {
        assert.match(
            activity,
            new RegExp(`\\.method public final ${name}\\(Landroid/view/View;\\)V`),
            `${name} must exist on MainActivity`
        );
    }
});

test('Home is not wiped to an empty list when the Accueil tab is tapped', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const home = activity.match(/\.method public final onNativeHomeClick\(Landroid\/view\/View;\)V([\s\S]*?)\.end method/);
    assert.ok(home, 'home tab handler');
    assert.match(home[1], /NativeHomeCache;->restore/);
    assert.doesNotMatch(home[1], /const-string v2, "\[\]"/);
    assert.match(home[1], /__sfNativeRequestHome/);
});

test('opening settings does not call equals on a null screen and is guarded', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const fade = activity.match(
        /iget-object v1, p0, Lcom\/melodix\/music\/MainActivity;->nativeCurrentScreen:Ljava\/lang\/String;[\s\S]{0,180}invoke-virtual \{v1, p1\}, Ljava\/lang\/String;->equals/
    );
    assert.ok(fade, 'setNativeScreen compares the current destination');
    assert.match(fade[0], /if-eqz v1, :native_fade_flag/);
    assert.doesNotMatch(fade[0], /if-nez v1, :native_fade_flag/);

    const settings = activity.match(/\.method public final openNativeSettings\(\)V([\s\S]*?)\.end method/);
    assert.ok(settings);
    assert.match(settings[1], /\.catch Ljava\/lang\/Throwable;/);
    assert.match(settings[1], /__sfRequestSpotifySettings/);
});

test('the settings control is a centered ImageView, not a misaligned drawableTop', () => {
    const layout = read('res/layout/activity_main.xml');
    assert.match(
        layout,
        /android:src="@drawable\/native_nav_settings"[\s\S]{0,400}android:scaleType="centerInside"[\s\S]{0,400}android:onClick="onNativeSettingsClick"/
    );
    assert.doesNotMatch(layout, /drawableTop="@drawable\/native_nav_settings"/);
    assert.doesNotMatch(layout, /Loading your music/);
    const vector = read('res/drawable/native_nav_settings.xml');
    assert.match(vector, /android:viewportWidth="24/);
});

test('null object checks in new helpers skip when the reference is missing', () => {
    const cache = read('smali/com/melodix/music/NativeHomeCache.smali');
    assert.match(cache, /if-eqz p0, :done/);
    assert.doesNotMatch(cache, /if-nez p0, :done/);
    assert.match(cache, /spotify:collection:tracks/);
    assert.match(read('smali/com/melodix/music/NativeHomePaint.smali'), /spotify:collection:tracks/);

    const empty = read('smali/com/melodix/music/NativeEmptyState.smali');
    assert.match(empty, /if-eqz p0, :done/);
    assert.match(empty, /if-eqz v2, :fill/);

    const recheck = read('smali/com/melodix/music/NativeRecheckClickListener.smali');
    assert.match(recheck, /if-eqz v0, :done/);

    const guard = read('smali/com/melodix/music/NativeCrashGuard.smali');
    const install = guard.match(/\.method public static install\(Landroid\/content\/Context;\)V([\s\S]*?)\.end method/);
    assert.ok(install);
    assert.match(install[1], /if-eqz p0, :done/);
});

test('the shell still covers the WebView and reveals itself without JS', () => {
    const layout = read('res/layout/activity_main.xml');
    const nativeRoot = layout.indexOf('android:id="@id/nativeRoot"');
    const webView = layout.indexOf('WebView');
    assert.ok(nativeRoot > webView);
    assert.match(layout.slice(nativeRoot, nativeRoot + 900), /android:visibility="visible"/);

    const activity = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(activity, /postNativeUiReady\(\)V/);
    assert.match(activity, /maybeRevealNativeUi/);
    const c91 = read('smali/c91.smali');
    assert.match(c91, /maybeRevealNativeUi/);
});

test('home JS never replaces a painted feed with an empty list', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /if \(rows\.length === 0\) \{/);
    assert.match(shell, /spotify:collection:tracks/);
    assert.match(shell, /nativeScreenForPath\(\) === 'home'/);
});

test('Home shelves render when the content container exists', () => {
    const shelf = read('smali/com/melodix/music/NativeHomeShelfRenderer.smali');
    assert.match(shelf, /if-eqz v13, :shelf_done/);
    assert.doesNotMatch(shelf, /if-nez v13, :shelf_done/);
    assert.match(shelf, /if-eqz v5, :shelf_next/);
});

test('home always has a Java paint path that does not depend on JSON shelves', () => {
    const paint = read('smali/com/melodix/music/NativeHomePaint.smali');
    assert.match(paint, /\.method public static seed/);
    assert.match(paint, /Titres lik/);
    const cache = read('smali/com/melodix/music/NativeHomeCache.smali');
    assert.match(cache, /renderNativeRows/);
    assert.doesNotMatch(cache, /NativeHomePaint;->seed/);
    const search = read('smali/com/melodix/music/MainActivity.smali');
    const click = search.match(/\.method public final onNativeSearchClick\(Landroid\/view\/View;\)V([\s\S]*?)\.end method/);
    assert.ok(click);
    assert.doesNotMatch(click[1], /const\/16 v1, 0x8[\s\S]*nativeRows/);
});

test('resume hides splash without wiping Home over Search', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const reveal = activity.match(/\.method public final revealNativeIfReady\(\)V([\s\S]*?)\.end method/);
    assert.ok(reveal);
    assert.doesNotMatch(reveal[1], /showNativeUi/);
    assert.doesNotMatch(reveal[1], /NativeHomeCache;->restore/);
    assert.match(reveal[1], /AppSingleton;->l:Z/);
});

test('tab icons get an explicit compound drawable size', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const style = activity.match(/\.method public final styleNativeTab[\s\S]*?\.end method/);
    assert.ok(style);
    assert.match(style[0], /setCompoundDrawables/);
    assert.match(style[0], /setBounds/);
});
