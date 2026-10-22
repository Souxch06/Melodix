.class final Lcom/melodix/music/NativeListPaintRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final text:Ljava/lang/String;

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeListPaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeListPaintRunnable;->text:Ljava/lang/String;
    return-void
.end method

.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeListPaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    iget-object v1, p0, Lcom/melodix/music/NativeListPaintRunnable;->text:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :done

    :done
    return-void
.end method
