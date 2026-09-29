package expo.modules.melodixmedia

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
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
  ): MediaNotification =
    provider.createNotification(
      mediaSession,
      customLayout,
      actionFactory,
      onNotificationChangedCallback
    )

  override fun handleCustomCommand(
    session: MediaSession,
    action: String,
    extras: Bundle
  ): Boolean = provider.handleCustomCommand(session, action, extras)

  companion object {
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
