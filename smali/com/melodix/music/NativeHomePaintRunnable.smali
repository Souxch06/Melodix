.class final Lcom/melodix/music/NativeHomePaintRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final json:Ljava/lang/String;
.field private final epoch:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomePaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeHomePaintRunnable;->json:Ljava/lang/String;
    const/4 v0, 0x0
    if-eqz p1, :save_epoch
    iget v0, p1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    :save_epoch
    iput v0, p0, Lcom/melodix/music/NativeHomePaintRunnable;->epoch:I
    return-void
.end method

.method public final run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeHomePaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :try_end_0
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :try_end_0
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :try_end_0
    iget v1, p0, Lcom/melodix/music/NativeHomePaintRunnable;->epoch:I
    iget v2, v0, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v1, v2, :try_end_0

    iget-object v1, p0, Lcom/melodix/music/NativeHomePaintRunnable;->json:Ljava/lang/String;
    if-eqz v1, :try_end_0
    const-string v2, "home"
    invoke-virtual {v0, v2, v1}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    return-void

    :catch_0
    move-exception v0
    return-void
.end method
