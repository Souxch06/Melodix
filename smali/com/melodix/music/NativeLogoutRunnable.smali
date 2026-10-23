.class final Lcom/melodix/music/NativeLogoutRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeLogoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method

.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeLogoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    const/4 v1, 0x1
    sput-boolean v1, Lcom/melodix/music/MainActivity;->l0:Z
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->resetNativeStateForLogout()V
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->A()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :done
    return-void

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
