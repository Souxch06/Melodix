.class public final Lcom/melodix/music/NativeAccessRefusal;
.super Ljava/lang/Object;

# Presentation only. Both codes must belong to the same completed attempt.
.method public static prepare(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Z
    .locals 3
    :refusal_try
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->canReconnect()Z
    move-result v0
    if-eqz v0, :refusal_no
    const-string v0, "state"
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "error"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :refusal_no
    const-string v0, "tokenApiHttp"
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v0
    const/16 v1, 0x190
    if-ne v0, v1, :refusal_no
    const-string v0, "tokenFallbackHttp"
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v0
    const/16 v1, 0x193
    if-ne v0, v1, :refusal_no
    # Cancel a loading deadline so it cannot replace this definitive error.
    const-wide/16 v0, 0x0
    iput-wide v0, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    const-string v0, "title"
    const-string v1, "Spotify refuse la demande d’accès (400/403)"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "subtitle"
    const-string v1, "La cause précise du refus n’est pas connue. Réessayer conserve votre session ; Se reconnecter efface les cookies et les données de connexion de cette application avant le login. [auth=non-confirme token-api=400 token-fallback=403 reason=token-refused]"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "uri"
    const-string v1, "melodix:action:retry-library"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v0, "secondaryUri"
    const-string v1, "melodix:action:reconnect"
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const/4 v0, 0x1
    return v0
    :refusal_end
    .catch Lorg/json/JSONException; {:refusal_try .. :refusal_end} :refusal_error
    :refusal_error
    move-exception v0
    :refusal_no
    const/4 v0, 0x0
    return v0
.end method
