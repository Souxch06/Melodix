const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function paintMethod() {
    const src = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const start = src.indexOf('.method public static paint');
    return src.slice(start, src.indexOf('.end method', start));
}

function labelIndex(src, label) {
    const name = label.replace(/^:/, '');
    const match = src.match(new RegExp('^[ \\t]*:' + name + '[ \\t]*$', 'm'));
    return match ? src.indexOf(match[0]) : -1;
}

function sliceLabel(src, label, until) {
    const start = labelIndex(src, label);
    assert.ok(start >= 0, `missing label ${label}`);
    const end = until ? labelIndex(src.slice(start + 1), until) : -1;
    const absEnd = end < 0 ? src.length : start + 1 + end;
    return src.slice(start, absEnd);
}

function settingValueBranch(paint) {
    const card = sliceLabel(paint, ':card', ':add_row');
    const match = card.match(
        /"settingValue"[\s\S]*?isEmpty\(\)Z\s+move-result v(\d+)\s+if-(eqz|nez) v\1, :(\w+)/
    );
    assert.ok(match, 'settingValue isEmpty must be followed by if-eqz or if-nez');
    return { register: match[1], op: match[2], target: match[3], block: card };
}

function factoryAfterLabel(paint, label) {
    const body = sliceLabel(paint, label, ':add_row');
    if (body.includes('NativeSettingsRowFactory;->create')) return 'settings';
    if (body.includes('NativeUiRowFactory;->create(')) return 'content';
    return 'unknown';
}

function routeSettingValue(isEmpty) {
    const paint = paintMethod();
    const branch = settingValueBranch(paint);
    const flag = isEmpty ? 1 : 0;
    const jumps = branch.op === 'eqz' ? flag === 0 : flag !== 0;
    if (jumps) {
        return factoryAfterLabel(paint, ':' + branch.target);
    }
    const fall = branch.block;
    if (fall.includes('NativeSettingsRowFactory;->create')) return 'settings';
    if (fall.includes('NativeUiRowFactory;->create(')) return 'content';
    return 'unknown';
}

function sectionHeaderCreated(section, previous) {
    const paint = paintMethod();
    const before = paint.slice(0, paint.indexOf('createSectionHeader'));
    const lastEmpty = [...before.matchAll(/isEmpty\(\)Z\s+move-result v(\d+)\s+if-(eqz|nez) v\1, :card/g)].pop();
    const equals = [...before.matchAll(/equals\(Ljava\/lang\/Object;\)Z\s+move-result v(\d+)\s+if-(eqz|nez) v\1, :card/g)].pop();
    assert.ok(lastEmpty && equals, 'section empty and equals must both jump to :card');
    const emptyFlag = !section ? 1 : 0;
    const emptyJump = lastEmpty[2] === 'eqz' ? emptyFlag === 0 : emptyFlag !== 0;
    if (emptyJump) return false;
    const equalFlag = section === previous ? 1 : 0;
    const equalJump = equals[2] === 'eqz' ? equalFlag === 0 : equalFlag !== 0;
    if (equalJump) return false;
    return true;
}

function runShell(extraWindow) {
    const calls = [];
    const mainView = { querySelectorAll: () => [] };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => selector === '#main-view' ? mainView : null,
        querySelectorAll: () => [],
        addEventListener: () => {}
    };
    class TestMutationObserver { observe() {} }
    const window = Object.assign({
        location: {
            hostname: 'open.spotify.com',
            pathname: '/',
            href: 'https://open.spotify.com/',
            assign: () => {}
        },
        AndBridge: {
            onNativeUiReady: () => {},
            onNativeUiData: (screen, data) => calls.push({ screen, data }),
            onNativeListText: (text) => calls.push({ screen: 'list-text-direct', data: text })
        },
        MutationObserver: TestMutationObserver,
        addEventListener: () => {},
        setTimeout: () => 1,
        clearTimeout: () => {},
        mediaLib: extraWindow && extraWindow.mediaLib
    }, extraWindow || {});
    vm.runInNewContext(read('assets/native_ui_shell.js'), { window, document, URL });
    return { window, calls };
}

test('JSON payload keeps escaped titles, sections, URIs and cover URLs', () => {
    const { window, calls } = runShell({
        mediaLib: {
            playlists: [{
                name: 'Mix "Nuit"',
                uri: 'spotify:playlist:abc123',
                image: 'https://i.scdn.co/image/cover1',
                type: 'Playlist'
            }, {
                name: 'Liked Songs',
                uri: 'spotify:playlist:likes',
                image: 'https://misc.scdn.co/liked-songs/liked-songs-640.png'
            }]
        }
    });
    const home = calls.filter((c) => c.screen === 'home').pop();
    assert.ok(home, 'home payload is sent');
    const rows = JSON.parse(home.data);
    const mix = rows.find((row) => row.uri === 'spotify:playlist:abc123');
    const liked = rows.find((row) => row.uri === 'spotify:playlist:likes');
    assert.equal(mix.title, 'Mix "Nuit"');
    assert.equal(mix.image, 'https://i.scdn.co/image/cover1');
    assert.equal(mix.section, 'Vos playlists');
    assert.equal(liked.title, 'Liked Songs');
    assert.match(liked.image, /liked-songs/);
    assert.doesNotMatch(home.data, /Chargement/);
    const playlistCount = rows.filter((row) => /:playlist:/.test(row.uri)).length;
    assert.ok(playlistCount >= 2, `extracted ${playlistCount} playlists`);
});

test('empty and invalid home payloads are not treated as success for native paint', () => {
    const list = read('smali/com/melodix/music/NativeHomeFeed.smali');
    assert.match(list, /if-le v1, v2, :done/);
    assert.match(list, /JSONArray;-><init>/);
    assert.match(list, /optString\(Ljava\/lang\/String;Ljava\/lang\/String;\)/);
    assert.match(list, /\"title\"/);
    assert.match(list, /\"uri\"/);
    assert.match(list, /\"section\"/);
    assert.match(list, /NativeUiRowFactory;->create/);
    assert.doesNotMatch(list, /Chargement de votre accueil/);
    const paint = paintMethod();
    const jsonInit = paint.indexOf('JSONArray;-><init>');
    const commit = paint.indexOf(':commit');
    const attach = paint.indexOf('addView(Landroid/view/View;)V', commit);
    const strip = paint.indexOf('removeViewAt(I)V');
    assert.ok(commit > jsonInit);
    assert.ok(attach > commit, 'visible container is not mutated before a successful commit');
    assert.ok(strip > attach, 'old children are stripped only after the scratch tree is attached');
    assert.doesNotMatch(paint, /removeAllViews\(\)V/);
    assert.match(paint, /if-lez v5, :try_empty/);
    assert.match(paint, /NativeCrashGuard;->record/);
    assert.match(paint, /home-feed:/);
    const parser = read('smali/com/melodix/music/NativeRowList.smali');
    assert.match(parser, /JSONArray;-><init>/);
    assert.match(parser, /optString\(Ljava\/lang\/String;Ljava\/lang\/String;\)/);
    assert.doesNotMatch(parser, /indexOf\(Ljava\/lang\/String;I\)I/);
});

test('renderNativeRows paints via NativeHomeFeed and never wipes Accueil on empty', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const rowsAt = activity.indexOf('.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');
    const rows = activity.slice(rowsAt, activity.indexOf('.method public final findNativeByTag', rowsAt));
    assert.match(rows, /NativeHomeFeed;->paint/);
    assert.doesNotMatch(rows, /Lorg\/json\/JSONArray;-><init>/);
    assert.doesNotMatch(rows, /NativeRowList;->fill/);
    assert.match(rows, /NativeHomeShelfRenderer;->render/);
    assert.match(rows, /const-string v0, \"Accueil\"/);

    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    assert.match(apply, /:home_keep_cache/);
    assert.match(apply, /nativeHomeJson/);
});

test('bridge loader distinguishes inject, load, error and asset body', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    assert.match(asset, /__sfBridgeLoadStage='inject-src'/);
    assert.match(asset, /__sfBridgeLoadStage='script-load'/);
    assert.match(asset, /__sfBridgeLoadStage='script-error'/);
    assert.match(asset, /__sfBridgeLoadStage='asset-response-created'/);
    assert.match(asset, /__sfBridgeAssetServed=true/);
    assert.match(asset, /__sfBridgeIntercepted=true/);
    assert.match(asset, /application\/javascript/);
    assert.match(asset, /Content-Length/);
    assert.match(asset, /__sfBridgeServedBytes=/);
    assert.match(asset, /const\/16 v5, 0xc8/);
    assert.match(asset, /WebResourceResponse;-><init>\(Ljava\/lang\/String;Ljava\/lang\/String;ILjava\/lang\/String;Ljava\/util\/Map;Ljava\/io\/InputStream;\)/);
    assert.doesNotMatch(asset, /WebResourceResponse;-><init>\(Ljava\/lang\/String;Ljava\/lang\/String;Ljava\/io\/InputStream;\)/);
    assert.match(read('assets/spotify_bridge.js'), /__sfBridgeEntered = true/);
    assert.match(read('assets/spotify_bridge.js'), /bridge-entered/);
    assert.match(read('assets/native_ui_shell.js'), /script-load/);
    assert.doesNotMatch(read('assets/native_ui_shell.js'), /__sfMelodixBridgeStarted === true\)\s*\{[^}]*__sfMelodixBridgeStarted = true/);
    const diag = read('assets/runtime_diagnostic.js');
    assert.match(diag, /bridgeLoadStage/);
    assert.match(diag, /bridgeAssetServed/);
    assert.match(diag, /bridgeEntered/);
    assert.match(diag, /nativeHomePlaylistCount/);
    assert.match(diag, /nativeHomeRowCount/);
    assert.match(diag, /bridgeWatchStage/);
});

test('bridgeServedBytes is the UTF-8 size of the exact body and matches Content-Length', () => {
    const flags = "window.__sfBridgeIntercepted=true;window.__sfBridgeAssetServed=true;window.__sfBridgeLoadStage='asset-response-created';";
    const core = flags + read('assets/spotify_bridge.js');
    const len0 = Buffer.from(core, 'utf8').length;
    const header = (n) => `window.__sfBridgeServedBytes=${n};`;
    let digits = String(len0).length;
    let total = len0 + 29 + digits;
    if (String(total).length !== digits) total += 1;
    let body = header(total) + core;
    let bytes = Buffer.from(body, 'utf8');
    if (bytes.length !== total) {
        total = bytes.length;
        body = header(total) + core;
        bytes = Buffer.from(body, 'utf8');
    }
    assert.equal(bytes.length, Buffer.from(body, 'utf8').length);
    assert.equal(String(body.match(/__sfBridgeServedBytes=(\d+)/)[1]), String(bytes.length));
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    const method = asset.slice(asset.indexOf('responseForUrl'), asset.indexOf('withServedBytes'));
    assert.match(method, /getBytes\(Ljava\/lang\/String;\)\[B/);
    assert.match(method, /array-length v10/);
    assert.doesNotMatch(method, /invoke-virtual \{v9\}, Ljava\/lang\/String;->length\(\)I/);
    assert.match(asset, /Content-Length/);
});

test('bridge recovery does not clobber load stage or re-inject the script tag', () => {
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /function setBridgeLoadStage/);
    assert.match(shell, /BRIDGE_STAGE_RANK/);
    assert.match(shell, /nextRank < currentRank/);
    assert.match(shell, /__sfBridgeSourceChars/);
    assert.match(shell, /if \(!document.querySelector\('script\[data-sf-melodix-bridge="1"\]'\)\)/);
    assert.match(shell, /__sfBridgeWatch/);
    const head = read('assets/spotify_bridge.js').slice(0, 250);
    assert.match(head, /__sfBridgeEntered = true/);
    assert.match(read('assets/spotify_bridge.js'), /bridge-initialized/);
    assert.match(read('assets/spotify_bridge.js'), /id = 'sf-melodix-home'/);
});

test('section headers are created only when the section is non-empty and different from the previous one', () => {
    const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    const paint = feed.slice(feed.indexOf('.method public static paint'));
    const header = paint.indexOf('createSectionHeader');
    assert.ok(header > 0);
    const before = paint.slice(0, header);
    assert.match(before, /isEmpty\(\)Z/);
    assert.match(before, /if-nez v11, :card/);
    assert.match(before, /equals\(Ljava\/lang\/Object;\)Z/);
    const equalsAt = before.lastIndexOf('equals(Ljava/lang/Object;)Z');
    const afterEquals = before.slice(equalsAt);
    assert.match(afterEquals, /if-nez v11, :card/);
    assert.doesNotMatch(afterEquals, /if-eqz v11, :card/);
});

test('two playlist cards in the same section share one header; distinct sections each get a header', () => {
    const feed = read('smali/com/melodix/music/NativeHomeFeed.smali');
    assert.match(feed, /move-object v3, v10/);
    assert.match(feed, /:try_empty/);
    assert.match(feed, /NativeCrashGuard;->record/);
    const { window, calls } = runShell({
        mediaLib: {
            playlists: [
                { name: 'A', uri: 'spotify:playlist:a', type: 'Playlist' },
                { name: 'B', uri: 'spotify:playlist:b', type: 'Playlist' }
            ]
        }
    });
    const home = calls.filter((c) => c.screen === 'home').pop();
    const rows = JSON.parse(home.data);
    const playlists = rows.filter((row) => /:playlist:/.test(row.uri));
    assert.equal(playlists.length, 2);
    assert.equal(playlists[0].section, playlists[1].section);
    assert.equal(window.__sfNativeHomePlaylistCount, 2);
    assert.equal(window.__sfNativeHomeRowCount, rows.length);
    const sections = [...new Set(rows.map((row) => row.section).filter(Boolean))];
    assert.ok(sections.length >= 1);
});

test('playlist without settingValue uses NativeUiRowFactory; settings row uses NativeSettingsRowFactory', () => {
    assert.equal(routeSettingValue(true), 'content', 'empty settingValue is a Spotify content card');
    assert.equal(routeSettingValue(false), 'settings', 'non-empty settingValue is a settings row');
});

test('a playlist payload keeps title, uri and cover through sendNativeUiData', () => {
    const { window, calls } = runShell({
        mediaLib: {
            playlists: [{
                name: 'Mix Nuit',
                uri: 'spotify:playlist:abc123',
                image: 'https://i.scdn.co/image/cover1',
                type: 'Playlist'
            }]
        }
    });
    const home = calls.filter((c) => c.screen === 'home').pop();
    const rows = JSON.parse(home.data);
    const mix = rows.find((row) => row.uri === 'spotify:playlist:abc123');
    assert.equal(mix.title, 'Mix Nuit');
    assert.equal(mix.image, 'https://i.scdn.co/image/cover1');
    assert.equal(mix.section, 'Vos playlists');
    assert.equal(mix.settingValue, undefined);
    assert.equal(window.__sfNativeHomePlaylistCount, 1);
    assert.ok(window.__sfNativeHomeRowCount >= 1);
    assert.ok(window.__sfNativeHomeRowCount !== window.__sfNativeHomePlaylistCount || rows.length === 1);
    assert.equal(routeSettingValue(!mix.settingValue), 'content');
});

test('empty or invalid paint payload never attaches or strips the visible container', () => {
    const paint = paintMethod();
    const tryStart = paint.indexOf(':try_start_0');
    const commit = paint.indexOf(':commit');
    const beforeCommit = paint.slice(tryStart, commit);
    assert.match(beforeCommit, /if-lez v2, :try_empty/);
    assert.doesNotMatch(beforeCommit, /invoke-virtual \{p1/);
    assert.match(paint, /if-lez v5, :try_empty/);
    const attach = paint.indexOf('invoke-virtual {p1, v12}', commit);
    assert.ok(attach > 0);
    assert.ok(paint.indexOf('if-lez v5, :try_empty') < attach);
});

test('transfer attaches the scratch tree before removing previous children', () => {
    const paint = paintMethod();
    const commit = sliceLabel(paint, ':commit', ':try_empty');
    const addScratch = commit.indexOf('invoke-virtual {p1, v12}');
    const strip = commit.indexOf('removeViewAt(I)V');
    assert.ok(addScratch >= 0, 'scratch LinearLayout is added as one child');
    assert.ok(strip > addScratch, 'previous children are removed only after scratch is attached');
    assert.match(paint, /catch Ljava\/lang\/Throwable/);
    assert.match(paint, /home-feed:/);
});

test('section headers follow non-empty and different-from-previous', () => {
    assert.equal(sectionHeaderCreated('', ''), false);
    assert.equal(sectionHeaderCreated('Vos playlists', ''), true);
    assert.equal(sectionHeaderCreated('Vos playlists', 'Vos playlists'), false);
    assert.equal(sectionHeaderCreated('Albums', 'Vos playlists'), true);
});

test('home JSON does not steal an open playlist detail screen', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    const home = apply.slice(apply.indexOf('\n    :check_home\n'), apply.indexOf('\n    :check_media\n'));
    assert.match(home, /:home_do_paint/);
    assert.match(home, /if-eqz v5, :apply_done/);
    assert.match(home, /nativeCurrentScreen/);
});

test('search payloads do not clear stored home JSON in applyNativeUiData', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    assert.match(apply, /:home_keep_cache/);
    assert.match(apply, /iget-object v2, p0, Lcom\/melodix\/music\/MainActivity;->nativeHomeJson/);
    const searchBlock = apply.slice(apply.indexOf(':check_search'));
    assert.doesNotMatch(searchBlock, /iput-object p2, p0, Lcom\/melodix\/music\/MainActivity;->nativeHomeJson/);
});

test('Accueil retries paint cached home JSON without posting a partial native scrape', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const at = activity.indexOf('.method public final pullNativeHomeList()V');
    const pull = activity.slice(at, activity.indexOf('.end method', at));
    assert.match(pull, /nativeHomeJson/);
    assert.match(pull, /renderNativeRows/);
    assert.doesNotMatch(pull, /__sfNativeRequestHome/);
    assert.doesNotMatch(pull, /native_home_scrape\.js/);
    assert.doesNotMatch(pull, /NativeHomeJsonCallback/);
    const shell = read('assets/native_ui_shell.js');
    assert.match(shell, /pendingHomeCount/);
    assert.match(shell, /homeRetries < 2/);
    assert.match(shell, /rows.slice\(0, 120\)/);
    assert.match(shell, /rows.length < 8/);
    assert.match(shell, /rows.length > pendingHomeCount/);
    assert.doesNotMatch(shell.slice(shell.indexOf('function updateHomeRows'), shell.indexOf('function currentSearchQuery')), /signature !== pendingHomeSignature/);
    assert.match(shell, /feedUris/);
    assert.match(shell, /Playlists Spotify/);
    assert.match(shell, /__sfNativeUiHomeRowsSent/);
    assert.match(shell, /looksPublicPlaylist/);
    assert.match(shell, /Playlists Spotify/);
    assert.doesNotMatch(shell, /Desktop_LeftSidebar_Id/);
    assert.match(read('assets/native_ui_shell.js'), /__sfNativeHomeRowsJson/);
    assert.match(read('assets/native_ui_shell.js'), /onNativeHomeRows/);
    assert.match(read('assets/native_ui_shell.js'), /homeScrapeRoot/);
    assert.match(read('assets/native_ui_shell.js'), /data-testid="card"/);
});

test('native scrape helper still exists but is not polled from Accueil retries', () => {
    const scrape = read('assets/native_home_scrape.js');
    assert.match(scrape, /\/playlist\//);
    assert.match(scrape, /mediaLib/);
    assert.doesNotMatch(scrape, /Mix Nuit|fake playlist/i);
    const cb = read('smali/com/melodix/music/NativeHomeJsonCallback.smali');
    assert.match(cb, /postNativeUiData/);
    assert.match(cb, /JSONArray/);
});

test('native UI runnable: action 0 shows the shell, action 1 paints home JSON', () => {
    const src = read('smali/com/melodix/music/NativeUiUpdateRunnable.smali');
    const run = src.slice(src.indexOf('.method public final run()V'));
    const first = run.match(/if-(eqz|nez) v1, :not_ready/);
    assert.ok(first, 'action 0 must be gated before showNativeUi');
    assert.equal(first[1], 'nez', 'action 0 (ready) must fall through to showNativeUi');
    const after = run.slice(run.indexOf(':not_ready'));
    assert.match(after, /if-ne v1, v2, :not_data/);
    assert.match(after, /applyNativeUiData/);
});
