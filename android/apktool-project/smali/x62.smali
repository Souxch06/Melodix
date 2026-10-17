.class public final Lx62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ltu1;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lvv1;

.field public final synthetic m:Li82;


# direct methods
.method public constructor <init>(Li82;Ltu1;Ljava/lang/String;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lx62;->j:Ltu1;

    .line 5
    .line 6
    iput-object p3, p0, Lx62;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lx62;->l:Lvv1;

    .line 9
    .line 10
    iput-object p1, p0, Lx62;->m:Li82;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lx62;->l:Lvv1;

    .line 2
    .line 3
    iget-object v1, p0, Lx62;->m:Li82;

    .line 4
    .line 5
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ly02;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    iget-object v4, v1, Li82;->m:Lcy1;

    .line 11
    .line 12
    if-nez v4, :cond_0

    .line 13
    .line 14
    iget-object p0, v2, Ly02;->o:Lzy1;

    .line 15
    .line 16
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 20
    .line 21
    const-string v1, "Discarding data. Failed to send event to service to bundle"

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lso;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    iget-object p0, v2, Ly02;->r:Lcb2;

    .line 27
    .line 28
    :goto_0
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0, v3}, Lcb2;->b0(Lvv1;[B)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    :try_start_1
    iget-object v5, p0, Lx62;->j:Ltu1;

    .line 36
    .line 37
    iget-object p0, p0, Lx62;->k:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {v4, p0, v5}, Lcy1;->j(Ljava/lang/String;Ltu1;)[B

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v1}, Li82;->y()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_2

    .line 49
    :catch_0
    move-exception p0

    .line 50
    :try_start_2
    iget-object v1, v2, Ly02;->o:Lzy1;

    .line 51
    .line 52
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 56
    .line 57
    const-string v4, "Failed to send event to the service to bundle"

    .line 58
    .line 59
    invoke-virtual {v1, p0, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    .line 62
    :goto_1
    iget-object p0, v2, Ly02;->r:Lcb2;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :goto_2
    iget-object v1, v2, Ly02;->r:Lcb2;

    .line 66
    .line 67
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v0, v3}, Lcb2;->b0(Lvv1;[B)V

    .line 71
    .line 72
    .line 73
    throw p0
.end method
