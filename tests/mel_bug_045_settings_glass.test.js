const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const repo = path.resolve(__dirname, '..');
const factory = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
const main = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');

// MEL-BUG-045: settings rows get the Apple-glass treatment (MEL-BUG-039 palette)
// instead of the flat opaque gray, and the native fallback lists every section.
test('MEL-BUG-045: settings rows use the glass palette', () => {
  assert.match(factory, /sget v0, Lcom\/melodix\/music\/MelColors;->glassCard:I[\s\S]*?setColor\(I\)V/,
    'row fill = translucent glassCard');
  assert.match(factory, /sget v1, Lcom\/melodix\/music\/MelColors;->glassStroke:I[\s\S]*?setStroke\(II\)V/,
    'row stroke = glassStroke');
  assert.match(factory, /sget v0, Lcom\/melodix\/music\/MelColors;->glassFill:I[\s\S]*?"ON"/,
    'default pill fill = glassFill (ON keeps the green accent)');
  assert.ok(!factory.includes('-0xe7e7e8'), 'flat opaque row color is gone');
  assert.ok(factory.includes('-0xe128a0'), 'ON pill keeps the emerald accent');
  assert.ok(factory.includes('-0xea194'), 'logout pill keeps the red accent');
});

test('MEL-BUG-045: the native fallback lists every settings section with real actions', () => {
  const at = main.indexOf('.method public final onNativeSettingsTimeout');
  const body = main.slice(at, main.indexOf('.end method', at));
  for (const section of ['État', 'Compte et connexion', 'Spotify', 'Apparence et thème', 'Préférences de lecture', 'Notifications']) {
    assert.ok(body.includes(`\\"section\\":\\"${section}\\"`), `fallback has section ${section}`);
  }
  for (const uri of ['melodix:action:retry-settings', 'melodix:action:open-login', 'melodix:action:retry-library', 'melodix:action:open-notifications', 'melodix:setting:autoplay', 'melodix:setting:canvas', 'melodix:setting:bg_audio']) {
    assert.ok(body.includes(uri), `fallback row action ${uri} present and dispatchable`);
  }
  assert.ok(body.includes('Actualiser la biblioth'), 'library refresh row present');
  // version row is appended natively (appendNativeAboutRows), not duplicated in the fallback JSON
  assert.ok(!body.includes('À propos'), 'no duplicate À propos row in the fallback JSON');
  assert.match(body, /appendNativeAboutRows/);
});
