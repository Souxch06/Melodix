import * as React from 'react';
import {
  ActivityIndicator,
  FlatList,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { Image } from 'expo-image';
import { useRouter } from 'expo-router';
import { useFocusEffect } from '@react-navigation/native';

import { usePlayer } from '@context';
import { COLORS } from '@config';
import {
  getRecentlyPlayedTracks,
  playerTrackFromHistoryEntry,
  removePlayHistoryEntry,
  type PlayHistoryEntry,
} from '@services';

export const HistoryScreen = () => {
  const router = useRouter();
  const player = usePlayer();
  const [entries, setEntries] = React.useState<PlayHistoryEntry[] | null>(null);
  const [loadError, setLoadError] = React.useState(false);
  const [retrySeed, setRetrySeed] = React.useState(0);

  useFocusEffect(
    React.useCallback(() => {
      // Le compteur représente une demande explicite de retry et force une
      // nouvelle instance de ce callback de focus.
      void retrySeed;
      let disposed = false;
      setLoadError(false);
      void getRecentlyPlayedTracks(100)
        .then((nextEntries) => {
          if (!disposed) setEntries(nextEntries);
        })
        .catch(() => {
          if (!disposed) {
            setEntries(null);
            setLoadError(true);
          }
        });
      return () => {
        disposed = true;
      };
    }, [retrySeed])
  );

  const playEntry = React.useCallback(
    (entry: PlayHistoryEntry) => {
      void player.playTrack(
        playerTrackFromHistoryEntry({
          id: entry.track.id,
          title: entry.track.title,
          imageURL: entry.track.imageURL ?? '',
          snapshot: entry.track,
        })
      );
    },
    [player]
  );

  const removeEntry = React.useCallback(async (trackId: string) => {
    await removePlayHistoryEntry(trackId);
    setEntries((current) =>
      (current ?? []).filter((entry) => entry.track.id !== trackId)
    );
  }, []);

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Pressable
          accessibilityLabel="Retour"
          accessibilityRole="button"
          onPress={() => router.back()}
          testID="history-back"
        >
          <Ionicons color={COLORS.WHITE} name="chevron-back" size={28} />
        </Pressable>
        <Text style={styles.title}>Historique</Text>
      </View>

      {loadError ? (
        <View style={styles.center} testID="history-error">
          <Text style={styles.message}>Historique indisponible.</Text>
          <Pressable
            accessibilityRole="button"
            onPress={() => {
              setEntries(null);
              setRetrySeed((seed) => seed + 1);
            }}
            style={styles.retry}
            testID="history-retry"
          >
            <Text style={styles.retryText}>Réessayer</Text>
          </Pressable>
        </View>
      ) : entries === null ? (
        <View style={styles.center} testID="history-loading">
          <ActivityIndicator color={COLORS.WHITE} size="large" />
        </View>
      ) : entries.length === 0 ? (
        <View style={styles.center} testID="history-empty">
          <Ionicons color={COLORS.GREY} name="time-outline" size={36} />
          <Text style={styles.message}>Aucune écoute pour le moment.</Text>
        </View>
      ) : (
        <FlatList
          contentContainerStyle={styles.list}
          data={entries}
          keyExtractor={(entry) => entry.track.id}
          renderItem={({ item }) => (
            <View style={styles.row}>
              <Pressable
                accessibilityRole="button"
                onPress={() => playEntry(item)}
                style={styles.playArea}
                testID={`history-play-${item.track.id}`}
              >
                {item.track.imageURL ? (
                  <Image
                    source={{ uri: item.track.imageURL }}
                    style={styles.cover}
                  />
                ) : (
                  <View style={[styles.cover, styles.coverFallback]}>
                    <Ionicons
                      color={COLORS.GREY}
                      name="musical-note"
                      size={22}
                    />
                  </View>
                )}
                <View style={styles.texts}>
                  <Text numberOfLines={1} style={styles.trackTitle}>
                    {item.track.title}
                  </Text>
                  <Text numberOfLines={1} style={styles.subtitle}>
                    {item.track.subtitle}
                  </Text>
                </View>
              </Pressable>
              <Pressable
                accessibilityLabel={`Supprimer ${item.track.title} de l'historique`}
                accessibilityRole="button"
                onPress={() => void removeEntry(item.track.id)}
                style={styles.remove}
                testID={`history-remove-${item.track.id}`}
              >
                <Ionicons color={COLORS.GREY} name="close" size={22} />
              </Pressable>
            </View>
          )}
        />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  center: { alignItems: 'center', flex: 1, justifyContent: 'center' },
  container: { backgroundColor: COLORS.PRIMARY, flex: 1 },
  cover: { borderRadius: 5, height: 52, width: 52 },
  coverFallback: {
    alignItems: 'center',
    backgroundColor: '#252525',
    justifyContent: 'center',
  },
  header: {
    alignItems: 'center',
    flexDirection: 'row',
    gap: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
  },
  list: { padding: 16 },
  message: { color: COLORS.LIGHT_GREY, marginTop: 12 },
  playArea: { alignItems: 'center', flex: 1, flexDirection: 'row' },
  remove: { padding: 12 },
  retry: {
    backgroundColor: COLORS.WHITE,
    borderRadius: 18,
    marginTop: 16,
    paddingHorizontal: 18,
    paddingVertical: 9,
  },
  retryText: { color: COLORS.PRIMARY, fontFamily: 'SF-Semibold' },
  row: { alignItems: 'center', flexDirection: 'row', marginBottom: 12 },
  subtitle: { color: COLORS.LIGHT_GREY, fontSize: 13, marginTop: 3 },
  texts: { flex: 1, marginLeft: 12 },
  title: { color: COLORS.WHITE, fontFamily: 'SF-Semibold', fontSize: 22 },
  trackTitle: { color: COLORS.WHITE, fontSize: 15 },
});
