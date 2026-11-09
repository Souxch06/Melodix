.class public final Lcom/melodix/music/NativeSessionRetryLaunch;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.implements Landroid/webkit/ValueCallback;

# One generation-scoped launch, bounded independently of the JS callback.
# No Activity retained, no cookies read, no proof or navigation created here.
.field private final webview:Ljava/lang/ref/WeakReference;
.field private final generation:I
.field private final documentGeneration:I
.field private final deadline:J
.field private pending:Z
.field private finished:Z
.field private lastProbe:Ljava/lang/String;

.method public constructor <init>(Landroid/webkit/WebView;I)V
    .locals 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->webview:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->generation:I
    sget v0, Lcom/melodix/music/NativeSessionTrace;->documentGeneration:I
    iput v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->documentGeneration:I
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    const-wide/16 v2, 0x1f40
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->deadline:J
    const-string v0, "session-verify result=waiting"
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    return-void
.end method

.method private fail(Ljava/lang/String;)V
    .locals 3
    iget-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->finished:Z
    if-nez v0, :done
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->finished:Z
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    const/4 v1, 0x0
    const-string v2, "retry-js-unavailable"
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :failure
    const-string v2, "blocage=fonction-js-indisponible"
    invoke-static {v0, v1, v2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->note(IILjava/lang/String;)V
    :failure
    invoke-static {v0, p1}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    :done
    return-void
.end method

.method public final run()V
    .locals 6
    iget-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->finished:Z
    if-nez v0, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->documentGeneration:I
    sget v1, Lcom/melodix/music/NativeSessionTrace;->documentGeneration:I
    if-ne v0, v1, :document_changed
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :done
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x2
    if-eq v0, v1, :done
    const/4 v1, 0x3
    if-eq v0, v1, :done
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->deadline:J
    cmp-long v4, v0, v2
    if-gez v4, :timeout
    iget-object v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->webview:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/webkit/WebView;
    if-eqz v0, :missing
    :try_start
    iget-boolean v1, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->pending:Z
    if-nez v1, :schedule
    # Evaluated script rechecks the current page host and native generation.
    # Only one evaluateJavascript is outstanding; the callback decides whether
    # a request was launched before another evaluation can be made.
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "(function(){try{if(location.protocol!=='https:'||location.hostname!=='open.spotify.com')return 'session-probe result=page';if(!window.AndBridge||typeof window.AndBridge.getSessionGeneration!=='function')return 'session-probe result=interface';var g=window.AndBridge.getSessionGeneration(),expected="
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v2, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->generation:I
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v2, ";if(g!==expected){if(g===null)return 'session-probe result=generation-null';if(typeof g==='undefined')return 'session-probe result=generation-undefined';if(typeof g==='string')return 'session-probe result=generation-string';if(typeof g==='boolean')return 'session-probe result=generation-boolean';if(typeof g!=='number')return 'session-probe result=generation-other';if(!Number.isInteger(g))return 'session-probe result=generation-number-invalid';return g<expected?'session-probe result=generation-older':'session-probe result=generation-newer';}if(typeof window.__sfRequestSessionVerification!=='function'){if(!window.__sfNativeUiShellStarted)return 'session-probe result=shell';if(typeof window.__sfLoadBundledBridge!=='function')return 'session-probe result=loader';if(!window.__sfSessionRetryLoaderCalled){window.__sfSessionRetryLoaderCalled=true;window.__sfLoadBundledBridge('spotify_bridge.js');}if(typeof window.__sfRequestSessionVerification!=='function')return 'session-probe result=hook';}window.__sfSessionRetrySnapshot=null;var r=window.__sfRequestSessionVerification();return r===false?'verification-bloquee':'verification-dispatched';}catch(e){return 'verification-erreur';}})();"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0x1
    iput-boolean v2, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->pending:Z
    invoke-virtual {v0, v1, p0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :schedule
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    const-wide/16 v1, 0x12c
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    move-result v0
    if-nez v0, :try_end
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :done
    return-void
    :document_changed
    const-string v0, "session-verify result=document-changed"
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
    :missing
    const-string v0, "retry-webview-unavailable"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
    :timeout
    iget-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->pending:Z
    if-eqz v0, :not_ready
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
    :not_ready
    const-string v0, "retry-js-unavailable"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
    :error
    move-exception v0
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3
    iget-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->finished:Z
    if-nez v0, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->generation:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v0, v1, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->documentGeneration:I
    sget v1, Lcom/melodix/music/NativeSessionTrace;->documentGeneration:I
    if-ne v0, v1, :document_changed
    sget-boolean v0, Lcom/melodix/music/NativeSessionGate;->loginActive:Z
    if-nez v0, :done
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->pending:Z
    # Only a closed enum from the evaluated script reaches the journal.
    instance-of v0, p1, Ljava/lang/String;
    if-eqz v0, :error
    check-cast p1, Ljava/lang/String;
    const-string v0, "\"session-probe result=(page|interface|generation-(type|older|newer|null|undefined|string|boolean|other|number-invalid)|shell|loader|hook)\""
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :not_probe
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    add-int/lit8 v0, v0, -0x1
    const/4 v1, 0x1
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->lastProbe:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done
    iput-object v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->lastProbe:Ljava/lang/String;
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    return-void
    :not_probe
    const-string v0, "\"verification-dispatched\""
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :blocked
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/NativeSessionRetryLaunch;->finished:Z
    const-string v0, "session-verify result=dispatched"
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    return-void
    :blocked
    const-string v0, "\"verification-bloquee\""
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :error
    const-string v0, "retry-blocked"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
    :error
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    :done
    return-void
    :document_changed
    const-string v0, "session-verify result=document-changed"
    invoke-static {v0}, Lcom/melodix/music/NativeStartupTiming;->sessionMark(Ljava/lang/String;)V
    const-string v0, "retry-launch-failed"
    invoke-direct {p0, v0}, Lcom/melodix/music/NativeSessionRetryLaunch;->fail(Ljava/lang/String;)V
    return-void
.end method
