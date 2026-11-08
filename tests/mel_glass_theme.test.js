'use strict';

// Guards for SECTION 10 (MELODIX GLASS THEME) of the packaged stylesheet.
// The section is additive on purpose: it repaints, it never removes a mask, a
// safe-area rule or an sf-* mode. These tests pin the repaint *and* the fact
// that the layout rules it sits on top of are still there.

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const { JSDOM } = require('jsdom');

const ROOT = path.resolve(__dirname, '..');
const CSS = fs.readFileSync(path.join(ROOT, 'assets/css_hacks.css'), 'utf8');
const MARKER = 'SECTION 10: MELODIX GLASS THEME';
const GLASS = CSS.slice(CSS.indexOf(MARKER));

function sheetOf(source) {
    const dom = new JSDOM('');
    const style = dom.window.document.createElement('style');
    style.textContent = source;
    dom.window.document.head.appendChild(style);
    assert.ok(style.sheet, 'the glass section parses into a CSSStyleSheet');
    return { dom, sheet: style.sheet };
}

function rulesMatching(sheet, selector) {
    // Exact selector match: a rule for #global-nav-bar:hover must never be
    // read as if it were the base rule.
    const wanted = selector.replace(/\s+/g, ' ').trim();
    return Array.from(sheet.cssRules).filter((rule) => {
        if (rule.type !== 1 || !rule.selectorText) return false;
        return rule.selectorText.split(',').some((part) => part.replace(/\s+/g, ' ').trim() === wanted);
    });
}

function declarationsFor(sheet, selector) {
    const merged = new Map();
    for (const rule of rulesMatching(sheet, selector)) {
        for (let index = 0; index < rule.style.length; index += 1) {
            const property = rule.style[index];
            merged.set(property, rule.style.getPropertyValue(property).trim());
        }
    }
    return merged;
}

function rootTokens() {
    const { dom, sheet } = sheetOf(CSS);
    try {
        const root = Array.from(sheet.cssRules).find(
            (rule) => rule.type === 1 && rule.selectorText === ':root' && rule.style.getPropertyValue('--mel-bg-2')
        );
        assert.ok(root, 'the canonical root palette exists');
        const tokens = new Map();
        for (let index = 0; index < root.style.length; index += 1) {
            const property = root.style[index];
            tokens.set(property, root.style.getPropertyValue(property).trim());
        }
        return tokens;
    } finally {
        dom.window.close();
    }
}

test('the glass section exists and comes last, so the cascade decides in its favour', () => {
    assert.ok(GLASS.length > 0, 'SECTION 10 is present');
    const afterGlass = CSS.slice(CSS.indexOf(MARKER) + MARKER.length);
    assert.doesNotMatch(afterGlass, /SECTION [0-9]+:/, 'no later section overrides the glass section');
});

test('every surface recipe reads the glass tokens instead of a raw colour', () => {
    const tokens = rootTokens();
    for (const token of ['--mel-glass-bg', '--mel-glass-border', '--mel-glass-highlight', '--mel-glass-scrim', '--mel-glass-blur']) {
        assert.ok(tokens.has(token), `${token} is declared in the single :root`);
    }
    assert.doesNotMatch(GLASS, /#[0-9a-fA-F]{3,8}\b/, 'the glass section carries no raw hex colour');
    assert.doesNotMatch(GLASS, /rgba?\([^)]*\)/, 'the glass section carries no raw rgb()/rgba() colour');
});

test('the top bar is glass and keeps the 48px + safe-area height it had before', () => {
    const { dom, sheet } = sheetOf(CSS);
    try {
        const bar = declarationsFor(sheet, '#global-nav-bar');
        assert.match(bar.get('background-color'), /var\(--mel-glass-scrim\)/, 'the bar paints the glass scrim');
        assert.match(bar.get('backdrop-filter'), /blur\(/, 'the bar blurs what scrolls under it');
        assert.match(bar.get('box-shadow'), /inset 0 -1px 0 var\(--mel-glass-border\)/, 'the hairline is an inset shadow, never a border');
        assert.equal(bar.get('height'), 'calc(48px + var(--sf-safe-area-top, env(safe-area-inset-top)))',
            'the glass section does not restate the bar height: the safe-area one still wins');

        // The layout rules it sits on top of are untouched.
        assert.match(CSS, /#global-nav-bar \{\s*padding-top: var\(--sf-safe-area-top, env\(safe-area-inset-top\)\) !important;\s*height: calc\(48px \+ var\(--sf-safe-area-top, env\(safe-area-inset-top\)\)\) !important;/,
            'the safe-area aware bar height is still the single source of truth');
    } finally {
        dom.window.close();
    }
});

test('top bar buttons keep a 44px target and the current section keeps the readable accent', () => {
    const { dom, sheet } = sheetOf(GLASS);
    try {
        const button = declarationsFor(sheet, '#global-nav-bar button');
        assert.equal(button.get('min-width'), '44px');
        assert.equal(button.get('min-height'), '44px');
        assert.match(button.get('border-radius'), /var\(--mel-radius-pill\)/);

        const active = declarationsFor(sheet, '#global-nav-bar button[aria-current="page"]');
        assert.match(active.get('color'), /var\(--mel-accent\)/, 'the active tab uses the AA accent, not the gradient');
    } finally {
        dom.window.close();
    }
});

test('the search field is a pill: radius and halo only, never geometry', () => {
    const { dom, sheet } = sheetOf(GLASS);
    try {
        const form = declarationsFor(sheet, '#global-nav-bar form[role="search"]');
        assert.match(form.get('border-radius'), /var\(--mel-radius-pill\)/);
        assert.match(form.get('background-color'), /var\(--mel-glass-bg\)/);
        for (const forbidden of ['width', 'margin', 'margin-left', 'position', 'flex']) {
            assert.equal(form.get(forbidden), undefined, `the glass search pill must not set ${forbidden}`);
        }
        assert.match(CSS, /form\[role=search\] \{[^}]*margin-left: 48px;/, 'the existing offset around the back/forward buttons still applies');
    } finally {
        dom.window.close();
    }
});

test('the frosted chrome only blurs where the brief allows it', () => {
    const blurred = new Set(
        Array.from(GLASS.matchAll(/([^{}]+)\{[^{}]*backdrop-filter:[^{;]*blur/g), (match) => match[1].trim())
    );
    for (const selector of blurred) {
        assert.match(
            selector,
            /#global-nav-bar|mel-glass-surface|#sf-fs-player|#sf-fs-bg|sf-mobile-nav|now-playing-bar|form\[role="search"\]|sf-fs-/,
            `${selector} may not receive a backdrop blur`
        );
    }
});

test('the mini player is glass, keeps its dock geometry and hides nothing new', () => {
    const { dom, sheet } = sheetOf(GLASS);
    const { dom: fileSheet, sheet: whole } = sheetOf(CSS);
    try {
        const bar = declarationsFor(sheet, 'body:not(.sf-fs-open) aside[data-testid="now-playing-bar"]');
        assert.match(bar.get('background-color'), /var\(--mel-glass-scrim\)/);
        assert.match(bar.get('border-radius'), /var\(--mel-radius-sheet\)/, '28px floating pill');
        assert.match(bar.get('backdrop-filter'), /blur\(/);
        for (const forbidden of ['bottom', 'height', 'position', 'left', 'right']) {
            assert.equal(bar.get(forbidden), undefined, `the repaint must not move the mini player (${forbidden})`);
        }

        // Geometry still comes from the touch shell, unchanged.
        const shell = CSS.slice(CSS.indexOf('SECTION 10: TOUCH APP SHELL'));
        assert.match(shell, /bottom: calc\(var\(--sf-dock-h, 68px\) \+ var\(--sf-mini-gap, 10px\) \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\) !important/);
        assert.match(shell, /height: var\(--sf-mini-h, 68px\) !important/);

        // No new display:none inside the mini-player step.
        const mini = GLASS.slice(GLASS.indexOf('10.11'));
        assert.doesNotMatch(mini, /display:\s*none/, 'the mini player step hides nothing');
    } finally {
        dom.window.close();
        fileSheet.window.close();
    }
});

test('the play button keeps its white glyph on the gradient and the artwork keeps a 12-20px radius', () => {
    const { dom, sheet } = sheetOf(GLASS);
    try {
        const play = declarationsFor(sheet, 'body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] button[data-testid="control-button-playpause"]');
        assert.match(play.get('background-image'), /var\(--mel-accent-grad\)/);
        assert.match(play.get('color'), /var\(--mel-text-on-accent\)/, 'white on the gradient stays AA (5.70:1 / 4.60:1)');

        const cover = declarationsFor(sheet, 'body:not(.sf-fs-open) aside[data-testid="now-playing-bar"] [data-testid="CoverSlotCollapsed__container"]');
        assert.match(cover.get('border-radius'), /var\(--mel-radius-art\)/);
    } finally {
        dom.window.close();
    }
});

test('the bottom dock is a 68px glass pill with 34px tabs and a gradient active tab', () => {
    // The first #sf-mobile-nav rule just parks the element (display:none);
    // the real dock is the fixed one.
    const dock = CSS.match(/#sf-mobile-nav \{(?:(?!\})[\s\S])*position: fixed(?:(?!\})[\s\S])*\}/);
    assert.ok(dock, 'the fixed dock rule exists');
    assert.match(dock[0], /height: calc\(var\(--sf-dock-h, 68px\)/);
    assert.match(dock[0], /background: var\(--mel-glass-scrim\)/);
    assert.match(dock[0], /backdrop-filter: blur/);

    const item = CSS.match(/#sf-mobile-nav \.sf-mobile-nav__item \{[^}]*\}/);
    assert.ok(item, 'the tab rule exists');
    assert.match(item[0], /border-radius: 34px/, 'a 34px radius on a 68px rail');
    assert.match(item[0], /min-height: 52px/, 'comfortably above the 48dp target');

    const active = CSS.match(/#sf-mobile-nav \.sf-mobile-nav__item\[aria-current="page"\] \{[^}]*\}/);
    assert.ok(active, 'the active tab rule exists');
    assert.match(active[0], /background-image: var\(--mel-accent-grad\)/);
    assert.match(active[0], /color: var\(--mel-text-on-accent\)/, 'white on the gradient stays AA');

    // The label is the tab's own text node: it must never be clipped away.
    assert.match(CSS, /#sf-mobile-nav \.sf-mobile-nav__item span \{[^}]*text-overflow: ellipsis/,
        'the label is ellipsised, never hidden');
});

test('the dock hides itself only while the phone keyboard is open', () => {
    const guard = CSS.match(/@media screen and \(max-width: 820px\) \{[^}]*sf-keyboard-open[^}]*\}[^}]*\}/);
    assert.ok(guard, 'the keyboard guard exists and is scoped to phone widths');
    assert.match(guard[0], /body\.sf-keyboard-open #sf-mobile-nav \{\s*display: none !important;/);
    // Nothing else may hide the dock.
    // Only the base parking rule and the keyboard guard may hide the dock.
    const dockHides = Array.from(CSS.matchAll(/([^{}]*#sf-mobile-nav[^{}]*)\{[^{}]*display:\s*none/g), (m) =>
        m[1].split('\n').pop().split(',').map((part) => part.trim()).filter((part) => part.endsWith('#sf-mobile-nav')));
    assert.deepEqual(dockHides.flat(), ['#sf-mobile-nav', 'body.sf-keyboard-open #sf-mobile-nav'],
        'only the base rule and the keyboard guard control the dock visibility');
});

test('the dock follows the route without a reload and survives history changes', () => {
    const bridge = fs.readFileSync(path.join(ROOT, 'scripts/spotify_bridge.source.js'), 'utf8');
    assert.match(bridge, /window\.addEventListener\('popstate', syncMobileNavigation\)/,
        'back / forward refresh the dock');
    assert.match(bridge, /'pushState', 'replaceState'\]\.forEach/,
        'the client router fires no event: the dock observes history instead of polling');
    assert.match(bridge, /window\.history\[method\] = function patchedHistoryMethod\(\)/,
        'the patched methods still return the original result');
    assert.match(bridge, /const result = original\.apply\(this, arguments\);/);
    assert.match(bridge, /const pathname = String\(window\.location\.pathname/,
        'the active tab is derived from the real pathname');
    assert.doesNotMatch(bridge, /function syncMobileNavigation\(\)[\s\S]{0,400}location\.reload\(\)/,
        'switching tabs never reloads the page');
});

test('the touch stack is driven by tokens, so the pocket, the drawer and the content agree', () => {
    const tokens = rootTokens();
    for (const token of ['--sf-dock-h', '--sf-mini-h', '--sf-mini-gap', '--sf-stack-gap']) {
        assert.ok(tokens.has(token), `${token} is declared in the single :root`);
    }
    const bridge = fs.readFileSync(path.join(ROOT, 'scripts/spotify_bridge.source.js'), 'utf8');
    const fallback = bridge.match(/function ensureMobileShellFallbackStyles\(\)[\s\S]*?style\.textContent = `([\s\S]*?)`;/)[1];
    for (const source of [CSS, fallback]) {
        for (const match of source.matchAll(/calc\(var\(--sf-dock-h, 68px\)[^;]*/g)) {
            assert.match(match[0], /--sf-mini-h, 68px|--sf-safe-area-bottom/,
                'every dock-derived offset spells the whole stack out, never a partial one');
        }
    }
});
