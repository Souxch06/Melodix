import { LibraryItemModel } from '@models';

import { audiusTrackToLibraryItem, getAudiusTrendingTracks } from '../audius';
import {
  backendGetArtist,
  backendGetTrack,
  backendSearchTracks,
  dtoTrackToLibraryItem,
} from '../backend';

const MAX_RECOMMENDATIONS = 10;

const dedupeById = (items: LibraryItemModel[]): LibraryItemModel[] => {
  const seen = new Set<string>();
  return items.filter((item) => {
    if (seen.has(item.id)) {
      return false;
    }
    seen.add(item.id);
    return true;
  });
};

/**
 * Recommandations « autour de » une seed artiste/morceau.
 *
 * Sans compte, Melodix ne peut plus appeler /recommendations de Spotify :
 * la stratégie devient explicable et déterministe —
 *   1. seed morceau : rechercher « titre + artiste résolus » dans le catalogue ;
 *   2. seed artiste : rechercher le NOM d'artiste dans le catalogue ;
 *   3. repli universel : tendances Audius.
 * Jamais d'exception vers l'UI : en cas d'échec, la section affiche le repli.
 */
export const getRecommendations = async ({
  artistSeed = '',
  tracksSeed = '',
  genresSeed = '',
}: {
  artistSeed?: string;
  tracksSeed?: string;
  genresSeed?: string;
}): Promise<LibraryItemModel[]> => {
  void genresSeed; // plus de seed genres sans compte : conservé pour la signature

  const collects: LibraryItemModel[] = [];

  try {
    if (tracksSeed) {
      const track = await backendGetTrack(tracksSeed);
      const mainArtist = track.artists[0] ?? '';
      const query = `${track.title} ${mainArtist}`.trim();
      if (query) {
        collects.push(
          ...(await backendSearchTracks(query, MAX_RECOMMENDATIONS + 1))
            .filter((dto) => dto.id !== tracksSeed)
            .map(dtoTrackToLibraryItem)
        );
      }
    }

    if (artistSeed) {
      if (artistSeed.startsWith('local-artist:')) {
        const name = artistSeed
          .slice('local-artist:'.length)
          .replace(/-/g, ' ')
          .trim();
        if (name) {
          collects.push(
            ...(await backendSearchTracks(name, MAX_RECOMMENDATIONS)).map(
              dtoTrackToLibraryItem
            )
          );
        }
      } else {
        try {
          const artist = await backendGetArtist(artistSeed);
          if (artist.topTracks?.length) {
            collects.push(...artist.topTracks.map(dtoTrackToLibraryItem));
          } else if (artist.name) {
            collects.push(
              ...(await backendSearchTracks(artist.name, MAX_RECOMMENDATIONS)).map(
                dtoTrackToLibraryItem
              )
            );
          }
        } catch {
          // Seed catalogue introuvable : le repli global prendra le relais.
        }
      }
    }
  } catch (error) {
    console.warn('Recommandations catalogue indisponibles', error);
  }

  const result = dedupeById(collects).slice(0, MAX_RECOMMENDATIONS);
  if (result.length > 0) {
    return result;
  }

  // Repli universel : tendances Audius (catalogue direct, sans compte).
  const trending = await getAudiusTrendingTracks(MAX_RECOMMENDATIONS);
  return trending.map(audiusTrackToLibraryItem);
};
