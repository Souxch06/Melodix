import { AlbumTypes, SearchResponseType, SEPARATOR } from '@config';
import { translations } from '@data';
import { SearchResultsModel } from '@models';

const firstImage = (images?: { url: string | null }[] | null) =>
  images?.[0]?.url ?? '';

const artistNames = (artists?: { name: string }[]) =>
  (artists ?? []).map((artist) => artist.name).join(', ');

const isPresent = <T>(value: T | null | undefined): value is T =>
  value !== null && value !== undefined;

export const parseSearchResults = ({
  artists,
  tracks,
  albums,
  playlists,
}: SearchResponseType): SearchResultsModel => ({
  artists: (artists?.items ?? []).filter(isPresent).map((artist) => ({
    id: artist.id,
    type: 'artist',
    title: artist.name,
    subtitle: translations.type.artist,
    imageURL: firstImage(artist.images),
  })),
  // The app has no track page: a song opens its album.
  tracks: (tracks?.items ?? []).filter(isPresent).map((track) => ({
    id: track.album.id,
    type: 'album',
    title: track.name,
    subtitle: artistNames(track.artists),
    imageURL: firstImage(track.album.images),
  })),
  albums: (albums?.items ?? []).filter(isPresent).map((album) => {
    const names = artistNames(album.artists);
    const albumType =
      translations.type[album.album_type as AlbumTypes] ??
      translations.type.album;

    return {
      id: album.id,
      type: 'album',
      title: album.name,
      subtitle:
        album.album_type === AlbumTypes.ALBUM
          ? names
          : `${albumType} ${SEPARATOR} ${names}`,
      imageURL: firstImage(album.images),
    };
  }),
  // Search results can contain `null` playlists.
  playlists: (playlists?.items ?? []).filter(isPresent).map((playlist) => ({
    id: playlist.id,
    type: 'playlist',
    title: playlist.name,
    subtitle: playlist.owner?.display_name ?? translations.type.playlist,
    imageURL: firstImage(playlist.images),
  })),
});
