.class public final Lcom/melodix/music/NativeSessionStatus;
.super Ljava/lang/Object;

# Presentation only: never sets proof or changes a response/auth state.
.method public static prepare(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)V
    .locals 7
    :status_try
    const-string v0, "sessionUnproven"
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :status_done
    const-string v0, "state"
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "loading"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :status_actions
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->scheduleNativeSessionTimeout()V
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v1
    iget-wide v3, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    sub-long/2addr v1, v3
    const-wide/16 v3, 0x3a98
    cmp-long v1, v1, v3
    if-gez v1, :status_expired
    const-string v0, "subtitle"
    const-string v1, "Vérification de votre bibliothèque en cours (15 s maximum)."
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "uri"
    const-string v1, ""
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "secondaryUri"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    goto :status_done
    :status_expired
    const-string v0, "state"
    const-string v1, "error"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "title"
    const-string v1, "Vérification Spotify impossible"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "subtitle"
    const-string v1, "Aucune confirmation après 15 s. Réessayez sans effacer votre session. [auth=non-confirme reason=verification-timeout]"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :status_actions
    const-string v0, "uri"
    const-string v1, "melodix:action:retry-library"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v1
    const-string v0, "secondaryUri"
    if-eqz v1, :status_login
    const-string v1, ""
    goto :status_secondary
    :status_login
    const-string v1, "melodix:action:open-login"
    :status_secondary
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :status_done
    :status_end
    .catch Lorg/json/JSONException; {:status_try .. :status_end} :status_error
    return-void
    :status_error
    move-exception v0
    return-void
.end method
