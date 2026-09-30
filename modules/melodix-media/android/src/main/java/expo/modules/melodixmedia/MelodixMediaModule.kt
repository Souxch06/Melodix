package expo.modules.melodixmedia

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

/**
 * Module natif MelodixMedia (phase 5A) — couche de CONTRÔLE MediaSession.
 *
 * Ce module :
 *  - NE JOUE AUCUN AUDIO : le moteur reste `melodixPlayer` (expo-av) ;
 *  - ne connaît AUCUNE URL de flux (Audius/YouTube) ;
 *  - ne possède AUCUNE file, shuffle ou repeat ;
 *  - projette l'état reçu du JS vers la MediaSession Android
 *    et re-transmet les commandes système vers le JS.
 */
class MelodixMediaModule : Module() {

  companion object {
    private const val TAG = "MelodixMediaModule"

    /** Request code propre au module (évite les collisions d'activité RN). */
    private const val REQUEST_CODE_POST_NOTIFICATIONS = 0x4D58 // "MX"
  }

  override fun definition() = ModuleDefinition {
    Name("MelodixMedia")

    Events("mediaCommand")

    OnCreate {
      // Le canal JS → natif arrive prêt : le service re-transmet les
      // commandes (notification/verrou/casque) vers le bridge JS.
      MelodixMediaController.commandListener = { command, positionMillis ->
        val payload = mutableMapOf<String, Any>("command" to command)

        if (positionMillis != null) {
          payload["positionMillis"] = positionMillis.toDouble()
        }

        this@MelodixMediaModule.sendEvent("mediaCommand", payload)
      }
    }

    OnDestroy {
      MelodixMediaController.commandListener = null
    }

    /**
     * Projection d'état : métadonnées + position + playing/paused.
     * Démarre le Foreground Service à la première projection active.
     * Blindage 5C.2 : JAMAIS de throw vers le JS — l'audio n'en dépend pas.
     */
    Function("updateSession") { payload: Map<String, Any?> ->
      try {
        val context = appContext.reactContext ?: return@Function
        MelodixMediaController.updateSession(context, payload)
      } catch (t: Throwable) {
        android.util.Log.e(TAG, "updateSession ignoré — lecture préservée", t)
      }
    }

    /**
     * Permission Android 13+ POST_NOTIFICATIONS (phase 5C, §10 du cahier) :
     * demandée au RUNTIME, UNIQUEMENT depuis le toggle « Lecture en
     * arrière-plan » des réglages (geste utilisateur dédié — 5C.2 : PLUS
     * JAMAIS au démarrage d'une lecture). La lecture n'est JAMAIS bloquée :
     * le Foreground Service média fonctionne sans cette permission, Android
     * gère seulement la VISIBILITÉ de la notification.
     *
     * @return true si accordée (ou inutile < Android 13), false si refusée
     *         ou demande en cours, null sans contexte utilisable.
     */
    Function("requestNotificationPermission") {
      try {
        // Avant Android 13 (33) : la permission n'existe pas → accord tacite.
        if (Build.VERSION.SDK_INT < 33) {
          return@Function true
        }

        val context = appContext.reactContext ?: return@Function null

        if (
          ContextCompat.checkSelfPermission(context, Manifest.permission.POST_NOTIFICATIONS) ==
            PackageManager.PERMISSION_GRANTED
        ) {
          return@Function true
        }

        val activity = appContext.currentActivity ?: return@Function false

        // requestPermissions DOIT s'exécuter sur le thread principal ;
        // les Function Expo peuvent s'exécuter hors main thread. Toute
        // erreur système (activité mourante, état transitoire) est capturée :
        // la lecture n'en dépend JAMAIS.
        activity.runOnUiThread {
          try {
            ActivityCompat.requestPermissions(
              activity,
              arrayOf(Manifest.permission.POST_NOTIFICATIONS),
              REQUEST_CODE_POST_NOTIFICATIONS
            )
          } catch (t: Throwable) {
            android.util.Log.e(TAG, "Demande de permission non aboutie", t)
          }
        }

        false
      } catch (t: Throwable) {
        android.util.Log.e(TAG, "Vérification de permission impossible", t)
        null
      }
    }

    /** Ferme la session et arrête le Foreground Service proprement. */
    Function("stopSession") {
      // Lambda FunctionWithoutArgs () -> Any? (expo-modules-core 1.12.25) :
      // le label nu vaut Unit → return@Function null (convention Expo,
      // cf. CoreModule.kt) ; updateSession n'en a pas besoin (R inféré Unit).
      try {
        val context = appContext.reactContext ?: return@Function null
        MelodixMediaController.stopSession(context)
      } catch (t: Throwable) {
        android.util.Log.e(TAG, "stopSession ignoré", t)
        null
      }
    }
  }
}
