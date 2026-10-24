.class public final Lcom/melodix/music/RuntimeDiagnostic$Callback;
.super Ljava/lang/Object;
.implements Landroid/webkit/ValueCallback;


.field private final activityRef:Ljava/lang/ref/WeakReference;
.field private final webViewRef:Ljava/lang/ref/WeakReference;


.method public constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->activityRef:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->webViewRef:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 7

    iget-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->activityRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
    if-eqz v0, :return
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :return
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
    move-result v1
    if-nez v1, :return

    check-cast p1, Ljava/lang/String;
    if-eqz p1, :return

    # The initial evaluation returns true only when it starts the timed collection.
    const-string v1, "true"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :show_result

    iget-object v2, p0, Lcom/melodix/music/RuntimeDiagnostic$Callback;->webViewRef:Ljava/lang/ref/WeakReference;
    if-eqz v2, :return
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/webkit/WebView;
    if-eqz v2, :return

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v3
    new-instance v4, Landroid/os/Handler;
    invoke-direct {v4, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v3, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;
    invoke-direct {v3, v0, v2}, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V
    const-wide/16 v5, 0x5014
    invoke-virtual {v4, v3, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void

    :show_result
    const-string v1, "null"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :show_result_value
    return-void

    :show_result_value
    const-string v1, "false"
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :show_dialog
    return-void

    :show_dialog
    invoke-static {v0, p1}, Lcom/melodix/music/RuntimeDiagnostic;->showResult(Landroid/app/Activity;Ljava/lang/String;)V

    :return
    return-void
.end method
