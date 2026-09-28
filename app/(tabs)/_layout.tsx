import * as React from 'react';
import { View } from 'react-native';
import { Redirect, Tabs } from 'expo-router';

import { MiniPlayer } from '@components';
import { BottomTabBar } from '@navigators';
import { useUserData } from '@context';

/**
 * Onglets — CONNEXION SPOTIFY OBLIGATOIRE. Pendant la restauration de la
 * session (ou l'overlay de login), un écran sombre neutre masque le contenu ;
 * un utilisateur non connecté est redirigé vers l'écran de connexion.
 */
export default function Layout() {
  const { sessionStatus } = useUserData();

  if (sessionStatus === 'loading') {
    return <View style={{ flex: 1, backgroundColor: '#121212' }} />;
  }

  if (sessionStatus !== 'spotify') {
    // Aucun accès à l'application sans compte connecté.
    return <Redirect href={{ pathname: '/login', params: {} }} />;
  }

  return (
    <Tabs
      tabBar={(props) => (
        <View>
          {/* Playback bar (Audius audio), renders nothing when idle. */}
          <MiniPlayer />
          <BottomTabBar {...props} />
        </View>
      )}
    >
      <Tabs.Screen name="home" options={{ headerShown: false }} />
      <Tabs.Screen name="search" options={{ headerShown: false }} />
      <Tabs.Screen name="library" options={{ headerShown: false }} />
    </Tabs>
  );
}
