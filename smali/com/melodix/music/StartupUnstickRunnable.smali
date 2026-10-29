.class public final Lcom/melodix/music/StartupUnstickRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Reveals the app when the startup watchdog fires: the report is already saved
# for the diagnostic viewer; the UI must not stay frozen on the splash logo.
.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    return-void
.end method

.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/StartupUnstickRunnable;->activity:Lcom/melodix/music/MainActivity;

    if-eqz v0, :unstick_done

    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V

    :unstick_done
    return-void
.end method
