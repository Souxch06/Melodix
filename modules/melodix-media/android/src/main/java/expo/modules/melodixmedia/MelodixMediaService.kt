package expo.modules.melodixmedia

import android.content.Intent
import android.util.Log
import androidx.annotation.OptIn
import androidx.media3.common.util.UnstableApi
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService

/**
 * Service média Melodix (phase 5B) — basé sur `MediaSessionService`
 * officiel d'AndroidX Media3 1.3.1, jamais sur une MediaSession bricolée.
 *
 * Cycle de vie :
 *  - démarré UNIQUEMENT sur projection d'une lecture volontaire
 *    (ContextCompat.startForegroundService depuis le bridge — jamais au
 *    boot, jamais sur la simple présence d'une session restaurée) ;
 *  - arrêté sur stop moteur explicite via `MelodixMediaController.stopSession`,
 *    ou sur retrait des récents EN PAUSE (voir onTaskRemoved).
 *
 * Session : unique, détenue par le service ; le player est VIRTUEL
 * (projection) — aucun audio natif, `melodixPlayer` reste le moteur.
 *
 * Détails 5B audités sur sources media3 tag 1.3.1 :
 *  - `addSession(session)` est OBLIGATOIRE au onCreate : sans lui,
 *    MediaNotificationManager ne suit pas la session (notification + mise
 *    en avant-plan Media3 inopérantes) ;
 *  - la toute première projection est REJOUÉE au onCreate : l'intent de
 *    démarrage traverse la file principale après l'appel de
 *    `ContextCompat.startForegroundService` — sans replay, le listener posé
 *    ici n'existait pas encore quand le contrôleur poussait l'état initial ;
 *  - `setListener(Listener)` branche le refus FGS Android 12+ (aucun
 *    override à inventer : MediaSessionService n'en expose pas).
 */
class MelodixMediaService : MediaSessionService() {

  private var mediaSession: MediaSession? = null
  private var virtualPlayer: VirtualMediaPlayer? = null

  @OptIn(UnstableApi::class)
  override fun onCreate() {
    super.onCreate()
    Log.i("MXDIAG", "SERVICE_ONCREATE_BEGIN") // DIAG 4.4.5-diagnostic

    // 5C.2 — Blindage ANTI-CRASH : TOUT ce bloc tourne sur le MAIN thread
    // au premier Play (le service n'existait jamais avant). La moindre
    // exception non captée ici (linkage gradle, erreur média3, provider...)
    // tuerait l'application ENTIÈRE alors que l'audio expo-av n'a strictement
    // rien à voir. Comportement exigé par le cahier : log complet, arrêt
    // propre du service — LA LECTURE CONTINUE, MediaSession = couche OPTIONNELLE.
    try {
      // Phase 5C : notification Melodix (canal/petit icône) via delegation au
      // DefaultMediaNotificationProvider — DOIT être posé avant la fin de
      // onCreate (contrat setMediaNotificationProvider, API 1.3.1 auditée).
      setMediaNotificationProvider(MelodixMediaNotificationProvider(this))

      val player = VirtualMediaPlayer(mainLooper)
      virtualPlayer = player

      // BitmapLoader 5C : pochettes HTTP asynchrones (executor dédié), cache
      // borné, résilient — sans aucun impact sur la lecture expo-av.
      val session = MediaSession.Builder(this, player)
        .setBitmapLoader(MelodixArtworkLoader.create(this))
        .build()
      mediaSession = session

      // Enregistre la session auprès du gestionnaire de notification Media3 :
      // c'est CE qui alimente la notification média système + met le service
      // en avant-plan dès que l'état projeté devient PLAYING.
      addSession(session)

      // Le contrôleur fait suivre chaque projection au player virtuel.
      sessionStateListener = { payload ->
        try {
          player.updateSession(payload)
        } catch (t: Throwable) {
          Log.e(TAG, "Projection rejetée — la lecture n'est jamais touchée", t)
        }
      }

      // Replay de la projection initiale : la projection qui a DÉCLENCHÉ le
      // démarrage du service est arrivée avant que cette ligne existe.
      try {
        MelodixMediaController.lastProjection()?.let { player.updateSession(it) }
      } catch (t: Throwable) {
        Log.e(TAG, "Replay de la projection initiale rejeté", t)
      }

      // Android 12+ : le système peut REFUSER la mise en avant-plan depuis
      // l'arrière-plan (ForegroundServiceStartNotAllowedException). Comportement
      // conforme : journaliser + tout arrêter proprement — AUCUN contournement.
      setListener(
        object : MediaSessionService.Listener {
          override fun onForegroundServiceStartNotAllowedException() {
            Log.w(TAG, "Mise en avant-plan refusée par Android 12+ — arrêt propre")
            MelodixMediaController.onServiceStartRejected()
            stopSelf()
          }
        }
      )

      Log.i("MXDIAG", "SERVICE_ONCREATE_OK") // DIAG 4.4.5-diagnostic
    } catch (t: Throwable) {
      // Échec de l'initialisation média : journal dev COMPLET (stacktrace
      // précise pour le diagnostic), rollback de l'état contrôleur, arrêt du
      // service. AUCUNE re-propagation : l'app ne doit JAMAIS mourir ici.
      // DIAG 4.4.5-diagnostic : marqueur canonique + pile complète.
      Log.e("MXDIAG", "SERVICE_ONCREATE_FAIL", t)
      Log.e(TAG, "MediaSession indisponible — Melodix continue sans session", t)
      sessionStateListener = null
      virtualPlayer?.let {
        try {
          it.release()
        } catch (releaseError: Throwable) {
          Log.w(TAG, "Libération du player virtuel ignorée", releaseError)
        }
      }
      virtualPlayer = null
      mediaSession = null
      MelodixMediaController.onServiceCrashed()
      stopSelf()
    }
  }

  override fun onGetSession(
    controllerInfo: MediaSession.ControllerInfo
  ): MediaSession? = mediaSession

  override fun onTaskRemoved(rootIntent: Intent?) {
    // Comportement Media3 recommandé pour une app MUSIQUE (audit §11-5B) :
    //  - LECTURE active → le service survit au retrait des récents ; la
    //    lecture continue SI Android/OEM l'autorise (aucune promesse contre
    //    les mécanismes agressifs constructeurs — Xiaomi/Oppo/etc.) ;
    //  - PAUSE → stopSelf() : pas de session "fantôme" figée ad vitam.
    //    La prochaine projection JS relancera proprement le service.
    //
    // Ne JAMAIS appeler ici une commande de pause : la source de vérité est
    // JS ; on ne fait qu'ajuster la survie du service à l'état PROJETÉ.
    if (!MelodixMediaController.isLastKnownPlaying()) {
      stopSelf()
    }
  }

  override fun onDestroy() {
    // Libération stricte, sans fuite possible : listener → session → player.
    // Dernière barrière anti-crash (5C.2) : une erreur de libération ne doit
    // jamais non plus tuer l'application en cours d'arrêt du service.
    sessionStateListener = null
    try {
      mediaSession?.let { session ->
        removeSession(session)
        session.release()
        session.player.release()
      }
    } catch (t: Throwable) {
      Log.w(TAG, "Libération de session partielle — ignorée", t)
    }
    virtualPlayer = null
    mediaSession = null

    super.onDestroy()
  }

  companion object {
    private const val TAG = "MelodixMediaService"

    // DIAG 4.4.5-diagnostic : si SERVICE_START_OK apparaît dans le logcat
    // mais PAS cette ligne, puis un FATAL NoClassDefFoundError/VerifyError →
    // échec du CHARGEMENT de la classe (desugaring/dex), irrattrapable par
    // les try/catch — la cause du crash au premier Play serait prouvée.
    init {
      Log.i("MXDIAG", "SERVICE_CLASS_LOADED")
      Log.i("MXDIAG", "SERVICE_CLINIT") // DIAG (alias canonique)
    }

    /** Branche posée par onCreate ; null quand le service est arrêté. */
    var sessionStateListener: ((payload: Map<String, Any?>) -> Unit)? = null
  }
}
