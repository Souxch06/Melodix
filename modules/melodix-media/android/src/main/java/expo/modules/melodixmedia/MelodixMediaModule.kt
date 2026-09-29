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
     */
    Function("updateSession") { payload: Map<String, Any?> ->
      val context = appContext.reactContext ?: return@Function
      MelodixMediaController.updateSession(context, payload)
    }

    /**
     * Permission Android 13+ POST_NOTIFICATIONS (phase 5C, §10 du cahier) :
     * demandée au RUNTIME, liée à l'activation « lecture en arrière-plan »
     * côté JS (jamais au boot, jamais hors contexte). UNIQUEMENT la demande
     * — la lecture n'est JAMAIS bloquée (le FGS et la lecture continuent
     * même si l'utilisateur refuse, Android gère la visibilité).
     *
     * @return true si accordée (ou inutile < Android 13), false si refusée
     *         ou demande en cours, null sans contexte utilisable.
     */
    Function("requestNotificationPermission") {
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

      // Demande ponctuelle liée au geste utilisateur ; le résultat est relu
      // au prochain appel (checkSelfPermission) — pas de callback fragile.
      ActivityCompat.requestPermissions(
        activity,
        arrayOf(Manifest.permission.POST_NOTIFICATIONS),
        REQUEST_CODE_POST_NOTIFICATIONS
      )

      false
    }

    /** Ferme la session et arrête le Foreground Service proprement. */
    Function("stopSession") {
      // Lambda FunctionWithoutArgs () -> Any? (expo-modules-core 1.12.25) :
      // le label nu vaut Unit → return@Function null (convention Expo,
      // cf. CoreModule.kt) ; updateSession n'en a pas besoin (R inféré Unit).
      val context = appContext.reactContext ?: return@Function null
      MelodixMediaController.stopSession(context)
    }
  }
}
