.class public final Lcom/melodix/music/NativeSessionStore;
.super Ljava/lang/Object;

# UI-thread only. A durable, increasing epoch prevents a new process from
# reusing an earlier positive generation. Failure or overflow fails closed.
# This preference contains no cookie, token, identity, URL, or library data.
.method public static advance(Landroid/content/Context;)I
    .locals 5
    :try_start
    const-string v0, "native_session_epoch"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v2, "generation"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v1
    sget v3, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ge v1, v3, :max_chosen
    move v1, v3
    :max_chosen
    if-ltz v1, :failed
    const v3, 0x7fffffff
    if-ge v1, v3, :failed
    add-int/lit8 v1, v1, 0x1
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v2, "verified_generation"
    const/4 v3, 0x0
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result v0
    if-eqz v0, :failed
    sput v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    return v1
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :failed
    const/4 v0, -0x1
    sput v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    return v0
.end method

# Record only an already-validated generation as historical metadata. Never
# rehydrate this value as proof or use it to unlock UI after a restart.
.method public static recordVerified(Landroid/content/Context;I)Z
    .locals 4
    if-lez p1, :failed
    :try_start
    const-string v0, "native_session_epoch"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v2, "generation"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v2
    if-ne v2, p1, :failed
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v2, p1, :failed
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v2, "verified_generation"
    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v2, "last_verified_generation"
    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result v0
    return v0
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :failed
    const/4 v0, 0x0
    return v0
.end method
