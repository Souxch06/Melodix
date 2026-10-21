.class public final Lcom/melodix/music/NativeBridgeAsset;
.super Ljava/lang/Object;

.method public static responseForUrl(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 9

    const/4 v0, 0x0
    if-eqz p0, :done
    const-string v1, "/__melodix__/spotify_bridge.js"
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :done

    :try_start_0
    const-string v1, "spotify_bridge.js"
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :try_fail
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-nez v2, :try_fail

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "window.__sfBridgeIntercepted=true;window.__sfBridgeAssetServed=true;window.__sfBridgeLoadStage='asset-response-created';"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "window.__sfBridgeServedBytes="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, ";"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1

    const-string v2, "UTF-8"
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    array-length v2, v1
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
    const-string v3, "application/javascript; charset=UTF-8"
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "Content-Length"
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroid/webkit/WebResourceResponse;
    const-string v3, "application/javascript"
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

.method public static loaderJavascript()Ljava/lang/String;
    .locals 1

    const-string v0, "(function(){if(window.__sfMelodixBridgeStarted===true)return;if(document.querySelector('script[data-sf-melodix-bridge=\"1\"]')){if(!window.__sfBridgeLoadStage)window.__sfBridgeLoadStage='src-pending';return;}window.__sfBridgeExecMode='same-origin-src';window.__sfBridgeLoadStage='inject-src';var s=document.createElement('script');s.src=(window.location&&window.location.origin?window.location.origin:'https://open.spotify.com')+'/__melodix__/spotify_bridge.js';s.async=false;s.type='application/javascript';s.charset='utf-8';s.setAttribute('data-sf-melodix-bridge','1');s.onload=function(){var c=window.__sfBridgeLoadStage;if(c!=='bridge-entered'&&c!=='bridge-initialized'&&c!=='home-initialized')window.__sfBridgeLoadStage='script-load';};s.onerror=function(){window.__sfBridgeLastError='script-error: load-failed';if(!window.__sfBridgeEntered)window.__sfBridgeLoadStage='script-error';};(document.head||document.documentElement).appendChild(s);})();"

    return-object v0
.end method
