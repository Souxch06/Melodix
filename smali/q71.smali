.class public final Lq71;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ll51;

.field public final b:Le51;

.field public final c:Ld51;

.field public final d:Lkc1;

.field public final e:Lyt;

.field public final f:Liv0;

.field public final g:Lsq;

.field public h:Lu41;

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll51;Le51;Ld51;Lkc1;Lyt;Liv0;Lsq;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lq71;->a:Ll51;

    .line 26
    .line 27
    iput-object p2, p0, Lq71;->b:Le51;

    .line 28
    .line 29
    iput-object p3, p0, Lq71;->c:Ld51;

    .line 30
    .line 31
    iput-object p4, p0, Lq71;->d:Lkc1;

    .line 32
    .line 33
    iput-object p5, p0, Lq71;->e:Lyt;

    .line 34
    .line 35
    iput-object p6, p0, Lq71;->f:Liv0;

    .line 36
    .line 37
    iput-object p7, p0, Lq71;->g:Lsq;

    .line 38
    .line 39
    const-string p1, ""

    .line 40
    .line 41
    iput-object p1, p0, Lq71;->k:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p7}, Lfe1;->b(Lsq;)Lgq;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Lm71;

    .line 48
    .line 49
    const/4 p3, 0x0

    .line 50
    const/4 p4, 0x0

    .line 51
    invoke-direct {p2, p0, p3, p4}, Lm71;-><init>(Lq71;Liq;I)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, p2}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lq71;->i:Z

    .line 3
    .line 4
    iget-object v0, p0, Lq71;->h:Lu41;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lq71;->f:Liv0;

    .line 10
    .line 11
    invoke-virtual {v0}, Liv0;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lq71;->g:Lsq;

    .line 15
    .line 16
    invoke-static {v0}, Lfe1;->b(Lsq;)Lgq;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lm71;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-direct {v1, p0, v2, v3}, Lm71;-><init>(Lq71;Liq;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final b()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lq71;->i:Z

    .line 3
    .line 4
    iget-object v1, p0, Lq71;->h:Lu41;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iput-boolean v0, p0, Lq71;->j:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    iget-object v2, p0, Lq71;->f:Liv0;

    .line 15
    .line 16
    invoke-virtual {v2}, Liv0;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lq71;->d(Lu41;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lq71;->c(Lu41;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void

    .line 33
    :cond_2
    :goto_0
    iget-object v2, p0, Lq71;->g:Lsq;

    .line 34
    .line 35
    invoke-static {v2}, Lfe1;->b(Lsq;)Lgq;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Loj;

    .line 40
    .line 41
    const/16 v4, 0xc

    .line 42
    .line 43
    invoke-direct {v3, p0, v1, v0, v4}, Loj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2, v3}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    const-string p0, "localSessionData"

    .line 51
    .line 52
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw v0
.end method

.method public final c(Lu41;)Z
    .locals 3

    .line 1
    iget-object p1, p1, Lu41;->c:Ljava/util/Map;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iget-object p0, p0, Lq71;->f:Liv0;

    .line 5
    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Liv0;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lgv0;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget v1, p1, Lgv0;->a:I

    .line 25
    .line 26
    iget v2, p0, Liv0;->c:I

    .line 27
    .line 28
    if-ne v1, v2, :cond_2

    .line 29
    .line 30
    iget-object p1, p1, Lgv0;->b:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Liv0;->d:Lgb1;

    .line 33
    .line 34
    invoke-virtual {v1}, Lgb1;->getValue()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p1, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Liv0;->a()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    :cond_3
    return v0

    .line 54
    :cond_4
    invoke-virtual {p0}, Liv0;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    return v0
.end method

.method public final d(Lu41;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lu41;->b:Ljc1;

    .line 2
    .line 3
    iget-object p1, p1, Lu41;->a:Ly41;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    iget-object v2, p0, Lq71;->d:Lkc1;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lkc1;->a()Ljc1;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget v3, Lbz;->m:I

    .line 18
    .line 19
    iget-wide v2, v2, Ljc1;->a:J

    .line 20
    .line 21
    iget-wide v4, v0, Ljc1;->a:J

    .line 22
    .line 23
    sub-long/2addr v2, v4

    .line 24
    sget-object v0, Ldz;->l:Ldz;

    .line 25
    .line 26
    invoke-static {v2, v3, v0}, Lbe2;->v(JLdz;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    iget-object p0, p0, Lq71;->a:Ll51;

    .line 31
    .line 32
    iget-object v0, p0, Ll51;->a:Ln61;

    .line 33
    .line 34
    invoke-interface {v0}, Ln61;->d()Lbz;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-wide/16 v4, 0x0

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-wide v6, v0, Lbz;->j:J

    .line 43
    .line 44
    cmp-long v0, v6, v4

    .line 45
    .line 46
    if-lez v0, :cond_0

    .line 47
    .line 48
    invoke-static {v6, v7}, Lbz;->c(J)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Ll51;->b:Ln61;

    .line 56
    .line 57
    invoke-interface {p0}, Ln61;->d()Lbz;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    iget-wide v6, p0, Lbz;->j:J

    .line 64
    .line 65
    cmp-long p0, v6, v4

    .line 66
    .line 67
    if-lez p0, :cond_1

    .line 68
    .line 69
    invoke-static {v6, v7}, Lbz;->c(J)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/16 p0, 0x1e

    .line 77
    .line 78
    sget-object v0, Ldz;->n:Ldz;

    .line 79
    .line 80
    invoke-static {p0, v0}, Lbe2;->u(ILdz;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v6

    .line 84
    :goto_0
    invoke-static {v2, v3, v6, v7}, Lbz;->b(JJ)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-lez p0, :cond_2

    .line 89
    .line 90
    const/4 v1, 0x1

    .line 91
    :cond_2
    if-eqz v1, :cond_3

    .line 92
    .line 93
    iget-object p0, p1, Ly41;->a:Ljava/lang/String;

    .line 94
    .line 95
    :cond_3
    return v1

    .line 96
    :cond_4
    iget-object p0, p1, Ly41;->a:Ljava/lang/String;

    .line 97
    .line 98
    return v1
.end method

.method public final e(Ljava/lang/String;Ln71;Liq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p3, Lp71;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lp71;

    .line 7
    .line 8
    iget v1, v0, Lp71;->q:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lp71;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lp71;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lp71;-><init>(Lq71;Liq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lp71;->o:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Lar;->j:Lar;

    .line 28
    .line 29
    iget v2, v0, Lp71;->q:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    iget-object p2, v0, Lp71;->n:Ln71;

    .line 37
    .line 38
    iget-object p1, v0, Lp71;->m:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0

    .line 51
    :cond_2
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Lq71;->k:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p3, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    if-eqz p3, :cond_3

    .line 61
    .line 62
    sget-object p0, Lwe1;->a:Lwe1;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_3
    iput-object p1, p0, Lq71;->k:Ljava/lang/String;

    .line 66
    .line 67
    sget-object p0, Ll50;->a:Ll50;

    .line 68
    .line 69
    iput-object p1, v0, Lp71;->m:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p2, v0, Lp71;->n:Ln71;

    .line 72
    .line 73
    iput v3, v0, Lp71;->q:I

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll50;->b(Lkq;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    if-ne p3, v1, :cond_4

    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_4
    :goto_1
    check-cast p3, Ljava/util/Map;

    .line 83
    .line 84
    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    if-eqz p3, :cond_9

    .line 97
    .line 98
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    check-cast p3, Llr;

    .line 103
    .line 104
    new-instance v0, Li51;

    .line 105
    .line 106
    invoke-direct {v0, p1}, Li51;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    iget-object p3, p3, Llr;->b:Lc9;

    .line 116
    .line 117
    monitor-enter p3

    .line 118
    :try_start_0
    iget-object v0, p3, Lc9;->m:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v0, Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_6

    .line 127
    .line 128
    iget-object v0, p3, Lc9;->k:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast v0, Lm30;

    .line 131
    .line 132
    iget-object v1, p3, Lc9;->l:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v1, Ljava/lang/String;

    .line 135
    .line 136
    const-string v2, "aqs."
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .line 138
    if-eqz v1, :cond_5

    .line 139
    .line 140
    :try_start_1
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v0, v1, v2}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    .line 150
    .line 151
    :catch_0
    :cond_5
    :try_start_2
    iput-object p1, p3, Lc9;->m:Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :catchall_0
    move-exception p0

    .line 155
    goto :goto_4

    .line 156
    :cond_6
    :goto_3
    monitor-exit p3

    .line 157
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    if-eqz p3, :cond_8

    .line 162
    .line 163
    if-ne p3, v3, :cond_7

    .line 164
    .line 165
    sget-object p3, Lh51;->j:Lh51;

    .line 166
    .line 167
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_7
    new-instance p0, Lrl;

    .line 172
    .line 173
    invoke-direct {p0}, Lrl;-><init>()V

    .line 174
    .line 175
    .line 176
    throw p0

    .line 177
    :cond_8
    sget-object p3, Lh51;->j:Lh51;

    .line 178
    .line 179
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :goto_4
    :try_start_3
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 184
    throw p0

    .line 185
    :cond_9
    sget-object p0, Lwe1;->a:Lwe1;

    .line 186
    .line 187
    return-object p0
.end method
