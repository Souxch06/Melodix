const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const test = require('node:test');
const { JSDOM } = require('jsdom');

const root = path.resolve(__dirname, '..');
const source = fs.readFileSync(path.join(root, 'scripts/spotify_bridge.source.js'), 'utf8');
const start = source.indexOf('    function favoriteControlState(button) {');
const end = source.indexOf('    window.actSeek = function(pos) {', start);
assert.ok(start >= 0 && end > start, 'favorite toggle implementation exists');
const favoriteBlock = source.slice(start, end);

function fixture(checked, label) {
    const dom = new JSDOM(`<aside data-testid="now-playing-bar"><div data-testid="now-playing-widget"><button data-testid="add-button" aria-checked="${checked}" aria-label="${label}"></button></div></aside>`, { runScripts: 'outside-only' });
    const button = dom.window.document.querySelector('button');
    button.addEventListener('click', () => {
        const liked = button.getAttribute('aria-checked') !== 'true';
        button.setAttribute('aria-checked', String(liked));
        button.setAttribute('aria-label', liked ? 'Remove from Liked Songs' : 'Add to Liked Songs');
    });
    dom.window.updateFullscreenUI = () => {};
    dom.window.updMedia = () => {};
    vm.runInContext(favoriteBlock, dom.getInternalVMContext());
    return { dom, button };
}

test('heart on a liked track removes the like once and waits for Spotify confirmation', async () => {
    const { dom, button } = fixture('true', 'Remove from Liked Songs');
    dom.window.actAddToFav();
    await new Promise((resolve) => setTimeout(resolve, 250));
    assert.equal(button.getAttribute('aria-checked'), 'false');
    assert.equal(dom.window.isfav, false);
    assert.equal(dom.window.__sfFavoriteActionStatus, 'confirmed');
    dom.window.close();
});

test('heart on an unliked track adds the like and confirms the resulting state', async () => {
    const { dom, button } = fixture('false', 'Add to Liked Songs');
    dom.window.actAddToFav();
    await new Promise((resolve) => setTimeout(resolve, 250));
    assert.equal(button.getAttribute('aria-checked'), 'true');
    assert.equal(dom.window.isfav, true);
    assert.equal(dom.window.__sfFavoriteActionStatus, 'confirmed');
    dom.window.close();
});

test('unknown or disabled favorite state is not blindly toggled', () => {
    const dom = new JSDOM('<aside data-testid="now-playing-bar"><button data-testid="add-button" aria-label="Heart" aria-disabled="true"></button></aside>', { runScripts: 'outside-only' });
    let clicks = 0;
    dom.window.document.querySelector('button').addEventListener('click', () => { clicks += 1; });
    vm.runInContext(favoriteBlock, dom.getInternalVMContext());
    dom.window.actAddToFav();
    assert.equal(clicks, 0);
    assert.equal(dom.window.__sfFavoriteActionStatus, 'unconfirmed');
    dom.window.close();
});
