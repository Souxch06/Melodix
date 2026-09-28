/**
 * Textes en français de Melodix 4.0 (écran de connexion + compte Spotify).
 * Le reste de l'interface utilise le fichier en-gb.ts.
 *
 * Aucune chaîne ne mentionne Client ID, token ou configuration technique :
 * l'utilisateur final ne doit jamais voir ces concepts.
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

// Écran de connexion + cycle de session OAuth (messages utilisateur propres,
// JAMAIS de détail technique ni de stack trace).
export const FR_FR_LOGIN = {
  loginWelcome: 'Melodix',
  loginTagline: 'Ta musique. Ton univers.',
  loginHeaderNotation: '×', // séparateur entre les logos Melodix et Spotify
  loginDescription:
    'Retrouve tes playlists personnelles et écoute-les, sans jamais saisir la moindre clé : tout passe par la page officielle de Spotify.',
  loginContinue: 'Continuer avec Spotify',
  loginConnecting: 'Connexion à Spotify...',
  loginExchanging: 'Préparation de ta session...',
  loginValidate: 'Réessayer',
  loginCancelledTitle: 'Connexion annulée',
  loginCancelledBody: 'Tu peux réessayer quand tu veux.',
  loginErrorTitle: 'Impossible de se connecter à Spotify.',
  loginErrorBody: 'Vérifie ta connexion internet puis réessaie.',
  loginNotConfigured: "Spotify n'est pas configuré sur cette version de Melodix.",
  loginNotConfiguredTitle: 'Connexion Spotify indisponible',
  loginNotConfiguredBody:
    "La connexion Spotify n'est pas encore configurée sur cette version de Melodix.\nVeuillez utiliser une version correctement configurée.",
  loginPrivacyNote:
    'Connexion sécurisée avec Spotify. Aucune clé ne te sera demandée : tu te connectes sur la page officielle de Spotify, puis tu reviens à Melodix.',
  loginSecureFootnote: 'Connexion sécurisée avec Spotify',
  loginSessionExpired: 'Ta session Spotify a expiré.\nReconnecte-toi pour continuer.',
  loginFetchFailed: 'Impossible de récupérer tes playlists.\nRéessaie plus tard.',
  loginSignOut: 'Se déconnecter',
  loginSignOutConfirmTitle: 'Se déconnecter de Spotify ?',
  loginSignOutConfirmMessage:
    'La session Spotify sera supprimée de cet appareil. Tes favoris et ton historique locaux sont conservés.',
  loginSignOutConfirm: 'Se déconnecter',
};
