package expo.modules.melodixmedia

import android.net.Uri
import android.os.Looper
import androidx.annotation.OptIn
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.SimpleBasePlayer
import androidx.media3.common.util.UnstableApi
import com.google.common.util.concurrent.Futures
import com.google.common.util.concurrent.ListenableFuture

/**
 * Player VIRTUEL pour la MediaSession (phase 5A).
 *
 * Il ne décode JAMAIS d'audio : la lecture réelle reste dans `melodixPlayer`
 * (expo-av). Media3 exige un `Player` pour animer la MediaSession et la
 * notification officielle ; ce player ne fait que :
 *  - porter les métadonnées/état projetés par le JS ;
 *  - convertir chaque commande système (play/pause/next/previous/seek/stop)
 *    en événement routé vers le bridge JS.
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
        .build()
    )
    .setPlayWhenReady(false, Player.PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST)
    .setPlaybackState(Player.STATE_READY)
    .build()

  override fun getState(): State = playerState

  /** Applique la dernière projection JS (métadonnées + position + état). */
  fun updateSession(payload: Map<String, Any?>) {
    val trackId = payload["trackId"] as? String ?: "melodix-current"
    val title = payload["title"] as? String ?: ""
    val artist = payload["artist"] as? String ?: ""
    val album = payload["album"] as? String
    val artworkUrl = payload["artworkUrl"] as? String
    val positionMillis = (payload["positionMillis"] as? Number)?.toLong() ?: 0L
    val isPlaying = payload["isPlaying"] as? Boolean ?: false

    val metadata = MediaMetadata.Builder()
      .setTitle(title)
      .setArtist(artist)
      .setAlbumTitle(album)
      .setArtworkUri(artworkUrl?.let(Uri::parse))
      .build()

    val mediaItem = MediaItem.Builder()
      .setMediaId(trackId)
      .setMediaMetadata(metadata)
      .build()

    val track = MediaItemData.Builder(trackId).setMediaItem(mediaItem).build()

    playerState = playerState.buildUpon()
      .setPlaylist(listOf(track))
      .setContentPositionMs(positionMillis)
      .setPlayWhenReady(isPlaying, Player.PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST)
      .setPlaybackState(Player.STATE_READY)
      .build()

    invalidateState()
  }

  // Les commandes système ne mutent PAS l'état local : le moteur JS décide
  // et pousse ensuite la projection confirmée (une seule source de vérité).

  override fun handleSetPlayWhenReady(playWhenReady: Boolean): ListenableFuture<*> {
    MelodixMediaController.onMediaCommand(if (playWhenReady) "play" else "pause")

    return Futures.immediateVoidFuture()
  }

  override fun handleSeek(
    mediaItemIndex: Int,
    positionMs: Long,
    seekCommand: Int
  ): ListenableFuture<*> {
    when (seekCommand) {
      Player.COMMAND_SEEK_TO_NEXT,
      Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM ->
        MelodixMediaController.onMediaCommand("next")

      Player.COMMAND_SEEK_TO_PREVIOUS,
      Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM ->
        MelodixMediaController.onMediaCommand("previous")

      else -> MelodixMediaController.onMediaCommand("seek", positionMs)
    }

    return Futures.immediateVoidFuture()
  }

  override fun handleStop(): ListenableFuture<*> {
    MelodixMediaController.onMediaCommand("stop")

    return Futures.immediateVoidFuture()
  }
}
