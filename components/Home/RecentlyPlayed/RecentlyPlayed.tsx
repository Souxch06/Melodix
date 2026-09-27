import * as React from 'react';
import { Pressable, Text, View } from 'react-native';
import { Image } from 'expo-image';

import { useRouter, useSegments } from 'expo-router';

import { useApplicationDimensions } from '@hooks';
import { getRecentlyPlayed, updateRecentlyPlayed } from '@api';
import { RecentlyPlayedModel } from '@models';
import { RECENTLY_PLAYED_COVER_SIZE } from '@config';
import { getFallbackImage } from '@utils';

import { styles } from './styles';

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

  const gap = 8;
  const paddingHorizontal = 16;

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
    <View style={[styles.container, { gap, paddingHorizontal }]}>
      {recentlyPlayedData.map(({ id, title, imageURL }, index) => (
        <Pressable
          onPress={() => id && router.push(`/${pathname}/album/${id}`)}
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
              source={imageURL ? { uri: imageURL } : fallbackImageSource}
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
            {title}
          </Text>
        </Pressable>
      ))}
    </View>
  );
};
