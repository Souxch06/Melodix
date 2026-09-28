import assert from 'node:assert/strict';
import test from 'node:test';

import {
  mainArtistOf,
  normalizeArtist,
  normalizeTitle,
  tokenSimilarity,
} from '../normalization';

test('normalizeTitle supprime les accents et plie en minuscules', () => {
  assert.equal(normalizeTitle('Été Chaud').base, 'ete chaud');
  assert.equal(normalizeTitle('Ångström').base, 'angstrom');
});

test('normalizeTitle retire les featuring', () => {
  assert.equal(normalizeTitle('One More Time (feat. Romanthony)').base, 'one more time');
  assert.equal(normalizeTitle('Titre ft. Bidule').base, 'titre');
  assert.equal(normalizeTitle('Titre featuring Bb').base, 'titre');
});

test("normalizeTitle retire le contenu entre parenthèses et crochets", () => {
  assert.equal(normalizeTitle('Song (Radio Edit)').base, 'song');
  assert.equal(normalizeTitle('Song [Deluxe Version]').base, 'song');
});

test("normalizeTitle préserve les indicateurs de version", () => {
  const remixed = normalizeTitle('Song (Remix)');
  assert.equal(remixed.base, 'song');
  assert.deepEqual(remixed.versionFlags, ['remix']);

  const live = normalizeTitle('Song - Live at Wembley');
  assert.equal(live.base, 'song at wembley');
  assert.deepEqual(live.versionFlags, ['live']);

  const clean = normalizeTitle('Song');
  assert.deepEqual(clean.versionFlags, []);
});

test("normalizeTitle casse vide / ponctuation seule", () => {
  assert.equal(normalizeTitle('!!!').base, '');
  assert.equal(normalizeTitle('').base, '');
});

test('normalizeArtist tolère ponctuation et accents', () => {
  assert.equal(normalizeArtist('Daft Punk!'), 'daft punk');
  assert.equal(normalizeArtist('  Beyoncé  '), 'beyonce');
});

test('mainArtistOf garde le premier artiste déclaré', () => {
  assert.equal(mainArtistOf('Daft Punk feat. Romanthony'), 'daft punk');
  assert.equal(mainArtistOf('A & B'), 'a');
  assert.equal(mainArtistOf('A, B'), 'a');
  assert.equal(mainArtistOf('A x B'), 'a');
});

test('tokenSimilarity : identique = 1, disjoint = 0', () => {
  assert.equal(tokenSimilarity('one more time', 'one more time'), 1);
  assert.equal(tokenSimilarity('abc', 'xyz'), 0);
  assert.equal(tokenSimilarity('', 'xyz'), 0);
});

test('tokenSimilarity ignore l ordre des mots', () => {
  const score = tokenSimilarity('more one time', 'one more time');
  assert.equal(score, 1);
  const partial = tokenSimilarity('one more', 'one more time');
  assert.ok(partial > 0.5 && partial < 1);
});
