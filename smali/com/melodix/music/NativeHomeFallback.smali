.class public final Lcom/melodix/music/NativeHomeFallback;
.super Ljava/lang/Object;

# Native fallback for the Spotify Home route. It runs a CSP-independent page
# probe and only hands real, visible Spotify resource cards to the native shelf.

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static capture(Landroid/webkit/WebView;)V
    .locals 3

    if-eqz p0, :done

    :try_start_0
    const-string v0, "native_home_fallback.js"
    invoke-static {v0}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :asset_missing

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :asset_missing

    new-instance v1, Lcom/melodix/music/NativeHomeFallback$Callback;
    invoke-direct {v1}, Lcom/melodix/music/NativeHomeFallback$Callback;-><init>()V
    const-string v2, "native-home-fallback evaluate=starting"
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v0, "native-home-fallback-queued"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    goto :done

    :asset_missing
    const-string v0, "native-home-fallback-asset-missing"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v2
    const-string v0, "native-home-fallback-queue-error"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/melodix/music/StartupDiagnosticOverlay;->appendDiagnosticLine(Ljava/lang/String;)V

    :done
    return-void
.end method
