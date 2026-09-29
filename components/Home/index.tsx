import * as React from 'react';
import { ScrollView } from 'react-native-gesture-handler';

import { Greeting } from './Greeting';
import { YourPlaylists } from './YourPlaylists';
import { RecentlyPlayed } from './RecentlyPlayed';
import { FeaturedPlaylists } from './FeaturedPlaylists';
import { TopAlbums } from './TopAlbums';
import { TopArtists } from './TopArtists';
import { EmptySection } from '../EmptySection';
import { BOTTOM_NAVIGATION_HEIGHT, COLORS, HEADER_HEIGHT } from '@config';
import { View } from 'react-native';
import { useApplicationDimensions } from '@hooks';

/**
 * Accueil — ordre demandé :
 *   salutation personnalisée (données réelles du profil Spotify)
 *   → Tes playlists (compte connecté)
 *   → Récemment écouté (historique Spotify réel)
 *   → Pour toi (playlists proposées par l'API — données réelles, masquée
 *     si Spotify ne sert rien)
 *   → Tes albums/artistes du moment (top items Spotify réels).
 * Toutes les sections se masquent proprement quand leur source ne répond
 * pas ; les états vides/erreur des playlists restent explicites.
 */
export const Home = () => {
  const { height } = useApplicationDimensions();
  return (
    <View
      style={{
        backgroundColor: COLORS.PRIMARY,
        height: height - BOTTOM_NAVIGATION_HEIGHT - HEADER_HEIGHT,
      }}
    >
      <ScrollView style={{ paddingVertical: 16 }}>
        <Greeting />
        <YourPlaylists />
        <RecentlyPlayed />
        <FeaturedPlaylists />
        <TopAlbums />
        <TopArtists />
        <EmptySection />
      </ScrollView>
    </View>
  );
};
