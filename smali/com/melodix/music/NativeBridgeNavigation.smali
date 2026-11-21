.class public final Lcom/melodix/music/NativeBridgeNavigation;
.super Ljava/lang/Object;

# WebView applies add/removeJavascriptInterface on the NEXT document load.
# Invoke before an allowed top-level load/redirect, not for subframes. Only
# categories reach diagnostics; URLs, page data and session data are not kept.
.method public static prepare(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    if-eqz p0, :done
    :try_start
    invoke-static {p1}, Lcom/melodix/music/NativeSessionTrace;->playerOrigin(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :detach
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    new-instance v1, Lcom/melodix/music/AndBridge;
    invoke-direct {v1, v0}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V
    const-string v2, "AndBridge"
    invoke-virtual {p0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V
    const-string v0, "bridge-prepared-player"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    goto :done
    :detach
    const-string v0, "AndBridge"
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V
    const-string v0, "bridge-prepared-other"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    const-string v0, "bridge-prepare-failed"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    return-void
.end method
