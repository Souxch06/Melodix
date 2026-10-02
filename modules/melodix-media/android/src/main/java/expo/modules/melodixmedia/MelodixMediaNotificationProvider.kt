package expo.modules.melodixmedia

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import androidx.core.app.NotificationCompat
import androidx.media3.session.CommandButton
import androidx.media3.session.DefaultMediaNotificationProvider
import androidx.media3.session.MediaNotification
import androidx.media3.session.MediaSession
import com.google.common.collect.ImmutableList

/**
 * Provider de notification Melodix (phase 5C) — DÉLÉGATION au
 * `DefaultMediaNotificationProvider` Media3 1.3.1 (aucune logique de player,
 * aucune file : toute la mise en forme/actions/styles provient de média3).
 *
 * Ce que Melodix customise explicitement :
 *  - le CANAL : id stable `melodix_media`, nom utilisateur « Melodix »,
 *    IMPORTANCE_LOW (notification média), SANS son, SANS vibration, créé
 *    UNE SEULE FOIS (il est ensuite no-op) ;
 *  - le small icon : icône de l'application plutôt que le drawable générique
 *    média3 ; la LARGE icon reste la pochette chargée par le BitmapLoader
 *    de la MediaSession (MelodixArtworkLoader) ;
 *  - l'ID de notification reste celui de média3 par défaut (1001, stable).
 *
 * Représentation de l'état (tout provient du pipeline média3, qui lit le
 * VirtualMediaPlayer projeté depuis le JS) :
 *  - titre/artiste via COMMAND_GET_METADATA, durée + position + vitesse via
 *    la timeline/état projetés (seekbar native du MediaStyle framework) ;
 *  - PLAYING → action pause affichée ; PAUSED → action play (commandes
 *    Media3 standard : previous / play-pause / next) ;
 *  - STOP : média3 1.3.1 n'affiche pas d'action STOP dédiée — il est servi
 *    par le BOUTON FERMER (setCancelButtonIntent) et par le DISMISS de la
 *    notification (deleteIntent), tous deux routés vers la commande STOP —
 *    voir §3/§8 du cahier 5C : documenté, pas de contournement maison ;
 *  - morceau stopped (pas de player actif) : media3 retire la notification
 *    (MediaNotificationManager.maybeStopForegroundService) ✓.
 */
class MelodixMediaNotificationProvider(context: Context) : MediaNotification.Provider {

  /** Contexte applicatif conservé (repli notification 5C.2). */
  private val appContext: Context = context.applicationContext

  private val provider: DefaultMediaNotificationProvider

  init {
    ensureMediaChannel(context)
    provider = DefaultMediaNotificationProvider.Builder(context)
      .setChannelId(CHANNEL_ID)
      .build()

    // Petit icône = icône Melodix (application) — la large icon est la
    // pochette, chargée par le BitmapLoader de la session.
    provider.setSmallIcon(context.applicationInfo.icon)
  }

  override fun createNotification(
    mediaSession: MediaSession,
    customLayout: ImmutableList<CommandButton>,
    actionFactory: MediaNotification.ActionFactory,
    onNotificationChangedCallback: MediaNotification.Provider.Callback
  ): MediaNotification {
    // DIAG 4.4.7 : callback chaud, hors try/catch du onCreate du service —
    // chaque invocation est tracée (BEGIN/OK/FAIL + pile complète au FAIL).
    MelodixDiagLog.step("NOTIF_CREATE_BEGIN")
    // Blindage 5C.2 : la construction de la notification est la DERNIÈRE
    // ligne avant la mise en avant-plan — une erreur ici (delegation média3,
    // artwork, layout) ne doit JAMAIS tuer l'application. Repli : notification
    // média3 par défaut (même pipeline, sans customisation), puis
    // notification minimale Melodix en tout dernier recours.
    return try {
      val notification = provider.createNotification(
        mediaSession,
        customLayout,
        actionFactory,
        onNotificationChangedCallback
      )
      MelodixDiagLog.step("NOTIF_CREATE_OK")
      notifyPublication(notification)
      notification
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Notification par défaut de repli", t)
      MelodixDiagLog.error("NOTIF_CREATE_FAIL", t) // DIAG 4.4.7
      fallbackNotification(onNotificationChangedCallback)
    }
  }

  /** Dernier recours absolu : notification minimale qui ne peut pas échouer. */
  private fun fallbackNotification(
    onNotificationChangedCallback: MediaNotification.Provider.Callback
  ): MediaNotification {
    ensureMediaChannel(appContext)

    val notification = androidx.core.app.NotificationCompat.Builder(appContext, CHANNEL_ID)
      .setSmallIcon(appContext.applicationInfo.icon)
      .setContentTitle(CHANNEL_NAME)
      .setContentText("Lecture en cours")
      .setOngoing(true)
      .build()

    val mediaNotification = MediaNotification(MEDIA_NOTIFICATION_ID, notification)
    notifyPublication(mediaNotification)
    onNotificationChangedCallback.onNotificationChanged(mediaNotification)

    return mediaNotification
  }

  private fun notifyPublication(notification: MediaNotification) {
    try {
      publicationListener?.invoke(notification)
    } catch (t: Throwable) {
      android.util.Log.e(TAG, "Publication foreground explicite rejetée", t)
      MelodixDiagLog.error("FOREGROUND_PUBLISH_FAIL", t)
    }
  }

  override fun handleCustomCommand(
    session: MediaSession,
    action: String,
    extras: Bundle
  ): Boolean {
    // DIAG 4.4.7 : callback chaud hors try/catch du service — tracé + pile.
    MelodixDiagLog.step("NOTIF_COMMAND", "action=$action")
    return try {
      provider.handleCustomCommand(session, action, extras)
    } catch (t: Throwable) {
      // Blindage 5C.2 : commande personnalisée ignorée plutôt qu'un crash.
      android.util.Log.e(TAG, "Commande personnalisée ignorée", t)
      MelodixDiagLog.error("NOTIF_COMMAND_FAIL", t, "action=$action") // DIAG 4.4.7
      false
    }
  }

  companion object {
    private const val TAG = "MelodixNotificationProv"

    /** ID unique partagé par la notification bootstrap et la MediaStyle finale. */
    const val MEDIA_NOTIFICATION_ID = 1001

    /**
     * Callback détenu uniquement pendant la vie du service. Media3 construit
     * la MediaStyle, puis le service publie explicitement CETTE notification
     * via startForeground au lieu de dépendre d'un effet interne implicite.
     */
    var publicationListener: ((MediaNotification) -> Unit)? = null

    /**
     * Notification immédiatement publiable après startForegroundService().
     * Elle respecte le délai Android de 5 s et est remplacée, sous le même id,
     * par la MediaStyle avec contrôles dès la première projection du player.
     */
    fun createBootstrapNotification(context: Context): android.app.Notification {
      ensureMediaChannel(context)
      return NotificationCompat.Builder(context, CHANNEL_ID)
        .setSmallIcon(context.applicationInfo.icon)
        .setContentTitle(CHANNEL_NAME)
        .setContentText("Préparation de la lecture")
        .setCategory(NotificationCompat.CATEGORY_TRANSPORT)
        .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
        .setOnlyAlertOnce(true)
        .setOngoing(true)
        .build()
    }

    /** ID de canal STABLE — jamais recréé autrement (§11 : une seule fois). */
    const val CHANNEL_ID = "melodix_media"

    /** Nom visible dans les réglages système de notifications Android. */
    const val CHANNEL_NAME = "Melodix"

    /**
     * Crée le canal média si absent (API 26+). Idempotent par nature :
     * NotificationManager.createNotificationChannel avec un id existant est
     * un no-op — et le premier créateur (ici) conserve nom/comportement.
     */
    fun ensureMediaChannel(context: Context) {
      if (Build.VERSION.SDK_INT < 26) {
        return
      }

      val manager =
        context.getSystemService(Context.NOTIFICATION_SERVICE) as? NotificationManager

      if (manager?.getNotificationChannel(CHANNEL_ID) != null) {
        return
      }

      val channel =
        NotificationChannel(CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_LOW)
          .apply {
            description = "Lecture Melodix"
            setSound(null, null)
            enableVibration(false)
            setShowBadge(false)
          }

      manager?.createNotificationChannel(channel)
    }
  }
}
