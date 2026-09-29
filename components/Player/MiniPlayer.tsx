import * as React from 'react';
import { ActivityIndicator, Pressable, Text, View } from 'react-native';
import { Image } from 'expo-image';
import { useRouter } from 'expo-router';

import Ionicons from '@expo/vector-icons/Ionicons';

import { useAccent, usePlayer } from '@context';
import { COLORS } from '@config';
import { translations } from '@data';
import { getFallbackImage } from '@utils';

import { styles } from './styles';

// How long the "track not available" notice stays on the mini player.
const NOTICE_DURATION_MS = 4500;

/**
 * Mini player above the tab bar, active in every mode: the queue mixes
 * Spotify-source tracks (matched to Audius at play time) and direct provider
 * tracks. Tapping it opens the full player; skipping a track that has no
 * reliable Audius match shows a short notice here.
 */
export const MiniPlayer = () => {
  const router = useRouter();
  const accent = useAccent();
  const {
    current,
    status,
    positionMillis,
    durationMillis,
    notice,
    togglePlayPause,
    next,
    previous,
    stop,
    clearNotice,
  } = usePlayer();

  React.useEffect(() => {
    if (!notice) {
      return;
    }

    const timeout = setTimeout(clearNotice, NOTICE_DURATION_MS);

    return () => clearTimeout(timeout);
  }, [notice, clearNotice]);

  if (!current) {
    return null;
  }

  const progress =
    durationMillis > 0 ? Math.min(positionMillis / durationMillis, 1) : 0;

  const isBuffering = status === 'loading';
  const isPlaying = status === 'playing';

  return (
    <View style={styles.wrapper}>
      {notice ? (
        <View style={styles.noticeBar}>
          <Ionicons
            name="alert-circle"
            size={14}
            color={COLORS.WHITE}
            style={styles.noticeIcon}
          />
          <Text numberOfLines={1} style={styles.noticeText}>
            {notice.kind === 'not-available'
              ? translations.playerTrackUnavailable(notice.title)
              : translations.playerTrackPlayFailed(notice.title)}
          </Text>
        </View>
      ) : null}
      <View style={styles.progressTrack}>
        <View
          style={[
            styles.progressFill,
            { backgroundColor: accent },
            { width: `${progress * 100}%` },
          ]}
        />
      </View>
      <View style={styles.container}>
        <Pressable
          style={styles.openArea}
          onPress={() => router.push('/player')}
          accessibilityRole="button"
          accessibilityLabel={translations.playerExpand}
        >
          <Image
            style={styles.artwork}
            source={
              current.imageURL
                ? { uri: current.imageURL }
                : getFallbackImage('track')
            }
          />
          <View style={styles.info}>
            <Text numberOfLines={1} style={styles.title}>
              {current.title}
            </Text>
            <Text numberOfLines={1} style={styles.subtitle}>
              {status === 'error'
                ? translations.playerError
                : status === 'unavailable'
                  ? translations.playerUnavailable
                  : current.artists.join(', ')}
            </Text>
          </View>
        </Pressable>

        <Pressable
          onPress={previous}
          style={styles.control}
          accessibilityRole="button"
          accessibilityLabel={translations.playerPrevious}
        >
          <Ionicons name="play-skip-back" size={20} color={COLORS.WHITE} />
        </Pressable>

        {isBuffering ? (
          <ActivityIndicator
            color={COLORS.WHITE}
            style={styles.control}
            accessibilityLabel={translations.playerLoading}
          />
        ) : (
          <Pressable
            onPress={togglePlayPause}
            style={styles.control}
            accessibilityRole="button"
            accessibilityLabel={
              isPlaying ? translations.playerPause : translations.playerPlay
            }
          >
            <Ionicons
              name={isPlaying ? 'pause' : 'play'}
              size={26}
              color={COLORS.WHITE}
            />
          </Pressable>
        )}

        <Pressable
          onPress={next}
          style={styles.control}
          accessibilityRole="button"
          accessibilityLabel={translations.playerNext}
        >
          <Ionicons name="play-skip-forward" size={22} color={COLORS.WHITE} />
        </Pressable>

        <Pressable
          onPress={stop}
          style={styles.control}
          accessibilityRole="button"
          accessibilityLabel={translations.playerClose}
        >
          <Ionicons name="close" size={24} color={COLORS.GREY} />
        </Pressable>
      </View>
    </View>
  );
};
