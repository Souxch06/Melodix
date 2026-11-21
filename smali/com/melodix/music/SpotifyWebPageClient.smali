.class public final Lcom/melodix/music/SpotifyWebPageClient;
.super Landroid/webkit/WebViewClient;
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V
    return-void
.end method
# Restrict top-level navigation to HTTPS Spotify hosts. Do not read, export,
# or log paths, query strings, cookies, headers, or page contents.
.method private static allowed(Landroid/net/Uri;)Z
    .locals 2
    if-eqz p0, :no
    const-string v0, "https"
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :no
    invoke-virtual {p0}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :no
    invoke-virtual {p0}, Landroid/net/Uri;->getPort()I
    move-result v0
    const/4 v1, -0x1
    if-eq v0, v1, :host
    const/16 v1, 0x1bb
    if-ne v0, v1, :no
    :host
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :no
    const-string v1, "open.spotify.com"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :yes
    const-string v1, "accounts.spotify.com"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :no
    :yes
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method
.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 1
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
    move-result v0
    if-nez v0, :main_frame
    const/4 v0, 0x0
    return v0
    :main_frame
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/SpotifyWebPageClient;->allowed(Landroid/net/Uri;)Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    return v0
.end method
.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/SpotifyWebPageClient;->allowed(Landroid/net/Uri;)Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    return v0
.end method
