import * as React from 'react';
import { ActivityIndicator, FlatList, Pressable, Text, View } from 'react-native';
import { Image } from 'expo-image';
import { useRouter } from 'expo-router';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import Ionicons from '@expo/vector-icons/Ionicons';

import { useAccent, usePlayer } from '@context';
import { COLORS } from '@config';
import { translations } from '@data';
import { getFallbackImage } from '@utils';

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
  } = player;

  const [seekWidth, setSeekWidth] = React.useState(0);
  const [volumeWidth, setVolumeWidth] = React.useState(0);

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
  const isPlaying = status === 'playing';
  const isBuffering = status === 'loading';
  // Durée réelle pas encore connue (avant le 1er statut expo-av ou sans
  // métadonnée Spotify) : « —:-- » honnête + seek désactivé — jamais « 0:00 »
  // présenté comme une durée réelle (phase 1, section 4).
  const durationKnown = durationMillis > 0;

  const handleSeekPress = (x: number) => {
    if (seekWidth > 0 && durationKnown) {
      void seekTo(Math.round((x / seekWidth) * durationMillis));
    }
  };

  const handleVolumePress = (x: number) => {
    if (volumeWidth > 0) {
      void setVolume(x / volumeWidth);
    }
  };

  const repeatIcon =
    repeat === 'one' ? 'repeat-outline' : repeat === 'all' ? 'repeat' : 'repeat';
  const repeatActive = repeat !== 'off';

  return (
    <View style={[styles.container, { paddingTop: top + 8, paddingBottom: bottom + 16 }]}>
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
        <Pressable
          disabled={!durationKnown}
          onLayout={(e) => setSeekWidth(e.nativeEvent.layout.width)}
          onPress={(e) => handleSeekPress(e.nativeEvent.locationX)}
          style={[styles.seekTrack, !durationKnown && styles.seekDisabled]}
          accessibilityRole="adjustable"
          accessibilityState={{ disabled: !durationKnown }}
          accessibilityLabel={translations.playerSeek}
        >
          <View style={[styles.seekFill, { flex: progress }]} />
          <View style={[styles.seekRest, { flex: 1 - progress }]} />
          <View
            style={[
              styles.seekThumb,
              { left: `${progress * 100}%` },
            ]}
          />
        </Pressable>
        <View style={styles.timesRow}>
          <Text style={styles.timeText}>{formatMillis(positionMillis)}</Text>
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
        <Pressable
          onLayout={(e) => setVolumeWidth(e.nativeEvent.layout.width)}
          onPress={(e) => handleVolumePress(e.nativeEvent.locationX)}
          style={styles.volumeTrack}
          accessibilityRole="adjustable"
          accessibilityLabel={translations.playerVolume}
        >
          <View style={[styles.volumeFill, { flex: volume }]} />
          <View style={[styles.volumeRest, { flex: 1 - volume }]} />
        </Pressable>
        <Ionicons name="volume-high" size={18} color={COLORS.GREY} />
      </View>

      <Text style={styles.queueTitle}>{translations.playerUpNext}</Text>
      <FlatList
        data={queue}
        keyExtractor={(item, idx) => `${item.id}:${idx}`}
        style={styles.queueList}
        renderItem={({ item, index }) => {
          const isCurrent = index === currentIndex;

          return (
            <Pressable
              onPress={() => void playAtIndex(index)}
              style={[styles.queueRow, isCurrent && styles.queueRowActive]}
            >
              <Ionicons
                name={isCurrent && isPlaying ? 'stats-chart' : 'musical-note'}
                size={15}
                color={isCurrent ? accent : COLORS.GREY}
                style={styles.queueIcon}
              />
              <View style={styles.queueInfo}>
                <Text
                  numberOfLines={1}
                  style={[styles.queueTitleText, isCurrent && styles.activeText]}
                >
                  {item.title}
                </Text>
                <Text numberOfLines={1} style={styles.queueSubtitleText}>
                  {item.artists.join(', ')}
                </Text>
              </View>
            </Pressable>
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
