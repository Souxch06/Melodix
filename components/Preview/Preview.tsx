import * as React from 'react';
import { View } from 'react-native';

import { ArtistModel, TrackModel } from '@models';
import { useApplicationDimensions } from '@hooks';
import Animated, {
  useAnimatedScrollHandler,
  useSharedValue,
} from 'react-native-reanimated';

import { CommonHeader } from './CommonHeader';
import { Cover } from './Cover';
import { Summary } from './Summary';
import { Track } from './Track';
import { QueueActionMenu } from '../Player/QueueActionMenu';
import { Info } from './Info';
import { Artists } from './Artists';
import { MoreOf } from './MoreOf';
import { Copyrights } from './Copyrights';
import { Recommendations } from '../Recommendations';
import { EmptySection } from '../EmptySection';

import { BOTTOM_NAVIGATION_HEIGHT } from '@config';

import { styles } from './styles';
import { usePlayer, useUserData } from '@context';
import { queueIdForTrackId, sourceForTrackId } from '@services';
import type { PlayerTrack } from '@services';

// Height of the mini player shown above the tab bar while playing.
const MINI_PLAYER_ALLOWANCE = 58;

// Les lignes « audius:<id> » (tendances, playlists Audius) sont natives du
// fournisseur audio : lecture directe, sans matching (helpers partagés dans
// services/player.ts). Toutes les autres métadonnées passent par le matcher.
const queueIdOf = queueIdForTrackId;
const sourceOfTrackId = sourceForTrackId;

export type PreviewPropsType = {
  type: 'playlist' | 'album';
  id: string;
  ownerId?: string;
  imageURL: string;
  headerTitle: string;
  summaryTitle: string;
  summarySubtitle: string;
  summaryInfo: string;
  /** Description Spotify de la playlist (sous-titre d'en-tête). */
  summaryDescription?: string;
  /** Statistique dynamique « 85/100 morceaux disponibles ». */
  summaryAvailability?: string;
  /** État de résolution par track.id (badge discret de ligne). */
  availabilityById?: Record<
    string,
    'audius' | 'youtube' | 'none' | 'pending' | 'resolving'
  >;
  /** Tap sur une ligne indisponible → message clair, jamais de crash. */
  onUnavailableTrackPress?: (track: TrackModel) => void;
  infoTexts?: string[];
  copyrightTexts?: string[];
  tracks?: TrackModel[];
  fetchTracks?: () => void;
  artists?: ArtistModel[] | null;
  recommendationsType?: 'tracks' | 'artists';
  recommendationsSeed?: string;
  /** Bascule le favori local d'une ligne (fourni par l'écran hôte). */
  onToggleTrackSaved?: (track: TrackModel) => void;
};

export const Preview = ({
  type,
  id,
  ownerId,
  imageURL,
  headerTitle,
  summaryTitle,
  summarySubtitle,
  summaryInfo,
  summaryDescription,
  summaryAvailability,
  availabilityById,
  onUnavailableTrackPress,
  infoTexts,
  copyrightTexts,
  tracks,
  fetchTracks,
  artists,
  recommendationsSeed,
  onToggleTrackSaved,
}: PreviewPropsType) => {
  const { userData } = useUserData();
  const player = usePlayer();
  const { width, height } = useApplicationDimensions();
  const scrollOffset = useSharedValue(0);

  const scrollHandler = useAnimatedScrollHandler({
    onScroll: (event) => {
      scrollOffset.value = event.contentOffset.y;
    },
  });

  // Rows are playable everywhere: Spotify metadata is matched to an Audius
  // stream at play time (services/audio), the user never picks a provider.
  // I-2 : album + durée de la source voyagent jusqu'au matcher — mêmes
  // métadonnées ici que dans le badge de disponibilité (usePlaylistResolutions).
  const playableQueue = React.useMemo<PlayerTrack[]>(
    () =>
      (tracks ?? [])
        .filter((track) => Boolean(track.id))
        .map((track) => ({
          id: queueIdOf(track.id),
          title: track.title,
          artists: track.subtitle
            ? track.subtitle.split(', ').filter(Boolean)
            : [],
          album: track.albumName ?? (type === 'album' ? summaryTitle : null),
          durationMillis: track.durationMs ?? null,
          imageURL: track.imageURL ?? '',
          source: sourceOfTrackId(track.id),
        })),
    [tracks, type, summaryTitle]
  );

  const handleTrackPress = React.useCallback(
    (trackId: string) => {
      const queueId = queueIdOf(trackId);

      // Tapping the current track toggles play/pause like the mini player.
      if (player.current?.id === queueId) {
        void player.togglePlayPause();
        return;
      }

      const startIndex = playableQueue.findIndex(({ id }) => id === queueId);

      if (startIndex >= 0) {
        void player.playQueue(playableQueue, startIndex);
      }
    },
    [player, playableQueue]
  );

  // Menu d'actions « ⋯ » de la ligne : un seul état, un seul composant
  // réutilisable (jamais de menu dupliqué par écran).
  const [actionTrack, setActionTrack] = React.useState<PlayerTrack | null>(
    null
  );

  const openActions = React.useCallback(
    (item: TrackModel) => {
      if (!item.id) {
        return;
      }

      setActionTrack({
        id: queueIdForTrackId(item.id),
        title: item.title,
        artists: item.subtitle ? item.subtitle.split(', ').filter(Boolean) : [],
        album: item.albumName ?? (type === 'album' ? summaryTitle : null),
        durationMillis: item.durationMs ?? null,
        imageURL: item.imageURL ?? '',
        source: sourceForTrackId(item.id),
      });
    },
    [type, summaryTitle]
  );

  // Déstructuré pour des dépendances de hook explicites et stables.
  const playerCurrentId = player.current?.id;
  const playerStatus = player.status;

  const renderItem = React.useCallback(
    ({ item, index }: { item: TrackModel; index: number }) => {
      const queueId = queueIdOf(item.id);
      const availability = availabilityById?.[item.id];
      // Indisponible : la LIGNE RESTE (jamais masquée) ; le tap informe au
      // lieu de lire. Optimiste : en gate UI, la cascade a déjà tranché.
      const handlePress = !item.id
        ? undefined
        : availability === 'none'
          ? () => onUnavailableTrackPress?.(item)
          : () => handleTrackPress(item.id);

      return (
        <Track
          type={type}
          key={index}
          title={item.title}
          subtitle={item.subtitle}
          imageURL={item.imageURL}
          isDownloaded={!!item.isDownloaded}
          isSaved={!!item.isSaved}
          isPlaying={playerCurrentId === queueId && playerStatus === 'playing'}
          explicit={!!item.explicit}
          forceDisableSaveIcon={!!(ownerId && ownerId === userData.id)}
          availability={availability}
          onPress={handlePress}
          onToggleSaved={
            item.id && onToggleTrackSaved
              ? () => onToggleTrackSaved(item)
              : undefined
          }
          onActionsPress={() => openActions(item)}
        />
      );
    },
    [
      type,
      ownerId,
      userData.id,
      playerCurrentId,
      playerStatus,
      handleTrackPress,
      onToggleTrackSaved,
      availabilityById,
      onUnavailableTrackPress,
      openActions,
    ]
  );

  return (
    <View style={[styles.container, { width }]}>
      <QueueActionMenu
        onClose={() => setActionTrack(null)}
        track={actionTrack}
        visible={Boolean(actionTrack)}
      />
      <CommonHeader
        type={type}
        title={headerTitle}
        imageURL={imageURL}
        animatedValue={scrollOffset}
      />
      <Animated.FlatList
        contentContainerStyle={[
          styles.flatListContentContainer,
          // Keep the last rows out from under the mini player.
          player.hasActiveSession && { paddingBottom: MINI_PLAYER_ALLOWANCE },
        ]}
        style={{
          height: height - BOTTOM_NAVIGATION_HEIGHT,
        }}
        data={tracks}
        keyExtractor={({ id }, index) => id + index}
        renderItem={renderItem}
        disableScrollViewPanResponder
        {...(fetchTracks && {
          onStartReached: fetchTracks,
          onStartReachedThreshold: 1,
        })}
        scrollEventThrottle={16}
        onScroll={scrollHandler}
        ListHeaderComponent={
          <>
            <Cover
              type={type}
              imageURL={imageURL}
              animatedValue={scrollOffset}
            />
            <Summary
              id={id}
              type={type}
              title={summaryTitle}
              subtitle={summarySubtitle}
              info={summaryInfo}
              description={summaryDescription}
              availabilityInfo={summaryAvailability}
              imageURL={imageURL}
              forceDisableSaveIcon={!!(ownerId && ownerId === userData.id)}
            />
          </>
        }
        ListFooterComponent={
          <>
            {infoTexts && <Info infoTexts={infoTexts} />}
            {artists && <Artists artists={artists} />}
            {artists && <MoreOf artists={artists} />}
            {recommendationsSeed && (
              <Recommendations type="artist" seed={recommendationsSeed} />
            )}
            {copyrightTexts && <Copyrights copyrightTexts={copyrightTexts} />}
            <EmptySection />
          </>
        }
      />
    </View>
  );
};
