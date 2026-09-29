package expo.modules.melodixmedia

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
