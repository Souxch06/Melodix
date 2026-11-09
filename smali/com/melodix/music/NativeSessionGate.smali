.class public final Lcom/melodix/music/NativeSessionGate;
.super Ljava/lang/Object;
# Process-scoped launch budget survives Activity recreation; UI refs are weak.
# 0 verifying, 1 no-session, 2 session-expired, 3 valid, 4 error.
.field public static state:I
.field public static generation:I
.field public static autoUsed:Z
.field public static freshLogin:Z
.field public static loginActive:Z
.field public static expiredEvidence:Z
.field public static lastAttempt:I
.field public static owner:Ljava/lang/ref/WeakReference;
.field public static overlay:Landroid/view/View;

.method public static bind(Lcom/melodix/music/MainActivity;)V
    .locals 2
new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-nez v0, :bound
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->begin(Lcom/melodix/music/MainActivity;)V
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v0
    if-nez v0, :bound
    const/4 v0, 0x1
    const-string v1, "cookie-absent"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    :bound
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static transition(ILjava/lang/String;)V
    .locals 3
sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    sput p0, Lcom/melodix/music/NativeSessionGate;->state:I
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "session-state from="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->name(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " state="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->name(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " reason="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    return-void
.end method

.method public static name(I)Ljava/lang/String;
    .locals 1
packed-switch p0, :states
    const-string v0, "error"
    return-object v0
    :verifying
    const-string v0, "verifying"
    return-object v0
    :absent
    const-string v0, "no-session"
    return-object v0
    :expired
    const-string v0, "session-expired"
    return-object v0
    :valid
    const-string v0, "valid"
    return-object v0
    :states
    .packed-switch 0x0
        :verifying
        :absent
        :expired
        :valid
    .end packed-switch
.end method

.method public static begin(Lcom/melodix/music/MainActivity;)V
    .locals 5
sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    const/4 v1, 0x0
    sput v1, Lcom/melodix/music/NativeSessionGate;->lastAttempt:I
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    const-string v2, "verification-start"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    new-instance v1, Lcom/melodix/music/NativeSessionGateTask;
    const/4 v2, 0x0
    invoke-direct {v1, p0, v0, v2}, Lcom/melodix/music/NativeSessionGateTask;-><init>(Lcom/melodix/music/MainActivity;ILjava/lang/String;)V
    new-instance v2, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    const-wide/16 v3, 0xbb8
    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static initialUrl()Ljava/lang/String;
    .locals 2
invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v0
    if-nez v0, :player
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    if-nez v0, :already
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    const-string v1, "cookie-absent-auto-login"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    const-string v0, "https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1"
    return-object v0
    :already
    const-string v0, "about:blank"
    return-object v0
    :player
    const-string v0, "https://open.spotify.com/"
    return-object v0
.end method

.method public static blocked(Lcom/melodix/music/MainActivity;)Z
    .locals 2
sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x3
    if-eq v0, v1, :allowed
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-eqz v0, :paint
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->applySessionLoginSurface()V
    :paint
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    const/4 v0, 0x1
    return v0
    :allowed
    const/4 v0, 0x0
    return v0
.end method

.method public static pageFinished(Lcom/melodix/music/MainActivity;)V
    .locals 2
sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-eqz v0, :done
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->isLoginWebPath()Z
    move-result v0
    if-eqz v0, :return_check
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginPageCommitted:Z
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->applySessionLoginSurface()V
    goto :done
    :return_check
    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginPageCommitted:Z
    if-eqz v0, :done
    # Only an actual player-host return counts, not about:blank or an external host.
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :done
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v0
    const-string v1, "open.spotify.com"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginWebRequested:Z
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginPageCommitted:Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method

.method public static result(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 5
:try_start
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v1, "generation"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v1
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v1, v2, :done
    sget-boolean v1, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v1, :done
    const-string v1, "completed"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :done
    const-string v1, "attempt"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v1
    sget v2, Lcom/melodix/music/NativeSessionGate;->lastAttempt:I
    if-le v1, v2, :done
    sput v1, Lcom/melodix/music/NativeSessionGate;->lastAttempt:I
    const-string v1, "token"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_valid
    const-string v1, "libraryOk"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_valid
    const/4 v1, 0x3
    const-string v2, "token-and-library-ok"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    iput-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeLoginWebRequested:Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    const-string v1, "if(window.__sfNativeUiRefresh)window.__sfNativeUiRefresh();"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    goto :done
    :not_valid
    sget-boolean v1, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    if-nez v1, :failed
    const-string v1, "token"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :failed
    const-string v1, "tokenRefused"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :failed
    const-string v1, "libraryHttp"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v1
    const/16 v2, 0x191
    if-ne v1, v2, :failed
    const/4 v1, 0x1
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    const/4 v1, 0x2
    const-string v2, "completed-token-refused-library-401"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    sget-boolean v1, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    if-nez v1, :paint
    const/4 v1, 0x1
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->navigateLogin(Lcom/melodix/music/MainActivity;)V
    goto :paint
    :failed
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    const/4 v1, 0x4
    const-string v2, "verification-failed-no-logout"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    :paint
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    :done
    :try_end
    .catch Lorg/json/JSONException; {:try_start .. :try_end} :bad
    return-void
    :bad
    move-exception v0
    return-void
.end method

.method public static navigateLogin(Lcom/melodix/music/MainActivity;)V
    .locals 2
const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginWebRequested:Z
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeLoginPageCommitted:Z
    # Invalidate callbacks issued before this login without clearing any cookie.
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :done
    const-string v1, "https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1"
    invoke-static {v1}, Lcom/melodix/music/NativeSessionTrace;->button(Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :done
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->applySessionLoginSurface()V
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static requestLogin(Lcom/melodix/music/MainActivity;)V
    .locals 2
sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    if-nez v0, :login
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v0
    if-eqz v0, :login
    invoke-static {p0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V
    return-void
    :login
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->navigateLogin(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static canReconnect()Z
    .locals 2
sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x2
    if-ne v0, v1, :no
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static destroy(Lcom/melodix/music/MainActivity;)V
    .locals 1
const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-eqz v0, :done
    const/4 v0, 0x0
    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    sput v0, Lcom/melodix/music/NativeSessionGate;->state:I
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    :done
    return-void
.end method

.method public static paint(Lcom/melodix/music/MainActivity;)V
    .locals 0
invoke-static {p0}, Lcom/melodix/music/NativeSessionSurface;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method
