.class public final Lcom/melodix/music/RuntimeDiagnostic$Callback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;


.field private final activityRef:Ljava/lang/ref/WeakReference;


.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->activityRef:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->activityRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
    if-eqz v0, :return

    check-cast p1, Ljava/lang/String;
    if-eqz p1, :null_result
    invoke-static {v0, p1}, Lcom/melodix/music/RuntimeDiagnostic;->showResult(Landroid/app/Activity;Ljava/lang/String;)V
    return-void

    :null_result
    const-string p1, "null"
    invoke-static {v0, p1}, Lcom/melodix/music/RuntimeDiagnostic;->showResult(Landroid/app/Activity;Ljava/lang/String;)V

    :return
    return-void
.end method
