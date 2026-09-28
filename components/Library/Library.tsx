import * as React from 'react';
import { FlatList, RefreshControl, Text, View } from 'react-native';
import Animated, {
  Extrapolation,
  interpolate,
  useAnimatedStyle,
} from 'react-native-reanimated';

import { Card } from '../Card';

import { useApplicationDimensions } from '@hooks';
import {
  BOTTOM_NAVIGATION_HEIGHT,
  Categories,
  COLORS,
  HEADER_CATEGORIES_HEIGHT,
  HEADER_HEIGHT,
  Shapes,
  Sizes,
} from '@config';
import { LibraryItemModel } from '@models';
import {
  getLibrary,
  getUserPlaylists,
  invalidateUserPlaylistsCache,
  LibraryType,
} from '@api';
import { isSpotifySessionActive } from '@services';

import { translations } from '@data';

import { styles } from './styles';
import { useLibrarySelectedCategory } from '@context';

export const Library = () => {
  const [data, setData] = React.useState<LibraryType | null>(null);
  const [isRefreshing, setIsRefreshing] = React.useState(false);
  // Dernière erreur de récupération des playlists personnelles
  // (les favoris locaux restent affichés quoi qu'il arrive).
  const [personalFetchFailed, setPersonalFetchFailed] = React.useState(false);
  const { librarySelectedCategory, animatedValue } =
    useLibrarySelectedCategory();
  const { width, height } = useApplicationDimensions();

  const numColumns = 3;
  const initRenderAmount = 15;
  const maxRenderPerBatchAmount = 15;
  const outsideOfVisibleAreKeptInMemoryAmount = 9;

  const flatListRef = React.useRef<FlatList>(null);

  const load = React.useCallback(
    async ({ forceRefreshPersonal = false } = {}) => {
      try {
        const libraryData = await getLibrary();
        let merged = libraryData;

        // Compte Spotify connecté : playlists personnelles EN PREMIER dans
        // les catégories « playlist » et « all », par-dessus la copie de
        // travail locale (Spotify reste la source de vérité à la synchro).
        if (await isSpotifySessionActive()) {
          try {
            const personal = await getUserPlaylists({
              forceRefresh: forceRefreshPersonal,
            });
            merged = {
              ...libraryData,
              [Categories.SAVED_PLAYLISTS]: [
                ...personal,
                ...libraryData[Categories.SAVED_PLAYLISTS],
              ],
              [Categories.ALL]: [...personal, ...libraryData[Categories.ALL]],
            };
            setPersonalFetchFailed(false);
          } catch (personalError) {
            // Erreur propre : la bibliothèque locale reste consulted ;
            console.warn('Playlists personnelles indisponibles', personalError);
            setPersonalFetchFailed(true);
          }
        }

        setData(merged);
      } catch (error) {
        setData(null);
        console.error(error);
      }
    },
    []
  );

  React.useEffect(() => {
    void load();
  }, [load]);

  const handleRefresh = React.useCallback(async () => {
    setIsRefreshing(true);
    try {
      await invalidateUserPlaylistsCache();
      await load({ forceRefreshPersonal: true });
    } finally {
      setIsRefreshing(false);
    }
  }, [load]);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      opacity: interpolate(
        animatedValue.value,
        [0, 0.2, 1],
        [0, 0, 1],
        Extrapolation.CLAMP
      ),
      transform: [
        {
          translateY: interpolate(
            animatedValue.value,
            [0, 1],
            [+20, 0],
            Extrapolation.CLAMP
          ),
        },
      ],
    };
  });

  const renderItem = React.useCallback(
    ({
      item: { id, title, type, subtitle, imageURL },
      index,
    }: {
      item: LibraryItemModel;
      index: number;
    }) => (
      <Card
        key={index}
        id={id}
        type={type}
        shape={
          type === Categories.FOLLOWED_ARTISTS ? Shapes.CIRCLE : Shapes.SQUARE
        }
        size={Sizes.SMALL}
        title={title}
        subtitle={subtitle}
        imageURL={imageURL}
      />
    ),
    []
  );

  React.useEffect(() => {
    flatListRef.current?.scrollToOffset({ animated: false, offset: 0 });
  }, [librarySelectedCategory]);

  return (
    <View
      style={[
        styles.container,
        {
          width,
          height:
            height -
            BOTTOM_NAVIGATION_HEIGHT -
            HEADER_HEIGHT -
            HEADER_CATEGORIES_HEIGHT,
        },
      ]}
    >
      <Animated.View style={[{ flex: 1 }, animatedStyle]}>
        {data && (
          <FlatList
            ref={flatListRef}
            data={data[librarySelectedCategory]}
            renderItem={renderItem}
            keyExtractor={(item) => item.id}
            initialNumToRender={initRenderAmount}
            maxToRenderPerBatch={maxRenderPerBatchAmount}
            windowSize={outsideOfVisibleAreKeptInMemoryAmount}
            contentContainerStyle={styles.flatList}
            columnWrapperStyle={styles.flatListColumnWrapper}
            numColumns={numColumns}
            style={styles.scrollView}
            refreshControl={
              <RefreshControl
                refreshing={isRefreshing}
                onRefresh={handleRefresh}
                tintColor={COLORS.TINT}
                colors={[COLORS.TINT]}
              />
            }
            ListHeaderComponent={
              personalFetchFailed ? (
                <Text style={styles.personalErrorBanner}>
                  {translations.loginFetchFailed}
                </Text>
              ) : null
            }
          />
        )}
      </Animated.View>
    </View>
  );
};
