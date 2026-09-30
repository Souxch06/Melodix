package expo.modules.melodixmedia

import android.content.Context
import android.util.Log
import java.io.File
import java.io.PrintWriter
import java.io.StringWriter
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Journal de diagnostic persistant (4.4.7-diagnostic) — TEMPORAIRE.
 *
 * Pourquoi : le crash au Play est confirmé uniquement quand la couche
 * MediaSession est active, mais l'utilisateur ne peut PAS extraire un
 * logcat ADB. Ce collecteur écrit chaque breadcrumb native ET chaque
 * exception (rattrapée ou NON) dans un fichier applicatif lisible depuis
 * l'UI (Réglages → « Diagnostic technique ») — zéro ADB.
 *
 * Garanties strictes :
 *  - JAMAIS de throw : tout l'I/O est best-effort (diagnostiquer ne doit
 *    jamais pouvoir casser l'application) ;
 *  - fichier BORNÉ : quand > 512 Ko, on ne conserve que la queue ~256 Ko ;
 *  - pas de donnée sensible : étapes + classe d'exception + pile (pile de
 *    NOS exceptions natif uniquement — jamais d'URL/token/clé) ;
 *  - thread ET timestamp (UTC, millisecondes) sur chaque ligne.
 *
 * Le piège d'exceptions non rattrapées ENVELOPPE le handler précédent :
 * l'erreur est écrite (flush synchrone) PUIS le handler d'origine est
 * délégué — le comportement de crash reste strictement celui d'avant.
 */
object MelodixDiagLog {

  private const val TAG = "MelodixDiagLog"
  private const val FILE_NAME = "melodix-native-crash.log"
  private const val MAX_BYTES = 512 * 1024L
  private const val KEEP_TAIL_BYTES = 256 * 1024L

  @Volatile
  private var logFile: File? = null

  private val crashTrapInstalled = AtomicBoolean(false)

  private val isoFormatter: ThreadLocal<SimpleDateFormat> =
    object : ThreadLocal<SimpleDateFormat>() {
      override fun initialValue(): SimpleDateFormat =
        SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US).apply {
          timeZone = TimeZone.getTimeZone("UTC")
        }
    }

  /** Une seule initialisation du contexte suffit (module OnCreate / service). */
  fun init(context: Context) {
    try {
      if (logFile == null) {
        logFile = File(context.applicationContext.filesDir, FILE_NAME)
      }
    } catch (t: Throwable) {
      Log.w(TAG, "init échoué — journal désactivé", t)
    }
  }

  /** Piège global : écrit TOUTE exception non rattrapée (tous threads). */
  fun installCrashTrap() {
    if (!crashTrapInstalled.compareAndSet(false, true)) {
      return
    }

    try {
      val previous = Thread.getDefaultUncaughtExceptionHandler()

      Thread.setDefaultUncaughtExceptionHandler { thread, error ->
        appendRaw(
          "FATAL_UNCAUGHT",
          "thread=${thread.name} ${error.javaClass.name}: ${error.message}",
          error
        )
        try {
          previous?.uncaughtException(thread, error)
        } catch (ignored: Throwable) {
          // Le handler précédent ne doit pas faire échouer le notre.
        }
      }
    } catch (t: Throwable) {
      Log.w(TAG, "crash trap non installé", t)
    }
  }

  /** Étape nommée (breadcrumbs DIAG du chemin service bridge→MediaSession). */
  fun step(step: String, extra: String? = null) {
    appendRaw(step, extra, null)
  }

  /** Exception RATTRAPÉE mais diagnostiquée (jamais masquée). */
  fun error(step: String, throwable: Throwable, extra: String? = null) {
    appendRaw(
      step,
      "${extra ?: ""} ${throwable.javaClass.name}: ${throwable.message}".trim(),
      throwable
    )
  }

  /** Contenu du journal (copie presse-papiers/partage depuis Réglages). */
  fun readAll(): String {
    return try {
      val file = logFile

      if (file == null || !file.exists()) {
        ""
      } else {
        file.readText()
      }
    } catch (t: Throwable) {
      Log.w(TAG, "readAll échoué", t)
      ""
    }
  }

  /** Vide le journal (bouton Réglages). */
  fun clear() {
    try {
      logFile?.delete()
    } catch (t: Throwable) {
      Log.w(TAG, "clear échoué", t)
    }
  }

  // ------------------------------------------------------------------ interne

  private fun appendRaw(step: String, extra: String?, throwable: Throwable?) {
    val file = logFile ?: return

    try {
      synchronized(this) {
        // Borne : tronque depuis le début pour garder les événements récents.
        if (file.exists() && file.length() > MAX_BYTES) {
          try {
            val content = file.readText()
            val tail = content.takeLast(KEEP_TAIL_BYTES.toInt())
            file.writeText("…[journal tronqué aux ${KEEP_TAIL_BYTES / 1024} Ko récents]…\n$tail")
          } catch (t: Throwable) {
            Log.w(TAG, "trim ignoré", t)
          }
        }

        val line = buildString {
          append(isoFormatter.get()?.format(Date()) ?: "?")
          append(" | t=")
          append(Thread.currentThread().name)
          append(" | ")
          append(step)
          if (!extra.isNullOrEmpty()) {
            append(" | ")
            append(extra)
          }
          append('\n')
        }

        file.appendText(line)

        if (throwable != null) {
          val stack = StringWriter()
          throwable.printStackTrace(PrintWriter(stack))
          file.appendText(stack.toString())
          if (!stack.toString().endsWith("\n")) {
            file.appendText("\n")
          }
        }
      }
    } catch (t: Throwable) {
      Log.w(TAG, "append ignoré ($step)", t)
    }
  }

  // ------------------------------------------------------------------ drapeaux

  /**
   * Drapeaux d'isolation A/B + Test C (pilotés depuis Réglages, TEMPORAIRE).
   * Chaque drapeau désactive UNE SEULE responsabilité :
   *
   *  - skipServiceStart : n'appelle PAS startForegroundService (A/B complet :
   *    audio expo-av en arrière-plan actif, ZÉRO service Android démarré) ;
   *  - skipSessionCreate : service créé MAIS pas de MediaSession.Builder
   *    (VirtualMediaPlayer toujours instancié) ;
   *  - skipPlayerCreate : service créé MAIS pas de VirtualMediaPlayer
   *    (MediaSession non créée non plus — elle en dépend) ;
   *  - skipProjection : projection d'état JAMAIS poussée au player virtuel
   *    (lastPayload mémorisé mais aucune invocation VMP) ;
   *  - skipMetadata : projection faite SANS métadonnées/artwork (MediaItem
   *    nu + état) — sépare la construction MediaMetadata du simple état.
   *
   * Volatiles (écrits depuis le thread module, lus sur le main thread).
   */
  object Flags {
    @Volatile var skipServiceStart: Boolean = false
    @Volatile var skipSessionCreate: Boolean = false
    @Volatile var skipPlayerCreate: Boolean = false
    @Volatile var skipProjection: Boolean = false
    @Volatile var skipMetadata: Boolean = false

    fun apply(flags: Map<String, Any?>) {
      skipServiceStart = flags["skipServiceStart"] as? Boolean ?: false
      skipSessionCreate = flags["skipSessionCreate"] as? Boolean ?: false
      skipPlayerCreate = flags["skipPlayerCreate"] as? Boolean ?: false
      skipProjection = flags["skipProjection"] as? Boolean ?: false
      skipMetadata = flags["skipMetadata"] as? Boolean ?: false
      MelodixDiagLog.step(
        "FLAGS",
        "noService=$skipServiceStart noSession=$skipSessionCreate " +
          "noPlayer=$skipPlayerCreate noProjection=$skipProjection " +
          "noMetadata=$skipMetadata"
      )
    }
  }
}
