import { AlbumModel } from '@models';
import { isSpotifySessionActive, SpotifyApiError } from '@services';

import { backendGetAlbum } from '../backend';
import { getSpotifyAlbum } from '../spotify/album';

/**
 * Métadonnées d'album — cascade session Spotify → backend Melodix.
 *
 * Même contrat que api/playlists/playlist.ts : la session du compte fournit
 * l'album COMPLET (titres réels, durées, ISRC, copyrights, label) ; le
 * backend Melodix, qui ne sert qu'un sous-ensemble, reste le repli. Les
 * champs que la source publique ne fournit pas (label, copyrights) sont
 * renvoyés vides — l'écran album n'en dépend pas pour fonctionner.
 */
export const getAlbum = async (albumId: string): Promise<AlbumModel> => {
  if (await isSpotifySessionActive()) {
    try {
      return await getSpotifyAlbum(albumId);
    } catch (error) {
      if (
        error instanceof SpotifyApiError &&
        error.kind === 'unauthenticated'
      ) {
        throw error; // session morte : l'écran affichera la reconnexion
      }
      // Cause EXPLICITE du repli (404 = contenu non servi pour ce compte ;
      // réseau/serveur sinon) — jamais d'écran vide muet.
      console.warn(
        'Album via session indisponible (repli backend) : %s',
        error instanceof SpotifyApiError ? error.kind : typeof error
      );
    }
  }

  try {
    const dto = await backendGetAlbum(albumId);
    const tracks = dto.tracks ?? [];

    return {
      id: dto.id,
      type: 'album',
      albumType: 'album',
      name: dto.title,
      imageURL: dto.coverUrl ?? '',
      artists: [],
      releaseDate: dto.releaseDate ?? '',
      tracks: {
        total: tracks.length,
        items: tracks.map((track) => ({
          id: track.id,
          title: track.title,
          subtitle: track.artists.join(', '),
          imageURL: track.coverUrl ?? dto.coverUrl ?? undefined,
          // Métadonnées de matching (I-2) : la durée vient de la source ;
          // l'album est celui-ci par construction.
          durationMs: track.durationMs ?? null,
          albumName: dto.title,
        })),
      },
      duration: tracks.reduce(
        (total, track) => total + (track.durationMs ?? 0),
        0
      ),
      copyrights: [],
      genres: [],
      label: '',
    };
  } catch (error) {
    console.error(
      `Erreur lors de la récupération de l'album : ${albumId}`,
      error
    );
    throw error;
  }
};
