.class public final Lcom/melodix/music/NativeSessionTimeout;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final started:J

.method public constructor <init>(Lcom/melodix/music/MainActivity;J)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionTimeout;->activity:Ljava/lang/ref/WeakReference;
    iput-wide p2, p0, Lcom/melodix/music/NativeSessionTimeout;->started:J
    return-void
.end method

.method public final run()V
    .locals 6
    iget-object v0, p0, Lcom/melodix/music/NativeSessionTimeout;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :timeout_done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :timeout_done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :timeout_done
    iget-wide v2, v0, Lcom/melodix/music/MainActivity;->nativeVerificationStart:J
    iget-wide v4, p0, Lcom/melodix/music/NativeSessionTimeout;->started:J
    cmp-long v1, v2, v4
    if-nez v1, :timeout_done
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->hasNativeHomeCardsAttached()Z
    move-result v1
    if-nez v1, :timeout_done
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->isNativeHomeScreen()Z
    move-result v1
    if-eqz v1, :timeout_done
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->isNativeSessionUnproven()Z
    move-result v1
    if-eqz v1, :timeout_done
    const-string v1, "session-verify result=timeout"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    const-string v1, "[{\"kind\":\"state\",\"state\":\"error\",\"sessionUnproven\":true,\"title\":\"Vérification Spotify impossible\",\"subtitle\":\"Aucune confirmation après 15 s. Réessayez sans effacer votre session. [auth=non-confirme reason=verification-timeout]\",\"uri\":\"melodix:action:retry-library\",\"secondaryUri\":\"melodix:action:open-login\"}]"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeHomeShelfRenderer;->render(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    :timeout_done
    return-void
.end method
