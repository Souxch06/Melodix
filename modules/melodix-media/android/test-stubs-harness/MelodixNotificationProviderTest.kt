// Tests Phase 5C — notification média Melodix.
// Exécutés hors Android via notre harness JVM (stubs reproduisant les
// signatures auditées de media3 1.3.1 / Android framework) : vérification
// du canal (id/nom/importance/silence/idempotence), de la délégation Media3,
// du smallIcon, des options bitmap, de la politique de permission §10 et du
// câblage du service (provider posé dans onCreate, libération à onDestroy).
package expo.modules.melodixmedia

import android.app.Activity
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Build
import android.os.Bundle
import android.os.Looper
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.media3.datasource.DataSourceBitmapLoader
import androidx.media3.session.CacheBitmapLoader
import androidx.media3.session.DefaultMediaNotificationProvider
import androidx.media3.session.MediaNotification
import androidx.media3.session.MediaSession
import expo.modules.kotlin.modules.definitionBuilders
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class MelodixNotificationProviderTest {

  /** Contexte JVM reconnu : NotificationManager enregistrant, icône app posée. */
  private class TestContext : Context() {
    val nm = NotificationManager()
    override val applicationContext: Context = this
    override val mainLooper: Looper = Looper.getMainLooper()
    override fun stopService(service: Intent): Boolean = true
    override fun getSystemService(name: String): Any? =
      if (name == Context.NOTIFICATION_SERVICE) nm else null
  }

  private lateinit var context: TestContext

  @Before
  fun setUp() {
    context = TestContext()
  }

  @After
  fun tearDown() {
    Build.VERSION.SDK_INT = 34
    ContextCompat.grantedResult = Int.MIN_VALUE
    ActivityCompat.requests.clear()
    definitionBuilders.clear()
    DefaultMediaNotificationProvider.resetRecorders()
    MelodixMediaController.commandListener = null
  }

  // ---------------------------------------------------------------- canal

  @Test
  fun `channel id nom importance et silence conformes`() {
    MelodixMediaNotificationProvider(context)

    assertEquals(1, context.nm.createChannelCalls)
    val stored = context.nm.channels[MelodixMediaNotificationProvider.CHANNEL_ID]
    assertNotNull("le canal melodix_media doit exister", stored)
    assertEquals("melodix_media", MelodixMediaNotificationProvider.CHANNEL_ID)
    assertEquals("Melodix", stored!!.name)
    assertEquals(
      "importance média : LOW (jamais de sur-écran)",
      NotificationManager.IMPORTANCE_LOW, stored.importance
    )
    assertTrue("notification média silencieuse : setSound(null, null)",
      stored.soundSetToNull)
    assertFalse("pas de vibration", stored.vibrationEnabled)
    assertFalse("pas de badge", stored.badgeShown)
  }

  @Test
  fun `creation du canal idempotente`() {
    MelodixMediaNotificationProvider(context) // création initiale (1 canal)

    MelodixMediaNotificationProvider.ensureMediaChannel(context) // second appel : no-op

    assertEquals("le canal ne doit être demandé qu'une seule fois",
      1, context.nm.createChannelCalls)
  }

  // ------------------------------------------------- délégation + provider

  @Test
  fun `provider delegue createNotification avec canal et smallIcon de l'app`() {
    context.applicationInfo.icon = 42
    val provider = MelodixMediaNotificationProvider(context)
    val session = MediaSession.Builder(context, VirtualMediaPlayer(context.mainLooper)).build()

    val notification = provider.createNotification(
      mediaSession = session,
      customLayout = emptyList(),
      actionFactory = object : MediaNotification.ActionFactory {},
      onNotificationChangedCallback = object : MediaNotification.Provider.Callback {
        override fun onNotificationChanged(notification: MediaNotification) {}
      }
    )

    assertEquals("l'ID de notification reste celui de média3 par défaut",
      DefaultMediaNotificationProvider.DEFAULT_NOTIFICATION_ID, notification.notificationId)
    assertEquals("canal propagé au DefaultMediaNotificationProvider",
      MelodixMediaNotificationProvider.CHANNEL_ID,
      DefaultMediaNotificationProvider.lastChannelId)
    assertEquals("smallIcon = icône de l'application",
      42, DefaultMediaNotificationProvider.lastSmallIcon)
    assertNotNull("createNotification du delegate invoqué avec nos arguments",
      DefaultMediaNotificationProvider.lastCreateArgs)
    assertEquals(session, DefaultMediaNotificationProvider.lastCreateArgs!![0])
  }

  @Test
  fun `handleCustomCommand est delegue sans traitement local`() {
    val provider = MelodixMediaNotificationProvider(context)
    val session = MediaSession.Builder(context, VirtualMediaPlayer(context.mainLooper)).build()

    assertFalse(provider.handleCustomCommand(session, "com.melodix.CUSTOM", Bundle()))
  }

  // ------------------------------------------------------------- artwork

  @Test
  fun `bitmap options RGB 565`() {
    assertEquals(Bitmap.Config.RGB_565, MelodixArtworkLoader.bitmapOptions().inPreferredConfig)
  }

  @Test
  fun `create enveloppe DataSourceBitmapLoader dans le cache borne`() {
    val loader = MelodixArtworkLoader.create(context)
    assertTrue(loader is CacheBitmapLoader)

    val inner = (loader as CacheBitmapLoader).bitmapLoader
    assertTrue("loader interne = DataSourceBitmapLoader média3", inner is DataSourceBitmapLoader)
    val dataSourceLoader = inner as DataSourceBitmapLoader
    assertNotNull("executor dédié fourni", dataSourceLoader.listeningExecutorService)
    assertNotNull("factory DefaultDataSource fournie", dataSourceLoader.dataSourceFactory)
    assertNotNull("options non null", dataSourceLoader.options)
    assertEquals(Bitmap.Config.RGB_565, dataSourceLoader.options!!.inPreferredConfig)
  }

  // ---------------------------------------------------------- permission

  private fun invokeRequestNotificationPermission(module: MelodixMediaModule): Any? {
    module.definition() // enregistre les fonctions dans definitionBuilders
    val builder = definitionBuilders.single()
    val fn = builder.registeredFunctions["requestNotificationPermission"]
    assertNotNull("Function requestNotificationPermission enregistrée", fn)
    return (fn as () -> Any?).invoke()
  }

  @Test
  fun `permission true sans requete sous Android 12 et moins`() {
    Build.VERSION.SDK_INT = 32

    val result = invokeRequestNotificationPermission(MelodixMediaModule())

    assertEquals(true, result)
    assertEquals(0, ActivityCompat.requests.size)
  }

  @Test
  fun `permission true si deja accordee`() {
    Build.VERSION.SDK_INT = 34
    ContextCompat.grantedResult = PackageManager.PERMISSION_GRANTED
    val module = MelodixMediaModule()
    module.appContext.reactContext = context

    val result = invokeRequestNotificationPermission(module)

    assertEquals(true, result)
    assertEquals(0, ActivityCompat.requests.size)
  }

  @Test
  fun `permission declenche la requete systeme MX et retourne false en attente`() {
    Build.VERSION.SDK_INT = 34
    ContextCompat.grantedResult = PackageManager.PERMISSION_DENIED
    val module = MelodixMediaModule()
    module.appContext.reactContext = context
    module.appContext.currentActivity = Activity()

    val result = invokeRequestNotificationPermission(module)

    assertEquals("résultat relu au prochain appel (jamais bloquant)", false, result)
    assertEquals(1, ActivityCompat.requests.size)
    val (permissions, requestCode) = ActivityCompat.requests.single()
    assertEquals("request code réservé Melodix (0x4D58 = MX)", 0x4D58, requestCode)
    assertEquals(listOf(android.Manifest.permission.POST_NOTIFICATIONS), permissions.toList())
  }

  @Test
  fun `permission jamais bloquante sans activite`() {
    Build.VERSION.SDK_INT = 34
    ContextCompat.grantedResult = PackageManager.PERMISSION_DENIED
    val module = MelodixMediaModule()
    module.appContext.reactContext = context
    module.appContext.currentActivity = null

    val result = invokeRequestNotificationPermission(module)

    assertEquals(false, result)
    assertEquals("aucune requête envoyée sans activité", 0, ActivityCompat.requests.size)
  }

  // ------------------------------------------------------------- service

  @Test
  fun `service installe le provider dans onCreate et libere a onDestroy`() {
    val service = MelodixMediaService()

    service.onCreate()

    assertNotNull("setMediaNotificationProvider appelé dans onCreate",
      service.notificationProviderSet)
    assertTrue("le provider est bien le provider Melodix",
      service.notificationProviderSet is MelodixMediaNotificationProvider)
    assertNotNull("MediaSession initiale créée",
      service.onGetSession(MediaSession.ControllerInfo()))
    assertNotNull("sessionStateListener posé",
      MelodixMediaService.sessionStateListener)

    service.onTaskRemoved(null)
    assertEquals("pas de lecture projetée → stopSelf (comportement 5B)",
      1, service.stopSelfCalls)

    service.onDestroy()

    assertNull("sessionStateListener libéré", MelodixMediaService.sessionStateListener)
    assertNull("session libérée", service.onGetSession(MediaSession.ControllerInfo()))
  }
}
