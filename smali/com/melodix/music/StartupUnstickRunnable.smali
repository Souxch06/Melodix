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

    invoke-static {v0, v1}, Lcom/melodix/music/StartupDiagnosticOverlay;->show(Landroid/app/Activity;Ljava/lang/String;)V

    :no_panel
    iget-boolean v1, p0, Lcom/melodix/music/StartupUnstickRunnable;->unstick:Z

    if-eqz v1, :unstick_done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V

    :unstick_done
    return-void
.end method
