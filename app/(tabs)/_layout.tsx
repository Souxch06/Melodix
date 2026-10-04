import * as React from 'react';
import { View } from 'react-native';
import { Redirect, Tabs } from 'expo-router';

import { MiniPlayer } from '@components';
import { BottomTabBar } from '@navigators';
import { useUserData } from '@context';
import { useKeyboardVisible } from '@hooks';

/**
 * Onglets — CONNEXION SPOTIFY OBLIGATOIRE. Pendant la restauration de la
 * session (ou l'overlay de login), un écran sombre neutre masque le contenu ;
 * un utilisateur non connecté est redirigé vers l'écran de connexion.
 */
export default function Layout() {
  const { sessionStatus } = useUserData();
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

  if (sessionStatus === 'loading') {
    return <View style={{ flex: 1, backgroundColor: '#121212' }} />;
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
