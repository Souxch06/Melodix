.class public final Lcom/melodix/music/StartupUnstickRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Reveals the app when the startup watchdog fires and shows the freeze
# diagnostic panel first: the report is saved either way, but the phone must
# be photographable - the panel names the blocking stage and thread. The
# unstick flag is false for the content watchdog (the shell is already
# visible: only the panel is wanted, the UI state must not be reset).
.field private final activity:Lcom/melodix/music/MainActivity;

.field private final report:Ljava/lang/String;

.field private final unstick:Z

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/melodix/music/StartupUnstickRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    iput-object p2, p0, Lcom/melodix/music/StartupUnstickRunnable;->report:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/melodix/music/StartupUnstickRunnable;->unstick:Z

    return-void
.end method

# UI thread only. A visible session surface or visible official login page is
# not evidence that Home is stuck. Never infer authentication from this check.
.method public static sessionSurfaceVisible(Lcom/melodix/music/MainActivity;)Z
    .locals 3
    if-eqz p0, :no
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    const/4 v1, 0x3
    if-eq v0, v1, :no
    :try_session
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    if-eqz v0, :web
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v1
    if-eqz v1, :web
    # A static overlay can outlive an Activity; do not suppress a diagnostic
    # unless it belongs to the current Activity's decor.
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;
    move-result-object v0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-eqz v1, :web
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    if-eq v0, v1, :yes
    :web
    # Limited native Glass is a real measured surface, not authenticated Home.
    # Preserve the stored report, but do not place a stale content verdict over it.
    invoke-static {p0}, Lcom/melodix/music/NativeLimitedGlass;->contentVisible(Lcom/melodix/music/MainActivity;)Z
    move-result v0
    if-nez v0, :yes
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :no
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :no
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->isLoginWebPath()Z
    move-result v0
    if-eqz v0, :no
    :yes
    const/4 v0, 0x1
    return v0
    :try_session_end
    .catch Ljava/lang/Throwable; {:try_session .. :try_session_end} :session_error
    :session_error
    move-exception v2
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    if-eqz v0, :unstick_done

    iget-object v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->report:Ljava/lang/String;

    if-eqz v1, :no_panel

    # Only the content verdict is inapplicable while the user sees session or
    # login UI. Keep the watchdog's stored report; do not navigate or hide a
    # genuine STARTUP STUCK report. Recheck on the UI thread to avoid races.
    iget-boolean v2, p0, Lcom/melodix/music/StartupUnstickRunnable;->unstick:Z
    if-nez v2, :show_report
    const-string v2, "CONTENT STUCK"
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :show_report
    invoke-static {v0}, Lcom/melodix/music/StartupUnstickRunnable;->sessionSurfaceVisible(Lcom/melodix/music/MainActivity;)Z
    move-result v2
    if-nez v2, :unstick_done
    :show_report

    # UI thread: capture the web-side state and enrich the stored report so
    # the photo shows the full picture (page, login, JS trail).
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->report:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->webState(Lcom/melodix/music/MainActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    invoke-static {v0, v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->show(Landroid/app/Activity;Ljava/lang/String;)V

    # Safety net, pure Java: the CONTENT STUCK verdict means the shell JS
    # never delivered anything at 45s (its timers may even be paused). Force
    # the WebView onto the web player entry - no JS involved.
    # Safety net, pure Java. v0 MUST stay the MainActivity here - the code
    # at :no_panel calls showNativeUi() on v0, and a mixed register type at
    # that join rejects the whole class (VerifyError: no panel at all).
    iget-object v2, p0, Lcom/melodix/music/StartupUnstickRunnable;->report:Ljava/lang/String;

    const-string v3, "CONTENT STUCK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :no_panel

    iget-object v2, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    iget-object v2, v2, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    if-eqz v2, :no_panel

    :try_start_0
    # Re-run the real-card Home scrape before the navigation safety probes. This
    # is the 60s recovery path when onPageFinished or the page-owned JS never ran.
    invoke-static {v2}, Lcom/melodix/music/NativeHomeFallback;->capture(Landroid/webkit/WebView;)V

    # The probe decides (consent wall, framed player, player URLs); the late
    # native fallback (mode 1) only fires if nothing moved - no race.
    invoke-static {v2}, Lcom/melodix/music/AndBridge;->runProbe(Landroid/webkit/WebView;)V

    const/4 v3, 0x0

    const/16 v1, 0xfa0

    invoke-static {v2, v3, v1}, Lcom/melodix/music/AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V

    const/4 v3, 0x1

    const/16 v1, 0x2328

    invoke-static {v2, v3, v1}, Lcom/melodix/music/AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :no_panel

    :catch_0
    move-exception v2

    :no_panel
    iget-boolean v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->unstick:Z

    if-eqz v1, :unstick_done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V

    :unstick_done
    return-void
.end method
