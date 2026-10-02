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

  /**
   * Vrai dès que le démarrage a été demandé OU que le service est vivant.
   * Ce drapeau doit impérativement être remis à false par onDestroy : sinon,
   * après une destruction Android/OEM, les projections suivantes seraient
   * envoyées vers un listener null sans jamais redémarrer le service.
   */
  @Volatile
  private var serviceRunning = false

  @Volatile
  private var serviceCreated = false

  private val mainHandler = Handler(Looper.getMainLooper())

  /**
   * Projette l'état du lecteur : mémorise la projection (synchrone), puis
   * sur le MAIN thread : garantit le service et fait suivre au service actif.
   * Le démarrage n'est tenté QUE sur lecture volontaire (verrou JS côté 5A).
   */
  fun updateSession(context: Context, payload: Map<String, Any?>) {
    lastPayload = payload
    val appContext = context.applicationContext

    // DIAG (4.4.5 + 4.4.7 miroir fichier) : réception d'une projection JS.
    Log.i("MXDIAG", "MEDIA_SESSION_UPDATE received")
    MelodixDiagLog.step("MEDIA_SESSION_UPDATE", "received keys=${payload.keys.size}")

    mainHandler.post {
      if (!serviceRunning) {
        serviceRunning = true
        try {
          // Démarrage depuis le FOREGROUND uniquement (lecture volontaire) :
          // Android 12+ autorise startForegroundService dans ce cas.
          // A/B 4.4.7 : drapeau d'isolation — audio expo-av fond actif,
          // service MediaSession JAMAIS démarré (rien d'autre ne change).
          if (MelodixDiagLog.Flags.skipServiceStart) {
            Log.i("MXDIAG", "SERVICE_START_SKIPPED")
            MelodixDiagLog.step("SERVICE_START_SKIPPED", "drapeau noService")
            serviceRunning = false
          } else {
            Log.i("MXDIAG", "SERVICE_START_ATTEMPT") // DIAG
            MelodixDiagLog.step("SERVICE_START_ATTEMPT")
            val intent = Intent(appContext, MelodixMediaService::class.java)
            ContextCompat.startForegroundService(appContext, intent)
            Log.i("MXDIAG", "SERVICE_START_OK") // DIAG
            MelodixDiagLog.step("SERVICE_START_OK", "intentAccepted=true serviceCreated=$serviceCreated")
            // Un retour sans exception prouve seulement que l'intent a été
            // accepté. Si Android/OEM ne crée jamais le service, ne pas garder
            // éternellement un drapeau optimiste qui bloquerait tout retry.
            mainHandler.postDelayed({
              if (serviceRunning && !serviceCreated) {
                MelodixDiagLog.step("SERVICE_CREATE_TIMEOUT", "retryAllowed=true")
                serviceRunning = false
              }
            }, 5_000L)
          }
        } catch (e: Exception) {
          // Lancement refusé (arrière-plan Android 12+, quota, OEM...) :
          // rollback propre, journalisation — AUCUN contournement, et le
          // moteur JS n'en sait rien (la lecture ne casse JAMAIS).
          serviceRunning = false
          Log.w(TAG, "startForegroundService refusé: ${e.javaClass.simpleName}")
          MelodixDiagLog.error("SERVICE_START_FAIL", e) // DIAG 4.4.7
        }
      }

      // Fait suivre la projection au service ACTIF. Si le service vient
      // d'être demandé, onCreate rejouera `lastPayload` (verrou de race).
      // Blindage 5C.2 : une projection rejetée par le player virtuel ne doit
      // jamais remonter en exception sur le main thread (crash de l'app) —
      // log dev, lecture audio totalement préservée.
      try {
        val listener = MelodixMediaService.sessionStateListener
        MelodixDiagLog.step(
          "PROJECTION_DISPATCH",
          "listenerAttached=${listener != null} serviceCreated=$serviceCreated"
        )
        listener?.invoke(payload)
      } catch (t: Throwable) {
        Log.e(TAG, "Projection rejetée par la session — lecture préservée", t)
        MelodixDiagLog.error("PROJECTION_FAIL", t) // DIAG 4.4.7
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

  /** Dernière projection connue (rejouée par MelodixMediaService.onCreate). */
  fun lastProjection(): Map<String, Any?>? = lastPayload

  /**
   * Force une nouvelle projection après l'accord runtime de notification.
   * La lecture n'attend pas la boîte de dialogue Android, mais une réponse
   * positive doit republier la MediaStyle : la première publication a pu
   * avoir lieu pendant que POST_NOTIFICATIONS était encore refusée.
   */
  fun refreshLastProjection(context: Context) {
    lastPayload?.let { updateSession(context, it) }
  }

  /** Appelé depuis le vrai cycle de vie du Service, sur le main thread. */
  fun onServiceCreated() {
    serviceRunning = true
    serviceCreated = true
  }

  /**
   * Invalide le drapeau optimiste posé par startForegroundService().
   * Sans ceci, une destruction avec process JS encore vivant bloque tout
   * redémarrage ultérieur : serviceRunning=true mais listener=null.
   */
  fun onServiceDestroyed() {
    serviceCreated = false
    serviceRunning = false
  }

  /** État projeté : le JS lit-il actuellement ? (seule vérité : le bridge). */
  fun isLastKnownPlaying(): Boolean = lastPayload?.get("isPlaying") as? Boolean ?: false

  /**
   * Statut instantané de la couche MediaSession (DIAG 4.4.7 — affiché dans
   * Réglages → « Diagnostic technique »). Aucune donnée sensible : uniquement
   * des booléens d'état internes.
   */
  fun diagStatus(): String =
    "serviceStartRequested=$serviceRunning " +
      "serviceCreated=$serviceCreated " +
      "projectionBuffered=${lastPayload != null} " +
      "lastKnownPlaying=${isLastKnownPlaying()}"

  /** Appelé par le service quand Android a refusé le FGS : état nettoyé. */
  fun onServiceStartRejected() {
    serviceCreated = false
    serviceRunning = false
  }

  /**
   * Appelé par le service quand SON initialisation a échoué (blindage 5C.2) :
   * le drapeau est nettoyé pour permettre une NOUVELLE tentative au prochain
   * Play — la lecture audio, elle, n'a jamais dépendu de cette couche.
   */
  fun onServiceCrashed() {
    serviceCreated = false
    serviceRunning = false
    Log.w(TAG, "Service indisponible : prochaine projection retentera le démarrage")
  }

  private const val TAG = "MelodixMediaController"
}
