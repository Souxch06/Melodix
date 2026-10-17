.class public final Lac0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# virtual methods
.method public run()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-boolean v0, Lcom/melodix/music/WebService;->s:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 10
    .line 11
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/melodix/music/HomeWidget;->a:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/melodix/music/a;->c(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/melodix/music/HomeWidget;->a:Landroid/os/Handler;

    .line 21
    .line 22
    const-wide/16 v1, 0x7d0

    .line 23
    .line 24
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    sput-boolean p0, Lcom/melodix/music/HomeWidget;->b:Z

    .line 30
    .line 31
    return-void
.end method
