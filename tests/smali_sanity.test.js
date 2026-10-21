const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const repo = path.resolve(__dirname, '..');
const smaliFiles = [
    'smali/c40.smali',
    'smali/c91.smali',
    'smali/m9.smali',
    'smali/com/melodix/music/AndBridge.smali',
    'smali/com/melodix/music/AppSingleton.smali',
    'smali/com/melodix/music/MainActivity.smali',
    'smali/com/melodix/music/NativeUiUpdateRunnable.smali',
    'smali/com/melodix/music/NativeRowClickListener.smali',
    'smali/com/melodix/music/NativeUiRowFactory.smali',
    'smali/com/melodix/music/NativeImageLoader.smali',
    'smali/com/melodix/music/NativeSearchWatcher.smali',
    'smali/com/melodix/music/NativeSearchFocusRunnable.smali',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali',
    'smali/com/melodix/music/NativeLogoutRunnable.smali',
    'smali/com/melodix/music/StartupLoadWatchdog.smali',
    'smali/com/melodix/music/NativeAssetRunner.smali',
    'smali/com/melodix/music/NativeCrashGuard.smali',
    'smali/com/melodix/music/NativeHomeShelfRenderer.smali',
    'smali/com/melodix/music/NativeRowList.smali',
    'smali/com/melodix/music/NativeHomePaintRunnable.smali',
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
    'smali/c40.smali',
    'smali/c91.smali',
    'smali/com/melodix/music/AndBridge.smali',
    'smali/com/melodix/music/MainActivity.smali',
    'smali/com/melodix/music/NativeUiUpdateRunnable.smali',
    'smali/com/melodix/music/NativeRowClickListener.smali',
    'smali/com/melodix/music/NativeUiRowFactory.smali',
    'smali/com/melodix/music/NativeImageLoader.smali',
    'smali/com/melodix/music/NativeSearchWatcher.smali',
    'smali/com/melodix/music/NativeSearchFocusRunnable.smali',
    'smali/com/melodix/music/StartupLoadWatchdog.smali',
    'smali/com/melodix/music/NativeAssetRunner.smali',
    'smali/com/melodix/music/NativeHomeShelfRenderer.smali',
    'smali/com/melodix/music/NativeRowList.smali',
    'smali/com/melodix/music/NativeHomePaintRunnable.smali',
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

test('const/high16 literals have the required zeroed low 16 bits', () => {
    const files = [
        'smali/com/melodix/music/MainActivity.smali',
        'smali/com/melodix/music/AndBridge.smali',
        'smali/com/melodix/music/NativeUiUpdateRunnable.smali',
        'smali/com/melodix/music/NativeRowClickListener.smali',
        'smali/com/melodix/music/NativeUiRowFactory.smali',
        'smali/com/melodix/music/NativeImageLoader.smali'
    ];

    for (const file of files) {
        const lines = fs.readFileSync(path.join(repo, file), 'utf8').split(/\r?\n/);
        for (const [index, line] of lines.entries()) {
            const match = line.match(/^\s*const\/high16\s+v\d+,\s*(-?)0x([0-9a-f]+)\b/i);
            if (!match) continue;
            const magnitude = BigInt(`0x${match[2]}`);
            const value = match[1] ? -magnitude : magnitude;
            assert.equal(Number(value & 0xffffn), 0, `${file}:${index + 1} has invalid const/high16 literal`);
        }
    }
});

test('successful authenticated Spotify home load dismisses the native splash', () => {
    const webViewClient = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const pageFinished = webViewClient.match(
        /\.method public final onPageFinished\(Landroid\/webkit\/WebView;Ljava\/lang\/String;\)V([\s\S]*?)\.end method/
    );

    assert.ok(pageFinished, 'WebView page-finished callback should exist');
    assert.match(
        pageFinished[1],
        /sget-boolean v2, Lcom\/melodix\/music\/AppSingleton;->B:Z[\s\S]*?if-eqz v2, :cond_15[\s\S]*?const-string v2, "open\.spotify\.com"[\s\S]*?if-eqz v2, :cond_7\s+goto :cond_5/
    );

    const splashDismiss = pageFinished[1].match(/^\s*:cond_5\s*$([\s\S]*?)^\s*:cond_7\s*$/m);
    assert.ok(splashDismiss, 'authenticated and login routes should share the splash-dismiss block');
    assert.match(splashDismiss[1], /new-instance v8, Lzk0;[\s\S]*?invoke-direct \{v8, v2, v7, v7\}/);
    assert.match(
        splashDismiss[1],
        /const\/4 v8, 0x0\s+sput-boolean v8, Lcom\/melodix\/music\/AppSingleton;->m:Z[\s\S]*?const\/4 v8, -0x1\s+sput v8, Lcom\/melodix\/music\/AppSingleton;->n:I[\s\S]*?sget-boolean v8, Lcom\/melodix\/music\/AppSingleton;->m:Z/
    );
    assert.match(
        splashDismiss[1],
        /iget-object v9, v2, Lcom\/melodix\/music\/MainActivity;->R:Landroid\/widget\/ProgressBar;[\s\S]*?invoke-virtual \{v9, v10\}, Landroid\/view\/View;->setVisibility\(I\)V/
    );
});

test('a stalled Spotify page load leaves the splash and exposes retry after 30 seconds', () => {
    const webViewClient = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const pageStarted = webViewClient.match(
        /\.method public onPageStarted\(Landroid\/webkit\/WebView;Ljava\/lang\/String;Landroid\/graphics\/Bitmap;\)V([\s\S]*?)\.end method/
    );
    const networkError = webViewClient.match(
        /\.method public final onReceivedError\(Landroid\/webkit\/WebView;Landroid\/webkit\/WebResourceRequest;Landroid\/webkit\/WebResourceError;\)V([\s\S]*?)\.end method/
    );
    const watchdog = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/StartupLoadWatchdog.smali'), 'utf8');

    assert.ok(pageStarted, 'WebView page-start callback should exist');
    assert.match(pageStarted[1], /StartupLoadWatchdog;->arm\(Landroid\/webkit\/WebView;\)V/);
    assert.ok(networkError, 'WebView network-error callback should exist');
    assert.match(
        networkError[1],
        /MainActivity;->R:Landroid\/widget\/ProgressBar;[\s\S]*?setVisibility\(I\)V[\s\S]*?MainActivity;->D\(Z\)V/
    );
    assert.match(watchdog, /const-wide\/16 v2, 0x7530/);
    assert.match(watchdog, /MainActivity;->H:Landroidx\/constraintlayout\/widget\/ConstraintLayout;/);
    assert.match(watchdog, /MainActivity;->R:Landroid\/widget\/ProgressBar;/);
    assert.match(watchdog, /sput-boolean v2, Lcom\/melodix\/music\/AppSingleton;->m:Z[\s\S]*?sput v2, Lcom\/melodix\/music\/AppSingleton;->n:I[\s\S]*?MainActivity;->D\(Z\)V/);
    assert.match(watchdog, /WebView;->getProgress\(\)I/);
    assert.match(watchdog, /AppSingleton;->m:Z[\s\S]*?if-eqz v2, :check_page_progress[\s\S]*?AppSingleton;->n:I[\s\S]*?if-nez v2, :show_network_error[\s\S]*?goto :return/);
    assert.match(watchdog, /Lzk0;-><init>\(Lcom\/melodix\/music\/MainActivity;ZI\)V/);
    assert.match(watchdog, /generationAtArm:I[\s\S]*?if-ne v0, v1, :return/);
});

test('full CSS is injected in both Mobile CSS and Wide Window modes', () => {
    const webViewClient = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const pageFinished = webViewClient.match(
        /\.method public final onPageFinished\(Landroid\/webkit\/WebView;Ljava\/lang\/String;\)V([\s\S]*?)\.end method/
    );

    assert.ok(pageFinished, 'WebView page-finished callback should exist');
    assert.match(
        pageFinished[1],
        /const-string v2, "csshack"[\s\S]*?move-result v1[\s\S]*?const-string v2, "css_hacks\.css"[\s\S]*?if-nez v1, :inject_full_css[\s\S]*?const-string v3, "bigwindow"[\s\S]*?if-eqz v1, :cond_12[\s\S]*?:inject_full_css[\s\S]*?invoke-static \{v2\}, Lm9;->d\(Ljava\/lang\/String;\)Ljava\/lang\/String;/
    );
    assert.match(pageFinished[1], /style\.textContent = %s \+ %s/);
    assert.match(pageFinished[1], /goto :cond_12[\s\S]*?:cond_12[\s\S]*?AppSingleton;->z:Ljava\/lang\/String;/);
});

test('the 200 KB Spotify bridge is loaded through the shell, not a single evaluateJavascript', () => {
    const webViewClient = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const pageFinished = webViewClient.match(
        /\.method public final onPageFinished\(Landroid\/webkit\/WebView;Ljava\/lang\/String;\)V([\s\S]*?)\.end method/
    );

    assert.ok(pageFinished, 'WebView page-finished callback should exist');
    const bridgeInjection = pageFinished[1].match(
        /const-string v2, "desktop_spoof\.js"([\s\S]*?)const-string v1, "playlist_sort\.js"/
    );
    assert.ok(bridgeInjection, 'desktop spoof and Spotify bridge injection block should exist');
    const block = bridgeInjection[1];

    assert.match(
        block,
        /invoke-virtual \{v5, v2\}, Ljava\/lang\/StringBuilder;->append\(Ljava\/lang\/String;\)Ljava\/lang\/StringBuilder;[\s\S]*?invoke-virtual \{v0, v1, v8\}, Landroid\/webkit\/WebView;->evaluateJavascript/,
        'the config and the desktop spoof script stay independent from the bridge'
    );
    assert.doesNotMatch(block, /invoke-virtual \{v5, v3\}, Ljava\/lang\/StringBuilder;->append/);
    assert.doesNotMatch(
        block,
        /invoke-virtual \{v0, v3, v8\}, Landroid\/webkit\/WebView;->evaluateJavascript/,
        'a single 200 KB evaluateJavascript call is silently dropped on device'
    );
    assert.match(
        block,
        /const-string v5, "native_ui_shell\.js"[\s\S]*?__sfLoadBundledBridge/,
        'the shell must be injected first and then asked to load the bridge'
    );
});

test('native touch capability reaches JS without enabling the tablet shell on Leanback TV', () => {
    const webViewClient = fs.readFileSync(path.join(repo, 'smali/c91.smali'), 'utf8');
    const pageFinished = webViewClient.match(
        /\.method public final onPageFinished\(Landroid\/webkit\/WebView;Ljava\/lang\/String;\)V([\s\S]*?)\.end method/
    );

    assert.ok(pageFinished, 'WebView page-finished callback should exist');
    assert.match(pageFinished[1], /getPackageManager\(\)[\s\S]*?android\.hardware\.touchscreen[\s\S]*?hasSystemFeature\(Ljava\/lang\/String;\)Z/);
    assert.match(pageFinished[1], /android\.software\.leanback[\s\S]*?hasSystemFeature\(Ljava\/lang\/String;\)Z[\s\S]*?if-eqz v3, :sf_touch_configured[\s\S]*?const\/4 v6, 0x0/);
    assert.match(pageFinished[1], /touchInput: %b/);
    assert.match(pageFinished[1], /filled-new-array\/range \{v9 \.\. v23\}[\s\S]*?const\/16 v2, 0xf/);
});

test('returning from background rearms recovery and restores a completed WebView', () => {
    const activity = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    const onStop = activity.match(/\.method public final onStop\(\)V([\s\S]*?)\.end method/);
    const onResume = activity.match(/\.method public final onResume\(\)V([\s\S]*?)\.end method/);
    const watchdog = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/StartupLoadWatchdog.smali'), 'utf8');

    assert.ok(onStop, 'Activity stop callback should exist');
    assert.match(onStop[1], /iput-boolean v0, p0, Lcom\/melodix\/music\/MainActivity;->sfResumePending:Z/);
    assert.ok(onResume, 'Activity resume callback should exist');
    assert.match(onResume[1], /sfResumePending:Z[\s\S]*?StartupLoadWatchdog;->armAfterResume\(Landroid\/webkit\/WebView;\)V/);
    assert.match(watchdog, /\.method public static armAfterResume\(Landroid\/webkit\/WebView;\)V[\s\S]*?const-wide\/16 v2, 0x1f40/);
    assert.match(watchdog, /WebView;->getProgress\(\)I[\s\S]*?Lzk0;-><init>\(Lcom\/melodix\/music\/MainActivity;ZI\)V[\s\S]*?MainActivity;->D\(Z\)V/);
    assert.match(onResume[1], /window\.__sfEnsureMobileShell\) window\.__sfEnsureMobileShell\(\)/);
});

test('the crash guard is installed before the layout is inflated', () => {
    const guard = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeCrashGuard.smali'), 'utf8');
    const activity = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    const app = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/AppSingleton.smali'), 'utf8');
    const onCreate = activity.match(/\.method public final onCreate\(Landroid\/os\/Bundle;\)V([\s\S]*?)\.end method/);

    assert.ok(onCreate, 'Activity create callback should exist');
    assert.match(
        onCreate[1],
        /NativeCrashGuard;->install\(Landroid\/content\/Context;\)V[\s\S]*?NativeCrashGuard;->showLastReport\(Landroid\/app\/Activity;\)Z[\s\S]*?Le6;->setContentView\(I\)V/,
        'the previous crash report must be shown before the shell layout is inflated'
    );
    assert.match(app, /invoke-super \{p0\}, Landroid\/app\/Application;->onCreate\(\)V[\s\S]*?NativeCrashGuard;->install\(Landroid\/content\/Context;\)V/);
    assert.match(guard, /\.implements Ljava\/lang\/Thread\$UncaughtExceptionHandler;/);
    assert.match(guard, /putString\(Ljava\/lang\/String;Ljava\/lang\/String;\)Landroid\/content\/SharedPreferences\$Editor;/);
    assert.doesNotMatch(
        guard,
        /\.field[^\n]*:[ZBSCIJFD];/,
        'a primitive field descriptor must not end with a semicolon: smali refuses to assemble it'
    );
});

test('a failing native render is recorded instead of killing the process', () => {
    const runnable = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeUiUpdateRunnable.smali'), 'utf8');
    const run = runnable.match(/\.method public final run\(\)V([\s\S]*?)\.end method/);

    assert.ok(run, 'runnable entry point should exist');
    assert.match(run[1], /\.catch Ljava\/lang\/Throwable; \{:try_start_0 \.\. :try_end_0\} :catch_0/);
    assert.match(run[1], /:catch_0\s+move-exception v0[\s\S]*?NativeCrashGuard;->record\(Ljava\/lang\/Throwable;\)V/);
});

test('the crash report is shown before the signature gate and the inflation', () => {
    const activity = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    const onCreate = activity.match(/\.method public final onCreate\(Landroid\/os\/Bundle;\)V([\s\S]*?)\.end method/);

    assert.ok(onCreate, 'Activity create callback should exist');
    const report = onCreate[1].indexOf('NativeCrashGuard;->showLastReport');
    const gate = onCreate[1].indexOf('Lcom/melodix/music/MainActivity;->u()Z');

    assert.ok(report >= 0, 'the report screen should be requested from onCreate');
    assert.ok(gate >= 0, 'the signature gate should exist');
    assert.ok(
        report < gate,
        'the report must be shown before the signature gate, which can close the app without a trace'
    );
});

test('an inflation failure shows the trace instead of killing the launch', () => {
    const activity = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
    const onCreate = activity.match(/\.method public final onCreate\(Landroid\/os\/Bundle;\)V([\s\S]*?)\.end method/);
    const guarded = activity.match(
        /:native_content_try_start\s+invoke-virtual \{v0, v1\}, Le6;->setContentView\(I\)V\s+:native_content_try_end\s+\.catch Ljava\/lang\/Throwable; \{:native_content_try_start \.\. :native_content_try_end\} :native_content_failed([\s\S]*?)\n    :native_content_ok/
    );

    assert.ok(guarded, 'setContentView must be guarded by a try/catch');
    assert.match(guarded[1], /NativeCrashGuard;->record\(Ljava\/lang\/Throwable;\)V/);
    assert.match(guarded[1], /NativeCrashGuard;->excerpt\(Ljava\/lang\/Throwable;\)Ljava\/lang\/String;/);
    assert.match(guarded[1], /TextView;->setText\(Ljava\/lang\/CharSequence;\)V[\s\S]*?Landroid\/app\/Activity;->setContentView\(Landroid\/view\/View;\)V[\s\S]*?return-void/);
});
