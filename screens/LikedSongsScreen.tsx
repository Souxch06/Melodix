import * as React from 'react';
import { ActivityIndicator, StyleSheet, Text, View } from 'react-native';

import { Preview } from '@components';
import { ErrorCard } from '@components';
import { APP_BACKGROUND_COLOR, COLORS } from '@config';
import { translations } from '@data';
import { getSpotifySavedTracks } from '@api';

import type { TrackModel } from '@models';

/** Plafond de chargement : pagination Spotify bornée (voir api/spotify). */
const MAX_LIKED_SONGS = 200;

/**
 * Écran « Titres aimés » — la VRAIE bibliothèque du compte Spotify
 * (GET /v1/me/tracks, paginé).
 *
 * Distinct des favoris LOCALS (screens/FavoritesScreen.tsx) : ceux-ci
 * restent sur l'appareil et fonctionnent hors compte. Aucun des deux n'est
 * présenté comme l'autre — l'écran dit explicitement d'où viennent les
 * morceaux, et la lecture emprunte exactement le même chemin que les
 * playlists (Preview construit la file PlayerTrack, le matcher Audius →
 * YouTube résout chaque ligne).
 *
 * États couverts, jamais d'écran blanc :
 *   chargement → spinner + libellé ;
 *   erreur     → carte explicite + « Réessayer » ;
 *   vide       → carte d'accueil (Spotify n'a aucun like) ;
 *   troncature → mention honnête du plafond atteint.
 */
export const LikedSongsScreen = () => {
  const [tracks, setTracks] = React.useState<TrackModel[] | null>(null);
  const [loadError, setLoadError] = React.useState(false);
  const [retrySeed, setRetrySeed] = React.useState(0);

  React.useEffect(() => {
    let disposed = false;

    (async () => {
      setLoadError(false);

      try {
        const liked = await getSpotifySavedTracks(MAX_LIKED_SONGS);

        if (!disposed) {
          setTracks(liked);
        }
      } catch (error) {
        console.error('Chargement des titres aimés impossible', error);

        if (!disposed) {
          setTracks(null);
          setLoadError(true);
        }
      }
    })();

    return () => {
      disposed = true;
    };
  }, [retrySeed]);

  if (loadError) {
    return (
      <View style={styles.container} testID="liked-songs-error">
        <ErrorCard
          title={translations.likedSongsErrorTitle}
          body={translations.likedSongsErrorBody}
          onRetry={() => setRetrySeed((seed) => seed + 1)}
        />
      </View>
    );
  }

  if (!tracks) {
    return (
      <View style={styles.container} testID="liked-songs-loading">
        <ActivityIndicator color={COLORS.TINT} size="large" />
        <Text style={styles.message}>{translations.likedSongsLoading}</Text>
      </View>
    );
  }

  if (tracks.length === 0) {
    return (
      <View style={styles.container} testID="liked-songs-empty">
        <Text style={styles.emptyTitle}>
          {translations.likedSongsEmptyTitle}
        </Text>
        <Text style={styles.message}>{translations.likedSongsEmptyBody}</Text>
      </View>
    );
  }

  return (
    <View style={styles.container} testID="liked-songs-content">
      <Preview
        type="playlist"
        id="liked-songs"
        imageURL={tracks[0]?.imageURL ?? ''}
        headerTitle={translations.likedSongsTitle}
        summaryTitle={translations.likedSongsTitle}
        summarySubtitle={translations.likedSongsSubtitle(tracks.length)}
        summaryInfo=""
        tracks={tracks}
        artists={null}
      />

      {tracks.length >= MAX_LIKED_SONGS ? (
        <Text style={styles.truncated} testID="liked-songs-truncated">
          {translations.likedSongsTruncated(tracks.length)}
        </Text>
      ) : null}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: APP_BACKGROUND_COLOR,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 24,
  },
  message: {
    color: COLORS.GREY,
    fontSize: 14,
    textAlign: 'center',
    marginTop: 12,
  },
  emptyTitle: {
    color: COLORS.WHITE,
    fontSize: 18,
    fontWeight: '600',
    textAlign: 'center',
  },
  truncated: {
    color: COLORS.GREY,
    fontSize: 12,
    textAlign: 'center',
    paddingHorizontal: 24,
    paddingBottom: 16,
  },
});
