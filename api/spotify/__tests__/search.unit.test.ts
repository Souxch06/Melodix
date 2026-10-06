import { spotifyApiGet } from '@services';

import { searchSpotifyCatalog } from '../search';

// Vérifie le MAPPAGE de la réponse /v1/search : c'est ici que se joue la
// différence entre une recherche qui renvoie vraiment des artistes et des
// playlists, et une qui les laisse vides (l'ancien comportement).

jest.mock('@services', () => ({
  spotifyApiGet: jest.fn(),
}));

const mockedGet = spotifyApiGet as jest.MockedFunction<typeof spotifyApiGet>;

const SPOTIFY_SEARCH_RESPONSE = {
  tracks: {
    items: [
      {
        id: '4uLU6hMCjMI75M1A2tKUQC',
        name: 'One More Time',
        duration_ms: 320_000,
        explicit: false,
        artists: [{ id: 'ar1', name: 'Daft Punk' }],
        album: {
          id: 'al1',
          name: 'Discovery',
          images: [{ url: 'https://i.scdn.co/album.jpg' }],
        },
        external_ids: { isrc: 'usrt19901234' },
      },
      // Ligne à jeter : pas d'identifiant.
      { name: 'fantôme', artists: [{ name: 'inconnu' }] },
    ],
  },
  artists: {
    items: [
      {
        id: 'ar1',
        name: 'Daft Punk',
        images: [{ url: 'https://i.scdn.co/artist.jpg' }],
      },
    ],
  },
  albums: {
    items: [
      {
        id: 'al1',
        name: 'Discovery',
        album_type: 'album',
        images: [{ url: 'https://i.scdn.co/album.jpg' }],
        release_date: '2001-03-12',
        total_tracks: 14,
        artists: [{ id: 'ar1', name: 'Daft Punk' }],
      },
    ],
  },
  playlists: {
    items: [
      {
        id: 'pl1',
        name: 'French Touch',
        description: 'Les classiques',
        images: [{ url: 'https://i.scdn.co/pl.jpg' }],
        owner: { display_name: 'SpotiFan', id: 'fan' },
        tracks: { total: 42 },
      },
    ],
  },
};

beforeEach(() => {
  jest.clearAllMocks();
});

it('maps every Spotify search type into its own section', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const results = await searchSpotifyCatalog('daft punk');

  expect(results.artists).toHaveLength(1);
  expect(results.tracks).toHaveLength(1);
  expect(results.albums).toHaveLength(1);
  expect(results.playlists).toHaveLength(1);
});

it('asks Spotify for the four types with a bounded limit', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  await searchSpotifyCatalog('daft punk', 10);

  const path = mockedGet.mock.calls[0][0];
  expect(path).toContain('/search?');
  expect(path).toContain('type=track%2Cartist%2Calbum%2Cplaylist');
  expect(path).toContain('limit=10');
  // La requête est encodée : pas d'espace nu ni d'injection possible.
  expect(path).toContain('q=daft+punk');
});

it('clamps the limit to the Spotify ceiling of 20', async () => {
  mockedGet.mockResolvedValue({ tracks: { items: [] } });

  await searchSpotifyCatalog('daft punk', 500);

  expect(mockedGet.mock.calls[0][0]).toContain('limit=20');
});

it('keeps the matching metadata on tracks (duration, album, uppercase ISRC)', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const [track] = (await searchSpotifyCatalog('daft punk')).tracks;

  expect(track).toMatchObject({
    id: '4uLU6hMCjMI75M1A2tKUQC',
    type: 'track',
    title: 'One More Time',
    subtitle: 'Daft Punk',
    imageURL: 'https://i.scdn.co/album.jpg',
    durationMs: 320_000,
    albumName: 'Discovery',
    isrc: 'USRT19901234',
  });
});

/**
 * DISPONIBILITÉ AUDIO — la classification explicit doit survivre au mapping.
 *
 * Sans elle, la porte `content-rating-mismatch` du matcher ne peut jamais
 * s'appliquer : une demande EXPLICITE peut être servie par un upload CLEAN
 * (et inversement). Ce n'est pas une indisponibilité, c'est un MAUVAIS
 * enregistrement — exactement ce que le moteur de matching doit éviter.
 */
it('propage la classification explicit du résultat (jamais neutralisée)', async () => {
  mockedGet.mockResolvedValue({
    tracks: {
      items: [
        {
          id: 'tr-explicit',
          name: 'Aerodynamic',
          explicit: true,
          duration_ms: 212_000,
          artists: [{ id: 'ar1', name: 'Daft Punk' }],
          album: { name: 'Discovery' },
        },
        {
          id: 'tr-clean',
          name: 'One More Time',
          explicit: false,
          duration_ms: 320_000,
          artists: [{ id: 'ar1', name: 'Daft Punk' }],
          album: { name: 'Discovery' },
        },
        {
          id: 'tr-inconnu',
          name: 'Veridis Quo',
          duration_ms: 344_000,
          artists: [{ id: 'ar1', name: 'Daft Punk' }],
          album: { name: 'Discovery' },
        },
      ],
    },
  });

  const results = await searchSpotifyCatalog('daft punk');

  expect(results.tracks.map((track) => track.explicit)).toEqual([
    true,
    false,
    null,
  ]);
});

it('joins every artist of a track into the subtitle', async () => {
  mockedGet.mockResolvedValue({
    tracks: {
      items: [
        {
          id: 't1',
          name: 'Encore',
          artists: [
            { id: 'a', name: 'Jay-Z' },
            { id: 'b', name: 'Linkin Park' },
          ],
        },
      ],
    },
  });

  const [track] = (await searchSpotifyCatalog('encore')).tracks;

  expect(track.subtitle).toBe('Jay-Z, Linkin Park');
});

it('drops hits without an id or a name instead of rendering a broken card', async () => {
  mockedGet.mockResolvedValue({
    tracks: {
      items: [
        { id: 'ok', name: 'Valide' },
        { id: 'sans-nom' },
        { name: 'sans-id' },
        null,
      ],
    },
    artists: { items: [null, { id: 'x', name: 'Valide' }] },
    albums: { items: [null, { id: 'y' }] },
    playlists: { items: [null, { id: 'z', name: 'Valide' }] },
  });

  const results = await searchSpotifyCatalog('q');

  expect(results.tracks.map((t) => t.id)).toEqual(['ok']);
  expect(results.artists.map((a) => a.id)).toEqual(['x']);
  expect(results.albums).toEqual([]);
  expect(results.playlists.map((p) => p.id)).toEqual(['z']);
});

it('names the playlist owner and its track count', async () => {
  mockedGet.mockResolvedValue(SPOTIFY_SEARCH_RESPONSE);

  const [playlist] = (await searchSpotifyCatalog('french touch')).playlists;

  expect(playlist.subtitle).toBe('Par SpotiFan');
  expect(playlist.totalTracks).toBe(42);
});

it('tolerates a Spotify answer that omits a whole type', async () => {
  // Spotify peut ne pas renvoyer les playlists pour certains comptes.
  mockedGet.mockResolvedValue({
    tracks: { items: [{ id: 't', name: 'Seul' }] },
  });

  const results = await searchSpotifyCatalog('seul');

  expect(results.tracks).toHaveLength(1);
  expect(results.artists).toEqual([]);
  expect(results.albums).toEqual([]);
  expect(results.playlists).toEqual([]);
});

it('never calls Spotify on an empty query', async () => {
  const results = await searchSpotifyCatalog('   ');

  expect(mockedGet).not.toHaveBeenCalled();
  expect(results).toEqual({
    tracks: [],
    artists: [],
    albums: [],
    playlists: [],
  });
});

it('uses items.total for playlists when tracks.total is absent', async () => {
  mockedGet.mockResolvedValue({
    playlists: {
      items: [
        {
          id: 'p',
          name: 'Nouvelle forme',
          owner: { id: 'fan' },
          items: { total: 7 },
        },
      ],
    },
  });

  const [playlist] = (await searchSpotifyCatalog('nouvelle forme')).playlists;

  expect(playlist.totalTracks).toBe(7);
  // Sans display_name, l'identifiant propriétaire sert de repli.
  expect(playlist.subtitle).toBe('Par fan');
});

it('propagates the Spotify error to the caller (no silent empty result)', async () => {
  mockedGet.mockRejectedValue(new Error('spotify down'));

  await expect(searchSpotifyCatalog('daft punk')).rejects.toThrow(
    'spotify down'
  );
});

/**
 * PAGINATION TRACKS — complétude du catalogue, adaptative et bornée.
 *
 * Ce n'est PAS un simple 2 → 10 : la boucle continue UNIQUEMENT tant que la
 * page précédente est PLEINE (Spotify a encore des résultats pertinents),
 * s'arrête dès qu'une page est INcomplète, et se heurte à une borne dure
 * (5 pages) qui empêche toute pagination massive. Les tests verrouillent
 * chaque règle individuellement.
 */
describe('pagination tracks (complétude adaptative bornée)', () => {
  const page = (ids: string[], extra: Record<string, unknown> = {}) => ({
    tracks: {
      items: ids.map((id) => ({
        id,
        name: `Titre ${id}`,
        duration_ms: 200_000,
        artists: [{ id: 'a', name: 'Artiste' }],
        album: { name: 'Album' },
        ...extra,
      })),
    },
  });

  /** N pages pleines de `limit` pistes, ids distincts. */
  const fullPages = (limit: number, count: number) => {
    for (let i = 0; i < count; i += 1) {
      mockedGet.mockResolvedValueOnce(
        page(Array.from({ length: limit }, (_, j) => `p${i + 1}t${j + 1}`))
      );
    }
  };

  it('page 1 PLEINE → page 2 demandée (offset = limite), pistes fusionnées', async () => {
    // Limite 2 : page 1 pleine (2), page 2 INcomplète (1) → s'arrête là.
    mockedGet.mockResolvedValueOnce(page(['t1', 't2']));
    mockedGet.mockResolvedValueOnce(page(['t3']));

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(mockedGet).toHaveBeenCalledTimes(2);
    expect(mockedGet.mock.calls[0][0]).toContain('limit=2');
    expect(mockedGet.mock.calls[0][0]).toContain('offset=0');
    expect(mockedGet.mock.calls[1][0]).toContain('offset=2');
    // Ordre de pertinence Spotify conservé (page 1 d'abord).
    expect(results.tracks.map((t) => t.id)).toEqual(['t1', 't2', 't3']);
  });

  it('page 1 INCOMPLÈTE → aucune autre requête (zéro appel superflu)', async () => {
    mockedGet.mockResolvedValue(page(['t1', 't2']));

    await searchSpotifyCatalog('daft punk', 10);

    expect(mockedGet).toHaveBeenCalledTimes(1);
  });

  it('continue AU-DELÀ de la page 2 tant que les pages sont pleines', async () => {
    // Limite 2 : 3 pages pleines puis une INcomplète (1 piste) → 4 requêtes
    // (l'ancien plafonnement à 2 pages n'aurait servi que 4 pistes au lieu
    // de 7) et la pagination s'arrête sur la page incomplète.
    fullPages(2, 3);
    mockedGet.mockResolvedValueOnce(page(['p4t1']));

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(mockedGet).toHaveBeenCalledTimes(4);
    expect(mockedGet.mock.calls[3][0]).toContain('offset=6');
    expect(results.tracks.map((t) => t.id)).toEqual([
      'p1t1',
      'p1t2',
      'p2t1',
      'p2t2',
      'p3t1',
      'p3t2',
      'p4t1',
    ]);
  });

  it('la borne dure STOPPE la pagination (jamais massive, même pages pleines)', async () => {
    // Limite 2, 5 pages pleines fournies : la boucle doit s'arrêter exactement
    // à 5 requêtes (borne MAX_TRACK_PAGES), sans demander de 6e page.
    fullPages(2, 5);

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(mockedGet).toHaveBeenCalledTimes(5);
    expect(results.tracks).toHaveLength(10);
  });

  it('les doublons entre pages sont supprimés (même id = 1 seule carte)', async () => {
    // Spotify peut renvoyer la même piste sur deux pages (reclassement).
    // Page 2 incomplète → la pagination s'arrête après 2 requêtes.
    mockedGet.mockResolvedValueOnce(page(['t1', 't2']));
    mockedGet.mockResolvedValueOnce(page(['t2']));

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(results.tracks.map((t) => t.id)).toEqual(['t1', 't2']);
  });

  it('une page secondaire qui ÉCHoue ne bloque PAS la recherche', async () => {
    // Page 1 pleine, page 2 en panne réseau : on conserve la page 1 et on
    // arrête la pagination — la recherche reste servie.
    mockedGet.mockResolvedValueOnce(page(['t1', 't2']));
    mockedGet.mockRejectedValueOnce(new Error('réseau'));

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(results.tracks.map((t) => t.id)).toEqual(['t1', 't2']);
    expect(mockedGet).toHaveBeenCalledTimes(2);
  });

  it('une page 1 en échec EST propagée (pas de faux vide)', async () => {
    // La page 1 n'a pas de page de repli : sa faute est celle de la recherche.
    mockedGet.mockRejectedValueOnce(new Error('spotify down'));

    await expect(searchSpotifyCatalog('daft punk', 2)).rejects.toThrow(
      'spotify down'
    );
    expect(mockedGet).toHaveBeenCalledTimes(1);
  });

  it('les autres types restent en PAGE UNIQUE (navigation, pas catalogue)', async () => {
    // Page 1 (pleine → déclenche la page 2 pour les tracks) porte les autres
    // types ; les pages suivantes ne sont lues QUE pour les tracks.
    mockedGet.mockResolvedValueOnce({
      ...page(['t1', 't2']),
      artists: { items: [{ id: 'ar', name: 'Artiste' }] },
      albums: { items: [{ id: 'al', name: 'Album' }] },
      playlists: { items: [{ id: 'pl', name: 'Playlist' }] },
    });
    // Page 2 incomplète (1 piste) → s'arrête là.
    mockedGet.mockResolvedValueOnce({
      tracks: { items: [{ id: 't3', name: 'Titre t3' }] },
      // Types dupliqués dans la page 2 : ils doivent être IGNORÉS.
      artists: { items: [{ id: 'ar2', name: 'Artiste 2' }] },
    });

    const results = await searchSpotifyCatalog('daft punk', 2);

    expect(mockedGet).toHaveBeenCalledTimes(2);
    expect(results.tracks.map((t) => t.id)).toEqual(['t1', 't2', 't3']);
    expect(results.artists).toHaveLength(1);
    expect(results.artists[0].id).toBe('ar');
    expect(results.albums).toHaveLength(1);
    expect(results.playlists).toHaveLength(1);
  });
});
