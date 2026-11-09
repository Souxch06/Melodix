.class public final Lcom/melodix/music/NativeSessionReconnect;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;
.field private final activity:Ljava/lang/ref/WeakReference;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionReconnect;->activity:Ljava/lang/ref/WeakReference;
    return-void
.end method

# ONLY the explicit reconnect action enters here. Retry/login never erase.
.method public static start(Lcom/melodix/music/MainActivity;)V
    .locals 3
    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-nez v0, :reconnect_done
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    const-wide/16 v0, 0x0
    iput-wide v0, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    :reconnect_try
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :reconnect_clear
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V
    const-string v1, "about:blank"
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :reconnect_clear
    const-string v0, "[{\"kind\":\"state\",\"state\":\"loading\",\"title\":\"Reconnexion Spotify\",\"subtitle\":\"Suppression de la session avant ouverture de la connexion…\",\"uri\":\"\"}]"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    new-instance v1, Lcom/melodix/music/NativeSessionReconnect;
    invoke-direct {v1, p0}, Lcom/melodix/music/NativeSessionReconnect;-><init>(Lcom/melodix/music/MainActivity;)V
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V
    :reconnect_end
    .catch Ljava/lang/RuntimeException; {:reconnect_try .. :reconnect_end} :reconnect_error
    :reconnect_done
    return-void
    :reconnect_error
    move-exception v0
    invoke-static {p0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3
    iget-object v0, p0, Lcom/melodix/music/NativeSessionReconnect;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :callback_done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :callback_done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :callback_done
    :callback_try
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v1
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->flush()V
    # Never enter login before cookie deletion has completed and been checked.
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v1
    if-nez v1, :callback_failed
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;
    move-result-object v1
    invoke-virtual {v1}, Landroid/webkit/WebStorage;->deleteAllData()V
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/AppSingleton;->B:Z
    invoke-static {v1}, Lcom/melodix/music/AppSingleton;->proofClearLogout(Z)V
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
    const-string v1, "LoggedIn"
    const/4 p1, 0x0
    invoke-interface {v2, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    iput-boolean p1, v0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->openSpotifyLogin()V
    :callback_end
    .catch Ljava/lang/RuntimeException; {:callback_try .. :callback_end} :callback_error
    :callback_done
    return-void
    :callback_error
    move-exception v1
    :callback_failed
    invoke-static {v0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static failed(Lcom/melodix/music/MainActivity;)V
    .locals 1
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    const-string v0, "[{\"kind\":\"state\",\"state\":\"error\",\"title\":\"Reconnexion interrompue\",\"subtitle\":\"La suppression de session n’a pas pu être confirmée. La connexion n’a pas été ouverte.\",\"uri\":\"melodix:action:retry-library\",\"secondaryUri\":\"melodix:action:reconnect\"}]"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeHomeShelfRenderer;->render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    return-void
.end method
