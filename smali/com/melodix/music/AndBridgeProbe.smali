.class public final Lcom/melodix/music/AndBridgeProbe;
.super Ljava/lang/Object;
.source "AndBridgeProbe.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static navCount:I


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
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/AndBridgeProbe;->webView:Landroid/webkit/WebView;

    if-nez v0, :all_done

    iget v1, p0, Lcom/melodix/music/AndBridgeProbe;->mode:I

    if-nez v1, :mode_fallback

    # mode 0: run the probe again
    invoke-static {v0}, Lcom/melodix/music/AndBridge;->runProbe(Landroid/webkit/WebView;)V

    goto :all_done

    :mode_fallback
    # mode 1: late native fallback. Bounded to 2 attempts per app launch.
    sget v1, Lcom/melodix/music/AndBridgeProbe;->navCount:I

    const/4 v2, 0x2

    if-ge v1, v2, :all_done

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/melodix/music/AndBridgeProbe;->navCount:I

    # Never interrupt a running load (progress under 100) and never touch an
    # already-open player route.
    invoke-virtual {v0}, Landroid/webkit/WebView;->getProgress()I

    move-result v1

    const/16 v2, 0x64

    if-ge v1, v2, :check_url

    goto :all_done

    :check_url
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :all_done

    const-string v2, "open.spotify.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :all_done

    const-string v2, "/app"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :all_done

    const-string v2, "/search"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :all_done

    const-string v1, "https://open.spotify.com/app"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const-string v1, "native-nav late"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :all_done
    return-void

    :catch_0
    move-exception v0

    return-void
.end method
