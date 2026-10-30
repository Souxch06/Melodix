.class public final Lcom/melodix/music/AndBridgeProbe;
.super Ljava/lang/Object;
.source "AndBridgeProbe.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final mode:I

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/AndBridgeProbe;->webView:Landroid/webkit/WebView;

    iput p2, p0, Lcom/melodix/music/AndBridgeProbe;->mode:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Lcom/melodix/music/AndBridgeProbe;->mode:I

    if-eqz v0, :probe_mode0

    # mode 1: native late fallback. Only navigates when the page is idle on
    # the wrapper route - a running load or an already-open player is left
    # alone.
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/AndBridgeProbe;->webView:Landroid/webkit/WebView;

    if-eqz v0, :late_done

    invoke-virtual {v0}, Landroid/webkit/WebView;->getProgress()I

    move-result v1

    const/16 v2, 0x64

    if-ge v1, v2, :late_done

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :late_done

    const-string v2, "open.spotify.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :late_done

    const-string v2, "/app"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :late_done

    const-string v2, "/search"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :late_done

    const-string v1, "https://open.spotify.com/app"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const-string v1, "native-nav late"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V

    :late_done
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :probe_run_done

    :catch_1
    move-exception v0

    goto :probe_run_done

    :probe_mode0
    iget-object v0, p0, Lcom/melodix/music/AndBridgeProbe;->webView:Landroid/webkit/WebView;

    invoke-static {v0}, Lcom/melodix/music/AndBridge;->runProbe(Landroid/webkit/WebView;)V

    :probe_run_done
    return-void
.end method
