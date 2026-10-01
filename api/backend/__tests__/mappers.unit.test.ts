/**
 * I-2 — les mappers DTO backend propagent durée + album vers les modèles.
 * Sans eux, toute la chaîne backend → TrackModel/LibraryItemModel →
 * PlayerTrack → matcher fonctionnait avec des métadonnées jetées.
 */
import { dtoTrackToLibraryItem, dtoTrackToTrackModel } from '../index';
import type { TrackMetadataDTO } from '../dto';

const dto = (overrides: Partial<TrackMetadataDTO> = {}): TrackMetadataDTO => ({
  id: 'trk-1',
  title: 'Song',
  artists: ['Artist A', 'Artist B'],
  album: 'The Album',
  durationMs: 201_000,
  coverUrl: 'https://cover/x.jpg',
  audiusMatch: null,
  ...overrides,
});

describe('backend DTO → modèles (I-2)', () => {
  it('dtoTrackToTrackModel : durée + album présents et inchangés', () => {
    const model = dtoTrackToTrackModel(dto());

    expect(model.durationMs).toBe(201_000);
    expect(model.albumName).toBe('The Album');
    expect(model.subtitle).toBe('Artist A, Artist B');
  });

  it('dtoTrackToLibraryItem : durée + album présents et inchangés', () => {
    const item = dtoTrackToLibraryItem(dto());

    expect(item.type).toBe('track');
    expect(item.durationMs).toBe(201_000);
    expect(item.albumName).toBe('The Album');
  });

  it('source incomplète : null propagé (jamais d invention)', () => {
    const sparse = dto({ album: null, durationMs: null });

    expect(dtoTrackToTrackModel(sparse).durationMs).toBeNull();
    expect(dtoTrackToTrackModel(sparse).albumName).toBeNull();
    expect(dtoTrackToLibraryItem(sparse).durationMs).toBeNull();
    expect(dtoTrackToLibraryItem(sparse).albumName).toBeNull();
  });
});
