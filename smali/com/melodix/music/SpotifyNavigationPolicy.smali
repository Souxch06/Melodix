.class public final Lcom/melodix/music/SpotifyNavigationPolicy;
.super Ljava/lang/Object;
.source "SpotifyNavigationPolicy.java"

# Spotify content pages can offer a native spotify: or intent:// hand-off.
# Keep those content links in the existing WebView by routing them to HTTPS.
# Account-host navigation is deliberately passed through unchanged.

.method public static handle(Landroid/webkit/WebView;Landroid/net/Uri;Z)Z
    .locals 3

    if-eqz p0, :not_handled

    if-eqz p1, :not_handled

    # Do not intercept Spotify account/login host navigation.
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :read_scheme

    const-string v1, "accounts.spotify.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :read_scheme

    goto :not_handled

    :read_scheme
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :not_handled

    const-string v1, "spotify"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :load_web_route

    const-string v1, "intent"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :not_handled

    invoke-static {p1}, Lcom/melodix/music/SpotifyNavigationPolicy;->isSpotifyIntent(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :not_handled

    :load_web_route
    if-eqz p2, :consume_subframe

    invoke-static {p1}, Lcom/melodix/music/SpotifyNavigationPolicy;->toWebUrl(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    :try_start_load
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_load
    .catch Ljava/lang/Throwable; {:try_start_load .. :try_end_load} :load_failed

    const-string v0, "spotify-app-link-contained"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :load_failed
    move-exception v1

    # Even if the WebView has already been torn down, never pass this native
    # Spotify content hand-off to Android's package resolver.
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

.method private static isSpotifyIntent(Landroid/net/Uri;)Z
    .locals 3

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :check_intent_text

    const-string v1, "open.spotify.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :yes

    :check_intent_text
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

.method private static toWebUrl(Landroid/net/Uri;)Ljava/lang/String;
    .locals 4

    if-eqz p0, :home

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :scheme_specific

    const-string v1, "open.spotify.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :route_host

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :home

    const-string v1, "https://open.spotify.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :route_host
    invoke-static {v0}, Lcom/melodix/music/SpotifyNavigationPolicy;->isRouteType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :home

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :route_ready

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :route_ready

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

    :route_ready
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
