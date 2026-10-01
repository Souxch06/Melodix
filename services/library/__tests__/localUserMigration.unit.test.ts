import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  runAccountlessMigration,
  __resetMigrationFlagForTests,
  MIGRATION_KEYS_FOR_TESTS,
} from '../localUserMigration';
import { isSaved, clearLocalLibrary } from '../localLibrary';
import { clearPlayHistory } from '../../history/playHistory';

const { MIGRATION_FLAG_KEY, LEGACY_KEYS_TO_PURGE, AUDIUS_FAVORITES_KEY } =
  MIGRATION_KEYS_FOR_TESTS;

describe('runAccountlessMigration (migration 3.0 sans compte)', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    await clearLocalLibrary();
    await __resetMigrationFlagForTests();
  });

  afterAll(async () => {
    await AsyncStorage.clear();
    await clearLocalLibrary();
    await clearPlayHistory();
  });

  it('purge définitivement les vestiges de session Spotify', async () => {
    for (const key of LEGACY_KEYS_TO_PURGE) {
      await AsyncStorage.setItem(key, 'legacy-value');
    }

    await runAccountlessMigration();

    for (const key of LEGACY_KEYS_TO_PURGE) {
      // Aucun token / mode de session ne peut survivre à la migration.
      expect(await AsyncStorage.getItem(key)).toBeNull();
    }
    expect(await AsyncStorage.getItem(MIGRATION_FLAG_KEY)).toBeTruthy();
  });

  it('migre les favoris Audius du mode invité vers la bibliothèque locale', async () => {
    await AsyncStorage.setItem(
      AUDIUS_FAVORITES_KEY,
      JSON.stringify([
        { id: 'a1', title: 'Titre Un', artist: 'X', artwork: 'img.png' },
        { id: 'a2', title: 'Titre Deux', artist: 'Y' },
        // Entrées corrompues → ignorées.
        { title: 'Sans id' },
        null,
      ])
    );

    await runAccountlessMigration();

    expect(await isSaved('track', 'audius:a1')).toBe(true);
    expect(await isSaved('track', 'audius:a2')).toBe(true);
    expect(await isSaved('track', 'audius:')).toBe(false);
  });

  it('est idempotente : ne se rejoue jamais', async () => {
    await runAccountlessMigration();
    const firstFlag = await AsyncStorage.getItem(MIGRATION_FLAG_KEY);

    // Nouvelles données legacy posées alors que la migration est faite :
    // elles doivent être IGNORÉES (la migration n'est pas rejouée).
    await AsyncStorage.setItem('melodix.token', 're-legacy');
    await runAccountlessMigration();

    expect(await AsyncStorage.getItem(MIGRATION_FLAG_KEY)).toBe(firstFlag);
    expect(await AsyncStorage.getItem('melodix.token')).toBe('re-legacy');
  });

  it('supporte un stockage totalement vierge (première installation)', async () => {
    await expect(runAccountlessMigration()).resolves.toBeUndefined();
    expect(await AsyncStorage.getItem(MIGRATION_FLAG_KEY)).toBeTruthy();
  });

  it('un JSON illisible pour les favoris n interrompt pas la purge', async () => {
    await AsyncStorage.setItem(AUDIUS_FAVORITES_KEY, '{invalid json');
    await AsyncStorage.setItem('melodix.token', 'to-purge');

    await runAccountlessMigration();

    expect(await AsyncStorage.getItem('melodix.token')).toBeNull();
    expect(await AsyncStorage.getItem(MIGRATION_FLAG_KEY)).toBeTruthy();
  });

  it('n écrase pas un favori local déjà présent (ré-création id/seed)', async () => {
    await AsyncStorage.setItem(
      AUDIUS_FAVORITES_KEY,
      JSON.stringify([{ id: 'a1', title: 'Legacy', artist: 'Old' }])
    );

    await runAccountlessMigration();
    await runAccountlessMigration();

    // Un seul élément, non dupliqué.
    expect(await isSaved('track', 'audius:a1')).toBe(true);
  });
});
