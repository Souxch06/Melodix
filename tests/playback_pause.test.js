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
        querySelector(selector) {
            return String(selector).includes('control-button-playpause') ? button : null;
        },
        querySelectorAll() {
            return options.media || [];
        }
    };

    const window = {
        playing: options.playing === undefined ? true : options.playing
    };

    const sandbox = { window, document, console, Date };
    vm.createContext(sandbox);

    const helpers = sliceBetween(bridge, '// >>> sf-pause-intent', '// <<< sf-pause-intent');
    const actPlayPause = sliceFunction(bridge, 'window.actPlayPause = function');
    vm.runInContext(`let reqPause = false;\nlet ulFlag = false;\n${helpers}\n${actPlayPause}`, sandbox);

    return { window, button, clicks, sandbox };
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
    assert.match(bridge, /function markUserPlaybackIntent\(playing\)/);
    assert.match(bridge, /window\.__sfMarkUserPlaybackIntent = markUserPlaybackIntent;/);
    assert.match(bridge, /window\.playFromUri = function\(uri, contextUri\) \{[\s\S]{0,300}?markUserPlaybackIntent\(true\)/);
    assert.match(bridge, /window\.manageAll = function\(play\) \{[\s\S]{0,200}?if \(play\) markUserPlaybackIntent\(true\)/);
});

test('the native play/pause button asks for an explicit state instead of toggling blindly', () => {
    const method = sliceBetween(
        activity,
        '.method public final onNativePlayPauseClick',
        'return-void\n.end method'
    );

    assert.match(method, /__sfGetPlaybackSnapshot/);
    assert.match(method, /__sfMarkUserPlaybackIntent/);
    assert.match(method, /actPlayPause\(!s\)/);
    assert.doesNotMatch(method, /window\.actPlayPause\(\);return;/);
});
