/* ============================================================================
 * ⚠️  SCRIPT TEMPORAIRE DE DIAGNOSTIC — À SUPPRIMER APRÈS LE DIAGNOSTIC  ⚠️
 * ----------------------------------------------------------------------------
 * But unique : vérifier concrètement si les appels authentifiés à l'API Web
 * Spotify fonctionnent (hors de l'app Melodix, sur la machine du mainteneur).
 *
 * RÈGLES RESPECTÉES :
 * - AUCUN token n'est écrit dans ce fichier : il est lu UNIQUEMENT depuis la
 *   variable d'environnement SPOTIFY_TEST_TOKEN au moment de l'exécution ;
 * - jamais de log du token ni de l'en-tête Authorization ;
 * - n'affecte ni l'APK, ni le bundle JS (aucun import depuis src/) ;
 * - à supprimer une fois que le diagnostic a répondu.
 *
 * Usage :
 *   SPOTIFY_TEST_TOKEN="<votre-token>" node scripts/tmp-spotify-diag.mjs
 *
 * Détail attendu pour le compte-rendu : code HTTP par endpoint + le message
 * d'erreur exact renvoyé par Spotify (l'API renvoie ces champs publiquement
 * dans son corps JSON d'erreur — ce ne sont PAS des secrets).
 * ========================================================================== */

const token = process.env.SPOTIFY_TEST_TOKEN;
if (!token) {
  console.error('ERREUR : SPOTIFY_TEST_TOKEN absent de l\'environnement.');
  console.error('Usage : SPOTIFY_TEST_TOKEN="<token>" node scripts/tmp-spotify-diag.mjs');
  process.exit(2);
}

async function fetchWebApi(endpoint) {
  const res = await fetch(`https://api.spotify.com/${endpoint}`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    method: 'GET',
  });
  return res;
}

async function probe(endpoint, label, describe) {
  let res;
  try {
    res = await fetchWebApi(endpoint);
  } catch (e) {
    console.log(`${label} : ERREUR RÉSEAU (${e.cause?.code ?? e.message})`);
    return;
  }
  let body = null;
  try {
    body = await res.json();
  } catch {
    body = null;
  }
  console.log(`${label} : HTTP ${res.status}`);
  if (res.ok) {
    describe?.(body);
  } else {
    // Corps JSON d'erreur PUBLIC de l'API : { error: { status, message } }
    const e = body?.error;
    console.log(
      `   → ERREUR SPOTIFY EXACTE : status=${e?.status ?? '?'} message="${e?.message ?? '<corps illisible>'}"`
    );
  }
}

console.log('=== Diagnostic API Spotify (token de test, depuis env) ===');

// 1. Profil — base de la session Melodix
await probe('v1/me', 'GET /v1/me', (body) => {
  console.log(
    `   → id=${body.id}, display_name="${body.display_name ?? ''}", product=${body.product ?? '?'}, country=${body.country ?? '?'}`
  );
});

// 2. L'exemple officiel Spotify fourni dans la demande
await probe(
  'v1/me/top/tracks?time_range=long_term&limit=5',
  'GET /v1/me/top/tracks',
  (body) => {
    const items = Array.isArray(body?.items) ? body.items : [];
    console.log(`   → titres reçus : ${items.length}`);
    for (const track of items) {
      console.log(
        `   · ${track.name} by ${(track.artists ?? [])
          .map((a) => a.name)
          .join(', ')}`
      );
    }
  }
);

// 3. Le chemin EXACT utilisé par Melodix pour la bibliothèque
await probe('v1/me/playlists?limit=50', 'GET /v1/me/playlists', (body) => {
  const items = Array.isArray(body?.items) ? body.items : [];
  console.log(`   → playlists reçues : ${items.length} / total déclaré : ${body?.total ?? '?'}`);
  for (const pl of items.slice(0, 3)) {
    console.log(`   · ${pl?.name} (${pl?.tracks?.total ?? '?'} titres)`);
  }
});

console.log('=== Fin du diagnostic ===');
