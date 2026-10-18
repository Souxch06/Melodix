.class public final Lh72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lbc2;

.field public final synthetic m:Lvv1;

.field public final synthetic n:Li82;


# direct methods
.method public constructor <init>(Li82;Ljava/lang/String;Ljava/lang/String;Lbc2;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lh72;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lh72;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lh72;->l:Lbc2;

    .line 9
    .line 10
    iput-object p5, p0, Lh72;->m:Lvv1;

    .line 11
    .line 12
    iput-object p1, p0, Lh72;->n:Li82;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lh72;->m:Lvv1;

    .line 2
    .line 3
    iget-object v1, p0, Lh72;->k:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lh72;->j:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lh72;->n:Li82;

    .line 8
    .line 9
    iget-object v4, v3, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v4, Ly02;

    .line 12
    .line 13
    new-instance v5, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v6, v3, Li82;->m:Lcy1;

    .line 19
    .line 20
    if-nez v6, :cond_0

    .line 21
    .line 22
    iget-object p0, v4, Ly02;->o:Lzy1;

    .line 23
    .line 24
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 28
    .line 29
    const-string v3, "Failed to get conditional properties; not connected to service"

    .line 30
    .line 31
    invoke-virtual {p0, v3, v2, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p0, v4, Ly02;->r:Lcb2;

    .line 35
    .line 36
    :goto_0
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v5}, Lcb2;->e0(Lvv1;Ljava/util/ArrayList;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    :try_start_1
    iget-object p0, p0, Lh72;->l:Lbc2;

    .line 44
    .line 45
    invoke-interface {v6, v2, v1, p0}, Lcy1;->q(Ljava/lang/String;Ljava/lang/String;Lbc2;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcb2;->f0(Ljava/util/List;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v3}, Li82;->y()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :catch_0
    move-exception p0

    .line 60
    :try_start_2
    iget-object v3, v4, Ly02;->o:Lzy1;

    .line 61
    .line 62
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 63
    .line 64
    .line 65
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 66
    .line 67
    const-string v6, "Failed to get conditional properties; remote exception"

    .line 68
    .line 69
    invoke-virtual {v3, v6, v2, v1, p0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    .line 71
    .line 72
    :goto_1
    iget-object p0, v4, Ly02;->r:Lcb2;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :goto_2
    iget-object v1, v4, Ly02;->r:Lcb2;

    .line 76
    .line 77
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v0, v5}, Lcb2;->e0(Lvv1;Ljava/util/ArrayList;)V

    .line 81
    .line 82
    .line 83
    throw p0
.end method
