.class public final Lcom/melodix/music/NativeFetchGuard;
.super Ljava/lang/Object;

# Strict native SSRF guard and redirect-validating HTTPS transport for AndBridge.nativeFetch.

.method public static isIpLiteral(Ljava/lang/String;)Z
    .locals 6

    const/4 v0, 0x1
    if-eqz p0, :return_true
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :return_true

    const/16 v1, 0x3a
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :return_true

    const/16 v1, 0x5b
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :return_true

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0x0
    const/4 v3, 0x0

    :scan_loop
    if-ge v2, v1, :scan_done
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C
    move-result v4
    const/16 v5, 0x2e
    if-eq v4, v5, :next_char
    const/16 v5, 0x30
    if-lt v4, v5, :not_digit
    const/16 v5, 0x39
    if-gt v4, v5, :not_digit
    goto :next_char

    :not_digit
    const/4 v3, 0x1

    :next_char
    add-int/lit8 v2, v2, 0x1
    goto :scan_loop

    :scan_done
    if-eqz v3, :return_true
    const/4 v0, 0x0
    return v0

    :return_true
    return v0
.end method

.method public static isSpotifyAuthHost(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0
    if-eqz p0, :done
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1

    const-string v2, "spotify.com"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_sub
    const/4 v0, 0x1
    return v0

    :check_sub
    const-string v2, ".spotify.com"
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :done
    const/4 v0, 0x1

    :done
    return v0
.end method

.method public static isAllowedHost(Ljava/lang/String;)Z
    .locals 6

    const/4 v0, 0x0
    if-eqz p0, :done
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :done

    invoke-static {p0}, Lcom/melodix/music/NativeFetchGuard;->isIpLiteral(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :done

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1

    const-string v2, "localhost"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :done

    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 0xff
    if-gt v2, v3, :done

    const/4 v3, 0x0
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C
    move-result v4
    const/16 v5, 0x2e
    if-eq v4, v5, :done
    add-int/lit8 v4, v2, -0x1
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C
    move-result v4
    if-eq v4, v5, :done

    const-string v4, ".."
    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v4
    if-nez v4, :done

    :ascii_loop
    if-ge v3, v2, :ascii_ok
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C
    move-result v4
    const/16 v5, 0x61
    if-lt v4, v5, :check_digit
    const/16 v5, 0x7a
    if-gt v4, v5, :check_digit
    goto :ascii_next

    :check_digit
    const/16 v5, 0x30
    if-lt v4, v5, :check_dot_dash
    const/16 v5, 0x39
    if-gt v4, v5, :check_dot_dash
    goto :ascii_next

    :check_dot_dash
    const/16 v5, 0x2e
    if-eq v4, v5, :ascii_next
    const/16 v5, 0x2d
    if-eq v4, v5, :ascii_next
    goto :done

    :ascii_next
    add-int/lit8 v3, v3, 0x1
    goto :ascii_loop

    :ascii_ok
    invoke-static {v1}, Lcom/melodix/music/NativeFetchGuard;->isSpotifyAuthHost(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :check_scdn
    const/4 v0, 0x1
    return v0

    :check_scdn
    const-string v2, "scdn.co"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_scdn_sub
    const/4 v0, 0x1
    return v0

    :check_scdn_sub
    const-string v2, ".scdn.co"
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :check_spotifycdn
    const/4 v0, 0x1
    return v0

    :check_spotifycdn
    const-string v2, "spotifycdn.com"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :check_spotifycdn_sub
    const/4 v0, 0x1
    return v0

    :check_spotifycdn_sub
    const-string v2, ".spotifycdn.com"
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :done
    const/4 v0, 0x1

    :done
    return v0
.end method

.method public static parseAllowedUrl(Ljava/lang/String;)Ljava/net/URL;
    .locals 7

    const/4 v0, 0x0
    if-eqz p0, :done
    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :done
    const/16 v2, 0x800
    if-gt v1, v2, :done

    # Block parser-differential characters (\, CR, LF, TAB, SPACE).
    const/16 v2, 0x5c
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done
    const/16 v2, 0xd
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done
    const/16 v2, 0xa
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done
    const/16 v2, 0x9
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done
    const/16 v2, 0x20
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done

    :try_start_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :done

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v2
    const-string v3, "https"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :done

    invoke-virtual {v1}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :done

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :done
    const/16 v4, 0x40
    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I
    move-result v2
    if-gez v2, :done

    invoke-virtual {v1}, Landroid/net/Uri;->getPort()I
    move-result v2
    const/4 v5, -0x1
    if-eq v2, v5, :uri_port_ok
    const/16 v6, 0x1bb
    if-ne v2, v6, :done

    :uri_port_ok
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :done

    new-instance v2, Ljava/net/URL;
    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :done

    invoke-virtual {v2}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :done

    invoke-virtual {v2}, Ljava/net/URL;->getAuthority()Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :done
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I
    move-result v3
    if-gez v3, :done

    invoke-virtual {v2}, Ljava/net/URL;->getPort()I
    move-result v3
    if-eq v3, v5, :url_port_ok
    const/16 v4, 0x1bb
    if-ne v3, v4, :done

    :url_port_ok
    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :done

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :done

    invoke-static {v3}, Lcom/melodix/music/NativeFetchGuard;->isAllowedHost(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :done
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v1

    :done
    return-object v0
.end method

.method public static isAllowedUrl(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Lcom/melodix/music/NativeFetchGuard;->parseAllowedUrl(Ljava/lang/String;)Ljava/net/URL;
    move-result-object v0
    if-eqz v0, :denied
    const/4 v0, 0x1
    return v0

    :denied
    const/4 v0, 0x0
    return v0
.end method

.method private static isSensitiveHeader(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x1
    const-string v1, "authorization"
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :return_true
    const-string v1, "cookie"
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :return_true
    const-string v1, "client-token"
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :return_true
    const-string v1, "proxy-authorization"
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :return_true
    const/4 v0, 0x0
    return v0

    :return_true
    return v0
.end method

.method private static hasCrLf(Ljava/lang/String;)Z
    .locals 2

    const/16 v0, 0xd
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :found
    const/16 v0, 0xa
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :found
    const/4 v0, 0x0
    return v0

    :found
    const/4 v0, 0x1
    return v0
.end method

.method private static jsonError(ILjava/lang/String;)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "status"
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "body"
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-object v0

    :catch_0
    move-exception v0
    const-string v0, "{\"status\":403,\"body\":\"Blocked request\"}"
    return-object v0
.end method

.method public static sanitizeError(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :fallback
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string p0, "Network request failed: "
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0

    :fallback
    const-string v0, "Network request failed"
    return-object v0
.end method

.method private static applyRequestHeaders(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    invoke-static {p1}, Lcom/melodix/music/NativeFetchGuard;->isSpotifyAuthHost(Ljava/lang/String;)Z
    move-result v0

    if-eqz p2, :after_custom
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :after_custom

    new-instance v1, Lorg/json/JSONObject;
    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;
    move-result-object v2

    :hdr_loop
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :after_custom
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    if-eqz v3, :hdr_loop
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    if-eqz v4, :hdr_loop

    invoke-static {v3}, Lcom/melodix/music/NativeFetchGuard;->hasCrLf(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :hdr_loop
    invoke-static {v4}, Lcom/melodix/music/NativeFetchGuard;->hasCrLf(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :hdr_loop

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v3, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v5

    const-string v6, "host"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :hdr_loop

    const-string v6, "content-length"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :hdr_loop

    const-string v6, "content-type"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :check_not_content_type
    const-string v6, "GET"
    invoke-virtual {v6, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :hdr_loop
    const-string v6, "HEAD"
    invoke-virtual {v6, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :hdr_loop

    :check_not_content_type

    const-string v6, "x-requested-with"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :hdr_loop

    const-string v6, "sec-ch-ua"
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :hdr_loop

    invoke-static {v5}, Lcom/melodix/music/NativeFetchGuard;->isSensitiveHeader(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :set_hdr
    if-eqz v0, :hdr_loop

    :set_hdr
    invoke-virtual {p0, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    goto :hdr_loop

    :after_custom
    const-string v1, "sec-ch-ua"
    const-string v2, "\"Not;A=Brand\";v=\"8\", \"Chromium\";v=\"134\", \"Google Chrome\";v=\"134\""
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "sec-ch-ua-mobile"
    const-string v2, "?0"
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "sec-ch-ua-platform"
    const-string v2, "\"Windows\""
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "Origin"
    const-string v2, "https://open.spotify.com"
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "Referer"
    const-string v2, "https://open.spotify.com/"
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "User-Agent"
    invoke-virtual {p0, v1}, Ljava/net/URLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :set_ua
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-nez v2, :ua_done

    :set_ua
    const-string v2, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :ua_done
    return-void
.end method

.method private static readStreamUtf8(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 5

    if-eqz p0, :empty
    new-instance v0, Ljava/io/ByteArrayOutputStream;
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    const/16 v1, 0x1000
    new-array v1, v1, [B

    :loop
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I
    move-result v2
    if-ltz v2, :done_read
    const/4 v3, 0x0
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :loop

    :done_read
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    const-string v4, "UTF-8"
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :empty
    const-string v0, ""
    return-object v0
.end method

.method private static collectHeaders(Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;
    .locals 6

    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    invoke-virtual {p0}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;
    move-result-object v1
    if-eqz v1, :done

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1

    :entry_loop
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :done
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    if-eqz v3, :entry_loop
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
    move-result v4
    if-nez v4, :entry_loop
    const-string v4, ":"
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :entry_loop
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v4
    const-string v5, "set-cookie"
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :entry_loop

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/List;
    if-eqz v2, :entry_loop
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
    move-result v4
    if-nez v4, :entry_loop
    const-string v4, ", "
    invoke-static {v4, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    goto :entry_loop

    :done
    return-object v0
.end method

.method public static execute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    const/16 v0, 0x193
    if-eqz p0, :reject_url
    if-eqz p1, :reject_url
    if-eqz p2, :reject_url

    move-object v1, p0
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v2
    move-object v3, p3
    const/4 v4, 0x0
    const/4 v5, 0x0

    :redirect_loop
    const/4 v6, 0x5
    if-gt v4, v6, :too_many_redirects

    invoke-static {v1}, Lcom/melodix/music/NativeFetchGuard;->parseAllowedUrl(Ljava/lang/String;)Ljava/net/URL;
    move-result-object v6
    if-eqz v6, :reject_url

    :try_start_0
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    move-result-object v7
    invoke-static {v7}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;
    move-object v5, v7

    const/4 v8, 0x0
    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V
    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->setUseCaches(Z)V
    const/16 v8, 0x2710
    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->setConnectTimeout(I)V
    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->setReadTimeout(I)V
    invoke-virtual {v5, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->getHost()Ljava/lang/String;
    move-result-object v8
    invoke-static {v5, v8, p2, v2}, Lcom/melodix/music/NativeFetchGuard;->applyRequestHeaders(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :send_done
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z
    move-result v8
    if-nez v8, :send_done
    const-string v8, "GET"
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :send_done
    const-string v8, "HEAD"
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :send_done

    const/4 v8, 0x1
    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->setDoOutput(Z)V
    const-string v8, "UTF-8"
    invoke-virtual {v3, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v8
    invoke-virtual {v5}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v9
    invoke-virtual {v9, v8}, Ljava/io/OutputStream;->write([B)V
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    :send_done
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I
    move-result v7

    const/16 v8, 0x12d
    if-eq v7, v8, :handle_redirect
    const/16 v8, 0x12e
    if-eq v7, v8, :handle_redirect
    const/16 v8, 0x12f
    if-eq v7, v8, :handle_redirect
    const/16 v8, 0x133
    if-eq v7, v8, :handle_redirect
    const/16 v8, 0x134
    if-eq v7, v8, :handle_redirect
    goto :read_response

    :handle_redirect
    const-string v8, "Location"
    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    const/4 v5, 0x0
    if-eqz v8, :reject_redirect
    :try_start_redirect
    new-instance v9, Ljava/net/URL;
    invoke-direct {v9, v6, v8}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_redirect
    .catch Ljava/net/MalformedURLException; {:try_start_redirect .. :try_end_redirect} :catch_bad_redirect
    .catch Ljava/lang/Exception; {:try_start_redirect .. :try_end_redirect} :catch_0
    .catchall {:try_start_redirect .. :try_end_redirect} :catchall_0
    :try_resume_redirect
    invoke-virtual {v9}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/NativeFetchGuard;->parseAllowedUrl(Ljava/lang/String;)Ljava/net/URL;
    move-result-object v8
    if-eqz v8, :reject_redirect

    const/16 v8, 0x12f
    if-eq v7, v8, :downgrade_to_get
    const/16 v8, 0x12d
    if-eq v7, v8, :check_post_redirect
    const/16 v8, 0x12e
    if-ne v7, v8, :next_hop

    :check_post_redirect
    const-string v8, "POST"
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :next_hop

    :downgrade_to_get
    const-string v2, "GET"
    const/4 v3, 0x0

    :next_hop
    add-int/lit8 v4, v4, 0x1
    goto :redirect_loop

    :read_response
    const/16 v8, 0x190
    if-lt v7, v8, :ok_stream
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;
    move-result-object v8
    goto :have_stream

    :ok_stream
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    move-result-object v8

    :have_stream
    invoke-static {v8}, Lcom/melodix/music/NativeFetchGuard;->readStreamUtf8(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v8
    invoke-static {v5}, Lcom/melodix/music/NativeFetchGuard;->collectHeaders(Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;
    move-result-object v9

    new-instance v6, Lorg/json/JSONObject;
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "status"
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "headers"
    invoke-virtual {v6, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v1, "body"
    invoke-virtual {v6, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v1, "isBinary"
    const/4 v2, 0x0
    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_start_redirect} :catch_0
    .catchall {:try_start_0 .. :try_start_redirect} :catchall_0
    .catch Ljava/lang/Exception; {:try_resume_redirect .. :try_end_0} :catch_0
    .catchall {:try_resume_redirect .. :try_end_0} :catchall_0

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    return-object v6

    :catch_bad_redirect
    move-exception v9
    goto :reject_redirect

    :catchall_0
    move-exception v0
    if-eqz v5, :rethrow
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :rethrow
    throw v0

    :catch_0
    move-exception v0
    if-eqz v5, :err_disconnected
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :err_disconnected
    instance-of v1, v0, Ljava/net/SocketTimeoutException;
    if-eqz v1, :err_not_timeout
    const/16 v1, 0x1f8
    const-string v0, "Request timed out"
    invoke-static {v1, v0}, Lcom/melodix/music/NativeFetchGuard;->jsonError(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :err_not_timeout
    invoke-static {v0}, Lcom/melodix/music/NativeFetchGuard;->sanitizeError(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v0
    const/16 v1, 0x1f4
    invoke-static {v1, v0}, Lcom/melodix/music/NativeFetchGuard;->jsonError(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :reject_redirect
    const/16 v0, 0x193
    const-string v1, "Blocked disallowed redirect target"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeFetchGuard;->jsonError(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :too_many_redirects
    const-string v1, "Too many redirects"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeFetchGuard;->jsonError(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0

    :reject_url
    const-string v1, "Blocked disallowed fetch URL"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeFetchGuard;->jsonError(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static buildSafePlayFromUriJs(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0
    if-eqz p0, :safe_uri_invalid
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :safe_uri_invalid
    const/16 v2, 0x200
    if-gt v1, v2, :safe_uri_invalid

    const/4 v2, 0x0
    :char_scan_loop
    if-ge v2, v1, :char_scan_done
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C
    move-result v3
    const/16 v4, 0x20
    if-lt v3, v4, :safe_uri_invalid
    const/16 v4, 0x7f
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x22
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x5c
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x60
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x3b
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x3c
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x3e
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x2028
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x2029
    if-eq v3, v4, :safe_uri_invalid
    add-int/lit8 v2, v2, 0x1
    goto :char_scan_loop

    :char_scan_done
    const-string v2, "spotify:search:"
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :check_non_search_spotify
    const/16 v2, 0xf
    if-le v1, v2, :safe_uri_invalid
    goto :quote_safe_uri

    :check_non_search_spotify
    const-string v2, "spotify:"
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :check_https_uri
    const-string v2, "spotify://"
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :safe_uri_invalid
    const/16 v2, 0x9
    if-lt v1, v2, :safe_uri_invalid
    const/16 v2, 0x8
    :spotify_id_loop
    if-ge v2, v1, :quote_safe_uri
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C
    move-result v3
    const/16 v4, 0x30
    if-lt v3, v4, :check_spotify_punct
    const/16 v4, 0x39
    if-le v3, v4, :spotify_char_ok
    const/16 v4, 0x41
    if-lt v3, v4, :check_spotify_punct
    const/16 v4, 0x5a
    if-le v3, v4, :spotify_char_ok
    const/16 v4, 0x61
    if-lt v3, v4, :check_spotify_punct
    const/16 v4, 0x7a
    if-le v3, v4, :spotify_char_ok

    :check_spotify_punct
    const/16 v4, 0x3a
    if-eq v3, v4, :spotify_char_ok
    const/16 v4, 0x5f
    if-eq v3, v4, :spotify_char_ok
    const/16 v4, 0x2d
    if-ne v3, v4, :safe_uri_invalid

    :spotify_char_ok
    add-int/lit8 v2, v2, 0x1
    goto :spotify_id_loop

    :check_https_uri
    const/4 v2, 0x0
    :url_strict_loop
    if-ge v2, v1, :url_strict_done
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C
    move-result v3
    const/16 v4, 0x20
    if-eq v3, v4, :safe_uri_invalid
    const/16 v4, 0x27
    if-eq v3, v4, :safe_uri_invalid
    add-int/lit8 v2, v2, 0x1
    goto :url_strict_loop

    :url_strict_done
    invoke-static {p0}, Lcom/melodix/music/NativeFetchGuard;->parseAllowedUrl(Ljava/lang/String;)Ljava/net/URL;
    move-result-object v1
    if-eqz v1, :safe_uri_invalid
    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/NativeFetchGuard;->isSpotifyAuthHost(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :safe_uri_invalid

    :quote_safe_uri
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "playFromUri("
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, ");"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0

    :safe_uri_invalid
    return-object v0
.end method
