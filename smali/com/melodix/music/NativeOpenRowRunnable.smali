.class final Lcom/melodix/music/NativeOpenRowRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final uri:Ljava/lang/String;
.field private final title:Ljava/lang/String;
.field private final epoch:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeOpenRowRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeOpenRowRunnable;->uri:Ljava/lang/String;
    iput-object p3, p0, Lcom/melodix/music/NativeOpenRowRunnable;->title:Ljava/lang/String;
    sget v0, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    iput v0, p0, Lcom/melodix/music/NativeOpenRowRunnable;->epoch:I
    return-void
.end method

.method public final run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeOpenRowRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :done
    iget v1, p0, Lcom/melodix/music/NativeOpenRowRunnable;->epoch:I
    sget v2, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v1, v2, :done

    iget-object v1, p0, Lcom/melodix/music/NativeOpenRowRunnable;->uri:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeOpenRowRunnable;->title:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->openNativeRow(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :done
    return-void

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
