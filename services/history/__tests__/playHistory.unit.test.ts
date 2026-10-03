import AsyncStorage from '@react-native-async-storage/async-storage';

import { TrackModel } from '@models';

import {
  clearPlayHistory,
  getRecentlyPlayedAlbumLike,
  getRecentlyPlayedTracks,
  getTopAlbumsFromHistory,
  getTopArtistsFromHistory,
  hasPlayHistory,
  MAX_HISTORY,
  PLAY_HISTORY_STORAGE_KEY,
  recordPlay,
  removePlayHistoryEntry,
} from '../playHistory';

const track = (id: string, artist = 'Artist', album?: string): TrackModel => ({
  id,
  title: `Track ${id}`,
  subtitle: artist,
});

describe('playHistory (historique local)', () => {
  beforeEach(async () => {
    await clearPlayHistory();
  });

  afterAll(async () => {
    await clearPlayHistory();
  });

  it('enregistre les lectures, les plus récentes d abord', async () => {
    expect(await hasPlayHistory()).toBe(false);

    await recordPlay(track('1'));
    await recordPlay(track('2'));

    const recent = await getRecentlyPlayedTracks();
    expect(recent.map(({ track: t }) => t.id)).toEqual(['2', '1']);
    expect(await hasPlayHistory()).toBe(true);
  });

  it('conserve deux lectures enregistrées réellement en parallèle', async () => {
    await Promise.all([
      recordPlay(track('parallel-a')),
      recordPlay(track('parallel-b')),
    ]);

    const recent = await getRecentlyPlayedTracks();
    expect(new Set(recent.map(({ track: item }) => item.id))).toEqual(
      new Set(['parallel-a', 'parallel-b'])
    );
  });

  it('une lecture fire-and-forget est visible par la lecture suivante', async () => {
    void recordPlay(track('pending'));

    await expect(hasPlayHistory()).resolves.toBe(true);
    await expect(getRecentlyPlayedTracks()).resolves.toEqual([
      expect.objectContaining({
        track: expect.objectContaining({ id: 'pending' }),
      }),
    ]);
  });

  it('déduplique : rejouer un morceau le remonte en tête', async () => {
    await recordPlay(track('1'));
    await recordPlay(track('2'));
    await recordPlay(track('1'));

    const recent = await getRecentlyPlayedTracks();
    expect(recent.map(({ track: t }) => t.id)).toEqual(['1', '2']);
    expect(recent).toHaveLength(2);
  });

  it('borne la taille à MAX_HISTORY', async () => {
    for (let i = 0; i < MAX_HISTORY + 20; i += 1) {
      await recordPlay(track(`bulk-${i}`));
    }
    const recent = await getRecentlyPlayedTracks(MAX_HISTORY + 20);
    expect(recent).toHaveLength(MAX_HISTORY);
    // Le plus ancien (bulk-0) a été évincé.
    expect(recent.find(({ track: t }) => t.id === 'bulk-0')).toBeUndefined();
    expect(recent[0].track.id).toBe(`bulk-${MAX_HISTORY + 19}`);
  });

  it('getRecentlyPlayedAlbumLike privilégie l album sans doublonner', async () => {
    await recordPlay(track('a', 'Daft Punk'), { albumTitle: 'Discovery' });
    await recordPlay(track('b', 'Daft Punk'), { albumTitle: 'Discovery' });
    await recordPlay(track('c', 'Air'), { albumTitle: 'Moon Safari' });

    const items = await getRecentlyPlayedAlbumLike();
    expect(items.map((item) => item.title)).toEqual([
      'Moon Safari',
      'Discovery',
    ]);
  });

  it('top artistes/albums = compte de lectures, à égalité le plus récent', async () => {
    await recordPlay(track('1', 'A'), { albumTitle: 'Album A' });
    await recordPlay(track('2', 'B'), { albumTitle: 'Album B' });
    await recordPlay(track('3', 'B'), { albumTitle: 'Album B' });

    const top = await getTopArtistsFromHistory(1);
    expect(top).toHaveLength(1);
    expect(top[0].name).toBe('B');
    expect(top[0].count).toBe(2);

    const topAlbums = await getTopAlbumsFromHistory(1);
    expect(topAlbums[0].title).toBe('Album B');
    expect(topAlbums[0].count).toBe(2);
  });

  it('getTopAlbumsFromHistory ignore les lectures sans album', async () => {
    await recordPlay(track('orphan', 'Solo'));
    expect(await getTopAlbumsFromHistory(5)).toEqual([]);
  });

  it('supprime une seule lecture sans réordonner ni effacer les autres', async () => {
    await recordPlay(track('1'));
    await recordPlay(track('2'));
    await recordPlay(track('3'));

    await removePlayHistoryEntry('2');

    expect(
      (await getRecentlyPlayedTracks()).map(({ track: item }) => item.id)
    ).toEqual(['3', '1']);
  });

  it('clearPlayHistory remet tout à zéro', async () => {
    await recordPlay(track('x'));
    await clearPlayHistory();
    expect(await hasPlayHistory()).toBe(false);
    expect(await getRecentlyPlayedTracks()).toEqual([]);
  });

  it('I-8 : albumId enregistré quand connu, relu intact avec le snapshot', async () => {
    await recordPlay(
      {
        id: 'spotify:trk-1',
        title: 'Song',
        subtitle: 'Artist',
        albumName: 'The Album',
        durationMs: 200_000,
        isrc: 'FRABC2412345',
      },
      { albumTitle: 'The Album', albumId: 'alb-42' }
    );

    const [entry] = await getRecentlyPlayedTracks(1);
    expect(entry.albumId).toBe('alb-42');

    const [tile] = await getRecentlyPlayedAlbumLike(8);
    expect(tile.albumId).toBe('alb-42');
    // Snapshot complet pour la lecture directe (I-2 conservé).
    expect(tile.track).toMatchObject({
      id: 'spotify:trk-1',
      albumName: 'The Album',
      durationMs: 200_000,
      isrc: 'FRABC2412345',
    });
  });

  it('I-8 : entrées ANCIENNES sans albumId — aucune erreur, albumId null', async () => {
    // Stockage écrit comme une version antérieure du format.
    await AsyncStorage.setItem(
      PLAY_HISTORY_STORAGE_KEY,
      JSON.stringify({
        entries: [
          {
            track: {
              id: 'spotify:old-1',
              title: 'Old Song',
              subtitle: 'Old Artist',
            },
            playedAt: Date.now(),
          },
        ],
      })
    );

    const [tile] = await getRecentlyPlayedAlbumLike(8);
    expect(tile.albumId).toBeNull();
    expect(tile.track).toMatchObject({
      id: 'spotify:old-1',
      title: 'Old Song',
    });
  });

  describe('getTopAlbumsFromHistory — jamais de faux album (extension I-8)', () => {
    const albumTrack = (
      id: string,
      title: string,
      albumTitle: string
    ): TrackModel => ({ id, title, subtitle: 'Artist', albumName: albumTitle });

    it('deux morceaux du MÊME albumId → UN seul album, comptes cumulés', async () => {
      await recordPlay(albumTrack('spotify:t1', 'Song 1', 'The Album'), {
        albumTitle: 'The Album',
        albumId: 'alb-123',
      });
      await recordPlay(albumTrack('spotify:t2', 'Song 2', 'The Album'), {
        albumTitle: 'The Album',
        albumId: 'alb-123',
      });

      const top = await getTopAlbumsFromHistory(6);

      expect(top).toHaveLength(1);
      expect(top[0].id).toBe('alb-123');
      expect(top[0].count).toBe(2);
      expect(top[0].title).toBe('The Album');
    });

    it('deux albumIds distincts à titre IDENTIQUE → deux albums séparés', async () => {
      await recordPlay(albumTrack('spotify:t1', 'Song 1', 'Homonym'), {
        albumTitle: 'Homonym',
        albumId: 'alb-123',
      });
      await recordPlay(albumTrack('spotify:t2', 'Song 2', 'Homonym'), {
        albumTitle: 'Homonym',
        albumId: 'alb-456',
      });

      const top = await getTopAlbumsFromHistory(6);

      expect(top).toHaveLength(2);
      expect(new Set(top.map(({ id }) => id))).toEqual(
        new Set(['alb-123', 'alb-456'])
      );
    });

    it('ancienne entrée titre-seul + nouvelle entrée du MÊME TITRE → regroupées par titre', async () => {
      // Ancienne : pas d'albumId. Nouvelle (même album, id connu).
      await AsyncStorage.setItem(
        PLAY_HISTORY_STORAGE_KEY,
        JSON.stringify({
          entries: [
            {
              track: { id: 'spotify:old-1', title: 'Old Song', subtitle: 'A' },
              albumTitle: 'Vintage',
              playedAt: 100,
            },
            {
              track: { id: 'spotify:new-1', title: 'New Song', subtitle: 'A' },
              albumTitle: 'Vintage',
              albumId: 'alb-vintage',
              playedAt: 200,
            },
          ],
        })
      );

      const top = await getTopAlbumsFromHistory(6);

      // Deux clés distinctes (titre vs albumId) : PAS de fusion forcée —
      // la fusion aurait RECRÉÉ un faux lien historique. L'ancienne entrée
      // reste compat (agrégée par titre), un rejeu la rattrape par albumId.
      expect(top.some(({ id }) => id === 'alb-vintage')).toBe(true);
      expect(top.some(({ id }) => id === null)).toBe(true);
      expect(top).toHaveLength(2);
    });

    it('classement : plus d écoutes en premier, à égalité le plus récent', async () => {
      // 3 écoutes de l'album « Rare » = 3 morceaux DIFFÉRENTS (recordPlay
      // déduplique par track.id).
      await recordPlay(albumTrack('spotify:a1', 'A1', 'Rare'), {
        albumTitle: 'Rare',
        albumId: 'alb-rare',
      });
      await recordPlay(albumTrack('spotify:a2', 'A2', 'Rare'), {
        albumTitle: 'Rare',
        albumId: 'alb-rare',
      });
      await recordPlay(albumTrack('spotify:b1', 'B1', 'Tied1'), {
        albumTitle: 'Tied1',
        albumId: 'alb-tied1',
      });
      await recordPlay(albumTrack('spotify:a3', 'A3', 'Rare'), {
        albumTitle: 'Rare',
        albumId: 'alb-rare',
      });
      await recordPlay(albumTrack('spotify:b2', 'B2', 'Tied2'), {
        albumTitle: 'Tied2',
        albumId: 'alb-tied2',
      });

      const top = await getTopAlbumsFromHistory(6);

      expect(top).toHaveLength(3);
      expect(top[0].id).toBe('alb-rare');
      expect(top[0].count).toBe(3);
      // À égalité (1 vs 1) : l'album le plus récemment écouté d'abord.
      expect(top[1].id).toBe('alb-tied2');
      expect(top[2].id).toBe('alb-tied1');
    });

    it('sources agnostiques : Audius albumId utilisé tel quel (étape 4)', async () => {
      // Le système ne présume JAMAIS que tout vient de Spotify : un albumId
      // Audius est regroupé et émis exactement comme un albumId Spotify.
      await recordPlay(albumTrack('audius:a-1', 'Open Song', 'Open Album'), {
        albumTitle: 'Open Album',
        albumId: 'audius-album-456',
      });
      await recordPlay(albumTrack('audius:a-2', 'Open Song 2', 'Open Album'), {
        albumTitle: 'Open Album',
        albumId: 'audius-album-456',
      });
      await recordPlay(albumTrack('spotify:trk-9', 'Song', 'Spot Album'), {
        albumTitle: 'Spot Album',
        albumId: 'spotify-album-123',
      });

      const top = await getTopAlbumsFromHistory(6);

      const audiusAlbum = top.find(({ id }) => id === 'audius-album-456');
      expect(audiusAlbum).toBeDefined();
      expect(audiusAlbum?.count).toBe(2);
      expect(audiusAlbum?.id).not.toBe('audius:a-1');
      expect(audiusAlbum?.id).not.toBe('audius:a-2');

      const spotifyAlbum = top.find(({ id }) => id === 'spotify-album-123');
      expect(spotifyAlbum).toBeDefined();
      expect(spotifyAlbum?.count).toBe(1);

      // Jamais un track.id (spotify: ou audius:) émis comme id d'album.
      for (const { id } of top) {
        expect(id).not.toMatch(/^spotify:trk-/);
        expect(id).not.toMatch(/^audius:a-/);
      }
    });

    it('track.id n est JAMAIS émis comme id d album', async () => {
      await recordPlay(albumTrack('spotify:track-99', 'Song', 'Confused'), {
        albumTitle: 'Confused',
        albumId: 'alb-clear',
      });
      // albumTitle seul (albumId INCONNU) : le meta est toujours fourni par
      // le player — seul l'albumId peut manquer.
      await recordPlay(albumTrack('spotify:track-100', 'Song', 'Mere'), {
        albumTitle: 'Mere',
      });

      const top = await getTopAlbumsFromHistory(6);

      expect(top.map(({ id }) => id)).not.toContain('spotify:track-99');
      expect(top.map(({ id }) => id)).not.toContain('spotify:track-100');
      expect(top.find(({ title }) => title === 'Confused')?.id).toBe(
        'alb-clear'
      );
      const simple = top.find(({ title }) => title === 'Mere');
      expect(simple?.id).toBeNull();
      // ...mais le snapshot sert la lecture directe.
      expect(simple?.track.id).toBe('spotify:track-100');
    });
  });

  it('snapshot sans état de lecture transitoire', async () => {
    const playingTrack = { ...track('live'), isPlaying: true };
    await recordPlay(playingTrack);
    const [entry] = await getRecentlyPlayedTracks();
    expect(entry.track.isPlaying).toBe(false);
  });
});
