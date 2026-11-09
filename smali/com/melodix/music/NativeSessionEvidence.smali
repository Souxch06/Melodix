.class public final Lcom/melodix/music/NativeSessionEvidence;
.super Ljava/lang/Object;
# Only an ephemeral digest is retained. Never exported, logged or persisted.
.field private static fingerprint:Ljava/lang/String;
.field private static count:I

.method private static current()Ljava/lang/String;
    .locals 4
    :try_start
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    const-string v1, "https://open.spotify.com/"
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :none
    const-string v1, "(?:^|;[ ]*)sp_dc=([^;]+)"
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
    move-result v2
    if-eqz v2, :none
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    const-string v1, "SHA-256"
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B
    move-result-object v0
    const/4 v1, 0x2
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    move-result-object v0
    return-object v0
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :none
    const/4 v0, 0x0
    return-object v0
.end method

.method public static recordCurrentCookie()I
    .locals 1
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->current()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeSessionEvidence;->record(Ljava/lang/String;)I
    move-result v0
    return v0
.end method

# Pure bounded accumulator; caller already deduplicated completed attempt IDs.
.method public static record(Ljava/lang/String;)I
    .locals 2
    if-eqz p0, :missing
    sget-object v0, Lcom/melodix/music/NativeSessionEvidence;->fingerprint:Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :changed
    sget v0, Lcom/melodix/music/NativeSessionEvidence;->count:I
    const/4 v1, 0x2
    if-ge v0, v1, :done
    add-int/lit8 v0, v0, 0x1
    goto :save
    :changed
    sput-object p0, Lcom/melodix/music/NativeSessionEvidence;->fingerprint:Ljava/lang/String;
    const/4 v0, 0x1
    :save
    sput v0, Lcom/melodix/music/NativeSessionEvidence;->count:I
    :done
    return v0
    :missing
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v0, 0x0
    return v0
.end method

.method public static canClear()Z
    .locals 2
    sget v0, Lcom/melodix/music/NativeSessionEvidence;->count:I
    const/4 v1, 0x2
    if-lt v0, v1, :no
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->current()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :no
    sget-object v1, Lcom/melodix/music/NativeSessionEvidence;->fingerprint:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static count()I
    .locals 1
    sget v0, Lcom/melodix/music/NativeSessionEvidence;->count:I
    return v0
.end method

.method public static reset()V
    .locals 1
    const/4 v0, 0x0
    sput-object v0, Lcom/melodix/music/NativeSessionEvidence;->fingerprint:Ljava/lang/String;
    sput v0, Lcom/melodix/music/NativeSessionEvidence;->count:I
    return-void
.end method
