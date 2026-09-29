import * as React from 'react';
import {
  ActivityIndicator,
  FlatList,
  Pressable,
  Text,
  View,
} from 'react-native';
import { Image } from 'expo-image';
import { useRouter } from 'expo-router';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import Ionicons from '@expo/vector-icons/Ionicons';

import { useAccent, usePlayer } from '@context';
import { COLORS } from '@config';
import { translations } from '@data';
import { getFallbackImage } from '@utils';

import { DragSlider } from './DragSlider';
import { styles } from './fullStyles';

// Durée d'affichage de la notice d'erreur — IDENTIQUE au MiniPlayer
// (cohérence mini/plein écran exigée par la phase 1, section 3).
const NOTICE_DURATION_MS = 4500;

const formatMillis = (value: number): string => {
  const totalSeconds = Math.max(0, Math.round(value / 1000));
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;

  return `${minutes}:${String(seconds).padStart(2, '0')}`;
};

/**
 * Full-screen player: artwork, seek, previous/next, shuffle, repeat, volume,
 * queue. Streams come from the default audio provider (Audius); the badge
 * under the controls states which provider is playing the current track.
 */
export const FullPlayer = () => {
  const router = useRouter();
  const { top, bottom } = useSafeAreaInsets();
  const player = usePlayer();
  const accent = useAccent();
  const {
    current,
    queue,
    index: currentIndex,
    status,
    positionMillis,
    durationMillis,
    shuffle,
    repeat,
    volume,
    providerName,
    notice,
    togglePlayPause,
    next,
    previous,
    seekTo,
    setVolume,
    toggleShuffle,
    cycleRepeat,
    playAtIndex,
    stop,
    clearNotice,
    removeFromQueue,
    moveInQueue,
  } = player;

  // Mémoire MUTE : dernier volume NON NUL observé. Ce n'est PAS une 2e
  // source de vérité : le volume réel reste `volume` (état moteur) ; ce
  // ref ne sert qu'à retrouver le niveau d'avant mute (persistance Phase 2
  // compatible : un volume restauré > 0 s'y installe automatiquement).
  const lastAudibleVolumeRef = React.useRef(0.5);
  // Preview du seek pendant le drag : affichage mm:ss immédiat sans toucher
  // le moteur (le seek final n'arrive qu'au relâchement).
  const [seekPreviewMillis, setSeekPreviewMillis] = React.useState<
    number | null
  >(null);

  const volumeRef = React.useRef(volume);

  React.useEffect(() => {
    volumeRef.current = volume;
    if (volume > 0) {
      lastAudibleVolumeRef.current = volume;
    }
  }, [volume]);

  // Notice : affichée puis expirée automatiquement — jamais figée sur le
  // Full Player (le moteur la vide déjà au démarrage du morceau suivant).
  React.useEffect(() => {
    if (!notice) {
      return;
    }

    const timeout = setTimeout(clearNotice, NOTICE_DURATION_MS);

    return () => clearTimeout(timeout);
  }, [notice, clearNotice]);

  // Opened without an active session: nothing to show, go back. Le hook doit
  // rester inconditionnel (règle des hooks) : le garde-fou est DANS l'effet.
  React.useEffect(() => {
    if (!current) {
      router.back();
    }
  }, [current, router]);

  if (!current) {
    return null;
  }

  const progress =
    durationMillis > 0 ? Math.min(positionMillis / durationMillis, 1) : 0;
  // Position affichée : preview pendant le drag, sinon position réelle.
  const previewProgress =
    seekPreviewMillis !== null && durationMillis > 0
      ? Math.min(seekPreviewMillis / durationMillis, 1)
      : progress;
  const isMuted = volume <= 0;
  const seekShownMillis = seekPreviewMillis ?? positionMillis;
  const isPlaying = status === 'playing';
  const isBuffering = status === 'loading';
  // Durée réelle pas encore connue (avant le 1er statut expo-av ou sans
  // métadonnée Spotify) : « —:-- » honnête + seek désactivé — jamais « 0:00 »
  // présenté comme une durée réelle (phase 1, section 4).
  const durationKnown = durationMillis > 0;

  const handleSeekEnd = (ratio: number) => {
    if (durationKnown) {
      void seekTo(Math.round(ratio * durationMillis));
    }
  };

  /** Mute/Unmute — mémorise le dernier volume non nul (jamais perdu). */
  const handleMuteToggle = () => {
    if (isMuted) {
      void setVolume(
        lastAudibleVolumeRef.current > 0 ? lastAudibleVolumeRef.current : 0.5
      );
    } else {
      lastAudibleVolumeRef.current = volumeRef.current;
      void setVolume(0);
    }
  };

  const repeatIcon =
    repeat === 'one'
      ? 'repeat-outline'
      : repeat === 'all'
        ? 'repeat'
        : 'repeat';
  const repeatActive = repeat !== 'off';

  return (
    <View
      style={[
        styles.container,
        { paddingTop: top + 8, paddingBottom: bottom + 16 },
      ]}
    >
      <View style={styles.header}>
        <Pressable
          onPress={() => router.back()}
          style={styles.headerButton}
          accessibilityRole="button"
          accessibilityLabel={translations.playerClose}
        >
          <Ionicons name="chevron-down" size={26} color={COLORS.WHITE} />
        </Pressable>
        <Text numberOfLines={1} style={styles.headerTitle}>
          {current.album ?? current.artists.join(', ')}
        </Text>
        <View style={styles.headerButton} />
      </View>

      <View style={styles.artworkWrap}>
        <Image
          style={styles.artwork}
          source={
            current.imageURL
              ? { uri: current.imageURL }
              : getFallbackImage('track')
          }
        />
      </View>

      <View style={styles.metaWrap}>
        <Text numberOfLines={1} style={styles.title}>
          {current.title}
        </Text>
        <Text numberOfLines={1} style={styles.subtitle}>
          {current.artists.join(', ')}
        </Text>
        {providerName ? (
          <Text style={styles.providerBadge}>
            {translations.playerStreamedWith(providerName)}
          </Text>
        ) : null}
        {notice ? (
          <Text numberOfLines={2} style={styles.noticeText}>
            {notice.kind === 'not-available'
              ? translations.playerTrackUnavailable(notice.title)
              : translations.playerTrackPlayFailed(notice.title)}
          </Text>
        ) : null}
      </View>

      <View style={styles.seekWrap}>
        {/* Glissable (phase 3) : preview pendant le drag, UN seek final.
            `key` = morceau : le changement de piste annule toute preview
            emportée (jamais d'ancienne position sur le nouveau morceau). */}
        <DragSlider
          key={current.id}
          accessibilityLabel={translations.playerSeek}
          accessibilityValueText={`${formatMillis(seekShownMillis)} / ${
            durationKnown ? formatMillis(durationMillis) : '—:--'
          }`}
          disabled={!durationKnown}
          onSlideChange={(ratio) =>
            durationKnown
              ? setSeekPreviewMillis(Math.round(ratio * durationMillis))
              : undefined
          }
          onSlideEnd={(ratio) => {
            setSeekPreviewMillis(null);
            handleSeekEnd(ratio);
          }}
          testID="full-seek-slider"
          value={previewProgress}
        />
        <View style={styles.timesRow}>
          <Text style={styles.timeText}>{formatMillis(seekShownMillis)}</Text>
          <Text style={styles.timeText} testID="full-player-duration">
            {durationKnown ? formatMillis(durationMillis) : '—:--'}
          </Text>
        </View>
      </View>

      <View style={styles.controlsRow}>
        <Pressable
          onPress={toggleShuffle}
          style={styles.smallControl}
          accessibilityRole="button"
          accessibilityLabel={translations.playerShuffle}
        >
          <Ionicons
            name="shuffle"
            size={22}
            color={shuffle ? accent : COLORS.GREY}
          />
        </Pressable>
        <Pressable
          onPress={previous}
          style={styles.control}
          accessibilityRole="button"
          accessibilityLabel={translations.playerPrevious}
        >
          <Ionicons name="play-skip-back" size={30} color={COLORS.WHITE} />
        </Pressable>
        {isBuffering ? (
          <ActivityIndicator
            color={COLORS.WHITE}
            style={styles.playButton}
            accessibilityLabel={translations.playerLoading}
          />
        ) : (
          <Pressable
            onPress={togglePlayPause}
            style={styles.playButton}
            accessibilityRole="button"
            accessibilityLabel={
              isPlaying ? translations.playerPause : translations.playerPlay
            }
          >
            <Ionicons
              name={isPlaying ? 'pause' : 'play'}
              size={32}
              color={COLORS.BLACK}
            />
          </Pressable>
        )}
        <Pressable
          onPress={next}
          style={styles.control}
          accessibilityRole="button"
          accessibilityLabel={translations.playerNext}
        >
          <Ionicons name="play-skip-forward" size={30} color={COLORS.WHITE} />
        </Pressable>
        <Pressable
          onPress={cycleRepeat}
          style={styles.smallControl}
          accessibilityRole="button"
          accessibilityLabel={
            repeat === 'one'
              ? translations.playerRepeatOne
              : translations.playerRepeat
          }
        >
          <Ionicons
            name={repeatIcon}
            size={22}
            color={repeatActive ? accent : COLORS.GREY}
          />
          {repeat === 'one' ? <View style={styles.repeatDot} /> : null}
        </Pressable>
      </View>

      <View style={styles.volumeRow}>
        <Ionicons name="volume-low" size={18} color={COLORS.GREY} />
        <View style={styles.volumeTrack}>
          <DragSlider
            accessibilityLabel={translations.playerVolume}
            accessibilityValueText={`${Math.round(volume * 100)} %`}
            fillColor={COLORS.LIGHT_GREY}
            onSlideEnd={(ratio) => void setVolume(ratio)}
            testID="full-volume-slider"
            value={volume}
          />
        </View>
        <Pressable
          accessibilityLabel={
            isMuted ? translations.playerUnmute : translations.playerMute
          }
          accessibilityRole="button"
          accessibilityState={{ selected: isMuted }}
          onPress={handleMuteToggle}
          style={styles.muteButton}
          testID="full-mute-button"
        >
          <Ionicons
            name={isMuted ? 'volume-mute' : 'volume-high'}
            size={18}
            color={isMuted ? COLORS.TINT : COLORS.GREY}
          />
        </Pressable>
      </View>

      <Text style={styles.queueTitle}>{translations.playerQueueTitle}</Text>
      <FlatList
        data={queue}
        keyExtractor={(item, idx) => `${item.id}:${idx}`}
        style={styles.queueList}
        // Queue longue : virtualisée par FlatList (phase 2, performance).
        initialNumToRender={12}
        renderItem={({ item, index }) => {
          const isCurrent = index === currentIndex;
          const isFirst = index === 0;
          const isLast = index === queue.length - 1;

          return (
            <View
              style={[styles.queueRow, isCurrent && styles.queueRowActive]}
              testID={`queue-row-${index}`}
            >
              <Pressable
                accessibilityRole="button"
                onPress={() => void playAtIndex(index)}
                style={styles.queueTapArea}
              >
                <Image
                  source={
                    item.imageURL
                      ? { uri: item.imageURL }
                      : getFallbackImage('track')
                  }
                  style={styles.queueArtwork}
                />
                <Ionicons
                  name={isCurrent && isPlaying ? 'stats-chart' : 'musical-note'}
                  size={15}
                  color={isCurrent ? accent : COLORS.GREY}
                  style={styles.queueIcon}
                />
                <View style={styles.queueInfo}>
                  <Text
                    numberOfLines={1}
                    style={[
                      styles.queueTitleText,
                      isCurrent && styles.activeText,
                    ]}
                  >
                    {item.title}
                  </Text>
                  <Text numberOfLines={1} style={styles.queueSubtitleText}>
                    {item.artists.join(', ')}
                  </Text>
                </View>
              </Pressable>

              {/* Réordonner : flèche haut/bas (accessible, sans lib native). */}
              <Pressable
                accessibilityLabel={translations.playerQueueMoveUp}
                accessibilityRole="button"
                disabled={isFirst}
                onPress={() => moveInQueue(index, index - 1)}
                style={[styles.queueAction, isFirst && styles.queueActionOff]}
                testID={`queue-up-${index}`}
              >
                <Ionicons
                  name="chevron-up"
                  size={17}
                  color={COLORS.LIGHT_GREY}
                />
              </Pressable>
              <Pressable
                accessibilityLabel={translations.playerQueueMoveDown}
                accessibilityRole="button"
                disabled={isLast}
                onPress={() => moveInQueue(index, index + 1)}
                style={[styles.queueAction, isLast && styles.queueActionOff]}
                testID={`queue-down-${index}`}
              >
                <Ionicons
                  name="chevron-down"
                  size={17}
                  color={COLORS.LIGHT_GREY}
                />
              </Pressable>
              <Pressable
                accessibilityLabel={translations.playerQueueRemove}
                accessibilityRole="button"
                onPress={() => removeFromQueue(index)}
                style={styles.queueAction}
                testID={`queue-remove-${index}`}
              >
                <Ionicons name="trash-outline" size={16} color={COLORS.RED} />
              </Pressable>
            </View>
          );
        }}
      />

      <Pressable
        onPress={() => {
          void stop();
          router.back();
        }}
        style={styles.closeSession}
        accessibilityRole="button"
        accessibilityLabel={translations.playerStop}
      >
        <Ionicons name="close" size={20} color={COLORS.GREY} />
      </Pressable>
    </View>
  );
};
