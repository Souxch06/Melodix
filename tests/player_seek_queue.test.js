'use strict';

// Player completion contracts: seek on the real engine, the "File d'attente /
// prochains titres" screen fed by real context data only, and the native
// transport controls (previous/next/shuffle/repeat, MediaSession actions).
// Nothing may simulate playback or invent queue entries.

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.join(__dirname, '..');
const read = (p) => fs.readFileSync(path.join(root, p), 'utf8');

const seek = read('smali/com/melodix/music/NativeSeekHandler.smali');
const activity = read('smali/com/melodix/music/MainActivity.smali');
const shell = read('assets/native_ui_shell.js');
const layout = read('res/layout/activity_main.xml');
const webService = read('smali/com/melodix/music/WebService.smali');
const mediaReceiver = read('smali/com/melodix/music/WebService$MediaActionReceiver.smali');

function sliceFunction(source, signature) {
    const start = source.indexOf(signature);
    assert.ok(start >= 0, `${signature} should exist`);
    let depth = 0;
    let started = false;
    for (let i = start; i < source.length; i += 1) {
        const char = source[i];
        if (char === '{') {
            depth += 1;
            started = true;
        } else if (char === '}') {
            depth -= 1;
            if (started && depth === 0) {
                const end = source.indexOf(';', i);
                assert.ok(end > i, `${signature} should end with a semicolon`);
                return source.slice(start, end + 1);
            }
        }
    }
    throw new Error(`${signature} is not terminated`);
}

function runRequestQueue(harness) {
    const fnSource = sliceFunction(shell, 'window.__sfRequestQueue = function');
    const context = {
        window: {
            AndBridge: harness.bridge,
            __sfCurrentTrackUris: harness.uris,
            __sfCurrentContextUri: harness.ctx,
            __sfMediaItemsCache: harness.cache
        },
        readNowPlaying: harness.readNowPlaying,
        isSessionBlockedByLogout: harness.blocked,
        JSON,
        Array,
        String
    };
    context.window.window = context.window;
    vm.runInNewContext(`this.__sfRequestQueue = ${fnSource.slice('window.__sfRequestQueue = '.length)};`, context);
    return { result: context.__sfRequestQueue(), pushed: harness.pushed };
}

function queueHarness(options = {}) {
    const pushed = [];
    return {
        pushed,
        bridge: {
            onNativeUiData(channel, payload) {
                pushed.push({ channel, payload: JSON.parse(payload) });
            }
        },
        uris: options.uris || [],
        ctx: options.ctx || null,
        cache: options.cache || new Map(),
        blocked: () => Boolean(options.blocked),
        readNowPlaying: () => options.now || { title: '', artist: '', cover: '', uri: '' }
    };
}

test('NativeSeekHandler seeks the real engine and never fakes progress', () => {
    assert.match(seek, /\.implements Landroid\/view\/View\$OnTouchListener;/);
    assert.match(seek, /window\.__sfSeekFraction/);
    assert.match(seek, /runNativeJavascript/);
    // fraction clamping: lower bound, upper bound
    assert.match(seek, /cmpl-float/);
    assert.match(seek, /cmpg-float/);
    assert.match(seek, /const\/high16 v2, 0x3f800000/);
    // guards and crash safety
    assert.match(seek, /if-eqz p1, :touch_unhandled/);
    assert.match(seek, /if-eqz p2, :touch_unhandled/);
    assert.match(seek, /NativeCrashGuard;->record/);
    // attached to the full player bar and the mini bar
    assert.match(seek, /const v1, 0x7f09023d/);
    assert.match(seek, /const v1, 0x7f09024d/);
    assert.match(seek, /setOnTouchListener/);
});

test('updateNativePlayer keeps both progress bars wired to the seek handler', () => {
    const start = activity.indexOf('.method public final updateNativePlayer');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    assert.match(body, /NativeSeekHandler;->attach\(Lcom\/melodix\/music\/MainActivity;\)V/);
});

test('the progress bars expose a real tap target without changing their look', () => {
    for (const id of ['nativePlayerProgress', 'nativeMiniProgress']) {
        const at = layout.indexOf(`android:id="@id/${id}"`);
        assert.ok(at >= 0, `${id} should exist`);
        const block = layout.slice(at, layout.indexOf('/>', at));
        assert.match(block, /android:paddingTop="\d+\.0dip"/);
        assert.match(block, /android:paddingBottom="\d+\.0dip"/);
    }
});

test('onNativeQueueClick shows an explicit loading state and requests the real queue', () => {
    const start = activity.indexOf('.method public final onNativeQueueClick');
    const body = activity.slice(start, activity.indexOf('.end method', start));
    assert.match(body, /const-string v0, "queue"/);
    assert.match(body, /setNativeScreen\(Ljava\/lang\/String;\)V/);
    assert.match(body, /Chargement de la file/);
    assert.match(body, /window\.__sfRequestQueue/);
    assert.match(body, /runNativeJavascript/);
    assert.match(body, /NativeCrashGuard;->record/);
    // re-entrant clicks are ignored while already on the queue screen
    assert.match(body, /:queue_save_return/);
});

test('queue replies paint only while the queue screen is current', () => {
    // label DEFINITIONS live alone on their line; references like
    // "if-eqz v1, :check_queue" must not be mistaken for them.
    const start = activity.indexOf('\n    :check_queue\n');
    assert.ok(start >= 0, 'the queue check label should be defined');
    const body = activity.slice(start, activity.indexOf('\n    :check_search\n', start));
    assert.match(body, /const-string v0, "queue"/);
    assert.match(body, /nativeCurrentScreen/);
    assert.match(body, /const-string v3, "queue"/);
    // late replies for another screen must be dropped, never painted
    assert.match(body, /if-eqz v4, :apply_done/);
    assert.match(body, /File d'attente/);
    assert.match(body, /renderNativeRows/);
});

test('the queue screen participates in back navigation like settings and detail', () => {
    const screenStart = activity.indexOf('.method public final setNativeScreen');
    const screenBody = activity.slice(screenStart, activity.indexOf('.end method', screenStart));
    const backChain = screenBody.slice(screenBody.indexOf(':native_back_check_settings'));
    assert.match(backChain, /const-string v0, "queue"/);
    assert.match(backChain, /:native_back_check_queue/);

    const backStart = activity.indexOf('.method public final handleNativeBack');
    const backBody = activity.slice(backStart, activity.indexOf('.end method', backStart));
    assert.match(backBody, /:native_back_check_queue/);
    const queueBranch = backBody.slice(backBody.indexOf(':native_back_check_queue'));
    assert.match(queueBranch, /onNativeBackClick/);
});

test('the queue rows are built from real context data and never invented', () => {
    // sources are the bridge-tracked context and metadata cache only
    assert.match(shell, /window\.__sfRequestQueue = function/);
    assert.match(shell, /__sfCurrentTrackUris/);
    assert.match(shell, /__sfMediaItemsCache/);
    // honest unavailable state instead of a fabricated queue
    assert.match(shell, /File indisponible/);
    assert.match(shell, /Lancez une lecture depuis une playlist ou un album/);
    assert.match(shell, /Piste non nommée/);
    // the now-playing uri comes from the real on-page track link
    assert.match(shell, /function readNowPlayingUri/);
    assert.match(shell, /spotify:track:/);
});

test('__sfRequestQueue lists the real current track then the real upcoming tracks', () => {
    const cache = new Map();
    cache.set('spotify:playlist:abc', [
        { id: 'spotify:track:one', name: 'Premier', artists: ['Alice'], image: 'i1' },
        { id: 'spotify:track:two', name: 'Second', artists: ['Bob', 'Carol'], image: 'i2' },
        { id: 'spotify:track:three', name: 'Troisième', artists: [], image: 'i3' }
    ]);
    const harness = queueHarness({
        uris: ['spotify:track:one', 'spotify:track:two', 'spotify:track:three'],
        ctx: 'spotify:playlist:abc',
        cache,
        now: { title: 'Premier', artist: 'Alice', cover: 'i1', uri: 'spotify:track:one' }
    });
    const { result, pushed } = runRequestQueue(harness);
    assert.equal(result, true);
    assert.equal(pushed.length, 1);
    assert.equal(pushed[0].channel, 'queue');
    const rows = pushed[0].payload;
    assert.equal(rows[0].section, 'En lecture');
    assert.equal(rows[0].title, 'Premier');
    assert.equal(rows[0].uri, 'spotify:track:one');
    const upcoming = rows.slice(1);
    assert.deepEqual(upcoming.map((r) => r.title), ['Second', 'Troisième']);
    assert.deepEqual(upcoming.map((r) => r.uri), ['spotify:track:two', 'spotify:track:three']);
    assert.equal(upcoming[0].subtitle, 'Bob, Carol');
    assert.equal(upcoming[1].subtitle, 'spotify:track:three');
});

test('__sfRequestQueue ends the list honestly when nothing follows', () => {
    const cache = new Map();
    cache.set('spotify:album:x', [{ id: 'spotify:track:only', name: 'Unique', artists: ['A'] }]);
    const harness = queueHarness({
        uris: ['spotify:track:only'],
        ctx: 'spotify:album:x',
        cache,
        now: { title: 'Unique', artist: 'A', cover: '', uri: 'spotify:track:only' }
    });
    const { pushed } = runRequestQueue(harness);
    const rows = pushed[0].payload;
    assert.equal(rows.length, 2);
    assert.equal(rows[1].title, 'Fin de la liste');
});

test('__sfRequestQueue reports an unavailable queue instead of fabricating one', () => {
    const harness = queueHarness({});
    const { result, pushed } = runRequestQueue(harness);
    assert.equal(result, true);
    const rows = pushed[0].payload;
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, 'File indisponible');
});

test('__sfRequestQueue stays silent on a logged-out session', () => {
    const harness = queueHarness({ blocked: true, uris: ['spotify:track:x'] });
    const { result, pushed } = runRequestQueue(harness);
    assert.equal(result, false);
    assert.equal(pushed.length, 0);
});

test('previous, next, shuffle and repeat buttons drive the real player controls', () => {
    for (const [method, marker] of [
        ['onNativePlayerPreviousClick', '__sfSkip(\\\'back\\\')'],
        ['onNativePlayerNextClick', '__sfSkip(\\\'forward\\\')'],
        ['onNativePlayerShuffleClick', '__sfToggleShuffle'],
        ['onNativePlayerRepeatClick', '__sfToggleRepeat']
    ]) {
        const start = activity.indexOf(`.method public final ${method}`);
        assert.ok(start >= 0, `${method} should exist`);
        const body = activity.slice(start, activity.indexOf('.end method', start));
        assert.ok(body.includes(marker), `${method} should call ${marker}`);
        // DOM fallback keeps the button functional without the shell helpers
        assert.match(body, /control-button/);
        assert.match(body, /runNativeJavascript/);
    }
});

test('the media notification and receiver expose the real transport actions', () => {
    for (const label of ['Previous', 'Play/Pause', 'Next']) {
        assert.ok(webService.includes(`const-string v7, "${label}"`) || webService.includes(`const-string v8, "${label}"`),
            `notification should carry ${label}`);
    }
    for (const action of ['SHUFFLE_ACTION', 'WIDGET_PREV', 'WIDGET_NEXT', 'WIDGET_PLAYPAUSE', 'ADDTOFAV_ACTION', 'REPEAT_ACTION', 'WIDGET_VOL_UP', 'WIDGET_VOL_DOWN']) {
        assert.ok(mediaReceiver.includes(`"${action}"`), `receiver should handle ${action}`);
    }
    assert.match(webService, /completeAndClearPendingResults/);
});
