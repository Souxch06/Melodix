import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { Redirect, Tabs } from 'expo-router';

import { ErrorCard, MiniPlayer } from '@components';
import { BottomTabBar } from '@navigators';
import { describeSpotifyVerificationFailure, useUserData } from '@context';
import { useKeyboardVisible } from '@hooks';
import { translations } from '@data';

/**
 * Onglets — CONNEXION SPOTIFY OBLIGATOIRE.
 *
 * Trois cas distincts, pour ne JAMAIS confondre « pas de session » et
 * « session présente, identité pas encore connue » :
 * - 'loading' (aucune session lue, ou session trouvée mais profil pas encore
 *   vérifié) → écran sombre neutre, aucune navigation ;
 * - 'spotify-unverified' (session stockée, profil indisponible) → état
 *   explicite + réessai + cause SÛRE affichée (diagnostic) : l'application
 *   n'ouvre pas ses onglets avec une identité inconnue, mais ne renvoie PAS
 *   vers la connexion (la session existe encore — ce serait perdre
 *   l'utilisateur) ;
 * - 'spotify-verifying' (réessai en cours) → écran de chargement neutre :
 *   changement visible (l'écran d'erreur disparaît) et le bouton « Réessayer
 *   » n'existe plus → aucun double clic possible ;
 * - 'local' (vraiment aucun compte) → redirection vers la connexion.
 */
export default function Layout() {
  const { sessionStatus, reloadUserData, verificationFailure } = useUserData();
  /**
   * BUG CLAVIER — la barre d'onglets et le mini-lecteur sont MASQUÉS tant que
   * le clavier logiciel est ouvert.
   *
   * Symptôme d'origine : ouvrir la recherche faisait monter la barre de
   * navigation AVEC le clavier, qui recouvrait alors les résultats.
   *
   * La correction est structurelle et ne masque rien d'autre :
   *  - `softwareKeyboardLayoutMode: 'resize'` (app.config.js) redimensionne la
   *    fenêtre, donc l'écran de recherche récupère toute la hauteur restante ;
   *  - en rendant `tabBar = null`, la barre ne peut ni recouvrir les résultats
   *    ni flotter au-dessus du clavier. Le masquage de la navigation basse
   *    pendant une recherche plein écran est explicitement autorisé par la
   *    spécification (« acceptable si c'est le plus propre ») ;
   *  - le mini-lecteur disparaît avec elle : pas de barre de lecture posée sur
   *    le clavier, et la lecture en cours CONTINUE (le moteur audio est
   *    indépendant de l'affichage — aucune régression de lecture).
   *
   * Aucun `position: absolute`, aucune marge codée en dur : la géométrie vient
   * du système.
   */
  const keyboardVisible = useKeyboardVisible();

  if (sessionStatus === 'loading' || sessionStatus === 'spotify-verifying') {
    // Démarrage OU réessai en cours : écran neutre (aucune navigation,
    // aucun bouton — pendant un réessai, l'erreur n'est plus affichée).
    return <View style={{ flex: 1, backgroundColor: '#121212' }} />;
  }

  if (sessionStatus === 'spotify-unverified') {
    // Cause SÛRE du dernier échec (réseau, 401, 429, 5xx, réponse invalide)
    // — jamais de token ni de valeur technique brute.
    const detail = describeSpotifyVerificationFailure(
      translations,
      verificationFailure
    );
    return (
      <View style={styles.identityError} testID="session-identity-unavailable">
        <ErrorCard
          testID="session-identity-error"
          retryTestID="session-identity-retry"
          icon="person-circle-outline"
          title={translations.spotifyRestoreUnavailableTitle}
          body={
            detail
              ? `${translations.spotifyRestoreUnavailableBody}\n\n${detail}`
              : translations.spotifyRestoreUnavailableBody
          }
          onRetry={() => void reloadUserData()}
        />
      </View>
    );
  }

  if (sessionStatus !== 'spotify') {
    // Aucun accès à l'application sans compte connecté.
    return <Redirect href={{ pathname: '/login', params: {} }} />;
  }

  return (
    <Tabs
      tabBar={(props) =>
        keyboardVisible ? null : (
          <View>
            {/* Playback bar (Audius audio), renders nothing when idle. */}
            <MiniPlayer />
            <BottomTabBar {...props} />
          </View>
        )
      }
    >
      <Tabs.Screen name="home" options={{ headerShown: false }} />
      <Tabs.Screen name="search" options={{ headerShown: false }} />
      <Tabs.Screen name="library" options={{ headerShown: false }} />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  identityError: {
    backgroundColor: '#121212',
    flex: 1,
    justifyContent: 'center',
  },
});
