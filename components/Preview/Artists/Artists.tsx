import * as React from 'react';
import { Pressable, Text, View } from 'react-native';
import { Image } from 'expo-image';
import { useRouter, useSegments } from 'expo-router';

import { ArtistModel } from '@models';

import { styles } from './styles';

export type ArtistsPropsType = {
  artists: ArtistModel[] | null;
};

export const Artists = ({ artists }: ArtistsPropsType) => {
  const router = useRouter();
  const pathname = useSegments().slice(0, 2).join('/') as
    | '(tabs)/home'
    | '(tabs)/search'
    | '(tabs)/library';

  const handlePress = React.useCallback(
    (artistId: string) => {
      // Page artiste du même onglet (la route album a été un long bug).
      router.push(`/${pathname}/artist/${artistId}`);
    },
    [router, pathname]
  );

  const checkArtistIDisEmpty = React.useMemo(
    () => artists && artists.some((artist) => !artist.id),
    [artists]
  );

  if (!artists || checkArtistIDisEmpty) {
    return null;
  }

  return artists.map(({ id, imageURL, name }) => (
    <Pressable
      style={styles.link}
      onPress={() => handlePress(id)}
      key={id}
      testID={`artist-link-${id}`}
    >
      <View style={styles.container}>
        <View style={styles.imageView}>
          <Image testID="artist-image" style={styles.image} source={{ uri: imageURL }} />
        </View>
        <View>
          <Text testID="artist-name" style={styles.text}>
            {name}
          </Text>
        </View>
      </View>
    </Pressable>
  ));
};
