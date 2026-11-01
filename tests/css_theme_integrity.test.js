'use strict';

// CSS safety checks for the source actually packaged into the Preview APK.
// CSSOM parsing keeps the scan aware of declarations nested in @media and
// other grouping rules instead of relying on brittle line-based regexes.

const assert = require('node:assert/strict');
const { execFileSync } = require('node:child_process');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const { JSDOM } = require('jsdom');

const ROOT = path.resolve(__dirname, '..');
const ACTIVE_CSS = 'assets/css_hacks.css';
const HOME_MARKER = 'SF_MELODIX_HOME_STYLES_V1';
const HOME_SELECTOR = '#sf-melodix-home';
const HOME_COLOR_TOKENS = [
    '--mel-bg',
    '--mel-bg-2',
    '--mel-surface-light',
    '--mel-surface-light-2',
    '--mel-surface-light-3',
    '--mel-text-mute-a',
    '--mel-text-mute-c',
    '--mel-accent',
    '--mel-accent-wash-11',
    '--mel-home-status-wash',
    '--mel-home-status-stroke',
    '--mel-home-status-error-wash',
    '--mel-home-status-error-stroke'
];

function trackedCssPaths() {
    return execFileSync('git', ['ls-files', '--', '*.css'], { cwd: ROOT, encoding: 'utf8' })
        .split(/\r?\n/)
        .filter(Boolean);
}

function trackedInlineStyleSourcePaths() {
    return execFileSync('git', ['ls-files', '--', 'assets', 'scripts', 'smali', 'android/apk-extracted', 'source'], { cwd: ROOT, encoding: 'utf8' })
        .split(/\r?\n/)
        .filter((relativePath) => /\.(?:js|smali|html|xml|svg)$/i.test(relativePath) && relativePath !== ACTIVE_CSS);
}

function parseCss(relativePath) {
    const source = fs.readFileSync(path.join(ROOT, relativePath), 'utf8');
    const dom = new JSDOM('');
    const style = dom.window.document.createElement('style');
    style.textContent = source;
    dom.window.document.head.appendChild(style);
    assert.ok(style.sheet, `${relativePath} parses into a CSSStyleSheet`);
    assert.ok(style.sheet.cssRules.length > 0, `${relativePath} has CSS rules`);
    return { dom, source, sheet: style.sheet };
}

function visitRules(rules, context, callback) {
    for (const rule of rules) {
        if (rule.type === 1 && rule.style) callback(rule, context);
        if (rule.cssRules) {
            const nestedContext = rule.conditionText
                ? `${context} @${rule.conditionText}`
                : `${context} @group`;
            visitRules(rule.cssRules, nestedContext, callback);
        }
    }
}

function declarationsIn(sheet) {
    const declarations = [];
    visitRules(sheet.cssRules, '', (rule, context) => {
        for (let index = 0; index < rule.style.length; index += 1) {
            const property = rule.style[index];
            if (!property.startsWith('--')) continue;
            declarations.push({
                property,
                value: rule.style.getPropertyValue(property).trim(),
                selector: rule.selectorText || '',
                context
            });
        }
    });
    return declarations;
}

function references(value) {
    return Array.from(value.matchAll(/var\(\s*(--[\w-]+)/g), (match) => match[1]);
}

function stronglyConnectedComponents(declarations) {
    const graph = new Map();
    for (const declaration of declarations) {
        if (!graph.has(declaration.property)) graph.set(declaration.property, new Set());
        for (const dependency of references(declaration.value)) graph.get(declaration.property).add(dependency);
    }

    let nextIndex = 0;
    const indices = new Map();
    const lowLinks = new Map();
    const stack = [];
    const onStack = new Set();
    const cycles = [];

    function connect(vertex) {
        indices.set(vertex, nextIndex);
        lowLinks.set(vertex, nextIndex);
        nextIndex += 1;
        stack.push(vertex);
        onStack.add(vertex);

        for (const dependency of graph.get(vertex) || []) {
            if (!graph.has(dependency)) continue;
            if (!indices.has(dependency)) {
                connect(dependency);
                lowLinks.set(vertex, Math.min(lowLinks.get(vertex), lowLinks.get(dependency)));
            } else if (onStack.has(dependency)) {
                lowLinks.set(vertex, Math.min(lowLinks.get(vertex), indices.get(dependency)));
            }
        }

        if (lowLinks.get(vertex) !== indices.get(vertex)) return;
        const component = [];
        let member;
        do {
            member = stack.pop();
            onStack.delete(member);
            component.push(member);
        } while (member !== vertex);

        const selfReference = (graph.get(vertex) || new Set()).has(vertex);
        if (component.length > 1 || selfReference) cycles.push(component.sort());
    }

    for (const property of graph.keys()) {
        if (!indices.has(property)) connect(property);
    }
    return cycles;
}

function topLevelRootRules(sheet) {
    return Array.from(sheet.cssRules).filter((rule) => rule.type === 1 && rule.selectorText === ':root');
}

function rootTokens(rootRule) {
    const values = new Map();
    for (let index = 0; index < rootRule.style.length; index += 1) {
        const property = rootRule.style[index];
        if (property.startsWith('--')) values.set(property, rootRule.style.getPropertyValue(property).trim());
    }
    return values;
}

function lightThemeOverrides(sheet) {
    const matches = [];
    visitRules(sheet.cssRules, '', (rule, context) => {
        const selector = rule.selectorText || '';
        if (/prefers-color-scheme\s*:\s*light/i.test(context) ||
            /(?:^|[\s>])(?:html|body)?\.?[\w-]*light[\w-]*(?:$|[\s.#:[>])/i.test(selector) ||
            /\[data-theme\s*=\s*["']?light/i.test(selector)) {
            matches.push({ selector, context });
        }
    });
    return matches;
}

function parseColor(value) {
    const text = String(value || '').trim();
    const hex = /^#([0-9a-f]{3}|[0-9a-f]{6})$/i.exec(text);
    if (hex) {
        const raw = hex[1].length === 3
            ? hex[1].split('').map((part) => part + part).join('')
            : hex[1];
        return [
            parseInt(raw.slice(0, 2), 16),
            parseInt(raw.slice(2, 4), 16),
            parseInt(raw.slice(4, 6), 16),
            1
        ];
    }
    const rgb = /^rgba?\(([^)]+)\)$/i.exec(text);
    if (!rgb) return null;
    const parts = rgb[1].split(',').map((part) => Number.parseFloat(part.trim()));
    if (parts.length < 3 || parts.some((part) => !Number.isFinite(part))) return null;
    return [parts[0], parts[1], parts[2], parts.length > 3 ? parts[3] : 1];
}

function composite(foreground, background) {
    const alpha = foreground[3];
    return [0, 1, 2].map((index) => foreground[index] * alpha + background[index] * (1 - alpha));
}

function relativeLuminance(color) {
    const channel = (value) => {
        const normalized = value / 255;
        return normalized <= 0.04045
            ? normalized / 12.92
            : Math.pow((normalized + 0.055) / 1.055, 2.4);
    };
    return 0.2126 * channel(color[0]) + 0.7152 * channel(color[1]) + 0.0722 * channel(color[2]);
}

function contrastRatio(first, second) {
    const a = relativeLuminance(first);
    const b = relativeLuminance(second);
    return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05);
}

const cssPaths = trackedCssPaths();

for (const cssPath of cssPaths) {
    test(`tracked CSS has no direct or indirect custom-property cycles: ${cssPath}`, () => {
        const parsed = parseCss(cssPath);
        try {
            const declarations = declarationsIn(parsed.sheet);
            const direct = declarations.filter((declaration) => references(declaration.value).includes(declaration.property));
            assert.deepEqual(
                direct.map(({ selector, property, value, context }) => ({ selector, property, value, context })),
                [],
                'aucune déclaration CSS ne se référence elle-même'
            );
            assert.deepEqual(
                stronglyConnectedComponents(declarations),
                [],
                'aucun cycle CSS indirect entre propriétés personnalisées'
            );
        } finally {
            parsed.dom.window.close();
        }
    });
}

test('runtime scripts and overlays do not inject shadow Melodix palette variables', () => {
    const offenders = [];
    for (const relativePath of trackedInlineStyleSourcePaths()) {
        const source = fs.readFileSync(path.join(ROOT, relativePath), 'utf8');
        const matches = source.match(/--mel-[\w-]+/g) || [];
        for (const property of matches) offenders.push({ relativePath, property });
    }
    assert.deepEqual(offenders, [], 'the packaged CSS palette remains canonical across injected styles and overlays');
});

test('the packaged Home theme has one valid source of dark-palette tokens', () => {
    const parsed = parseCss(ACTIVE_CSS);
    try {
        assert.ok(parsed.source.includes(HOME_MARKER), 'the canonical asset contains the Home styles marker');
        const roots = topLevelRootRules(parsed.sheet);
        const paletteRoots = roots.filter((rule) => rootTokens(rule).has('--mel-bg-2'));
        assert.equal(paletteRoots.length, 1, 'there is one top-level :root palette, not a later overriding copy');
        const tokens = rootTokens(paletteRoots[0]);
        const duplicatePaletteTokens = roots
            .filter((rule) => rule !== paletteRoots[0])
            .flatMap((rule) => Array.from(rootTokens(rule).keys()))
            .filter((token) => token.startsWith('--mel-'));
        assert.deepEqual(duplicatePaletteTokens, [], 'other :root blocks do not redeclare Melodix palette tokens');

        for (const token of HOME_COLOR_TOKENS) {
            const value = tokens.get(token);
            assert.ok(value, `${token} is defined in the active root palette`);
            assert.doesNotMatch(value, /var\s*\(/i, `${token} has a concrete root value`);
        }

        const referencedByHome = new Set();
        visitRules(parsed.sheet.cssRules, '', (rule) => {
            if (!rule.selectorText.includes(HOME_SELECTOR)) return;
            for (let index = 0; index < rule.style.length; index += 1) {
                const value = rule.style.getPropertyValue(rule.style[index]);
                for (const token of references(value)) {
                    if (token.startsWith('--mel-')) referencedByHome.add(token);
                }
            }
        });
        for (const token of referencedByHome) {
            assert.ok(tokens.has(token), `${token} used by the Home is defined by the canonical palette`);
        }
    } finally {
        parsed.dom.window.close();
    }
});

test('the dark Home palette clears WCAG AA after applying its translucent layers', () => {
    const parsed = parseCss(ACTIVE_CSS);
    try {
        const paletteRule = topLevelRootRules(parsed.sheet)
            .find((rule) => rootTokens(rule).has('--mel-bg-2'));
        assert.ok(paletteRule, 'the dark palette is present');
        const tokens = rootTokens(paletteRule);
        const color = (name) => {
            const value = parseColor(tokens.get(name));
            assert.ok(value, `${name} parses as a CSS color`);
            return value;
        };
        const base = color('--mel-bg-2');
        const gradientPeak = composite(color('--mel-accent-wash-11'), base);
        const statusBase = composite(color('--mel-home-status-wash'), base);
        const statusPeak = composite(color('--mel-home-status-wash'), gradientPeak);
        const errorBase = composite(color('--mel-home-status-error-wash'), base);
        const errorPeak = composite(color('--mel-home-status-error-wash'), gradientPeak);
        const textPairs = [
            ['Home primary', '--mel-surface-light', [base, gradientPeak]],
            ['brand label', '--mel-text-mute-a', [base, gradientPeak]],
            ['section heading', '--mel-surface-light-2', [base, gradientPeak]],
            ['card title', '--mel-surface-light-3', [base, gradientPeak]],
            ['card subtitle', '--mel-text-mute-c', [base, gradientPeak]],
            ['status title', '--mel-surface-light', [statusBase, statusPeak, errorBase, errorPeak]],
            ['status body', '--mel-text-mute-c', [statusBase, statusPeak, errorBase, errorPeak]]
        ];
        for (const [label, token, backgrounds] of textPairs) {
            const foreground = color(token);
            const worst = Math.min(...backgrounds.map((background) => contrastRatio(foreground, background)));
            assert.ok(worst >= 4.5, `${label} clears 4.5:1 AA on its worst-case layered background (${worst.toFixed(2)}:1)`);
        }
        const retryRatio = contrastRatio(color('--mel-bg'), color('--mel-accent'));
        assert.ok(retryRatio >= 4.5, `retry button label clears 4.5:1 AA (${retryRatio.toFixed(2)}:1)`);
    } finally {
        parsed.dom.window.close();
    }
});

test('the active stylesheet has no separate light color-scheme override to validate', () => {
    const parsed = parseCss(ACTIVE_CSS);
    try {
        assert.deepEqual(lightThemeOverrides(parsed.sheet), [],
            'the active CSS currently exposes the single dark palette; “light” token names are foreground colors, not a light theme');
    } finally {
        parsed.dom.window.close();
    }
});

test('the Android Preview packages the canonical root CSS and verifies its exact bytes', () => {
    const buildWorkflow = fs.readFileSync(path.join(ROOT, '.github/workflows/preview-apk.yml'), 'utf8');
    const smokeWorkflow = fs.readFileSync(path.join(ROOT, '.github/workflows/test-preview-emulator.yml'), 'utf8');
    assert.match(buildWorkflow, /project_items=\([^\n]*\bassets\b/,
        'the APK build copies the canonical root assets directory');
    assert.match(buildWorkflow, /packaged\s*!=\s*runtime/,
        'the candidate build compares every packaged asset byte-for-byte');
    assert.match(smokeWorkflow, /packaged\s*!=\s*runtime/,
        'the exact release candidate is checked again before Android installation');
});
