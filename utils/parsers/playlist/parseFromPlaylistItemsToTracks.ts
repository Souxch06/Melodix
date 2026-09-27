import { PlaylistItemResponseType } from '@config';
import { TrackModel } from '@models';

export const parseFromPlaylistItemsToTracks = (
  items: PlaylistItemResponseType[]
): TrackModel[] =>
  items.reduce<TrackModel[]>((tracks, entry) => {
    // `item` since the February 2026 Web API update, `track` before.
    const track = entry?.item ?? entry?.track;

    // Skip unavailable and local items (no Spotify ID).
    if (!track?.id) {
      return tracks;
    }

    tracks.push({
      id: track.id,
      title: track.name,
      subtitle: (track.artists ?? []).map((artist) => artist.name).join(', '),
      imageURL: track.album?.images?.[0]?.url || '',
      explicit: Boolean(track.explicit),
    });

    return tracks;
  }, []);
