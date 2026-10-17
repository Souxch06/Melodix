.class public abstract Ley;
.super Lkb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public l:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-direct {p0, v2, v0, v1}, Lkb1;-><init>(ZJ)V

    .line 5
    .line 6
    .line 7
    iput p1, p0, Ley;->l:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract e()Liq;
.end method

.method public f(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 1

    .line 1
    instance-of p0, p1, Lql;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lql;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object p1, v0

    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p0, p1, Lql;->a:Ljava/lang/Throwable;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    return-object v0
.end method

.method public g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final h(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    new-instance v0, Ldr;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Fatal exception in coroutines machinery for "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ". Please read KDoc to \'handleFatalException\' method and report this incident to maintainers"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ley;->e()Liq;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Liq;->getContext()Lsq;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, v0}, Lrs0;->i(Lsq;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public abstract j()Ljava/lang/Object;
.end method

.method public final run()V
    .locals 11

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ley;->e()Liq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast v0, Lcy;

    .line 9
    .line 10
    iget-object v1, v0, Lcy;->n:Lkq;

    .line 11
    .line 12
    iget-object v0, v0, Lcy;->p:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-interface {v1}, Liq;->getContext()Lsq;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2, v0}, Lbh;->E(Lsq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v3, Lbh;->c:Log0;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    if-eq v0, v3, :cond_0

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ldl1;->q(Liq;Lsq;Ljava/lang/Object;)Lte1;

    .line 28
    .line 29
    .line 30
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto/16 :goto_6

    .line 34
    .line 35
    :cond_0
    move-object v3, v4

    .line 36
    :goto_0
    :try_start_1
    invoke-interface {v1}, Liq;->getContext()Lsq;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {p0}, Ley;->j()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-virtual {p0, v6}, Ley;->f(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    if-nez v7, :cond_3

    .line 49
    .line 50
    iget v8, p0, Ley;->l:I

    .line 51
    .line 52
    const/4 v9, 0x1

    .line 53
    if-eq v8, v9, :cond_2

    .line 54
    .line 55
    const/4 v10, 0x2

    .line 56
    if-ne v8, v10, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 v9, 0x0

    .line 60
    :cond_2
    :goto_1
    if-eqz v9, :cond_3

    .line 61
    .line 62
    sget-object v4, Ltb0;->n:Ltb0;

    .line 63
    .line 64
    invoke-interface {v5, v4}, Lsq;->j(Lrq;)Lqq;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Lng0;

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :catchall_1
    move-exception v1

    .line 72
    goto :goto_5

    .line 73
    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    .line 74
    .line 75
    invoke-virtual {v4}, Lng0;->F()Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-nez v5, :cond_4

    .line 80
    .line 81
    invoke-virtual {v4}, Lng0;->w()Ljava/util/concurrent/CancellationException;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {p0, v4}, Ley;->b(Ljava/util/concurrent/CancellationException;)V

    .line 86
    .line 87
    .line 88
    new-instance v5, Lj11;

    .line 89
    .line 90
    invoke-direct {v5, v4}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v5}, Lkq;->d(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    if-eqz v7, :cond_5

    .line 98
    .line 99
    new-instance v4, Lj11;

    .line 100
    .line 101
    invoke-direct {v4, v7}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v4}, Lkq;->d(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_5
    invoke-virtual {p0, v6}, Ley;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-virtual {v1, v4}, Lkq;->d(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 113
    .line 114
    .line 115
    :goto_3
    if-eqz v3, :cond_7

    .line 116
    .line 117
    :try_start_2
    invoke-virtual {v3}, Lte1;->W()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_6

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_6
    return-void

    .line 125
    :cond_7
    :goto_4
    invoke-static {v2, v0}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :goto_5
    if-eqz v3, :cond_8

    .line 130
    .line 131
    invoke-virtual {v3}, Lte1;->W()Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_9

    .line 136
    .line 137
    :cond_8
    invoke-static {v2, v0}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    :cond_9
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    :goto_6
    invoke-virtual {p0, v0}, Ley;->h(Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method
