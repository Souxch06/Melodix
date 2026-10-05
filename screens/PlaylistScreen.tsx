import * as React from 'react';
import { ActivityIndicator, Alert, StyleSheet, View } from 'react-native';
import { useRouter } from 'expo-router';
import { ErrorCard, Preview } from '@components';

import { artistsFromSubtitle, PlaylistModel, TrackModel } from '@models';
import { checkSavedTracks, getPlaylist, getPlaylistItems } from '@api';
import { toggleSavedTrack, SpotifyApiError } from '@services';
import { useUserData } from '@context';
import { APP_BACKGROUND_COLOR, PALETTE } from '@config';
import { usePlaylistResolutions } from '@hooks';
import { translations } from '@data';

export type AlbumScreenPropsType = {
  playlistId: string;
};

const styles = StyleSheet.create({
  loading: {
    alignItems: 'center',
    backgroundColor: APP_BACKGROUND_COLOR,
    flex: 1,
    justifyContent: 'center',
  },
});

export const PlaylistScreen = ({ playlistId }: AlbumScreenPropsType) => {
  const router = useRouter();
  const { sessionStatus } = useUserData();
  const [playlist, setPlaylist] = React.useState<PlaylistModel | null>(null);
  const [tracks, setTracks] = React.useState<TrackModel[]>([]);
  const [offset, setOffset] = React.useState(0);
  const [limit] = React.useState(50);
  // M-5 : échec réseau du chargement initial (playlist ou 1re page) → carte
  // d'erreur VISIBLE + retry — avant, l'écran restait blanc sans possibilité
  // de relancer (seule la session morte renvoyait vers le login).
  const [loadError, setLoadError] = React.useState(false);
  const [retrySeed, setRetrySeed] = React.useState(0);

  const isFetchingRef = React.useRef(false);

  // Session Spotify morte au milieu de la consultation : écran de connexion.
  const handleSessionDeath = React.useCallback(
    (error: unknown): boolean => {
      if (
        error instanceof SpotifyApiError &&
        error.kind === 'unauthenticated'
      ) {
        if (sessionStatus === 'spotify') {
          router.replace({ pathname: '/login', params: {} });
        }
        return true;
      }
      return false;
    },
    [router, sessionStatus]
  );

  const fetchTracks = async () => {
    if (!playlistId || !playlist || isFetchingRef.current || loadError) {
      return;
    }

    const { total } = playlist.tracks;

    if (total - offset <= 0) {
      return;
    }

    isFetchingRef.current = true;

    try {
      const newTracks = await getPlaylistItems({
        playlistId,
        limit,
        offset,
      });
      const trackIds = newTracks.map((track) => track.id);
      // Not critical: never let this check hide the tracks.
      const savedPlaylistTracksArr = await checkSavedTracks(trackIds).catch(
        (error) => {
          console.error('Failed to check saved tracks:', error);
          return trackIds.map(() => false);
        }
      );

      setTracks((prevTracks) => [
        ...prevTracks,
        ...newTracks.map((item, i) => ({
          ...item,
          isSaved: savedPlaylistTracksArr[i],
        })),
      ]);
      setOffset((prevOffset) => prevOffset + limit);
    } catch (error) {
      // Session Spotify morte en cours de consultation : retour propre au
      // login (la reconnexion seule regénère un token ; pas de page blanche).
      if (handleSessionDeath(error)) {
        return;
      }
      // M-5 : si la 1re page ne s'est pas affichée (rien à l'écran), erreur
      // visible + retry. Sinon la liste partielle reste ; l'offset n'avance
      // pas → le prochain défilement retente implicitement la page.
      if (offset === 0 && tracks.length === 0) {
        setLoadError(true);
      }
      console.error(error);
    } finally {
      isFetchingRef.current = false;
    }
  };

  React.useEffect(() => {
    if (!playlistId) {
      return;
    }

    (async () => {
      try {
        const playlistData = await getPlaylist(playlistId);

        setPlaylist(playlistData);
      } catch (error) {
        if (handleSessionDeath(error)) {
          return;
        }
        setPlaylist(null);
        setLoadError(true); // M-5 : erreur visible + retry (plus d'écran blanc)
        console.error('Failed to get playlist data:', error);
      }
    })();
    // Déclencheurs RÉELS uniquement : playlistId / retry explicite.
    // handleSessionDeath est un utilitaire STABLE en production mais pas en
    // test (router re-créé) — mis en dépendance il relançait le fetch à
    // chaque rendu (M-5 : requêtes en double en cas de re-render).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [playlistId, retrySeed]);

  // M-5 : « Réessayer » — réinitialise et relance le chaînage complet
  // (getPlaylist → getPlaylistItems) ; jamais de stack trace à l'utilisateur.
  const handleRetry = React.useCallback(() => {
    setLoadError(false);
    setTracks([]);
    setOffset(0);
    setRetrySeed((seed) => seed + 1);
  }, []);

  // Load the first page as soon as the playlist metadata is available —
  // et TOUT retry explicite : getPlaylist peut résoudre un objet identique
  // (cache) → sans retrySeed, le chargement des titres ne repartait pas.
  React.useEffect(() => {
    fetchTracks();

    //eslint-disable-next-line
  }, [playlist, retrySeed]);

  const id = React.useMemo(() => (playlist ? playlist.id : ''), [playlist]);
  const ownerId = React.useMemo(
    () => (playlist ? playlist.ownerId : ''),
    [playlist]
  );
  const title = React.useMemo(
    () => (playlist ? playlist.title : ''),
    [playlist]
  );
  const subtitle = React.useMemo(
    () => (playlist ? playlist.subtitle : ''),
    [playlist]
  );
  const info = React.useMemo(() => (playlist ? playlist.info : ''), [playlist]);
  const imageURL = React.useMemo(
    () => (playlist ? playlist.imageURL : ''),
    [playlist]
  );
  // @API_RATE
  // const recommendationSeed = React.useMemo(
  //   () =>
  //     tracks
  //       .slice(0, 5)
  //       .map(({ id }) => id)
  //       .join(','),
  //   [tracks]
  // );

  // Favori LOCAL de la ligne : persistance immédiate (aucun compte), UI à
  // jour en fonction du résultat (réversible).
  const handleToggleTrackSaved = React.useCallback(
    async (track: TrackModel) => {
      const nowSaved = await toggleSavedTrack(track, {
        artists: artistsFromSubtitle(track.subtitle),
      });
      setTracks((prevTracks) =>
        prevTracks.map((item) =>
          item.id === track.id ? { ...item, isSaved: nowSaved } : item
        )
      );
    },
    []
  );

  // Résolution progressive Audius → YouTube (≤ 5 simultanées, cache partagé).
  const resolutions = usePlaylistResolutions(tracks);

  const availabilityById = React.useMemo(() => {
    const map: Record<
      string,
      'audius' | 'youtube' | 'none' | 'pending' | 'resolving'
    > = {};

    for (const track of tracks) {
      const entry = resolutions.byTrackId[track.id];
      map[track.id] =
        entry?.status === 'resolved'
          ? entry.providerId
          : entry?.status === 'none'
            ? 'none'
            : (entry?.status ?? 'pending');
    }

    return map;
  }, [tracks, resolutions.byTrackId]);

  const summaryAvailability = React.useMemo(() => {
    const { available, total } = resolutions.stats;
    return total > 0
      ? translations.playlistAvailabilityInfo(available, total)
      : '';
  }, [resolutions.stats]);

  const summaryDescription = React.useMemo(
    () => (playlist ? (playlist.description ?? '') : ''),
    [playlist]
  );

  // Tap sur un morceau indisponible : message précis, JAMAIS de crash, la
  // ligne reste affichée (elle appartient à la playlist Spotify).
  const handleUnavailableTrackPress = React.useCallback((track: TrackModel) => {
    Alert.alert(track.title, translations.trackUnavailableNotice, [
      { text: 'OK' },
    ]);
  }, []);

  // M-5 : carte d'erreur à l'écran (composant partagé) — état erreur
  // EXPLICITE + retry, jamais de stack trace utilisateur.
  // Chargement initial : la playlist n'est pas encore connue ET aucune erreur
  // n'est survenue → indicateur explicite (jamais un écran blanc).
  if (!playlist && !loadError) {
    return (
      <View style={styles.loading} testID="playlist-loading">
        <ActivityIndicator color={PALETTE.accent} size="large" />
      </View>
    );
  }

  if (loadError) {
    return (
      <ErrorCard
        testID="playlist-load-error"
        retryTestID="playlist-load-retry"
        onRetry={handleRetry}
      />
    );
  }

  return (
    <Preview
      type="playlist"
      id={id}
      ownerId={ownerId}
      imageURL={imageURL}
      headerTitle={title}
      summaryTitle={title}
      summarySubtitle={subtitle}
      summaryInfo={info}
      summaryDescription={summaryDescription}
      summaryAvailability={summaryAvailability}
      availabilityById={availabilityById}
      onUnavailableTrackPress={handleUnavailableTrackPress}
      tracks={tracks}
      fetchTracks={fetchTracks}
      onToggleTrackSaved={handleToggleTrackSaved}
    />
  );
};
