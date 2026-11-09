.class public final Lcom/melodix/music/NativeSessionDiagnosticPull;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.implements Landroid/webkit/ValueCallback;

# Diagnostic-only fallback. Does not retain an Activity or influence session proof.
.field private final webview:Ljava/lang/ref/WeakReference;
.field private final generation:I
.field private remaining:I
.field private deadline:J
.field private lastPayload:Ljava/lang/String;
.field private lastStatus:Ljava/lang/String;

.method public constructor <init>(Landroid/webkit/WebView;I)V
    .locals 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->webview:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->generation:I
    const/16 v0, 0x1e
    iput v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->remaining:I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    const-wide/16 v2, 0x7530
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->deadline:J
    return-void
.end method

# Emit fixed labels only, on status changes, not JSON or exception contents.
.method private status(Ljava/lang/String;)V
    .locals 2
    iget-object v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->lastStatus:Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :done
    iput-object p1, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->lastStatus:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "session-pull result="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    :done
    return-void
.end method

.method public final run()V
    .locals 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->deadline:J
    cmp-long v4, v0, v2
    if-gez v4, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->remaining:I
    if-lez v0, :done
    iget v1, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->generation:I
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v1, v2, :done
    iget-object v1, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->webview:Ljava/lang/ref/WeakReference;
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/webkit/WebView;
    if-eqz v1, :done
    add-int/lit8 v0, v0, -0x1
    iput v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->remaining:I
    :try_start
    const-string v0, "(function(){var d=window.__sfSessionRetrySnapshot;if(!d||d.source!=='native-retry')return null;function n(v,max){return Number.isInteger(v)&&v>=0&&v<=max?v:-1;}function h(v){return Number.isInteger(v)&&v>=100&&v<=599?v:null;}var t=['obtained','refused','not-attempted'];var r=['abandon=requete-perimee','abandon=contexte-auth-perime','token-source=cache'];return {generation:n(d.generation,2147483647),attempt:n(d.attempt,999999),source:'native-retry',apiHttp:h(d.apiHttp),fallbackHttp:h(d.fallbackHttp),libraryHttp:h(d.libraryHttp),completed:d.completed===true,tokenResult:t.indexOf(d.tokenResult)>=0?d.tokenResult:'unknown',reason:r.indexOf(d.reason)>=0?d.reason:''};})()"
    invoke-virtual {v1, v0, p0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    const-string v0, "exception"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 5
    :try_start
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->deadline:J
    cmp-long v4, v0, v2
    if-gez v4, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    instance-of v0, p1, Ljava/lang/String;
    if-eqz v0, :empty
    check-cast p1, Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x200
    if-gt v0, v1, :invalid
    const-string v0, "null"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :empty
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v1, "source"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "native-retry"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :invalid
    const-string v1, "generation"
    const/4 v2, -0x1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I
    move-result v1
    iget v2, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->generation:I
    if-ne v1, v2, :mismatch
    const-string v1, "attempt"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v1
    if-lez v1, :invalid
    const v2, 0xf423f
    if-gt v1, v2, :invalid
    iget-object v1, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->lastPayload:Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :schedule
    iput-object p1, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->lastPayload:Ljava/lang/String;
    const-string v1, "accepted"
    invoke-direct {p0, v1}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    # Already on the WebView/main thread; reuse the exact observation-only merger.
    new-instance v1, Lcom/melodix/music/NativeSessionAttemptDiagnostic;
    invoke-direct {v1, p1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->run()V
    goto :schedule
    :empty
    const-string v0, "empty"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    goto :schedule
    :mismatch
    const-string v0, "generation-mismatch"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    goto :schedule
    :invalid
    const-string v0, "invalid"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    :schedule
    iget v0, p0, Lcom/melodix/music/NativeSessionDiagnosticPull;->remaining:I
    if-lez v0, :done
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    const-wide/16 v1, 0x3e8
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    const-string v0, "exception"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionDiagnosticPull;->status(Ljava/lang/String;)V
    return-void
.end method
