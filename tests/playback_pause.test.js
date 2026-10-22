const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

const bridge = read('assets/spotify_bridge.js');
const activity = read('smali/com/melodix/music/MainActivity.smali');

function sliceBetween(source, startMarker, endMarker) {
    const start = source.indexOf(startMarker);
    assert.ok(start >= 0, `${startMarker} should exist`);
    const end = source.indexOf(endMarker, start);
    assert.ok(end >= 0, `${endMarker} should exist`);
    return source.slice(start, end + endMarker.length);
}

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

function buildPlayPauseHarness(options = {}) {
    const clicks = [];
    const timers = [];
    const button = {
        label: options.label || 'Pause',
        getAttribute(name) {
            return name === 'aria-label' ? this.label : null;
        },
        click() {
            clicks.push(this.label);
            this.label = /paus/i.test(this.label) ? 'Play' : 'Pause';
        }
    };

    const document = {
        visibilityState: options.visibilityState || 'visible',
        querySelector(selector) {
            return String(selector).includes('control-button-playpause') ? button : null;
        },
        querySelectorAll() {
            return options.media || [];
        },
        addEventListener() {}
    };

    const storage = new Map();
    const window = {
        playing: options.playing === undefined ? true : options.playing,
        track: options.track || 'Track A',
        localStorage: {
            getItem(key) {
                return storage.has(key) ? storage.get(key) : null;
            },
            setItem(key, value) {
                storage.set(key, String(value));
            },
            removeItem(key) {
                storage.delete(key);
            }
        },
        setInterval(fn, ms) {
            timers.push({ fn, ms });
            return timers.length;
        },
        clearInterval() {},
        setTimeout(fn) {
            timers.push({ fn, ms: 0, once: true });
            return timers.length;
        }
    };

    const media = options.media || [];
    const clock = { now: 1000000 };
    const dateStub = { now: () => clock.now };
    const sandbox = {
        window, document, console, Date: dateStub, Number, String, Boolean, Array, Math, JSON
    };
    vm.createContext(sandbox);

    const helpers = sliceBetween(bridge, '// >>> sf-pause-intent', '// <<< sf-pause-intent');
    const actPlayPause = sliceFunction(bridge, 'window.actPlayPause = function');
    const skipForward = sliceFunction(bridge, 'window.actSkipForward = function');
    const skipBack = sliceFunction(bridge, 'window.actSkipBack = function');
    vm.runInContext(
        `let reqPause = false;\nlet ulFlag = false;\n${helpers}\n${actPlayPause}\n${skipForward}\n${skipBack}`,
        sandbox
    );

    const runPauseHold = (rounds = 2) => {
        const hold = timers.filter((timer) => timer.ms === 300).pop();
        assert.ok(hold, 'the pause hold should be armed');
        for (let i = 0; i < rounds; i += 1) {
            clock.now += 500;
            hold.fn();
        }
    };

    return { window, button, clicks, sandbox, media, timers, storage, clock, runPauseHold };
}

test('pausing from the native shell records an explicit pause intent and clicks once', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true });

    harness.window.actPlayPause(false);

    assert.equal(harness.clicks.length, 1, 'a pause request should click the player exactly once');
    assert.equal(harness.button.label, 'Play');
    assert.equal(harness.window.__sfUserRequestedPause, true, 'the pause intent latch must be set');
});

test('repeating the pause request never toggles playback back on', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true });

    harness.window.actPlayPause(false);
    harness.window.actPlayPause(false);
    harness.window.actPlayPause(false);

    assert.equal(harness.clicks.length, 1, 'already paused: later pause requests must be no-ops');
    assert.equal(harness.button.label, 'Play');
    assert.equal(harness.window.__sfUserRequestedPause, true);
});

test('an explicit play request clears the pause intent', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true });

    harness.window.actPlayPause(false);
    assert.equal(harness.window.__sfUserRequestedPause, true);

    harness.window.actPlayPause(true);

    assert.equal(harness.clicks.length, 2);
    assert.equal(harness.button.label, 'Pause');
    assert.equal(harness.window.__sfUserRequestedPause, false);
    assert.equal(typeof harness.window.__sfLastPlayRequestAt, 'number');
});

test('the toggle entry point follows the DOM label instead of a stale playing flag', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: false });

    harness.window.actPlayPause();

    assert.equal(harness.clicks.length, 1, 'the DOM says playback is running, so the toggle pauses');
    assert.equal(harness.button.label, 'Play');
    assert.equal(harness.window.__sfUserRequestedPause, true);
});

test('a stale play label cannot turn a pause request into a no-op', () => {
    const harness = buildPlayPauseHarness({
        label: 'Play',
        playing: true,
        media: [{ tagName: 'AUDIO', paused: false, ended: false }]
    });

    assert.equal(harness.window.__sfGetPlaybackSnapshot().playing, true, 'a live audio element wins over the label');

    harness.window.actPlayPause(false);

    assert.equal(harness.clicks.length, 1, 'the pause must still reach the player');
    assert.equal(harness.window.__sfUserRequestedPause, true);
});

test('the legacy take-control auto-click on paused playback is gone', () => {
    assert.doesNotMatch(bridge, /encore-bright-accent-set/);
    assert.doesNotMatch(bridge, /li\[role=listitem\] div\[role=button\]/);
    assert.match(bridge, /take control[\s\S]*?intentionally inert/i);
});

test('automatic resume helpers respect the pause intent latch', () => {
    assert.match(bridge, /autoPlayMode === "permanent"[\s\S]{0,200}?__sfUserRequestedPause/);
    assert.match(bridge, /autoPlayMode === "onetime"[\s\S]{0,200}?__sfUserRequestedPause/);
    assert.match(bridge, /function markUserPlaybackIntent\(playing, options\)/);
    assert.match(bridge, /window\.__sfMarkUserPlaybackIntent = markUserPlaybackIntent;/);
    assert.match(bridge, /window\.playFromUri = function\(uri, contextUri\) \{[\s\S]{0,300}?markUserPlaybackIntent\(true\)/);
    assert.match(
        bridge,
        /window\.manageAll = function\(play\) \{[\s\S]{0,200}?if \(play\) markUserPlaybackIntent\(true, \{ explicit: !window\.__sfUserRequestedPause \}\)/,
        'a Spotify state echo must not clear a pause the user asked for'
    );
    assert.match(bridge, /auto-resume-ignored/, 'automatic resumes are traced and then ignored');
});

test('the native play/pause button asks for an explicit state instead of toggling blindly', () => {
    const method = sliceBetween(
        activity,
        '.method public final onNativePlayPauseClick',
        'return-void\n.end method'
    );

    assert.match(method, /aria-label/, 'the toggle must follow the button label the user sees');
    assert.match(method, /__sfGetPlaybackSnapshot/);
    assert.match(method, /__sfMarkUserPlaybackIntent/);
    assert.match(method, /actPlayPause\(!playing\)/);
    assert.doesNotMatch(method, /window\.actPlayPause\(\);return;/);
});

test('the pause hold re-applies the pause when playback restarts on its own', () => {
    const media = { tagName: 'AUDIO', paused: true, ended: false, currentTime: 42, muted: false, src: 'https://p.scdn.co/track.ogg' };
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true, media: [media] });

    harness.window.actPlayPause(false);
    assert.equal(harness.clicks.length, 1);
    assert.equal(harness.button.label, 'Play');

    // Something (Spotify autoplay, a stale native timer...) starts the player
    // again without any user play request.
    harness.button.label = 'Pause';
    media.paused = false;
    harness.runPauseHold(3);
    media.currentTime += 1;
    harness.runPauseHold(1);

    assert.equal(harness.clicks.length, 2, 'the unwanted resume must be paused again');
    assert.equal(harness.button.label, 'Play');
    assert.equal(harness.window.__sfPauseHoldReapplies, 1);
    assert.equal(harness.window.__sfUserRequestedPause, true, 'the pause intent stays latched');
});

test('the pause hold never fights a user play request', () => {
    const media = { tagName: 'AUDIO', paused: true, ended: false, currentTime: 10, muted: false, src: 'https://p.scdn.co/track.ogg' };
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true, media: [media] });

    harness.window.actPlayPause(false);
    harness.window.actPlayPause(true);
    assert.equal(harness.clicks.length, 2, 'pause then play');

    media.paused = false;
    media.currentTime += 5;
    harness.runPauseHold(2);

    assert.equal(harness.clicks.length, 2, 'the user resumed on purpose: no extra click');
    assert.equal(harness.window.__sfPauseHoldReapplies || 0, 0);
    assert.equal(harness.window.__sfUserRequestedPause, false);
});

test('a silent keep-alive media element cannot count as resumed playback', () => {
    const silent = { tagName: 'AUDIO', paused: false, ended: false, currentTime: 1, muted: false, src: 'https://open.spotify.com/silent.mp3' };
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true, media: [silent] });

    harness.window.actPlayPause(false);
    silent.currentTime += 3;
    harness.runPauseHold(2);

    assert.equal(harness.clicks.length, 1, 'the silent keep-alive must be ignored');
});

test('skipping while paused ends the pause hold instead of fighting it', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true });

    harness.window.actPlayPause(false);
    assert.equal(harness.window.__sfUserRequestedPause, true);
    assert.equal(typeof harness.window.__sfEndPauseHold, 'function');

    assert.match(bridge, /window\.actSkipForward = function\(e\) \{[\s\S]{0,300}?endPauseHold\(\);/);
    assert.match(bridge, /window\.actSkipBack = function\(e\) \{[\s\S]{0,300}?endPauseHold\(\);/);
});

test('playback events are traced for the preview diagnostic', () => {
    const harness = buildPlayPauseHarness({ label: 'Pause', playing: true });

    harness.window.actPlayPause(false);

    const trace = harness.window.__sfGetPlaybackTrace();
    assert.ok(Array.isArray(trace) && trace.length >= 2, 'the pause intent and the pause action are traced');
    const events = trace.map((entry) => entry.event);
    assert.ok(events.includes('act-pause'), 'the explicit pause is traced');
    assert.ok(events.includes('pause-hold-start'), 'the pause hold start is traced');
    assert.equal(typeof trace[trace.length - 1].at, 'number');
    assert.equal(harness.storage.get('melodix_playback_trace_v1'), JSON.stringify(trace));
});

test('the transport controls expose thumb-sized touch targets', () => {
    const layout = read('res/layout/activity_main.xml');

    const miniPause = layout.match(/nativePlayPauseButton[\s\S]{0,700}?android:layout_width="(\d+)\.0dip"/);
    assert.ok(miniPause, 'the mini player pause button must declare a width');
    assert.ok(Number(miniPause[1]) >= 48, `mini pause target is ${miniPause[1]}dp, expected >= 48dp`);

    const largePause = layout.match(/nativePlayerLargePlayPauseButton[\s\S]{0,700}?android:layout_width="(\d+)\.0dip"/);
    assert.ok(largePause, 'the full player pause button must declare a width');
    assert.ok(Number(largePause[1]) >= 56, `full pause target is ${largePause[1]}dp, expected >= 56dp`);
});

test('native player clocks consume millisecond payloads from the shell scrape', () => {
    const shell = read('assets/native_ui_shell.js');
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(shell, /Math\.round\(position \* 1000\)/);
    assert.match(shell, /Math\.round\(duration \* 1000\)/);
    assert.match(shell, /Math\.floor\(payload\.position \/ 5000\)/);
    assert.match(shell, /window\.__sfToggleShuffle = function/);
    assert.match(shell, /window\.__sfToggleRepeat = function/);
    assert.match(shell, /window\.__sfSeekFraction = function/);
    const formatAt = activity.indexOf('.method private static formatNativeTime(J)Ljava/lang/String;');
    const format = activity.slice(formatAt, activity.indexOf('.end method', formatAt));
    assert.match(format, /const-wide\/16 v0, 0x3e8/);
    assert.match(format, /div-long v0, p0, v0/);
    assert.match(activity, /__sfToggleShuffle/);
    assert.match(activity, /__sfToggleRepeat/);
    const playerAt = activity.indexOf('.method public final updateNativePlayer(Ljava/lang/String;)V');
    const player = activity.slice(playerAt, playerAt + 1200);
    assert.match(player, /Aucune lecture en cours/);
    assert.match(player, /if-nez v1, :native_player_no_track/);
});

test('a silent keep-alive element never makes the snapshot report playback', () => {
    const silent = { tagName: 'AUDIO', paused: false, ended: false, currentTime: 1, muted: false, src: 'https://open.spotify.com/silent.mp3' };
    const harness = buildPlayPauseHarness({ label: 'Play', playing: false, media: [silent] });

    assert.equal(harness.window.__sfGetPlaybackSnapshot().playing, false);
});
