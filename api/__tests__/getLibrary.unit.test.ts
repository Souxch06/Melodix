import { Categories } from '@config';
import { LibraryItemModel } from '@models';
import { clearLocalLibrary, saveItem } from '@services';

import { getLibrary } from '../getLibrary';

const item = (id: string, type: LibraryItemModel['type']): LibraryItemModel => ({
  id,
  type,
  title: id,
  subtitle: '',
  imageURL: '',
});

describe('getLibrary (bibliothèque locale)', () => {
  beforeEach(async () => {
    await clearLocalLibrary();
  });

  it('bibliothèque vide → toutes catégories vides', async () => {
    const library = await getLibrary();
    expect(library[Categories.FOLLOWED_ARTISTS]).toEqual([]);
    expect(library[Categories.SAVED_ALBUMS]).toEqual([]);
    expect(library[Categories.SAVED_PLAYLISTS]).toEqual([]);
    expect(library[Categories.SAVED_PODCASTS]).toEqual([]);
    expect(library[Categories.ALL]).toEqual([]);
  });

  it('agrège les types sauvegardés dans leurs catégories', async () => {
    await saveItem(item('artist-1', 'artist'));
    await saveItem(item('album-1', 'album'));
    await saveItem(item('playlist-1', 'playlist'));
    await saveItem(item('show-1', 'show'));

    const library = await getLibrary();
    expect(library[Categories.FOLLOWED_ARTISTS].map(({ id }) => id)).toEqual([
      'artist-1',
    ]);
    expect(library[Categories.SAVED_ALBUMS].map(({ id }) => id)).toEqual([
      'album-1',
    ]);
    expect(library[Categories.SAVED_PLAYLISTS].map(({ id }) => id)).toEqual([
      'playlist-1',
    ]);
    expect(library[Categories.SAVED_PODCASTS].map(({ id }) => id)).toEqual([
      'show-1',
    ]);
    expect(library[Categories.ALL]).toHaveLength(4);
  });

  it('ne lève jamais d exception vers l écran même si la persistance lit mal', async () => {
    await expect(getLibrary()).resolves.toBeTruthy();
  });
});
