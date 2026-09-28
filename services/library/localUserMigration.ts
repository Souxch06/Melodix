/**
 * Migration des données existantes vers le modèle sans compte (Melodix 3.0).
 *
 * Jouée UNE SEULE FOIS au démarrage (drapeau AsyncStorage) :
 * 1. purge définitive des anciens stores liés à la session Spotify
 *    (tokens, mode, favoris du mode invité Audius — rien de cela n'a de
 *    valeur utilisateur et les tokens ne doivent plus exister sur l'appareil) ;
 * 2. migre les favoris Audius du mode invité vers la bibliothèque locale
 *    (les identifiants Audius étant SOURCE-AGNOSTIC, aucun re-mapping
 *    Spotify→Audius n'est nécessaire côté favoris utilisateur) ;
 * 3. l'historique local et le cache de matching sont CONSERVÉS tels quels.
 *
 * Idempotent : si la migration a déjà été jouée, on repart immédiatement.
 */

import AsyncStorage from '@react-native-async-storage/async-storage';

import { TrackModel } from '@models';

import { saveTrack } from './localLibrary';

const MIGRATION_FLAG_KEY = '@melodix/migration-v3-no-account';

/** Anciens stores à purger (jamais de token sur l'appareil). */
const LEGACY_KEYS_TO_PURGE = [
  'melodix.token',
  'melodix.refresh-token',
  'melodix.token-expiration',
  'melodix.session-mode',
  'melodix.audius-favorites',
];

const AUDIUS_FAVORITES_KEY = 'melodix.audius-favorites';

type LegacyAudiusFavorite = Partial<{
  id: string;
  title: string;
  artist: string;
  artwork: string;
}>;

const migrateAudiusFavorites = async (): Promise<number> => {
  let raw: string | null = null;
  try {
    raw = await AsyncStorage.getItem(AUDIUS_FAVORITES_KEY);
  } catch {
    return 0;
  }
  if (!raw) {
    return 0;
  }

  let favorites: LegacyAudiusFavorite[] = [];
  try {
    const parsed = JSON.parse(raw) as unknown;
    favorites = Array.isArray(parsed) ? (parsed as LegacyAudiusFavorite[]) : [];
  } catch {
    return 0;
  }

  let migrated = 0;
  for (const favorite of favorites) {
    if (!favorite?.id || !favorite.title) {
      continue;
    }
    const track: TrackModel = {
      id: `audius:${favorite.id}`,
      title: String(favorite.title),
      subtitle: String(favorite.artist ?? ''),
      imageURL: typeof favorite.artwork === 'string' ? favorite.artwork : undefined,
    };
    await saveTrack(track, {
      artists: favorite.artist ? [String(favorite.artist)] : [],
    });
    migrated += 1;
  }

  if (migrated > 0) {
    console.info(`Migration 3.0 : ${migrated} favori(s) Audius migré(s)`);
  }
  return migrated;
};

/**
 * Joue la migration si nécessaire. Exposée pure pour l'app (index.tsx).
 */
export const runAccountlessMigration = async (): Promise<void> => {
  let done: string | null = null;
  try {
    done = await AsyncStorage.getItem(MIGRATION_FLAG_KEY);
  } catch {
    done = null;
  }
  if (done) {
    return;
  }

  try {
    // 1. Favoris invité → bibliothèque locale (AVANT purge de la source).
    await migrateAudiusFavorites();

    // 2. Purge des vestiges de la session Spotify (tokens inclus).
    await AsyncStorage.multiRemove(LEGACY_KEYS_TO_PURGE);

    await AsyncStorage.setItem(MIGRATION_FLAG_KEY, new Date().toISOString());
    console.info('Migration 3.0 (sans compte) terminée.');
  } catch (error) {
    // Une migration en échec NE DOIT PAS bloquer le démarrage : on réessaiera
    // au prochain lancement (le drapeau n'a pas été posé).
    console.warn('Migration 3.0 interrompue (réessaiera au prochain lancement)', error);
  }
};

/** Tests uniquement : simule un appareil déjà migré / pas encore migré. */
export const __resetMigrationFlagForTests = async (): Promise<void> => {
  await AsyncStorage.removeItem(MIGRATION_FLAG_KEY);
};

export const MIGRATION_KEYS_FOR_TESTS = {
  MIGRATION_FLAG_KEY,
  LEGACY_KEYS_TO_PURGE,
  AUDIUS_FAVORITES_KEY,
};
