import assert from 'node:assert/strict';
import test from 'node:test';

import { ApiError } from '../../config/types';
import { TtlCache } from '../../cache/ttlCache';
import { __resetServiceGuards } from '../../net/serviceGuard';
import {
  createSpotifyMetadataProvider,
  type SpotifyProviderDeps,
} from '../spotifyMetadataProvider';
import type { SpotifyRawAlbumHit, SpotifyRawTrackHit } from '../graphQLSearch';
import type { EmbedPayload } from '../embedEntity';

const TRACK_HITS: SpotifyRawTrackHit[] = [
  {
    id: 'track-a',
    title: 'One More Time',
    artists: ['Daft Punk'],
    album: 'Discovery',
    durationMs: 320_000,
    coverUrl: 'cover-a.jpg',
  },
  {
    id: 'track-b',
    title: 'One More Chance',
    artists: ['Air'],
    album: 'Moon Safari',
    durationMs: 300_000,
    coverUrl: 'cover-b.jpg',
  },
];

const ALBUM_HITS: SpotifyRawAlbumHit[] = [
  {
    id: 'album-a',
    title: 'Discovery',
    artists: ['Daft Punk'],
    coverUrl: 'cover-album.jpg',
  },
];

const makeDeps = (
  overrides: Partial<SpotifyProviderDeps> = {}
): SpotifyProviderDeps => ({
  search: async () => ({ tracks: TRACK_HITS, albums: ALBUM_HITS }),
  fetchEmbed: async (): Promise<EmbedPayload> => ({
    entity: null,
    trackList: [],
  }),
  ...overrides,
});

const makeProvider = (deps: SpotifyProviderDeps) =>
  createSpotifyMetadataProvider(deps, {
    search: new TtlCache(),
    metadata: new TtlCache(),
  });

test('search : mapping DTO, tri déterministe, jamais de champ interne', async () => {
  __resetServiceGuards();
  const provider = makeProvider(makeDeps());

  const first = await provider.search('one more time', 10, [
    'tracks',
    'albums',
  ]);
  const second = await provider.search('one more time', 10, [
    'tracks',
    'albums',
  ]);

  assert.deepEqual(first, second, 'ordre déterministe');
  assert.equal(first.tracks.length, 2);
  assert.equal(first.albums.length, 1);

  const best = first.tracks[0];
  assert.equal(best.id, 'track-a', 'le titre exact arrive en tête');
  assert.equal(best.title, 'One More Time');
  assert.equal(best.audiusMatch, null);

  // Aucune donnée interne ne fuit dans le DTO.
  assert.equal('uri' in best, false);
  assert.equal('token' in best, false);
});

test('search : types filtrés + requête vide', async () => {
  __resetServiceGuards();
  const provider = makeProvider(makeDeps());

  const tracksOnly = await provider.search('discovery', 10, ['tracks']);
  assert.equal(tracksOnly.albums.length, 0);

  const empty = await provider.search('   ', 10, ['tracks']);
  assert.deepEqual(empty, { tracks: [], albums: [] });
});

test('search : limite appliquée après tri', async () => {
  __resetServiceGuards();
  const provider = makeProvider(makeDeps());
  const result = await provider.search('one more', 1, ['tracks']);
  assert.equal(result.tracks.length, 1);
  assert.equal(result.tracks[0].id, 'track-a');
});

test('search : deuxième appel servi par le cache (pas de nouvel appel upstream)', async () => {
  __resetServiceGuards();
  let upstreamCalls = 0;
  const deps = makeDeps({
    search: async () => {
      upstreamCalls += 1;
      return { tracks: TRACK_HITS, albums: [] };
    },
  });
  const provider = makeProvider(deps);

  await provider.search('daft punk', 5, ['tracks']);
  await provider.search('daft punk', 5, ['tracks']);
  assert.equal(upstreamCalls, 1);
});

test('search : échec upstream → 503 PROVIDER_UNAVAILABLE, pas de contenu interne', async () => {
  __resetServiceGuards();
  const provider = makeProvider(
    makeDeps({
      search: async () => {
        throw new Error('upstream exploded with secret details');
      },
    })
  );

  await assert.rejects(
    provider.search('x', 5, ['tracks']),
    (error: unknown) => {
      assert.ok(error instanceof ApiError);
      assert.equal(error.code, 'PROVIDER_UNAVAILABLE');
      assert.equal(error.httpStatus, 503);
      assert.equal(
        error.message.includes('secret'),
        false,
        'le message exposé ne contient aucun détail interne'
      );
      return true;
    }
  );
});

test('search : après 5 échecs le circuit s ouvre et bloque sans appel upstream', async () => {
  __resetServiceGuards();
  let upstreamCalls = 0;
  const provider = makeProvider(
    makeDeps({
      search: async () => {
        upstreamCalls += 1;
        throw new Error('boom');
      },
    })
  );

  for (let i = 0; i < 5; i += 1) {
    await assert.rejects(provider.search(`q-${i}`, 5, ['tracks']));
  }
  assert.equal(upstreamCalls, 5);

  // Une requête de plus : le guard doit la bloquer AVANT l'appel au mock.
  await assert.rejects(provider.search('q-extra', 5, ['tracks']));
  assert.equal(upstreamCalls, 5, 'aucun nouvel appel upstream, circuit ouvert');
});

test('getTrack : 404 quand l embed ne fournit pas d entité', async () => {
  __resetServiceGuards();
  const provider = makeProvider(makeDeps());
  await assert.rejects(
    provider.getTrack('4uLU6hMCjMI75M1A2tKUQC'),
    (error: unknown) => {
      assert.ok(error instanceof ApiError);
      assert.equal(error.code, 'NOT_FOUND');
      assert.equal(error.httpStatus, 404);
      return true;
    }
  );
});

test('getTrack : DTO complet depuis l embed', async () => {
  __resetServiceGuards();
  const provider = makeProvider(
    makeDeps({
      fetchEmbed: async (): Promise<EmbedPayload> => ({
        entity: {
          name: 'One More Time',
          subtitle: 'Daft Punk',
          type: 'track',
          uri: 'spotify:track:4uLU6hMCjMI75M1A2tKUQC',
          duration: 320_000,
          visualIdentity: { image: [{ url: 'big.jpg', maxWidth: 640 }] },
        },
        trackList: [],
      }),
    })
  );

  const dto = await provider.getTrack('4uLU6hMCjMI75M1A2tKUQC');
  assert.equal(dto.title, 'One More Time');
  assert.deepEqual(dto.artists, ['Daft Punk']);
  assert.equal(dto.durationMs, 320_000);
  assert.equal(dto.coverUrl, 'big.jpg');
  assert.equal(dto.audiusMatch, null);
});

test('getAlbum : pistes embarquées normalisées, entrées incomplètes ignorées', async () => {
  __resetServiceGuards();
  const provider = makeProvider(
    makeDeps({
      fetchEmbed: async (): Promise<EmbedPayload> => ({
        entity: {
          name: 'Discovery',
          subtitle: 'Daft Punk',
          type: 'album',
          uri: 'spotify:album:A6znpDJDoXFMFrxSrzEczN',
          coverArt: { sources: [{ url: 'album.jpg' }] },
        },
        trackList: [
          {
            uri: 'spotify:track:4uLU6hMCjMI75M1A2tKUQC',
            title: 'One More Time',
            subtitle: 'Daft Punk',
            duration: 320_000,
          },
          { uri: 'spotify:track:', title: '' }, // ignorée
        ],
      }),
    })
  );

  const dto = await provider.getAlbum('A6znpDJDoXFMFrxSrzEczN');
  assert.equal(dto.title, 'Discovery');
  assert.equal(dto.coverUrl, 'album.jpg');
  assert.ok(dto.tracks);
  assert.equal(dto.tracks.length, 1);
  assert.equal(dto.tracks[0].album, 'Discovery');
});

test('getArtist : complète artistes manquants et filtre sa discographie', async () => {
  __resetServiceGuards();
  const provider = makeProvider(
    makeDeps({
      fetchEmbed: async (): Promise<EmbedPayload> => ({
        entity: {
          name: 'Daft Punk',
          type: 'artist',
          uri: 'spotify:artist:artist12345',
          visualIdentity: { image: [{ url: 'artist.jpg', maxWidth: 640 }] },
        },
        trackList: [
          {
            uri: 'spotify:track:track123456',
            title: 'One More Time',
            // Spotify omet parfois subtitle dans les embeds artiste.
            subtitle: '',
            duration: 320_000,
          },
        ],
      }),
      search: async () => ({
        tracks: [],
        albums: [
          {
            id: 'album-daft',
            title: 'Discovery',
            artists: ['Daft Punk'],
            coverUrl: 'discovery.jpg',
          },
          {
            id: 'album-air',
            title: 'Moon Safari',
            artists: ['Air'],
            coverUrl: 'moon.jpg',
          },
        ],
      }),
    })
  );

  const artist = await provider.getArtist('artist12345');

  assert.equal(artist.name, 'Daft Punk');
  assert.equal(artist.imageUrl, 'artist.jpg');
  assert.deepEqual(artist.topTracks?.[0].artists, ['Daft Punk']);
  assert.deepEqual(
    artist.albums?.map((album) => album.title),
    ['Discovery']
  );
});

test('ids invalides → 400 BAD_REQUEST', async () => {
  __resetServiceGuards();
  const provider = makeProvider(makeDeps());
  await assert.rejects(provider.getTrack('not an id!!'), (error: unknown) => {
    assert.ok(error instanceof ApiError);
    assert.equal(error.code, 'BAD_REQUEST');
    return true;
  });
});
