.class public final Lk62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Li82;


# direct methods
.method public constructor <init>(Li82;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lk62;->j:Lbc2;

    .line 5
    .line 6
    iput-object p1, p0, Lk62;->k:Li82;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lk62;->k:Li82;

    .line 2
    .line 3
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ly02;

    .line 6
    .line 7
    iget-object v2, v0, Li82;->m:Lcy1;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iget-object p0, v1, Ly02;->o:Lzy1;

    .line 12
    .line 13
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 17
    .line 18
    const-string v0, "Failed to reset data on the service: not connected to service"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    :try_start_0
    iget-object p0, p0, Lk62;->j:Lbc2;

    .line 25
    .line 26
    invoke-interface {v2, p0}, Lcy1;->u(Lbc2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 32
    .line 33
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 37
    .line 38
    const-string v2, "Failed to reset data on the service: remote exception"

    .line 39
    .line 40
    invoke-virtual {v1, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0}, Li82;->y()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
