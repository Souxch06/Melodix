import * as React from 'react';
import { useRouter } from 'expo-router';
import { Preview } from '@components';

import { PlaylistModel, TrackModel } from '@models';
import { checkSavedTracks, getPlaylist, getPlaylistItems } from '@api';
import { toggleSavedTrack, SpotifyApiError } from '@services';
import { useUserData } from '@context';

export type AlbumScreenPropsType = {
  playlistId: string;
};

export const PlaylistScreen = ({ playlistId }: AlbumScreenPropsType) => {
  const router = useRouter();
  const { sessionStatus } = useUserData();
  const [playlist, setPlaylist] = React.useState<PlaylistModel | null>(null);
  const [tracks, setTracks] = React.useState<TrackModel[]>([]);
  const [offset, setOffset] = React.useState(0);
  const [limit] = React.useState(50);

  const isFetchingRef = React.useRef(false);

  // Session Spotify morte au milieu de la consultation : écran de connexion.
  const handleSessionDeath = React.useCallback(
    (error: unknown): boolean => {
      if (error instanceof SpotifyApiError && error.kind === 'unauthenticated') {
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
    if (!playlistId || !playlist || isFetchingRef.current) {
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
        console.error('Failed to get playlist data:', error);
      }
    })();
  }, [playlistId, handleSessionDeath]);

  // Load the first page as soon as the playlist metadata is available.
  React.useEffect(() => {
    fetchTracks();

    //eslint-disable-next-line
  }, [playlist]);

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
        artists: track.subtitle ? track.subtitle.split(', ') : [],
      });
      setTracks((prevTracks) =>
        prevTracks.map((item) =>
          item.id === track.id ? { ...item, isSaved: nowSaved } : item
        )
      );
    },
    []
  );

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
      tracks={tracks}
      fetchTracks={fetchTracks}
      onToggleTrackSaved={handleToggleTrackSaved}
    />
  );
};
