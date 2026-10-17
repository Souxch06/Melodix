.class public final Lo62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbc2;

.field public final synthetic k:Lvv1;

.field public final synthetic l:Li82;


# direct methods
.method public constructor <init>(Li82;Lbc2;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lo62;->j:Lbc2;

    .line 5
    .line 6
    iput-object p3, p0, Lo62;->k:Lvv1;

    .line 7
    .line 8
    iput-object p1, p0, Lo62;->l:Li82;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    const-string v0, "Failed to get app instance id"

    .line 2
    .line 3
    iget-object v1, p0, Lo62;->k:Lvv1;

    .line 4
    .line 5
    iget-object v2, p0, Lo62;->l:Li82;

    .line 6
    .line 7
    iget-object v3, v2, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Ly02;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    :try_start_0
    iget-object v5, v3, Ly02;->n:Lvz1;

    .line 13
    .line 14
    iget-object v6, v3, Ly02;->o:Lzy1;

    .line 15
    .line 16
    invoke-static {v5}, Ly02;->j(Let;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v5}, Lvz1;->s()Lu22;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    sget-object v8, Lt22;->l:Lt22;

    .line 24
    .line 25
    invoke-virtual {v7, v8}, Lu22;->i(Lt22;)Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    if-nez v7, :cond_0

    .line 30
    .line 31
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, v6, Lzy1;->t:Lso;

    .line 35
    .line 36
    const-string v2, "Analytics storage consent denied; will not get app instance id"

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Lso;->b(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v3, Ly02;->v:Lc52;

    .line 42
    .line 43
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 47
    .line 48
    invoke-virtual {p0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v5}, Ly02;->j(Let;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, v5, Lvz1;->p:Lvx;

    .line 55
    .line 56
    invoke-virtual {p0, v4}, Lvx;->f(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_4

    .line 62
    :catch_0
    move-exception p0

    .line 63
    goto :goto_2

    .line 64
    :cond_0
    iget-object v7, v2, Li82;->m:Lcy1;

    .line 65
    .line 66
    if-nez v7, :cond_1

    .line 67
    .line 68
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, v6, Lzy1;->o:Lso;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object p0, v3, Ly02;->r:Lcb2;

    .line 77
    .line 78
    :goto_1
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v4, v1}, Lcb2;->Y(Ljava/lang/String;Lvv1;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    :try_start_1
    iget-object p0, p0, Lo62;->j:Lbc2;

    .line 86
    .line 87
    invoke-interface {v7, p0}, Lcy1;->B(Lbc2;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    iget-object p0, v3, Ly02;->v:Lc52;

    .line 94
    .line 95
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 99
    .line 100
    invoke-virtual {p0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v5}, Ly02;->j(Let;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, v5, Lvz1;->p:Lvx;

    .line 107
    .line 108
    invoke-virtual {p0, v4}, Lvx;->f(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    invoke-virtual {v2}, Li82;->y()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :goto_2
    :try_start_2
    iget-object v2, v3, Ly02;->o:Lzy1;

    .line 116
    .line 117
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 118
    .line 119
    .line 120
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 121
    .line 122
    invoke-virtual {v2, p0, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 123
    .line 124
    .line 125
    :goto_3
    iget-object p0, v3, Ly02;->r:Lcb2;

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :goto_4
    iget-object v0, v3, Ly02;->r:Lcb2;

    .line 129
    .line 130
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v4, v1}, Lcb2;->Y(Ljava/lang/String;Lvv1;)V

    .line 134
    .line 135
    .line 136
    throw p0
.end method
