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
        assert.match(shell, /bottom: calc\(78px \+ var\(--sf-safe-area-bottom, env\(safe-area-inset-bottom\)\)\) !important/);
        assert.match(shell, /height: 68px !important/);

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
