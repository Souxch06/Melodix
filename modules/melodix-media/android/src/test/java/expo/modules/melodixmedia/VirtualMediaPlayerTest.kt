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
 * Player virtuel — tests JVM/Robolectric (APIs PUBLIQUES Player uniquement :
 * getState() et State sont protected dans SimpleBasePlayer ; les assertions
 * passent par playbackState/playWhenReady/mediaItemCount/currentMediaItem/
 * currentMediaItemIndex/duration/contentPosition/availableCommands).
 *
 * Contrats vérifiés :
 *  1. état initial STRICTEMENT valide selon les invariants media3 (4.4.8 —
 *     cause exacte du crash, journal 4.4.7 : IllegalArgumentException « Empty
 *     playlist only allowed in STATE_IDLE or STATE_ENDED » au constructeur) ;
 *  2. updateSession projette fidèlement métadonnées/durée/position/état et
 *     NE JOUE RIEN (simple player de contrôle) ;
 *  3. chaque commande système est routée vers le JS SANS mutation locale
 *     d'état (anti-boucle §7 : impossible que le player « joue » tout seul) ;
 *  4. cycle applicatif (release → nouvelle instance) : toujours IDLE + vide.
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

  // ------------------------------------------------- Test 1 (cahier §5)

  @Test
  fun `état initial — IDLE, playlist VIDE, aucune exception`() {
    // CONTRAT 4.4.8 (cause exacte du crash, journal 4.4.7) : l'état initial
    // « session sans morceau chargé » DOIT être STATE_IDLE — une playlist
    // vide n'est légale qu'en STATE_IDLE ou STATE_ENDED. Le constructeur
    // ne doit plus jamais lever l'IllegalArgumentException historique.
    assertEquals(Player.STATE_IDLE, player.playbackState)
    assertFalse(player.playWhenReady)
    assertEquals(0, player.mediaItemCount)
    assertNull(player.currentMediaItem)
    // NB : avec une timeline vide, SimpleBasePlayer renvoie l'index BRUT du
    // State (0), pas C.INDEX_UNSET (comportement réel media3, vérifié en CI)
    // — l'index de départ n'a donc pas de signification tant qu'aucun
    // morceau n'est projeté et n'est PAS une condition de validité.
    assertEquals(1.0f, player.playbackParameters.speed, 0.0001f)
    assertTrue(commands.isEmpty())
  }

  // ------------------------------------------------- Test 4 (cahier §5)

  @Test
  fun `retour à aucun morceau — nouvelle instance après release redevient IDLE valide`() {
    // CYCLE APPLICATIF RÉEL : stop moteur → service détruit → le prochain
    // Play recrée une NOUVELLE instance. Le « retour à vide » est ce cycle
    // release+recréation, qui reproduit l'état initial valide sans exception.
    val live = VirtualMediaPlayer(Looper.getMainLooper())
    live.updateSession(payload(isPlaying = true))
    assertEquals(Player.STATE_READY, live.playbackState)
    live.release()

    val fresh = VirtualMediaPlayer(Looper.getMainLooper())
    try {
      assertEquals(Player.STATE_IDLE, fresh.playbackState)
      assertEquals(0, fresh.mediaItemCount)
      assertNull(fresh.currentMediaItem)
      assertFalse(fresh.playWhenReady)
    } finally {
      fresh.release()
    }
  }

  // ------------------------------------------------- Test 2 + 3 (cahier §5)

  @Test
  fun `updateSession projette métadonnées, durée, position et état`() {
    player.updateSession(payload(isPlaying = true, positionMillis = 42_000L))

    // §3 : transition IDLE+vide → READY+1 item → PLAYING sans violation.
    assertEquals(Player.STATE_READY, player.playbackState)
    assertTrue(player.playWhenReady)
    assertTrue(player.isPlaying)
    assertEquals(1, player.mediaItemCount)
    assertEquals(0, player.currentMediaItemIndex)
    assertEquals(42_000L, player.contentPosition)

    val item = player.currentMediaItem
    assertEquals("spotify:abc", item?.mediaId)
    assertEquals("Photo", item?.mediaMetadata?.title)
    assertEquals("Neffex, Grimm", item?.mediaMetadata?.artist)
    assertEquals("Good", item?.mediaMetadata?.albumTitle)
    assertEquals(200_000L, player.duration)

    // La projection n'émet JAMAIS de commande vers le JS (anti-boucle §7).
    assertTrue(commands.isEmpty())
  }

  @Test
  fun `updateSession sans durée connue ne force pas de durée`() {
    player.updateSession(payload(isPlaying = false, durationMillis = 0L))

    assertEquals(Player.STATE_READY, player.playbackState)
    assertFalse(player.playWhenReady)
    assertFalse(player.isPlaying)
    assertEquals(C.TIME_UNSET, player.duration)
  }

  @Test
  fun `phase 5 — progression live via timeline projetée (aucune commande dédiée média3)`() {
    // L'API media3 n'a PAS de COMMAND_GET_DURATION/GET_POSITION : la
    // progression et la durée découlent de la TIMELINE + du playbackState
    // projetés (COMMAND_GET_TIMELINE, playbackParameters 1.0).
    player.updateSession(payload(isPlaying = true, positionMillis = 42_000L))

    assertTrue(
      player.availableCommands.contains(Player.COMMAND_GET_TIMELINE)
    )
    // Notification, écran verrouillé, Android Auto et casques n'emploient
    // pas tous la même variante de commande suivant leur version Media3.
    assertTrue(player.availableCommands.contains(Player.COMMAND_PLAY_PAUSE))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_NEXT))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_PREVIOUS))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM))
    assertTrue(player.availableCommands.contains(Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM))
    assertEquals(1.0f, player.playbackParameters.speed, 0.0001f)
  }

  @Test
  fun `PLAY système route play au JS SANS jouer localement`() {
    player.updateSession(payload(isPlaying = false))
    player.play() // commande système (notification/verrouillage)

    assertEquals(listOf("play" to null), commands)
    // Aucune mutation optimiste : le player attend la projection JS.
    assertFalse(player.playWhenReady)

    // Le JS confirme ensuite via projection — SEUL chemin vers PLAYING.
    player.updateSession(payload(isPlaying = true))
    assertTrue(player.playWhenReady)
    assertEquals(1, commands.size) // toujours une seule commande émise
  }

  @Test
  fun `PAUSE système route pause au JS`() {
    player.updateSession(payload(isPlaying = true))
    player.pause()

    assertEquals(listOf("pause" to null), commands)
    // L'état projeté reste PLAYING tant que le JS n'a pas confirmé la pause.
    assertTrue(player.playWhenReady)
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
    assertNull(player.currentMediaItem?.localConfiguration)
  }
}
