.class public final synthetic Lyi1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/WebService;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/WebService;I)V
    .locals 0

    .line 1
    iput p2, p0, Lyi1;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lyi1;->k:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Lyi1;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lyi1;->k:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 9
    .line 10
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 15
    .line 16
    invoke-static {p0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->resumeTimers()V

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->dispatchWindowVisibilityChanged(I)V

    # Service-path recovery: rebind the activity's WebView reference so every
    # evaluateJavascript (probes, engine, media requests) targets the rebuilt
    # WebView instead of a stale instance.
    sget-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v1, :cond_0
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;
    if-eqz v1, :cond_0
    iput-object v0, v1, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    :cond_0
    return-void

    .line 20
    :pswitch_0
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 21
    .line 22
    sget-object v0, Lcom/melodix/music/HomeWidget;->a:Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
    if-nez v0, :use_app_ctx
    move-object v0, p0
    :use_app_ctx

    .line 23
    .line 24
    invoke-static {v0}, Lcom/melodix/music/a;->c(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const-string v0, "about:blank"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/webkit/WebView;->destroy()V

    .line 40
    .line 41
    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    sput-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 47
    .line 48
    sget v1, Lcom/melodix/music/AppSingleton;->j:I

    .line 49
    .line 50
    sget-object v1, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    sget-object v2, Lcom/melodix/music/AppSingleton;->o:Landroid/os/Handler;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    sget-object v1, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    sget-object v2, Lcom/melodix/music/AppSingleton;->p:Landroid/os/Handler;

    .line 64
    .line 65
    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    sput-object p0, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 69
    .line 70
    sput-object p0, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 71
    .line 72
    sput v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 73
    .line 74
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v1, "AutoSleep"

    .line 79
    .line 80
    const-string v2, "0"

    .line 81
    .line 82
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 87
    .line 88
    .line 89
    sput v0, Lcom/melodix/music/AppSingleton;->k:I

    .line 90
    .line 91
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 92
    .line 93
    return-void

    .line 94
    nop

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
