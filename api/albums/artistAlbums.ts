import { LibraryItemModel } from '@models';

import { backendGetArtist, backendSearchAlbums } from '../backend';

/**
 * Discographie d'un artiste.
 *
 * Source primaire : métadonnées d'artiste du backend (champ `albums`, souvent
 * absent de l'embed public). Repli : recherche catalogue « nom d'artiste »
 * dédiée albums — la section reste utile même quand la fiche artiste est
 * minimale. Jamais d'erreur vers l'UI : une section vide s'affiche.
 */
export const getArtistAlbums = async (
  artistId: string,
  includeGroups: string = 'album,single,appears_on,compilation',
  limit: number = 6,
  offset: number = 0
): Promise<LibraryItemModel[]> => {
  void includeGroups; // conservé pour compatibilité de signature
  void offset;

  try {
    const artist = await backendGetArtist(artistId);
    if (artist.albums && artist.albums.length > 0) {
      return artist.albums.slice(0, limit).map((album) => ({
        id: album.id,
        type: 'album',
        title: album.title,
        subtitle: album.artists.join(', ') || artist.name,
        imageURL: album.coverUrl ?? '',
      }));
    }

    // Repli : recherche albums par nom d'artiste.
    if (artist.name) {
      const albums = await backendSearchAlbums(artist.name, limit);
      return albums.map((album) => ({
        id: album.id,
        type: 'album',
        title: album.title,
        subtitle: album.artists.join(', '),
        imageURL: album.coverUrl ?? '',
      }));
    }

    return [];
  } catch (error) {
    console.warn(
      `Albums de l'artiste ${artistId} indisponibles (section vide)`,
      error
    );
    return [];
  }
};
