.class public final Lm62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Li82;


# direct methods
.method public constructor <init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Lbc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lm62;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    iput-object p3, p0, Lm62;->k:Lbc2;

    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lm62;->l:Li82;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lm62;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lm62;->l:Li82;

    .line 5
    .line 6
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v2, Ly02;

    .line 9
    .line 10
    iget-object v3, v2, Ly02;->n:Lvz1;

    .line 11
    .line 12
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v3}, Lvz1;->s()Lu22;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-object v4, Lt22;->l:Lt22;

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Lu22;->i(Lt22;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    iget-object v3, v2, Ly02;->o:Lzy1;

    .line 28
    .line 29
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 30
    .line 31
    .line 32
    iget-object v3, v3, Lzy1;->t:Lso;

    .line 33
    .line 34
    const-string v4, "Analytics storage consent denied; will not get app instance id"

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Lso;->b(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v1, Ly02;

    .line 42
    .line 43
    iget-object v1, v1, Ly02;->v:Lc52;

    .line 44
    .line 45
    invoke-static {v1}, Ly02;->k(Lay1;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, v1, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v2, Ly02;->n:Lvz1;

    .line 55
    .line 56
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, v1, Lvz1;->p:Lvx;

    .line 60
    .line 61
    invoke-virtual {v1, v3}, Lvx;->f(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 65
    .line 66
    .line 67
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 68
    .line 69
    .line 70
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    return-void

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto :goto_4

    .line 74
    :catchall_1
    move-exception v1

    .line 75
    goto :goto_3

    .line 76
    :catch_0
    move-exception v1

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    :try_start_2
    iget-object v3, v1, Li82;->m:Lcy1;

    .line 79
    .line 80
    if-nez v3, :cond_1

    .line 81
    .line 82
    iget-object v1, v2, Ly02;->o:Lzy1;

    .line 83
    .line 84
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 88
    .line 89
    const-string v2, "Failed to get app instance id"

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    iget-object v4, p0, Lm62;->k:Lbc2;

    .line 96
    .line 97
    invoke-interface {v3, v4}, Lcy1;->B(Lbc2;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    iget-object v4, v1, Let;->j:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v4, Ly02;

    .line 115
    .line 116
    iget-object v4, v4, Ly02;->v:Lc52;

    .line 117
    .line 118
    invoke-static {v4}, Ly02;->k(Lay1;)V

    .line 119
    .line 120
    .line 121
    iget-object v4, v4, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 122
    .line 123
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object v2, v2, Ly02;->n:Lvz1;

    .line 127
    .line 128
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 129
    .line 130
    .line 131
    iget-object v2, v2, Lvz1;->p:Lvx;

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Lvx;->f(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_2
    invoke-virtual {v1}, Li82;->y()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 137
    .line 138
    .line 139
    :try_start_3
    iget-object p0, p0, Lm62;->j:Ljava/util/concurrent/atomic/AtomicReference;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :goto_1
    :try_start_4
    iget-object v2, p0, Lm62;->l:Li82;

    .line 143
    .line 144
    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v2, Ly02;

    .line 147
    .line 148
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 149
    .line 150
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 154
    .line 155
    const-string v3, "Failed to get app instance id"

    .line 156
    .line 157
    invoke-virtual {v2, v1, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 158
    .line 159
    .line 160
    :try_start_5
    iget-object p0, p0, Lm62;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 161
    .line 162
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 163
    .line 164
    .line 165
    monitor-exit v0

    .line 166
    return-void

    .line 167
    :goto_3
    iget-object p0, p0, Lm62;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 170
    .line 171
    .line 172
    throw v1

    .line 173
    :goto_4
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 174
    throw p0
.end method
