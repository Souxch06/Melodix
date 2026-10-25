.class public final Lcom/melodix/music/NativeBridgeAsset;
.super Ljava/lang/Object;

.method public static responseForUrl(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 12

    const/4 v0, 0x0
    if-eqz p0, :done
    const-string v1, "/__melodix__/spotify_bridge.js"
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :done

    :try_start_0
    const-string v1, "spotify_bridge.js"
    invoke-static {v1}, Lcom/melodix/music/NativeBridgeAsset;->readAssetUtf8(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :try_fail
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-nez v2, :try_fail

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "window.__sfBridgeIntercepted=true;window.__sfBridgeAssetServed=true;window.__sfBridgePrefixExec=true;window.__sfBridgeLoadStage='asset-response-created';"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v9

    const-string v1, "UTF-8"
    invoke-virtual {v9, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    array-length v10, v1

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v1
    add-int/lit8 v11, v10, 0x1d
    add-int v11, v11, v1
    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    move-result v3
    if-eq v3, v1, :count_ready
    add-int/lit8 v11, v11, 0x1
    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v2

    :count_ready
    invoke-static {v9, v2}, Lcom/melodix/music/NativeBridgeAsset;->withServedBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v3, "UTF-8"
    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    array-length v4, v1
    if-eq v4, v11, :bytes_ready
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v2
    invoke-static {v9, v2}, Lcom/melodix/music/NativeBridgeAsset;->withServedBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v3, "UTF-8"
    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    array-length v4, v1

    :bytes_ready
    new-instance v8, Ljava/io/ByteArrayInputStream;
    invoke-direct {v8, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v7, Ljava/util/HashMap;
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V
    const-string v1, "Access-Control-Allow-Origin"
    const-string v3, "*"
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "Cache-Control"
    const-string v3, "no-store, max-age=0"
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "Content-Type"
    const-string v3, "text/javascript; charset=UTF-8"
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "Content-Length"
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "X-Content-Type-Options"
    const-string v3, "nosniff"
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroid/webkit/WebResourceResponse;
    const-string v3, "text/javascript"
    const-string v4, "UTF-8"
    const/16 v5, 0xc8
    const-string v6, "OK"
    invoke-direct/range {v2 .. v8}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V
    move-object v0, v2
    goto :try_ok

    :try_fail
    const/4 v0, 0x0

    :try_ok
    nop
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    goto :done

    :catch_0
    move-exception v1
    const/4 v0, 0x0

    :done
    return-object v0
.end method

.method public static readAssetUtf8(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0
    :try_start_0
    invoke-static {}, Lm9;->c()Landroid/content/Context;
    move-result-object v1
    # Jump away only when the context is missing. if-nez would skip the
    # read whenever Android actually handed us a Context.
    if-eqz v1, :read_fail
    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object v1
    invoke-virtual {v1, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object v1
    new-instance v2, Ljava/io/ByteArrayOutputStream;
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    const/16 v3, 0x1000
    new-array v3, v3, [B

    :read_loop
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I
    move-result v4
    # EOF is -1. if-gez stopped after the first successful (n >= 0) chunk.
    if-ltz v4, :read_done
    const/4 v5, 0x0
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :read_loop

    :read_done
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    const-string v1, "UTF-8"
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :read_ok
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v6
    invoke-static {v6}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const/4 v0, 0x0

    :read_fail
    :read_ok
    return-object v0
.end method

.method private static withServedBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "window.__sfBridgeServedBytes="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, ";"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static loaderJavascript()Ljava/lang/String;
    .locals 1

    const-string v0, "(function(){try{if(!window.__sfBridgeErrorHooked){window.__sfBridgeErrorHooked=true;window.addEventListener('error',function(ev){var f=String(ev&&ev.filename||'');if(f.indexOf('spotify_bridge')<0&&f.indexOf('__melodix__')<0)return;window.__sfBridgeLastError=('exec-error:'+String(ev.message||'error')+':L'+String(ev.lineno||0)).slice(0,160);if(!window.__sfBridgeEntered)window.__sfBridgeLoadStage='script-exec-error';},true);}}catch(e){}if(window.__sfMelodixBridgeStarted===true)return;if(document.querySelector('script[data-sf-melodix-bridge=\\\"1\\\"]')){if(!window.__sfBridgeLoadStage)window.__sfBridgeLoadStage='src-pending';return;}window.__sfBridgeExecMode='same-origin-src';window.__sfBridgeLoadStage='inject-src';var s=document.createElement('script');s.async=false;s.defer=false;s.type='text/javascript';s.charset='utf-8';s.setAttribute('data-sf-melodix-bridge','1');s.onload=function(){if(window.__sfBridgeEntered===true)return;if(window.__sfBridgePrefixExec===true){window.__sfBridgeLoadStage='prefix-only';window.__sfBridgeLastError=window.__sfBridgeLastError||'prefix-only: iife-not-entered';return;}window.__sfBridgeLoadStage='script-load';};s.onerror=function(){window.__sfBridgeLastError=window.__sfBridgeLastError||'script-error: load-failed';if(!window.__sfBridgeEntered)window.__sfBridgeLoadStage='script-error';};s.src=(window.location&&window.location.origin?window.location.origin:'https://open.spotify.com')+'/__melodix__/spotify_bridge.js';(document.head||document.documentElement).appendChild(s);})();"

    return-object v0
.end method

# Context-first variant: never goes through m9.c() (which throws when the app
# context singleton is not ready) — the caller passes its own Context.
.method public static readAssetUtf8(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0
    if-eqz p0, :ctx_read_fail
    if-eqz p1, :ctx_read_fail

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object v1
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object v1
    new-instance v2, Ljava/io/ByteArrayOutputStream;
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    const/16 v3, 0x1000
    new-array v3, v3, [B

    :ctx_read_loop
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I
    move-result v4
    if-ltz v4, :ctx_read_done
    const/4 v5, 0x0
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :ctx_read_loop

    :ctx_read_done
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    const-string v1, "UTF-8"
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :ctx_read_ok
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v6
    invoke-static {v6}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "asset-err "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v6}, Lcom/melodix/music/NativeCrashGuard;->excerpt(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    const/4 v0, 0x0

    :ctx_read_fail
    invoke-static {p1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    const-string v1, "asset-null"
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    :ctx_read_ok
    return-object v0
.end method
