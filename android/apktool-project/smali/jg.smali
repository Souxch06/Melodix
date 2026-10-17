.class public abstract Ljg;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final G:[Lu20;


# instance fields
.field public final A:Ljava/lang/String;

.field public volatile B:Ljava/lang/String;

.field public C:Loo;

.field public D:Z

.field public volatile E:Ld22;

.field public final F:Ljava/util/concurrent/atomic/AtomicInteger;

.field public volatile j:Ljava/lang/String;

.field public k:Lv3;

.field public final l:Landroid/content/Context;

.field public final m:Lmb2;

.field public final n:Lwa0;

.field public final o:Lhu1;

.field public final p:Ljava/lang/Object;

.field public final q:Ljava/lang/Object;

.field public r:Len1;

.field public s:Lig;

.field public t:Landroid/os/IInterface;

.field public final u:Ljava/util/ArrayList;

.field public v:Lvw1;

.field public w:I

.field public final x:Lgg;

.field public final y:Lhg;

.field public final z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lu20;

    .line 3
    .line 4
    sput-object v0, Ljg;->G:[Lu20;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lmb2;Lwa0;ILgg;Lhg;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ljg;->j:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ljg;->p:Ljava/lang/Object;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ljg;->q:Ljava/lang/Object;

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ljg;->u:Ljava/util/ArrayList;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    iput v1, p0, Ljg;->w:I

    .line 30
    .line 31
    iput-object v0, p0, Ljg;->C:Loo;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    iput-boolean v1, p0, Ljg;->D:Z

    .line 35
    .line 36
    iput-object v0, p0, Ljg;->E:Ld22;

    .line 37
    .line 38
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 44
    .line 45
    const-string v0, "Context must not be null"

    .line 46
    .line 47
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ljg;->l:Landroid/content/Context;

    .line 51
    .line 52
    const-string p1, "Looper must not be null"

    .line 53
    .line 54
    invoke-static {p2, p1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string p1, "Supervisor must not be null"

    .line 58
    .line 59
    invoke-static {p3, p1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-object p3, p0, Ljg;->m:Lmb2;

    .line 63
    .line 64
    const-string p1, "API availability must not be null"

    .line 65
    .line 66
    invoke-static {p4, p1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iput-object p4, p0, Ljg;->n:Lwa0;

    .line 70
    .line 71
    new-instance p1, Lhu1;

    .line 72
    .line 73
    invoke-direct {p1, p0, p2}, Lhu1;-><init>(Ljg;Landroid/os/Looper;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Ljg;->o:Lhu1;

    .line 77
    .line 78
    iput p5, p0, Ljg;->z:I

    .line 79
    .line 80
    iput-object p6, p0, Ljg;->x:Lgg;

    .line 81
    .line 82
    iput-object p7, p0, Ljg;->y:Lhg;

    .line 83
    .line 84
    iput-object p8, p0, Ljg;->A:Ljava/lang/String;

    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ljg;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljg;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract c()I
.end method

.method public final d()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ljg;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ljg;->w:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq p0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne p0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v2, 0x0

    .line 15
    :cond_1
    :goto_0
    monitor-exit v0

    .line 16
    return v2

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public final e()[Lu20;
    .locals 0

    .line 1
    iget-object p0, p0, Ljg;->E:Ld22;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Ld22;->k:[Lu20;

    .line 8
    .line 9
    return-object p0
.end method

.method public final f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljg;->isConnected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ljg;->k:Lv3;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 13
    .line 14
    const-string v0, "Failed to connect when checking package"

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public final g(Lig;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ljg;->s:Lig;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ljg;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Lmd1;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lml1;

    .line 4
    .line 5
    iget-object p0, p0, Lml1;->m:Lza0;

    .line 6
    .line 7
    iget-object p0, p0, Lza0;->m:Lum1;

    .line 8
    .line 9
    new-instance v0, Lll1;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lll1;-><init>(Lmd1;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final isConnected()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ljg;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget p0, p0, Ljg;->w:I

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    if-ne p0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    monitor-exit v0

    .line 13
    return p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final k(Lgd0;Ljava/util/Set;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Ljg;->q()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Lna0;

    .line 10
    .line 11
    iget-object v4, v1, Ljg;->B:Ljava/lang/String;

    .line 12
    .line 13
    iget v5, v1, Ljg;->z:I

    .line 14
    .line 15
    sget v6, Lwa0;->a:I

    .line 16
    .line 17
    sget-object v9, Lna0;->x:[Lcom/google/android/gms/common/api/Scope;

    .line 18
    .line 19
    new-instance v10, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    sget-object v12, Lna0;->y:[Lu20;

    .line 25
    .line 26
    const/4 v15, 0x0

    .line 27
    const/16 v16, 0x0

    .line 28
    .line 29
    move-object/from16 v17, v4

    .line 30
    .line 31
    const/4 v4, 0x6

    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v8, 0x0

    .line 34
    const/4 v11, 0x0

    .line 35
    const/4 v14, 0x1

    .line 36
    move-object v13, v12

    .line 37
    invoke-direct/range {v3 .. v17}, Lna0;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lu20;[Lu20;ZIZLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v4, v1, Ljg;->l:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iput-object v4, v3, Lna0;->m:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v2, v3, Lna0;->p:Landroid/os/Bundle;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, [Lcom/google/android/gms/common/api/Scope;

    .line 60
    .line 61
    iput-object v0, v3, Lna0;->o:[Lcom/google/android/gms/common/api/Scope;

    .line 62
    .line 63
    :cond_0
    invoke-virtual {v1}, Ljg;->j()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {v1}, Ljg;->o()Landroid/accounts/Account;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    new-instance v0, Landroid/accounts/Account;

    .line 76
    .line 77
    const-string v2, "<<default account>>"

    .line 78
    .line 79
    const-string v4, "com.google"

    .line 80
    .line 81
    invoke-direct {v0, v2, v4}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iput-object v0, v3, Lna0;->q:Landroid/accounts/Account;

    .line 85
    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    move-object/from16 v0, p1

    .line 89
    .line 90
    check-cast v0, Lfl1;

    .line 91
    .line 92
    iget-object v0, v0, Lfl1;->c:Landroid/os/IBinder;

    .line 93
    .line 94
    iput-object v0, v3, Lna0;->n:Landroid/os/IBinder;

    .line 95
    .line 96
    :cond_2
    sget-object v0, Ljg;->G:[Lu20;

    .line 97
    .line 98
    iput-object v0, v3, Lna0;->r:[Lu20;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljg;->p()[Lu20;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, v3, Lna0;->s:[Lu20;

    .line 105
    .line 106
    :try_start_0
    iget-object v2, v1, Ljg;->q:Ljava/lang/Object;

    .line 107
    .line 108
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :try_start_1
    iget-object v0, v1, Ljg;->r:Len1;

    .line 110
    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    new-instance v4, Lbw1;

    .line 114
    .line 115
    iget-object v5, v1, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 116
    .line 117
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    invoke-direct {v4, v1, v5}, Lbw1;-><init>(Ljg;I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v4, v3}, Len1;->a(Lbw1;Lna0;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :catchall_0
    move-exception v0

    .line 129
    goto :goto_1

    .line 130
    :cond_3
    :goto_0
    monitor-exit v2

    .line 131
    return-void

    .line 132
    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    :try_start_2
    throw v0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 134
    :catch_0
    iget-object v0, v1, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    new-instance v2, Lex1;

    .line 141
    .line 142
    const/16 v3, 0x8

    .line 143
    .line 144
    const/4 v4, 0x0

    .line 145
    invoke-direct {v2, v1, v3, v4, v4}, Lex1;-><init>(Ljg;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    .line 146
    .line 147
    .line 148
    iget-object v1, v1, Ljg;->o:Lhu1;

    .line 149
    .line 150
    const/4 v3, 0x1

    .line 151
    const/4 v4, -0x1

    .line 152
    invoke-virtual {v1, v3, v0, v4, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :catch_1
    move-exception v0

    .line 161
    throw v0

    .line 162
    :catch_2
    iget-object v0, v1, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iget-object v1, v1, Ljg;->o:Lhu1;

    .line 169
    .line 170
    const/4 v2, 0x6

    .line 171
    const/4 v3, 0x3

    .line 172
    invoke-virtual {v1, v2, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ljg;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljg;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Ljg;->n:Lwa0;

    .line 8
    .line 9
    invoke-virtual {v2, v0, v1}, Lwa0;->b(Landroid/content/Context;I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v1, v2}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lpa0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lpa0;-><init>(Ljg;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ljg;->s:Lig;

    .line 26
    .line 27
    iget-object v1, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v3, 0x3

    .line 34
    iget-object p0, p0, Ljg;->o:Lhu1;

    .line 35
    .line 36
    invoke-virtual {p0, v3, v1, v0, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Lpa0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lpa0;-><init>(Ljg;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljg;->g(Lig;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public abstract m(Landroid/os/IBinder;)Landroid/os/IInterface;
.end method

.method public final n()V
    .locals 5

    .line 1
    iget-object v0, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ljg;->u:Ljava/util/ArrayList;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    const/4 v3, 0x0

    .line 15
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Lwm1;

    .line 22
    .line 23
    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :try_start_1
    iput-object v3, v4, Lwm1;->a:Ljava/lang/Boolean;

    .line 25
    .line 26
    monitor-exit v4

    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    :try_start_2
    throw p0

    .line 33
    :catchall_1
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 36
    .line 37
    .line 38
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 39
    iget-object v1, p0, Ljg;->q:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter v1

    .line 42
    :try_start_3
    iput-object v3, p0, Ljg;->r:Len1;

    .line 43
    .line 44
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p0, v0, v3}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catchall_2
    move-exception p0

    .line 51
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 52
    throw p0

    .line 53
    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 54
    throw p0
.end method

.method public o()Landroid/accounts/Account;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p()[Lu20;
    .locals 0

    .line 1
    sget-object p0, Ljg;->G:[Lu20;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/os/Bundle;
    .locals 0

    .line 1
    new-instance p0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public r()Ljava/util/Set;
    .locals 0

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s()Landroid/os/IInterface;
    .locals 3

    .line 1
    iget-object v0, p0, Ljg;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ljg;->w:I

    .line 5
    .line 6
    const/4 v2, 0x5

    .line 7
    if-eq v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljg;->isConnected()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ljg;->t:Landroid/os/IInterface;

    .line 16
    .line 17
    const-string v1, "Client is connected but service is null"

    .line 18
    .line 19
    invoke-static {p0, v1}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 27
    .line 28
    const-string v1, "Not connected. Call connect() and wait for onConnected() to be called."

    .line 29
    .line 30
    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :cond_1
    new-instance p0, Landroid/os/DeadObjectException;

    .line 35
    .line 36
    invoke-direct {p0}, Landroid/os/DeadObjectException;-><init>()V

    .line 37
    .line 38
    .line 39
    throw p0

    .line 40
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method public abstract t()Ljava/lang/String;
.end method

.method public abstract u()Ljava/lang/String;
.end method

.method public v()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljg;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, 0xc9e4920

    .line 6
    .line 7
    .line 8
    if-lt p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final synthetic w(IILandroid/os/IInterface;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ljg;->p:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ljg;->w:I

    .line 5
    .line 6
    if-eq v1, p1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0, p2, p3}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public final x(ILandroid/os/IInterface;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x4

    .line 4
    if-eq p1, v2, :cond_0

    .line 5
    .line 6
    move v3, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v3, v1

    .line 9
    :goto_0
    if-nez p2, :cond_1

    .line 10
    .line 11
    move v4, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_1
    move v4, v1

    .line 14
    :goto_1
    if-ne v3, v4, :cond_2

    .line 15
    .line 16
    move v3, v1

    .line 17
    goto :goto_2

    .line 18
    :cond_2
    move v3, v0

    .line 19
    :goto_2
    invoke-static {v3}, Lbh;->c(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ljg;->p:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter v3

    .line 25
    :try_start_0
    iput p1, p0, Ljg;->w:I

    .line 26
    .line 27
    iput-object p2, p0, Ljg;->t:Landroid/os/IInterface;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-eq p1, v1, :cond_d

    .line 31
    .line 32
    const/4 v5, 0x2

    .line 33
    if-eq p1, v5, :cond_4

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    if-eq p1, v5, :cond_4

    .line 37
    .line 38
    if-eq p1, v2, :cond_3

    .line 39
    .line 40
    goto/16 :goto_4

    .line 41
    .line 42
    :cond_3
    invoke-static {p2}, Lbh;->h(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto/16 :goto_5

    .line 52
    .line 53
    :cond_4
    const-string p1, "Internal Error, the minimum apk version of this BaseGmsClient is too low to support dynamic lookup. Start service action: "

    .line 54
    .line 55
    iget-object p2, p0, Ljg;->v:Lvw1;

    .line 56
    .line 57
    if-eqz p2, :cond_6

    .line 58
    .line 59
    iget-object v2, p0, Ljg;->k:Lv3;

    .line 60
    .line 61
    if-eqz v2, :cond_6

    .line 62
    .line 63
    iget-object v2, v2, Lv3;->b:Ljava/lang/String;

    .line 64
    .line 65
    const-string v5, "com.google.android.gms"

    .line 66
    .line 67
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    add-int/lit8 v2, v2, 0x46

    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    add-int/2addr v2, v5

    .line 82
    new-instance v5, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Ljg;->m:Lmb2;

    .line 88
    .line 89
    iget-object v5, p0, Ljg;->k:Lv3;

    .line 90
    .line 91
    iget-object v5, v5, Lv3;->b:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v5}, Lbh;->h(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    iget-object v6, p0, Ljg;->k:Lv3;

    .line 97
    .line 98
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    iget-object v6, p0, Ljg;->A:Ljava/lang/String;

    .line 102
    .line 103
    if-nez v6, :cond_5

    .line 104
    .line 105
    iget-object v6, p0, Ljg;->l:Landroid/content/Context;

    .line 106
    .line 107
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    :cond_5
    iget-object v6, p0, Ljg;->k:Lv3;

    .line 111
    .line 112
    iget-boolean v6, v6, Lv3;->c:Z

    .line 113
    .line 114
    invoke-virtual {v2, v5, p2, v6}, Lmb2;->c(Ljava/lang/String;Landroid/content/ServiceConnection;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 118
    .line 119
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 120
    .line 121
    .line 122
    :cond_6
    new-instance p2, Lvw1;

    .line 123
    .line 124
    iget-object v2, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-direct {p2, p0, v2}, Lvw1;-><init>(Ljg;I)V

    .line 131
    .line 132
    .line 133
    iput-object p2, p0, Ljg;->v:Lvw1;

    .line 134
    .line 135
    new-instance v2, Lv3;

    .line 136
    .line 137
    invoke-virtual {p0}, Ljg;->u()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    invoke-virtual {p0}, Ljg;->v()Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    invoke-direct {v2, v1, v5, v6}, Lv3;-><init>(ILjava/lang/String;Z)V

    .line 146
    .line 147
    .line 148
    iput-object v2, p0, Ljg;->k:Lv3;

    .line 149
    .line 150
    if-eqz v6, :cond_8

    .line 151
    .line 152
    invoke-virtual {p0}, Ljg;->c()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const v5, 0x1110e58

    .line 157
    .line 158
    .line 159
    if-lt v2, v5, :cond_7

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 163
    .line 164
    iget-object p0, p0, Ljg;->k:Lv3;

    .line 165
    .line 166
    iget-object p0, p0, Lv3;->b:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-direct {p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    throw p2

    .line 180
    :cond_8
    :goto_3
    iget-object p1, p0, Ljg;->m:Lmb2;

    .line 181
    .line 182
    iget-object v2, p0, Ljg;->k:Lv3;

    .line 183
    .line 184
    iget-object v2, v2, Lv3;->b:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    iget-object v5, p0, Ljg;->k:Lv3;

    .line 190
    .line 191
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    iget-object v5, p0, Ljg;->A:Ljava/lang/String;

    .line 195
    .line 196
    if-nez v5, :cond_9

    .line 197
    .line 198
    iget-object v5, p0, Ljg;->l:Landroid/content/Context;

    .line 199
    .line 200
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    :cond_9
    iget-object v6, p0, Ljg;->k:Lv3;

    .line 209
    .line 210
    iget-boolean v6, v6, Lv3;->c:Z

    .line 211
    .line 212
    new-instance v7, Lm72;

    .line 213
    .line 214
    invoke-direct {v7, v2, v6}, Lm72;-><init>(Ljava/lang/String;Z)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1, v7, p2, v5, v4}, Lmb2;->b(Lm72;Lvw1;Ljava/lang/String;Ljava/util/concurrent/Executor;)Loo;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iget p2, p1, Loo;->k:I

    .line 222
    .line 223
    if-nez p2, :cond_a

    .line 224
    .line 225
    move v0, v1

    .line 226
    :cond_a
    if-nez v0, :cond_f

    .line 227
    .line 228
    iget-object p2, p0, Ljg;->k:Lv3;

    .line 229
    .line 230
    iget-object p2, p2, Lv3;->b:Ljava/lang/String;

    .line 231
    .line 232
    const-string v0, "com.google.android.gms"

    .line 233
    .line 234
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    add-int/lit8 p2, p2, 0x22

    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    add-int/2addr p2, v0

    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 252
    .line 253
    .line 254
    iget p2, p1, Loo;->k:I

    .line 255
    .line 256
    const/4 v0, -0x1

    .line 257
    if-ne p2, v0, :cond_b

    .line 258
    .line 259
    const/16 p2, 0x10

    .line 260
    .line 261
    :cond_b
    iget-object v1, p1, Loo;->l:Landroid/app/PendingIntent;

    .line 262
    .line 263
    if-eqz v1, :cond_c

    .line 264
    .line 265
    new-instance v4, Landroid/os/Bundle;

    .line 266
    .line 267
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 268
    .line 269
    .line 270
    const-string v1, "pendingIntent"

    .line 271
    .line 272
    iget-object p1, p1, Loo;->l:Landroid/app/PendingIntent;

    .line 273
    .line 274
    invoke-virtual {v4, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 275
    .line 276
    .line 277
    :cond_c
    iget-object p1, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    new-instance v1, Lzx1;

    .line 284
    .line 285
    invoke-direct {v1, p0, p2, v4}, Lzx1;-><init>(Ljg;ILandroid/os/Bundle;)V

    .line 286
    .line 287
    .line 288
    iget-object p0, p0, Ljg;->o:Lhu1;

    .line 289
    .line 290
    const/4 p2, 0x7

    .line 291
    invoke-virtual {p0, p2, p1, v0, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 296
    .line 297
    .line 298
    goto :goto_4

    .line 299
    :cond_d
    iget-object p1, p0, Ljg;->v:Lvw1;

    .line 300
    .line 301
    if-eqz p1, :cond_f

    .line 302
    .line 303
    iget-object p2, p0, Ljg;->m:Lmb2;

    .line 304
    .line 305
    iget-object v0, p0, Ljg;->k:Lv3;

    .line 306
    .line 307
    iget-object v0, v0, Lv3;->b:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    iget-object v1, p0, Ljg;->k:Lv3;

    .line 313
    .line 314
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 315
    .line 316
    .line 317
    iget-object v1, p0, Ljg;->A:Ljava/lang/String;

    .line 318
    .line 319
    if-nez v1, :cond_e

    .line 320
    .line 321
    iget-object v1, p0, Ljg;->l:Landroid/content/Context;

    .line 322
    .line 323
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    .line 325
    .line 326
    :cond_e
    iget-object v1, p0, Ljg;->k:Lv3;

    .line 327
    .line 328
    iget-boolean v1, v1, Lv3;->c:Z

    .line 329
    .line 330
    invoke-virtual {p2, v0, p1, v1}, Lmb2;->c(Ljava/lang/String;Landroid/content/ServiceConnection;Z)V

    .line 331
    .line 332
    .line 333
    iput-object v4, p0, Ljg;->v:Lvw1;

    .line 334
    .line 335
    :cond_f
    :goto_4
    monitor-exit v3

    .line 336
    return-void

    .line 337
    :goto_5
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    throw p0
.end method
