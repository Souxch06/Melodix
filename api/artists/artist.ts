import { ArtistModel } from '@models';
import { isSpotifySessionActive, SpotifyApiError } from '@services';

import {
  backendGetArtist,
  dtoAlbumToLibraryItem,
  dtoTrackToTrackModel,
} from '../backend';
import { getSpotifyArtist } from '../spotify/artist';

/**
 * Métadonnées d'artiste — cascade session Spotify → backend Melodix.
 *
 * Même contrat que api/playlists/playlist.ts : la session du compte fournit
 * la fiche complète (image, top titres réels, discographie paginée) ; le
 * backend Melodix reste le repli.
 */
export const getArtist = async (artistId: string): Promise<ArtistModel> => {
  if (await isSpotifySessionActive()) {
    try {
      return await getSpotifyArtist(artistId);
    } catch (error) {
      if (
        error instanceof SpotifyApiError &&
        error.kind === 'unauthenticated'
      ) {
        throw error; // session morte : l'écran affichera la reconnexion
      }
      console.warn(
        'Artiste via session indisponible (repli backend) : %s',
        error instanceof SpotifyApiError ? error.kind : typeof error
      );
    }
  }

  try {
    const dto = await backendGetArtist(artistId);
    return {
      type: 'artist',
      id: dto.id,
      name: dto.name,
      imageURL: dto.imageUrl ?? '',
      topTracks: (dto.topTracks ?? []).map(dtoTrackToTrackModel),
      albums: (dto.albums ?? []).map(dtoAlbumToLibraryItem),
    };
  } catch (error) {
    console.error(
      `Erreur lors de la récupération de l'artiste : ${artistId}`,
      error
    );
    throw error;
  }
};
