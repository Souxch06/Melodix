.class public final Lcom/melodix/music/DiagWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Bounded terminal-state guarantee for the diagnostic screen: when a JS engine
# action starts, the watchdog is armed; if no engine report arrives within
# 35 seconds, it repaints the native diagnostic message with a terminal error
# row. The screen can never stay on "tests in progress" forever.

.field private static activity:Ljava/lang/ref/WeakReference;
.field public static armed:Z

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static arm(Lcom/melodix/music/MainActivity;)V
    .locals 5

    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/DiagWatchdog;->armed:Z

    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/melodix/music/DiagWatchdog;->activity:Ljava/lang/ref/WeakReference;

    new-instance v1, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/melodix/music/DiagWatchdog;
    invoke-direct {v2}, Lcom/melodix/music/DiagWatchdog;-><init>()V

    const-wide/16 v3, 0x88b8
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method

.method public static disarm()V
    .locals 1

    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/DiagWatchdog;->armed:Z
    return-void
.end method

.method public run()V
    .locals 2

    sget-boolean v0, Lcom/melodix/music/DiagWatchdog;->armed:Z
    if-eqz v0, :wd_done

    sget-object v0, Lcom/melodix/music/DiagWatchdog;->activity:Ljava/lang/ref/WeakReference;
    if-eqz v0, :wd_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :wd_done

    invoke-static {}, Lcom/melodix/music/DiagWatchdog;->disarm()V

    const-string v1, "Aucune réponse du moteur de tests après 35 s"
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->paintDiagNative(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/melodix/music/MainActivity;->autoCopyDiagIfArmed(Lcom/melodix/music/MainActivity;)V

    :wd_done
    return-void
.end method
