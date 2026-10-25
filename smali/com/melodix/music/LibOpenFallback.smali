.class public final Lcom/melodix/music/LibOpenFallback;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Last-resort playlist opening when both the command queue and the
# loadUrl("javascript:...") channel failed to open the detail screen within
# 6 s: navigate the WebView to the validated playlist page instead of leaving
# a dead tap. Every gate is conservative: session epoch unchanged, the detail
# screen never opened, and the expected id is still the row's uri.

.field private final activity:Ljava/lang/ref/WeakReference;
.field private final uri:Ljava/lang/String;
.field private final epoch:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/LibOpenFallback;->activity:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/melodix/music/LibOpenFallback;->uri:Ljava/lang/String;

    iput p3, p0, Lcom/melodix/music/LibOpenFallback;->epoch:I

    return-void
.end method

.method public static arm(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 5

    if-eqz p0, :done
    if-eqz p1, :done

    new-instance v0, Lcom/melodix/music/LibOpenFallback;
    sget v1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    invoke-direct {v0, p0, p1, v1}, Lcom/melodix/music/LibOpenFallback;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;I)V

    new-instance v1, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v2
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-wide/16 v3, 0x1770
    invoke-virtual {v1, v0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :done
    return-void
.end method

.method public run()V
    .locals 3

    :try_start_r
    iget-object v0, p0, Lcom/melodix/music/LibOpenFallback;->activity:Ljava/lang/ref/WeakReference;
    if-eqz v0, :done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :done

    iget v1, p0, Lcom/melodix/music/LibOpenFallback;->epoch:I
    sget v2, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v1, v2, :done

    iget-object v1, v0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v1, :not_detail
    const-string v2, "detail"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done

    :not_detail
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    if-eqz v1, :done
    iget-object v2, p0, Lcom/melodix/music/LibOpenFallback;->uri:Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done

    iget-object v1, p0, Lcom/melodix/music/LibOpenFallback;->uri:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->openPlaylistFallback(Ljava/lang/String;)V

    :done
    :try_end_r
    .catch Ljava/lang/Throwable; {:try_start_r .. :try_end_r} :catch_r

    return-void

    :catch_r
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
