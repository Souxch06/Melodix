import { EN_GB, EN_GB_LOGIN, EN_GB_PLAYLIST } from './en-gb';
import {
  FR_FR_ACCOUNT,
  FR_FR_LOGIN,
  FR_FR_PLAYER,
  FR_FR_PLAYLIST,
} from './fr-fr';

// La base de l'interface est en anglais (en-gb.ts) ; les messages critiques
// (connexion, compte, lecteur, erreurs utilisateur) sont surchargés en
// français. EN_GB_LOGIN fournit les reprises anglaises si besoin futur.
export * from './genres';
export const translations = {
  ...EN_GB,
  ...EN_GB_LOGIN,
  ...EN_GB_PLAYLIST,
  ...FR_FR_ACCOUNT,
  ...FR_FR_PLAYER,
  ...FR_FR_LOGIN,
  ...FR_FR_PLAYLIST,
};
