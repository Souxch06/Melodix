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
  playerMute: 'Couper le son',
  playerUnmute: 'Rétablir le son',
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
  // File d'attente avancée (Phase 2) : actions de file, menu, reprise.
  playerQueueTitle: 'File d’attente',
  playerQueuePlaying: 'Lecture en cours',
  playerQueueEmpty: 'La file est vide.',
  playerQueueClear: 'Vider',
  playerQueueAdd: 'Ajouter à la file',
  playerQueuePlayNext: 'Lire ensuite',
  playerQueueRemove: 'Supprimer de la file',
  playerQueueMoveUp: 'Monter dans la file',
  playerQueueMoveDown: 'Descendre dans la file',
  playerQueueTrackActions: (title: string) =>
    `Actions pour « ${title} » : ajouter à la file ou lire ensuite`,
  playerResumeTitle: 'Reprendre la lecture',
  playerResumeAction: 'Reprendre',
  playerResumeDismiss: 'Ignorer',
  playerResumePosition: (position: string) => `Reprendre à ${position}`,
};

// Écran de connexion + cycle de session OAuth (messages utilisateur propres,
// JAMAIS de détail technique ni de stack trace).
export const FR_FR_LOGIN = {
  loginWelcome: 'Melodix',
  loginTagline: 'Ta musique. Ton univers.',
  loginHeaderNotation: '×', // séparateur entre les logos Melodix et Spotify
  loginDescription:
    'Retrouve tes playlists personnelles et écoute-les, sans jamais saisir la moindre clé : tout passe par la page officielle de Spotify.',
  loginWelcomeTitle: 'Bienvenue sur Melodix',
  loginConnectHint: 'Ta musique. Tes playlists. Ton univers.',
  loginRedirectNote: 'Connexion sécurisée avec Spotify',
  loginContinue: 'Continuer avec Spotify',
  loginConnecting: 'Connexion à Spotify…',
  loginExchanging: 'Finalisation de la connexion…',
  loginSuccess: 'Connexion réussie !',
  loginValidate: 'Réessayer',
  // Messages HUMAINS uniquement — jamais de cause technique à l'écran.
  loginErrorGenericTitle: 'Impossible de se connecter à Spotify.',
  loginErrorGenericBody: 'Vérifie ta connexion Internet puis réessaie.',
  loginCancelledTitle: 'Connexion annulée',
  loginCancelledBody: 'Tu peux réessayer quand tu veux.',
  loginOAuthRefusedTitle: 'Spotify a refusé la connexion',
  loginOAuthRefusedBody:
    'Autorise bien Melodix sur la page Spotify, puis réessaie.',
  loginNotConfigured:
    "La connexion Spotify n'est pas disponible pour le moment.",
  loginNotConfiguredBody: 'Réessaie plus tard.',
  loginPrivacyNote:
    'Connexion sécurisée avec Spotify. Aucune clé ne te sera demandée : tu te connectes sur la page officielle de Spotify, puis tu reviens à Melodix.',
  loginSecureFootnote: 'Connexion sécurisée avec Spotify',
  loginSessionExpired:
    'Ta session Spotify a expiré.\nReconnecte-toi pour continuer.',
  loginFetchFailed:
    'Impossible de récupérer tes playlists.\nRéessaie plus tard.',
  loginSignOut: 'Se déconnecter',
  loginSignOutConfirmTitle: 'Se déconnecter de Spotify ?',
  loginSignOutConfirmMessage:
    'La session Spotify sera supprimée de cet appareil. Tes favoris et ton historique locaux sont conservés.',
  loginSignOutConfirm: 'Se déconnecter',
  accountSpotifySection: 'Compte Spotify',
  accountSignOut: 'Déconnexion',
};

// Playlists : statistique de disponibilité, badges de source, indisponible.
// Accueil (vraies données Spotify : salutation, sections, états vides/erreur).
export const FR_FR_HOME = {
  homeHello: (name: string) => `Bonjour, ${name}`,
  homeGreetingMorning: (name: string) => `Bonjour, ${name} 👋`,
  homeGreetingEvening: (name: string) => `Bonsoir, ${name} 👋`,
  homeGreetingNight: (name: string) => `Bonne nuit, ${name} 👋`,
  homeListenPrompt: 'Qu’est-ce que tu veux écouter ?',
  homeYourPlaylists: 'Tes playlists',
  homeRecentlyPlayed: 'Récemment écouté',
  homeForYou: 'Pour toi',
  homePlaylistsEmptyTitle: 'Aucune playlist pour le moment',
  homePlaylistsEmptyBody: 'Tes playlists Spotify apparaîtront ici.',
  homeRefresh: 'Actualiser',
  homeLoadErrorTitle: 'Impossible de charger tes données Spotify.',
  homeRetry: 'Réessayer',
  homeSettings: 'Paramètres du compte',
};

// Écran Paramètres (sections, lignes, confirmations, FAQ, à propos).
export const FR_FR_SETTINGS = {
  settingsTitle: 'Paramètres',
  settingsBack: 'Retour',
  settingsSectionAccount: 'Compte',
  settingsConnectedSpotify: 'Connecté à Spotify',
  settingsCheckingSession: 'Vérification de la session…',
  settingsLocalAccount: 'Compte local',
  settingsSpotifyAccount: 'Compte Spotify',
  settingsSessionExpiry: (minutes: number) =>
    minutes > 0
      ? `Session valable ~${minutes} min`
      : "Session sur le point d'expirer",
  settingsSessionCanRefresh: 'Renouvellement automatique disponible',
  settingsSessionNoRefresh: "Nouvelle connexion requise à l'expiration",
  settingsSignOut: 'Se déconnecter',
  settingsSignOutTitle: 'Es-tu sûr de vouloir te déconnecter de Melodix ?',
  settingsCancel: 'Annuler',
  settingsSignOutConfirm: 'Se déconnecter',
  settingsSectionAppearance: 'Apparence',
  settingsTheme: 'Thème',
  settingsThemeDark: 'Sombre',
  settingsThemeLight: 'Clair',
  settingsThemeSystem: 'Système',
  settingsComingSoon: 'Bientôt disponible',
  settingsAccent: "Couleur d'accent",
  settingsSectionPlayback: 'Lecture',
  settingsBackgroundAudio: 'Lecture en arrière-plan',
  settingsBackgroundAudioHint:
    'Continue le son quand Melodix passe en arrière-plan',
  settingsRepeatAll: 'Répéter la file',
  settingsRepeatAllHint: 'Rejoue la file quand elle se termine',
  settingsShuffle: 'Lecture aléatoire',
  settingsShuffleHint: 'Ordre aléatoire dans la file actuelle',
  settingsStartupVolume: 'Volume au démarrage',
  settingsStartupVolumeHint: (volume: number) =>
    `Appliqué au démarrage du moteur : ${volume} %`,
  settingsSectionAudio: 'Audio',
  settingsPreferredSource: 'Source audio préférée',
  settingsSourceAudius: 'Audius — prioritaire',
  settingsSourceYouTube: 'YouTube — repli',
  settingsCascadeInfo:
    'Ordre actuel : Audius en priorité, puis YouTube en repli. Chaque morceau est recherché dans cet ordre ; « indisponible » seulement si aucune source fiable ne correspond.',
  settingsSectionStorage: 'Données et stockage',
  settingsMatchCache: 'Cache des correspondances',
  settingsCacheSizeUnavailable: 'taille indisponible',
  settingsClearCache: 'Vider le cache',
  settingsClearCacheTitle: 'Vider le cache audio ?',
  settingsClearCacheConfirm: 'Vider',
  settingsCacheCleared: 'Cache vidé.',
  settingsSectionLanguage: 'Langue',
  settingsLanguage: 'Langue',
  settingsFrench: 'Français',
  settingsEnglish: 'English',
  settingsSectionHelp: 'Aide',
  settingsFaq: 'FAQ',
  settingsReportProblem: 'Signaler un problème',
  settingsAboutLogin: 'À propos de la connexion Spotify',
  settingsPlaybackIssues: 'Problèmes de lecture',
  settingsSectionAbout: 'À propos',
  settingsVersion: 'Version',
  settingsTerms: "Conditions d'utilisation",
  settingsPrivacy: 'Politique de confidentialité',
  settingsLicenses: 'Licences open source',
  settingsGithub: 'GitHub',
  settingsCredits: 'Crédits',
  settingsCreditsBody: 'Spotify · Audius · YouTube · Expo · React Native',
  // Aide (faq.tsx) — contenu RÉEL utile, aucune promesse fictive.
  faqIntro:
    "Réponses aux questions les plus fréquentes sur Melodix, écrites d'après le fonctionnement réel de l'application.",
  faqLoginQ: 'Pourquoi me connecter avec Spotify ?',
  faqLoginA:
    'Melodix lit tes playlists et ton profil Spotify. La connexion passe par la page officielle de Spotify (Authorization Code + PKCE) : Melodix ne voit ni ne demande jamais ton mot de passe.',
  faqPlaybackQ: 'Pourquoi un morceau est-il « indisponible » ?',
  faqPlaybackA:
    "L'audio ne vient jamais de Spotify. Chaque morceau est d'abord recherché sur Audius, puis sur YouTube en repli. « Indisponible » n'est affiché que si aucune correspondance fiable n'est trouvée.",
  faqSourcesQ: "D'où vient le son ?",
  faqSourcesA:
    "De catalogues publics : Audius en priorité (artistes indépendants), sinon YouTube. La correspondance est mise en cache sur l'appareil, donc les écoutes suivantes sont immédiates.",
  faqCacheQ: 'Que fait « Vider le cache » ?',
  faqCacheA:
    "Cela oublie les correspondances titre→source stockées sur l'appareil. La lecture suivante recherche à nouveau Audius puis YouTube. Ton compte, tes playlists et ton historique ne sont pas touchés.",
  faqAccountQ: 'Où sont stockées mes données ?',
  faqAccountA:
    "Uniquement sur ton appareil : historique d'écoute, réglages et session Spotify (stockage chiffré). Melodix ne conserve aucun profil côté serveur.",
  // À propos (about.tsx)
  aboutTermsBody:
    "Melodix est une application personnelle de compagnon musical. Connecte-toi avec ton propre compte Spotify et utilise l'application pour une écoute personnelle et non commerciale. Les noms et contenus Spotify, Audius et YouTube appartiennent à leurs détenteurs respectifs.",
  aboutPrivacyBody:
    "Melodix stocke tes données uniquement sur ton appareil : historique d'écoute, préférences et session Spotify chiffrée. Rien n'est envoyé vers un serveur Melodix. La déconnexion supprime définitivement la session locale.",
  aboutLicensesBody:
    'Construit avec : Expo (MIT), React Native (MIT), React Navigation (MIT), expo-av / expo-auth-session (MIT), AsyncStorage (MIT). Catalogues : Spotify Web API, Audius API, YouTube — chacun sous ses propres conditions.',
};

export const FR_FR_PLAYLIST = {
  /** « 85/100 morceaux disponibles » — calculée dynamiquement. */
  playlistAvailabilityInfo: (available: number, total: number) =>
    `${available}/${total} morceaux disponibles`,
  trackUnavailableNotice:
    "Ce morceau n'est pas disponible sur les sources de lecture actuelles.",
  providerAudius: 'Audius',
  providerYouTube: 'YouTube',
  providerUnavailable: 'Indisponible',
  // Favoris (écran dédié de la bibliothèque locale — jamais d'écran blanc).
  favoritesTitle: 'Titres favoris',
  favoritesTracksInfo: (count: number) =>
    count > 1 ? `${count} morceaux favoris` : `${count} morceau favori`,
  favoritesEmptyTitle: 'Aucun favori pour le moment',
  favoritesEmptyBody:
    'Touche le cœur d’un morceau pour le retrouver ici — tes favoris restent stockés sur cet appareil.',
  // Titres aimés du compte Spotify (source distincte des favoris locaux).
  likedSongsTitle: 'Titres aimés',
  likedSongsSubtitle: (count: number) =>
    count > 1 ? `${count} titres aimés` : `${count} titre aimé`,
  likedSongsLoading: 'Chargement de tes titres aimés…',
  likedSongsErrorTitle: 'Impossible de charger tes titres aimés',
  likedSongsErrorBody:
    'Spotify n’a pas répondu. Vérifie ta connexion puis réessaie.',
  likedSongsEmptyTitle: 'Aucun titre aimé',
  likedSongsEmptyBody:
    'Touche le cœur d’un morceau dans Spotify pour le retrouver ici.',
  likedSongsTruncated: (count: number) =>
    `Affichage des ${count} premiers titres aimés.`,
};
