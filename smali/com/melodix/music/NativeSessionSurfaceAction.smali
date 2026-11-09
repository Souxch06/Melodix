.class public final Lcom/melodix/music/NativeSessionSurfaceAction;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final action:I
.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->activity:Ljava/lang/ref/WeakReference;
    iput p2, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->action:I
    return-void
.end method
.method public final onClick(Landroid/view/View;)V
    .locals 3
    iget-object v0, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    iget v1, p0, Lcom/melodix/music/NativeSessionSurfaceAction;->action:I
    const/4 v2, 0x2
    if-eq v1, v2, :reconnect
    const/4 v2, 0x1
    if-eq v1, v2, :login
    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->hasCookie()Z
    move-result v1
    if-eqz v1, :login
    invoke-static {v0}, Lcom/melodix/music/NativeSessionRecovery;->verify(Lcom/melodix/music/MainActivity;)V
    goto :done
    :login
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->openSpotifyLogin()V
    goto :done
    :reconnect
    invoke-static {v0}, Lcom/melodix/music/NativeSessionReconnect;->start(Lcom/melodix/music/MainActivity;)V
    :done
    return-void
.end method
