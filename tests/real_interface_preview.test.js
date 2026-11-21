'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const read = file => fs.readFileSync(file, 'utf8');

test('native cards, mini-player and navigation retain their original glass layers', () => {
  for (const name of ['native_card_ripple', 'native_row_ripple']) {
    const s=read(`res/drawable/${name}.xml`);
    assert.match(s, /<item android:drawable="@drawable\/native_glass_surface"\/>/);
    assert.doesNotMatch(s, /mel_surface_card/);
  }
  const mini=read('res/drawable/native_mini_player_bg.xml');
  assert.match(mini, /mel_glass_surface[\s\S]*mel_glass_edge[\s\S]*mel_glass_reflection/);
  assert.doesNotMatch(mini,/mel_mini_bottom|mel_player_mid/);
  const nav=read('res/drawable/native_tabbar_glass.xml');
  assert.match(nav,/mel_nav_scrim[\s\S]*mel_glass_surface[\s\S]*mel_glass_reflection/);
  assert.doesNotMatch(nav,/mel_background/);
  const quick=read('res/drawable/native_quick_tile.xml');
  assert.match(quick,/mel_surface_btn_top[\s\S]*mel_surface_btn/);
});

test('non-demo Preview builds exact source after suite and verifies real launcher without session manipulation', () => {
  const w=read('.github/workflows/real-interface-preview.yml');
  assert.match(w,/needs: suite[\s\S]*?source_ref: \$\{\{ inputs.source_ref \}\}[\s\S]*?build_only: true[\s\S]*?demo_build: false/);
  assert.match(w,/grep -qx '# fail 0'[\s\S]*?grep -qx '# skipped 0'/);
  assert.match(w,/launchable-activity: name='com.melodix.music.MainActivity'/);
  assert.match(w,/sha256sum -c/);
  assert.match(w,/scripts\/smoke_real_preview.py/);
  const s=read('scripts/smoke_real_preview.py');
  assert.match(s,/'monkey', '-p', pkg, '-c', 'android.intent.category.LAUNCHER'/);
  assert.match(s,/no authenticated shell or Spotify session verified/);
  assert.doesNotMatch(s,/evaluateJavascript|CookieManager|pm', 'clear|setBlockNetworkLoads|fixture|proof/i);
  const d=read('.github/workflows/demo-existing-apk-replay.yml');
  assert.match(d,/if: inputs.real_interface_preview == true && inputs.demo_delivery_a != true/);
  assert.match(d,/uses: .\/\.github\/workflows\/real-interface-preview.yml/);
});
