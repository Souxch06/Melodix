import * as React from 'react';
import {
  ActivityIndicator,
  ScrollView,
  Text,
  TextInput,
  View,
} from 'react-native';
import FontAwesome from '@expo/vector-icons/FontAwesome';

import { searchCatalog } from '@api';
import { SearchResultsModel } from '@models';
import { useApplicationDimensions } from '@hooks';
import {
  BOTTOM_NAVIGATION_HEIGHT,
  COLORS,
  HEADER_HEIGHT,
  Shapes,
  Sizes,
} from '@config';
import { translations } from '@data';
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
  const [query, setQuery] = React.useState('');
  const [results, setResults] = React.useState<SearchResultsModel | null>(null);
  const [status, setStatus] = React.useState<SearchStatus>('idle');

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
  }, [query]);

  const player = usePlayer();
  const [actionTrack, setActionTrack] = React.useState<PlayerTrack | null>(
    null
  );

  // Tracks of the catalog play immediately (metadata → Audius stream).
  const handleTrackPress = React.useCallback(
    (track: {
      id: string;
      title: string;
      subtitle?: string;
      imageURL?: string;
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
        playable.map(({ id, title, subtitle, imageURL }) => ({
          id: queueIdForTrackId(id),
          title,
          artists: subtitle ? subtitle.split(', ').filter(Boolean) : [],
          imageURL: imageURL ?? '',
          source: sourceForTrackId(id),
        })),
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
    }) => {
      if (!track.id) {
        return;
      }

      setActionTrack({
        id: queueIdForTrackId(track.id),
        title: track.title,
        artists: track.subtitle
          ? track.subtitle.split(', ').filter(Boolean)
          : [],
        imageURL: track.imageURL ?? '',
        source: sourceForTrackId(track.id),
      });
    },
    []
  );

  const sections = results
    ? [
        {
          key: 'artists',
          title: translations.type.artists,
          slides: results.artists,
          shape: Shapes.CIRCLE,
          onSlidePress: undefined,
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
          onSlidePress: undefined,
        },
        {
          key: 'playlists',
          title: translations.type.playlists,
          slides: results.playlists,
          shape: Shapes.SQUARE_BORDER,
          onSlidePress: undefined,
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
        {status === 'loading' && (
          <ActivityIndicator color={COLORS.TINT} style={styles.loader} />
        )}
        {status === 'error' && (
          <Text style={styles.message}>{translations.searchError}</Text>
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
