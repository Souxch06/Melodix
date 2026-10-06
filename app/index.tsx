import * as React from 'react';
import { ActivityIndicator, StyleSheet, View } from 'react-native';
import { Redirect } from 'expo-router';

import { COLORS } from '@config';
import {
  clearSession,
  resolveStartupSession,
  runAccountlessMigration,
} from '@services';

/**
 * Point d'entrée — protection du démarrage :
 *
 *   chargement → vérification de session (avec REFRESH SILENCIEUX si le
 *   token d'accès a expiré), classifiée par CAUSE d'échec :
 *     token valide                    → accueil
 *     aucune session                  → écran de connexion
 *     session MORTES (refresh refusé
 *     par Spotify / absent)           → session supprimée → connexion
 *     refresh IMPOSSIBLE par le RÉSEAU
 *     (coupure, 5xx, 429)             → session CONSERVÉE → connexion
 *                                       (retentée au prochain démarrage :
 *                                       plus jamais de session saine jetée
 *                                       à cause d'un coup de filet WiFi)
 *
 * Une session non vérifiée n'envoie JAMAIS l'utilisateur vers l'accueil.
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

      const resolution = await resolveStartupSession();

      switch (resolution.kind) {
        case 'valid':
          if (!cancelled) setTarget('/home');
          return;
        case 'no-session':
          if (!cancelled) setTarget('/login');
          return;
        case 'session-dead':
          // Spotify a DÉFINITIVEMENT rejeté cette session (refresh token
          // mort ou absent) : nettoyage complet, jamais d'accueil.
          await clearSession();
          if (!cancelled) setTarget('/login');
          return;
        case 'session-kept-unverified':
        default:
          // Échec TRANSITOIRE (réseau) : la session est conservée telle
          // quelle — le prochain démarrage ou la prochaine lecture du token
          // retentera le refresh et ramènera l'utilisateur automatiquement.
          if (!cancelled) setTarget('/login');
          return;
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

  return (
    <Redirect href={{ pathname: target as '/login' | '/home', params: {} }} />
  );
}

const styles = StyleSheet.create({
  loader: {
    flex: 1,
    backgroundColor: COLORS.PRIMARY,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
