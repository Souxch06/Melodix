const test = require('node:test');
const assert = require('node:assert/strict');
const create = require('./lot-a-playlist-controller.js');
const playlist = 'spotify:playlist:abc123';
const track = 'spotify:track:def456';
function harness(shared = {starts: []}, initialTime = 1000) {
    let now = initialTime, next = 0;
    const timers = new Map(), calls = [], events = [];
    const host = {
        now: () => now,
        isVisible: (t, c) => t === track && c === playlist,
        isAvailable: () => true,
        currentTrack: () => '', toggle: () => calls.push('toggle'),
        notify: e => events.push(e),
        play: (t, c) => calls.push([t, c]),
        setTimer: (fn, delay) => { const id = ++next; timers.set(id, {fn, at: now + delay}); return id; },
        clearTimer: id => timers.delete(id)
    };
    const ctl = create(host, shared);
    return {ctl, host, calls, events, advance(ms) { now += ms; for (const [id, t] of [...timers]) if (t.at <= now) { timers.delete(id); t.fn(); } }};
}
test('one visible playlist tap calls the simulated command once', () => {
    const h = harness(); assert.equal(h.ctl.tap(track, playlist), 'started');
    assert.deepEqual(h.calls, [[track, playlist]]); assert.equal(h.events.at(-1).state, 'loading');
    assert.equal(h.ctl.observe(track, true), true); assert.equal(h.events.at(-1).state, 'playing');
    h.advance(10000); assert.equal(h.calls.length, 1); assert.equal(h.events.at(-1).state, 'playing');
});
test('rapid double tap does not send a second command', () => {
    const h = harness(); h.ctl.tap(track, playlist); h.advance(200);
    assert.equal(h.ctl.tap(track, playlist), 'debounced'); assert.equal(h.calls.length, 1);
});
test('missing update produces a neutral slow state and a late update clears it', () => {
    const h = harness(); h.ctl.tap(track, playlist); h.advance(8000);
    assert.equal(h.events.at(-1).state, 'slow'); assert.equal(h.calls.length, 1);
    h.advance(1000); assert.equal(h.calls.length, 1);
    assert.equal(h.ctl.observe(track, true), true); assert.equal(h.events.at(-1).state, 'playing');
    h.advance(60000); assert.equal(h.calls.length, 1);
});
test('a missing or unverified track sends no command', () => {
    const h = harness(); assert.equal(h.ctl.tap('', playlist), 'invalid');
    assert.equal(h.events.at(-1).state, 'error'); assert.equal(h.ctl.tap('spotify:track:other', playlist), 'invalid');
    assert.equal(h.calls.length, 0);
});
test('shared budget bounds a burst across controller instances', () => {
    const shared = {starts: []}, h = harness(shared);
    for (let i = 0; i < 3; i++) { assert.equal(h.ctl.tap(track, playlist), 'started'); h.advance(800); }
    assert.equal(h.ctl.tap(track, playlist), 'limited'); assert.equal(h.calls.length, 3);
    const other = harness(shared, 4200);
    assert.equal(other.ctl.tap(track, playlist), 'limited');
    assert.equal(other.calls.length, 0);
    const olderClock = harness(shared);
    assert.equal(olderClock.ctl.tap(track, playlist), 'invalid-clock');
    assert.equal(olderClock.calls.length, 0);
    h.ctl.observe(track, true);
    h.advance(60000); assert.equal(h.ctl.tap(track, playlist), 'started');
});
test('back cancels the pending status but does not send another command', () => {
    const h = harness(); h.ctl.tap(track, playlist); h.ctl.leave(); h.advance(8000);
    assert.equal(h.calls.length, 1); assert.equal(h.events.at(-1).state, 'loading');
    assert.equal(h.ctl.observe(track, true), false);
});
test('liked collection is inert', () => {
    const h = harness(); assert.equal(h.ctl.tap(track, 'spotify:collection:tracks'), 'ignored');
    assert.equal(h.calls.length, 0); assert.equal(h.events.length, 0);
});
test('command exception shows an error without retry and enforces a three-second rest', () => {
    const h = harness(); let attempts = 0;
    h.host.play = () => { attempts++; throw new Error('simulated'); };
    assert.equal(h.ctl.tap(track, playlist), 'started'); assert.equal(h.events.at(-1).state, 'error');
    h.advance(1000); assert.equal(h.ctl.tap(track, playlist), 'resting'); assert.equal(attempts, 1);
    h.advance(2000); assert.equal(h.ctl.tap(track, playlist), 'started'); assert.equal(attempts, 2);
    h.advance(10000); assert.equal(attempts, 2);
});

test('unavailable or unknown availability is fail-closed without issuing a command', () => {
    const h = harness(); h.host.isAvailable = () => false;
    assert.equal(h.ctl.tap(track, playlist), 'unavailable'); assert.equal(h.events.at(-1).state, 'unavailable');
    h.host.isAvailable = () => undefined; assert.equal(h.ctl.tap(track, playlist), 'invalid');
    assert.equal(h.events.at(-1).state, 'error'); assert.equal(h.calls.length, 0);
});
test('current track toggles bypass start-only debounce, quota and failure rest', () => {
    const shared = {starts:[10,20,30],lastTap:999,restUntil:99999};
    const h = harness(shared,1000); h.host.currentTrack = () => track;
    assert.equal(h.ctl.tap(track, playlist), 'toggled');
    assert.equal(h.ctl.tap(track, playlist), 'toggled');
    assert.deepEqual(h.calls,['toggle','toggle']); assert.deepEqual(shared.starts,[10,20,30]);
    assert.equal(shared.lastTap,999); assert.equal(shared.restUntil,99999);
});
test('only explicit retry can resend after a neutral slow status; rechecks eligibility', () => {
    const h = harness(); assert.equal(h.ctl.retry(), 'ignored');h.ctl.tap(track,playlist);
    assert.equal(h.ctl.retry(), 'ignored');h.advance(8000);assert.equal(h.calls.length,1);
    h.host.isVisible=()=>false;assert.equal(h.ctl.retry(),'invalid');assert.equal(h.calls.length,1);
    h.host.isVisible=()=>true;assert.equal(h.ctl.retry(),'started');assert.equal(h.calls.length,2);
    h.advance(8000);assert.equal(h.events.at(-1).state,'slow');assert.equal(h.calls.length,2);
    assert.equal(h.ctl.observe(track, true),true);assert.equal(h.ctl.retry(),'ignored');
});
test('timeout is not a demonstrated failure and adds no three-second failure rest', () => {
    const h=harness();h.ctl.tap(track,playlist);h.advance(8000);
    assert.equal(h.ctl.retry(),'started');assert.equal(h.calls.length,2);
});

test('a matching paused or unknown player state does not claim confirmation', () => {
    const h=harness();h.ctl.tap(track,playlist);
    assert.equal(h.ctl.observe(track,false),false);assert.equal(h.ctl.observe(track),false);
    assert.equal(h.events.at(-1).state,'loading');h.advance(8000);
    assert.equal(h.events.at(-1).state,'slow');assert.equal(h.ctl.observe(track,true),true);
});
test('current-track gesture cancels an obsolete loading timeout', () => {
    const h=harness();h.ctl.tap(track,playlist);h.host.currentTrack=()=>track;
    assert.equal(h.ctl.tap(track,playlist),'toggled');h.advance(8000);
    assert.equal(h.events.at(-1).state,'clear');assert.equal(h.calls.length,2);
});
