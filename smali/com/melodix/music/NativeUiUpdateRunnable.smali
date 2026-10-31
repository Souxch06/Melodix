.class final Lcom/melodix/music/NativeUiUpdateRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final screen:Ljava/lang/String;
.field private final data:Ljava/lang/String;
.field private final action:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iput-object p3, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    iput p4, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    return-void
.end method

.method public final run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    if-eqz v1, :show_native_shell
    const/4 v2, 0x2
    if-ne v1, v2, :check_home_fallback

    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    # A route update only switches the native screen. Calling the library tab
    # handler here navigated back to /collection/playlists on every load, which
    # reloaded the page and looped forever.
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    return-void

    :check_home_fallback
    const/4 v2, 0x3
    if-ne v1, v2, :apply_data

    # The recovery callback combines route selection and rendering in this one
    # UI-thread task. This prevents its Home payload from racing a separate route
    # runnable and bypasses only the generic route gate, not the real-card shelf.
    const-string v1, "native-home-fallback ui=render-start"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V

    const-string v1, "home"
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "Accueil"
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "native-home-fallback ui=render-returned"
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void

    :show_native_shell
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :apply_data
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    return-void
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    # A failed UI callback is recoverable: record only its stage and exception
    # class, never a payload/URL-bearing exception message or raw stack trace.
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v2
    const-string v1, "native-render-failed step=ui-update exception="
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    return-void
.end method
