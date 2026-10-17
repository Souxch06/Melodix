.class public final Lr90;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Lqj0;

.field public final k:Lxn0;


# direct methods
.method public constructor <init>(Lqj0;Lxn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lr90;->j:Lqj0;

    .line 5
    .line 6
    iput-object p2, p0, Lr90;->k:Lxn0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lr90;->j:Lqj0;

    .line 2
    .line 3
    instance-of v1, v0, Lc0;

    .line 4
    .line 5
    iget-object p0, p0, Lr90;->k:Lxn0;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move-object v1, v0

    .line 10
    check-cast v1, Lc0;

    .line 11
    .line 12
    invoke-virtual {v1}, Lc0;->o()Ljava/lang/Throwable;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lxn0;->t(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    invoke-static {v0}, Lk42;->g(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lc52;

    .line 28
    .line 29
    invoke-virtual {v0}, Lgx1;->l()V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v1, Ly02;

    .line 35
    .line 36
    iget-object v2, v1, Ly02;->n:Lvz1;

    .line 37
    .line 38
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Lvz1;->r()Landroid/util/SparseArray;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p0, Lo92;

    .line 48
    .line 49
    iget v3, p0, Lo92;->l:I

    .line 50
    .line 51
    iget-wide v4, p0, Lo92;->k:J

    .line 52
    .line 53
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, v1, Ly02;->n:Lvz1;

    .line 61
    .line 62
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    new-array v4, v4, [I

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    new-array v5, v5, [J

    .line 76
    .line 77
    const/4 v6, 0x0

    .line 78
    move v7, v6

    .line 79
    :goto_0
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    if-ge v7, v8, :cond_1

    .line 84
    .line 85
    invoke-virtual {v2, v7}, Landroid/util/SparseArray;->keyAt(I)I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    aput v8, v4, v7

    .line 90
    .line 91
    invoke-virtual {v2, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    check-cast v8, Ljava/lang/Long;

    .line 96
    .line 97
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 98
    .line 99
    .line 100
    move-result-wide v8

    .line 101
    aput-wide v8, v5, v7

    .line 102
    .line 103
    add-int/lit8 v7, v7, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    new-instance v2, Landroid/os/Bundle;

    .line 107
    .line 108
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v7, "uriSources"

    .line 112
    .line 113
    invoke-virtual {v2, v7, v4}, Landroid/os/BaseBundle;->putIntArray(Ljava/lang/String;[I)V

    .line 114
    .line 115
    .line 116
    const-string v4, "uriTimestamps"

    .line 117
    .line 118
    invoke-virtual {v2, v4, v5}, Landroid/os/BaseBundle;->putLongArray(Ljava/lang/String;[J)V

    .line 119
    .line 120
    .line 121
    iget-object v3, v3, Lvz1;->w:Ler0;

    .line 122
    .line 123
    invoke-virtual {v3, v2}, Ler0;->x(Landroid/os/Bundle;)V

    .line 124
    .line 125
    .line 126
    iput-boolean v6, v0, Lc52;->r:Z

    .line 127
    .line 128
    const/4 v2, 0x1

    .line 129
    iput v2, v0, Lc52;->s:I

    .line 130
    .line 131
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 132
    .line 133
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, v1, Lzy1;->v:Lso;

    .line 137
    .line 138
    iget-object p0, p0, Lo92;->j:Ljava/lang/String;

    .line 139
    .line 140
    const-string v2, "Successfully registered trigger URI"

    .line 141
    .line 142
    invoke-virtual {v1, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Lc52;->K()V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    goto :goto_1

    .line 151
    :catch_1
    move-exception v0

    .line 152
    :goto_1
    invoke-virtual {p0, v0}, Lxn0;->t(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :catch_2
    move-exception v0

    .line 157
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, v0}, Lxn0;->t(Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lc9;

    .line 2
    .line 3
    const-class v1, Lr90;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lc9;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lxn0;

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v1, v2, v3}, Lxn0;-><init>(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object v2, v0, Lc9;->m:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Lxn0;

    .line 22
    .line 23
    iput-object v1, v2, Lxn0;->l:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object v1, v0, Lc9;->m:Ljava/lang/Object;

    .line 26
    .line 27
    iget-object p0, p0, Lr90;->k:Lxn0;

    .line 28
    .line 29
    iput-object p0, v1, Lxn0;->k:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {v0}, Lc9;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
