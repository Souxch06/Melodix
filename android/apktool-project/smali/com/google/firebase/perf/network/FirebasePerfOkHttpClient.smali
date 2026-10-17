.class public Lcom/google/firebase/perf/network/FirebasePerfOkHttpClient;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static a(Lf11;Lpp0;JJ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lf11;->j:Lm01;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, v0, Lm01;->a:Led0;

    .line 7
    .line 8
    invoke-virtual {v1}, Led0;->h()Ljava/net/URL;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1, v1}, Lpp0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, v0, Lm01;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lpp0;->c(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lf11;->p:Lh11;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0}, Lh11;->a()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    const-wide/16 v3, -0x1

    .line 33
    .line 34
    cmp-long v3, v1, v3

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1, v1, v2}, Lpp0;->h(J)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {v0}, Lh11;->g()Llm0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, v0, Llm0;->a:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lpp0;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget p0, p0, Lf11;->m:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lpp0;->d(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2, p3}, Lpp0;->f(J)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, p4, p5}, Lpp0;->i(J)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lpp0;->b()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static enqueue(Lhi;Lki;)V
    .locals 6

    .line 1
    new-instance v3, Loc1;

    .line 2
    .line 3
    invoke-direct {v3}, Loc1;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v4, v3, Loc1;->j:J

    .line 7
    .line 8
    new-instance v0, Lxe0;

    .line 9
    .line 10
    sget-object v2, Lvd1;->B:Lvd1;

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    invoke-direct/range {v0 .. v5}, Lxe0;-><init>(Lki;Lvd1;Loc1;J)V

    .line 14
    .line 15
    .line 16
    check-cast p0, Lwx0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lwx0;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {p1, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_5

    .line 30
    .line 31
    sget-object p1, Lgt0;->a:Lgt0;

    .line 32
    .line 33
    sget-object p1, Lgt0;->a:Lgt0;

    .line 34
    .line 35
    invoke-virtual {p1}, Lgt0;->g()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lwx0;->o:Ljava/lang/Object;

    .line 40
    .line 41
    iget-object p1, p0, Lwx0;->j:Lmr0;

    .line 42
    .line 43
    iget-object p1, p1, Lmr0;->j:Ler0;

    .line 44
    .line 45
    new-instance v1, Ltx0;

    .line 46
    .line 47
    invoke-direct {v1, p0, v0}, Ltx0;-><init>(Lwx0;Lxe0;)V

    .line 48
    .line 49
    .line 50
    monitor-enter p1

    .line 51
    :try_start_0
    iget-object v0, p1, Ler0;->l:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ljava/util/ArrayDeque;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lwx0;->k:Lm01;

    .line 59
    .line 60
    iget-object p0, p0, Lm01;->a:Led0;

    .line 61
    .line 62
    iget-object p0, p0, Led0;->d:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v0, p1, Ler0;->m:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ljava/util/ArrayDeque;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ltx0;

    .line 83
    .line 84
    iget-object v3, v2, Ltx0;->l:Lwx0;

    .line 85
    .line 86
    iget-object v3, v3, Lwx0;->k:Lm01;

    .line 87
    .line 88
    iget-object v3, v3, Lm01;->a:Led0;

    .line 89
    .line 90
    iget-object v3, v3, Led0;->d:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v3, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object v0, p1, Ler0;->l:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Ljava/util/ArrayDeque;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_3

    .line 112
    .line 113
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Ltx0;

    .line 118
    .line 119
    iget-object v3, v2, Ltx0;->l:Lwx0;

    .line 120
    .line 121
    iget-object v3, v3, Lwx0;->k:Lm01;

    .line 122
    .line 123
    iget-object v3, v3, Lm01;->a:Led0;

    .line 124
    .line 125
    iget-object v3, v3, Led0;->d:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v3, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_3
    const/4 v2, 0x0

    .line 135
    :goto_0
    if-eqz v2, :cond_4

    .line 136
    .line 137
    iget-object p0, v2, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 138
    .line 139
    iput-object p0, v1, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    .line 141
    :cond_4
    monitor-exit p1

    .line 142
    invoke-virtual {p1}, Ler0;->r()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :catchall_0
    move-exception v0

    .line 147
    move-object p0, v0

    .line 148
    monitor-exit p1

    .line 149
    throw p0

    .line 150
    :cond_5
    const-string p0, "Already Executed"

    .line 151
    .line 152
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public static execute(Lhi;)Lf11;
    .locals 9

    .line 1
    sget-object v0, Lvd1;->B:Lvd1;

    .line 2
    .line 3
    new-instance v2, Lpp0;

    .line 4
    .line 5
    invoke-direct {v2, v0}, Lpp0;-><init>(Lvd1;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Loc1;->e()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    invoke-static {}, Loc1;->a()J

    .line 13
    .line 14
    .line 15
    move-result-wide v7

    .line 16
    :try_start_0
    move-object v0, p0

    .line 17
    check-cast v0, Lwx0;

    .line 18
    .line 19
    invoke-virtual {v0}, Lwx0;->d()Lf11;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Loc1;->e()J

    .line 24
    .line 25
    .line 26
    invoke-static {}, Loc1;->a()J

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    sub-long/2addr v5, v7

    .line 31
    invoke-static/range {v1 .. v6}, Lcom/google/firebase/perf/network/FirebasePerfOkHttpClient;->a(Lf11;Lpp0;JJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-object v1

    .line 35
    :catch_0
    move-exception v0

    .line 36
    check-cast p0, Lwx0;

    .line 37
    .line 38
    iget-object p0, p0, Lwx0;->k:Lm01;

    .line 39
    .line 40
    iget-object v1, p0, Lm01;->a:Led0;

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v1}, Led0;->h()Ljava/net/URL;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v2, v1}, Lpp0;->j(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p0, p0, Lm01;->b:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {v2, p0}, Lpp0;->c(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {v2, v3, v4}, Lpp0;->f(J)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Loc1;->e()J

    .line 66
    .line 67
    .line 68
    invoke-static {}, Loc1;->a()J

    .line 69
    .line 70
    .line 71
    move-result-wide v3

    .line 72
    sub-long/2addr v3, v7

    .line 73
    invoke-virtual {v2, v3, v4}, Lpp0;->i(J)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Lqp0;->c(Lpp0;)V

    .line 77
    .line 78
    .line 79
    throw v0
.end method
