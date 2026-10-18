.class public final Lf72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lbc2;

.field public final synthetic n:Li82;


# direct methods
.method public constructor <init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    iput-object p3, p0, Lf72;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lf72;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lf72;->m:Lbc2;

    .line 11
    .line 12
    iput-object p1, p0, Lf72;->n:Li82;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v2, p0, Lf72;->n:Li82;

    .line 6
    .line 7
    iget-object v3, v2, Li82;->m:Lcy1;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ly02;

    .line 14
    .line 15
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 21
    .line 22
    const-string v3, "(legacy) Failed to get conditional properties; not connected to service"

    .line 23
    .line 24
    iget-object v4, p0, Lf72;->k:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v5, p0, Lf72;->l:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v2, v3, v1, v4, v5}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 34
    .line 35
    .line 36
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 37
    .line 38
    .line 39
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_4

    .line 43
    :catchall_1
    move-exception v1

    .line 44
    goto :goto_3

    .line 45
    :catch_0
    move-exception v2

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :try_start_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_1

    .line 52
    .line 53
    iget-object v4, p0, Lf72;->m:Lbc2;

    .line 54
    .line 55
    iget-object v5, p0, Lf72;->k:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v6, p0, Lf72;->l:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v3, v5, v6, v4}, Lcy1;->q(Ljava/lang/String;Ljava/lang/String;Lbc2;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object v4, p0, Lf72;->k:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v5, p0, Lf72;->l:Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {v3, v1, v4, v5}, Lcy1;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    invoke-virtual {v2}, Li82;->y()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 79
    .line 80
    .line 81
    :try_start_3
    iget-object p0, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :goto_1
    :try_start_4
    iget-object v3, p0, Lf72;->n:Li82;

    .line 85
    .line 86
    iget-object v3, v3, Let;->j:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v3, Ly02;

    .line 89
    .line 90
    iget-object v3, v3, Ly02;->o:Lzy1;

    .line 91
    .line 92
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 93
    .line 94
    .line 95
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 96
    .line 97
    const-string v4, "(legacy) Failed to get conditional properties; remote exception"

    .line 98
    .line 99
    iget-object v5, p0, Lf72;->k:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v3, v4, v1, v5, v2}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 105
    .line 106
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 109
    .line 110
    .line 111
    :try_start_5
    iget-object p0, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 112
    .line 113
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 114
    .line 115
    .line 116
    monitor-exit v0

    .line 117
    return-void

    .line 118
    :goto_3
    iget-object p0, p0, Lf72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 121
    .line 122
    .line 123
    throw v1

    .line 124
    :goto_4
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 125
    throw p0
.end method
