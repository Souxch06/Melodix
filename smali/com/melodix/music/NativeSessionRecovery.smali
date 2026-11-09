.class public final Lcom/melodix/music/NativeSessionRecovery;
.super Ljava/lang/Object;

# Presence is a routing hint only. Never stores/exports a cookie or grants proof.
.method public static hasCookie()Z
    .locals 3
    :cookie_try
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    if-eqz v0, :cookie_no
    const-string v1, "https://open.spotify.com/"
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cookie_no
    const-string v1, "(^|;[ ]*)sp_dc=[^;]+"
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
    move-result v2
    return v2
    :cookie_end
    .catch Ljava/lang/RuntimeException; {:cookie_try .. :cookie_end} :cookie_error
    :cookie_error
    move-exception v0
    :cookie_no
    const/4 v2, 0x0
    return v2
.end method


# Commit WebView cookies on a recognized login return; never read or copy them.
.method public static flushCookies()V
    .locals 1
    :try_start
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/webkit/CookieManager;->flush()V
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    return-void
.end method


# Fail closed before committing an APK replacement if cookie flush fails.
.method public static flushForUpdate()Z
    .locals 2
    :try_start
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    if-eqz v0, :failed
    invoke-virtual {v0}, Landroid/webkit/CookieManager;->flush()V
    const/4 v1, 0x1
    return v1
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :failed
    const/4 v1, 0x0
    return v1
.end method

.method public static verify(Lcom/melodix/music/MainActivity;)V
    .locals 4
    :verify_try
    invoke-static {}, Lcom/melodix/music/NativeSessionVerificationFlight;->busy()Z
    move-result v0
    if-eqz v0, :verify_begin
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    const/4 v1, 0x0
    const-string v2, "relance=ignoree-verification-en-cours"
    invoke-static {v0, v1, v2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->note(IILjava/lang/String;)V
    goto :verify_done
    :verify_begin
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->begin(Lcom/melodix/music/MainActivity;)V
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    const/4 v1, 0x0
    const-string v2, "relance-demandee"
    invoke-static {v0, v1, v2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->note(IILjava/lang/String;)V
    const-wide/16 v0, 0x0
    iput-wide v0, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->scheduleNativeSessionTimeout()V
    const-string v1, "session-verify result=retry"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-nez v0, :verify_webview
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->C()V
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :verify_missing_webview
    :verify_webview
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :verify_navigate
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v2
    const-string v3, "open.spotify.com"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :verify_navigate
    # Reuse the existing classifier/shell/loader order. Their install guards
    # prevent duplicate listeners. No account navigation or spoof reinjection.
    const-string v1, "runtime_state.js"
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    const-string v1, "native_ui_shell.js"
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    # The shell/bridge injection may still be queued at onPageFinished. Wait
    # for the current generation's function instead of declaring an immediate failure.
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    new-instance v3, Lcom/melodix/music/NativeSessionRetryLaunch;
    invoke-direct {v3, v0, v2}, Lcom/melodix/music/NativeSessionRetryLaunch;-><init>(Landroid/webkit/WebView;I)V
    invoke-virtual {v3}, Lcom/melodix/music/NativeSessionRetryLaunch;->run()V
    # Independent readback of the sanitized observation, bounded to 30 polls.
    new-instance v1, Lcom/melodix/music/NativeSessionDiagnosticPull;
    invoke-direct {v1, v0, v2}, Lcom/melodix/music/NativeSessionDiagnosticPull;-><init>(Landroid/webkit/WebView;I)V
    invoke-virtual {v1}, Lcom/melodix/music/NativeSessionDiagnosticPull;->run()V
    goto :verify_done
    :verify_navigate
    const-string v1, "session-verify result=player-navigation"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    const-string v1, "https://open.spotify.com/"
    invoke-static {v1}, Lcom/melodix/music/NativeSessionTrace;->recovery(Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    goto :verify_done
    :verify_missing_webview
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    const-string v2, "retry-webview-unavailable"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    :verify_done
    :verify_end
    .catch Ljava/lang/RuntimeException; {:verify_try .. :verify_end} :verify_error
    return-void
    :verify_error
    move-exception v0
    const-string v1, "session-verify result=failed"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    const-string v2, "retry-launch-failed"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    return-void
.end method
