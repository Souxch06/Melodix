import AsyncStorage from '@react-native-async-storage/async-storage';

/**
 * Préférences utilisateur Melodix — stockage LOCAL (AsyncStorage), une seule
 * clé versionnée. Contient UNIQUEMENT des réglages réellement appliqués :
 *
 * - language        : 'fr' | 'en' — bascule les libellés de l'interface
 *                     principale (accueil, navigation, paramètres) via
 *                     PreferencesContext → useTranslations() ;
 * - themeMode       : 'dark' | 'light' | 'system' — 'dark' est SEUL appliqué
 *                     aujourd'hui (thème natif de l'app) ; les deux autres
 *                     modes sont conservés pour l'architecture de thème mais
 *                     non appliqués (ligne grisée dans l'interface) ;
 * - accent          : identifiant d'une couleur d'accent PRÉDÉFINIE, réellement
 *                     appliquée aux éléments branchés (navigation active,
 *                     mini-lecteur, paramètres, boutons d'action) ;
 * - backgroundAudio : lecture en arrière-plan (branchée au moteur expo-av,
 *                     staysActiveInBackground) — défaut true (comportement
 *                     historique) ;
 * - startupVolume   : volume 0..100 appliqué au démarrage du moteur
 *                     (melodixPlayer.setVolume) — défaut 100 (comportement
 *                     historique).
 */

export type AppLanguage = 'fr' | 'en';
export type ThemeMode = 'dark' | 'light' | 'system';

export type AccentPreset = {
  id: string;
  hex: string;
  labelFr: string;
  labelEn: string;
};

/** Couleurs d'accent proposées — la 1ʳᵉ est l'accent historique de Melodix. */
export const ACCENT_PRESETS: AccentPreset[] = [
  {
    id: 'melodix',
    hex: '#1ed760',
    labelFr: 'Vert Melodix',
    labelEn: 'Melodix Green',
  },
  { id: 'bleu', hex: '#3b82f6', labelFr: 'Bleu', labelEn: 'Blue' },
  { id: 'violet', hex: '#a855f7', labelFr: 'Violet', labelEn: 'Purple' },
  { id: 'rose', hex: '#ec4899', labelFr: 'Rose', labelEn: 'Pink' },
  { id: 'ambre', hex: '#f59e0b', labelFr: 'Ambre', labelEn: 'Amber' },
];

export const DEFAULT_ACCENT_ID = 'melodix';

export const accentHexOf = (accentId: string): string =>
  ACCENT_PRESETS.find((preset) => preset.id === accentId)?.hex ??
  ACCENT_PRESETS[0].hex;

export type Preferences = {
  language: AppLanguage;
  themeMode: ThemeMode;
  accent: string;
  backgroundAudio: boolean;
  startupVolume: number;
};

export const DEFAULT_PREFERENCES: Preferences = {
  language: 'fr',
  themeMode: 'dark',
  accent: DEFAULT_ACCENT_ID,
  backgroundAudio: true,
  startupVolume: 100,
};

export const PREFERENCES_STORAGE_KEY = '@melodix/preferences.v1';

const sanitize = (raw: Partial<Preferences>): Preferences => ({
  language: raw.language === 'en' ? 'en' : 'fr',
  themeMode:
    raw.themeMode === 'light' || raw.themeMode === 'system'
      ? raw.themeMode
      : 'dark',
  accent:
    typeof raw.accent === 'string' &&
    ACCENT_PRESETS.some((preset) => preset.id === raw.accent)
      ? raw.accent
      : DEFAULT_ACCENT_ID,
  backgroundAudio:
    typeof raw.backgroundAudio === 'boolean' ? raw.backgroundAudio : true,
  startupVolume:
    typeof raw.startupVolume === 'number' && Number.isFinite(raw.startupVolume)
      ? Math.min(100, Math.max(0, Math.round(raw.startupVolume)))
      : 100,
});

export const loadPreferences = async (): Promise<Preferences> => {
  try {
    const stored = await AsyncStorage.getItem(PREFERENCES_STORAGE_KEY);
    if (!stored) {
      return DEFAULT_PREFERENCES;
    }
    return sanitize(JSON.parse(stored) as Partial<Preferences>);
  } catch {
    return DEFAULT_PREFERENCES;
  }
};

export const savePreferences = async (prefs: Preferences): Promise<void> => {
  await AsyncStorage.setItem(PREFERENCES_STORAGE_KEY, JSON.stringify(prefs));
};
