/**
 * Snapshot d'historique → PlayerTrack (I-8, partagé).
 *
 * L'historique stocke l'identifiant de QUEUE (déjà préfixé, validé depuis
 * toujours par le player). La lecture directe re-déduit la SOURCE en
 * retirant le préfixe — jamais de double préfixe, jamais d'id d'album
 * fabriqué. La clé du PlayerTrack reste identique → cache de matching et
 * cache partagé réutilisés.
 *
 * Type-only imports : aucun cycle runtime avec services/player.
 */
import type { PlayerTrack } from '../player';
import type { TrackSource } from '../audio/types';
import type { TrackModel } from '@models';

const AUDIUS_PREFIX = 'audius:';
const SPOTIFY_PREFIX = 'spotify:';

const sourceFromQueueId = (queueId: string): TrackSource =>
  queueId.startsWith(AUDIUS_PREFIX)
    ? { provider: 'audius', id: queueId.slice(AUDIUS_PREFIX.length) }
    : {
        provider: null,
        id: queueId.startsWith(SPOTIFY_PREFIX)
          ? queueId.slice(SPOTIFY_PREFIX.length)
          : queueId,
      };

export const playerTrackFromHistoryEntry = ({
  id,
  title,
  imageURL,
  snapshot,
}: {
  /** Identifiant de queue stocké (ex. spotify:xxx / audius:xxx). */
  id: string;
  title: string;
  imageURL: string;
  /** Snapshot récent du morceau (métadonnées I-2) quand il existe. */
  snapshot?: TrackModel;
}): PlayerTrack => ({
  id,
  title: snapshot?.title ?? title,
  artists: snapshot?.subtitle
    ? snapshot.subtitle.split(', ').filter(Boolean)
    : [],
  album: snapshot?.albumName ?? null,
  durationMillis: snapshot?.durationMs ?? null,
  ...(snapshot?.isrc ? { isrc: snapshot.isrc } : {}),
  imageURL,
  source: sourceFromQueueId(snapshot?.id || id),
});
