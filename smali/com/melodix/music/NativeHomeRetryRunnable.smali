.class final Lcom/melodix/music/NativeHomeRetryRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private remaining:I
.field private final epoch:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput p2, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    sget v0, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    iput v0, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->epoch:I
    return-void
.end method

.method public final run()V
    .locals 5

    iget-object v0, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :done
    iget v1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->epoch:I
    sget v2, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v1, v2, :done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->pullNativeHomeList()V

    iget v1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    add-int/lit8 v1, v1, -0x1
    iput v1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    if-gtz v1, :done

    iget-object v2, v0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;
    if-eqz v2, :done
    const-wide/16 v3, 0x190
    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :done
    return-void
.end method
