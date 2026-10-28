.class public final Lcom/melodix/music/StartupLoadWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "StartupLoadWatchdog.java"

.field private static generation:I

# P0 diagnostic: whether any watchdog has ever been armed (launch telemetry).
.field public static armed:Z

.field private final activity:Ljava/lang/ref/WeakReference;

.field private final generationAtArm:I

.field private final webView:Ljava/lang/ref/WeakReference;

.method private constructor <init>(Lcom/melodix/music/MainActivity;Landroid/webkit/WebView;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->activity:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->webView:Ljava/lang/ref/WeakReference;

    sget v1, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    add-int/lit8 v1, v1, 0x1
    sput v1, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    iput v1, p0, Lcom/melodix/music/StartupLoadWatchdog;->generationAtArm:I

    return-void
.end method

.method public static arm(Landroid/webkit/WebView;)V
    .locals 6

    if-eqz p0, :return

    # P0 fix: resolve the activity from the WebView context first (unwrap
    # ContextWrapper chain) instead of requiring AppSingleton.t to be set.
    # The old dependency silently skipped arming the watchdog when the
    # singleton weakref was null, leaving the splash blocked forever.
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0

    :unwrap_loop
    instance-of v1, v0, Lcom/melodix/music/MainActivity;
    if-eqz v1, :unwrap_next
    check-cast v0, Lcom/melodix/music/MainActivity;
    goto :have_activity

    :unwrap_next
    instance-of v1, v0, Landroid/content/ContextWrapper;
    if-eqz v1, :fallback_singleton
    check-cast v0, Landroid/content/ContextWrapper;
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v0
    if-eqz v0, :fallback_singleton
    goto :unwrap_loop

    :fallback_singleton
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    :have_activity
    new-instance v1, Lcom/melodix/music/StartupLoadWatchdog;
    invoke-direct {v1, v0, p0}, Lcom/melodix/music/StartupLoadWatchdog;-><init>(Lcom/melodix/music/MainActivity;Landroid/webkit/WebView;)V
    const-wide/16 v2, 0x7530

    # P0 fix: schedule on the main-looper Handler, not on the WebView view -
    # a view-attached postDelayed is uncertain when the view is not attached,
    # and the launch trace must show the effective schedule result.
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v5, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v4

    const-string v0, "MDXSTART"
    const/4 v2, 0x1

    sput-boolean v2, Lcom/melodix/music/StartupLoadWatchdog;->armed:Z

    const-string v1, "watchdog-armed (30s after page event)"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v4, :wd_scheduled

    const-string v1, "watchdog SCHEDULE FAILED (handler refused)"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :wd_scheduled
    :return
    return-void
.end method

.method public static armAfterResume(Landroid/webkit/WebView;)V
    .locals 6

    if-eqz p0, :return

    # P0 fix: same context unwrap as arm() - the watchdog must always be
    # armable, otherwise a blocked launch has no recovery path.
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0

    :unwrap_loop
    instance-of v1, v0, Lcom/melodix/music/MainActivity;
    if-eqz v1, :unwrap_next
    check-cast v0, Lcom/melodix/music/MainActivity;
    goto :have_activity

    :unwrap_next
    instance-of v1, v0, Landroid/content/ContextWrapper;
    if-eqz v1, :fallback_singleton
    check-cast v0, Landroid/content/ContextWrapper;
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v0
    if-eqz v0, :fallback_singleton
    goto :unwrap_loop

    :fallback_singleton
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    :have_activity
    new-instance v1, Lcom/melodix/music/StartupLoadWatchdog;
    invoke-direct {v1, v0, p0}, Lcom/melodix/music/StartupLoadWatchdog;-><init>(Lcom/melodix/music/MainActivity;Landroid/webkit/WebView;)V
    const-wide/16 v2, 0x1f40

    # P0 fix: same main-looper Handler as arm() - see the note there.
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v5, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v4

    const-string v0, "MDXSTART"
    const/4 v2, 0x1

    sput-boolean v2, Lcom/melodix/music/StartupLoadWatchdog;->armed:Z

    const-string v1, "watchdog-armed (8s after resume)"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v4, :wd_scheduled2

    const-string v1, "watchdog SCHEDULE FAILED (handler refused)"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :wd_scheduled2
    :return
    return-void
.end method

.method public final run()V
    .locals 5

    sget v0, Lcom/melodix/music/StartupLoadWatchdog;->generation:I
    iget v1, p0, Lcom/melodix/music/StartupLoadWatchdog;->generationAtArm:I
    if-ne v0, v1, :return

    iget-object v0, p0, Lcom/melodix/music/StartupLoadWatchdog;->activity:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :return

    iget-object v1, p0, Lcom/melodix/music/StartupLoadWatchdog;->webView:Ljava/lang/ref/WeakReference;
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/webkit/WebView;
    if-eqz v1, :return

    # P0 instrumentation: the watchdog is actually firing - record the step.
    const-string v2, "MDXSTART"
    const-string v3, "watchdog-fired: splash still visible after watchdog window"
    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    const-string v2, "watchdog-fired"
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const-string v3, "watchdog-fired"

    invoke-static {v0, v3}, Lcom/melodix/music/StartupSplashFallback;->traceState(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V

    iget-object v2, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v2, :return
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :return

    iget-object v2, v0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v2, :check_page_state
    const/16 v3, 0x8
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :check_page_state
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->m:Z
    if-eqz v2, :check_page_progress
    sget v2, Lcom/melodix/music/AppSingleton;->n:I
    if-nez v2, :show_network_error
    goto :return

    :check_page_progress
    invoke-virtual {v1}, Landroid/webkit/WebView;->getProgress()I
    move-result v2
    const/16 v3, 0x64
    if-lt v2, v3, :show_network_error

    :show_loaded_page
    const-string v3, "watchdog->show_loaded_page"

    invoke-static {v0, v3}, Lcom/melodix/music/StartupSplashFallback;->traceState(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V

    const/4 v2, 0x0
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v2, -0x1
    sput v2, Lcom/melodix/music/AppSingleton;->n:I
    # Fallback assumed: the web page is loaded but the native shell never
    # showed. Tag the splash so the fade is allowed (the splash-hold guard in
    # zk0 checks this tag), then reveal the real web page as the fallback
    # home. Traced so the step is visible in MDXSTART logs.
    iget-object v2, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v2, :watchdog_fade
    const-string v4, "web-fallback"
    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V
    :watchdog_fade
    const-string v2, "MDXSTART"
    const-string v4, "splash-fallback watchdog timeout, revealing web page"
    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    new-instance v2, Lzk0;
    const/4 v3, 0x1
    invoke-direct {v2, v0, v3, v3}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :return

    :show_network_error
    const-string v3, "watchdog->show_network_error"

    invoke-static {v0, v3}, Lcom/melodix/music/StartupSplashFallback;->traceState(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V

    const/4 v2, 0x0
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v2, -0x1
    sput v2, Lcom/melodix/music/AppSingleton;->n:I
    const/4 v2, 0x1
    invoke-virtual {v0, v2}, Lcom/melodix/music/MainActivity;->D(Z)V

    :return
    return-void
.end method
