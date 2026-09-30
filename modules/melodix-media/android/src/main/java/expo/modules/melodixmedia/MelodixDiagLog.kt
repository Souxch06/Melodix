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
 * logcat ADB. Ce collecteur écrit chaque breadcrumb natif ET chaque
 * exception (rattrapée ou NON rattrapée) dans un fichier applicatif
 * lisible depuis l'UI (Réglages → « Diagnostic technique ») — zéro ADB.
 *
 * Garanties strictes :
 *  - JAMAIS de throw : tout l'I/O est best-effort (diagnostiquer ne doit
 *    jamais pouvoir casser l'application) ;
 *  - fichier BORNÉ : quand > 512 Ko, on ne conserve que la queue ~256 Ko ;
 *  - AUCUNE donnée sensible : tout texte écrit (extra ET pile) passe par
 *    [sanitize] : URLs masquées, jetons/Bearer/en-têtes masqués, chaînes
 *    hexadécimales longues (client id/secret) masquées ;
 *  - thread (nom + id) ET timestamp (UTC, millisecondes) sur chaque ligne ;
 *  - la pile complète inclut les causes imbriquées (« Caused by: … »)
 *    via Throwable.printStackTrace standard.
 *
 * Le piège d'exceptions non rattrapées ENVELOPPE le handler précédent :
 * l'erreur est écrite (flush synchrone) PUIS le handler d'origine est
 * délégué — le vrai crash est CONSERVÉ à l'identique.
 */
object MelodixDiagLog {

  private const val TAG = "MelodixDiagLog"
  private const val FILE_NAME = "melodix-native-crash.log"
  private const val MAX_BYTES = 512 * 1024L
  private const val KEEP_TAIL_BYTES = 256 * 1024L
  private const val MAX_EXTRA_CHARS = 512
  private const val MAX_STACK_CHARS = 24 * 1024

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

  // --------------------------------------------------------------------
  // Sanitisation — JAMAIS de token/secret/URL dans le journal (cahier §1).
  // --------------------------------------------------------------------

  /** URLs complètes (streaming, artwork) → <url>. */
  private val URL_REGEX = Regex("https?://\\S+")

  /**
   * Jetons et secrets dans les formes « clé=valeur » habituelles des piles
   * (Authorization, Bearer, token, client_secret, client_id, api_key...).
   */
  private val SECRET_KV_REGEX = Regex(
    "(?i)(bearer\\s+|authorization\\s*[:=]\\s*|token\\s*[:=]\\s*|" +
      "access_token\\s*[:=]\\s*|refresh_token\\s*[:=]\\s*|" +
      "client_secret\\s*[:=]\\s*|client_id\\s*[:=]\\s*|api_key\\s*[:=]\\s*)\\S+"
  )

  /** Chaînes hexadécimales longues (client ids/secrets Spotify 32 hex). */
  private val LONG_HEX_REGEX = Regex("\\b[0-9a-fA-F]{32,}\\b")

  /** Jetons opaques longs (base64/base64url ≥ 60 chars, ex. jetons OAuth). */
  private val LONG_TOKEN_REGEX = Regex("\\b[0-9A-Za-z_\\-+/=]{60,}\\b")

  /**
   * Masque URLs, jetons, secrets et identifiants longs, et borne la longueur.
   * Appliqué à TOUT texte écrit : messages d'extra comme piles complètes.
   */
  private fun sanitize(raw: String?, maxChars: Int): String {
    if (raw.isNullOrEmpty()) {
      return ""
    }

    return raw
      .replace(URL_REGEX, "<url>")
      .replace(SECRET_KV_REGEX, "<redacted>")
      .replace(LONG_HEX_REGEX, "<redacted-hex>")
      .replace(LONG_TOKEN_REGEX, "<redacted-token>")
      .take(maxChars)
  }

  // --------------------------------------------------------------- accès

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

  /**
   * Piège global : écrit TOUTE exception non rattrapée (tous threads, y
   * compris les callbacks/executors Media3 hors de tout try/catch Kotlin),
   * PUIS délègue au handler précédent — le crash réel est CONSERVÉ.
   */
  fun installCrashTrap() {
    if (!crashTrapInstalled.compareAndSet(false, true)) {
      return
    }

    try {
      val previous = Thread.getDefaultUncaughtExceptionHandler()

      Thread.setDefaultUncaughtExceptionHandler { thread, error ->
        writeFatal(thread, error)
        try {
          previous?.uncaughtException(thread, error)
        } catch (ignored: Throwable) {
          // Le handler précédent ne doit pas faire échouer le nôtre.
        }
      }
    } catch (t: Throwable) {
      Log.w(TAG, "crash trap non installé", t)
    }
  }

  /**
   * Entrée de crash FATAL au format BLOC exigé (§1) :
   *
   *   FATAL_UNCAUGHT
   *   timestamp=<ISO-8601 UTC ms>
   *   thread=<nom> (tid=<id>)
   *   exception=<classe>
   *   message=<message sanitizé>
   *   cause=<classe: message de chaque cause imbriquée, chaînées>
   *   stacktrace=<pile COMPLÈTE sanitizée, "Caused by:" inclus>
   *
   * Écriture synchrone best-effort AVANT la délégation au handler
   * précédent : le fichier survit au crash et reste lisible au prochain
   * lancement (§5).
   */
  private fun writeFatal(thread: Thread, error: Throwable) {
    val file = logFile ?: return

    try {
      synchronized(this) {
        val causes = buildString {
          var current: Throwable? = error.cause
          if (current == null) {
            append("aucune")
          }
          var first = true
          while (current != null) {
            if (!first) {
              append(" <- ")
            }
            append(current.javaClass.name)
            append(": ")
            append(current.message ?: "")
            first = false
            current = current.cause
          }
        }

        val stack = StringWriter()
        error.printStackTrace(PrintWriter(stack))

        val block = buildString {
          append("FATAL_UNCAUGHT\n")
          append("timestamp=")
          append(isoFormatter.get()?.format(Date()) ?: "?")
          append('\n')
          append("thread=")
          append(sanitize(thread.name, 64))
          append(" tid=")
          append(thread.id)
          append('\n')
          append("exception=")
          append(error.javaClass.name)
          append('\n')
          append("message=")
          append(sanitize(error.message, MAX_EXTRA_CHARS))
          append('\n')
          append("cause=")
          append(sanitize(causes, MAX_EXTRA_CHARS * 2))
          append('\n')
          append("stacktrace=\n")
          append(sanitize(stack.toString(), MAX_STACK_CHARS))
          append('\n')
          append("===\n")
        }

        trimIfNeeded(file)
        file.appendText(block)
      }
    } catch (t: Throwable) {
      Log.w(TAG, "FATAL non écrit", t)
    }
  }

  /** Étape nommée (breadcrumbs DIAG du chemin bridge→service→callbacks). */
  fun step(step: String, extra: String? = null) {
    appendRaw(step, extra, null)
  }

  /** Exception RATTRAPÉE mais diagnostiquée (jamais masquée silencieusement). */
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
        trimIfNeeded(file)

        val currentThread = Thread.currentThread()
        // Format : ISO-8601 UTC ms | thread=<nom> tid=<id> | ÉTAPE | extra
        val line = buildString {
          append(isoFormatter.get()?.format(Date()) ?: "?")
          append(" | thread=")
          append(sanitize(currentThread.name, 64))
          append(" tid=")
          append(currentThread.id)
          append(" | ")
          append(sanitize(step, 96))
          val extraText = sanitize(extra, MAX_EXTRA_CHARS)
          if (extraText.isNotEmpty()) {
            append(" | ")
            append(extraText)
          }
          append('\n')
        }

        file.appendText(line)

        if (throwable != null) {
          // Pile COMPLÈTE (causes imbriquées incluses), sanitée et bornée.
          val stack = StringWriter()
          throwable.printStackTrace(PrintWriter(stack))
          val stackText = sanitize(stack.toString(), MAX_STACK_CHARS)
          file.appendText(stackText)
          if (!stackText.endsWith("\n")) {
            file.appendText("\n")
          }
        }
      }
    } catch (t: Throwable) {
      Log.w(TAG, "append ignoré ($step)", t)
    }
  }

  /** Borne : tronque depuis le début pour garder les événements récents. */
  private fun trimIfNeeded(file: File) {
    if (file.exists() && file.length() > MAX_BYTES) {
      try {
        val content = file.readText()
        val tail = content.takeLast(KEEP_TAIL_BYTES.toInt())
        file.writeText("…[journal tronqué aux ${KEEP_TAIL_BYTES / 1024} Ko récents]…\n$tail")
      } catch (t: Throwable) {
        Log.w(TAG, "trim ignoré", t)
      }
    }
  }

  // ------------------------------------------------------------------ drapeaux

  /**
   * Drapeaux d'isolation A/B + Test C (pilotés depuis Réglages, TEMPORAIRE).
   * Chaque drapeau désactive UNE SEULE responsabilité :
   *
   *  - skipServiceStart : coupe TOUTE la chaîne mediaBridge → contrôleur →
   *    service (A/B complet : audio expo-av en arrière-plan actif, ZÉRO
   *    service Android démarré) ;
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
   * Tous à false par défaut : le comportement applicatif est IDENTIQUE.
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
