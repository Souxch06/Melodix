/**
 * Journal de DIAGNOSTIC du flux Spotify OAuth, préfixé `[Spotify OAuth]`.
 *
 * BUT : déterminer sur un vrai appareil QUELLE cause précise survient
 * (CLIENT_ID manquant, redirectUri incorrect, refus Spotify, annulation,
 * callback non reçu, code absent, state invalide, PKCE invalide, échange
 * refusé, /me en échec, session non sauvegardée, playlists en échec…).
 *
 * WHITELIST STRICTE — RIEN D'AUTRE NE PASSE. Interdits à jamais :
 *   access_token / refresh_token / Client Secret / Authorization header /
 *   code_verifier / code d'autorisation / state OAuth complet.
 * Admis : types d'étape, codes d'erreur OAuth RFC 6749 (invalid_client…),
 * statuts HTTP, URI de redirection (publique), booléens de présence,
 * durées de session, comptes d'éléments. Toute valeur inconnue est ignorée.
 */
const ALLOWED_DETAIL_KEYS = new Set([
  'step', // identifiant d'étape du flux
  'status', // code HTTP ou statut logique
  'cause', // code d'erreur NON sensible (invalid_client, access_denied…)
  'errorCode', // alias d'erreur OAuth court
  'endpoint', // chemin d'API sans querystring
  'resultType', // type de résultat expo-auth-session
  'source', // source de configuration (env/embed/manifest)
  'hasRefreshToken',
  'expiresInSeconds',
  'ttlSeconds',
  'scopesCount',
  'redirectUri', // publique — identifie le build, pas un secret
  'redirectPresent', // booléen : le callback reçu correspond-il au redirect attendu
  'codePresent', // booléen — JAMAIS la valeur du code
  'statePresent', // booléen — JAMAIS la valeur du state complet
  'verifierPresent', // booléen — JAMAIS le code_verifier
  'page',
  'songCount',
  'cachedSeconds',
  'clientIdPresent', // booléen — JAMAIS l'identifiant lui-même
]);

/** Sérialisation bornée : un log > 300 caractères est tronqué (bruit). */
const formatDetails = (details: Record<string, unknown>): string => {
  const safe: Record<string, unknown> = {};
  for (const [key, value] of Object.entries(details)) {
    if (ALLOWED_DETAIL_KEYS.has(key)) {
      safe[key] =
        typeof value === 'string' ? value.slice(0, 80) : value;
    }
  }
  const text = Object.keys(safe).length ? JSON.stringify(safe) : '';
  return text.length > 300 ? `${text.slice(0, 297)}…` : text;
};

/**
 * Log développeur d'une étape OAuth/data, sans jamais exposer de secret.
 * Format : [Spotify OAuth] <step> — {détails whitelistés}
 */
export const spotifyLog = (
  step: string,
  details: Record<string, unknown> = {}
): void => {
  const parts = formatDetails(details);
  // eslint-disable-next-line no-console
  console.log(`[Spotify OAuth] ${step}${parts ? ` — ${parts}` : ''}`);
};

/** Alias explicite pour la ligne exigée de diagnostic du redirect. */
export const logRedirectUri = (redirectUri: string): void => {
  spotifyDiag('REDIRECT_URI', redirectUri);
};

/** Ligne de diagnostic au FORMAT EXACT demandé par la mission :
 *   [Spotify OAuth] <STAGE>: <value>
 * La valeur est bornée (120 caractères) et sanitise mots sensibles.
 * Ne JAMAIS lui passer de token/secret/verifier/code/state complet.
 */
export const spotifyDiag = (stage: string, value?: string): void => {
  const raw = value === undefined ? '' : `: ${String(value)}`;
  // Ceinture de sécurité supplémentaire : filtre toute valeur suspecte.
  const safe = sensitivePattern.test(raw)
    ? ': <redacted>'
    : raw.length > 120
      ? `${raw.slice(0, 117)}…`
      : raw;
  // eslint-disable-next-line no-console
  console.log(`[Spotify OAuth] ${stage}${safe}`);
};

/** Ligne verbatim de mise en config (ex. « Spotify Redirect URI: … »). */
export const spotifyConfigLine = (line: string): void => {
  // Même ceinture de sécurité : toute valeur suspecte est masquée.
  const safe = /[Bb]earer|access_?token|refresh_?token|Authorization|client_?secret|verifier/i.test(
    line
  )
    ? '<redacted>'
    : line.length > 140
      ? `${line.slice(0, 137)}…`
      : line;
  // eslint-disable-next-line no-console
  console.log(safe);
};

/** Motifs à ne JAMAIS laisser passer dans une ligne de diagnostic. */
const sensitivePattern =
  /[Bb]earer|access_?token|refresh_?token|Authorization|client_?secret|verifier/i;

/**
 * Sanitise une description d'erreur OAuth (corps RFC 6749 / authorize) pour
 * la diagnostics : coupe à 80 caractères, refuse tout contenu à mot sensible.
 */
export const sanitizeErrorDescription = (value: unknown): string => {
  if (typeof value !== 'string' || !value.trim()) {
    return '';
  }
  const cleaned = value.replace(/[\r\n]+/g, ' ').trim();
  if (sensitivePattern.test(cleaned)) {
    return '<redacted>';
  }
  return cleaned.length > 80 ? `${cleaned.slice(0, 77)}…` : cleaned;
};

export default spotifyLog;
