import { EN_GB } from './en-gb';
import { FR_FR_ACCOUNT, FR_FR_PLAYER } from './fr-fr';

// L'interface parle français pour le profil local et le lecteur ; le reste
// est encore en anglais (en-gb.ts). Aucune clé de session/token/compte
// Spotify n'existe dans les traductions (plus de login dans Melodix 3.0).
export const translations = {
  ...EN_GB,
  ...FR_FR_ACCOUNT,
  ...FR_FR_PLAYER,
};
export { BROWSE_GENRES } from './genres';
