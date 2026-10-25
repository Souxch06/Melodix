.class public final Lcom/melodix/music/DiagJsProbeCallback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;

# ValueCallback for the evaluateJavascript delivery probe. The callback fires
# from the WebView renderer layer regardless of the AndBridge JS interface: if
# "js-cb <id> <value>" reaches the journal, evaluateJavascript really executes
# JS on the device; if only "js-cb ask" appears, the native->JS delivery itself
# is dead (renderer gone, stale WebView, or dropped evaluation). Never logs
# more than 120 chars of the returned value.

.field private final id:I

.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/melodix/music/DiagJsProbeCallback;->id:I

    return-void
.end method

.method public final onReceiveValue(Ljava/lang/String;)V
    .locals 4

    invoke-static {}, Lcom/melodix/music/DiagCounters;->answerProbe()V

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "js-cb "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/melodix/music/DiagJsProbeCallback;->id:I
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cb_null
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 0x78
    if-gt v2, v3, :cb_trunc
    move-object v1, p1
    goto :cb_val

    :cb_trunc
    const/4 v3, 0x0
    const/16 v2, 0x78
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1
    goto :cb_val

    :cb_null
    const-string v1, "null"

    :cb_val
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    return-void
.end method
