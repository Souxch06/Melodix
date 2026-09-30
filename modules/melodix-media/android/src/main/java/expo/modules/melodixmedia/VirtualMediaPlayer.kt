package expo.modules.melodixmedia

import android.net.Uri
import android.os.Looper
import androidx.annotation.OptIn
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.PlaybackParameters
import androidx.media3.common.Player
import androidx.media3.common.SimpleBasePlayer
import androidx.media3.common.util.UnstableApi
import com.google.common.util.concurrent.Futures
import com.google.common.util.concurrent.ListenableFuture

/**
 * Player VIRTUEL pour la MediaSession (phase 5B — APIs vérifiées sur les
 * sources media3 tag 1.3.1, commit androidx/media d833d59).
 *
 * Il ne décode JAMAIS d'audio : la lecture réelle reste dans `melodixPlayer`
 * (expo-av → Audius/YouTube). Media3 exige un `Player` pour animer la
 * MediaSession et le pipeline système (notification officielle, écran de
 * verrouillage, Bluetooth, Android Auto...). Ce player ne fait que :
 *  - porter la PROJECTION (métadonnées, durée, position, vitesse, état
 *    PLAYING/PAUSED) reçue du JS via `updateSession` ;
 *  - convertir chaque commande système (play/pause/next/previous/seek/stop)
 *    en événement routé vers le bridge JS.
 *
 * Invariants garantis ici :
 *  - AUCUNE URL de flux n'entre dans le MediaItem (queue/resolve hors scope) ;
 *  - AUCUNE mutation locale d'état sur commande (pas de play optimiste) :
 *    le moteur JS décide, puis pousse la projection confirmée — c'est CE qui
 *    empêche toute boucle commande → état → commande (§7).
 */
@OptIn(UnstableApi::class)
class VirtualMediaPlayer(looper: Looper) : SimpleBasePlayer(looper) {

  private var playerState: State = State.Builder()
    .setAvailableCommands(
      Player.Commands.Builder()
        .add(Player.COMMAND_PLAY_PAUSE)
        .add(Player.COMMAND_STOP)
        .add(Player.COMMAND_SEEK_TO_PREVIOUS)
        .add(Player.COMMAND_SEEK_TO_NEXT)
        .add(Player.COMMAND_SEEK_IN_CURRENT_MEDIA_ITEM)
        .add(Player.COMMAND_GET_METADATA)
        .add(Player.COMMAND_GET_CURRENT_MEDIA_ITEM)
        .add(Player.COMMAND_SET_MEDIA_ITEM)
        .add(Player.COMMAND_GET_TIMELINE)
        .build()
    )
    // État initial : PAUSED, vitesse normale — JAMAIS de "playing"
    // spontané (anti-autoplay : seule une projection JS isPlaying=true peut
    // faire passer la MediaSession en PLAYING).
    //
    // INVARIANT MEDIA3 (correctif 4.4.8 — cause exacte du crash au Play,
    // journal 4.4.7 : IllegalArgumentException "Empty playlist only allowed
    // in STATE_IDLE or STATE_ENDED" à State.Builder.build(), ligne 57) :
    // une playlist VIDE n'existe qu'en STATE_IDLE ou STATE_ENDED. L'état
    // initial est donc IDLE : « la MediaSession existe mais aucun morceau
    // n'est encore chargé ». La première projection JS (updateSession) fait
    // passer l'état à STATE_READY avec un MediaItem réel — transition
    // totalement valide (IDLE+vide → READY+1 item).
    .setPlayWhenReady(false, Player.PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST)
    .setPlaybackState(Player.STATE_IDLE)
    .setPlaybackParameters(PlaybackParameters.DEFAULT) // vitesse = 1.0x
    .build()

  override fun getState(): State = playerState

  /**
   * Applique une projection JS : métadonnées + durée + position + état.
   *
   * PLAYING/PAUSED = `playWhenReady` sur un état STATE_READY (isPlaying en
   * découle). BUFFERING n'est JAMAIS exposé : le verrou anti-autoplay (5A)
   * garantit que seuls des états issus d'une lecture réelle arrivent ici —
   * le buffering est géré côté moteur expo-av, pas par Media3.
   *
   * @param durationUs durée du morceau en µs (0 inconnue → non déclarée).
   */
  fun updateSession(payload: Map<String, Any?>) {
    // Blindage 5C.2 : une projection MALFORMÉE ou un état média3 inattendu
    // ne doit JAMAIS ressortir en exception (elle tourne sur le main thread
    // — le moindre throw = crash de toute l'app alors que l'audio continue).
    try {
      MelodixDiagLog.step("VMP_UPDATE_BEGIN") // DIAG 4.4.7
      updateSessionUnsafe(payload)
      MelodixDiagLog.step("VMP_UPDATE_OK")
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Projection ignorée (état conservé)", t)
      MelodixDiagLog.error("VMP_UPDATE_FAIL", t) // DIAG 4.4.7
    }
  }

  private fun updateSessionUnsafe(payload: Map<String, Any?>) {
    val trackId = payload["trackId"] as? String ?: "melodix-current"
    val title = payload["title"] as? String ?: ""
    val artist = payload["artist"] as? String ?: ""
    val album = payload["album"] as? String
    val artworkUrl = payload["artworkUrl"] as? String
    val durationMillis = (payload["durationMillis"] as? Number)?.toLong() ?: 0L
    val positionMillis = (payload["positionMillis"] as? Number)?.toLong() ?: 0L
    val isPlaying = payload["isPlaying"] as? Boolean ?: false

    // Test C (4.4.7) : skipMetadata projette l'état SANS métadonnées/artwork
    // — sépare la construction MediaMetadata du simple changement d'état.
    val metadata =
      if (MelodixDiagLog.Flags.skipMetadata) {
        MelodixDiagLog.step("VMP_METADATA_SKIPPED", "drapeau noMetadata")
        MediaMetadata.Builder().setMediaType(MediaMetadata.MEDIA_TYPE_MUSIC).build()
      } else {
        MediaMetadata.Builder()
          .setTitle(title)
          .setArtist(artist)
          .setAlbumTitle(album)
          .setArtworkUri(artworkUrl?.let(Uri::parse))
          .build()
      }

    // MediaItem : ID STABLE seulement (jamais d'URL de flux, token ni
    // credential — le player virtuel ne chargera jamais de média).
    val mediaItem = MediaItem.Builder()
      .setMediaId(trackId)
      .setMediaMetadata(metadata)
      .build()

    var track = MediaItemData.Builder(trackId)
      .setMediaItem(mediaItem)

    if (durationMillis > 0L) {
      // Durée exposée à Media3 (barre de progression, écran de verrouillage).
      track = track.setDurationUs(durationMillis * 1_000L)
    }

    playerState = playerState.buildUpon()
      .setPlaylist(listOf(track.build()))
      .setContentPositionMs(positionMillis.coerceAtLeast(0L))
      .setPlayWhenReady(isPlaying, Player.PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST)
      .setPlaybackState(Player.STATE_READY)
      .build()

    invalidateState()
  }

  // Les commandes système ne mutent PAS l'état local : le moteur JS décide
  // et pousse ensuite la projection confirmée (une seule source de vérité).
  // Chaque commande est BORNÉE (5C.2) : un relais raté ne casse jamais Média3.

  override fun handleSetPlayWhenReady(playWhenReady: Boolean): ListenableFuture<*> {
    try {
      MelodixDiagLog.step("VMP_CMD", if (playWhenReady) "play" else "pause") // DIAG 4.4.7
      MelodixMediaController.onMediaCommand(if (playWhenReady) "play" else "pause")
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Commande play/pause non relaûée", t)
      MelodixDiagLog.error("VMP_PLAY_FAIL", t) // DIAG 4.4.7
    }

    return Futures.immediateVoidFuture()
  }

  override fun handleSeek(
    mediaItemIndex: Int,
    positionMs: Long,
    seekCommand: Int
  ): ListenableFuture<*> {
    try {
      MelodixDiagLog.step("VMP_CMD", "seek cmd=$seekCommand pos=$positionMs") // DIAG 4.4.7
      when (seekCommand) {
        Player.COMMAND_SEEK_TO_NEXT,
        Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM ->
          MelodixMediaController.onMediaCommand("next")

        Player.COMMAND_SEEK_TO_PREVIOUS,
        Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM ->
          MelodixMediaController.onMediaCommand("previous")

        else -> MelodixMediaController.onMediaCommand("seek", positionMs)
      }
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Commande seek/non relaûée", t)
      MelodixDiagLog.error("VMP_SEEK_FAIL", t) // DIAG 4.4.7 (seek/next/previous)
    }

    return Futures.immediateVoidFuture()
  }

  override fun handleStop(): ListenableFuture<*> {
    try {
      MelodixDiagLog.step("VMP_CMD", "stop") // DIAG 4.4.7
      MelodixMediaController.onMediaCommand("stop")
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Commande stop non relaûée", t)
      MelodixDiagLog.error("VMP_STOP_FAIL", t) // DIAG 4.4.7
    }

    return Futures.immediateVoidFuture()
  }

  companion object {
    private const val TAG = "VirtualMediaPlayer"
  }
}
