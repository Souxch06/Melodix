.class public final Lcom/melodix/music/NativeSessionTrace;
.super Ljava/lang/Object;
.field public static imageCount:I
# Main-frame document generation, updated only from WebView onPageStarted.
.field public static documentGeneration:I
# Last top-level start, reduced to an origin category; no URL is retained.
.field public static lastStartedPlayer:Z

# URL exists only transiently here. Only a closed category reaches the journal.
.method public static navigation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    :nav_try
    const-string v0, "other"
    if-eqz p0, :nav_emit
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v2
    const-string v3, "file"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :nav_remote
    const-string v0, "local"
    goto :nav_emit
    :nav_remote
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v2
    const-string v3, "accounts.spotify.com"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :nav_player
    const-string v0, "accounts"
    goto :nav_emit
    :nav_player
    const-string v3, "open.spotify.com"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :nav_emit
    const-string v0, "player"
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :nav_emit
    const-string v2, "^/(?:intl-[^/]+/)?(?:login|signin|auth)(?:/.*)?$"
    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :nav_emit
    const-string v0, "login"
    :nav_emit
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "navigation source="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " route="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    :nav_end
    .catch Ljava/lang/RuntimeException; {:nav_try .. :nav_end} :nav_error
    return-void
    :nav_error
    move-exception v0
    return-void
.end method

.method public static image(Z)V
    .locals 2
    sget v0, Lcom/melodix/music/NativeSessionTrace;->imageCount:I
    const/16 v1, 0x20
    if-ge v0, v1, :image_done
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeSessionTrace;->imageCount:I
    if-eqz p0, :image_failed
    const-string v1, "image result=loaded"
    goto :image_emit
    :image_failed
    const-string v1, "image result=failed"
    :image_emit
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    const/16 v1, 0x20
    if-ne v0, v1, :image_done
    const-string v1, "image result=limit"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    :image_done
    return-void
.end method

# Exact player origin only, to avoid accepting an old onPageFinished callback
# whose getUrl has already moved to a player navigation not yet started.
.method public static playerOrigin(Ljava/lang/String;)Z
    .locals 3
    if-eqz p0, :no
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v1
    const-string v2, "https"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :no
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v1
    const-string v2, "open.spotify.com"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :no
    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I
    move-result v1
    const/4 v2, -0x1
    if-eq v1, v2, :yes
    const/16 v2, 0x1bb
    if-ne v1, v2, :no
    :yes
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static start(Ljava/lang/String;)V
    .locals 1
    sget v0, Lcom/melodix/music/NativeSessionTrace;->documentGeneration:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeSessionTrace;->documentGeneration:I
    invoke-static {p0}, Lcom/melodix/music/NativeSessionTrace;->playerOrigin(Ljava/lang/String;)Z
    move-result v0
    sput-boolean v0, Lcom/melodix/music/NativeSessionTrace;->lastStartedPlayer:Z
    const-string v0, "start"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static finish(Ljava/lang/String;)V
    .locals 1
    const-string v0, "finish"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static factory(Ljava/lang/String;)V
    .locals 1
    const-string v0, "factory"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static ensure(Ljava/lang/String;)V
    .locals 1
    const-string v0, "ensure"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static button(Ljava/lang/String;)V
    .locals 1
    const-string v0, "button"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static recovery(Ljava/lang/String;)V
    .locals 1
    const-string v0, "recovery"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static bridge(Ljava/lang/String;)V
    .locals 1
    const-string v0, "bridge"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static historyReload(Ljava/lang/String;)V
    .locals 1
    const-string v0, "history-reload"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static historyChange(Ljava/lang/String;)V
    .locals 1
    const-string v0, "history-change"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static requestUrl(Ljava/lang/String;)V
    .locals 1
    const-string v0, "request"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static redirectUrl(Ljava/lang/String;)V
    .locals 1
    const-string v0, "redirect"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionTrace;->navigation(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static request(Landroid/webkit/WebResourceRequest;)V
    .locals 2
    if-eqz p0, :request_done
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
    move-result v0
    if-eqz v0, :request_done
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
    move-result-object v0
    if-eqz v0, :request_done
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->isRedirect()Z
    move-result v1
    if-eqz v1, :request_regular
    invoke-static {v0}, Lcom/melodix/music/NativeSessionTrace;->redirectUrl(Ljava/lang/String;)V
    return-void
    :request_regular
    invoke-static {v0}, Lcom/melodix/music/NativeSessionTrace;->requestUrl(Ljava/lang/String;)V
    :request_done
    return-void
.end method
