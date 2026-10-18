.class public final Lq01;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public j:Ln60;

.field public k:Lo60;

.field public l:Landroid/os/Handler;


# virtual methods
.method public run()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lq01;->j:Ln60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ln60;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Lq01;->k:Lo60;

    .line 10
    .line 11
    iget-object p0, p0, Lq01;->l:Landroid/os/Handler;

    .line 12
    .line 13
    new-instance v2, Lp01;

    .line 14
    .line 15
    invoke-direct {v2, v1, v0}, Lp01;-><init>(Lo60;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method
