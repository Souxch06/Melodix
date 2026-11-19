'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const src = fs.readFileSync(path.join(__dirname, 'preview-prewarm.js'), 'utf8');

function runStartup({ playing = false } = {}) {
    const calls = [];
    const media = [{ muted: false }, { muted: false }];
    const window = {
        __sfPrewarmActive: true,
        setTimeout: () => { calls.push('timer'); },
        actPlayPause: (value) => calls.push(value ? 'play' : 'pause'),
        actSeek: (value) => calls.push(`seek:${value}`),
        __sfTogglePlayback: () => { calls.push('toggle'); },
        querySelectorAll: () => media
    };
    new Function('window', 'document', src)(window, { querySelectorAll: () => media });
    return { calls, media, window, playing };
}

test('startup does not issue play, pause, seek, timer or mute operations', () => {
    const result = runStartup();
    assert.deepEqual(result.calls, []);
    assert.ok(result.media.every((media) => media.muted === false));
    assert.equal(result.window.__sfPrewarmActive, false);
    assert.equal(result.window.__sfPrewarmDisabledReason, 'startup-autoplay-disabled');
});

test('a live playback state is not altered at startup', () => {
    const result = runStartup({ playing: true });
    assert.deepEqual(result.calls, []);
    assert.ok(result.media.every((media) => media.muted === false));
});

test('ordinary user playback toggle remains untouched', () => {
    const result = runStartup();
    result.window.__sfTogglePlayback();
    assert.deepEqual(result.calls, ['toggle']);
});
