/**
 * Textes en français de Melodix 3.0.
 *
 * L'application n'a PLUS aucun écran de connexion ni concept de compte :
 * ce fichier ne contient volontairement aucune clé de session/token/
 * Client ID/Premium. Le reste de l'interface utilise le fichier en-gb.ts.
 */

// Profil local (avatar en haut à gauche) : données stockées sur l'appareil.
export const FR_FR_ACCOUNT = {
  accountTitle: 'Melodix',
  accountLocalInfo:
    "Aucun compte n'est nécessaire : tes favoris, ta bibliothèque et ton historique sont stockés uniquement sur cet appareil.",
  accountClearHistory: "Effacer l'historique d'écoute",
  accountHistoryCleared: 'Historique effacé.',
  accountCancel: 'Annuler',
};

// Lecteur et correspondances Audius
export const FR_FR_PLAYER = {
  playerPlay: 'Lecture',
  playerPause: 'Pause',
  playerNext: 'Titre suivant',
  playerPrevious: 'Titre précédent',
  playerStop: 'Fermer le lecteur',
  playerLoading: 'Chargement…',
  playerShuffle: 'Lecture aléatoire',
  playerRepeat: 'Répéter',
  playerRepeatOne: 'Répéter le titre',
  playerVolume: 'Volume',
  playerSeek: 'Position',
  playerUpNext: 'À suivre',
  playerExpand: 'Agrandir le lecteur',
  playerClose: 'Réduire le lecteur',
  playerStreamedWith: (provider: string) => `Lu via ${provider}`,
  playerTrackUnavailable: (title: string) =>
    `« ${title} » n'est pas disponible sur Audius.`,
  playerMatchUncertain: (title: string) =>
    `La correspondance de « ${title} » est incertaine : aucun audio n'est joué.`,
  playerTrackPlayFailed: (title: string) =>
    `La lecture de « ${title} » a échoué.`,
  playerError: 'La lecture a échoué. Essaie un autre titre.',
  playerUnavailable: "L'audio est indisponible sur cet appareil.",
};
