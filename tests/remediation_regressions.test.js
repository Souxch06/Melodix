const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (rel) => fs.readFileSync(path.join(root, rel), 'utf8');

function extractMethod(src, headerPrefix) {
    const idx = src.indexOf(headerPrefix);
    assert.ok(idx >= 0, `Method starting with "${headerPrefix}" must exist`);
    const end = src.indexOf('.end method', idx);
    assert.ok(end > idx, `Method starting with "${headerPrefix}" must terminate with .end method`);
    return src.slice(idx, end + '.end method'.length);
}

test('WS1/WS2: all remediated Smali files have valid register bounds, resolved jump labels, and safe catch blocks', () => {
    const smaliFiles = [
        'smali/com/melodix/music/AndBridge.smali',
        'smali/com/melodix/music/NativeFetchGuard.smali',
        'smali/com/melodix/music/MainActivity.smali',
        'smali/com/melodix/music/AppSingleton.smali',
        'smali/com/melodix/music/NativeListJsCallback.smali',
        'smali/com/melodix/music/NativeHomeJsonCallback.smali',
        'smali/com/melodix/music/NativeSearchFocusRunnable.smali',
        'smali/com/melodix/music/NativeRowList.smali',
        'smali/com/melodix/music/NativeHomePaintRunnable.smali',
        'smali/com/melodix/music/NativeLogoutRunnable.smali',
        'smali/com/melodix/music/NativeSettingsRowFactory.smali',
        'smali/com/melodix/music/NativeHomeFeed.smali',
        'smali/com/melodix/music/NativeUiRowFactory.smali',
        'smali/com/melodix/music/NativeHomeShelfRenderer.smali',
        'smali/r70.smali',
        'smali/c91.smali',
        'smali/m9.smali',
        'smali/s4.smali',
        'smali/zk0.smali',
        'smali/c40.smali',
    ];

    for (const rel of smaliFiles) {
        const src = read(rel);
        const methods = [...src.matchAll(/^\.method\b([^\n]*)\n([\s\S]*?)^\.end method/gm)];
        assert.ok(methods.length > 0, `${rel} should declare at least one method`);

        for (const m of methods) {
            const header = m[1];
            const body = m[2];
            const localsMatch = body.match(/^\s*\.locals\s+(\d+)/m);
            if (!localsMatch) continue;
            const maxLocal = Number(localsMatch[1]);

            const labels = new Set([...body.matchAll(/^\s*:([A-Za-z0-9_]+)/gm)].map(x => x[1]));

            // Every branch, goto, and catch label must exist within the same method.
            for (const br of body.matchAll(/^\s*(?:if-\w+|goto(?:\/\d+)?)\b[^\n]*?:([A-Za-z0-9_]+)\s*$/gm)) {
                assert.ok(labels.has(br[1]), `${rel} (${header}): undefined branch target :${br[1]}`);
            }
            for (const ct of body.matchAll(/^\s*\.catch(?:all)?\b[^\n]*\{:([A-Za-z0-9_]+)\s*\.\.\s*:([A-Za-z0-9_]+)\}\s*:([A-Za-z0-9_]+)/gm)) {
                assert.ok(labels.has(ct[1]) && labels.has(ct[2]) && labels.has(ct[3]),
                    `${rel} (${header}): undefined .catch range/handler label in ${ct[0]}`);
            }

            // Every local register vN used in instructions must be < .locals N.
            for (const line of body.split('\n')) {
                const trimmed = line.trim();
                if (!trimmed || trimmed.startsWith('#') || trimmed.startsWith('.') || trimmed.startsWith(':')) continue;
                const noStrings = trimmed.replace(/"(?:\\.|[^"])*"/g, '');
                for (const reg of noStrings.matchAll(/\bv(\d+)\b/g)) {
                    assert.ok(Number(reg[1]) < maxLocal,
                        `${rel} (${header}): register v${reg[1]} exceeds .locals ${maxLocal} in "${trimmed}"`);
                }
            }
        }
    }
});

test('WS2: JS <-> Android bridge, callbacks, search focus, and row factories handle valid payloads without inversion', () => {
    const andBridge = read('smali/com/melodix/music/AndBridge.smali');
    const dispatch = extractMethod(andBridge, '.method private final dispatchNativeUi(');
    assert.match(dispatch, /:try_ctx\s*\n\s*if-nez v1, :got_activity/);

    const listCb = read('smali/com/melodix/music/NativeListJsCallback.smali');
    assert.match(listCb, /invoke-virtual \{v0\}, Ljava\/lang\/String;->isEmpty\(\)Z\s*\n\s*move-result v1\s*\n\s*if-nez v1, :done/);
    assert.match(listCb, /"null"[\s\S]*?equals\(Ljava\/lang\/Object;\)Z\s*\n\s*move-result v1\s*\n\s*if-nez v1, :done/);

    const homeCb = read('smali/com/melodix/music/NativeHomeJsonCallback.smali');
    assert.match(homeCb, /invoke-virtual \{v0\}, Ljava\/lang\/String;->length\(\)I\s*\n\s*move-result v1\s*\n\s*const\/4 v2, 0x2\s*\n\s*if-le v1, v2, :done/);
    assert.match(homeCb, /const\/16 v2, 0x5b\s*\n\s*if-ne v1, v2, :done/);
    assert.match(homeCb, /invoke-virtual \{v1\}, Lorg\/json\/JSONArray;->length\(\)I\s*\n\s*move-result v2\s*\n\s*if-lez v2, :done/);

    const searchFocus = read('smali/com/melodix/music/NativeSearchFocusRunnable.smali');
    assert.match(searchFocus, /invoke-virtual \{v0\}, Landroid\/view\/View;->isShown\(\)Z\s*\n\s*move-result v1\s*\n\s*if-eqz v1, :focus_done/);
    assert.match(searchFocus, /check-cast v1, Landroid\/view\/inputmethod\/InputMethodManager;\s*\n\s*if-eqz v1, :focus_done\s*\n\s*const\/4 v2, 0x1\s*\n\s*invoke-virtual \{v1, v0, v2\}, Landroid\/view\/inputmethod\/InputMethodManager;->showSoftInput\(Landroid\/view\/View;I\)Z/);

    const uiRow = read('smali/com/melodix/music/NativeUiRowFactory.smali');
    assert.match(uiRow, /invoke-virtual \{v6\}, Ljava\/lang\/String;->isEmpty\(\)Z\s*\n\s*move-result v0\s*\n\s*if-eqz v0, :native_row_title_ready/);
    assert.match(uiRow, /invoke-virtual \{v9\}, Ljava\/lang\/String;->isEmpty\(\)Z\s*\n\s*move-result v10\s*\n\s*if-nez v10, :native_row_text_column/);

    const mainActivity = read('smali/com/melodix/music/MainActivity.smali');
    assert.match(extractMethod(mainActivity, '.method public final applyNativeUiData('),
        /const-string v0, "screen-title"\s*\n\s*invoke-virtual \{p1, v0\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z\s*\n\s*move-result v1\s*\n\s*if-eqz v1, :check_detail_data/);
    assert.match(extractMethod(mainActivity, '.method public final renderNativeRows('),
        /const-string v0, "Accueil"\s*\n\s*invoke-virtual \{v0, p1\}, Ljava\/lang\/String;->equals\(Ljava\/lang\/Object;\)Z\s*\n\s*move-result v0\s*\n\s*if-eqz v0, :check_lib_grid/);
    const tabMethod = extractMethod(mainActivity, '.method public final styleNativeTab(');
    assert.ok(tabMethod.includes('instance-of v3, v1, Landroid/widget/TextView;\n    if-eqz v3, :native_tab_as_group'));
    assert.ok(tabMethod.includes('instance-of v3, v1, Landroid/view/ViewGroup;\n    if-eqz v3, :native_tab_style_done'));
    const chipsMethod = extractMethod(mainActivity, '.method public final styleNativeLibraryChips(');
    assert.ok(chipsMethod.includes('getChildAt(I)Landroid/view/View;\n    move-result-object v3\n    if-eqz v3, :chip_next'));
    assert.ok(chipsMethod.includes('move-result v5\n    check-cast v3, Landroid/widget/TextView;\n    if-eqz v5, :chip_inactive'));
    assert.ok(read('smali/com/melodix/music/NativeHomeFeed.smali').includes(
        'invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z\n    move-result v10\n    if-nez v10, :next'
    ));
    assert.ok(extractMethod(uiRow, '.method public static applyDrawableBackground(').includes('if-eqz p0, :background_done'));
    assert.ok(extractMethod(uiRow, '.method public static applyDrawableImage(').includes('if-eqz p0, :image_done'));
});

test('WS3: native_ui_shell.js defines cleanText, dispatches profile greeting + HTTPS avatar, handles malformed data, and resets session caches on logout', () => {
    const shellSrc = read('assets/native_ui_shell.js');
    const calls = [];
    const errors = [];
    let currentHref = 'https://open.spotify.com/';

    const makeEl = (props = {}) => ({
        tagName: props.tagName || 'DIV',
        textContent: props.textContent || '',
        innerText: props.innerText || props.textContent || '',
        src: props.src || '',
        currentSrc: props.currentSrc || props.src || '',
        style: {},
        classList: { add() {}, remove() {}, toggle() {}, contains: () => false },
        getAttribute: (k) => (props.attrs && Object.prototype.hasOwnProperty.call(props.attrs, k) ? props.attrs[k] : null),
        setAttribute: () => {},
        querySelector: (sel) => (props.children && props.children[sel]) || null,
        querySelectorAll: (sel) => (props.childrenAll && props.childrenAll[sel]) || [],
        addEventListener: () => {},
        appendChild: () => {},
    });

    let profileWidget = makeEl({
        attrs: { 'aria-label': '  Camille   Laurent \n ' },
        children: {
            img: makeEl({ tagName: 'IMG', src: 'https://i.scdn.co/image/ab6775700000ee8512345678' }),
        },
    });

    const storage = new Map([['melodix_spotify_settings_v1', '{malformed-json']]);
    const makeStorage = () => ({
        getItem: (k) => (storage.has(k) ? storage.get(k) : null),
        setItem: (k, v) => storage.set(k, String(v)),
        clear: () => storage.clear(),
    });

    const sandbox = {
        URL,
        Date,
        Map,
        Set,
        JSON,
        Math,
        Number,
        String,
        Boolean,
        Array,
        Object,
        RegExp,
        Error,
        setTimeout: () => 1,
        clearTimeout: () => {},
        setInterval: () => 1,
        clearInterval: () => {},
        console: {
            error: (...a) => errors.push(a.join(' ')),
            warn: () => {},
            log: () => {},
        },
    };

    const windowObj = {
        ...sandbox,
        __sfMelodixBridgeStarted: true,
        location: {
            get href() { return currentHref; },
            get origin() { return new URL(currentHref).origin; },
            get hostname() { return new URL(currentHref).hostname; },
            get pathname() { return new URL(currentHref).pathname; },
            assign: (u) => { currentHref = u; },
        },
        localStorage: makeStorage(),
        sessionStorage: makeStorage(),
        __sfSearchCache: new Map([['q', [1]]]),
        __sfMediaItemsCache: new Map([['playlists', [2]]]),
        AndBridge: {
            onNativeUiReady: () => calls.push(['ready']),
            onNativeUiRoute: (r) => calls.push(['route', r]),
            onNativeUiData: (k, v) => calls.push(['data', k, v]),
            onNativeListText: (v) => calls.push(['list', v]),
            onNativeHomeRows: (v) => calls.push(['home', v]),
            onNativeProfileImage: (u) => calls.push(['avatar', u]),
            nativeLogout: () => calls.push(['logout']),
            setCanvasDisabled: (v) => calls.push(['canvas', v]),
            manageTSleep: (v) => calls.push(['sleep', v]),
            onSearchCompleted: (v) => calls.push(['search', v]),
            readBundledAsset: () => '',
            injectBundledAsset: () => {},
        },
        addEventListener: () => {},
    };

    const documentObj = {
        readyState: 'complete',
        documentElement: makeEl(),
        head: makeEl(),
        body: makeEl(),
        createElement: (t) => makeEl({ tagName: t.toUpperCase() }),
        addEventListener: () => {},
        querySelector: (sel) => {
            if (sel.includes('user-widget-link')) return profileWidget;
            return null;
        },
        querySelectorAll: () => [],
    };
    windowObj.document = documentObj;
    sandbox.window = windowObj;
    sandbox.document = documentObj;

    vm.runInNewContext(shellSrc, sandbox);

    assert.equal(windowObj.__sfNativeUiShellCompleted, true);
    assert.equal(windowObj.__sfShellLastError, undefined, 'shell must never throw ReferenceError: cleanText is not defined');
    assert.ok(calls.some(c => c[0] === 'avatar' && c[1] === 'https://i.scdn.co/image/ab6775700000ee8512345678'));
    assert.ok(calls.some(c => c[0] === 'data' && c[1] === 'home-greeting' && /,\s*Camille$/.test(c[2])));

    // Malformed non-HTTPS avatar URLs must be ignored rather than sent to native code
    calls.length = 0;
    profileWidget = makeEl({
        attrs: { 'aria-label': 'Camille' },
        children: { img: makeEl({ tagName: 'IMG', src: 'javascript:alert(1)' }) },
    });
    windowObj.__sfRequestSpotifySettings();
    assert.equal(calls.some(c => c[0] === 'avatar'), false, 'non-HTTPS avatar must not be forwarded');
    assert.ok(calls.some(c => c[0] === 'data' && c[1] === 'settings'), 'settings payload still builds cleanly even after malformed storage JSON');

    // Explicit logout clears caches, storage, and profile memoization so re-login re-emits avatar + greeting cleanly
    calls.length = 0;
    assert.equal(windowObj.__sfToggleSpotifySetting('spotify:settings:logout'), true);
    assert.ok(calls.some(c => c[0] === 'logout'));
    assert.equal(windowObj.__sfSearchCache.size, 0);
    assert.equal(windowObj.__sfMediaItemsCache.size, 0);
    assert.equal(storage.size, 0);

    calls.length = 0;
    profileWidget = makeEl({
        attrs: { 'aria-label': 'Nouveau Compte' },
        children: { img: makeEl({ tagName: 'IMG', src: 'https://i.scdn.co/image/ab6775700000ee8599999999' }) },
    });
    windowObj.__sfNativeUiRefresh();
    assert.ok(calls.some(c => c[0] === 'avatar' && c[1] === 'https://i.scdn.co/image/ab6775700000ee8599999999'),
        're-login after logout must re-emit new account avatar');
    assert.ok(calls.some(c => c[0] === 'data' && c[1] === 'home-greeting' && /,\s*Nouveau$/.test(c[2])),
        're-login after logout must re-emit new account greeting');
});

test('WS4: logout hides nativeRoot & resets state, and Android Back button works across player, settings, detail, search, library, and home', () => {
    const mainActivity = read('smali/com/melodix/music/MainActivity.smali');
    const backCallback = read('smali/r70.smali');
    const logoutRunnable = read('smali/com/melodix/music/NativeLogoutRunnable.smali');
    const activityBase = read('smali/androidx/activity/a.smali');

    // 1. Verify ComponentActivity.onBackPressed()V is final and untouched (preventing ART VerifyError on launch)
    assert.match(activityBase, /\.method public final onBackPressed\(\)V/);
    assert.doesNotMatch(mainActivity, /\.method public[^\n]*onBackPressed\(\)V/);

    // 2. Verify single canonical OnBackPressedDispatcher routing (androidx/activity/b.b + Lr70.a -> MainActivity.handleNativeBack()Z)
    //    with predictive back enabled in AndroidManifest.xml and OnBackInvokedDispatcher bound on create/resume (no double-fire in onKeyDown).
    const manifest = read('AndroidManifest.xml');
    assert.match(manifest, /android:enableOnBackInvokedCallback="true"/);

    const dispatcher = read('smali/androidx/activity/b.smali');
    const dispatchMethod = extractMethod(dispatcher, '.method public final b()V');
    assert.match(dispatchMethod, /Lcom\/melodix\/music\/MainActivity;->handleNativeBack\(\)Z\s*\n\s*move-result v0\s*\n\s*if-eqz v0, :native_back_scan_list\s*\n\s*return-void/);

    const r70Handle = extractMethod(backCallback, '.method public a()V');
    assert.match(r70Handle, /Lcom\/melodix\/music\/MainActivity;->handleNativeBack\(\)Z\s*\n\s*move-result v1\s*\n\s*if-eqz v1, :native_back_not_handled\s*\n\s*return-void/);

    const onKeyDown = extractMethod(mainActivity, '.method public final onKeyDown(ILandroid/view/KeyEvent;)Z');
    assert.doesNotMatch(onKeyDown, /const\/4 v0, 0x4/);

    // 2b. Verify Android 15/16 Edge-to-Edge WindowInsets padding applies status/navigation bar insets to nativeRoot (0x7f09022f)
    const windowInsets = read('smali/fj.smali');
    assert.match(windowInsets, /const p1, 0x7f09022f[\s\S]*?invoke-virtual \{p1, v2, v1, v0, v4\}, Landroid\/view\/View;->setPadding\(IIII\)V/);

    // 3. Verify handleNativeBack covers expanded player, settings, detail, search, library, and delegates home cleanly
    const handleBack = extractMethod(mainActivity, '.method public final handleNativeBack()Z');
    for (const screen of ['player', 'settings', 'detail', 'search', 'library']) {
        assert.match(handleBack, new RegExp(`const-string v2, "${screen}"`));
    }
    assert.match(handleBack, /onNativeBackClick\(Landroid\/view\/View;\)V/);
    assert.match(handleBack, /onNativeHomeClick\(Landroid\/view\/View;\)V/);

    // 4. Verify nested detail -> parent detail restoration and search/library -> home restoration
    const nativeBackClick = extractMethod(mainActivity, '.method public final onNativeBackClick(');
    assert.match(nativeBackClick, /nativeDetailParentScreen:Ljava\/lang\/String;/);
    assert.match(nativeBackClick, /const-string v3, "detail"/);

    // 5. Verify logout hides nativeRoot (0x7f09022f -> GONE 0x8), resets AppSingleton.l = false, clears native fields, and G() keeps nativeRoot hidden on accounts.spotify.com
    assert.match(logoutRunnable, /resetNativeStateForLogout\(\)V/);
    const resetLogout = extractMethod(mainActivity, '.method public final resetNativeStateForLogout()V');
    assert.match(resetLogout, /sput-boolean v1, Lcom\/melodix\/music\/AppSingleton;->l:Z/);
    assert.match(resetLogout, /const v0, 0x7f09022f[\s\S]*?const\/16 v1, 0x8[\s\S]*?setVisibility\(I\)V/);
    assert.match(logoutRunnable, /sput-boolean v1, Lcom\/melodix\/music\/MainActivity;->l0:Z/);
    const methodA = extractMethod(mainActivity, '.method public final A()V');
    assert.match(methodA, /sput-boolean v0, Lcom\/melodix\/music\/MainActivity;->l0:Z/);
    assert.match(methodA, /resetNativeStateForLogout\(\)V/);
    const methodG = extractMethod(mainActivity, '.method public final G()V');
    assert.match(methodG, /const v5, 0x7f09022f[\s\S]*?accountsHostHides[\s\S]*?const\/16 v7, 0x8[\s\S]*?setVisibility\(I\)V/);

    // 6. Verify re-login after logout/accounts.spotify.com restores nativeRoot (0x7f09022f -> VISIBLE 0x0) when home data arrives
    const applyData = extractMethod(mainActivity, '.method public final applyNativeUiData(');
    assert.match(applyData, /:home_do_paint\s*\n\s*const v2, 0x7f09022f[\s\S]*?const\/4 v3, 0x0\s*\n\s*invoke-virtual \{v2, v3\}, Landroid\/view\/View;->setVisibility\(I\)V/);
});
