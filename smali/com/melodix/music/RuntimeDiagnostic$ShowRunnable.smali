.class public final Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;


.field private final activity:Landroid/app/Activity;
.field private final json:Ljava/lang/String;


.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;->json:Ljava/lang/String;
    return-void
.end method

.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;->activity:Landroid/app/Activity;
    if-eqz v0, :return
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :return
    iget-object v1, p0, Lcom/melodix/music/RuntimeDiagnostic$ShowRunnable;->json:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/melodix/music/RuntimeDiagnostic;->showDialog(Landroid/app/Activity;Ljava/lang/String;)V

    :return
    return-void
.end method
