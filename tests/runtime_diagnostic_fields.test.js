const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const script = fs.readFileSync(
    path.join(__dirname, '..', 'assets/runtime_diagnostic.js'),
    'utf8'
);

class NoopMutationObserver {
    observe() {}
    disconnect() {}
}

test('runtime diagnostic reports safe document and bridge readiness fields', () => {
    const timers = [];
    const body = {
        className: 'sf-canvas-blur',
        childElementCount: 0,
        classList: { contains: () => false }
    };
    const document = {
        readyState: 'complete',
        body,
        documentElement: { childElementCount: 2 },
        querySelector: () => null
    };
    const window = {
        location: { protocol: 'https:', hostname: 'open.spotify.com', port: '' },
        innerWidth: 1333,
        screen: { width: 1334 },
        visualViewport: { width: 1333 },
        SF_CONFIG: { guiMode: 'csshack' },
        addCSSJSHack() {},
        _sfExpandedObserver: {},
        getComputedStyle: (element) => ({ display: element.display }),
        setTimeout: (callback, delay) => {
            timers.push({ callback, delay });
            return timers.length;
        }
    };

    const started = vm.runInNewContext(script, {
        window,
        document,
        navigator: { userAgent: 'Android WebView test UA' },
        performance: { now: () => 1000 },
        MutationObserver: NoopMutationObserver
    });
    assert.equal(started, true);

    timers[0].callback();
    const sample = JSON.parse(JSON.stringify(window.__melodixRuntimeDiagnosticV2.samples[0]));
    assert.deepEqual(sample.pageState, {
        readyState: 'complete',
        bodyExists: true,
        bodyChildElementCount: 0,
        documentElementChildElementCount: 2
    });
    assert.deepEqual(sample.bridge, {
        addCSSJSHackAvailable: true,
        mobileNavObserverAttached: false,
        expandedObserverAttached: true
    });
    assert.doesNotMatch(JSON.stringify(sample.pageState) + JSON.stringify(sample.bridge), /text|url|cookie|token|secret/i);
});

test('runtime diagnostic contains no page-content or credential reads', () => {
    assert.doesNotMatch(
        script,
        /document\.cookie|CookieManager|localStorage|sessionStorage|\bfetch\s*\(|XMLHttpRequest|location\.href|textContent|innerText/i
    );
});
