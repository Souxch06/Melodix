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
  assert.match(factory, /sget v1, Lcom\/melodix\/music\/MelColors;->strokeAccent:I[\s\S]*?setStroke\(II\)V/,
    'row stroke = strokeAccent (MEL-BUG-056 vibe)');
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

// MEL-BUG-047: the "État de libraryV3" settings row is itself tappable (except
// while loading) so a phone user can force a libraryV3 check and read the
// resulting error + bearer=0/1 flag in-app, without adb.
test('MEL-BUG-047: the libraryV3 status row forces a check when tapped', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /title: 'État de libraryV3',[\s\S]*?uri: status === 'loading' \? '' : 'melodix:action:retry-library'/,
    'the status row carries the retry action unless a check is running');
  const mainSmali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const at = mainSmali.indexOf('.method public final onNativeSettingsTimeout');
  const body = mainSmali.slice(at, mainSmali.indexOf('.end method', at));
  assert.ok(body.includes('melodix:action:retry-library'),
    'the native fallback keeps the retry action too');
});

// MEL-BUG-051: settings rows always show an icon slot (muted glyph when no
// image), and a shell heartbeat guarantees periodic libraryV3 proof attempts
// even off open.spotify.com, so the Home cannot stay on "loading" forever.
test('MEL-BUG-051: settings icon slot always rendered, placeholder glyph when empty', () => {
  const createAt = factory.indexOf('.method public static create(');
  const create = factory.slice(createAt, factory.indexOf('.end method', createAt));
  assert.ok(!/if-eqz v0, :native_settings_no_avatar\n    new-instance v0, Landroid\/widget\/ImageView;/.test(create),
    'the avatar slot is no longer skipped when image is empty');
  assert.match(create, /:native_settings_icon_placeholder[\s\S]*?"native_cover_placeholder"[\s\S]*?setColorFilter\(I\)V/,
    'empty image falls back to the muted glyph with a muted tint');
});

test('MEL-BUG-051: a heartbeat attempts the library proof every 45s unless signed out', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /__sfProofHeartbeatTimer = window\.setInterval\(function\(\) \{[\s\S]*?requestMediaLibraryProof\('heartbeat', false\)[\s\S]*?\}, 45000\)/,
    'periodic proof attempt exists');
  assert.match(shellSrc, /currentSpotifyAuthUiState\(\) === 'required'\) return/,
    'a definite sign-out still blocks the heartbeat');
  const shellAsset = fs.readFileSync(path.join(repo, 'assets/native_ui_shell.js'), 'utf8');
  assert.ok(shellAsset.includes('__sfProofHeartbeatTimer'), 'assets/native_ui_shell.js must be regenerated');
});

// MEL-BUG-052: Settings also carries the compact self-diagnostic line
// (auth/status/attempts/error/bearer) so one screenshot from either screen
// (Home or Settings) is enough evidence.
test('MEL-BUG-052: a Diagnostic interne row exists in the settings payload', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /title: 'Diagnostic interne',[\s\S]*?auth=' \+ currentSpotifyAuthUiState\(\)[\s\S]*?mediaLibraryBearerSuffix\(\)/,
    'the settings diagnostic row mirrors the home card line (incl. bearer flag)');
  const mainSmali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const at = mainSmali.indexOf('.method public final onNativeSettingsTimeout');
  const body = mainSmali.slice(at, mainSmali.indexOf('.end method', at));
  assert.ok(body.includes('Diagnostic interne'), 'the native fallback has the diagnostic row too');
});

// MEL-BUG-053: a "Rechercher sur Spotify" action (plain WebView navigation to
// open.spotify.com/search) keeps the app usable even when the libraryV3 proof
// is refused — offered in Settings and in the native no-WebView fallback.
// (Home card rows must keep Spotify URIs only, so no row is added there.)
test('MEL-BUG-053: search action row exists in Settings and in the native fallback', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /title: 'Rechercher sur Spotify',[\s\S]*?uri: 'melodix:action:open-search',[\s\S]*?settingValue: 'Ouvrir'/,
    'settings carries the search row');
  const mainSmali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const at = mainSmali.indexOf('melodix:action:open-search');
  assert.ok(at > 0, 'native dispatch knows open-search');
  assert.match(mainSmali.slice(at, at + 700), /https:\/\/open\.spotify\.com\/search[\s\S]*?loadUrl/,
    'open-search navigates the existing WebView to the official search page');
  const line = mainSmali.split('\n').find((l) => l.includes('Diagnostic interne') && l.includes('const-string'));
  const raw = line.slice(line.indexOf('"') + 1, line.lastIndexOf('"')).replace(/\\"/g, '"');
  const rows = JSON.parse(raw);
  assert.ok(rows.some((r) => r.title === 'Rechercher sur Spotify' && r.uri === 'melodix:action:open-search'),
    'native fallback settings include the search row');
});

// MEL-BUG-054 (from the 2026-11-07 15:05 screenshots): no duplicated bearer
// flag on the Home card, punctuation fixed after the retry-suffix strip, two
// more REAL Spotify actions in Settings, accent-tinted icon slots.
test('MEL-BUG-054: home card punctuation is repaired after the retry-suffix strip', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /if \(subtitle && !\/\[\.!\?…\]\$\/\.test\(subtitle\)\) subtitle \+= '\.';/,
    'a stripped sentence regains its final period before the next sentence');
});

test('MEL-BUG-054: Settings offers the online Spotify account page and a real logout action', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /title: 'Compte Spotify en ligne',[\s\S]*?uri: 'melodix:action:open-account'/,
    'account page row present');
  assert.match(shellSrc, /title: sessionProven \? 'Se déconnecter de Spotify' : 'Se connecter à Spotify',[\s\S]*?uri: sessionProven \? 'spotify:settings:logout' : 'melodix:action:open-login'/,
    'logout row (Compte et connexion, unique since MEL-BUG-063 removed the Spotify duplicate) uses the real spotify:settings:logout control when the session is proven');
  assert.equal(shellSrc.split("'Se déconnecter de Spotify'").length - 1, 1,
    'exactly one logout row in settings (no duplicate)');
  const mainSmali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/MainActivity.smali'), 'utf8');
  const at = mainSmali.indexOf('melodix:action:open-account');
  assert.ok(at > 0, 'native dispatch knows open-account');
  assert.match(mainSmali.slice(at, at + 700), /https:\/\/open\.spotify\.com\/account[\s\S]*?loadUrl/,
    'open-account navigates the WebView to the official account page');
  const line = mainSmali.split('\n').find((l) => l.includes('Rechercher sur Spotify') && l.includes('const-string'));
  const raw = line.slice(line.indexOf('"') + 1, line.lastIndexOf('"')).replace(/\\"/g, '"');
  const rows = JSON.parse(raw);
  assert.ok(rows.some((r) => r.uri === 'melodix:action:open-account'), 'fallback has the account row');
  assert.ok(rows.some((r) => r.uri === 'spotify:settings:logout'), 'fallback has the logout row');
});

test('MEL-BUG-054: settings icon slots are accent-tinted with an accent glyph', () => {
  const smali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
  assert.match(smali, /setShape\(I\)V[\s\S]{0,80}?MelColors;->glow:I[\s\S]{0,80}?setColor\(I\)V/,
    'icon slot = soft glow circle (MEL-BUG-066), not a solid square');
  const at = smali.indexOf('\n    :native_settings_icon_placeholder\n');
  const block = smali.slice(at, smali.indexOf(':native_settings_no_avatar', at));
  assert.match(block, /MelColors;->accent:I\s*\n\s*invoke-virtual \{v0, v3\}, Landroid\/widget\/ImageView;->setColorFilter/,
    'placeholder glyph drawn in accent color');
});

// MEL-BUG-055: regression — the accent-tint polish (054) must NOT clobber the
// title register v4 (used later by setText(v4)); writing an int into v4 caused
// a VerifyError and a crash when opening Settings.
test('MEL-BUG-055: the accent-tint block never overwrites the title register v4', () => {
  const smali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
  assert.doesNotMatch(smali, /const v4, |or-int\/2addr v3, v4|move-result-object v4\s*\n\s*invoke-virtual \{v1, v4\}/,
    'no int written into v4 (the title) in the settings row factory');
  // MEL-BUG-066: the slot block now paints a soft glow circle via setShape+glow
  // and must not touch v4 either.
  const at = smali.indexOf('new-instance v1, Landroid/graphics/drawable/GradientDrawable;');
  const slot = smali.slice(at, smali.indexOf('setBackground', at));
  assert.doesNotMatch(slot, /v4/, 'icon slot block leaves the title register v4 alone');
  assert.match(slot, /setShape\(I\)V[\s\S]*?MelColors;->glow:I/, 'slot = glow circle');
  assert.match(smali, /invoke-virtual \{v9, v4\}, Landroid\/widget\/TextView;->setText\(Ljava\/lang\/CharSequence;\)V/,
    'the title is still passed from v4 to setText');
});

// MEL-BUG-056: the Home card offers the real login action when the player auth
// state is still unknown (pending card otherwise has no button at all), and the
// settings rows get a livelier look (accent stroke, 24dp corners, accent pills).
test('MEL-BUG-056: unknown-auth home card carries open-login + retry, filter allows it on loading', () => {
  const shellSrc = fs.readFileSync(path.join(repo, 'scripts/native_ui_shell.source.js'), 'utf8');
  assert.match(shellSrc, /if \(authState === 'unknown'\) \{\s*primaryUri = 'melodix:action:open-login';\s*secondaryUri = 'melodix:action:retry-library';/,
    'unknown auth state shows the login button on the Home card');
  assert.match(shellSrc, /\(status === 'error' \|\| status === 'loading'\) && allowedActions\.indexOf\(stateUri\) >= 0/,
    'payload filter permits real actions (incl. login) on pending/unproven cards');
});

test('MEL-BUG-056: settings cards get accent stroke, 24dp radius and accent pills for actionable values', () => {
  const smali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
  assert.match(smali, /MelColors;->strokeAccent:I\s*\n\s*invoke-virtual \{v3, v0, v1\}, Landroid\/graphics\/drawable\/GradientDrawable;->setStroke\(II\)V/,
    'card stroke uses strokeAccent');
  assert.match(smali, /const\/high16 v0, 0x41800000\s*\n\s*invoke-virtual \{v3, v0\}, Landroid\/graphics\/drawable\/GradientDrawable;->setCornerRadius/,
    'card corner radius is 16dp (MEL-BUG-061, sobre style appli mobile)');
  for (const val of ['Ouvrir', 'Actualiser', 'Se connecter', 'Connecté', 'Renouveler la session']) {
    assert.ok(smali.includes('const-string v3, "' + val + '"'), `pill knows ${val}`);
  }
  assert.match(smali, /:native_settings_pill_accent_fill\s*\n\s*sget v0, Lcom\/melodix\/music\/MelColors;->accent:I\s*\n\s*sget v1, Lcom\/melodix\/music\/MelColors;->background:I/,
    'actionable pills are filled accent with dark text');
});

// MEL-BUG-057: glass vibe — 28dp cards + thin accent ring on the icon slot.
test('MEL-BUG-057: settings icon slot has a thin accent ring', () => {
  const smali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
  assert.match(smali, /const\/high16 v3, 0x41b00000[\s\S]{0,240}?const\/4 v3, 0x2\s*\n\s*sget v11, Lcom\/melodix\/music\/MelColors;->strokeAccent:I\s*\n\s*invoke-virtual \{v1, v3, v11\}, Landroid\/graphics\/drawable\/GradientDrawable;->setStroke\(II\)V/,
    'icon slot ring = 2px strokeAccent');
});

// MEL-BUG-062: ON/OFF settings render as a real styled Switch (accent thumb,
// glow track, non-clickable so the row keeps the toggle action) — mobile-app
// style — while other values keep the text pill.
test('MEL-BUG-062: ON/OFF values render as a styled Switch in settings rows', () => {
  const smali = fs.readFileSync(path.join(repo, 'smali/com/melodix/music/NativeSettingsRowFactory.smali'), 'utf8');
  // Anchor on label *definitions* ("\n    :label\n") — a bare indexOf also
  // matches "goto :label" / "if-eqz ..., :label" references and slices the
  // wrong window.
  const label = (name) => {
    const at = smali.indexOf('\n    :' + name + '\n');
    assert.ok(at >= 0, 'label :' + name + ' is defined');
    return at;
  };
  const pill = label('native_settings_pill');
  const switchBuild = label('native_settings_switch_build');
  const pillText = label('native_settings_pill_text');
  assert.ok(pill < switchBuild && switchBuild < pillText,
    'ON/OFF branch sits between the pill entry and the text-pill path');
  const branch = smali.slice(pill, switchBuild);
  assert.match(branch, /const-string v3, "ON"[\s\S]*?goto :native_settings_switch_build/,
    'ON value branches to the switch builder');
  assert.match(branch, /const-string v3, "OFF"[\s\S]*?:native_settings_pill_text/,
    'OFF value also handled (checked state = false)');
  const sw = smali.slice(switchBuild, pillText);
  assert.match(sw, /new-instance v11, Landroid\/widget\/Switch;/);
  assert.match(sw, /Switch;->setChecked\(Z\)V/);
  assert.match(sw, /MelColors;->textPrimary:I[\s\S]*?setThumbTintList/, 'thumb = white (readable)');
  // MEL-BUG-069: the state list is built with dedicated registers — v12 is the
  // [[I states array, v13 the int[] colors, v0/v1/v3 scalars (v2 stays the row).
  assert.match(sw, /new-array v12, v12, \[\[I[\s\S]*?const v1, 0x101009c[\s\S]*?aput-object v0, v12, v3[\s\S]*?MelColors;->accent:I[\s\S]*?MelColors;->surfaceBtn:I[\s\S]*?ColorStateList;-><init>\(\[\[I\[I\)V[\s\S]*?setTrackTintList/,
    'track = state list: accent when checked, surfaceBtn when off (MEL-BUG-066/069)');
  assert.match(sw, /setClickable\(Z\)V\s*\n\s*invoke-virtual \{v11, v0\}, Landroid\/view\/View;->setFocusable\(Z\)V/,
    'switch itself not clickable (the row dispatches the toggle)');
  assert.match(sw, /goto :native_settings_row_tail/, 'switch path rejoins the common row tail');
});
