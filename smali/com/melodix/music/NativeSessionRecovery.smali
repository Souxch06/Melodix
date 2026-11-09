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

.method public static verify(Lcom/melodix/music/MainActivity;)V
    .locals 4
    :verify_try
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->begin(Lcom/melodix/music/MainActivity;)V
    const-wide/16 v0, 0x0
    iput-wide v0, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->scheduleNativeSessionTimeout()V
    const-string v1, "session-verify result=retry"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-nez v0, :verify_webview
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->C()V
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :verify_done
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
    const-string v1, "(window.__sfLoadBundledBridge||function(){} )('spotify_bridge.js');if(window.__sfRequestSessionVerification)window.__sfRequestSessionVerification();"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    goto :verify_done
    :verify_navigate
    const-string v1, "session-verify result=player-navigation"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    const-string v1, "https://open.spotify.com/"
    invoke-static {v1}, Lcom/melodix/music/NativeSessionTrace;->recovery(Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :verify_done
    :verify_end
    .catch Ljava/lang/RuntimeException; {:verify_try .. :verify_end} :verify_error
    return-void
    :verify_error
    move-exception v0
    const-string v1, "session-verify result=failed"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    return-void
.end method
