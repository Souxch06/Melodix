.class public final Lj72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lbc2;

.field public final synthetic n:Z

.field public final synthetic o:Li82;


# direct methods
.method public constructor <init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Lbc2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    iput-object p3, p0, Lj72;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lj72;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lj72;->m:Lbc2;

    .line 11
    .line 12
    iput-boolean p6, p0, Lj72;->n:Z

    .line 13
    .line 14
    iput-object p1, p0, Lj72;->o:Li82;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v2, p0, Lj72;->o:Li82;

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
    const-string v3, "(legacy) Failed to get user properties; not connected to service"

    .line 23
    .line 24
    iget-object v4, p0, Lj72;->k:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v5, p0, Lj72;->l:Ljava/lang/String;

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
    iget-object v4, p0, Lj72;->m:Lbc2;

    .line 54
    .line 55
    iget-object v5, p0, Lj72;->k:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v6, p0, Lj72;->l:Ljava/lang/String;

    .line 58
    .line 59
    iget-boolean v7, p0, Lj72;->n:Z

    .line 60
    .line 61
    invoke-interface {v3, v5, v6, v7, v4}, Lcy1;->C(Ljava/lang/String;Ljava/lang/String;ZLbc2;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v4, p0, Lj72;->k:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v5, p0, Lj72;->l:Ljava/lang/String;

    .line 72
    .line 73
    iget-boolean v6, p0, Lj72;->n:Z

    .line 74
    .line 75
    invoke-interface {v3, v1, v4, v5, v6}, Lcy1;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    invoke-virtual {v2}, Li82;->y()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 83
    .line 84
    .line 85
    :try_start_3
    iget-object p0, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :goto_1
    :try_start_4
    iget-object v3, p0, Lj72;->o:Li82;

    .line 89
    .line 90
    iget-object v3, v3, Let;->j:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v3, Ly02;

    .line 93
    .line 94
    iget-object v3, v3, Ly02;->o:Lzy1;

    .line 95
    .line 96
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 97
    .line 98
    .line 99
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 100
    .line 101
    const-string v4, "(legacy) Failed to get user properties; remote exception"

    .line 102
    .line 103
    iget-object v5, p0, Lj72;->k:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v3, v4, v1, v5, v2}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 109
    .line 110
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 113
    .line 114
    .line 115
    :try_start_5
    iget-object p0, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 116
    .line 117
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 118
    .line 119
    .line 120
    monitor-exit v0

    .line 121
    return-void

    .line 122
    :goto_3
    iget-object p0, p0, Lj72;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 125
    .line 126
    .line 127
    throw v1

    .line 128
    :goto_4
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 129
    throw p0
.end method
