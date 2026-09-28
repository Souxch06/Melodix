/**
 * Journal de diagnostic développeur du flux Spotify OAuth.
 *
 * RÈGLE ABSOLUE : jamais de secret dans les logs. La WHITELIST ci-dessous
 * limite les champs admis — un détail d'erreur technique est utile au
 * développeur, un token ne l'est jamais :
 *
 *   access_token / refresh_token / Authorization header /
 *   code_verifier / client_secret  → JAMAIS consignés
 *
 * Seules des métadonnées non sensibles passent : types d'événements, codes de
 * statut HTTP, durées de validité, présence/absence (booléens), tailles de
 * portée, URIs de redirection (publiques, non secrètes).
 */
const ALLOWED_DETAIL_KEYS = new Set([
  'status', // code HTTP et statut logique
  'endpoint', // chemin d'API sans querystring
  'resultType', // type de résultat expo-auth-session
  'hasRefreshToken', // booléen : présence d'un refresh token
  'expiresInSeconds',
  'ttlSeconds',
  'scopesCount',
  'redirectUri', // publique — identifie l'appareil de test, pas un secret
  'page',
  'songCount',
  'cachedSeconds',
  'cause',
]);

/** Sérialisation bornée : log > 300 caractères tronqué (logs volumineux = bruit). */
const formatDetails = (details: Record<string, unknown>): string => {
  const safe: Record<string, unknown> = {};
  for (const [key, value] of Object.entries(details)) {
    if (ALLOWED_DETAIL_KEYS.has(key)) {
      safe[key] = value;
    }
  }
  const text = Object.keys(safe).length ? JSON.stringify(safe) : '';
  return text.length > 300 ? `${text.slice(0, 297)}…` : text;
};

/**
 * Log développeur d'une étape OAuth/data, sans jamais exposer de secret.
 * Utilisé par session.ts, useSpotifyAuth.ts, apiClient.ts, les routes data.
 */
export const spotifyLog = (
  step: string,
  details: Record<string, unknown> = {}
): void => {
  const parts = formatDetails(details);
  // eslint-disable-next-line no-console
  console.log(`[spotify] ${step}${parts ? ` — ${parts}` : ''}`);
};

/** logs côté services/spotify uniquement. */
export default spotifyLog;
