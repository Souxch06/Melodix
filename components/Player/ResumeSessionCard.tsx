import * as React from 'react';
import { Image, Pressable, StyleSheet, Text, View } from 'react-native';

import { COLORS } from '@config';
import { usePlayer } from '@context';
import { translations } from '@data';

/** Formate `mm:ss` (indépendant de l'état du moteur pour une session froide). */
const formatResumePosition = (millis: number): string => {
  const totalSeconds = Math.max(0, Math.floor(millis / 1000));
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;

  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
};

/**
 * Carte « Reprendre la lecture » affichée en haut de l'accueil quand une
 * session a été persistée (jamais de lecture automatique au démarrage).
 * « Reprendre » restaure file + morceau + position ; « Ignorer » la supprime.
 */
export const ResumeSessionCard = () => {
  const { pendingRestore, resumeSession, dismissSession } = usePlayer();

  if (!pendingRestore) {
    return null;
  }

  const track = pendingRestore.queue[pendingRestore.index] ?? null;

  if (!track) {
    return null;
  }

  return (
    <View style={styles.card} testID="resume-session-card">
      {track.imageURL ? (
        <Image source={{ uri: track.imageURL }} style={styles.artwork} />
      ) : (
        <View style={[styles.artwork, styles.artworkFallback]} />
      )}

      <View style={styles.info}>
        <Text numberOfLines={1} style={styles.title}>
          {translations.playerResumeTitle}
        </Text>
        <Text numberOfLines={1} style={styles.track}>
          {track.title} · {track.artists.join(', ')}
        </Text>
        {pendingRestore.positionMillis > 0 ? (
          <Text style={styles.position}>
            {translations.playerResumePosition(
              formatResumePosition(pendingRestore.positionMillis)
            )}
          </Text>
        ) : null}
      </View>

      <View style={styles.actions}>
        <Pressable
          accessibilityLabel={translations.playerResumeAction}
          accessibilityRole="button"
          onPress={() => void resumeSession()}
          style={styles.resumeButton}
          testID="resume-session-resume"
        >
          <Text style={styles.resumeText}>
            {translations.playerResumeAction}
          </Text>
        </Pressable>

        <Pressable
          accessibilityLabel={translations.playerResumeDismiss}
          accessibilityRole="button"
          onPress={() => void dismissSession()}
          style={styles.dismissButton}
          testID="resume-session-dismiss"
        >
          <Text style={styles.dismissText}>
            {translations.playerResumeDismiss}
          </Text>
        </Pressable>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    alignItems: 'center',
    backgroundColor: COLORS.SECONDARY,
    borderRadius: 12,
    flexDirection: 'row',
    marginBottom: 16,
    padding: 12,
  },
  artwork: {
    borderRadius: 6,
    height: 52,
    width: 52,
  },
  artworkFallback: {
    backgroundColor: COLORS.BORDER_GREY,
  },
  info: {
    flex: 1,
    paddingHorizontal: 12,
  },
  title: {
    color: COLORS.TINT,
    fontSize: 12,
    fontWeight: '700',
    marginBottom: 2,
    textTransform: 'uppercase',
  },
  track: {
    color: COLORS.WHITE,
    fontSize: 14,
    fontWeight: '600',
  },
  position: {
    color: COLORS.LIGHT_GREY,
    fontSize: 12,
    marginTop: 2,
  },
  actions: {
    alignItems: 'flex-end',
  },
  resumeButton: {
    backgroundColor: COLORS.TINT,
    borderRadius: 16,
    paddingHorizontal: 14,
    paddingVertical: 7,
  },
  resumeText: {
    color: COLORS.BLACK,
    fontSize: 13,
    fontWeight: '700',
  },
  dismissButton: {
    marginTop: 6,
    paddingHorizontal: 10,
    paddingVertical: 3,
  },
  dismissText: {
    color: COLORS.LIGHT_GREY,
    fontSize: 12,
  },
});
