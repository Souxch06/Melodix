.class public final Lcom/melodix/music/StartupLoadWatchdog;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "StartupLoadWatchdog.java"

.field private static generation:I

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
    .locals 4

    if-eqz p0, :return

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    new-instance v1, Lcom/melodix/music/StartupLoadWatchdog;
    invoke-direct {v1, v0, p0}, Lcom/melodix/music/StartupLoadWatchdog;-><init>(Lcom/melodix/music/MainActivity;Landroid/webkit/WebView;)V
    const-wide/16 v2, 0x7530
    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :return
    return-void
.end method

.method public static armAfterResume(Landroid/webkit/WebView;)V
    .locals 4

    if-eqz p0, :return

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/melodix/music/MainActivity;
    if-eqz v0, :return

    new-instance v1, Lcom/melodix/music/StartupLoadWatchdog;
    invoke-direct {v1, v0, p0}, Lcom/melodix/music/StartupLoadWatchdog;-><init>(Lcom/melodix/music/MainActivity;Landroid/webkit/WebView;)V
    const-wide/16 v2, 0x1f40
    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

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

    # Null or about:blank means no usable page is present. The previous
    # if-eqz branch sent the null case PAST the retry; only a non-empty URL
    # should take the fast path. This watchdog is armed from C() even when
    # onPageStarted never fires, so it can recover a missing first request.
    invoke-virtual {v1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :load_retry

    const-string v3, "about:blank"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :webview_has_page

    :load_retry
    const-string v2, "load-retry"
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->ensureWebPageLoaded()V

    :webview_has_page
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
    const/4 v2, 0x0
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v2, -0x1
    sput v2, Lcom/melodix/music/AppSingleton;->n:I
    new-instance v2, Lzk0;
    const/4 v3, 0x1
    invoke-direct {v2, v0, v3, v3}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    goto :return

    :show_network_error
    const/4 v2, 0x0
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->m:Z
    const/4 v2, -0x1
    sput v2, Lcom/melodix/music/AppSingleton;->n:I
    const/4 v2, 0x1
    invoke-virtual {v0, v2}, Lcom/melodix/music/MainActivity;->D(Z)V

    :return
    return-void
.end method
