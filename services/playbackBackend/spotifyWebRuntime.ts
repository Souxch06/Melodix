export type SpotifyWebPageKind =
  'spotify-player' | 'spotify-login' | 'spotify-service' | 'blocked';

export type SpotifyWebDiagnosticCode =
  | 'webview_loading'
  | 'webview_loaded'
  | 'spotify_loaded'
  | 'login_page'
  | 'returned_from_login'
  | 'background'
  | 'foreground'
  | 'renderer_destroyed'
  | 'network_error'
  | 'http_error'
  | 'web_player_inaccessible'
  | 'bridge_ready'
  | 'bridge_timeout'
  | 'bridge_message_rejected'
  | 'playback_error'
  | 'session_lost'
  | 'navigation_blocked';

export const classifySpotifyWebUrl = (rawUrl: unknown): SpotifyWebPageKind => {
  if (typeof rawUrl !== 'string') return 'blocked';
  try {
    const url = new URL(rawUrl);
    if (url.protocol !== 'https:') return 'blocked';
    const host = url.hostname.toLowerCase();
    if (host === 'open.spotify.com') return 'spotify-player';
    if (host === 'accounts.spotify.com') return 'spotify-login';
    if (host === 'spotify.com' || host.endsWith('.spotify.com')) {
      return 'spotify-service';
    }
  } catch {
    return 'blocked';
  }
  return 'blocked';
};

export const isAllowedSpotifyWebNavigation = (rawUrl: unknown): boolean =>
  classifySpotifyWebUrl(rawUrl) !== 'blocked';

/** Safe diagnostic label: never returns paths, queries, codes or fragments. */
export const diagnosticPageLabel = (rawUrl: unknown): string => {
  switch (classifySpotifyWebUrl(rawUrl)) {
    case 'spotify-player':
      return 'open.spotify.com';
    case 'spotify-login':
      return 'accounts.spotify.com';
    case 'spotify-service':
      return 'service spotify.com';
    default:
      return 'navigation bloquée';
  }
};
