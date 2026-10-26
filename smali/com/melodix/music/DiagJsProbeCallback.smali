.class public final Lcom/melodix/music/DiagJsProbeCallback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

# ValueCallback for the evaluateJavascript delivery probes. The callback fires
# from the WebView renderer layer regardless of the AndBridge JS interface:
#   js-cb <id> <tag> <class> <value>  -> evaluateJavascript really executed JS
#   js-cb <id> <tag> null             -> JS ran and returned nothing
#   js-cb err                         -> the callback itself failed (visible)
# The returned value is stringified with Object.toString() and the class name
# is kept: some WebView flavours hand the result over as a non-String object,
# and a check-cast would swallow the evidence. Everything is guarded: the
# probe is diagnostic-only and must never crash the app.

.field private final id:I
.field private final tag:Ljava/lang/String;

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeCallback;->id:I

    const-string v0, "-"
    iput-object v0, p0, Lcom/melodix/music/DiagJsProbeCallback;->tag:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeCallback;->id:I

    if-eqz p2, :tag_default
    iput-object p2, p0, Lcom/melodix/music/DiagJsProbeCallback;->tag:Ljava/lang/String;
    goto :tag_ready

    :tag_default
    const-string v0, "-"
    iput-object v0, p0, Lcom/melodix/music/DiagJsProbeCallback;->tag:Ljava/lang/String;

    :tag_ready
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 4

    :try_start_cb
    invoke-static {}, Lcom/melodix/music/DiagCounters;->answerProbe()V

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js-cb "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/melodix/music/DiagJsProbeCallback;->id:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/melodix/music/DiagJsProbeCallback;->tag:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cb_null

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :cb_val_done
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 0x50
    if-le v2, v3, :cb_append
    const/4 v3, 0x0
    const/16 v2, 0x50
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    :cb_append
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :cb_val_done

    :cb_null
    const-string v1, "null"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cb_val_done
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    :try_end_cb
    .catch Ljava/lang/Throwable; {:try_start_cb .. :try_end_cb} :catch_cb

    return-void

    :catch_cb
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    const-string v0, "js-cb err"
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    return-void
.end method
