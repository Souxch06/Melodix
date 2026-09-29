package expo.modules.melodixmedia

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat

/**
 * Relais interne JS ↔ service (phase 5A).
 *
 * Ne contient QUE : la dernière projection reçue, le canal d'émission des
 * commandes vers le JS et l'état « service démarré ». Aucune logique de
 * lecture : aucune file, aucun état parallèle — la source de vérité reste
 * `melodixPlayer` côté JS.
 */
object MelodixMediaController {

  /** Émetteur JS enregistré par le module (event `mediaCommand`). */
  var commandListener: ((command: String, positionMillis: Long?) -> Unit)? = null

  /** Dernière projection poussée par le JS (utile au démarrage du service). */
  @Volatile
  private var lastPayload: Map<String, Any?>? = null

  @Volatile
  private var serviceRunning = false

  /**
   * Projette l'état du lecteur : mémorise la projection, garantit le service
   * (démarré uniquement sur action de lecture RÉELLE) et notifie le service
   * actif du nouvel état.
   */
  fun updateSession(context: Context, payload: Map<String, Any?>) {
    lastPayload = payload

    if (!serviceRunning) {
      serviceRunning = true
      // Démarrage depuis le FOREGROUND uniquement (lecture volontaire) :
      // Android 12+ autorise startForegroundService dans ce cas.
      val intent = Intent(context, MelodixMediaService::class.java)
      ContextCompat.startForegroundService(context, intent)
    }

    MelodixMediaService.sessionStateListener?.invoke(payload)
  }

  /** Arrêt propre : service + session relâchés par le service lui-même. */
  fun stopSession(context: Context) {
    lastPayload = null

    if (serviceRunning) {
      serviceRunning = false
      context.stopService(Intent(context, MelodixMediaService::class.java))
    }
  }

  /** Point d'entrée des commandes système (player virtuel → JS). */
  fun onMediaCommand(command: String, positionMillis: Long? = null) {
    commandListener?.invoke(command, positionMillis)
  }
}
