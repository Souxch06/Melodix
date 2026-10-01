import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import Ionicons from '@expo/vector-icons/Ionicons';

import { getSavedPlaylists } from '@api';
import { LibraryItemModel } from '@models';
import { useUserData } from '@context';
import { COLORS, Shapes, Sizes } from '@config';
import { translations } from '@data';

import { Slider } from '../../Slider';

/** Phase du fetch playlists Spotify : skeleton → données / vide / erreur. */
type FetchPhase = 'loading' | 'ready' | 'error';

/** Placeholders gris affichés pendant le chargement (skeleton). */
const SKELETON_SLIDES: LibraryItemModel[] = Array(3).fill({
  id: '',
  type: 'playlist',
  title: '',
  imageURL: '',
  subtitle: '',
});

/**
 * « Tes playlists » — les playlists Spotify RÉELLES du compte connecté,
 * en cartes horizontales (pochette, nom, sous-titre) via le Slider existant.
 *
 * États explicites demandés par la mission UI :
 * - chargement  → skeleton (cartes grises du Slider) ;
 * - erreur      → « Impossible de charger tes données Spotify. » + « Réessayer » ;
 * - aucune playlist → « Aucune playlist pour le moment » + bouton « Actualiser ».
 */
export const YourPlaylists = () => {
  const { userData } = useUserData();
  const [phase, setPhase] = React.useState<FetchPhase>('loading');
  const [savedPlaylists, setSavedPlaylists] = React.useState<
    LibraryItemModel[] | null
  >(SKELETON_SLIDES);
  const [refreshSeed, setRefreshSeed] = React.useState(0);

  React.useEffect(() => {
    let isMounted = true;

    (async () => {
      try {
        const playlistsData = await getSavedPlaylists();
        if (isMounted) {
          setSavedPlaylists(playlistsData);
          setPhase('ready');
        }
      } catch (error) {
        if (isMounted) {
          setSavedPlaylists(null);
          setPhase('error');
        }
        console.error(error);
      }
    })();

    return () => {
      isMounted = false;
    };
  }, [refreshSeed]);

  const userPlaylists = React.useMemo(
    () =>
      !userData || !savedPlaylists
        ? null
        : savedPlaylists.filter((playlist) => playlist.ownerId === userData.id),
    [userData, savedPlaylists]
  );

  const handleRefreshPress = React.useCallback(() => {
    setSavedPlaylists(SKELETON_SLIDES);
    setPhase('loading');
    setRefreshSeed((seed) => seed + 1);
  }, []);

  if (phase === 'error') {
    return (
      <View style={styles.noticeCard} testID="home-playlists-error">
        <Ionicons color={COLORS.RED} name="cloud-offline-outline" size={26} />
        <Text style={styles.noticeTitle}>
          {translations.homeLoadErrorTitle}
        </Text>
        <Pressable
          accessibilityRole="button"
          onPress={handleRefreshPress}
          style={({ pressed }) => [
            styles.retryButton,
            pressed && styles.retryButtonPressed,
          ]}
          testID="home-playlists-retry"
        >
          <Text style={styles.retryButtonText}>{translations.homeRetry}</Text>
        </Pressable>
      </View>
    );
  }

  if (phase === 'ready' && !userPlaylists?.length) {
    return (
      <View style={styles.noticeCard} testID="home-playlists-empty">
        <Ionicons
          color={COLORS.LIGHT_GREY}
          name="musical-notes-outline"
          size={26}
        />
        <Text style={styles.noticeTitle}>
          {translations.homePlaylistsEmptyTitle}
        </Text>
        <Text style={styles.noticeBody}>
          {translations.homePlaylistsEmptyBody}
        </Text>
        <Pressable
          accessibilityRole="button"
          onPress={handleRefreshPress}
          style={({ pressed }) => [
            styles.retryButton,
            pressed && styles.retryButtonPressed,
          ]}
          testID="home-playlists-refresh"
        >
          <Text style={styles.retryButtonText}>{translations.homeRefresh}</Text>
        </Pressable>
      </View>
    );
  }

  return (
    <Slider
      title={translations.homeYourPlaylists}
      slides={phase === 'loading' ? SKELETON_SLIDES : (userPlaylists ?? [])}
      size={Sizes.MEDIUM}
      shape={Shapes.SQUARE_BORDER}
      withShowAll={true}
    />
  );
};

const styles = StyleSheet.create({
  noticeCard: {
    alignItems: 'center',
    backgroundColor: '#1A1A1A',
    borderColor: '#2A2A2A',
    borderRadius: 16,
    borderWidth: StyleSheet.hairlineWidth,
    marginHorizontal: 16,
    marginBottom: 24,
    paddingHorizontal: 24,
    paddingVertical: 26,
  },
  noticeTitle: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 15,
    marginTop: 12,
    textAlign: 'center',
  },
  noticeBody: {
    color: COLORS.LIGHT_GREY,
    fontFamily: 'SF-Regular',
    fontSize: 13,
    lineHeight: 19,
    marginTop: 6,
    textAlign: 'center',
  },
  retryButton: {
    backgroundColor: COLORS.TINT,
    borderRadius: 999,
    marginTop: 16,
    paddingHorizontal: 28,
    paddingVertical: 10,
    alignItems: 'center',
    alignSelf: 'center',
  },
  retryButtonPressed: {
    opacity: 0.85,
    transform: [{ scale: 0.98 }],
  },
  retryButtonText: {
    color: COLORS.BLACK,
    fontFamily: 'SF-Semibold',
    fontSize: 14,
  },
});
