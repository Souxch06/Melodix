.class final Lcom/melodix/music/NativeHomeRetryRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private remaining:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput p2, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    return-void
.end method

.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->pullNativeHomeList()V

    iget v1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    add-int/lit8 v1, v1, -0x1
    iput v1, p0, Lcom/melodix/music/NativeHomeRetryRunnable;->remaining:I
    if-gtz v1, :done

    new-instance v2, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    const-wide/16 v3, 0x190
    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :done
    return-void
.end method
