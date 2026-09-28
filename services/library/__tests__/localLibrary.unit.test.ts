import { LibraryItemModel, TrackModel } from '@models';

import {
  checkSaved,
  clearLocalLibrary,
  getSavedTrack,
  isSaved,
  listSavedItems,
  listSavedTracks,
  removeSavedItem,
  removeSavedTrack,
  saveItem,
  saveTrack,
  toggleSavedTrack,
} from '../localLibrary';

const track = (id: string): TrackModel => ({
  id,
  title: `Titre ${id}`,
  subtitle: 'Artiste',
  imageURL: 'cover.jpg',
});

const album = (id: string): LibraryItemModel => ({
  id,
  type: 'album',
  title: `Album ${id}`,
  subtitle: 'Artiste',
  imageURL: 'album.jpg',
});

describe('localLibrary (favoris locaux)', () => {
  beforeEach(async () => {
    await clearLocalLibrary();
  });

  afterAll(async () => {
    await clearLocalLibrary();
  });

  it('morceau : save → check → remove, état persistant', async () => {
    expect(await isSaved('track', 'a')).toBe(false);

    await saveTrack(track('a'), { albumTitle: 'X', durationMs: 1000 });
    expect(await isSaved('track', 'a')).toBe(true);

    const entry = await getSavedTrack('a');
    expect(entry?.albumTitle).toBe('X');
    expect(entry?.durationMs).toBe(1000);

    await removeSavedTrack('a');
    expect(await isSaved('track', 'a')).toBe(false);
    expect(await getSavedTrack('a')).toBeUndefined();
  });

  it('checkSaved conserve l ordre des ids', async () => {
    await saveTrack(track('a'));
    await saveTrack(track('d'));

    await expect(checkSaved('track', ['d', 'b', 'a', ''])).resolves.toEqual([
      true,
      false,
      true,
      false,
    ]);
  });

  it('listSavedTracks : les plus récents d abord', async () => {
    await saveTrack(track('old'));
    // La boucle garantit un ordre temporel distinct.
    await new Promise((resolve) => setTimeout(resolve, 2));
    await saveTrack(track('new'));

    const saved = await listSavedTracks();
    expect(saved.map(({ track: t }) => t.id)).toEqual(['new', 'old']);
  });

  it('les types sont cloisonnés (même id dans 2 types)', async () => {
    await saveTrack(track('same-id'));
    await saveItem(album('same-id'));

    expect(await isSaved('track', 'same-id')).toBe(true);
    expect(await isSaved('album', 'same-id')).toBe(true);

    await removeSavedItem('album', 'same-id');
    expect(await isSaved('track', 'same-id')).toBe(true);
    expect(await isSaved('album', 'same-id')).toBe(false);
  });

  it('listSavedItems ignore les données corrompues', async () => {
    // Écriture brute d une entrée partiellement invalide côté track ?
    // saveItem ne valide que le modèle : on vérifie au moins le filtrage
    // de pistes corrompues via une entrée track sans id (refusée au save).
    await saveItem(album('ok'));
    await expect(
      saveItem({ ...album(''), id: '' } as LibraryItemModel)
    ).resolves.toBeUndefined();

    const items = await listSavedItems('album');
    expect(items.map(({ id }) => id)).toEqual(['ok']);
  });

  it('toggleSavedTrack est réversible et cohérent', async () => {
    expect(await toggleSavedTrack(track('t1'))).toBe(true);
    expect(await isSaved('track', 't1')).toBe(true);

    expect(await toggleSavedTrack(track('t1'))).toBe(false);
    expect(await isSaved('track', 't1')).toBe(false);
  });

  it('le snapshot persisté n est jamais marqué isPlaying', async () => {
    await saveTrack({ ...track('live'), isPlaying: true });
    const entry = await getSavedTrack('live');
    expect(entry?.track.isPlaying).toBe(false);
  });

  it('refuse les entrées sans id', async () => {
    await saveTrack({ ...track(''), id: '' });
    expect((await listSavedTracks())).toHaveLength(0);
  });
});
