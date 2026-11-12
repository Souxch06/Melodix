.class public final Lcom/melodix/music/NativeSessionReconnect;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final generation:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionReconnect;->activity:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionReconnect;->generation:I
    return-void
.end method

# ONLY the explicitly labelled and explained reconnect button calls this.
# Its warning describes the full app-WebView deletion scope before the tap.
.method public static start(Lcom/melodix/music/MainActivity;)V
    .locals 3
    if-eqz p0, :done
    invoke-static {}, Lcom/melodix/music/NativeSessionReconnect;->allowed()Z
    move-result v0
    if-eqz v0, :done
    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-nez v0, :done
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionStore;->advance(Landroid/content/Context;)I
    move-result v0
    if-gez v0, :advance_ok
    invoke-static {p0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
    :advance_ok
    const-wide/16 v1, 0x0
    iput-wide v1, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    :try_start
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v1, :clear
    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V
    const-string v2, "about:blank"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeBridgeNavigation;->prepare(Landroid/webkit/WebView;Ljava/lang/String;)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :clear
    # Start both requested deletions before the asynchronous cookie callback.
    # A destroyed Activity must not suppress the WebStorage deletion.
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;
    move-result-object v1
    invoke-virtual {v1}, Landroid/webkit/WebStorage;->deleteAllData()V
    new-instance v1, Lcom/melodix/music/NativeSessionReconnect;
    invoke-direct {v1, p0, v0}, Lcom/melodix/music/NativeSessionReconnect;-><init>(Lcom/melodix/music/MainActivity;I)V
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    invoke-static {p0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

# This is a manual user choice, not evidence that Spotify expired a session.
.method public static allowed()Z
    .locals 2
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :no
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x2
    if-eq v0, v1, :yes
    const/4 v1, 0x4
    if-ne v0, v1, :no
    :yes
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3
    iget v1, p0, Lcom/melodix/music/NativeSessionReconnect;->generation:I
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v1, v2, :done
    iget-object v0, p0, Lcom/melodix/music/NativeSessionReconnect;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :activity_gone
    iget-boolean v1, v0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-eqz v1, :activity_gone
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :activity_gone
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :activity_gone
    :callback_try
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v1
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->flush()V
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v1
    if-nez v1, :failed
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/AppSingleton;->B:Z
    invoke-static {v1}, Lcom/melodix/music/AppSingleton;->proofClearLogout(Z)V
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;
    move-result-object v2
    const-string v1, "LoggedIn"
    const/4 p1, 0x0
    invoke-interface {v2, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v1, 0x1
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    const-string v2, "reconnect-user-confirmed"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->navigateLogin(Lcom/melodix/music/MainActivity;)V
    const/4 v1, 0x0
    iput-boolean v1, v0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    goto :done
    :callback_end
    .catch Ljava/lang/RuntimeException; {:callback_try .. :callback_end} :error
    :activity_gone
    # The operation was user-confirmed, but navigation needs a live Activity.
    # Unblock the gate so its next paint can offer retry/reconnect again.
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    const/4 v1, 0x4
    const-string v2, "reconnect-activity-gone"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    :done
    return-void
    :error
    move-exception v1
    :failed
    invoke-static {v0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static failed(Lcom/melodix/music/MainActivity;)V
    .locals 2
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v0, 0x4
    const-string v1, "reconnect-not-confirmed"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method
