/**
 * Textes en français de l'écran de connexion et du menu du compte.
 * Le reste de l'interface utilise encore les textes anglais (en-gb.ts).
 */
export const FR_FR_SESSION = {
  loginWelcome: 'Ta musique.\nTon univers.',

  // Connexion rapide : token copié sur developer.spotify.com
  tokenTitle: 'Connexion rapide',
  tokenIntro: "Pas d'app Spotify à créer : ton token suffit.",
  tokenSteps: [
    'Ouvre developer.spotify.com et connecte-toi avec ton compte Spotify (« Log in », en haut à droite).',
    'Dans le bloc « Code », copie le texte entre guillemets de cette ligne (ou tout le code) :',
    'Reviens ici et colle-le ci-dessous.',
  ],
  tokenCodeHint: "const token = 'BQ…';",
  tokenOpenPage: 'Ouvrir developer.spotify.com',
  tokenPlaceholder: 'Colle ton token ici',
  tokenSubmit: 'Se connecter',
  tokenSubmitLoading: 'Vérification…',
  tokenNote:
    "Spotify fait expirer ce token au bout d'1 heure : Melodix te demandera alors d'en coller un nouveau.",
  tokenEmpty: "Colle d'abord ton token.",
  tokenPlaceholderError:
    "Le code affiche token = 'undefined' : tu n'es pas connecté sur developer.spotify.com. Connecte-toi, recharge la page, puis recopie le token.",
  tokenMalformed:
    'Ce texte ne ressemble pas à un token Spotify. Copie le texte entre guillemets après const token =.',
  tokenRejected:
    'Spotify refuse ce token : il est incomplet ou a déjà expiré. Recopies-en un nouveau sur developer.spotify.com.',
  tokenForbidden:
    "Spotify refuse l'accès à ton compte avec ce token (erreur 403).",
  tokenUnavailable:
    'Spotify ne répond pas correctement pour le moment. Réessaie dans un instant.',
  tokenNetwork: 'Impossible de joindre Spotify. Vérifie ta connexion Internet.',
  tokenExpired:
    "Ton token Spotify a expiré (il ne dure qu'1 heure). Colles-en un nouveau pour continuer.",
  sessionExpired: 'Ta session Spotify a expiré. Reconnecte-toi pour continuer.',

  // Connexion permanente : Client ID + page officielle de Spotify (OAuth PKCE)
  switchToOAuth: 'Rester connecté en permanence (Client ID Spotify)',
  switchToToken: 'Connexion rapide avec un token',
  loginButton: 'Se connecter avec Spotify',
  loginButtonLoading: 'Connexion…',
  loginNote:
    'Tu te connectes sur la page officielle de Spotify : Melodix ne voit jamais ton mot de passe.',
  loginError:
    "La connexion a échoué. Vérifie ton Client ID et l'URI de redirection de ton app Spotify.",
  changeClientId: 'Utiliser un autre Client ID',
  oauthForbidden:
    "Spotify refuse l'accès à ce compte (erreur 403). Vérifie que ton e-mail Spotify est ajouté dans « User Management » de l'app Spotify, et que le compte qui l'a créée a Spotify Premium.",
  clientIdTitle: 'Connexion permanente',
  clientIdDescription:
    "Il faut une app sur developer.spotify.com/dashboard, créée une seule fois par un compte Premium (règle Spotify). Pas de Premium ? Un proche abonné peut la créer et t'ajouter dans « User Management » : tu te connectes ensuite avec ton compte gratuit. Colle son Client ID ci-dessous, tu resteras connecté sans recoller de token.",
  clientIdShare: 'Envoyer les étapes à un proche',
  clientIdShareMessage: (redirectUri: string) =>
    [
      'Salut ! Pour me connecter à mon app Melodix avec mon compte Spotify, il me faut une app Spotify créée par un compte Premium (règle Spotify). Ça prend 2 minutes :',
      '1. Va sur https://developer.spotify.com/dashboard et connecte-toi.',
      `2. Clique sur « Create app » : nom « Melodix », une description, Redirect URI « ${redirectUri} » (bouton Add), coche « Web API », accepte les conditions, puis Save.`,
      "3. Dans Settings > User Management, ajoute mon nom et l'e-mail de mon compte Spotify.",
      "4. Envoie-moi le Client ID (dans Settings, 32 caractères). Ce n'est pas un secret.",
      'Merci !',
    ].join('\n'),
  clientIdPlaceholder: 'Client ID Spotify',
  clientIdInvalid: 'Un Client ID Spotify fait 32 lettres et chiffres.',
  clientIdSave: 'Continuer',
  redirectUriLabel: 'URI de redirection à ajouter dans ton app Spotify :',

  // Menu du compte (photo de profil en haut à gauche)
  accountTitle: 'Compte Spotify',
  accountSignedInAs: (name: string) => `Connecté en tant que ${name}.`,
  accountTokenValidUntil: (time: string) =>
    `Token valable jusqu'à ${time} au plus tard.`,
  accountSignOut: 'Se déconnecter',
  accountCancel: 'Annuler',
};
