.class public final Lcom/melodix/music/NativeBridgeAsset;
.super Ljava/lang/Object;

# Serves assets/spotify_bridge.js at a same-origin URL so the page can load it
# with <script src> (script-src-elem 'self'). Inline/eval/blob are blocked by
# Spotify's CSP (script-src-elem inline).


.method public static responseForUrl(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 8

    const/4 v0, 0x0

    if-eqz p0, :none

    const-string v1, "/__melodix__/spotify_bridge.js"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :none

    :try_start_0
    const-string v1, "spotify_bridge.js"

    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :none

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :none

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v4, Landroid/webkit/WebResourceResponse;

    const-string v5, "application/javascript"

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :catch_0
    move-exception v1

    :none
    return-object v0
.end method

.method public static loaderJavascript()Ljava/lang/String;
    .locals 1

    const-string v0, "(function(){if(window.__sfMelodixBridgeStarted===true)return;window.__sfBridgeExecMode='same-origin-src';window.__sfBridgeLoadStage='inject-src';var s=document.createElement('script');s.src=(window.location&&window.location.origin?window.location.origin:'https://open.spotify.com')+'/__melodix__/spotify_bridge.js';s.async=false;s.onload=function(){window.__sfBridgeLoadStage='src-loaded';};s.onerror=function(){window.__sfBridgeLastError='src-script: load-failed';window.__sfBridgeLoadStage='src-error';};(document.head||document.documentElement).appendChild(s);})();"

    return-object v0
.end method
