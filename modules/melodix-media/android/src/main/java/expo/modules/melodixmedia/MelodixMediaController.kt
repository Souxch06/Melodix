package expo.modules.melodixmedia

import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.content.ContextCompat

/**
 * Relais interne JS ↔ service (phase 5B).
 *
 * Ne contient QUE : la dernière projection reçue, le canal d'émission des
 * commandes vers le JS et l'état « service démarré ». Aucune logique de
 * lecture : aucune file, aucun état parallèle — la source de vérité reste
 * `melodixPlayer` côté JS ; le natif ne décide JAMAIS le morceau suivant.
 *
 * Threading : les fonctions Expo s'exécutent sur un thread module, mais le
 * player virtuel vit sur le looper PRINCIPAL. Toutes les projections et les
 * démarrages/arrêts du service sont donc marshalisés sur le main thread —
 * la mémorisation de la dernière projection reste synchrone (replay 5B).
 */
object MelodixMediaController {

  /** Émetteur JS enregistré par le module (event `mediaCommand`). */
  var commandListener: ((command: String, positionMillis: Long?) -> Unit)? = null

  /** Dernière projection poussée par le JS (replayée au onCreate service). */
  @Volatile
  private var lastPayload: Map<String, Any?>? = null

  @Volatile
  private var serviceRunning = false

  private val mainHandler = Handler(Looper.getMainLooper())

  /**
   * Projette l'état du lecteur : mémorise la projection (synchrone), puis
   * sur le MAIN thread : garantit le service et fait suivre au service actif.
   * Le démarrage n'est tenté QUE sur lecture volontaire (verrou JS côté 5A).
   */
  fun updateSession(context: Context, payload: Map<String, Any?>) {
    lastPayload = payload
    val appContext = context.applicationContext

    mainHandler.post {
      if (!serviceRunning) {
        serviceRunning = true
        try {
          // Démarrage depuis le FOREGROUND uniquement (lecture volontaire) :
          // Android 12+ autorise startForegroundService dans ce cas.
          val intent = Intent(appContext, MelodixMediaService::class.java)
          ContextCompat.startForegroundService(appContext, intent)
        } catch (e: Exception) {
          // Lancement refusé (arrière-plan Android 12+, quota, OEM...) :
          // rollback propre, journalisation — AUCUN contournement, et le
          // moteur JS n'en sait rien (la lecture ne casse JAMAIS).
          serviceRunning = false
          Log.w(TAG, "startForegroundService refusé: ${e.javaClass.simpleName}")
        }
      }

      // Fait suivre la projection au service ACTIF. Si le service vient
      // d'être demandé, onCreate rejouera `lastPayload` (verrou de race).
      // Blindage 5C.2 : une projection rejetée par le player virtuel ne doit
      // jamais remonter en exception sur le main thread (crash de l'app) —
      // log dev, lecture audio totalement préservée.
      try {
        MelodixMediaService.sessionStateListener?.invoke(payload)
      } catch (t: Throwable) {
        Log.e(TAG, "Projection rejetée par la session — lecture préservée", t)
      }
    }
  }

  /** Arrêt propre : service + session relâchés par le service lui-même. */
  fun stopSession(context: Context) {
    lastPayload = null
    val appContext = context.applicationContext

    mainHandler.post {
      if (serviceRunning) {
        serviceRunning = false
        appContext.stopService(Intent(appContext, MelodixMediaService::class.java))
      }
    }
  }

  /** Point d'entrée des commandes système (player virtuel → JS). */
  fun onMediaCommand(command: String, positionMillis: Long? = null) {
    commandListener?.invoke(command, positionMillis)
  }

  /** Dernière projection connue (replyée par MelodixMediaService.onCreate). */
  fun lastProjection(): Map<String, Any?>? = lastPayload

  /** État projeté : le JS lit-il actuellement ? (seule vérité : le bridge). */
  fun isLastKnownPlaying(): Boolean = lastPayload?.get("isPlaying") as? Boolean ?: false

  /** Appelé par le service quand Android a refusé le FGS : état nettoyé. */
  fun onServiceStartRejected() {
    serviceRunning = false
  }

  /**
   * Appelé par le service quand SON initialisation a échoué (blindage 5C.2) :
   * le drapeau est nettoyé pour permettre une NOUVELLE tentative au prochain
   * Play — la lecture audio, elle, n'a jamais dépendu de cette couche.
   */
  fun onServiceCrashed() {
    serviceRunning = false
    Log.w(TAG, "Service indisponible : prochaine projection retentera le démarrage")
  }

  private const val TAG = "MelodixMediaController"
}
