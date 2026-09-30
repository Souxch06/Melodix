package expo.modules.melodixmedia

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.media3.datasource.DataSourceBitmapLoader
import androidx.media3.datasource.DefaultDataSource
import androidx.media3.session.CacheBitmapLoader
import com.google.common.util.concurrent.ListeningExecutorService
import com.google.common.util.concurrent.MoreExecutors
import java.util.concurrent.Executors

/**
 * Chargement des POCHETTES (phase 5C) — délégué au mécanisme Media3 1.3.1
 * plutôt qu'à un système maison (contrat §5 : privilégier l'existant
 * lorsqu'il est suffisant) :
 *
 *  - `DataSourceBitmapLoader` (media3-datasource) : téléchargement HTTP(S)
 *    asynchrone sur un executor MONO-THREAD — les pochettes n'ont pas besoin
 *    d'être parallèles, juste de ne jamais toucher le main thread. Le moteur
 *    audio n'en sait RIEN : un souci de pochette ne touche JAMAIS la lecture.
 *  - `CacheBitmapLoader` (media3-session) : cache MÉMOIRE strictement borné
 *    — une seule entrée (le dernier chargement). Aucun cache illimité,
 *    aucun fichier disque, aucune URL consignée en log.
 *  - `DefaultDataSource.Factory` : schémas https/http (DefaultHttpDataSource
 *    réseau → nécessite INTERNET, déjà déclaré par l'app pour le streaming)
 *    + file/content. AUCUNE requête Audius/YouTube/Spotify n'émane d'ici :
 *    la SEULE URL utilisée est `artworkUri` projetée depuis le JS.
 *  - Options de décodage : RGB_565 → mémoire divisée par deux (pochettes
 *    JPEG, sans canal alpha utile).
 *
 * Résilience : si l'URL est invalide/échoue, la future se termine en erreur
 * → DefaultMediaNotificationProvider logge et affiche la notification SANS
 * large icon (comportement natif média3, aucune action de notre part).
 */
object MelodixArtworkLoader {

  /** Executor dédié : thread démon nommé (aucun blocage d'arrêt du process). */
  private val artworkExecutor: ListeningExecutorService =
    MoreExecutors.listeningDecorator(
      Executors.newSingleThreadExecutor { runnable ->
        Thread(runnable, "MelodixArtwork").apply { isDaemon = true }
      }
    )

  /** Décodage mémoire divisé par deux — appelé au build du loader. */
  internal fun bitmapOptions(): BitmapFactory.Options =
    BitmapFactory.Options().apply { inPreferredConfig = Bitmap.Config.RGB_565 }

  /** Construit le BitmapLoader de la MediaSession (cache borné intégré). */
  fun create(context: Context): CacheBitmapLoader {
    // DIAG 4.4.7 : le chargement tourne sur le thread « MelodixArtwork » —
    // toute exception non rattrapée y est écrite par le piège global.
    MelodixDiagLog.step("ARTWORK_LOADER_CREATE")
    return CacheBitmapLoader(
      DataSourceBitmapLoader(
        artworkExecutor,
        DefaultDataSource.Factory(context),
        bitmapOptions()
      )
    )
  }
}
