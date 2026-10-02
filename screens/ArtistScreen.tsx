import * as React from 'react';
import {
  ActivityIndicator,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { Image } from 'expo-image';
import { useRouter } from 'expo-router';

import { getArtist } from '@api';
import { ErrorCard } from '@components';
import { COLORS } from '@config';
import type { ArtistModel } from '@models';

export type ArtistScreenProps = {
  artistId: string;
};

/**
 * Fiche artiste minimale mais réelle : elle consomme l'endpoint public déjà
 * disponible au lieu d'afficher l'identifiant brut. Le backend ne fournit
 * actuellement que le nom et l'image ; aucun faux album/titre n'est inventé.
 */
export const ArtistScreen = ({ artistId }: ArtistScreenProps) => {
  const router = useRouter();
  const [artist, setArtist] = React.useState<ArtistModel | null>(null);
  const [loading, setLoading] = React.useState(true);
  const [loadError, setLoadError] = React.useState(false);
  const [retrySeed, setRetrySeed] = React.useState(0);

  React.useEffect(() => {
    let disposed = false;
    setLoading(true);
    setLoadError(false);

    void getArtist(artistId)
      .then((nextArtist) => {
        if (!disposed) {
          setArtist(nextArtist);
          setLoading(false);
        }
      })
      .catch(() => {
        if (!disposed) {
          setArtist(null);
          setLoadError(true);
          setLoading(false);
        }
      });

    return () => {
      disposed = true;
    };
  }, [artistId, retrySeed]);

  if (loadError) {
    return (
      <View style={styles.container}>
        <BackButton onPress={() => router.back()} />
        <ErrorCard
          testID="artist-load-error"
          retryTestID="artist-load-retry"
          onRetry={() => setRetrySeed((seed) => seed + 1)}
        />
      </View>
    );
  }

  if (loading || !artist) {
    return (
      <View style={styles.container} testID="artist-loading">
        <BackButton onPress={() => router.back()} />
        <ActivityIndicator color={COLORS.WHITE} size="large" />
      </View>
    );
  }

  return (
    <View style={styles.container} testID="artist-screen">
      <BackButton onPress={() => router.back()} />
      <View style={styles.content}>
        {artist.imageURL ? (
          <Image
            accessibilityLabel={artist.name}
            source={{ uri: artist.imageURL }}
            style={styles.image}
          />
        ) : (
          <View style={[styles.image, styles.imageFallback]}>
            <Ionicons color={COLORS.GREY} name="person" size={72} />
          </View>
        )}
        <Text numberOfLines={2} style={styles.name} testID="artist-name">
          {artist.name}
        </Text>
        <Text style={styles.kind}>Artiste</Text>
      </View>
    </View>
  );
};

const BackButton = ({ onPress }: { onPress: () => void }) => (
  <Pressable
    accessibilityLabel="Retour"
    accessibilityRole="button"
    onPress={onPress}
    style={styles.backButton}
    testID="artist-back"
  >
    <Ionicons color={COLORS.WHITE} name="chevron-back" size={28} />
  </Pressable>
);

const styles = StyleSheet.create({
  backButton: {
    alignItems: 'center',
    height: 48,
    justifyContent: 'center',
    left: 8,
    position: 'absolute',
    top: 12,
    width: 48,
    zIndex: 1,
  },
  container: {
    alignItems: 'center',
    backgroundColor: COLORS.PRIMARY,
    flex: 1,
    justifyContent: 'center',
  },
  content: {
    alignItems: 'center',
    paddingHorizontal: 24,
  },
  image: {
    borderRadius: 100,
    height: 200,
    width: 200,
  },
  imageFallback: {
    alignItems: 'center',
    backgroundColor: '#252525',
    justifyContent: 'center',
  },
  kind: {
    color: COLORS.LIGHT_GREY,
    fontSize: 14,
    marginTop: 8,
  },
  name: {
    color: COLORS.WHITE,
    fontFamily: 'SF-Semibold',
    fontSize: 28,
    marginTop: 22,
    textAlign: 'center',
  },
});
