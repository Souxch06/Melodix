.class public final Lcom/melodix/music/SpotifyNavigationPolicy;
.super Ljava/lang/Object;
.source "SpotifyNavigationPolicy.java"

# Keep Spotify content navigation in Melodix at both WebView and Activity
# boundaries. Spotify account/login-host URLs are deliberately passed through.

.method public static handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z
    .locals 3

    if-eqz p0, :not_handled

    if-eqz p1, :not_handled

    invoke-static {p1}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :not_handled

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :load_web_page

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :load_web_page

    # App schemes and intent:// routes must not escape the current WebView.
    if-eqz p2, :consume_subframe

    invoke-static {p1}, Lcom/melodix/music/SpotifyNavigationPolicy;->toWebUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "spotify-app-link-contained"

    goto :load_in_webview

    :load_web_page
    # Explicitly reload top-level Spotify HTTPS links in this WebView. This
    # also contains verified Android App Links that may otherwise hand off.
    if-eqz p2, :not_handled

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "spotify-web-link-contained"

    :load_in_webview
    :try_start_load
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_load
    .catch Ljava/lang/Throwable; {:try_start_load .. :try_end_load} :load_failed

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :load_failed
    move-exception v2

    # Consume the app hand-off even if the WebView is already unavailable.
    const-string v0, "spotify-app-link-blocked"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :consume_subframe
    const-string v0, "spotify-app-link-contained-subframe"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :not_handled
    const/4 v0, 0x0

    return v0
.end method

# Final fallback for ACTION_VIEW intents initiated with the Activity context.
# This only suppresses Spotify-targeted content intents, never account-host URLs.
.method public static interceptActivityIntent(Landroid/webkit/WebView;Landroid/content/Intent;)Z
    .locals 4

    if-eqz p1, :not_handled

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :not_handled

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.spotify.music"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :spotify_package

    if-eqz v0, :not_handled

    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyUri(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :not_handled

    if-eqz p0, :blocked_without_webview

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Lcom/melodix/music/SpotifyNavigationPolicy;->handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z

    move-result v0

    return v0

    :spotify_package
    if-eqz v0, :spotify_package_no_data

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :spotify_package_route

    const-string v2, "accounts.spotify.com"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :not_handled

    :spotify_package_route
    if-eqz p0, :blocked_without_webview

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Lcom/melodix/music/SpotifyNavigationPolicy;->handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z

    move-result v3

    if-eqz v3, :spotify_package_home

    return v3

    :spotify_package_no_data
    if-eqz p0, :blocked_without_webview

    :spotify_package_home
    const-string v0, "spotify:home"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Lcom/melodix/music/SpotifyNavigationPolicy;->handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z

    move-result v0

    return v0

    :blocked_without_webview
    const-string v0, "spotify-native-intent-blocked"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :not_handled
    const/4 v0, 0x0

    return v0
.end method

.method private static isSpotifyUri(Landroid/net/Uri;)Z
    .locals 3

    if-eqz p0, :no

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :check_scheme

    const-string v1, "accounts.spotify.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :no

    :check_scheme
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :no

    const-string v1, "spotify"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :yes

    const-string v1, "intent"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :check_http

    invoke-static {p0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyIntent(Landroid/net/Uri;)Z

    move-result v0

    return v0

    :check_http
    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :check_web_host

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :no

    :check_web_host
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyWebHost(Ljava/lang/String;)Z

    move-result v0

    return v0

    :yes
    const/4 v0, 0x1

    return v0

    :no
    const/4 v0, 0x0

    return v0
.end method

.method private static isSpotifyIntent(Landroid/net/Uri;)Z
    .locals 3

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyWebHost(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :yes

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "package=com.spotify.music"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :yes

    const-string v1, "scheme=spotify"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :no

    :yes
    const/4 v0, 0x1

    return v0

    :no
    const/4 v0, 0x0

    return v0
.end method

.method private static isSpotifyWebHost(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :no

    const-string v0, "open.spotify.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spotify.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "www.spotify.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "play.spotify.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spotify.link"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spoti.fi"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spotify.app.link"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spotify-alternate.app.link"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "spotify-alternative.app.link"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "link.tospotify.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :no

    :yes
    const/4 v0, 0x1

    return v0

    :no
    const/4 v0, 0x0

    return v0
.end method

.method private static toWebUrl(Landroid/net/Uri;)Ljava/lang/String;
    .locals 5

    if-eqz p0, :home

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :scheme_specific

    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyWebHost(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :route_host

    const-string v1, "https://"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :host_root_path

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :host_query

    :host_root_path
    const-string v1, "/"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :host_query
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :host_to_string

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :host_to_string
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :route_host
    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isRouteType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :home

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :route_host_ready

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :route_host_ready
    const-string v1, "https://open.spotify.com/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :return_route

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :return_route
    return-object v0

    :scheme_specific
    invoke-virtual {p0}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :home

    const-string v1, ":"

    const-string v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :single_route

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :check_route_type

    :single_route
    move-object v1, v0

    :check_route_type
    invoke-static {v1}, Lcom/melodix/music/SpotifyNavigationPolicy;->isRouteType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :home

    const-string v1, "https://open.spotify.com/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :home
    const-string v0, "https://open.spotify.com/"

    return-object v0
.end method

.method private static isRouteType(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :no

    const-string v0, "track"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "playlist"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "album"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "artist"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "show"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "episode"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "user"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "search"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "app"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :yes

    const-string v0, "home"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :no

    :yes
    const/4 v0, 0x1

    return v0

    :no
    const/4 v0, 0x0

    return v0
.end method
