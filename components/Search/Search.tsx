import * as React from 'react';
import {
  ActivityIndicator,
  Pressable,
  ScrollView,
  Text,
  TextInput,
  View,
} from 'react-native';
import FontAwesome from '@expo/vector-icons/FontAwesome';
import { useRouter } from 'expo-router';

import { getBrowseCategories, searchCatalog } from '@api';
import {
  BrowseCategoryModel,
  LibraryItemModel,
  SearchResultsModel,
} from '@models';
import { useApplicationDimensions } from '@hooks';
import {
  BOTTOM_NAVIGATION_HEIGHT,
  COLORS,
  HEADER_HEIGHT,
  Shapes,
  Sizes,
} from '@config';
import { translations } from '@data';
import { artistsFromSubtitle } from '@models';
import { usePlayer } from '@context';
import { queueIdForTrackId, sourceForTrackId } from '@services';
import type { PlayerTrack } from '@services';

import { QueueActionMenu } from '../Player/QueueActionMenu';

import { Slider } from '../Slider';
import { styles } from './styles';

type SearchStatus = 'idle' | 'loading' | 'done' | 'error';

// Wait for the user to stop typing before calling the API.
export const SEARCH_DELAY_MS = 400;

export const Search = () => {
  const { width, height } = useApplicationDimensions();
  const router = useRouter();
  const [query, setQuery] = React.useState('');
  const [results, setResults] = React.useState<SearchResultsModel | null>(null);
  const [status, setStatus] = React.useState<SearchStatus>('idle');
  const [retrySeed, setRetrySeed] = React.useState(0);
  // « Parcourir » : le catalogue de genres local (data/genres) alimente des
  // raccourcis de RECHERCHE. Toucher un genre remplit le champ et déclenche
  // exactement la même requête qu'une saisie manuelle — aucun second système
  // de recherche, aucun écran factice.
  const [genres, setGenres] = React.useState<BrowseCategoryModel[]>([]);

  React.useEffect(() => {
    let disposed = false;

    getBrowseCategories()
      .then((loaded) => {
        if (!disposed) {
          setGenres(loaded);
        }
      })
      .catch(() => {
        // Catalogue statique local : un échec ici n'a aucun sens métier. On
        // masque simplement la section plutôt que d'afficher une erreur.
        if (!disposed) {
          setGenres([]);
        }
      });

    return () => {
      disposed = true;
    };
  }, []);

  React.useEffect(() => {
    const q = query.trim();

    if (!q) {
      setResults(null);
      setStatus('idle');
      return;
    }

    let isCancelled = false;
    setStatus('loading');

    const timeout = setTimeout(async () => {
      try {
        const data = await searchCatalog(q);

        if (!isCancelled) {
          setResults(data);
          setStatus('done');
        }
      } catch {
        if (!isCancelled) {
          setResults(null);
          setStatus('error');
        }
      }
    }, SEARCH_DELAY_MS);

    return () => {
      isCancelled = true;
      clearTimeout(timeout);
    };
  }, [query, retrySeed]);

  const player = usePlayer();
  const [actionTrack, setActionTrack] = React.useState<PlayerTrack | null>(
    null
  );

  // Tracks of the catalog play immediately (metadata → Audius stream).
  // I-2 : album + durée du résultat voyagent dans le PlayerTrack jusqu'au
  // matcher — le badge de disponibilité et la lecture matchent à l'identique.
  const handleTrackPress = React.useCallback(
    (track: {
      id: string;
      title: string;
      subtitle?: string;
      imageURL?: string;
      durationMs?: number | null;
      albumName?: string | null;
      isrc?: string | null;
    }) => {
      const queueId = queueIdForTrackId(track.id);

      if (player.current?.id === queueId) {
        void player.togglePlayPause();
        return;
      }

      const playable = (results?.tracks ?? []).filter(({ id }) => Boolean(id));
      const startIndex = playable.findIndex(({ id }) => id === track.id);

      if (startIndex < 0) {
        return;
      }

      void player.playQueue(
        playable.map(
          ({
            id,
            title,
            subtitle,
            imageURL,
            albumName,
            durationMs,
            isrc,
            explicit,
          }) => ({
            id: queueIdForTrackId(id),
            title,
            artists: artistsFromSubtitle(subtitle),
            album: albumName ?? null,
            durationMillis: durationMs ?? null,
            isrc: isrc ?? null,
            // Classification de version : sans elle la porte content-rating du
            // matcher reste muette (upload clean servi pour une demande
            // explicite). Neutre quand la source ne la publie pas.
            explicit: explicit ?? null,
            imageURL: imageURL ?? '',
            source: sourceForTrackId(id),
          })
        ),
        startIndex
      );
    },
    [player, results]
  );

  // Appui long sur un résultat « Titre » : menu « Ajouter à la file » /
  // « Lire ensuite » — geste Spotify habituel, composant partagé.
  const handleTrackLongPress = React.useCallback(
    (track: {
      id: string;
      title: string;
      subtitle?: string;
      imageURL?: string;
      durationMs?: number | null;
      albumName?: string | null;
      isrc?: string | null;
      explicit?: boolean | null;
    }) => {
      if (!track.id) {
        return;
      }

      setActionTrack({
        id: queueIdForTrackId(track.id),
        title: track.title,
        artists: artistsFromSubtitle(track.subtitle),
        album: track.albumName ?? null,
        durationMillis: track.durationMs ?? null,
        isrc: track.isrc ?? null,
        explicit: track.explicit ?? null,
        imageURL: track.imageURL ?? '',
        source: sourceForTrackId(track.id),
      });
    },
    []
  );

  // Navigation réelle depuis chaque type de résultat. Les routes existent
  // déjà (app/(tabs)/search/{artist,album,playlist}/[id].tsx) : un résultat
  // de recherche ouvre donc la VRAIE page, jamais un cul-de-sac.
  // Un genre n'est pas une page : c'est une RECHERCHE pré-remplie.
  const handleGenrePress = React.useCallback((title: string) => {
    setQuery(title);
  }, []);

  const openArtist = React.useCallback(
    (slide: LibraryItemModel) => {
      router.push(`/search/artist/${encodeURIComponent(slide.id)}`);
    },
    [router]
  );

  const openAlbum = React.useCallback(
    (slide: LibraryItemModel) => {
      router.push(`/search/album/${encodeURIComponent(slide.id)}`);
    },
    [router]
  );

  const openPlaylist = React.useCallback(
    (slide: LibraryItemModel) => {
      router.push(`/search/playlist/${encodeURIComponent(slide.id)}`);
    },
    [router]
  );

  const sections = results
    ? [
        {
          key: 'artists',
          title: translations.type.artists,
          slides: results.artists,
          shape: Shapes.CIRCLE,
          onSlidePress: openArtist,
        },
        {
          key: 'tracks',
          title: translations.songs,
          slides: results.tracks,
          shape: Shapes.SQUARE_BORDER,
          onSlidePress: handleTrackPress,
          onSlideLongPress: handleTrackLongPress,
        },
        {
          key: 'albums',
          title: translations.type.albums,
          slides: results.albums,
          shape: Shapes.SQUARE_BORDER,
          onSlidePress: openAlbum,
        },
        {
          key: 'playlists',
          title: translations.type.playlists,
          slides: results.playlists,
          shape: Shapes.SQUARE_BORDER,
          onSlidePress: openPlaylist,
        },
      ].filter(({ slides }) => slides.length > 0)
    : [];

  return (
    <View
      style={[
        styles.container,
        { width, height: height - BOTTOM_NAVIGATION_HEIGHT - HEADER_HEIGHT },
      ]}
    >
      <View style={styles.searchBar}>
        <FontAwesome name="search" size={16} color={COLORS.PRIMARY} />
        <TextInput
          value={query}
          onChangeText={setQuery}
          placeholder={translations.searchPlaceholder}
          placeholderTextColor={COLORS.GREY}
          autoCapitalize="none"
          autoCorrect={false}
          returnKeyType="search"
          clearButtonMode="while-editing"
          style={styles.searchInput}
          accessibilityLabel={translations.searchPlaceholder}
        />
      </View>

      <ScrollView
        style={styles.results}
        contentContainerStyle={styles.resultsContent}
        keyboardShouldPersistTaps="handled"
      >
        {status === 'idle' && (
          <Text style={styles.message}>{translations.searchHint}</Text>
        )}
        {status === 'idle' && genres.length > 0 && (
          <View style={styles.browseSection} testID="search-browse">
            <Text style={styles.browseTitle}>{translations.browseAll}</Text>
            <View style={styles.browseChips}>
              {genres.map((genre) => (
                <Pressable
                  accessibilityRole="button"
                  key={genre.id}
                  onPress={() => handleGenrePress(genre.title)}
                  style={({ pressed }) => [
                    styles.browseChip,
                    pressed && styles.browseChipPressed,
                  ]}
                  testID={`search-browse-${genre.id}`}
                >
                  <Text style={styles.browseChipText}>{genre.title}</Text>
                </Pressable>
              ))}
            </View>
          </View>
        )}
        {status === 'loading' && (
          <ActivityIndicator color={COLORS.TINT} style={styles.loader} />
        )}
        {status === 'error' && (
          <View style={styles.errorState} testID="search-error-state">
            <Text style={styles.message}>{translations.searchError}</Text>
            <Pressable
              accessibilityRole="button"
              onPress={() => setRetrySeed((seed) => seed + 1)}
              style={styles.retryButton}
              testID="search-retry"
            >
              <Text style={styles.retryText}>{translations.homeRetry}</Text>
            </Pressable>
          </View>
        )}
        {status === 'done' && results?.degraded && (
          <Text style={styles.degradedNotice} testID="search-degraded-notice">
            {translations.searchDegraded}
          </Text>
        )}
        {status === 'done' && sections.length === 0 && (
          <Text style={styles.message}>
            {translations.searchNoResults(query.trim())}
          </Text>
        )}
        {status === 'done' &&
          sections.map(
            ({ key, title, slides, shape, onSlidePress, onSlideLongPress }) => (
              <Slider
                key={key}
                title={title}
                slides={slides}
                size={Sizes.MEDIUM}
                shape={shape}
                withShowAll={false}
                onSlidePress={onSlidePress}
                onSlideLongPress={onSlideLongPress}
              />
            )
          )}
      </ScrollView>

      <QueueActionMenu
        onClose={() => setActionTrack(null)}
        track={actionTrack}
        visible={Boolean(actionTrack)}
      />
    </View>
  );
};
