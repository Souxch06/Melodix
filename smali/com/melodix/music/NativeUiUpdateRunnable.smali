.class final Lcom/melodix/music/NativeUiUpdateRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final screen:Ljava/lang/String;
.field private final data:Ljava/lang/String;
.field private final action:I
.field private final sessionGeneration:I
.field private final sessionAtReceipt:I
.field private final privateUiEpoch:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iput-object p3, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    iput p4, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    # A private payload may not cross an intervening verification/logout.
    sget v1, Lcom/melodix/music/NativeSessionGate;->privateUiEpoch:I
    sget v0, Lcom/melodix/music/NativeSessionGate;->state:I
    iput v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->sessionAtReceipt:I
    iput v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->privateUiEpoch:I
    sget v0, Lcom/melodix/music/NativeSessionGate;->privateUiEpoch:I
    if-eq v0, v1, :stable_receipt
    const/4 v0, 0x0
    iput v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->sessionAtReceipt:I
    :stable_receipt
    sget v0, Lcom/melodix/music/NativeSessionGate;->generation:I
    iput v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->sessionGeneration:I
    return-void
.end method

.method public final run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    # Only payload-bearing actions (data=1, fallback=3) are constrained here;
    # route/visibility notifications still go through their own existing gates.
    const/4 v2, 0x1
    if-ne v1, v2, :check_private_fallback_epoch
    goto :check_private_epoch
    :check_private_fallback_epoch
    const/4 v2, 0x3
    if-ne v1, v2, :epoch_checked
    :check_private_epoch
    iget v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->sessionAtReceipt:I
    const/4 v1, 0x3
    if-ne v2, v1, :discard_private_payload
    sget v2, Lcom/melodix/music/NativeSessionGate;->state:I
    if-ne v2, v1, :discard_private_payload
    iget v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->sessionGeneration:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->generation:I
    if-ne v2, v1, :discard_private_payload
    iget v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->privateUiEpoch:I
    sget v1, Lcom/melodix/music/NativeSessionGate;->privateUiEpoch:I
    if-ne v2, v1, :discard_private_payload
    iget v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    goto :epoch_checked
    :discard_private_payload
    return-void
    :epoch_checked
    const/4 v2, 0x4
    if-ne v1, v2, :check_action_zero
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    move-result v1
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    move-result v2
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->setMelodixHomeVisibility(ZZ)V
    return-void

    :check_action_zero
    if-eqz v1, :show_native_shell
    const/4 v2, 0x2
    if-ne v1, v2, :check_home_fallback

    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    # A verified SPA route must also transfer visibility back to the native
    # shell. The Web Home renderer may have hidden nativeRoot; only routes
    # dispatched after the libraryV3 proof gate reach this action. Keep this
    # separate from the Library button handler to avoid navigation loops.
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->activateNativeUiRoute(Ljava/lang/String;)V
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
