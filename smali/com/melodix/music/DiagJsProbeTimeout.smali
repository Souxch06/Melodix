.class public final Lcom/melodix/music/DiagJsProbeTimeout;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Terminal marker for the evaluateJavascript delivery probe: if the probe's
# ValueCallback has not answered after the bounded delay, journals
# "js-probe miss cb=absent id=N" so the report always ends on a terminal
# statement about native->JS delivery (answered / missed / no webview).

.field private final id:I

.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeTimeout;->id:I

    return-void
.end method

.method public final run()V
    .locals 3

    invoke-static {}, Lcom/melodix/music/DiagCounters;->probePending()Z
    move-result v0
    if-eqz v0, :probe_timeout_done

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js-probe miss cb=absent id="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/melodix/music/DiagJsProbeTimeout;->id:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    :probe_timeout_done
    return-void
.end method
