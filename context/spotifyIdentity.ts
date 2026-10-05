/**
 * IDENTITÉ SPOTIFY — source de vérité et règles d'état.
 *
 * Invariant absolu : l'identifiant du profil LOCAL (`LOCAL_USER_ID`) n'est
 * JAMAIS un identifiant de compte Spotify. Aucune requête personnelle,
 * aucun cache, aucun écran ne doit l'utiliser comme `accountId`.
 *
 * États de session :
 * - 'loading'             : décision en cours. Couvre DEUX cas : la lecture du
 *                           stockage n'est pas terminée, OU une session
 *                           Spotify est stockée mais le profil du compte
 *                           n'est pas encore vérifié. Dans les deux cas, les
 *                           écrans ne doivent RIEN afficher d'autre qu'un
 *                           chargement : jamais `userData` local présenté
 *                           comme le compte connecté.
 * - 'local'               : aucun compte connecté (mode historique).
 * - 'spotify'             : session réseau ET profil du compte VÉRIFIÉ
 *                           (`id` Spotify réel). Seul état où `userData` est
 *                           un utilisateur Spotify et où `accountId` existe.
 * - 'spotify-unverified'  : session stockée mais profil du compte
 *                           INDISPONIBLE (réseau, 401 transitoire, réponse
 *                           invalide). État explicite : ni « connecté » avec
 *                           une identité locale, ni « local » (qui ferait
 *                           croire à une absence de session).
 */
import { LOCAL_USER_ID } from '@config';

export type SessionStatus =
  | 'loading'
  | 'local'
  | 'spotify'
  | 'spotify-unverified';

/**
 * Vrai si `id` peut être utilisé comme identifiant de compte Spotify :
 * chaîne non vide ET différente du profil local (jamais `LOCAL_USER_ID`).
 */
export const isSpotifyAccountId = (id: unknown): id is string => {
  if (typeof id !== 'string') {
    return false;
  }

  const trimmed = id.trim();

  return trimmed.length > 0 && trimmed !== LOCAL_USER_ID;
};

/** Une session Spotify est stockée (que son profil soit vérifié ou non). */
export const hasSpotifySession = (status: SessionStatus): boolean =>
  status === 'spotify' || status === 'spotify-unverified';

/**
 * Ce qu'un écran dépendant du compte a le droit de faire dans l'état courant.
 * C'est la SEULE interprétation autorisée de `sessionStatus` + `accountId` :
 * - 'restoring'            → afficher un chargement, ne charger aucune donnée ;
 * - 'identity-unavailable' → état explicite + réessai, AUCUN repli silencieux ;
 * - 'local'                → données locales (aucun compte) ;
 * - 'spotify'              → données du compte `accountId` (vérifié).
 */
export type SpotifyDataPlan =
  | { kind: 'restoring' }
  | { kind: 'identity-unavailable' }
  | { kind: 'local' }
  | { kind: 'spotify'; accountId: string };

export const resolveSpotifyDataPlan = (
  status: SessionStatus,
  accountId: string | null
): SpotifyDataPlan => {
  switch (status) {
    case 'loading':
      return { kind: 'restoring' };
    case 'spotify-unverified':
      return { kind: 'identity-unavailable' };
    case 'spotify':
      // Identité annoncée vérifiée mais identifiant inexploitable : état
      // incohérent → on n'invente RIEN (ni compte, ni repli local).
      return isSpotifyAccountId(accountId)
        ? { kind: 'spotify', accountId: accountId.trim() }
        : { kind: 'restoring' };
    case 'local':
    default:
      return { kind: 'local' };
  }
};
