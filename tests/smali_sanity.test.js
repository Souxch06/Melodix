const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const repo = path.resolve(__dirname, '..');
const smaliFiles = [
    'smali/c91.smali',
    'smali/m9.smali',
    'smali/com/melodix/music/AndBridge.smali',
    'smali/com/melodix/music/AppSingleton.smali',
    'smali/com/melodix/music/MainActivity.smali',
    'smali/com/melodix/music/RuntimeDiagnostic.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$Callback.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$ShowRunnable.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali',
    'smali/s4.smali',
    'smali/bh.smali',
    'smali/u51.smali',
    'smali/v51.smali',
    'smali/a61.smali',
    'smali/z1.smali',
    'smali/e61.smali'
];

function checkSmaliStructure(relativePath) {
    const lines = fs.readFileSync(path.join(repo, relativePath), 'utf8').split(/\r?\n/);
    const errors = [];
    let methodStart = null;
    let labels = new Set();
    let branchTargets = [];
    let inSwitchTable = false;

    const finishMethod = () => {
        if (methodStart === null) return;
        for (const [target, lineNumber] of branchTargets) {
            if (!labels.has(target)) errors.push(`line ${lineNumber}: unresolved :${target}`);
        }
        methodStart = null;
        labels = new Set();
        branchTargets = [];
        inSwitchTable = false;
    };

    for (let index = 0; index < lines.length; index += 1) {
        const line = lines[index];
        const lineNumber = index + 1;

        if (/^\.method\b/.test(line)) {
            if (methodStart !== null) errors.push(`line ${lineNumber}: nested .method`);
            finishMethod();
            methodStart = lineNumber;
            continue;
        }
        if (/^\.end method\b/.test(line)) {
            if (methodStart === null) errors.push(`line ${lineNumber}: unmatched .end method`);
            finishMethod();
            continue;
        }
        if (methodStart === null || /^\s*#/.test(line)) continue;

        if (/^\s*\.(?:packed-switch|sparse-switch)\b/.test(line)) {
            inSwitchTable = true;
            continue;
        }
        if (/^\s*\.end (?:packed-switch|sparse-switch)\b/.test(line)) {
            inSwitchTable = false;
            continue;
        }

        const label = line.match(/^\s*:([\w.$-]+)\s*$/);
        if (inSwitchTable && label) {
            branchTargets.push([label[1], lineNumber]);
            continue;
        }
        if (label) {
            if (labels.has(label[1])) errors.push(`line ${lineNumber}: duplicate :${label[1]}`);
            labels.add(label[1]);
        }

        const instruction = line.trim();
        if (/^(?:if-[\w-]+|goto(?:\/\d+)?|packed-switch|sparse-switch)\b/.test(instruction)) {
            for (const match of instruction.matchAll(/:([\w.$-]+)/g)) {
                branchTargets.push([match[1], lineNumber]);
            }
        }
    }

    if (methodStart !== null) errors.push(`line ${methodStart}: unterminated method`);
    return errors;
}

test('modified Smali files have balanced methods and resolvable direct branch labels', () => {
    for (const file of smaliFiles) {
        assert.deepEqual(checkSmaliStructure(file), [], `${file} has a structural Smali error`);
    }
});

const diagnosticSmaliFiles = [
    'smali/c91.smali',
    'smali/com/melodix/music/RuntimeDiagnostic.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$Callback.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$ShowRunnable.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$CopyListener.smali',
    'smali/com/melodix/music/RuntimeDiagnostic$FetchRunnable.smali'
];

function countIncomingRegisters(methodDeclaration) {
    const open = methodDeclaration.indexOf('(');
    const close = methodDeclaration.indexOf(')', open + 1);
    if (open < 0 || close < 0) return null;

    const flags = methodDeclaration.slice(0, open).trim().split(/\s+/);
    const isStatic = flags.includes('static');
    const parameters = methodDeclaration.slice(open + 1, close);
    let registerCount = isStatic ? 0 : 1;

    for (let index = 0; index < parameters.length;) {
        let isArray = false;
        while (parameters[index] === '[') {
            isArray = true;
            index += 1;
        }

        const type = parameters[index];
        if (!type) break;
        if (type === 'L') {
            const end = parameters.indexOf(';', index);
            if (end < 0) return null;
            registerCount += 1;
            index = end + 1;
        } else {
            registerCount += !isArray && (type === 'J' || type === 'D') ? 2 : 1;
            index += 1;
        }
    }

    return registerCount;
}

function checkNonRangeInvokeRegisters(relativePath) {
    const lines = fs.readFileSync(path.join(repo, relativePath), 'utf8').split(/\r?\n/);
    const errors = [];
    let methodDeclaration = null;
    let incomingRegisters = null;
    let localRegisters = null;

    for (let index = 0; index < lines.length; index += 1) {
        const line = lines[index];
        const lineNumber = index + 1;

        if (/^\.method\b/.test(line)) {
            methodDeclaration = line.trim();
            incomingRegisters = countIncomingRegisters(methodDeclaration);
            localRegisters = null;
            continue;
        }
        if (/^\.end method\b/.test(line)) {
            methodDeclaration = null;
            incomingRegisters = null;
            localRegisters = null;
            continue;
        }
        if (methodDeclaration === null) continue;

        const declaration = line.match(/^\s*\.(locals|registers)\s+(\d+)\b/);
        if (declaration) {
            const registerCount = Number(declaration[2]);
            localRegisters = declaration[1] === 'locals'
                ? registerCount
                : registerCount - incomingRegisters;
            if (localRegisters < 0) {
                errors.push(`line ${lineNumber}: register declaration is smaller than the method parameters`);
            }
            continue;
        }

        const instruction = line.split('#', 1)[0].trim();
        const invoke = instruction.match(/^(invoke-[\w/-]+)\s+\{([^}]*)\}/);
        if (!invoke || invoke[1].endsWith('/range')) continue;
        if (localRegisters === null || incomingRegisters === null) {
            errors.push(`line ${lineNumber}: cannot resolve registers without a method register declaration`);
            continue;
        }

        const registers = [...invoke[2].matchAll(/\b([vp])(\d+)\b/g)];
        for (const register of registers) {
            const kind = register[1];
            const number = Number(register[2]);
            const actual = kind === 'v' ? number : localRegisters + number;
            if (kind === 'p' && number >= incomingRegisters) {
                errors.push(`line ${lineNumber}: ${invoke[1]} uses invalid parameter register p${number}`);
            } else if (actual > 15) {
                errors.push(`line ${lineNumber}: ${invoke[1]} uses ${kind}${number} (v${actual}), above v15`);
            }
        }
    }

    return errors;
}

test('modified Smali non-range invoke instructions use only v0-v15', () => {
    for (const file of diagnosticSmaliFiles) {
        assert.deepEqual(
            checkNonRangeInvokeRegisters(file),
            [],
            `${file} has a non-range invoke with a register above v15`
        );
    }
});

function getNativeMobileShellFallback() {
    const source = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const methodStart = source.indexOf('.method public final onPageFinished(');
    const methodEnd = source.indexOf('.end method', methodStart);
    assert.ok(methodStart >= 0 && methodEnd > methodStart, 'onPageFinished method is present');

    const methodSource = source.slice(methodStart, methodEnd);
    const fallbackMarker = '# Native lifecycle fallback: retry the mobile shell separately after the bridge evaluation.';
    const fallbackIndex = methodSource.indexOf(fallbackMarker);
    const bridgeAssetIndex = methodSource.indexOf('const-string v3, "spotify_bridge.js"');
    const playlistAssetIndex = methodSource.indexOf('const-string v1, "playlist_sort.js"');
    assert.ok(bridgeAssetIndex >= 0 && bridgeAssetIndex < fallbackIndex, 'fallback follows the bridge asset');
    assert.ok(fallbackIndex >= 0 && fallbackIndex < playlistAssetIndex, 'fallback runs before later page scripts');

    const fallbackLine = methodSource.slice(fallbackIndex).split(/\r?\n/)
        .find((line) => line.includes('const-string v1, '));
    const match = fallbackLine && fallbackLine.match(/^\s*const-string v1, "(.*)"$/);
    assert.ok(match, 'fallback JavaScript is a single Smali string');

    const interceptStart = source.indexOf('.method public final shouldInterceptRequest(');
    const interceptEnd = source.indexOf('.end method', interceptStart);
    assert.ok(interceptStart >= 0 && interceptEnd > interceptStart, 'shouldInterceptRequest method is present');
    assert.equal(
        source.slice(interceptStart, interceptEnd).includes(fallbackMarker),
        false,
        'fallback does not modify shouldInterceptRequest'
    );

    return match[1];
}

test('onPageFinished retries the mobile shell in an isolated, guarded evaluation', () => {
    const fallback = getNativeMobileShellFallback();
    assert.doesNotThrow(() => new vm.Script(fallback), 'fallback JavaScript parses');

    let calls = 0;
    const fakeDocument = {
        body: {},
        navPresent: false,
        getElementById(id) {
            return id === 'sf-mobile-nav' && this.navPresent ? {} : null;
        }
    };
    const fakeWindow = {
        SF_CONFIG: { guiMode: 'csshack' },
        addCSSJSHack() {
            calls += 1;
            fakeDocument.navPresent = true;
            this._sfMobileNavObserver = {};
            this._sfExpandedObserver = {};
        }
    };

    vm.runInNewContext(fallback, { window: fakeWindow, document: fakeDocument });
    vm.runInNewContext(fallback, { window: fakeWindow, document: fakeDocument });

    assert.equal(calls, 1, 'a successful initialization is not repeated');
    assert.equal(fakeWindow.__sfMobileShellInitState.status, 'initialized');
    assert.equal(fakeWindow.__sfMobileShellInitState.attempts, 1);
    assert.equal(fakeWindow.__sfMobileShellInitState.mobileNavPresent, true);
    assert.equal(fakeWindow.__sfMobileShellInitState.mobileNavObserverAttached, true);
    assert.equal(fakeWindow.__sfMobileShellInitState.expandedObserverAttached, true);
});

test('native fallback records only a filtered error name if shell initialization throws', () => {
    const fallback = getNativeMobileShellFallback();
    const fakeWindow = {
        SF_CONFIG: { guiMode: 'csshack' },
        addCSSJSHack() {
            const error = new Error('sensitive detail must not be retained');
            error.name = 'TypeError';
            throw error;
        }
    };
    const fakeDocument = { body: {}, getElementById: () => null };

    vm.runInNewContext(fallback, { window: fakeWindow, document: fakeDocument });

    assert.equal(fakeWindow.__sfMobileShellInitState.status, 'error');
    assert.equal(fakeWindow.__sfMobileShellInitState.errorName, 'TypeError');
    assert.equal(JSON.stringify(fakeWindow.__sfMobileShellInitState).includes('sensitive detail'), false);
});

test('Preview loads the APK-bundled Spotify bridge instead of a persistent hotfix', () => {
    const source = fs.readFileSync(path.join(repo, 'smali/m9.smali'), 'utf8');
    const methodStart = source.indexOf('.method public static d(Ljava/lang/String;)Ljava/lang/String;');
    const methodEnd = source.indexOf('.end method', methodStart);
    assert.ok(methodStart >= 0 && methodEnd > methodStart, 'asset loader method is present');

    const method = source.slice(methodStart, methodEnd);
    const bridgeGuard = method.indexOf('const-string v0, "spotify_bridge.js"');
    const previewGuard = method.indexOf('const-string v1, "com.melodix.music.preview"');
    const bundledAssetBranch = method.indexOf('goto :cond_2', previewGuard);
    const cacheRead = method.indexOf('sget-object v0, Lcom/melodix/music/AppSingleton;->f0:');
    const hotfixPath = method.indexOf('const-string v4, "hotfixes/"');

    assert.ok(bridgeGuard >= 0 && bridgeGuard < previewGuard, 'special case is limited to the bridge name');
    assert.ok(previewGuard < bundledAssetBranch && bundledAssetBranch < cacheRead, 'Preview bypasses the old cache');
    assert.ok(cacheRead < hotfixPath, 'normal app flow still retains its hotfix behavior');
});
