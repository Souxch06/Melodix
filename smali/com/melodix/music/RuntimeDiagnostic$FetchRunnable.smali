.class public final Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;


.field private final activityRef:Ljava/lang/ref/WeakReference;
.field private final webViewRef:Ljava/lang/ref/WeakReference;


.method public constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;->activityRef:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;->webViewRef:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;->activityRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :return
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
    if-eqz v0, :return
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v2
    if-nez v2, :return

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    const-string v3, "com.melodix.music.preview"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :return

    iget-object v1, p0, Lcom/melodix/music/RuntimeDiagnostic$FetchRunnable;->webViewRef:Ljava/lang/ref/WeakReference;
    if-eqz v1, :return
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/webkit/WebView;
    if-eqz v1, :return

    const-string v2, "(function(){if(!window.location||window.location.protocol!=='https:'||window.location.hostname!=='open.spotify.com'||(window.location.port&&window.location.port!=='443'))return null;var s=window.__melodixRuntimeDiagnosticV2;if(!s||s.complete!==true||!Array.isArray(s.samples)||s.samples.length!==4)return null;return s.samples;})()"
    new-instance v3, Lcom/melodix/music/RuntimeDiagnostic$Callback;
    invoke-direct {v3, v0, v1}, Lcom/melodix/music/RuntimeDiagnostic$Callback;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V
    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :return
    return-void
.end method
