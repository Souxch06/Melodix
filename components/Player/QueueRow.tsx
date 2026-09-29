import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { Image } from 'expo-image';

import Ionicons from '@expo/vector-icons/Ionicons';

import { COLORS } from '@config';
import { translations } from '@data';
import type { PlayerTrack } from '@services';
import { getFallbackImage } from '@utils';

/**
 * Ligne de la file d'attente du FullPlayer (phase 2/4) — MÉMOÏSÉE : une file
 * de 200 morceaux ne se re-rend JAMAIS en entier à chaque tick de position
 * (500 ms) ; seules les lignes dont les props changent bougent.
 *
 * ATTENTION : cette liste affiche la `queue` ORIGINALE — jamais l'ordre de
 * lecture shuffle (`order`). Les deux ne doivent pas être confondus (§5).
 */
const QueueRowComponent = ({
  track,
  index,
  isCurrent,
  isPlaying,
  isFirst,
  isLast,
  accent,
  onPlay,
  onRemove,
  onMoveUp,
  onMoveDown,
}: {
  track: PlayerTrack;
  index: number;
  isCurrent: boolean;
  isPlaying: boolean;
  isFirst: boolean;
  isLast: boolean;
  accent: string;
  onPlay: (index: number) => void;
  onRemove: (index: number) => void;
  onMoveUp: (index: number) => void;
  onMoveDown: (index: number) => void;
}) => (
  <View
    style={[styles.queueRow, isCurrent && styles.queueRowActive]}
    testID={`queue-row-${index}`}
  >
    <Pressable
      accessibilityLabel={`${track.title} — ${track.artists.join(', ')}`}
      accessibilityRole="button"
      accessibilityState={{ selected: isCurrent }}
      onPress={() => onPlay(index)}
      style={styles.queueTapArea}
    >
      <Image
        source={
          track.imageURL ? { uri: track.imageURL } : getFallbackImage('track')
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
          style={[styles.queueTitleText, isCurrent && { color: accent }]}
        >
          {track.title}
        </Text>
        <Text numberOfLines={1} style={styles.queueSubtitleText}>
          {isCurrent
            ? `${translations.playerQueuePlaying} · ${track.artists.join(', ')}`
            : track.artists.join(', ')}
        </Text>
      </View>
    </Pressable>

    {/* Réordonner : flèches ↑/↓ (fiable mobile, zéro dépendance native, §6). */}
    <Pressable
      accessibilityLabel={translations.playerQueueMoveUp}
      accessibilityRole="button"
      accessibilityState={{ disabled: isFirst }}
      disabled={isFirst}
      hitSlop={8}
      onPress={() => onMoveUp(index)}
      style={[styles.queueAction, isFirst && styles.queueActionOff]}
      testID={`queue-up-${index}`}
    >
      <Ionicons name="chevron-up" size={17} color={COLORS.LIGHT_GREY} />
    </Pressable>
    <Pressable
      accessibilityLabel={translations.playerQueueMoveDown}
      accessibilityRole="button"
      accessibilityState={{ disabled: isLast }}
      disabled={isLast}
      hitSlop={8}
      onPress={() => onMoveDown(index)}
      style={[styles.queueAction, isLast && styles.queueActionOff]}
      testID={`queue-down-${index}`}
    >
      <Ionicons name="chevron-down" size={17} color={COLORS.LIGHT_GREY} />
    </Pressable>
    <Pressable
      accessibilityLabel={translations.playerQueueRemove}
      accessibilityRole="button"
      hitSlop={8}
      onPress={() => onRemove(index)}
      style={styles.queueAction}
      testID={`queue-remove-${index}`}
    >
      <Ionicons name="trash-outline" size={16} color={COLORS.RED} />
    </Pressable>
  </View>
);

/** Mémo stricte : une ligne ne bouge QUE si ses props changent réellement. */
export const QueueRow = React.memo(QueueRowComponent);

const styles = StyleSheet.create({
  queueRow: {
    alignItems: 'center',
    borderRadius: 8,
    flexDirection: 'row',
    paddingHorizontal: 8,
    paddingVertical: 6,
  },
  queueRowActive: {
    backgroundColor: COLORS.SECONDARY,
  },
  queueTapArea: {
    alignItems: 'center',
    flex: 1,
    flexDirection: 'row',
  },
  queueArtwork: {
    borderRadius: 4,
    height: 34,
    marginRight: 10,
    width: 34,
  },
  queueIcon: {
    marginRight: 8,
  },
  queueInfo: {
    flex: 1,
  },
  queueTitleText: {
    color: COLORS.WHITE,
    fontSize: 13,
  },
  activeTextUnused: {
    color: COLORS.TINT,
    fontWeight: '600',
  },
  queueSubtitleText: {
    color: COLORS.GREY,
    fontSize: 11,
  },
  queueAction: {
    paddingHorizontal: 6,
    paddingVertical: 6,
  },
  queueActionOff: {
    opacity: 0.25,
  },
});
