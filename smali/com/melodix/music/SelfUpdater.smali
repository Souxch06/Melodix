.class public final Lcom/melodix/music/SelfUpdater;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Auto-update du canal preview. Chaque correctif publie une release GitHub
# publique (workflow preview-apk, marqueur [preview-release]) avec l'APK signe
# et son .sha256. Au lancement : comparaison du commit embarque avec la release,
# telechargement si different, verification SHA-256 systematique, refus de
# downgrade via versionCode, puis proposition d'installation. Aucun token.

.field private static final EP:Ljava/lang/String; = "https://api.github.com/repos/Souxch06/Melodix/releases?per_page=10"

.field private static volatile commitStarted:Z

# APK verifie en attente d'installation silencieuse.
.field private static volatile pendingApk:Ljava/io/File;

# Passe a vrai quand l'app part en arriere-plan (MainActivity.onStop).
.field private static volatile stoppedFlag:Z

.field private final ctx:Landroid/content/Context;


# --- entree ---------------------------------------------------------------

.method public static check(Landroid/content/Context;)V
    .locals 3

    if-eqz p0, :done

    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/melodix/music/SelfUpdater;

    invoke-direct {v1, p0}, Lcom/melodix/music/SelfUpdater;-><init>(Landroid/content/Context;)V

    const-string v2, "melodix-self-update"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/SelfUpdater;->ctx:Landroid/content/Context;

    return-void
.end method


# --- orchestration --------------------------------------------------------
# v0 = PackageInfo local, v1 = tag/courant, v2 = ctx, v3 = PackageManager,
# v4 = nom du paquet local, v5 = drapeau/temp, v6 = mon sha7, v7 = fichier,
# v8 = tableau de selection [tag, commit7, apkUrl, sumUrl], v9 = index/temp.

.method public final run()V
    .locals 10

    :try_start_0
    # Laisser le demarrage (et l'eventuel rapport de crash) se terminer.
    const-wide/16 v0, 0x2ee0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    iget-object v2, p0, Lcom/melodix/music/SelfUpdater;->ctx:Landroid/content/Context;

    if-eqz v2, :done

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    if-eqz v3, :done

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v1, :done

    const-string v6, "-"

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :done

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x7

    if-ge v6, v7, :sha_long_enough

    goto :done

    :sha_long_enough
    const/4 v6, 0x0

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    # mon sha7 = v6

    sget-object v1, Lcom/melodix/music/SelfUpdater;->EP:Ljava/lang/String;

    invoke-static {v1}, Lcom/melodix/music/SelfUpdater;->fetch(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :done

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :done

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v8, 0x0

    :loop
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v1, v9, :loop_done

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :next

    invoke-static {v9}, Lcom/melodix/music/SelfUpdater;->pickRelease(Lorg/json/JSONObject;)[Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :next

    goto :loop_done

    :next
    add-int/lit8 v1, v1, 0x1

    goto :loop

    :loop_done
    if-eqz v8, :done

    # v8 = [tag, commit7, apkUrl, sumUrl]
    const/4 v1, 0x0

    aget-object v1, v8, v1

    const/4 v9, 0x1

    aget-object v9, v8, v9

    invoke-virtual {v9, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :update_available

    # La release publiee est celle qui tourne deja.
    goto :done

    :update_available
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "melodix-update-"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".apk"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/io/File;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    invoke-direct {v6, v7, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :fetch_apk

    goto :verify

    :fetch_apk
    const/4 v5, 0x2

    aget-object v5, v8, v5

    invoke-static {v5, v6}, Lcom/melodix/music/SelfUpdater;->download(Ljava/lang/String;Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :done

    :verify
    # Verification SHA-256 SYSTÉMATIQUE (aussi pour un cache corrompu).
    const/4 v5, 0x3

    aget-object v5, v8, v5

    if-eqz v5, :archive

    invoke-static {v5, v6}, Lcom/melodix/music/SelfUpdater;->verifySum(Ljava/lang/String;Ljava/io/File;)Z

    move-result v5

    if-nez v5, :archive

    goto :done

    :archive
    # Le paquet archive doit correspondre au paquet installe ET apporter un
    # versionCode STRICTEMENT superieur : jamais de downgrade, jamais de
    # croisement de paquet.
    const/4 v5, 0x0

    invoke-virtual {v3, v6, v5}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    if-eqz v3, :bad_apk

    iget-object v4, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    if-eqz v4, :bad_apk

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :bad_apk

    iget v3, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v3, v0, :bad_apk

    # --- Mise a jour AUTOMATIQUE : aucun geste utilisateur attendu. ---
    # L'APK verifie reste en attente ; il s'installe silencieusement des que
    # l'app part en arriere-plan : le lancement suivant est deja a jour.
    sput-object v6, Lcom/melodix/music/SelfUpdater;->pendingApk:Ljava/io/File;

    # Autorisation "installer des apps" (une seule fois par appareil) : sans
    # elle, seul le dialogue menant au reglage reste possible.
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :auto_ready

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v4

    if-nez v4, :auto_ready

    invoke-static {v2, v1, v6}, Lcom/melodix/music/SelfUpdater;->prompt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    goto :done

    :auto_ready
    # L'installation sans AUCUNE confirmation systeme exige Android 12+ ;
    # en dessous, le dialogue reste le meilleur possible.
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-ge v3, v4, :silent_ready

    invoke-static {v2, v1, v6}, Lcom/melodix/music/SelfUpdater;->prompt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    goto :done

    :silent_ready
    # Deja en arriere-plan (fin de session ou parti pendant le telechargement) ?
    sget-boolean v3, Lcom/melodix/music/SelfUpdater;->stoppedFlag:Z

    if-eqz v3, :wait_background

    invoke-static {v2}, Lcom/melodix/music/SelfUpdater;->installPending(Landroid/content/Context;)V

    goto :done

    :wait_background
    # Sinon attendre le passage en arriere-plan (4 min max) ; sinon ce sera
    # fait par le prochain onStop (pendingApk reste pose).
    const/4 v3, 0x0

    :wait_loop
    const/16 v4, 0x30

    if-ge v3, v4, :wait_giveup

    invoke-static {}, Lcom/melodix/music/SelfUpdater;->isCommitStarted()Z

    move-result v4

    if-nez v4, :wait_done

    const-wide/16 v7, 0x1388

    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v3, v3, 0x1

    goto :wait_loop

    :wait_giveup
    sget-boolean v3, Lcom/melodix/music/SelfUpdater;->stoppedFlag:Z

    if-eqz v3, :wait_done

    invoke-static {v2}, Lcom/melodix/music/SelfUpdater;->installPending(Landroid/content/Context;)V

    :wait_done
    goto :done

    :bad_apk
    invoke-virtual {v6}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method


# --- selection de la release ----------------------------------------------

# Retourne [tag, commit7, apkUrl, sumUrl] si cette release est le canal
# preview attendu et porte un APK ; null sinon. sumUrl peut etre null.
.method private static pickRelease(Lorg/json/JSONObject;)[Ljava/lang/String;
    .locals 11

    const/4 v0, 0x0

    const-string v1, "tag_name"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :ret

    const-string v3, "v"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :ret

    const-string v3, "-test."

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :ret

    const-string v3, "-preview"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :ret

    # commit du build publie (le workflow l'ecrit en target_commitish).
    const-string v3, "target_commitish"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :ret

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x7

    if-lt v4, v5, :commit_ok

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :commit_ok
    const-string v4, "assets"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :ret

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :assets
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v5, v8, :picked

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    if-eqz v8, :asset_next

    const-string v9, "name"

    invoke-virtual {v8, v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "browser_download_url"

    invoke-virtual {v8, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v9, :asset_next

    if-eqz v8, :asset_next

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    if-eqz v10, :asset_next

    const-string v10, ".apk.sha256"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :check_apk

    move-object v6, v8

    goto :asset_next

    :check_apk
    const-string v10, ".apk"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :asset_next

    move-object v7, v8

    :asset_next
    add-int/lit8 v5, v5, 0x1

    goto :assets

    :picked
    if-eqz v7, :ret

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object v3, v0, v1

    const/4 v1, 0x2

    aput-object v7, v0, v1

    const/4 v1, 0x3

    aput-object v6, v0, v1

    :ret
    return-object v0
.end method


# --- HTTP -----------------------------------------------------------------

.method private static fetch(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/16 v2, 0x3a98

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v2, 0x7530

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v2, "User-Agent"

    const-string v3, "Melodix-Preview-Updater"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Accept"

    const-string v3, "application/vnd.github+json"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-eq v2, v3, :ok

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :ok
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v4, 0x2000

    new-array v4, v4, [B

    const/4 v5, 0x0

    :copy
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :copied

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    const v5, 0x40000

    if-gt v6, v5, :copied

    const/4 v5, 0x0

    goto :copy

    :copied
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    new-instance v1, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    return-object v0
.end method

.method private static download(Ljava/lang/String;Ljava/io/File;)Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 v3, 0x3a98

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const v3, 0x1d4c0

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v3, "User-Agent"

    const-string v4, "Melodix-Preview-Updater"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0xc8

    if-eq v3, v4, :ok

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return v0

    :ok
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/high16 v5, 0x10000

    new-array v5, v5, [B

    :copy
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :copied

    invoke-virtual {v4, v5, v0, v6}, Ljava/io/FileOutputStream;->write([BII)V

    goto :copy

    :copied
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    return v0
.end method


# --- verification ---------------------------------------------------------

# sumUrl pointe sur le fichier .sha256 publie ("hex  nom.apk"). Retourne vrai
# si le SHA-256 local du fichier correspond ; faux sinon (fichier supprime).
.method private static verifySum(Ljava/lang/String;Ljava/io/File;)Z
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/melodix/music/SelfUpdater;->fetch(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :fail

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x40

    if-ge v1, v2, :head_ok

    goto :fail

    :head_ok
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-lez v1, :hex_ok

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :hex_ok
    invoke-static {p1}, Lcom/melodix/music/SelfUpdater;->sha256Hex(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :fail

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :fail

    const/4 p0, 0x1

    return p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    :fail
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return v0
.end method

.method private static sha256Hex(Ljava/io/File;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "SHA-256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/high16 p0, 0x10000

    new-array p0, p0, [B

    const/4 v3, 0x0

    :copy
    invoke-virtual {v2, p0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    if-lez v4, :copied

    invoke-virtual {v1, p0, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    goto :copy

    :copied
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    array-length v2, p0

    const/4 v4, 0x0

    :hex
    if-ge v4, v2, :done_hex

    aget-byte v5, p0, v4

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v3, 0x2

    if-lt v6, v3, :pad

    goto :append

    :pad
    const-string v3, "0"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :append
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :hex

    :done_hex
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    return-object v0
.end method


# --- proposition + installation -------------------------------------------

.method private static prompt(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz v0, :done

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :done

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :done

    new-instance v1, Lcom/melodix/music/SelfUpdater$Prompt;

    invoke-direct {v1, v0, p1, p2}, Lcom/melodix/music/SelfUpdater$Prompt;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/io/File;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :done
    return-void
.end method

.method public static noteStopped()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/melodix/music/SelfUpdater;->stoppedFlag:Z

    return-void
.end method

.method public static isCommitStarted()Z
    .locals 1

    sget-boolean v0, Lcom/melodix/music/SelfUpdater;->commitStarted:Z

    return v0
.end method

# Declenche l'installation silencieuse (sur un fil dedie) de l'APK en attente.
# Synchronisee : onStop et le fil de verification ne peuvent pas commiter deux fois.
.method public static declared-synchronized installPending(Landroid/content/Context;)V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/melodix/music/SelfUpdater;->pendingApk:Ljava/io/File;

    if-eqz v0, :done

    sget-boolean v1, Lcom/melodix/music/SelfUpdater;->commitStarted:Z

    if-nez v1, :done

    const/4 v1, 0x1

    sput-boolean v1, Lcom/melodix/music/SelfUpdater;->commitStarted:Z

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/melodix/music/SelfUpdater$Installer;

    invoke-direct {v2, p0, v0}, Lcom/melodix/music/SelfUpdater$Installer;-><init>(Landroid/content/Context;Ljava/io/File;)V

    const-string v0, "melodix-install"

    invoke-direct {v1, v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :done
    return-void
.end method

.method public static install(Landroid/content/Context;Ljava/io/File;)V
    .locals 9

    if-eqz p0, :done

    if-eqz p1, :done

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-eqz v0, :done

    # Android 8+ : l'installation hors store exige une autorisation une fois.
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :grant_checked

    goto :do_install

    :grant_checked
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v1

    if-nez v1, :do_install

    # Pas encore autorise : ouvrir le reglage dedie, l'utilisateur revient et
    # relance l'installation (le fichier reste en cache).
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {p1, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string p1, "Autorisez l'installation pour Melodix, puis relancez l'application."

    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :done

    :do_install
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    move-result-object v0

    new-instance v1, Landroid/content/pm/PackageInstaller$SessionParams;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/content/pm/PackageInstaller$SessionParams;-><init>(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageInstaller$SessionParams;->setAppPackageName(Ljava/lang/String;)V

    # Android 12+ : mise a jour de soi-meme, meme signature, versionCode
    # superieur -> AUCUNE confirmation utilisateur (USER_ACTION_NOT_REQUIRED).
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v3, v4, :ura_done

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/content/pm/PackageInstaller$SessionParams;->setRequireUserAction(I)V

    :ura_done
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageInstaller;->createSession(Landroid/content/pm/PackageInstaller$SessionParams;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageInstaller;->openSession(I)Landroid/content/pm/PackageInstaller$Session;

    move-result-object v0

    # openWrite(String,J,J) = 6 registres : forme /range obligatoire (registres
    # consecutifs v0..v5 : session, nom, offset 0L, longueur).
    const-string v1, "melodix"

    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageInstaller$Session;->openWrite(Ljava/lang/String;JJ)Ljava/io/OutputStream;

    move-result-object v2

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/high16 p1, 0x10000

    new-array p1, p1, [B

    const/4 v4, 0x0

    :stream
    invoke-virtual {v3, p1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-lez v5, :streamed

    invoke-virtual {v2, p1, v4, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :stream

    :streamed
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageInstaller$Session;->fsync(Ljava/io/OutputStream;)V

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    new-instance p1, Landroid/content/Intent;

    const-string v2, "com.melodix.music.SELF_UPDATE_COMMIT"

    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v2, 0x537

    const/high16 v3, 0x48000000    # 134217728.0f

    invoke-static {p0, v2, p1, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageInstaller$Session;->commit(Landroid/content/IntentSender;)V

    invoke-virtual {v0}, Landroid/content/pm/PackageInstaller$Session;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :done
    return-void
.end method
