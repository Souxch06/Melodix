.class public final Lcom/melodix/music/NativeWebPlayerNavigationRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final webView:Landroid/webkit/WebView;
.field private final url:Ljava/lang/String;

.method public constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeWebPlayerNavigationRunnable;->webView:Landroid/webkit/WebView;
    iput-object p2, p0, Lcom/melodix/music/NativeWebPlayerNavigationRunnable;->url:Ljava/lang/String;
    return-void
.end method

.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/NativeWebPlayerNavigationRunnable;->webView:Landroid/webkit/WebView;
    if-eqz v0, :done
    iget-object v1, p0, Lcom/melodix/music/NativeWebPlayerNavigationRunnable;->url:Ljava/lang/String;
    if-eqz v1, :done

    :try_start_load
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_load
    .catch Ljava/lang/Throwable; {:try_start_load .. :try_end_load} :load_failed

    const-string v2, "player-nav native-load"
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    goto :done

    :load_failed
    move-exception v2
    const-string v0, "player-nav native-load failed"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    :done
    return-void
.end method
