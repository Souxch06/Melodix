.class public final Lcom/melodix/music/NativeSessionReconnect;
.super Ljava/lang/Object;

# A request to reconnect is not permission to erase browsing data. Keep the
# existing cookie, storage and proof; Spotify controls its own login state.
.method public static start(Lcom/melodix/music/MainActivity;)V
    .locals 3
    if-eqz p0, :done
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->canReconnect()Z
    move-result v0
    if-eqz v0, :done
    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    if-nez v0, :done
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    const-wide/16 v0, 0x0
    iput-wide v0, p0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    :try_start
    # Recheck evidence at the tap, but reset only the in-memory refusal record.
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->canClear()Z
    move-result v0
    if-eqz v0, :failed
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->freshLogin:Z
    const-string v1, "reconnect-user-confirmed"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->navigateLogin(Lcom/melodix/music/MainActivity;)V
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    :failed
    invoke-static {p0}, Lcom/melodix/music/NativeSessionReconnect;->failed(Lcom/melodix/music/MainActivity;)V
    return-void
.end method

.method public static failed(Lcom/melodix/music/MainActivity;)V
    .locals 2
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeReconnectPending:Z
    sput-boolean v0, Lcom/melodix/music/NativeSessionGate;->expiredEvidence:Z
    invoke-static {}, Lcom/melodix/music/NativeSessionEvidence;->reset()V
    const/4 v0, 0x4
    const-string v1, "reconnect-not-confirmed"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionGate;->transition(ILjava/lang/String;)V
    invoke-static {p0}, Lcom/melodix/music/NativeSessionGate;->paint(Lcom/melodix/music/MainActivity;)V
    return-void
.end method
