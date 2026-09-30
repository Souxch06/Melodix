package expo.modules.melodixmedia

import android.os.Looper
import androidx.media3.common.C
import androidx.media3.common.Player
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

/**
 * Player virtuel (phase 5B) — tests JVM/Robolectric.
 *
 * Vérifie les deux contrats critiques :
 *  1. updateSession projette fidèlement métadonnées/durée/position/état et
 *     NE JOUE RIEN (simple player de contrôle) ;
 *  2. chaque commande système est routée vers le JS SANS mutation locale
 *     d'état — c'est ce qui rend impossible la boucle commande → état →
 *     commande (§7) : le player ne peut pas "jouer" tout seul.
 */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34])
class VirtualMediaPlayerTest {

  private val commands = mutableListOf<Pair<String, Long?>>()
  private lateinit var player: VirtualMediaPlayer

  @Before
  fun setUp() {
    commands.clear()
    MelodixMediaController.commandListener = { command, position -> commands += command to position }
    player = VirtualMediaPlayer(Looper.getMainLooper())
  }

  @After
  fun tearDown() {
    MelodixMediaController.commandListener = null
    player.release()
  }

  private fun payload(
    isPlaying: Boolean,
    positionMillis: Long = 0L,
    durationMillis: Long = 200_000L
  ): Map<String, Any?> = mapOf(
    "trackId" to "spotify:abc",
    "title" to "Photo",
    "artist" to "Neffex, Grimm",
    "album" to "Good",
    "artworkUrl" to "https://img/p.jpg",
    "durationMillis" to durationMillis,
    "positionMillis" to positionMillis,
    "isPlaying" to isPlaying
  )

  @Test
  fun `état initial — pause, vitesse 1x, jamais de playing spontané`() {
    assertFalse(player.getState().playWhenReady)
    assertEquals(Player.STATE_READY, player.getState().playbackState)
    assertEquals(1.0f, player.getPlaybackParameters().speed)
    assertTrue(commands.isEmpty())
  }

  @Test
  fun `phase 5 — progression/durée ANNONCÉES (barre lockscreen et notification)`() {
    // Sans GET_DURATION/GET_POSITION, certains systèmes masquent ou figent
    // la progression ; SimpleBasePlayer les dérive de l'état projeté.
    val available = player.getState().availableCommands

    assertTrue(available.contains(Player.COMMAND_GET_DURATION))
    assertTrue(available.contains(Player.COMMAND_GET_POSITION))
    assertTrue(available.contains(Player.COMMAND_SEEK_IN_CURRENT_MEDIA_ITEM))
  }

  @Test
  fun `updateSession projette métadonnées, durée, position et état`() {
    player.updateSession(payload(isPlaying = true, positionMillis = 42_000L))

    assertTrue(player.getState().playWhenReady)

    // APIs PUBLIQUES (Player) : MediaItemData est protected static par design
    // media3 — la lecture passe par currentMediaItem/duration.
    val item = player.getCurrentMediaItem()
    assertEquals("spotify:abc", item?.mediaId)
    assertEquals("Photo", item?.mediaMetadata?.title)
    assertEquals("Neffex, Grimm", item?.mediaMetadata?.artist)
    assertEquals("Good", item?.mediaMetadata?.albumTitle)
    assertEquals(200_000L, player.getDuration())

    // La projection n'émet JAMAIS de commande vers le JS (anti-boucle §7).
    assertTrue(commands.isEmpty())
  }

  @Test
  fun `updateSession sans durée connue ne force pas de durée`() {
    player.updateSession(payload(isPlaying = false, durationMillis = 0L))

    assertFalse(player.getState().playWhenReady)
    assertEquals(C.TIME_UNSET, player.getDuration())
  }

  @Test
  fun `PLAY système route play au JS SANS jouer localement`() {
    player.updateSession(payload(isPlaying = false))
    player.play() // commande système (notification/verrouillage)

    assertEquals(listOf("play" to null), commands)
    // Aucune mutation optimiste : le player attend la projection JS.
    assertFalse(player.getState().playWhenReady)

    // Le JS confirme ensuite via projection — SEUL chemin vers PLAYING.
    player.updateSession(payload(isPlaying = true))
    assertTrue(player.getState().playWhenReady)
    assertEquals(1, commands.size) // toujours une seule commande émise
  }

  @Test
  fun `PAUSE système route pause au JS`() {
    player.updateSession(payload(isPlaying = true))
    player.pause()

    assertEquals(listOf("pause" to null), commands)
    // L'état projeté reste PLAYING tant que le JS n'a pas confirmé la pause.
    assertTrue(player.getState().playWhenReady)
  }

  @Test
  fun `NEXT, PREVIOUS, STOP, SEEK routés sans état parallèle`() {
    player.updateSession(payload(isPlaying = true))

    player.seekToNext()
    player.seekToPrevious()
    player.seekTo(12_345L)
    player.stop()

    assertEquals(
      listOf(
        "next" to null,
        "previous" to null,
        "seek" to 12_345L,
        "stop" to null
      ),
      commands
    )
  }

  @Test
  fun `aucune URL de flux ne transite par le media item`() {
    player.updateSession(payload(isPlaying = true))
    // Aucun URI local de lecture : Media3 n'a rien à charger (anti-leak §4).
    assertNull(player.getCurrentMediaItem()?.localConfiguration)
  }
}
