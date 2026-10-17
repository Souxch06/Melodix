.class public final Lp62;
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
    iput-object p2, p0, Lp62;->j:Lbc2;

    .line 5
    .line 6
    iput-object p1, p0, Lp62;->k:Li82;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lp62;->k:Li82;

    .line 2
    .line 3
    iget-object v1, v0, Li82;->m:Lcy1;

    .line 4
    .line 5
    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ly02;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, v2, Ly02;->o:Lzy1;

    .line 12
    .line 13
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 17
    .line 18
    const-string v0, "Discarding data. Failed to send app launch"

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
    iget-object p0, p0, Lp62;->j:Lbc2;

    .line 25
    .line 26
    iget-object v3, v2, Ly02;->m:Lmt1;

    .line 27
    .line 28
    sget-object v4, Lxx1;->W0:Lwx1;

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-virtual {v3, v5, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, v1, v5, p0}, Li82;->D(Lcy1;Ls0;Lbc2;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    invoke-interface {v1, p0}, Lcy1;->k(Lbc2;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ly02;->m()Lpy1;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Lpy1;->q()V

    .line 51
    .line 52
    .line 53
    iget-object v3, v2, Ly02;->m:Lmt1;

    .line 54
    .line 55
    invoke-virtual {v3, v5, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1, v5, p0}, Li82;->D(Lcy1;Ls0;Lbc2;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Li82;->y()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :goto_1
    iget-object v0, v2, Ly02;->o:Lzy1;

    .line 66
    .line 67
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 71
    .line 72
    const-string v1, "Failed to send app launch to the service"

    .line 73
    .line 74
    invoke-virtual {v0, p0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
