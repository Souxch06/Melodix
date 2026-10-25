.class public final Lcom/melodix/music/NativeLibWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Bounded terminal-state guarantee for the native Library tab: when the tab is
# opened without a cache it paints "Chargement…"; if no media rows arrive
# within 10 s the screen MUST resolve to an explicit error state with a
# "Réessayer" row — never an eternal loading state, never a false
# "aucune playlist" claim. Media rows disarm it.

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
    sput-boolean v0, Lcom/melodix/music/NativeLibWatchdog;->armed:Z

    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/melodix/music/NativeLibWatchdog;->activity:Ljava/lang/ref/WeakReference;

    new-instance v1, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/melodix/music/NativeLibWatchdog;
    invoke-direct {v2}, Lcom/melodix/music/NativeLibWatchdog;-><init>()V

    const-wide/16 v3, 0x2710
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method

.method public static disarm()V
    .locals 1

    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/NativeLibWatchdog;->armed:Z
    return-void
.end method

.method public run()V
    .locals 2

    sget-boolean v0, Lcom/melodix/music/NativeLibWatchdog;->armed:Z
    if-eqz v0, :nlw_done

    sget-object v0, Lcom/melodix/music/NativeLibWatchdog;->activity:Ljava/lang/ref/WeakReference;
    if-eqz v0, :nlw_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :nlw_done

    invoke-static {}, Lcom/melodix/music/NativeLibWatchdog;->disarm()V

    const-string v1, "lib-load timeout"
    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->paintLibLoadError()V

    :nlw_done
    return-void
.end method
