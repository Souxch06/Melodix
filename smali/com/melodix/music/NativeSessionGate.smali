.class public final Lcom/melodix/music/NativeSessionGate;
.super Ljava/lang/Object;
# Process-scoped launch budget survives Activity recreation; UI refs are weak.
# 0 verifying, 1 no-session, 2 session-expired, 3 valid, 4 error.
.field public static tokenApiHttp:I
.field public static tokenFallbackHttp:I
.field public static libraryHttp:I
.field public static lastReason:Ljava/lang/String;
.field public static activeLaunch:Z
.field public static state:I
.field public static volatile generation:I
.field public static initialNavigationIssued:Z
.field public static autoUsed:Z
.field public static freshLogin:Z
.field public static volatile loginActive:Z
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
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->activeLaunch:Z
    if-nez v0, :bound
    const/4 v0, 0x1
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->activeLaunch:Z
    invoke-static {}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->reset()V
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
    sput-object p1, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
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
    invoke-static {}, Lcom/melodix/music/NativeSessionVerificationFlight;->start()V
    const/4 v1, 0x0
    sput v1, Lcom/melodix/music/NativeSessionGate;->lastAttempt:I
    sput v1, Lcom/melodix/music/NativeSessionGate;->tokenApiHttp:I
    sput v1, Lcom/melodix/music/NativeSessionGate;->tokenFallbackHttp:I
    sput v1, Lcom/melodix/music/NativeSessionGate;->libraryHttp:I
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    const/4 v1, 0x1
    iput-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeSessionUnproven:Z
    const/4 v1, 0x0
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
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->initialNavigationIssued:Z
    if-nez v0, :already
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->initialNavigationIssued:Z
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
    const/4 v0, 0x0
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
    # A stale finish can report getUrl=player before onPageStarted(player).
    # Keep login active until a player main-frame start actually occurred.
    sget-boolean v0, Lcom/melodix/music/NativeSessionTrace;->lastStartedPlayer:Z
    if-nez v0, :player_started
    const-string v0, "session-verify result=await-player-start"
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    goto :done
    :player_started
    # Persist cookies at the login return, before an update can kill the process.
    # This is not proof of a fresh or valid Spotify session.
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->flushCookies()V
    # A page return is not proof of a freshly cleared/re-authenticated session.
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
    if-ne v1, v2, :rejected_generation
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
    if-le v1, v2, :rejected_attempt
    sput v1, Lcom/melodix/music/NativeSessionGate;->lastAttempt:I
    const-string v1, "tokenApiHttp"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->http(Lorg/json/JSONObject;Ljava/lang/String;)I
    move-result v1
    sput v1, Lcom/melodix/music/NativeSessionGate;->tokenApiHttp:I
    const-string v1, "tokenFallbackHttp"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->http(Lorg/json/JSONObject;Ljava/lang/String;)I
    move-result v1
    sput v1, Lcom/melodix/music/NativeSessionGate;->tokenFallbackHttp:I
    const-string v1, "libraryHttp"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->http(Lorg/json/JSONObject;Ljava/lang/String;)I
    move-result v1
    sput v1, Lcom/melodix/music/NativeSessionGate;->libraryHttp:I

    const-string v1, "token"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_valid
    const-string v1, "libraryOk"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_valid
    sget v1, Lcom/melodix/music/NativeSessionGate;->libraryHttp:I
    const/16 v2, 0xc8
    if-lt v1, v2, :not_valid
    const/16 v2, 0x12b
    if-gt v1, v2, :not_valid
    const/4 v1, 0x3
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const-string v2, "token-and-library-ok"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    iput-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeLoginWebRequested:Z
    iput-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeSessionUnproven:Z
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    const-string v1, "if(window.__sfNativeSessionVerified)window.__sfNativeSessionVerified();else if(window.__sfNativeUiRefresh)window.__sfNativeUiRefresh();"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    goto :done
    :not_valid
    # A missing token cannot establish an expired session. The library must
    # not have been queried without it. Keep all private UI blocked.
    const-string v1, "token"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :library_failure
    const-string v2, "token-unavailable"
    goto :unproven_error
    :library_failure
    sget v1, Lcom/melodix/music/NativeSessionGate;->libraryHttp:I
    const/16 v2, 0x191
    if-ne v1, v2, :library_forbidden
    const-string v2, "library-http-401"
    goto :unproven_error
    :library_forbidden
    const/16 v2, 0x193
    if-ne v1, v2, :failed
    const-string v2, "library-http-403"
    :unproven_error
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    const/4 v1, 0x4
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    goto :paint
    :failed
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v1, 0x0
    sput-boolean v1, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    const/4 v1, 0x4
    const-string v2, "verification-failed-no-logout"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    :paint
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    goto :done
    :rejected_generation
    const-string v1, "rejet=generation-perimee"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->reason(Lorg/json/JSONObject;Ljava/lang/String;)V
    goto :done
    :rejected_attempt
    const-string v1, "rejet=tentative-deja-traitee-ou-ancienne"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->reason(Lorg/json/JSONObject;Ljava/lang/String;)V
    :done
    :try_end
    .catch Lorg/json/JSONException; {:try_start .. :try_end} :bad
    return-void
    :bad
    move-exception v0
    return-void
.end method

.method public static retryFailed(ILjava/lang/String;)V
    .locals 3
    # Called only with fixed reasons. Stale callbacks cannot change a newer screen.
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne p0, v0, :done
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    if-eqz v0, :owner
    const/4 v1, 0x4
    if-ne v0, v1, :done
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
    const-string v1, "presentation-deadline-not-expiration"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    :owner
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :done
    invoke-static {p0}, Lcom/melodix/music/NativeSessionVerificationFlight;->fail(I)V
    const/4 v1, 0x4
    invoke-static {v1, p1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    :done
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
    invoke-static {v0, v1}, Lcom/melodix/music/NativeBridgeNavigation;->prepare(Landroid/webkit/WebView;Ljava/lang/String;)V
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
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :no
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x2
    if-ne v0, v1, :no
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    if-nez v0, :no
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    if-eqz v0, :no
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->canClear()Z
    move-result v0
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
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->activeLaunch:Z
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    const/4 v0, 0x0
    sput v0, Lcom/melodix/music/NativeSessionGate;->state:I
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->initialNavigationIssued:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->autoUsed:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    :done
    return-void
.end method

.method public static paint(Lcom/melodix/music/MainActivity;)V
    .locals 0
    invoke-static {p0}, Lcom/melodix/music/NativeSessionSurface;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static navigationStarted(Ljava/lang/String;)V
    .locals 3
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-eqz v0, :done
    if-eqz p0, :done
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v0
    const-string v1, "accounts.spotify.com"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    :owner_lookup
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    const/4 v1, 0x1
    iput-boolean v1, v0, Lcom/melodix/music/MainActivity;->nativeLoginPageCommitted:Z
    :done
    return-void
.end method

.method public static webFailure()V
    .locals 3
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x3
    if-eq v0, v1, :done
    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v0, 0x4
    const-string v1, "network-error-no-logout"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    :owner_lookup
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method

.method public static http(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 2
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v0
    const/16 v1, 0x64
    if-lt v0, v1, :none
    const/16 v1, 0x257
    if-gt v0, v1, :none
    return v0
    :none
    const/4 v0, 0x0
    return v0
.end method

.method public static resume(Lcom/melodix/music/MainActivity;)V
    .locals 2
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x3
    if-ne v0, v1, :done
    invoke-static {p0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method

.method public static details()Ljava/lang/String;
    .locals 4
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    sget-object v1, Lcom/melodix/music/NativeSessionGate;->lastReason:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · refus concordants="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->count()I
    move-result v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " · token API="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/NativeSessionGate;->tokenApiHttp:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " · repli="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/NativeSessionGate;->tokenFallbackHttp:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " · bibliothèque="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v2, Lcom/melodix/music/NativeSessionGate;->libraryHttp:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->appendTo(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    sget-object v3, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    if-eqz v3, :details_done
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/content/Context;
    if-eqz v3, :details_done
    invoke-static {v0, v3}, Lcom/melodix/music/NativeSessionBuildInfo;->append(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    :details_done
    return-object v0
.end method

.method public static refused(I)Z
    .locals 1
    const/16 v0, 0x190
    if-eq p0, v0, :yes
    const/16 v0, 0x191
    if-eq p0, v0, :yes
    const/16 v0, 0x193
    if-eq p0, v0, :yes
    const/4 v0, 0x0
    return v0
    :yes
    const/4 v0, 0x1
    return v0
.end method
