const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const read = (file) => fs.readFileSync(path.join(root, file), 'utf8');

function runShell(extraWindow) {
    const calls = [];
    const mainView = { querySelectorAll: () => [] };
    const document = {
        readyState: 'complete',
        documentElement: {},
        querySelector: (selector) => selector === '#main-view' ? mainView : null,
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
    const paintAt = list.indexOf('.method public static paint');
    const paint = list.slice(paintAt);
    const jsonInit = paint.indexOf('JSONArray;-><init>');
    const wipe = paint.indexOf('removeAllViews()V');
    const commit = paint.indexOf(':commit');
    assert.ok(wipe > commit, 'visible container is not wiped before a successful commit');
    assert.ok(wipe > jsonInit, 'JSON parse happens before any wipe');
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
    assert.doesNotMatch(rows, /NativeHomeShelfRenderer;->render/);
    assert.match(rows, /const-string v0, \"Accueil\"/);

    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    assert.match(apply, /:home_keep_cache/);
    assert.match(apply, /nativeHomeJson/);
});

test('bridge loader distinguishes inject, load, error and asset body', () => {
    const asset = read('smali/com/melodix/music/NativeBridgeAsset.smali');
    assert.match(asset, /__sfBridgeLoadStage='inject-src'/);
    assert.match(asset, /__sfBridgeLoadStage='src-loaded'/);
    assert.match(asset, /__sfBridgeLoadStage='src-error'/);
    assert.match(asset, /__sfBridgeAssetServed=true/);
    assert.match(asset, /__sfBridgeIntercepted=true/);
    assert.match(asset, /application\/javascript/);
    assert.match(read('assets/spotify_bridge.js'), /__sfBridgeEntered = true/);
    const diag = read('assets/runtime_diagnostic.js');
    assert.match(diag, /bridgeLoadStage/);
    assert.match(diag, /bridgeAssetServed/);
    assert.match(diag, /bridgeEntered/);
    assert.match(diag, /nativeHomePlaylistCount/);
    assert.match(diag, /nativeHomeRowCount/);
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

test('search payloads do not clear stored home JSON in applyNativeUiData', () => {
    const activity = read('smali/com/melodix/music/MainActivity.smali');
    const applyAt = activity.indexOf('.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V');
    const apply = activity.slice(applyAt, activity.indexOf('.method public final updateNativePlayer', applyAt));
    assert.match(apply, /:home_keep_cache/);
    assert.match(apply, /iget-object v2, p0, Lcom\/melodix\/music\/MainActivity;->nativeHomeJson/);
    const searchBlock = apply.slice(apply.indexOf(':check_search'));
    assert.doesNotMatch(searchBlock, /iput-object p2, p0, Lcom\/melodix\/music\/MainActivity;->nativeHomeJson/);
});
