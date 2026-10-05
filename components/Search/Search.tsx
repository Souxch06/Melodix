import * as React from 'react';
import {
  ActivityIndicator,
  Keyboard,
  KeyboardAvoidingView,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import type { TextInput } from 'react-native';
import { useRouter } from 'expo-router';

import { getBrowseCategories, searchCatalog } from '@api';
import type {
  BrowseCategoryModel,
  LibraryItemModel,
  SearchResultsModel,
} from '@models';
import { COLORS, PALETTE, SECTION_LABEL, SPACING, TYPOGRAPHY } from '@config';
import { translations } from '@data';
import { artistsFromSubtitle } from '@models';
import { usePlayer } from '@context';
import { queueIdForTrackId, sourceForTrackId } from '@services';
import type { PlayerTrack } from '@services';

import { QueueActionMenu } from '../Player/QueueActionMenu';

import { SearchBar } from './SearchBar';
import { RecentSearches } from './RecentSearches';
import { SearchResultRow } from './SearchResultRow';
import { useRecentSearches } from './useRecentSearches';

type SearchStatus = 'idle' | 'loading' | 'done' | 'error';

// Wait for the user to stop typing before calling the API.
export const SEARCH_DELAY_MS = 400;

/**
 * RECHERCHE — écran refondu.
 *
 * Ce qui change par rapport à la version précédente, et pourquoi :
 *
 *  1. Géométrie : le conteneur était `height - BOTTOM_NAVIGATION_HEIGHT -
 *     HEADER_HEIGHT` en PIXELS FIXES. Impossible à suivre quand la fenêtre se
 *     redimensionne (clavier, rotation). Il est désormais `flex: 1` : la
 *     hauteur vient du système, pas d'un calcul.
 *  2. Clavier : `KeyboardAvoidingView` (comportement iOS uniquement — Android
 *     s'appuie sur `softwareKeyboardLayoutMode: 'resize'` déclaré dans
 *     app.config.js) + masquage de la barre d'onglets pendant la saisie
 *     (app/(tabs)/_layout.tsx). Plus rien ne recouvre les résultats.
 *  3. Barre : icône, bouton retour, bouton « effacer », auto-focus
 *     contextualisé, cibles tactiles ≥ 44 dp.
 *  4. Historique : recherches récentes persistées localement (AsyncStorage,
 *     aucune base de données), suppression individuelle et « tout effacer ».
 *  5. Résultats GROUPÉS : Top résultat / Morceaux / Artistes / Albums /
 *     Playlists, avec pochette, titre, artiste, album, année, propriétaire,
 *     badge explicit et menu « … ».
 *  6. Debounce + annulation des réponses périmées : une réponse TARDIVE d'une
 *     ancienne requête n'écrase JAMAIS les résultats de la nouvelle.
 *
 * Ce qui ne change PAS : la cascade de sources (Spotify → backend → Audius),
 * le moteur de matching, la lecture, le menu de file. Il n'y a qu'UN seul
 * système de recherche.
 */
export type SearchProps = {
  /**
   * Auto-focus du champ à l'ouverture. Vrai UNIQUEMENT quand l'utilisateur
   * arrive depuis la loupe de l'accueil (`/(tabs)/search?focus=1`) : ouvrir
   * l'onglet Recherche doit rester une navigation normale, où l'on peut
   * parcourir les genres sans voir le clavier s'ouvrir.
   */
  autoFocus?: boolean;
};

export const Search = ({ autoFocus = false }: SearchProps = {}) => {
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
  const inputRef = React.useRef<TextInput>(null);
  const scrollRef = React.useRef<ScrollView | null>(null);

  const recent = useRecentSearches();

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

        // Garde anti-résultat périmé : une réponse TARDIVE d'une ancienne
        // requête ne doit jamais écraser celle de la requête courante.
        if (!isCancelled) {
          setResults(data);
          setStatus('done');
          recent.add(q);
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
    // `recent.add` est stable (useCallback sans dépendance) : l'inclure
    // relancerait la recherche à chaque rendu.
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
      explicit?: boolean | null;
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

  // Appui long sur un résultat « Morceau » : menu « Ajouter à la file » /
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

  /**
   * Bouton « effacer » : le champ se vide, les résultats et la requête EN VOL
   * sont annulés (le nettoyage de l'effet fait le reste), et le champ reprend
   * le focus — l'utilisateur veut corriger sa saisie, pas perdre sa place.
   */
  const handleClearField = React.useCallback(() => {
    setQuery('');
    setResults(null);
    setStatus('idle');
    inputRef.current?.focus();
  }, []);

  const handleRecentSelect = React.useCallback((entry: string) => {
    setQuery(entry);
  }, []);

  const handleSubmit = React.useCallback(() => {
    const q = query.trim();
    if (q) {
      recent.add(q);
    }
    // Validation clavier : on referme le clavier ET on retire le focus. La
    // barre d onglets revient alors (app/(tabs)/_layout.tsx) et le layout
    // reprend sa hauteur normale.
    inputRef.current?.blur();
    Keyboard.dismiss();
  }, [query, recent]);

  /**
   * Résultats GROUPÉS. L'ordre suit la spécification : Top résultat, puis
   * Morceaux, Artistes, Albums, Playlists. Une section vide n'est pas rendue.
   */
  /**
   * Le « Top résultat » est RETIRÉ de sa propre section typée : un même
   * morceau ne s'affiche pas deux fois à l'écran. La lecture n'est pas
   * affectée — `handleTrackPress` retrouve l'index dans la liste COMPLÈTE des
   * morceaux du catalogue, pas dans ce qui est affiché.
   */
  const topResultId = React.useMemo(() => {
    if (!results) {
      return null;
    }
    if (results.tracks.length) {
      return results.tracks[0].id;
    }
    if (results.artists.length) {
      return results.artists[0].id;
    }
    if (results.albums.length) {
      return results.albums[0].id;
    }
    if (results.playlists.length) {
      return results.playlists[0].id;
    }
    return null;
  }, [results]);

  const sections = React.useMemo(() => {
    if (!results) {
      return [];
    }

    const withoutTop = (slides: LibraryItemModel[]) =>
      topResultId ? slides.filter((slide) => slide.id !== topResultId) : slides;

    return [
      {
        key: 'tracks',
        title: translations.searchSectionSongs,
        slides: withoutTop(results.tracks),
        variant: 'track' as const,
        onSlidePress: handleTrackPress,
        onSlideLongPress: handleTrackLongPress,
      },
      {
        key: 'artists',
        title: translations.searchSectionArtists,
        slides: withoutTop(results.artists),
        variant: 'artist' as const,
        onSlidePress: openArtist,
      },
      {
        key: 'albums',
        title: translations.searchSectionAlbums,
        slides: withoutTop(results.albums),
        variant: 'album' as const,
        onSlidePress: openAlbum,
      },
      {
        key: 'playlists',
        title: translations.searchSectionPlaylists,
        slides: withoutTop(results.playlists),
        variant: 'playlist' as const,
        onSlidePress: openPlaylist,
      },
    ].filter(({ slides }) => slides.length > 0);
  }, [
    results,
    topResultId,
    handleTrackPress,
    handleTrackLongPress,
    openArtist,
    openAlbum,
    openPlaylist,
  ]);

  /**
   * « Top résultat » = le premier morceau, à défaut le premier artiste,
   * album ou playlist. Jamais inventé : c'est toujours un vrai résultat.
   */
  const topResult = React.useMemo(() => {
    if (!results) {
      return null;
    }

    if (results.tracks.length) {
      return {
        variant: 'track' as const,
        item: results.tracks[0],
        onPress: () => handleTrackPress(results.tracks[0]),
        onLongPress: () => handleTrackLongPress(results.tracks[0]),
      };
    }

    if (results.artists.length) {
      return {
        variant: 'artist' as const,
        item: results.artists[0],
        onPress: () => openArtist(results.artists[0]),
      };
    }

    if (results.albums.length) {
      return {
        variant: 'album' as const,
        item: results.albums[0],
        onPress: () => openAlbum(results.albums[0]),
      };
    }

    if (results.playlists.length) {
      return {
        variant: 'playlist' as const,
        item: results.playlists[0],
        onPress: () => openPlaylist(results.playlists[0]),
      };
    }

    return null;
  }, [
    results,
    handleTrackPress,
    handleTrackLongPress,
    openArtist,
    openAlbum,
    openPlaylist,
  ]);

  const hasResults = sections.length > 0;

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      style={styles.container}
    >
      <SearchBar
        autoFocus={autoFocus}
        inputRef={inputRef}
        onClear={handleClearField}
        onChangeText={setQuery}
        onSubmit={handleSubmit}
        showBackButton={autoFocus}
        onBack={() => router.back()}
        testID="search-input"
        value={query}
      />

      <ScrollView
        contentContainerStyle={styles.resultsContent}
        keyboardDismissMode="on-drag"
        keyboardShouldPersistTaps="handled"
        ref={scrollRef}
        style={styles.results}
      >
        {status === 'idle' && (
          <Text style={styles.message}>{translations.searchHint}</Text>
        )}

        {status === 'idle' && (
          <RecentSearches
            entries={recent.entries}
            onClearAll={recent.clear}
            onRemove={recent.remove}
            onSelect={handleRecentSelect}
          />
        )}

        {status === 'idle' && genres.length > 0 && (
          <View style={styles.browseSection} testID="search-browse">
            <Text style={styles.browseTitle}>{translations.browseAll}</Text>
            <View style={styles.browseChips}>
              {genres.map((genre) => (
                <Pressable
                  accessibilityLabel={`Rechercher ${genre.title}`}
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
          <View style={styles.loadingState} testID="search-loading">
            <ActivityIndicator color={PALETTE.violet400} />
            <Text style={styles.loadingText}>{translations.searchLoading}</Text>
          </View>
        )}

        {status === 'error' && (
          <View style={styles.errorState} testID="search-error-state">
            <Text style={styles.message}>{translations.searchError}</Text>
            <Pressable
              accessibilityLabel="Relancer la recherche"
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

        {status === 'done' && !hasResults && (
          <Text style={styles.message} testID="search-no-results">
            {translations.searchNoResults(query.trim())}
          </Text>
        )}

        {status === 'done' && topResult && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>
              {translations.searchTopResult}
            </Text>
            <SearchResultRow
              explicit={topResult.item.explicit}
              featured
              id={topResult.item.id}
              imageURL={topResult.item.imageURL}
              meta={metaOf(topResult.item)}
              onLongPress={topResult.onLongPress}
              onPress={topResult.onPress}
              subtitle={subtitleOf(topResult.item)}
              title={topResult.item.title}
              variant={topResult.variant}
            />
          </View>
        )}

        {status === 'done' &&
          sections.map(
            ({
              key,
              title,
              slides,
              variant,
              onSlidePress,
              onSlideLongPress,
            }) => (
              <View key={key} style={styles.section}>
                <Text style={styles.sectionTitle}>{title}</Text>
                {slides.map((slide, index) => (
                  <SearchResultRow
                    explicit={slide.explicit}
                    id={slide.id}
                    imageURL={slide.imageURL}
                    key={`${key}-${slide.id}-${index}`}
                    meta={metaOf(slide)}
                    onLongPress={
                      onSlideLongPress
                        ? () => onSlideLongPress(slide as never)
                        : undefined
                    }
                    onPress={() => onSlidePress(slide as never)}
                    subtitle={subtitleOf(slide)}
                    title={slide.title}
                    variant={variant}
                  />
                ))}
              </View>
            )
          )}
      </ScrollView>

      <QueueActionMenu
        onClose={() => setActionTrack(null)}
        track={actionTrack}
        visible={Boolean(actionTrack)}
      />
    </KeyboardAvoidingView>
  );
};

/** Sous-titre affiché selon le type de résultat. */
const subtitleOf = (item: LibraryItemModel): string => {
  if (item.type === 'track') {
    return item.subtitle || '';
  }

  if (item.type === 'artist') {
    return '';
  }

  return item.subtitle || '';
};

/** Troisième ligne : année d'album, propriétaire de playlist, rien sinon. */
const metaOf = (item: LibraryItemModel): string | undefined => {
  if (item.type === 'playlist') {
    return item.subtitle || undefined;
  }

  return undefined;
};

const styles = StyleSheet.create({
  // Conteneur en FLUX : la hauteur vient du système (fenêtre redimensionnée
  // par `softwareKeyboardLayoutMode: 'resize'`), jamais d'un calcul en pixels.
  container: {
    backgroundColor: PALETTE.night900,
    flex: 1,
  },
  results: {
    flex: 1,
  },
  resultsContent: {
    paddingBottom: SPACING.xxxl,
  },
  message: {
    color: COLORS.LIGHT_GREY,
    fontSize: 14,
    lineHeight: 20,
    marginTop: SPACING.xxl,
    paddingHorizontal: SPACING.xxxl,
    textAlign: 'center',
  },
  loadingState: {
    alignItems: 'center',
    gap: SPACING.md,
    paddingTop: SPACING.huge,
  },
  loadingText: {
    color: COLORS.GREY,
    fontSize: 13,
  },
  degradedNotice: {
    color: COLORS.LIGHT_GREY,
    fontSize: 13,
    lineHeight: 18,
    marginBottom: SPACING.sm,
    paddingHorizontal: SPACING.xl,
  },
  errorState: {
    alignItems: 'center',
  },
  retryButton: {
    backgroundColor: COLORS.WHITE,
    borderRadius: 22,
    marginTop: SPACING.lg,
    paddingHorizontal: SPACING.xl,
    paddingVertical: SPACING.sm,
  },
  retryText: {
    color: PALETTE.night900,
    fontSize: 14,
    fontWeight: '700',
  },
  section: {
    marginTop: SPACING.xl,
  },
  sectionTitle: {
    ...SECTION_LABEL,
    marginBottom: SPACING.xs,
    paddingHorizontal: SPACING.lg,
  },
  // « Parcourir » : raccourcis de recherche par genre (état idle).
  browseSection: {
    marginTop: SPACING.xxl,
    paddingHorizontal: SPACING.lg,
  },
  browseTitle: {
    ...TYPOGRAPHY.heading,
    color: COLORS.WHITE,
    marginBottom: SPACING.md,
  },
  browseChips: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: SPACING.sm,
  },
  browseChip: {
    backgroundColor: PALETTE.night600,
    borderRadius: 20,
    paddingHorizontal: SPACING.lg,
    paddingVertical: SPACING.sm,
  },
  browseChipPressed: {
    backgroundColor: PALETTE.violet700,
  },
  browseChipText: {
    color: COLORS.WHITE,
    fontSize: 13,
    fontWeight: '600',
  },
});

export default Search;
