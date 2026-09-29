/**
 * Préférences utilisateur (Paramètres) — stockage local RÉEL :
 *  1. Défauts propres : français, thème sombre, accent Melodix, lecture en
 *     arrière-plan activée, volume de démarrage à 100 %.
 *  2. Round-trip save → load : les réglages persistent entre deux sessions.
 *  3. Sanitisation : données corrompues/valeurs hors limites → défauts sûrs
 *     (jamais de crash sur un JSON cassé ni un accent inconnu).
 */
import AsyncStorage from '@react-native-async-storage/async-storage';

import {
  ACCENT_PRESETS,
  accentHexOf,
  DEFAULT_ACCENT_ID,
  DEFAULT_PREFERENCES,
  loadPreferences,
  PREFERENCES_STORAGE_KEY,
  savePreferences,
} from '../preferences';

describe('preferences — stockage local des réglages', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    jest.clearAllMocks();
  });

  it('renvoie les défauts quand rien n est stocké', async () => {
    const prefs = await loadPreferences();

    expect(prefs).toEqual(DEFAULT_PREFERENCES);
    expect(prefs.language).toBe('fr');
    expect(prefs.themeMode).toBe('dark');
    expect(prefs.accent).toBe(DEFAULT_ACCENT_ID);
    expect(prefs.backgroundAudio).toBe(true);
    expect(prefs.startupVolume).toBe(100);
  });

  it('persiste chaque réglage entre deux sessions (round-trip)', async () => {
    await savePreferences({
      language: 'en',
      themeMode: 'dark',
      accent: 'bleu',
      backgroundAudio: false,
      startupVolume: 40,
    });

    const restored = await loadPreferences();

    expect(restored.language).toBe('en');
    expect(restored.accent).toBe('bleu');
    expect(restored.backgroundAudio).toBe(false);
    expect(restored.startupVolume).toBe(40);
    // La clé est versionnée (migration future sans casser les anciennes).
    expect(AsyncStorage.setItem).toHaveBeenCalledWith(
      PREFERENCES_STORAGE_KEY,
      expect.any(String)
    );
    expect(PREFERENCES_STORAGE_KEY).toBe('@melodix/preferences.v1');
  });

  it('sanitize un accent inconnu et des valeurs hors limites', async () => {
    await AsyncStorage.setItem(
      PREFERENCES_STORAGE_KEY,
      JSON.stringify({
        language: 'de',
        themeMode: 'pink',
        accent: 'rouge-inconnu',
        backgroundAudio: 'oui',
        startupVolume: 999,
      })
    );

    const prefs = await loadPreferences();

    expect(prefs.language).toBe('fr');
    expect(prefs.themeMode).toBe('dark');
    expect(prefs.accent).toBe(DEFAULT_ACCENT_ID);
    expect(prefs.backgroundAudio).toBe(true);
    expect(prefs.startupVolume).toBe(100);
  });

  it('borne le volume entre 0 et 100 et l arrondit', async () => {
    await AsyncStorage.setItem(
      PREFERENCES_STORAGE_KEY,
      JSON.stringify({ startupVolume: -12.6 })
    );

    expect((await loadPreferences()).startupVolume).toBe(0);
  });

  it('survit à un JSON corrompu en retournant les défauts', async () => {
    await AsyncStorage.setItem(PREFERENCES_STORAGE_KEY, '{pas du json');

    await expect(loadPreferences()).resolves.toEqual(DEFAULT_PREFERENCES);
  });

  it('les presets d accent ont la teinte historique en premier', () => {
    expect(ACCENT_PRESETS.length).toBeGreaterThanOrEqual(5);
    expect(ACCENT_PRESETS[0].id).toBe('melodix');
    expect(ACCENT_PRESETS[0].hex).toBe('#1ed760');
    // Repli logique : un identifiant disparu retombe sur l accent Melodix.
    expect(accentHexOf('inconnu')).toBe('#1ed760');
    expect(accentHexOf('bleu')).toBe('#3b82f6');
  });
});
