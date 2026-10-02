package expo.modules.melodixmedia

import android.app.Notification
import android.app.NotificationManager
import android.os.Looper
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf
import org.robolectric.android.controller.ServiceController
import org.robolectric.annotation.Config

/** Régression du bug « audio sans notification » sur le vrai service Media3. */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34])
class MelodixMediaServiceTest {
  private lateinit var controller: ServiceController<MelodixMediaService>
  private lateinit var service: MelodixMediaService
  private var destroyed = false

  @Before
  fun setUp() {
    destroyed = false
    MelodixDiagLog.Flags.apply(emptyMap())
    controller = Robolectric.buildService(MelodixMediaService::class.java).create()
    service = controller.get()
  }

  @After
  fun tearDown() {
    if (!destroyed) controller.destroy()
    MelodixMediaController.onServiceCrashed()
  }

  @Test
  fun `startForeground est explicite des onCreate avant meme la projection`() {
    val foreground = shadowOf(service).lastForegroundNotification
    assertNotNull("bootstrap foreground publié immédiatement", foreground)
    assertEquals(
      "Melodix",
      foreground.extras.getCharSequence(Notification.EXTRA_TITLE)?.toString()
    )
    val publishedField = MelodixMediaService::class.java.getDeclaredField("foregroundPublished")
    publishedField.isAccessible = true
    assertTrue(publishedField.getBoolean(service))
  }

  @Test
  fun `destruction du service invalide le drapeau natif pour permettre un redemarrage`() {
    assertTrue(MelodixMediaController.diagStatus().contains("serviceCreated=true"))

    controller.destroy()
    destroyed = true

    val status = MelodixMediaController.diagStatus()
    assertTrue(status.contains("serviceCreated=false"))
    assertTrue(status.contains("serviceStartRequested=false"))
  }

  @Test
  fun `arret du bridge efface la projection et demande l arret du service`() {
    MelodixMediaController.updateSession(
      service,
      mapOf("trackId" to "spotify:stale", "isPlaying" to true)
    )
    shadowOf(Looper.getMainLooper()).idle()
    assertTrue(MelodixMediaController.diagStatus().contains("projectionBuffered=true"))

    MelodixMediaController.stopSession(service)
    shadowOf(Looper.getMainLooper()).idle()

    val status = MelodixMediaController.diagStatus()
    assertTrue(status.contains("projectionBuffered=false"))
    assertTrue(status.contains("serviceStartRequested=false"))
  }

  @Test
  fun `service cree canal session et notification MediaStyle pour une projection playing`() {
    val field = MelodixMediaService::class.java.getDeclaredField("mediaSession")
    field.isAccessible = true
    val session = field.get(service) as? MediaSession
    assertNotNull("MediaSession créée par le service", session)

    MelodixMediaService.sessionStateListener?.invoke(
      mapOf(
        "trackId" to "spotify:test",
        "title" to "Notification Test",
        "artist" to "Melodix",
        "album" to "Audit",
        "artworkUrl" to null,
        "durationMillis" to 180_000L,
        "positionMillis" to 12_000L,
        "isPlaying" to true
      )
    )
    shadowOf(Looper.getMainLooper()).idle()

    val player = session!!.player
    assertTrue(player.isPlaying)
    assertEquals(Player.STATE_READY, player.playbackState)
    assertEquals("Notification Test", player.mediaMetadata.title)
    assertTrue(player.availableCommands.contains(Player.COMMAND_PLAY_PAUSE))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM))

    val manager = service.getSystemService(NotificationManager::class.java)
    assertNotNull(
      "canal de notification média créé",
      manager.getNotificationChannel(MelodixMediaNotificationProvider.CHANNEL_ID)
    )
    val foreground = shadowOf(service).lastForegroundNotification
    assertNotNull(
      "MediaSessionService passé en foreground avec une notification",
      foreground
    )
    assertEquals(
      "Notification Test",
      foreground.extras.getCharSequence(Notification.EXTRA_TITLE)?.toString()
    )

    MelodixMediaService.sessionStateListener?.invoke(
      mapOf(
        "trackId" to "spotify:next",
        "title" to "Next Track",
        "artist" to "Next Artist",
        "album" to "Next Album",
        "artworkUrl" to null,
        "durationMillis" to 200_000L,
        "positionMillis" to 42_000L,
        "isPlaying" to false
      )
    )
    shadowOf(Looper.getMainLooper()).idle()
    assertFalse(player.isPlaying)
    assertEquals("Next Track", player.mediaMetadata.title)
    assertEquals(42_000L, player.currentPosition)
  }
}
