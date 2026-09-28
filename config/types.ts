export type ExpoConfigType = {
  extra: { [key: string]: string };
};

type ImageType = {
  url: string;
  height: number;
  width: number;
};

export type AlbumResponseType = {
  id: string;
  type: 'album';
  album_type: 'album' | 'single' | 'compilation';
  name: string;
  images: ImageType[];
  artists: {
    type: 'artist';
    name: string;
    id: string;
  }[];
  release_date: string;
  tracks: {
    previous: string | null;
    next: string | null;
    limit: number;
    offset: number;
    total: number;
    items: {
      id: string;
      type: 'track';
      name: string;
      duration_ms: number;
      explicit: boolean;
      artists: { name: string }[];
    }[];
  };
  copyrights: { text: string; type: string }[];
  genres: string[];
  label: string;
};

export type ArtistResponseType = {
  id: string;
  type: 'artist';
  uri: string;
  name: string;
  images: {
    url: string;
    height: number;
    width: number;
  }[];
  genres: string[];
  followers: {
    href: string | null;
    total: number;
  };
  href: string;
  external_urls: {
    spotify: string;
  };
};

export type UserFollowedArtistsResponseType = {
  artists: {
    href: string;
    limit: 1;
    next: string;
    cursors: { after: string };
    total: number;
    items: {
      id: ArtistResponseType['id'];
      type: ArtistResponseType['type'];
      name: ArtistResponseType['name'];
      images: ArtistResponseType['images'];
    }[];
  };
};

export type AlbumsResponseType = {
  href: string;
  limit: number;
  next: string | null;
  offset: number;
  previous: string | null;
  total: number;
  items: AlbumResponseType[];
};

export type SavedAlbumsResponseType = {
  href: string;
  limit: number;
  next: string | null;
  offset: number;
  previous: string | null;
  total: number;
  items: {
    album: {
      id: AlbumResponseType['id'];
      type: AlbumResponseType['type'];
      name: AlbumResponseType['name'];
      artists: AlbumResponseType['artists'];
      album_type: AlbumResponseType['album_type'];
      images: AlbumResponseType['images'];
    };
  }[];
};

export type ShowResponseType = {
  type: 'show';
  id: string;
  name: string;
  publisher: string;
  description: string;
  images: {
    url: string;
    width: number;
    height: number;
  }[];
  total_episodes: number;
};

export type EpisodeResponseType = {
  type: 'episode';
  id: string;
  name: string;
  description: string;
  images: {
    url: string;
    width: number;
    height: number;
  }[];
  duration_ms: number;
  release_date: string;
  show: ShowResponseType;
};

export type SavedEpisodesResponseType = {
  href: string;
  limit: number;
  next: string | null;
  offset: number;
  previous: string | null;
  total: number;
  items: {
    added_at: string;
    episode: {
      id: AlbumResponseType['id'];
      type: EpisodeResponseType['type'];
      name: EpisodeResponseType['name'];
      images: EpisodeResponseType['images'];
      release_date: EpisodeResponseType['release_date'];
      show: {
        id: ShowResponseType['id'];
        type: ShowResponseType['type'];
        name: ShowResponseType['name'];
        images: ShowResponseType['images'];
      };
    };
  }[];
};

export type PlaylistTrackResponseType = {
  album?: { images?: { url: string | null }[] | null };
  id: string | null;
  name: string;
  artists?: { name: string }[];
  explicit?: boolean;
  duration_ms?: number;
};

// The February 2026 Web API renamed `track` to `item` in playlist entries.
// Both keys are supported; either can be null for unavailable or local items.
export type PlaylistItemResponseType = {
  item?: PlaylistTrackResponseType | null;
  track?: PlaylistTrackResponseType | null;
};

type PlaylistItemsPageResponseType = {
  total: number;
  next?: string | null;
  items?: PlaylistItemResponseType[];
};

export type PlaylistResponseType = {
  type: 'playlist';
  id: string;
  collaborative: boolean;
  description: string;
  href: string;
  images: {
    height: string | null;
    url: string;
    width: string | null;
  }[];
  name: string;
  owner: {
    display_name: string;
    href: string;
    id: string;
    type: 'user';
    uri: string;
  };
  primary_color: string | null;
  public: boolean;
  snapshot_id: string;
  followers?: { total: number };
  // February 2026 Web API: `tracks` was renamed to `items`, and playlist
  // contents are only returned for playlists the user owns or collaborates on.
  items?: PlaylistItemsPageResponseType;
  tracks?: PlaylistItemsPageResponseType;
  uri: string;
};

export type SavedPlaylistsResponseType = {
  href: string;
  limit: number;
  next: string | null;
  offset: number;
  previous: string | null;
  total: number;
  items: {
    id: PlaylistResponseType['id'];
    type: PlaylistResponseType['type'];
    name: PlaylistResponseType['name'];
    images: PlaylistResponseType['images'];
    owner: {
      id: PlaylistResponseType['owner']['id'];
      display_name: PlaylistResponseType['owner']['display_name'];
    };
  }[];
};

export type UserResponseType = {
  country: string;
  display_name: string;
  email: string;
  explicit_content: {
    filter_enabled: boolean;
    filter_locked: boolean;
  };
  external_urls: {
    spotify: string;
  };
  followers: {
    href: null | string;
    total: number;
  };
  href: string;
  id: string;
  images: {
    url: string;
    height: number;
    width: number;
  }[];
  product: string;
  type: string;
  uri: string;
};

export type RecentlyPlayedResponseType = {
  cursor: { before: string; after: string };
  limit: number;
  next: string;
  items: {
    track: {
      type: string;
      id: string;
      name: string;
      album: {
        images: {
          width: string | '';
          height: string | '';
          url: string | '';
        }[];
        id: string;
      };
    };
  }[];
};

export type SearchPlaylistResponseType = {
  playlists: {
    items: {
      type: 'playlist';
      id: string;
      name: string;
      description: string;
      images: {
        url: string | null;
        width: string | null;
        height: string | null;
      }[];
      owner: {
        id: string;
        uri: string;
        display_name: string;
      };
    }[];
  };
};

export type UserTopTracksResponseType = {
  items: {
    album: {
      type: 'album';
      id: string;
      images: {
        width: string | null;
        height: string | null;
        url: string | null;
      }[];
      name: string;
      artists: {
        type: 'artist';
        id: string;
        name: string;
      }[];
    };
  }[];
};

export type UserTopArtistsResponseType = {
  items: {
    type: 'artist';
    id: string;
    name: string;
    images: {
      url: string | null;
      width: string | null;
      height: string | null;
    }[];
    genres: string[];
  }[];
};

export type RecommendationsResponseType = {
  seeds: { id: string }[];
  tracks: UserTopTracksResponseType['items'];
};

export type BrowseCategoriesResponseType = {
  total: number;
  items: {
    id: string;
    name: string;
    icons: {
      url: string;
      width: number;
      height: number;
    }[];
  }[];
};

type SearchImageType = { url: string | null }[] | null;

export type SearchResponseType = {
  artists?: {
    items: ({ id: string; name: string; images?: SearchImageType } | null)[];
  };
  albums?: {
    items: ({
      id: string;
      name: string;
      album_type: string;
      images?: SearchImageType;
      artists?: { name: string }[];
    } | null)[];
  };
  tracks?: {
    items: ({
      id: string;
      name: string;
      artists?: { name: string }[];
      album: { id: string; images?: SearchImageType };
    } | null)[];
  };
  playlists?: {
    items: ({
      id: string;
      name: string;
      images?: SearchImageType;
      owner?: { display_name?: string | null };
    } | null)[];
  };
};

/**
 * Response shapes of the Audius REST API (v1, Open Audio Protocol).
 *
 * Every field is optional on purpose: the catalog is served by a decentralized
 * network of discovery nodes, and parsers must never trust a payload blindly.
 */
export type AudiusArtworkType = {
  '150x150'?: string | null;
  '480x480'?: string | null;
  '1000x1000'?: string | null;
};

export type AudiusUserResponseType = {
  id?: string | null;
  handle?: string | null;
  name?: string | null;
  bio?: string | null;
  is_verified?: boolean | null;
  follower_count?: number | null;
  track_count?: number | null;
  playlist_count?: number | null;
  profile_picture?: AudiusArtworkType | null;
  cover_photo?: { '640x'?: string | null; '2000x'?: string | null } | null;
};

export type AudiusTrackResponseType = {
  id?: string | null;
  title?: string | null;
  user?: AudiusUserResponseType | null;
  artwork?: AudiusArtworkType | null;
  // Seconds.
  duration?: number | null;
  genre?: string | null;
  mood?: string | null;
  play_count?: number | null;
  favorite_count?: number | null;
  repost_count?: number | null;
  release_date?: string | null;
  permalink?: string | null;
  description?: string | null;
  is_unlisted?: boolean | null;
};

export type AudiusPlaylistResponseType = {
  id?: string | null;
  playlist_name?: string | null;
  user?: AudiusUserResponseType | null;
  artwork?: AudiusArtworkType | null;
  is_album?: boolean | null;
  description?: string | null;
  track_count?: number | null;
  favorite_count?: number | null;
  repost_count?: number | null;
  total_play_count?: number | null;
  release_date?: string | null;
  created_at?: string | null;
  permalink?: string | null;
};

export type AudiusSearchResponseType = {
  users?: (AudiusUserResponseType | null)[] | null;
  tracks?: (AudiusTrackResponseType | null)[] | null;
  playlists?: (AudiusPlaylistResponseType | null)[] | null;
  albums?: (AudiusPlaylistResponseType | null)[] | null;
};
