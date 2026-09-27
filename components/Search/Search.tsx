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
      } catch (error) {
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

  const sections = results
    ? [
        {
          key: 'artists',
          title: translations.type.artists,
          slides: results.artists,
          shape: Shapes.CIRCLE,
        },
        {
          key: 'tracks',
          title: translations.songs,
          slides: results.tracks,
          shape: Shapes.SQUARE_BORDER,
        },
        {
          key: 'albums',
          title: translations.type.albums,
          slides: results.albums,
          shape: Shapes.SQUARE_BORDER,
        },
        {
          key: 'playlists',
          title: translations.type.playlists,
          slides: results.playlists,
          shape: Shapes.SQUARE_BORDER,
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
          sections.map(({ key, title, slides, shape }) => (
            <Slider
              key={key}
              title={title}
              slides={slides}
              size={Sizes.MEDIUM}
              shape={shape}
              withShowAll={false}
            />
          ))}
      </ScrollView>
    </View>
  );
};
