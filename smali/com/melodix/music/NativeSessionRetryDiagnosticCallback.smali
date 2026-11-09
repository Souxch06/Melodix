.class public final Lcom/melodix/music/NativeSessionRetryDiagnosticCallback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;
.field private final generation:I
.method public constructor <init>(I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/melodix/music/NativeSessionRetryDiagnosticCallback;->generation:I
    return-void
.end method
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 3
    const-string v0, "\"fonction-js-indisponible\""
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :blocked
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryDiagnosticCallback;->generation:I
    const/4 v1, 0x0
    const-string v2, "blocage=fonction-js-indisponible"
    invoke-static {v0, v1, v2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->note(IILjava/lang/String;)V
    const-string v2, "retry-js-unavailable"
    invoke-static {v0, v2}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    return-void
    :blocked
    const-string v0, "\"verification-bloquee\""
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :null_result
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryDiagnosticCallback;->generation:I
    const-string v2, "retry-blocked"
    invoke-static {v0, v2}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    return-void
    :null_result
    const-string v0, "null"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    iget v0, p0, Lcom/melodix/music/NativeSessionRetryDiagnosticCallback;->generation:I
    const-string v2, "retry-launch-failed"
    invoke-static {v0, v2}, Lcom/melodix/music/NativeSessionGate;->retryFailed(ILjava/lang/String;)V
    :done
    return-void
.end method
