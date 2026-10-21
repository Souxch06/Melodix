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

    const/4 v2, 0x3

    if-ne v1, v2, :apply_diag
    if-eqz v1, :show_native_shell
    const/4 v2, 0x2
    if-ne v1, v2, :apply_data

    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    # A route update only switches the native screen. Calling the library tab
    # handler here navigated back to /collection/playlists on every load, which
    # reloaded the page and looped forever.
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    return-void

    :show_native_shell
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :apply_data
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :apply_diag
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeDiag(Ljava/lang/String;)V
    return-void
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    # A failing native render must not kill the app: keep the WebView usable and
    # leave the trace for the next launch.
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
