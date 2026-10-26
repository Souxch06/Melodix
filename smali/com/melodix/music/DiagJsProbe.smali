.class public final Lcom/melodix/music/DiagJsProbe;
.super Ljava/lang/Object;

# Static helper for the dead native->JS channel investigation. Every send is
# journaled ("js-min ask <tag> #<hash>"), arms the page-alive watcher and logs
# the WebView state at probe time. The ValueCallback/timeout pair keeps the
# always-journaling guarantee. Diagnostic-only: every path is guarded.

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static min(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    # "js-cb exec <tag>" is journaled by the snippet itself before it returns:
    #   js-cb ok + ans 1      -> executed AND the result was delivered
    #   js-cb exec + tmo ans 0 -> executed but the result was never delivered
    #   neither               -> the snippet never ran (or the channel was dead)
    # The probe value itself stays exactly "1" (contract) and JSONObject.quote
    # keeps a caller tag injection-safe inside the JS string.
    const-string v0, "1"
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "(function(){try{window.AndBridge&&window.AndBridge.logDiagEvent("
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "js-cb exec "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz p1, :jsp_min_tag_ready
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :jsp_min_tag_ready
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, ")}catch(e){}return "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "})()"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {p0, p1, v2}, Lcom/melodix/music/DiagJsProbe;->send(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static send(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :jsp_no_target
    if-eqz p2, :jsp_no_target

    :try_start_jsp
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "js-min ask "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz p1, :jsp_tag_ready
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :jsp_tag_ready
    const-string v1, " #"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
    move-result v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    invoke-static {}, Lcom/melodix/music/DiagCounters;->armPageAlive()V
    invoke-static {p0}, Lcom/melodix/music/DiagWebViewState;->journal(Landroid/webkit/WebView;)V

    invoke-static {}, Lcom/melodix/music/DiagCounters;->nextProbeId()I
    move-result v0

    new-instance v1, Lcom/melodix/music/DiagJsProbeCallback;
    invoke-direct {v1, v0, p1}, Lcom/melodix/music/DiagJsProbeCallback;-><init>(ILjava/lang/String;)V
    invoke-virtual {p0, p2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    new-instance v1, Lcom/melodix/music/DiagJsProbeTimeout;
    invoke-direct {v1, v0, p1}, Lcom/melodix/music/DiagJsProbeTimeout;-><init>(ILjava/lang/String;)V

    new-instance v2, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-wide/16 v4, 0x9c4
    invoke-virtual {v2, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_jsp
    .catch Ljava/lang/Throwable; {:try_start_jsp .. :try_end_jsp} :catch_jsp

    return-void

    :catch_jsp
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const-string v0, "js-min err"
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    return-void

    :jsp_no_target
    const-string v0, "js-min ask no-webview"
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    return-void
.end method
