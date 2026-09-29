package expo.modules.melodixmedia

import android.content.Intent
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService

/**
 * Service média Melodix (phase 5A) — basé sur `MediaSessionService`
 * officiel d'AndroidX Media3, jamais sur une MediaSession bricolée.
 *
 * Cycle de vie (préparé ici, complété en 5B/5C) :
 *  - démarré UNIQUEMENT sur projection d'une lecture volontaire
 *    (ContextCompat.startForegroundService — jamais au boot, jamais sur la
 *    simple présence d'une session restaurée) ;
 *  - arrêté sur stop moteur explicite via `MelodixMediaController.stopSession`.
 *
 * Session : session unique détenue par le service ; le player est VIRTUEL
 * (projection) — aucun audio natif, `melodixPlayer` reste le moteur.
 */
class MelodixMediaService : MediaSessionService() {

  private var mediaSession: MediaSession? = null
  private var virtualPlayer: VirtualMediaPlayer? = null

  override fun onCreate() {
    super.onCreate()

    val player = VirtualMediaPlayer(mainLooper)
    virtualPlayer = player
    mediaSession = MediaSession.Builder(this, player).build()

    // Le contrôleur fait suivre chaque projection au player virtuel.
    sessionStateListener = { payload -> player.updateSession(payload) }
  }

  override fun onGetSession(
    controllerInfo: MediaSession.ControllerInfo
  ): MediaSession? = mediaSession

  override fun onTaskRemoved(rootIntent: Intent?) {
    // Choix documenté (audit §F) : le Foreground Service SURVIT au retrait
    // des récents tant qu'une lecture est active — comportement musical
    // attendu (Spotify-like). Ne pas appeler stopSelf() ici.
  }

  override fun onDestroy() {
    sessionStateListener = null
    mediaSession?.let { session ->
      session.release()
      session.player.release()
    }
    virtualPlayer = null
    mediaSession = null

    super.onDestroy()
  }

  companion object {
    /** Branche posée par onCreate ; null quand le service est arrêté. */
    var sessionStateListener: ((payload: Map<String, Any?>) -> Unit)? = null
  }
}
