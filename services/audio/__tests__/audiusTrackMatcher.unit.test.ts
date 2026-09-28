import {
  findBestAudiusMatch,
  fingerprintOf,
  matchSongs,
  normalizeAlbumText,
  normalizeArtistText,
  normalizeTitleText,
  stripFeatureSuffix,
} from '../audiusTrackMatcher';

type Candidate = Parameters<typeof matchSongs>[1][number];

const source = (
  title: string,
  artists: string[],
  extra?: Partial<{ album: string | null; durationSec: number | null }>
) =>
  fingerprintOf({
    title,
    artistNames: artists,
    album: extra?.album ?? null,
    durationSec: extra?.durationSec ?? null,
  });

describe('normalizeTitleText', () => {
  it('normalizes case, accents, dashes and ellipsis', () => {
    expect(normalizeTitleText('À  L’attaque — Remastered… ')).toBe(
      normalizeTitleText('a  l\u2019attaque — remastered')
    );
    expect(normalizeTitleText('HELLO THERE')).toBe('hello there');
  });

  it('keeps internal punctuation out of equality', () => {
    expect(normalizeTitleText('Rock’n’roll (2012 Remaster)')).toContain("rock'n'roll");
  });
});

describe('stripFeatureSuffix', () => {
  it.each([
    ['Song (feat. Somebody)', 'song'],
    ['Song [ft. Other]', 'song'],
    ['Song feat. A & B', 'song'],
    ['Song - featuring C', 'song'],
    ['Song with D', 'song'],
  ])('strips "%s"', (input, _expected) => {
    expect(stripFeatureSuffix(normalizeTitleText(input))).toContain('song');
    expect(stripFeatureSuffix(normalizeTitleText(input))).not.toContain(
      'feat'
    );
  });
});

describe('normalizeAlbumText', () => {
  it('strips edition markers and parentheticals', () => {
    expect(normalizeAlbumText('Afterglow (Deluxe Edition)')).toBe('afterglow');
    expect(normalizeAlbumText('Afterglow - Remastered 2013')).toBe('afterglow');
    expect(normalizeAlbumText('Afterglow (Bonus Track Version)')).toBe(
      'afterglow'
    );
  });
});

describe('normalizeArtistText', () => {
  it('drops articles and trailing dots', () => {
    expect(normalizeArtistText('The Sugar.')).toBe('sugar');
    expect(normalizeArtistText('  DJ Lo-Fi  ')).toBe('dj lo-fi');
  });
});

describe('matchSongs — reliable matching', () => {
  const tammy: Candidate = {
    id: 'aud-1',
    title: 'Tame (feat. North)',
    artistNames: ['Neffex', 'North'],
    durationSec: 189,
  };

  it('accepts a reliable match with featuring variations', () => {
    const match = matchSongs(
      source('Tame (ft. North)', ['NEFFEX'], { durationSec: 190000 / 1000 }),
      [tammy]
    );

    expect(match?.id).toBe('aud-1');
  });

  it('matches despite radio-edit/remaster/official tails and case changes', () => {
    // Versions d'édition acceptées (contrat « gérer les variantes », point 4).
    const variants: Candidate[] = [
      { id: 'a', title: 'tame (radio edit)', artistNames: ['neffex'], durationSec: 188 },
      { id: 'b', title: 'Tame (Official Audio)', artistNames: ['neffex'], durationSec: 190 },
      { id: 'c', title: 'TAME (2024 Remaster)', artistNames: ['neffex'], durationSec: 189 },
      { id: 'd', title: 'Tame (Lyric Video)', artistNames: ['neffex'], durationSec: 189 },
    ];

    for (const candidate of variants) {
      expect(
        matchSongs(source('Tame', ['Neffex'], { durationSec: 189 }), [candidate])
          ?.id
      ).toBe(candidate.id);
    }
  });

  it('rejects hard variants (remix / live / instrumental / karaoke / acoustic) when the source is not that version', () => {
    // Point 4 : « Song » vs « Song (Remix) » → pénalité importante → rejet.
    const variants: Candidate[] = [
      { id: 'remix', title: 'Tame (Remix)', artistNames: ['neffex'], durationSec: 210 },
      { id: 'live', title: 'Tame - Live at Home Session', artistNames: ['neffex'], durationSec: 191 },
      { id: 'instru', title: 'Tame (Instrumental)', artistNames: ['neffex'], durationSec: 189 },
      { id: 'karaoke', title: 'Tame (Karaoke Version)', artistNames: ['neffex'], durationSec: 189 },
      { id: 'acoustic', title: 'Tame (Acoustic)', artistNames: ['neffex'], durationSec: 201 },
    ];

    for (const candidate of variants) {
      expect(
        matchSongs(source('Tame', ['Neffex'], { durationSec: 189 }), [candidate])
      ).toBeNull();
    }
  });

  it('accepts the variant when BOTH sides are the same variant (remix → remix)', () => {
    expect(
      matchSongs(
        source('Tame (Remix)', ['Neffex'], { durationSec: 210 }),
        [
          {
            id: 'remix-ok',
            title: 'Tame - Remix',
            artistNames: ['neffex'],
            durationSec: 211,
          },
        ]
      )?.id
    ).toBe('remix-ok');
  });

  it('uses album agreement to break ties', () => {
    const original: Candidate = {
      id: 'orig',
      title: 'Afterglow',
      artistNames: ['Mira'],
      album: 'Afterglow',
      durationSec: 200,
    };
    const wrongAlbum: Candidate = {
      id: 'wrong',
      title: 'Afterglow',
      artistNames: ['Mira'],
      album: 'B-Sides',
      durationSec: 200,
    };

    const match = matchSongs(
      source('Afterglow', ['Mira'], { album: 'Afterglow (Deluxe)', durationSec: 200 }),
      [wrongAlbum, original]
    );

    expect(match?.id).toBe('orig');
  });

  it('rejects a song whose artist shares nothing with the source', () => {
    const stranger: Candidate = {
      id: 'x',
      title: 'Tame',
      artistNames: ['Somebody Else'],
      durationSec: 189,
    };

    expect(
      matchSongs(source('Tame', ['Neffex'], { durationSec: 189 }), [stranger])
    ).toBeNull();
  });

  it('rejects a merely similar title (never plays the wrong track)', () => {
    const wrong: Candidate = {
      id: 'y',
      title: 'Timing',
      artistNames: ['Neffex'],
      durationSec: 189,
    };

    expect(
      matchSongs(source('Tame', ['Neffex'], { durationSec: 189 }), [wrong])
    ).toBeNull();
  });

  it('does not confuse different works by the same title (artist required)', () => {
    const other: Candidate = {
      id: 'z',
      title: 'Home',
      artistNames: ['Totally Different Artist'],
      durationSec: 180,
    };

    expect(
      matchSongs(source('Home', ['Ultimo'], { durationSec: 180 }), [other])
    ).toBeNull();
  });

  it('uses duration to prefer the closest of two contenders', () => {
    const close: Candidate = {
      id: 'close',
      title: 'Tame',
      artistNames: ['Neffex', 'North'],
      durationSec: 190,
    };
    const far: Candidate = {
      id: 'far',
      title: 'Tame',
      artistNames: ['Neffex', 'North'],
      durationSec: 240,
    };

    expect(
      matchSongs(source('Tame (feat. North)', ['Neffex'], { durationSec: 189 }), [
        far,
        close,
      ])?.id
    ).toBe('close');
  });
});


describe('findBestAudiusMatch — cascade multi-requêtes (spécification matching)', () => {
  const audius = (
    id: string,
    title: string,
    artist: string,
    duration?: number
  ) => ({
    id,
    title,
    user: { name: artist, handle: artist.toLowerCase() },
    duration,
  });

  const query = (
    title: string,
    artists: string[],
    durationMillis?: number
  ) => ({
    title,
    artists,
    album: null as string | null,
    durationMillis,
  });

  it('recherche d abord « artiste + titre » (jamais le titre seul)', async () => {
    const seen: string[] = [];
    const search = jest.fn(async (text: string) => {
      seen.push(text);
      return [audius('ok', 'Tame', 'Neffex')];
    });

    const match = await findBestAudiusMatch(
      query('Tame (feat. North)', ['Neffex', 'North']),
      search
    );

    expect(match?.id).toBe('ok');
    // ARTISTE + titre normalisé d'abord : « Neffex Tame » (jamais « Tame » seul).
    expect(seen[0]).toBe('Neffex Tame');
    // Premier lot pertinent → la cascade s arrête (un seul appel).
    expect(search).toHaveBeenCalledTimes(1);
  });

  it('retombe sur le titre seul si la requête riche ne ramène rien', async () => {
    const search = jest.fn(async (text: string) =>
      text === 'Tame' ? [audius('found', 'Tame', 'Neffex')] : []
    );

    const match = await findBestAudiusMatch(query('Tame', ['Neffex']), search);

    expect(match?.id).toBe('found');
    expect((search as jest.Mock).mock.calls.map(([text]) => text)).toContain(
      'Tame'
    );
  });

  it('ignore une tentative en échec réseau et poursuit la cascade', async () => {
    const search = jest.fn(async (text: string) => {
      if (text !== 'Tame') {
        throw new Error('network down');
      }
      return [audius('late', 'Tame', 'Neffex')];
    });

    const warn = jest.spyOn(console, 'warn').mockImplementation(() => {});
    const match = await findBestAudiusMatch(query('Tame', ['Neffex']), search);
    warn.mockRestore();

    expect(match?.id).toBe('late');
  });

  it('renvoie null si TOUTES les tentatives sont vides (jamais de match forcé)', async () => {
    const search = jest.fn(async () => []);
    await expect(
      findBestAudiusMatch(query('Tame', ['Neffex']), search)
    ).resolves.toBeNull();
  });

  it('déduplique les candidats entre tentatives', async () => {
    // Même id renvoyé par 2 requêtes : le score ne doit pas être doublé.
    const search = jest.fn(async (text: string) =>
      text === 'Tame Neffex' || text === 'Tame'
        ? [audius('dup', 'Tame', 'Neffex')]
        : []
    );
    const match = await findBestAudiusMatch(query('Tame', ['Neffex']), search);
    expect(match?.id).toBe('dup');
  });

  it('respecte un seuil minimum plus strict quand il est demandé', async () => {
    const search = jest.fn(async () => [
      audius('other', 'Tame Impala vs everything', 'Other Artist'),
    ]);
    await expect(
      findBestAudiusMatch(query('Tame', ['Neffex']), search, {
        minimumAcceptedScore: 99,
      })
    ).resolves.toBeNull();
  });
});
