import { PlaylistResponseType, SEPARATOR } from '@config';
import { translations } from '@data';
import { PlaylistModel } from '@models';
import { getDisplayTime } from '../../common';

export const parseToPlaylist = ({
  type,
  id,
  name,
  description,
  owner,
  followers,
  items,
  tracks,
  images,
}: PlaylistResponseType): PlaylistModel => {
  // February 2026 Web API: `tracks` was renamed to `items` and is only
  // returned for playlists the user owns or collaborates on.
  const content = items ?? tracks;
  const durationMs = (content?.items ?? []).reduce(
    (total, entry) => total + ((entry.item ?? entry.track)?.duration_ms ?? 0),
    0
  );
  const info = [
    typeof followers?.total === 'number'
      ? `${followers.total.toLocaleString()} ${translations.saves}`
      : '',
    durationMs > 0 ? getDisplayTime(durationMs) : '',
  ]
    .filter(Boolean)
    .join(` ${SEPARATOR} `);

  return {
    type: type,
    id: id,
    title: name,
    description: description,
    subtitle: owner?.display_name ?? '',
    ownerId: owner?.id ?? '',
    info,
    imageURL: images?.[0]?.url ?? '',
    tracks: { total: content?.total ?? 0 },
  };
};
