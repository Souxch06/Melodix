import * as React from 'react';
import { ActivityIndicator, StyleSheet, View } from 'react-native';
import { Redirect } from 'expo-router';

import { COLORS } from '@config';
import {
  clearSession,
  getValidAccessToken,
  loadSession,
  runAccountlessMigration,
} from '@services';

/**
 * Point d'entrée — protection du démarrage :
 *
 *   chargement → vérification de session (avec REFRESH SILENCIEUX si le
 *   token d'accès a expiré) :
 *     session valide        → accueil
 *     aucune session        → écran de connexion
 *     refresh IMPOSSIBLE    → session supprimée (nettoyage) → connexion
 *
 * Une session morte n'envoie JAMAIS l'utilisateur vers l'accueil.
 */
export default function App() {
  const [target, setTarget] = React.useState<'/login' | '/home' | null>(null);

  React.useEffect(() => {
    let cancelled = false;

    (async () => {
      try {
        await runAccountlessMigration();
      } catch (error) {
        // La migration ne doit JAMAIS bloquer le démarrage (voir service).
        console.warn('Migration de démarrage interrompue', error);
      }

      // getValidAccessToken tente le refresh si nécessaire. Si une session
      // existe mais n'est plus rafraîchissable → SUPPRESSION DE LA SESSION,
      // jamais de redirection vers l'accueil sans preuve de token valide.
      const session = await loadSession();
      const token = session ? await getValidAccessToken() : null;

      if (session && !token) {
        await clearSession();
      }

      if (!cancelled) {
        setTarget(token ? '/home' : '/login');
      }
    })();

    return () => {
      cancelled = true;
    };
  }, []);

  if (!target) {
    // Chargement : écran pénétré, sobre (ni page blanche ni contenu à demi chargé).
    return (
      <View style={styles.loader} testID="startup-loader">
        <ActivityIndicator color={COLORS.TINT} size="large" />
      </View>
    );
  }

  return <Redirect href={{ pathname: target as '/login' | '/home', params: {} }} />;
}

const styles = StyleSheet.create({
  loader: {
    flex: 1,
    backgroundColor: COLORS.PRIMARY,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
