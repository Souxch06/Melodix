// Shell delivery defect + recovery: the 140 KB native_ui_shell.js was shipped
// through ONE evaluateJavascript without a delivery proof, and the next line
// (window.__sfLoadBundledBridge||function(){}) swallowed its failure silently -
// a non-delivered shell kills the whole startup chain (no js-shell begin, no
// watch, no bridge request => lib-state calls=0 exactly as observed).
// These tests pin the fix: proof-of-delivery + the project's documented
// reliable channel (same-origin <script src> served by shouldInterceptRequest).
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

test('responseForUrl serves the shell asset on the reliable script-src channel', () => {
    const src = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const m = src.indexOf('.method public static responseForUrl');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.match(body, /"\/__melodix__\/native_ui_shell\.js"/,
        'the shell endpoint must be interceptable like the bridge one');
    assert.match(body, /"native_ui_shell\.js"/, 'the shell asset is served from the bundle');
    assert.match(body, /"shell-asset served"/, 'a served shell is journaled');
    assert.match(body, /"shell-asset-miss"/, 'a failed shell read must not fail silently');
    // The bridge branch must remain intact and reachable.
    assert.match(body, /:bridge_branch/);
    assert.match(body, /"\/__melodix__\/spotify_bridge\.js"/);
});

test('shellRecoveryJavascript proves delivery and falls back to script-src', () => {
    const src = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const m = src.indexOf('.method public static shellRecoveryJavascript');
    assert.ok(m > 0, 'the recovery helper must exist');
    const body = src.slice(m, src.indexOf('.end method', m));
    // Proof of delivery: the shell sets this flag only at the end of install().
    assert.match(body, /__sfNativeUiShellCompleted/);
    // Journal labels distinguish delivered / missing.
    assert.match(body, /js-shell delivered ok/);
    assert.match(body, /js-shell delivered missing/);
    // Fallback: same-origin <script src>, marked and idempotent.
    assert.match(body, /data-sf-melodix-shell/);
    assert.match(body, /createElement\('script'\)/);
    assert.match(body, /\/__melodix__\/native_ui_shell\.js/);
    assert.match(body, /document\.head\|\|document\.documentElement/);
    // Never blocks: the whole probe runs in try/catch.
    assert.match(body, /catch\(e\)\{\}/);
});

test('c91 evaluates the recovery script right after the shell injection', () => {
    const src = read('smali/c91.smali');
    const injectAt = src.indexOf('logShellInject(Ljava/lang/String;)V');
    assert.ok(injectAt > 0);
    const recoveryAt = src.indexOf('shellRecoveryJavascript()Ljava/lang/String;');
    assert.ok(recoveryAt > injectAt, 'the recovery probe follows the shell payload');
    const between = src.slice(injectAt, recoveryAt);
    assert.match(between, /evaluateJavascript/,
        'the shell payload is evaluated before the recovery probe');
});

test('the shell IIFE is idempotent so a recovered double-injection is harmless', () => {
    const src = read('assets/native_ui_shell.js');
    assert.match(src, /if \(window\.__sfNativeUiShellStarted\) return;/);
    assert.match(src, /window\.__sfNativeUiShellCompleted = true;/);
    // The completion flag is set only after install() succeeds - the recovery
    // probe keys on it, so a mid-install failure must report "missing".
    const done = src.indexOf('__sfNativeUiShellCompleted = true');
    const install = src.indexOf('install();');
    assert.ok(install > 0 && done > install, 'completion is set after install() runs');
});

test('recovery labels carry no secret-shaped content', () => {
    const src = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const m = src.indexOf('.method public static shellRecoveryJavascript');
    const body = src.slice(m, src.indexOf('.end method', m));
    assert.ok(!/token|cookie|authorization|bearer|sp_dc|sessionid|password/i.test(body));
});
