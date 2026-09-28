import { checkSavedItems } from '../checkSavedItems';
import { saveItem, saveTrack, clearLocalLibrary } from '@services';
import { LibraryItemModel, TrackModel } from '@models';

const track = (id: string): TrackModel => ({
  id,
  title: `Track ${id}`,
  subtitle: 'Artist',
});

const album = (id: string): LibraryItemModel => ({
  id,
  type: 'album',
  title: `Album ${id}`,
  subtitle: 'Artist',
  imageURL: '',
});

describe('checkSavedItems (bibliothèque locale)', () => {
  beforeEach(async () => {
    await clearLocalLibrary();
  });

  it('renvoie des réponses alignées sur les ids (ordre conservé)', async () => {
    await saveTrack(track('a'));
    await saveTrack(track('c'));

    await expect(checkSavedItems('track', ['a', 'b', 'c'])).resolves.toEqual([
      true,
      false,
      true,
    ]);
  });

  it('les ids vides sont signalés non sauvegardés', async () => {
    await expect(checkSavedItems('track', ['', 'x'])).resolves.toEqual([
      false,
      false,
    ]);
  });

  it('vérifie par type (album ≠ track)', async () => {
    await saveItem(album('a'));

    await expect(checkSavedItems('album', ['a'])).resolves.toEqual([true]);
    await expect(checkSavedItems('track', ['a'])).resolves.toEqual([false]);
  });

  it('episode est toujours false (plus de catalogue épisodes sans compte)', async () => {
    await expect(checkSavedItems('episode', ['e1', 'e2'])).resolves.toEqual([
      false,
      false,
    ]);
  });

  it('aucun réseau n est requis (fonctionne sur AsyncStorage)', async () => {
    // Pas de mock réseau dans ce test : si un appel réseau existait encore,
    // il échouerait faute d'axios mocké.
    await saveTrack(track('offline'));

    await expect(checkSavedItems('track', ['offline'])).resolves.toEqual([
      true,
    ]);
  });
});
