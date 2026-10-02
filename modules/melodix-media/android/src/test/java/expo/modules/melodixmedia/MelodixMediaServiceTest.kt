package expo.modules.melodixmedia

import android.app.NotificationManager
import android.os.Looper
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import org.junit.After
import org.junit.Assert.assertEquals
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

  @Before
  fun setUp() {
    MelodixDiagLog.Flags.apply(emptyMap())
    controller = Robolectric.buildService(MelodixMediaService::class.java).create()
    service = controller.get()
  }

  @After
  fun tearDown() {
    controller.destroy()
    MelodixMediaController.onServiceCrashed()
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
    assertNotNull(
      "MediaSessionService passé en foreground avec une notification",
      shadowOf(service).lastForegroundNotification
    )
  }
}
