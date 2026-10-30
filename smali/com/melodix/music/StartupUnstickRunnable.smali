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

.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    if-eqz v0, :unstick_done

    iget-object v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->report:Ljava/lang/String;

    if-eqz v1, :no_panel

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

    :no_panel
    iget-boolean v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->unstick:Z

    if-eqz v1, :unstick_done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V

    :unstick_done
    return-void
.end method
