.class public final Lcom/melodix/music/NativeSessionDebug;
.super Ljava/lang/Object;

# Debuggable builds only. Closed enum journal, process-local, never persistent.
.field private static journal:Ljava/lang/StringBuffer;

.method static constructor <clinit>()V
    .locals 1
    new-instance v0, Ljava/lang/StringBuffer;
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeSessionDebug;->journal:Ljava/lang/StringBuffer;
    return-void
.end method

.method public static enabled(Landroid/content/Context;)Z
    .locals 1
    :try_start
    if-eqz p0, :no
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    move-result-object v0
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    and-int/lit8 v0, v0, 0x2
    if-eqz v0, :no
    const/4 v0, 0x1
    return v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :no
    const/4 v0, 0x0
    return v0
.end method

# Validates even calls made by arbitrary WebView frames, before storing anything.
.method public static record(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    :try_start
    invoke-static {p0}, Lcom/melodix/music/NativeSessionDebug;->enabled(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :done
    if-eqz p1, :done
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x100
    if-gt v0, v1, :done
    const-string v0, "(?:probe result=interface|native getter=(?:number|text) thread=(?:main|javascript-interface|other)|getter=(?:number|text) type=(?:undefined|number|string|boolean|object|function|exception|absent) null=(?:yes|no) origin=(?:https://open[.]spotify[.]com|other) route=(?:root|app|search|other) load=(?:loading|interactive|complete|unknown) frame=(?:top|child|unknown)|token-error endpoint=api http=400 body=(?:waiting|wrong_mime|unavailable|truncated|invalid_json|json) code=(?:[0-9]{1,3}|absent|other|invalid_request|invalid_client|invalid_grant|invalid_token|unauthorized|forbidden|bad_request|access_denied|rate_limited) status=(?:unknown|[1-5][0-9]{2}) message=(?:absent|other|missing_parameter|invalid_parameter|unsupported|auth|access_denied|rate_limit)|token-error endpoint=fallback http=403 body=(?:waiting|wrong_mime|unavailable|truncated|html) title=(?:unknown|absent|other|access_denied|403_forbidden|forbidden|just_a_moment|attention_required_cloudflare) marker=(?:none|captcha|challenge|access_denied|rate_limit) cloudflare=(?:yes|no)|http method=POST endpoint=https://api-partner[.]spotify[.]com/pathfinder/v2/query status=(?:400|401|403) token=(?:api|fallback|cache-api|cache-fallback|unknown) body=(?:empty|redacted|invalid_token|unauthorized|forbidden|bad_request|unknown))"
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :done
    sget-object v0, Lcom/melodix/music/NativeSessionDebug;->journal:Ljava/lang/StringBuffer;
    monitor-enter v0
    :locked
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I
    move-result v1
    const/16 v2, 0x1000
    if-lt v1, v2, :append
    const/4 v1, 0x0
    const/16 v2, 0x800
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;
    :append
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :unlock
    .catchall {:locked .. :unlock} :unlock_error
    monitor-exit v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :done
    return-void
    :unlock_error
    move-exception v1
    monitor-exit v0
    throw v1
    :error
    move-exception v0
    return-void
.end method

.method public static getter(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    :try_start
    invoke-static {p0}, Lcom/melodix/music/NativeSessionDebug;->enabled(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :done
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    const-string v2, "main"
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :build
    const-string v2, "other"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object v0
    const-string v1, "JavaBridge"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :build
    const-string v2, "javascript-interface"
    :build
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "native getter="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " thread="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {p0, v0}, Lcom/melodix/music/NativeSessionDebug;->record(Landroid/content/Context;Ljava/lang/String;)V
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    return-void
.end method

.method public static append(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    invoke-static {p1}, Lcom/melodix/music/NativeSessionDebug;->enabled(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :done
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "\nDiagnostic debug (données expurgées) :\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget-object v2, Lcom/melodix/music/NativeSessionDebug;->journal:Ljava/lang/StringBuffer;
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    :done
    return-object p0
.end method
