import * as React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { Image } from 'expo-image';

import { useRouter, useSegments } from 'expo-router';

import { useApplicationDimensions } from '@hooks';
import { getRecentlyPlayed, updateRecentlyPlayed } from '@api';
import { RecentlyPlayedModel } from '@models';
import { COLORS, RECENTLY_PLAYED_COVER_SIZE } from '@config';
import { getFallbackImage } from '@utils';
import { translations } from '@data';
import { usePlayer } from '@context';
import type { PlayerTrack } from '@services';
import { audiusTrackSource, spotifyTrackSource } from '@services';

import { styles } from './styles';

const AUDIUS_PREFIX = 'audius:';
const SPOTIFY_PREFIX = 'spotify:';

/**
 * I-8 : l'historique stocke l'identifiant de QUEUE (déjà préfixé, validé
 * depuis toujours par le player). Lecture directe d'une tuile sans album :
 * on re-déduit la SOURCE en retirant le préfixe — jamais de double préfixe.
 */
const playerTrackFromHistory = (item: RecentlyPlayedModel): PlayerTrack => {
  const snapshot = item.track;
  const id = snapshot?.id || item.id;
  const source = id.startsWith(AUDIUS_PREFIX)
    ? audiusTrackSource(id.slice(AUDIUS_PREFIX.length))
    : spotifyTrackSource(
        id.startsWith(SPOTIFY_PREFIX) ? id.slice(SPOTIFY_PREFIX.length) : id
      );

  return {
    id, // clé inchangée : cache de matching et historique réutilisés.
    title: snapshot?.title ?? item.title,
    artists: snapshot?.subtitle
      ? snapshot.subtitle.split(', ').filter(Boolean)
      : [],
    album: snapshot?.albumName ?? null,
    durationMillis: snapshot?.durationMs ?? null,
    imageURL: item.imageURL,
    source,
  };
};

export const RecentlyPlayed = () => {
  const [recentlyPlayedData, setRecentlyPlayedData] = React.useState<
    RecentlyPlayedModel[] | null
  >([
    ...Array(8).fill({
      id: '',
      title: '',
      imageURL: '',
    }),
  ]);
  const pathname = useSegments().slice(0, 2).join('/') as
    | '(tabs)/home'
    | '(tabs)/search'
    | '(tabs)/library';
  const { width } = useApplicationDimensions();
  const router = useRouter();
  const player = usePlayer();

  const gap = 8;
  const paddingHorizontal = 16;

  // I-8 : une tuile reste TOUJOURS fonctionnelle.
  //   albumId connu  → navigation vers l'ALBUM ;
  //   sinon         → JAMAIS /album/<trackId> : lecture directe du morceau
  //                   (identité déjà conservée dans l'historique), y compris
  //                   les anciennes entrées sans albumId.
  const handlePress = React.useCallback(
    (item: RecentlyPlayedModel) => {
      if (!item.id) {
        return; // tuile squelette
      }
      if (item.albumId) {
        router.push(`/${pathname}/album/${item.albumId}`);
        return;
      }
      void player.playQueue([playerTrackFromHistory(item)], 0);
    },
    [pathname, router, player]
  );

  React.useEffect(() => {
    let isMounted = true;

    (async () => {
      // Cached tiles first (instant), then the latest plays from Spotify.
      const cached = await getRecentlyPlayed();

      if (isMounted && cached.length) {
        setRecentlyPlayedData(cached);
      }

      try {
        const updated = await updateRecentlyPlayed();

        if (isMounted) {
          setRecentlyPlayedData(updated);
        }
      } catch (error) {
        console.error(error);

        if (isMounted && !cached.length) {
          setRecentlyPlayedData(null);
        }
      }
    })();

    return () => {
      isMounted = false;
    };
  }, []);

  const fallbackImageSource = React.useMemo(
    () => getFallbackImage('single'),
    []
  );

  // Hidden when there is no history yet or Spotify refuses the request.
  if (!recentlyPlayedData?.length) {
    return null;
  }

  return (
    <View style={sectionStyles.wrapper}>
      <Text
        numberOfLines={1}
        style={sectionStyles.title}
        testID="home-recently-played-title"
      >
        {translations.homeRecentlyPlayed}
      </Text>
      <View style={[styles.container, { gap, paddingHorizontal }]}>
        {recentlyPlayedData.map((item, index) => (
          <Pressable
            onPress={() => handlePress(item)}
            key={index}
            style={[
              styles.link,
              {
                width: width / 2 - paddingHorizontal - gap / 2,
              },
            ]}
          >
            <View
              style={[
                styles.imageView,
                {
                  width: RECENTLY_PLAYED_COVER_SIZE,
                  height: RECENTLY_PLAYED_COVER_SIZE,
                },
              ]}
            >
              <Image
                style={styles.image}
                source={
                  item.imageURL ? { uri: item.imageURL } : fallbackImageSource
                }
              />
            </View>
            <Text
              numberOfLines={2}
              style={[
                styles.text,
                {
                  width:
                    width / 2 -
                    paddingHorizontal -
                    gap / 2 -
                    RECENTLY_PLAYED_COVER_SIZE,
                },
              ]}
            >
              {item.title}
            </Text>
          </Pressable>
        ))}
      </View>
    </View>
  );
};

const sectionStyles = StyleSheet.create({
  wrapper: {
    marginBottom: 24,
  },
  title: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 20,
    marginBottom: 14,
    paddingHorizontal: 16,
  },
});
