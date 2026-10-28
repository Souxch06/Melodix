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
    .locals 6

    const-wide/16 v0, 0x61a8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :awake

    :catch_0
    move-exception v0

    :awake
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->startupDone:Z

    if-nez v0, :done

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "STARTUP STUCK - startup never completed within 25s\nstage: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;

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

    const-string v0, "startup-hang"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const-string v0, "MDXSTART"

    const-string v1, "startup watchdog: startup never completed, main thread stack recorded"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :done
    return-void
.end method
