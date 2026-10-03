/**
 * playerTrackFromHistoryEntry (I-8 partagé) : le PlayerTrack reconstruit
 * garde la clé de queue EXACTE, re-déduit la source SANS double préfixe et
 * réutilise les métadonnées du snapshot quand il existe.
 */
import { playerTrackFromHistoryEntry } from '../historyPlayerTrack';

describe('playerTrackFromHistoryEntry', () => {
  it('spotify : clé conservée, source dépréfixée, métadonnées du snapshot', () => {
    const track = playerTrackFromHistoryEntry({
      id: 'spotify:t1',
      title: 'Fallback Title',
      imageURL: 'img',
      snapshot: {
        id: 'spotify:t1',
        title: 'Snapshot Title',
        subtitle: 'A, B',
        albumName: 'Album',
        durationMs: 123_000,
        isrc: 'FRABC2412345',
        explicit: true,
      },
    });

    expect(track).toEqual({
      id: 'spotify:t1',
      title: 'Snapshot Title',
      artists: ['A', 'B'],
      album: 'Album',
      durationMillis: 123_000,
      isrc: 'FRABC2412345',
      explicit: true,
      imageURL: 'img',
      source: { provider: null, id: 't1' },
    });
  });

  it('audius : source native audius (pas de matching)', () => {
    const track = playerTrackFromHistoryEntry({
      id: 'audius:a7',
      title: 'Song',
      imageURL: 'img',
      snapshot: { id: 'audius:a7', title: 'Song', subtitle: 'DJ' },
    });

    expect(track.source).toEqual({ provider: 'audius', id: 'a7' });
  });

  it('sans snapshot : identité minimale de la tuile', () => {
    const track = playerTrackFromHistoryEntry({
      id: 'spotify:old-1',
      title: 'Old',
      imageURL: 'img',
    });

    expect(track).toMatchObject({
      id: 'spotify:old-1',
      title: 'Old',
      artists: [],
      album: null,
      durationMillis: null,
      source: { provider: null, id: 'old-1' },
    });
  });
});
