.class public final Lcom/melodix/music/NativeSessionGateTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final generation:I
.field private final payload:Ljava/lang/String;
.method public constructor <init>(Lcom/melodix/music/MainActivity;ILjava/lang/String;)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionGateTask;->activity:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionGateTask;->generation:I
    iput-object p3, p0, Lcom/melodix/music/NativeSessionGateTask;->payload:Ljava/lang/String;
    return-void
.end method
.method public final run()V
    .locals 4
    # Resolve the current Activity so rotation cannot strand the 3s deadline.
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->owner:Ljava/lang/ref/WeakReference;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :done
    iget-object v1, p0, Lcom/melodix/music/NativeSessionGateTask;->payload:Ljava/lang/String;
    if-eqz v1, :deadline
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->result(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    goto :done
    :deadline
    iget v1, p0, Lcom/melodix/music/NativeSessionGateTask;->generation:I
    sget v2, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v1, v2, :done
    sget v1, Lcom/melodix/music/NativeSessionGate;->state:I
    if-nez v1, :done
    const/4 v1, 0x4
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const-string v2, "presentation-deadline-not-expiration"
    invoke-static {v1, v2}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method
