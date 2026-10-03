import assert from 'node:assert/strict';
import test from 'node:test';

import {
  spotifyIdFromUri,
  subtitleToArtists,
  entityCoverUrl,
} from '../embedEntity';

test('spotifyIdFromUri', () => {
  assert.equal(
    spotifyIdFromUri('spotify:track:4uLU6hMCjMI75M1A2tKUQC'),
    '4uLU6hMCjMI75M1A2tKUQC'
  );
  assert.equal(spotifyIdFromUri('spotify:album:abc'), 'abc');
  assert.equal(spotifyIdFromUri('nope'), null);
  assert.equal(spotifyIdFromUri(undefined), null);
  assert.equal(spotifyIdFromUri('spotify:track:'), null);
});

test('subtitleToArtists', () => {
  assert.deepEqual(subtitleToArtists('Daft Punk'), ['Daft Punk']);
  assert.deepEqual(subtitleToArtists('A, B & C'), ['A', 'B', 'C']);
  assert.deepEqual(subtitleToArtists(''), []);
  assert.deepEqual(subtitleToArtists(undefined), []);
});

test('entityCoverUrl priorise visualIdentity (plus grande image)', () => {
  const url = entityCoverUrl({
    visualIdentity: {
      image: [
        { url: 'small.jpg', maxWidth: 64 },
        { url: 'big.jpg', maxWidth: 640 },
      ],
    },
    coverArt: { sources: [{ url: 'fallback.jpg' }] },
  });
  assert.equal(url, 'big.jpg');
});

test('entityCoverUrl retombe sur coverArt', () => {
  assert.equal(
    entityCoverUrl({ coverArt: { sources: [{ url: 'cover.jpg' }] } }),
    'cover.jpg'
  );
  assert.equal(entityCoverUrl({}), null);
});
