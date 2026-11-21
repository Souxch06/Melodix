.class public final Lcom/melodix/music/BrowserProfile;
.super Ljava/lang/Object;

# Keep the desktop-shaped WebView profile on the Chrome release actually
# installed on this device. A literal UA version quickly goes stale and can
# make Spotify treat a current WebView as an unsupported old browser.
.method public static desktopUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .locals 7

    if-eqz p0, :no_context

    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :empty_user_agent

    const-string v1, "Chrome/"
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
    const/4 v3, -0x1
    if-eq v2, v3, :use_platform_user_agent

    add-int/lit8 v2, v2, 0x7
    const-string v1, " "
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v3
    const/4 v4, -0x1
    if-ne v3, v4, :version_end_found
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v3

    :version_end_found
    if-le v3, v2, :use_platform_user_agent
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    if-eqz v4, :use_platform_user_agent
    invoke-virtual {v4}, Ljava/lang/String;->length()I
    move-result v6
    if-lez v6, :use_platform_user_agent

    new-instance v5, Ljava/lang/StringBuilder;
    const-string v1, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/"
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v1, " Safari/537.36"
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0

    :use_platform_user_agent
    # Do not fabricate a browser version if this WebView provider has no Chrome token.
    return-object v0

    :empty_user_agent
    const-string v0, ""
    return-object v0

    :no_context
    const-string v0, ""
    return-object v0
.end method
