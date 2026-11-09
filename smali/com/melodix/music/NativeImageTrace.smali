.class public final Lcom/melodix/music/NativeImageTrace;
.super Ljava/lang/Object;
.field private static count:I

.method public static synchronized log(Ljava/lang/String;)V
    .locals 2
    sget v0, Lcom/melodix/music/NativeImageTrace;->count:I
    const/16 v1, 0xc0
    if-ge v0, v1, :log_done
    add-int/lit8 v0, v0, 0x1
    sput v0, Lcom/melodix/music/NativeImageTrace;->count:I
    invoke-static {p0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    if-ne v0, v1, :log_done
    const-string v0, "image stage=limit"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    :log_done
    return-void
.end method

# No raw URL, query, account, headers or exception messages reach log().
.method public static identity(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    :id_try
    if-nez p0, :id_present
    const-string p0, ""
    :id_present
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v0
    const-string v1, "other"
    if-eqz v0, :id_host
    const-string v2, "(?i)([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)"
    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :id_host
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
    :id_host
    const-string v0, "SHA-256"
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    move-result-object v0
    const-string v2, "UTF-8"
    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->digest([B)[B
    move-result-object v0
    new-instance v2, Ljava/math/BigInteger;
    const/4 v3, 0x1
    invoke-direct {v2, v3, v0}, Ljava/math/BigInteger;-><init>(I[B)V
    const/16 v3, 0x10
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;
    move-result-object v2
    const-string v0, "0000000000000000000000000000000000000000000000000000000000000000"
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v2
    add-int/lit8 v2, v2, -0x40
    add-int/lit8 v3, v2, 0x8
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "host="
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, " key="
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
    :id_end
    .catch Ljava/lang/Exception; {:id_try .. :id_end} :id_error
    :id_error
    move-exception v0
    const-string v0, "host=other key=00000000"
    return-object v0
.end method

.method public static form(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    if-eqz p0, :form_empty
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :form_empty
    const-string v0, "spotify:image:"
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :form_spotify
    const-string v0, "^https://[A-Za-z0-9.-]+(?::443)?/[^\\s]+$"
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :form_invalid
    const-string v0, "https"
    return-object v0
    :form_spotify
    const-string v0, "spotify"
    return-object v0
    :form_empty
    const-string v0, "empty"
    return-object v0
    :form_invalid
    const-string v0, "invalid"
    return-object v0
.end method

.method public static start(Ljava/lang/String;I)V
    .locals 4
    invoke-static {p0}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {p0}, Lcom/melodix/music/NativeImageTrace;->form(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=start "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " form="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " px="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    return-void
.end method

.method public static http(Lcom/squareup/picasso/Request;Lf11;J)V
    .locals 10
    :http_try
    iget-object v2, p0, Lcom/squareup/picasso/Request;->uri:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v3
    sub-long/2addr v3, p2
    const-wide/32 v5, 0xf423f
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J
    move-result-wide v3
    iget v5, p1, Lf11;->m:I
    const-string v6, "unknown"
    const-wide/16 v7, -0x1
    iget-object v9, p1, Lf11;->p:Lh11;
    if-eqz v9, :http_body_done
    invoke-virtual {v9}, Lh11;->a()J
    move-result-wide v7
    invoke-virtual {v9}, Lh11;->g()Llm0;
    move-result-object v9
    if-eqz v9, :http_body_done
    invoke-virtual {v9}, Llm0;->toString()Ljava/lang/String;
    move-result-object v9
    const-string v6, "other"
    const-string v0, "(?i)image/(jpeg|png|webp|avif|gif)"
    invoke-virtual {v9, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :http_body_done
    const/4 v0, 0x6
    invoke-virtual {v9, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v6
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v6, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v6
    :http_body_done
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=http "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " code="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " duration="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, " bytes="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, " type="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    :http_end
    .catch Ljava/lang/Exception; {:http_try .. :http_end} :http_error
    return-void
    :http_error
    move-exception v0
    return-void
.end method

.method public static result(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v2
    sub-long/2addr v2, p2
    const-wide/32 v4, 0xf423f
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J
    move-result-wide v2
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=result "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " result="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " duration="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    return-void
.end method

.method public static display(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 5
    if-eqz p0, :display_done
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v2
    const/4 v3, 0x0
    const/4 v4, 0x0
    if-eqz v2, :display_bounds
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
    move-result v3
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    move-result v4
    :display_bounds
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=decoded "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " width="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " height="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I
    move-result v3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I
    move-result v4
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z
    move-result v2
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=view "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " width="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " height="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " shown="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    :display_done
    return-void
.end method

.method public static payload(Lorg/json/JSONArray;)V
    .locals 11
    const/4 v10, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I
    move-result v6
    :payload_loop
    if-ge v2, v6, :payload_summary
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v7
    if-eqz v7, :payload_next
    const-string v8, "kind"
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    const-string v9, "state"
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :payload_next
    add-int/lit8 v10, v10, 0x1
    const-string v8, "image"
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static {v7}, Lcom/melodix/music/NativeImageTrace;->form(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    const-string v9, "empty"
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :payload_not_empty
    add-int/lit8 v4, v4, 0x1
    goto :payload_source
    :payload_not_empty
    const-string v9, "https"
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :payload_invalid
    add-int/lit8 v3, v3, 0x1
    goto :payload_source
    :payload_invalid
    add-int/lit8 v5, v5, 0x1
    :payload_source
    const/16 v9, 0x20
    if-ge v2, v9, :payload_next
    invoke-static {v7}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=source "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " form="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    :payload_next
    add-int/lit8 v2, v2, 0x1
    goto :payload_loop
    :payload_summary
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "image stage=payload "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " https="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " missing="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, " invalid="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    return-void
.end method

.method public static request(Lcom/squareup/picasso/Request;)V
    .locals 2
    iget-object v0, p0, Lcom/squareup/picasso/Request;->uri:Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "image stage=request "
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeImageTrace;->log(Ljava/lang/String;)V
    return-void
.end method

.method public static failure(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 2
    instance-of v0, p0, Ljava/net/UnknownHostException;
    if-nez v0, :failure_network
    instance-of v0, p0, Ljava/net/SocketException;
    if-nez v0, :failure_network
    instance-of v0, p0, Ljavax/net/ssl/SSLException;
    if-nez v0, :failure_network
    if-eqz p0, :failure_other
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v0
    const-string v1, "ResponseException"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :failure_http
    instance-of v0, p0, Ljava/io/IOException;
    if-nez v0, :failure_io
    :failure_other
    const-string v0, "failed-other"
    return-object v0
    :failure_network
    const-string v0, "failed-network"
    return-object v0
    :failure_http
    const-string v0, "failed-http"
    return-object v0
    :failure_io
    const-string v0, "failed-io"
    return-object v0
.end method

.method public static reset()V
    .locals 1
    const/4 v0, 0x0
    sput v0, Lcom/melodix/music/NativeImageTrace;->count:I
    return-void
.end method
