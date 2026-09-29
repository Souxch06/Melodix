import * as React from 'react';
import { Modal, Pressable, StyleSheet, Text } from 'react-native';

import { COLORS } from '@config';
import { usePlayer } from '@context';
import { translations } from '@data';
import type { PlayerTrack } from '@services';

/**
 * Menu d'actions contextuel d'un MORCEAU quelconque (recherche, playlists,
 * albums, recommandations…) : « Ajouter à la file » et « Lire ensuite ».
 *
 * Usage : le parent garde `visible`/`track`, rend le menu, et le ferme via
 * `onClose`. NE PAS dupliquer ces actions ailleurs : toujours réutiliser ce
 * composant.
 */
export const QueueActionMenu = ({
  visible,
  track,
  onClose,
}: {
  visible: boolean;
  track: PlayerTrack | null;
  onClose: () => void;
}) => {
  const { addToQueue, playNext } = usePlayer();

  const handleAdd = () => {
    if (track) {
      addToQueue(track);
    }
    onClose();
  };

  const handlePlayNext = () => {
    if (track) {
      playNext(track);
    }
    onClose();
  };

  return (
    <Modal
      animationType="fade"
      onRequestClose={onClose}
      transparent
      visible={visible && Boolean(track)}
    >
      <Pressable
        accessibilityLabel={translations.playerClose}
        onPress={onClose}
        style={styles.backdrop}
        testID="queue-action-menu-backdrop"
      >
        <Pressable
          onPress={(event) => event?.stopPropagation?.()}
          style={styles.sheet}
        >
          <Text numberOfLines={1} style={styles.title}>
            {track ? `${track.title} — ${track.artists.join(', ')}` : ''}
          </Text>

          <Pressable
            accessibilityLabel={translations.playerQueueAdd}
            accessibilityRole="button"
            onPress={handleAdd}
            style={styles.action}
            testID="queue-action-add"
          >
            <Text style={styles.actionText}>{translations.playerQueueAdd}</Text>
          </Pressable>

          <Pressable
            accessibilityLabel={translations.playerQueuePlayNext}
            accessibilityRole="button"
            onPress={handlePlayNext}
            style={styles.action}
            testID="queue-action-play-next"
          >
            <Text style={styles.actionText}>
              {translations.playerQueuePlayNext}
            </Text>
          </Pressable>
        </Pressable>
      </Pressable>
    </Modal>
  );
};

const styles = StyleSheet.create({
  backdrop: {
    alignItems: 'center',
    backgroundColor: 'rgba(0,0,0,0.6)',
    flex: 1,
    justifyContent: 'flex-end',
  },
  sheet: {
    backgroundColor: COLORS.SECONDARY,
    borderTopLeftRadius: 16,
    borderTopRightRadius: 16,
    paddingBottom: 32,
    paddingHorizontal: 16,
    paddingTop: 12,
    width: '100%',
  },
  title: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    marginBottom: 8,
    textAlign: 'center',
  },
  action: {
    alignItems: 'center',
    backgroundColor: COLORS.BORDER_GREY,
    borderRadius: 10,
    marginTop: 8,
    paddingVertical: 14,
  },
  actionText: {
    color: COLORS.WHITE,
    fontSize: 15,
    fontWeight: '600',
  },
});
