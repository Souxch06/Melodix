.class public final Lcom/melodix/music/StartupHangWatchdog;
.super Ljava/lang/Object;
.source "StartupHangWatchdog.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
# P0 startup watchdog: a blocked startup leaves the launch screen up forever
# and no main-looper callback (splash fallback, watchdog WebView) can rescue
# it because the main thread itself is stuck. This plain thread outlives the
# block: after DELAY_MS it records the main-thread stack and the last stage
# through NativeCrashGuard.write(), and MainActivity shows that report as a
# dialog on the NEXT launch - a phone screenshot then names the blocking
# method. startupDone is set only when the startup is visually resolved
# (native shell takeover or the splash fallback acted), so a live main thread
# with a failed rescue is reported too (stack idles in Looper.loop()).
.field private static started:Z

.field private static final DELAY_MS:J = 0x61a8L


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arm()V
    .locals 2

    sget-boolean v0, Lcom/melodix/music/StartupHangWatchdog;->started:Z

    if-nez v0, :done

    const/4 v0, 0x1

    sput-boolean v0, Lcom/melodix/music/StartupHangWatchdog;->started:Z

    new-instance v0, Lcom/melodix/music/StartupHangWatchdog;

    invoke-direct {v0}, Lcom/melodix/music/StartupHangWatchdog;-><init>()V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v0, "melodix-startup-watchdog"

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :done
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    # 60 s: a cold WebView provider init (chromium dexopt) legitimately blocks
    # the main thread for tens of seconds on slow devices and CI emulators; at
    # 25 s the watchdog was killing healthy startups ("crash at launch").
    const-wide/32 v0, 0xea60

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :awake

    :catch_0
    move-exception v0

    :awake
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->startupDone:Z

    # Startup unresolved -> hang report. Startup shown -> still check that the
    # home content ever arrived: a shell stuck on an empty screen is the same
    # freeze for the user and must produce the same on-screen diagnostic.
    if-nez v0, :content_gate

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "STARTUP STUCK - startup never completed within 60s\nstage: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nstages: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->stageChain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nmain thread stack:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :try_start_1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    if-eqz v1, :no_stack

    const/4 v2, 0x0

    :stack_loop
    array-length v3, v1

    if-ge v2, v3, :no_stack

    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :stack_loop

    :no_stack
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :have_stack

    :catch_1
    move-exception v1

    :have_stack
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V

    move-object v6, v0

    const-string v0, "startup-hang"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const-string v0, "MDXSTART"

    const-string v1, "startup watchdog: startup never completed, main thread stack recorded"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x1

    goto :post_panel

    :content_gate
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->stageChain()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :content_hang

    const-string v1, "home-rendered"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :done

    :content_hang
    const-string v0, "CONTENT STUCK - interface affichee mais contenu jamais arrive"

    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->buildReport(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V

    move-object v6, v0

    const-string v0, "content-hang"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const-string v0, "MDXSTART"

    const-string v1, "content watchdog: shell shown but home content never arrived"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v5, 0x0

    # Visual fail-safe: the report above is kept, and the phone must show it
    # on the frozen screen itself - one screenshot then names the blocker.
    :post_panel
    :try_start_2
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz v0, :unstick_done

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/MainActivity;

    if-eqz v0, :unstick_done

    new-instance v1, Lcom/melodix/music/StartupUnstickRunnable;

    invoke-direct {v1, v0, v6, v5}, Lcom/melodix/music/StartupUnstickRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto :unstick_done

    :catch_2
    :unstick_done

    :done
    return-void
.end method
