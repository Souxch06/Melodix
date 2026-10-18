.class public final Lwu;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lyt;


# instance fields
.field public final a:Lh30;

.field public final b:Lpa0;

.field public final c:Lzq;

.field public final d:Lny0;

.field public final e:Lzo0;

.field public f:I

.field public g:Ln91;

.field public final h:Lbv1;

.field public final i:Ler0;

.field public final j:Lgb1;

.field public final k:Lgb1;

.field public final l:Ler0;


# direct methods
.method public constructor <init>(Lh30;Ljava/util/List;Lpa0;Lzq;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lwu;->a:Lh30;

    .line 5
    .line 6
    iput-object p3, p0, Lwu;->b:Lpa0;

    .line 7
    .line 8
    iput-object p4, p0, Lwu;->c:Lzq;

    .line 9
    .line 10
    new-instance p1, Lnj;

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p1, p0, p3, v0}, Lnj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lny0;

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-direct {v1, v2, p1}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lwu;->d:Lny0;

    .line 24
    .line 25
    invoke-static {}, Lbv;->a()Lzo0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lwu;->e:Lzo0;

    .line 30
    .line 31
    new-instance p1, Lbv1;

    .line 32
    .line 33
    const/16 v1, 0xf

    .line 34
    .line 35
    invoke-direct {p1, v1}, Lbv1;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lwu;->h:Lbv1;

    .line 39
    .line 40
    new-instance p1, Ler0;

    .line 41
    .line 42
    invoke-direct {p1, p0, p2}, Ler0;-><init>(Lwu;Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lwu;->i:Ler0;

    .line 46
    .line 47
    new-instance p1, Ldu;

    .line 48
    .line 49
    invoke-direct {p1, p0, v0}, Ldu;-><init>(Lwu;I)V

    .line 50
    .line 51
    .line 52
    new-instance p2, Lgb1;

    .line 53
    .line 54
    invoke-direct {p2, p1}, Lgb1;-><init>(Lp80;)V

    .line 55
    .line 56
    .line 57
    iput-object p2, p0, Lwu;->j:Lgb1;

    .line 58
    .line 59
    new-instance p1, Ldu;

    .line 60
    .line 61
    const/4 p2, 0x0

    .line 62
    invoke-direct {p1, p0, p2}, Ldu;-><init>(Lwu;I)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Lgb1;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Lgb1;-><init>(Lp80;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lwu;->k:Lgb1;

    .line 71
    .line 72
    new-instance p1, Ler0;

    .line 73
    .line 74
    new-instance v0, Ltu;

    .line 75
    .line 76
    invoke-direct {v0, p2, p0}, Ltu;-><init>(ILjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    new-instance p2, Loj;

    .line 80
    .line 81
    const/4 v1, 0x5

    .line 82
    invoke-direct {p2, p0, p3, v1}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p1, p4, v0, p2}, Ler0;-><init>(Lzq;Ltu;Loj;)V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lwu;->l:Ler0;

    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method public final a(Lf90;Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ltb0;->r:Ltb0;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lsq;->j(Lrq;)Lqq;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lwf1;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lwf1;->a(Lwu;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance v1, Lwf1;

    .line 19
    .line 20
    invoke-direct {v1, v0, p0}, Lwf1;-><init>(Lwf1;Lwu;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lnj;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, p0, p1, v2, v3}, Lnj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v0, p2}, Lju1;->x(Lsq;Lf90;Lkq;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final b(Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p1, Lku;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lku;

    .line 7
    .line 8
    iget v1, v0, Lku;->q:I

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
    iput v1, v0, Lku;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lku;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lku;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lku;->o:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lku;->q:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-object p0, v0, Lku;->n:Lzo0;

    .line 36
    .line 37
    iget-object v0, v0, Lku;->m:Lwu;

    .line 38
    .line 39
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    move-object p1, p0

    .line 43
    move-object p0, v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v3

    .line 51
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iput-object p0, v0, Lku;->m:Lwu;

    .line 55
    .line 56
    iget-object p1, p0, Lwu;->e:Lzo0;

    .line 57
    .line 58
    iput-object p1, v0, Lku;->n:Lzo0;

    .line 59
    .line 60
    iput v2, v0, Lku;->q:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v1, Lar;->j:Lar;

    .line 67
    .line 68
    if-ne v0, v1, :cond_3

    .line 69
    .line 70
    return-object v1

    .line 71
    :cond_3
    :goto_1
    :try_start_0
    iget v0, p0, Lwu;->f:I

    .line 72
    .line 73
    add-int/lit8 v0, v0, -0x1

    .line 74
    .line 75
    iput v0, p0, Lwu;->f:I

    .line 76
    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    iget-object v0, p0, Lwu;->g:Ln91;

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Lng0;->f(Ljava/util/concurrent/CancellationException;)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    :goto_2
    iput-object v3, p0, Lwu;->g:Ln91;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    :cond_5
    invoke-virtual {p1, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    sget-object p0, Lwe1;->a:Lwe1;

    .line 95
    .line 96
    return-object p0

    .line 97
    :goto_3
    invoke-virtual {p1, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    throw p0
.end method

.method public final c()Lef0;
    .locals 0

    .line 1
    iget-object p0, p0, Lwu;->k:Lgb1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lef0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final d(Lmn0;Lkq;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p2, Llu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Llu;

    .line 7
    .line 8
    iget v1, v0, Llu;->r:I

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
    iput v1, v0, Llu;->r:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Llu;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Llu;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Llu;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Llu;->r:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x3

    .line 31
    const/4 v4, 0x2

    .line 32
    const/4 v5, 0x1

    .line 33
    sget-object v6, Lar;->j:Lar;

    .line 34
    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    if-eq v1, v5, :cond_1

    .line 38
    .line 39
    if-eq v1, v4, :cond_3

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    :cond_1
    iget-object p0, v0, Llu;->m:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p0, Lnl;

    .line 46
    .line 47
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto/16 :goto_7

    .line 51
    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto/16 :goto_6

    .line 54
    .line 55
    :cond_2
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 56
    .line 57
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object v2

    .line 61
    :cond_3
    iget-object p0, v0, Llu;->o:Lnl;

    .line 62
    .line 63
    iget-object p1, v0, Llu;->n:Lwu;

    .line 64
    .line 65
    iget-object v1, v0, Llu;->m:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v1, Lmn0;

    .line 68
    .line 69
    :try_start_1
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    .line 71
    .line 72
    move-object p2, p0

    .line 73
    move-object p0, p1

    .line 74
    move-object p1, v1

    .line 75
    goto :goto_4

    .line 76
    :cond_4
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p1, Lmn0;->b:Lnl;

    .line 80
    .line 81
    :try_start_2
    iget-object v1, p0, Lwu;->h:Lbv1;

    .line 82
    .line 83
    invoke-virtual {v1}, Lbv1;->n()Lr91;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    instance-of v7, v1, Lpt;

    .line 88
    .line 89
    if-eqz v7, :cond_6

    .line 90
    .line 91
    iget-object v1, p1, Lmn0;->a:Lf90;

    .line 92
    .line 93
    iget-object p1, p1, Lmn0;->d:Lsq;

    .line 94
    .line 95
    iput-object p2, v0, Llu;->m:Ljava/lang/Object;

    .line 96
    .line 97
    iput v5, v0, Llu;->r:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 98
    .line 99
    :try_start_3
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    new-instance v4, Lsu;

    .line 104
    .line 105
    invoke-direct {v4, p0, p1, v1, v2}, Lsu;-><init>(Lwu;Lsq;Lf90;Liq;)V

    .line 106
    .line 107
    .line 108
    invoke-interface {v3, v4, v0}, Lef0;->a(Lr80;Lkq;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 112
    if-ne p0, v6, :cond_5

    .line 113
    .line 114
    goto :goto_5

    .line 115
    :cond_5
    move-object v8, p2

    .line 116
    move-object p2, p0

    .line 117
    move-object p0, v8

    .line 118
    goto :goto_7

    .line 119
    :goto_1
    move-object p1, p0

    .line 120
    goto :goto_2

    .line 121
    :catchall_1
    move-exception p0

    .line 122
    goto :goto_1

    .line 123
    :goto_2
    move-object p0, p2

    .line 124
    goto :goto_6

    .line 125
    :catchall_2
    move-exception p1

    .line 126
    goto :goto_2

    .line 127
    :cond_6
    :try_start_4
    instance-of v7, v1, Lqx0;

    .line 128
    .line 129
    if-eqz v7, :cond_7

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_7
    instance-of v5, v1, Lqe1;

    .line 133
    .line 134
    :goto_3
    if-eqz v5, :cond_a

    .line 135
    .line 136
    iget-object v5, p1, Lmn0;->c:Lr91;

    .line 137
    .line 138
    if-ne v1, v5, :cond_9

    .line 139
    .line 140
    iput-object p1, v0, Llu;->m:Ljava/lang/Object;

    .line 141
    .line 142
    iput-object p0, v0, Llu;->n:Lwu;

    .line 143
    .line 144
    iput-object p2, v0, Llu;->o:Lnl;

    .line 145
    .line 146
    iput v4, v0, Llu;->r:I

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Lwu;->f(Lkq;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    if-ne v1, v6, :cond_8

    .line 153
    .line 154
    goto :goto_5

    .line 155
    :cond_8
    :goto_4
    iget-object v1, p1, Lmn0;->a:Lf90;

    .line 156
    .line 157
    iget-object p1, p1, Lmn0;->d:Lsq;

    .line 158
    .line 159
    iput-object p2, v0, Llu;->m:Ljava/lang/Object;

    .line 160
    .line 161
    iput-object v2, v0, Llu;->n:Lwu;

    .line 162
    .line 163
    iput-object v2, v0, Llu;->o:Lnl;

    .line 164
    .line 165
    iput v3, v0, Llu;->r:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 166
    .line 167
    :try_start_5
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    new-instance v4, Lsu;

    .line 172
    .line 173
    invoke-direct {v4, p0, p1, v1, v2}, Lsu;-><init>(Lwu;Lsq;Lf90;Liq;)V

    .line 174
    .line 175
    .line 176
    invoke-interface {v3, v4, v0}, Lef0;->a(Lr80;Lkq;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 180
    if-ne p0, v6, :cond_5

    .line 181
    .line 182
    :goto_5
    return-object v6

    .line 183
    :catchall_3
    move-exception p0

    .line 184
    goto :goto_1

    .line 185
    :cond_9
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    .line 187
    .line 188
    check-cast v1, Lqx0;

    .line 189
    .line 190
    iget-object p0, v1, Lqx0;->b:Ljava/lang/Throwable;

    .line 191
    .line 192
    throw p0

    .line 193
    :cond_a
    instance-of p0, v1, Lp30;

    .line 194
    .line 195
    if-eqz p0, :cond_b

    .line 196
    .line 197
    check-cast v1, Lp30;

    .line 198
    .line 199
    iget-object p0, v1, Lp30;->b:Ljava/lang/Throwable;

    .line 200
    .line 201
    throw p0

    .line 202
    :cond_b
    new-instance p0, Lrl;

    .line 203
    .line 204
    invoke-direct {p0}, Lrl;-><init>()V

    .line 205
    .line 206
    .line 207
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 208
    :goto_6
    new-instance p2, Lj11;

    .line 209
    .line 210
    invoke-direct {p2, p1}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 211
    .line 212
    .line 213
    :goto_7
    invoke-static {p2}, Lk11;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    if-nez p1, :cond_c

    .line 218
    .line 219
    invoke-virtual {p0, p2}, Lng0;->H(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    goto :goto_8

    .line 223
    :cond_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    .line 225
    .line 226
    new-instance p2, Lql;

    .line 227
    .line 228
    const/4 v0, 0x0

    .line 229
    invoke-direct {p2, p1, v0}, Lql;-><init>(Ljava/lang/Throwable;Z)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0, p2}, Lng0;->H(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    :goto_8
    sget-object p0, Lwe1;->a:Lwe1;

    .line 236
    .line 237
    return-object p0
.end method

.method public final e(Lkq;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p1, Lmu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lmu;

    .line 7
    .line 8
    iget v1, v0, Lmu;->q:I

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
    iput v1, v0, Lmu;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lmu;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lmu;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lmu;->o:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lmu;->q:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-object p0, v0, Lmu;->n:Lzo0;

    .line 36
    .line 37
    iget-object v0, v0, Lmu;->m:Lwu;

    .line 38
    .line 39
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    move-object p1, p0

    .line 43
    move-object p0, v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v3

    .line 51
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iput-object p0, v0, Lmu;->m:Lwu;

    .line 55
    .line 56
    iget-object p1, p0, Lwu;->e:Lzo0;

    .line 57
    .line 58
    iput-object p1, v0, Lmu;->n:Lzo0;

    .line 59
    .line 60
    iput v2, v0, Lmu;->q:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v1, Lar;->j:Lar;

    .line 67
    .line 68
    if-ne v0, v1, :cond_3

    .line 69
    .line 70
    return-object v1

    .line 71
    :cond_3
    :goto_1
    :try_start_0
    iget v0, p0, Lwu;->f:I

    .line 72
    .line 73
    add-int/2addr v0, v2

    .line 74
    iput v0, p0, Lwu;->f:I

    .line 75
    .line 76
    if-ne v0, v2, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Lwu;->c:Lzq;

    .line 79
    .line 80
    new-instance v1, Leu;

    .line 81
    .line 82
    invoke-direct {v1, p0, v3, v2}, Leu;-><init>(Lwu;Liq;I)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lwu;->g:Ln91;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto :goto_3

    .line 94
    :cond_4
    :goto_2
    invoke-virtual {p1, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Lwe1;->a:Lwe1;

    .line 98
    .line 99
    return-object p0

    .line 100
    :goto_3
    invoke-virtual {p1, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    throw p0
.end method

.method public final f(Lkq;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p1, Lnu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lnu;

    .line 7
    .line 8
    iget v1, v0, Lnu;->q:I

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
    iput v1, v0, Lnu;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lnu;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lnu;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lnu;->o:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lnu;->q:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    sget-object v4, Lar;->j:Lar;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    if-eq v1, v3, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget p0, v0, Lnu;->n:I

    .line 40
    .line 41
    iget-object v0, v0, Lnu;->m:Lwu;

    .line 42
    .line 43
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_3

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_4

    .line 49
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 50
    .line 51
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return-object p0

    .line 56
    :cond_2
    iget-object p0, v0, Lnu;->m:Lwu;

    .line 57
    .line 58
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p0, v0, Lnu;->m:Lwu;

    .line 70
    .line 71
    iput v3, v0, Lnu;->q:I

    .line 72
    .line 73
    invoke-interface {p1, v0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-ne p1, v4, :cond_4

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    :goto_1
    check-cast p1, Ljava/lang/Number;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    :try_start_1
    iget-object v1, p0, Lwu;->i:Ler0;

    .line 87
    .line 88
    iput-object p0, v0, Lnu;->m:Lwu;

    .line 89
    .line 90
    iput p1, v0, Lnu;->n:I

    .line 91
    .line 92
    iput v2, v0, Lnu;->q:I

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ler0;->s(Lkq;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 98
    if-ne p0, v4, :cond_5

    .line 99
    .line 100
    :goto_2
    return-object v4

    .line 101
    :cond_5
    :goto_3
    sget-object p0, Lwe1;->a:Lwe1;

    .line 102
    .line 103
    return-object p0

    .line 104
    :catchall_1
    move-exception v0

    .line 105
    move-object v5, v0

    .line 106
    move-object v0, p0

    .line 107
    move p0, p1

    .line 108
    move-object p1, v5

    .line 109
    :goto_4
    iget-object v0, v0, Lwu;->h:Lbv1;

    .line 110
    .line 111
    new-instance v1, Lqx0;

    .line 112
    .line 113
    invoke-direct {v1, p1, p0}, Lqx0;-><init>(Ljava/lang/Throwable;I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lbv1;->r(Lr91;)V

    .line 117
    .line 118
    .line 119
    throw p1
.end method

.method public final g(ZLiq;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p2, Lou;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lou;

    .line 7
    .line 8
    iget v1, v0, Lou;->r:I

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
    iput v1, v0, Lou;->r:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lou;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lou;-><init>(Lwu;Liq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lou;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lou;->r:I

    .line 28
    .line 29
    const/4 v2, 0x3

    .line 30
    const/4 v3, 0x2

    .line 31
    const/4 v4, 0x1

    .line 32
    const/4 v5, 0x0

    .line 33
    sget-object v6, Lar;->j:Lar;

    .line 34
    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    if-eq v1, v4, :cond_3

    .line 38
    .line 39
    if-eq v1, v3, :cond_2

    .line 40
    .line 41
    if-ne v1, v2, :cond_1

    .line 42
    .line 43
    iget-object p0, v0, Lou;->m:Lwu;

    .line 44
    .line 45
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto/16 :goto_5

    .line 49
    .line 50
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 51
    .line 52
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-object v5

    .line 56
    :cond_2
    iget-object p0, v0, Lou;->m:Lwu;

    .line 57
    .line 58
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_3
    iget-boolean p1, v0, Lou;->o:Z

    .line 63
    .line 64
    iget-object p0, v0, Lou;->n:Lr91;

    .line 65
    .line 66
    iget-object v1, v0, Lou;->m:Lwu;

    .line 67
    .line 68
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Lwu;->h:Lbv1;

    .line 76
    .line 77
    invoke-virtual {p2}, Lbv1;->n()Lr91;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    instance-of v1, p2, Lqe1;

    .line 82
    .line 83
    if-nez v1, :cond_c

    .line 84
    .line 85
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object p0, v0, Lou;->m:Lwu;

    .line 90
    .line 91
    iput-object p2, v0, Lou;->n:Lr91;

    .line 92
    .line 93
    iput-boolean p1, v0, Lou;->o:Z

    .line 94
    .line 95
    iput v4, v0, Lou;->r:I

    .line 96
    .line 97
    invoke-interface {v1, v0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    if-ne v1, v6, :cond_5

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    move-object v8, v1

    .line 105
    move-object v1, p0

    .line 106
    move-object p0, p2

    .line 107
    move-object p2, v8

    .line 108
    :goto_1
    check-cast p2, Ljava/lang/Number;

    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    instance-of v4, p0, Lpt;

    .line 115
    .line 116
    if-eqz v4, :cond_6

    .line 117
    .line 118
    iget v7, p0, Lr91;->a:I

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_6
    const/4 v7, -0x1

    .line 122
    :goto_2
    if-eqz v4, :cond_7

    .line 123
    .line 124
    if-ne p2, v7, :cond_7

    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_7
    if-eqz p1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lwu;->c()Lef0;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Lpu;

    .line 134
    .line 135
    invoke-direct {p1, v1, v5}, Lpu;-><init>(Lwu;Liq;)V

    .line 136
    .line 137
    .line 138
    iput-object v1, v0, Lou;->m:Lwu;

    .line 139
    .line 140
    iput-object v5, v0, Lou;->n:Lr91;

    .line 141
    .line 142
    iput v3, v0, Lou;->r:I

    .line 143
    .line 144
    invoke-interface {p0, p1, v0}, Lef0;->a(Lr80;Lkq;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    if-ne p2, v6, :cond_8

    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_8
    move-object p0, v1

    .line 152
    :goto_3
    check-cast p2, Lps0;

    .line 153
    .line 154
    goto :goto_6

    .line 155
    :cond_9
    invoke-virtual {v1}, Lwu;->c()Lef0;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    new-instance p1, Lqu;

    .line 160
    .line 161
    const/4 p2, 0x0

    .line 162
    invoke-direct {p1, v1, v7, v5, p2}, Lqu;-><init>(Lwu;ILiq;I)V

    .line 163
    .line 164
    .line 165
    iput-object v1, v0, Lou;->m:Lwu;

    .line 166
    .line 167
    iput-object v5, v0, Lou;->n:Lr91;

    .line 168
    .line 169
    iput v2, v0, Lou;->r:I

    .line 170
    .line 171
    invoke-interface {p0, p1, v0}, Lef0;->d(Lf90;Lkq;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    if-ne p2, v6, :cond_a

    .line 176
    .line 177
    :goto_4
    return-object v6

    .line 178
    :cond_a
    move-object p0, v1

    .line 179
    :goto_5
    check-cast p2, Lps0;

    .line 180
    .line 181
    :goto_6
    iget-object p1, p2, Lps0;->j:Ljava/lang/Object;

    .line 182
    .line 183
    check-cast p1, Lr91;

    .line 184
    .line 185
    iget-object p2, p2, Lps0;->k:Ljava/lang/Object;

    .line 186
    .line 187
    check-cast p2, Ljava/lang/Boolean;

    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-eqz p2, :cond_b

    .line 194
    .line 195
    iget-object p0, p0, Lwu;->h:Lbv1;

    .line 196
    .line 197
    invoke-virtual {p0, p1}, Lbv1;->r(Lr91;)V

    .line 198
    .line 199
    .line 200
    :cond_b
    return-object p1

    .line 201
    :cond_c
    const-string p0, "This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542"

    .line 202
    .line 203
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    return-object v5
.end method

.method public final getData()Lr50;
    .locals 0

    .line 1
    iget-object p0, p0, Lwu;->d:Lny0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(ZLkq;)Ljava/lang/Object;
    .locals 10

    .line 1
    instance-of v0, p2, Lru;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lru;

    .line 7
    .line 8
    iget v1, v0, Lru;->u:I

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
    iput v1, v0, Lru;->u:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lru;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lru;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lru;->s:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lru;->u:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    sget-object v5, Lar;->j:Lar;

    .line 33
    .line 34
    packed-switch v1, :pswitch_data_0

    .line 35
    .line 36
    .line 37
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 38
    .line 39
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object v4

    .line 43
    :pswitch_0
    iget-object p0, v0, Lru;->o:Ljava/io/Serializable;

    .line 44
    .line 45
    check-cast p0, Lfz0;

    .line 46
    .line 47
    iget-object p1, v0, Lru;->n:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, Lhz0;

    .line 50
    .line 51
    iget-object v0, v0, Lru;->m:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ler;

    .line 54
    .line 55
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    goto/16 :goto_a

    .line 59
    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto/16 :goto_c

    .line 62
    .line 63
    :pswitch_1
    iget-boolean p0, v0, Lru;->q:Z

    .line 64
    .line 65
    iget-object p1, v0, Lru;->p:Lhz0;

    .line 66
    .line 67
    iget-object v1, v0, Lru;->o:Ljava/io/Serializable;

    .line 68
    .line 69
    check-cast v1, Lhz0;

    .line 70
    .line 71
    iget-object v6, v0, Lru;->n:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v6, Ler;

    .line 74
    .line 75
    iget-object v7, v0, Lru;->m:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v7, Lwu;

    .line 78
    .line 79
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    goto/16 :goto_7

    .line 83
    .line 84
    :pswitch_2
    iget-boolean p1, v0, Lru;->q:Z

    .line 85
    .line 86
    iget-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast p0, Lwu;

    .line 89
    .line 90
    :try_start_1
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catch Ler; {:try_start_1 .. :try_end_1} :catch_0

    .line 91
    .line 92
    .line 93
    goto/16 :goto_5

    .line 94
    .line 95
    :catch_0
    move-exception p2

    .line 96
    goto/16 :goto_6

    .line 97
    .line 98
    :pswitch_3
    iget-boolean p1, v0, Lru;->q:Z

    .line 99
    .line 100
    iget-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast p0, Lwu;

    .line 103
    .line 104
    :try_start_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_2
    .catch Ler; {:try_start_2 .. :try_end_2} :catch_0

    .line 105
    .line 106
    .line 107
    goto/16 :goto_4

    .line 108
    .line 109
    :pswitch_4
    iget p0, v0, Lru;->r:I

    .line 110
    .line 111
    iget-boolean p1, v0, Lru;->q:Z

    .line 112
    .line 113
    iget-object v1, v0, Lru;->n:Ljava/lang/Object;

    .line 114
    .line 115
    iget-object v6, v0, Lru;->m:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v6, Lwu;

    .line 118
    .line 119
    :try_start_3
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_3
    .catch Ler; {:try_start_3 .. :try_end_3} :catch_1

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :catch_1
    move-exception p2

    .line 124
    move-object p0, v6

    .line 125
    goto/16 :goto_6

    .line 126
    .line 127
    :pswitch_5
    iget-boolean p1, v0, Lru;->q:Z

    .line 128
    .line 129
    iget-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast p0, Lwu;

    .line 132
    .line 133
    :try_start_4
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_4
    .catch Ler; {:try_start_4 .. :try_end_4} :catch_0

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :pswitch_6
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    const/4 p2, 0x3

    .line 141
    if-eqz p1, :cond_4

    .line 142
    .line 143
    :try_start_5
    iput-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 144
    .line 145
    iput-boolean p1, v0, Lru;->q:Z

    .line 146
    .line 147
    iput v2, v0, Lru;->u:I

    .line 148
    .line 149
    iget-object v1, p0, Lwu;->j:Lgb1;

    .line 150
    .line 151
    invoke-virtual {v1}, Lgb1;->getValue()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Lk30;

    .line 156
    .line 157
    new-instance v6, Lhu;

    .line 158
    .line 159
    invoke-direct {v6, p2, v4}, Lhu;-><init>(ILiq;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, v6, v0}, Lk30;->a(Lhu;Lkq;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    if-ne p2, v5, :cond_1

    .line 167
    .line 168
    goto/16 :goto_9

    .line 169
    .line 170
    :cond_1
    :goto_1
    if-eqz p2, :cond_2

    .line 171
    .line 172
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_2

    .line 177
    :cond_2
    move v1, v3

    .line 178
    :goto_2
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    iput-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 183
    .line 184
    iput-object p2, v0, Lru;->n:Ljava/lang/Object;

    .line 185
    .line 186
    iput-boolean p1, v0, Lru;->q:Z

    .line 187
    .line 188
    iput v1, v0, Lru;->r:I

    .line 189
    .line 190
    const/4 v7, 0x2

    .line 191
    iput v7, v0, Lru;->u:I

    .line 192
    .line 193
    invoke-interface {v6, v0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v6
    :try_end_5
    .catch Ler; {:try_start_5 .. :try_end_5} :catch_0

    .line 197
    if-ne v6, v5, :cond_3

    .line 198
    .line 199
    goto/16 :goto_9

    .line 200
    .line 201
    :cond_3
    move-object v9, v6

    .line 202
    move-object v6, p0

    .line 203
    move p0, v1

    .line 204
    move-object v1, p2

    .line 205
    move-object p2, v9

    .line 206
    :goto_3
    :try_start_6
    check-cast p2, Ljava/lang/Number;

    .line 207
    .line 208
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    new-instance v7, Lpt;

    .line 213
    .line 214
    invoke-direct {v7, p0, v1, p2}, Lpt;-><init>(ILjava/lang/Object;I)V
    :try_end_6
    .catch Ler; {:try_start_6 .. :try_end_6} :catch_1

    .line 215
    .line 216
    .line 217
    return-object v7

    .line 218
    :cond_4
    :try_start_7
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    iput-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 223
    .line 224
    iput-boolean p1, v0, Lru;->q:Z

    .line 225
    .line 226
    iput p2, v0, Lru;->u:I

    .line 227
    .line 228
    invoke-interface {v1, v0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    if-ne p2, v5, :cond_5

    .line 233
    .line 234
    goto/16 :goto_9

    .line 235
    .line 236
    :cond_5
    :goto_4
    check-cast p2, Ljava/lang/Number;

    .line 237
    .line 238
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    invoke-virtual {p0}, Lwu;->c()Lef0;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    new-instance v6, Lqu;

    .line 247
    .line 248
    invoke-direct {v6, p0, p2, v4, v2}, Lqu;-><init>(Lwu;ILiq;I)V

    .line 249
    .line 250
    .line 251
    iput-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 252
    .line 253
    iput-boolean p1, v0, Lru;->q:Z

    .line 254
    .line 255
    const/4 p2, 0x4

    .line 256
    iput p2, v0, Lru;->u:I

    .line 257
    .line 258
    invoke-interface {v1, v6, v0}, Lef0;->d(Lf90;Lkq;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object p2

    .line 262
    if-ne p2, v5, :cond_6

    .line 263
    .line 264
    goto :goto_9

    .line 265
    :cond_6
    :goto_5
    check-cast p2, Lpt;
    :try_end_7
    .catch Ler; {:try_start_7 .. :try_end_7} :catch_0

    .line 266
    .line 267
    return-object p2

    .line 268
    :goto_6
    new-instance v1, Lhz0;

    .line 269
    .line 270
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 271
    .line 272
    .line 273
    iget-object v6, p0, Lwu;->b:Lpa0;

    .line 274
    .line 275
    iput-object p0, v0, Lru;->m:Ljava/lang/Object;

    .line 276
    .line 277
    iput-object p2, v0, Lru;->n:Ljava/lang/Object;

    .line 278
    .line 279
    iput-object v1, v0, Lru;->o:Ljava/io/Serializable;

    .line 280
    .line 281
    iput-object v1, v0, Lru;->p:Lhz0;

    .line 282
    .line 283
    iput-boolean p1, v0, Lru;->q:Z

    .line 284
    .line 285
    const/4 v7, 0x5

    .line 286
    iput v7, v0, Lru;->u:I

    .line 287
    .line 288
    iget-object v6, v6, Lpa0;->k:Ljava/lang/Object;

    .line 289
    .line 290
    check-cast v6, Lr80;

    .line 291
    .line 292
    invoke-interface {v6, p2}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    if-ne v6, v5, :cond_7

    .line 297
    .line 298
    goto :goto_9

    .line 299
    :cond_7
    move-object v7, v6

    .line 300
    move-object v6, p2

    .line 301
    move-object p2, v7

    .line 302
    move-object v7, p0

    .line 303
    move p0, p1

    .line 304
    move-object p1, v1

    .line 305
    :goto_7
    iput-object p2, p1, Lhz0;->j:Ljava/lang/Object;

    .line 306
    .line 307
    new-instance p1, Lfz0;

    .line 308
    .line 309
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 310
    .line 311
    .line 312
    :try_start_8
    new-instance p2, Lsu;

    .line 313
    .line 314
    invoke-direct {p2, v1, v7, p1, v4}, Lsu;-><init>(Lhz0;Lwu;Lfz0;Liq;)V

    .line 315
    .line 316
    .line 317
    iput-object v6, v0, Lru;->m:Ljava/lang/Object;

    .line 318
    .line 319
    iput-object v1, v0, Lru;->n:Ljava/lang/Object;

    .line 320
    .line 321
    iput-object p1, v0, Lru;->o:Ljava/io/Serializable;

    .line 322
    .line 323
    iput-object v4, v0, Lru;->p:Lhz0;

    .line 324
    .line 325
    const/4 v8, 0x6

    .line 326
    iput v8, v0, Lru;->u:I

    .line 327
    .line 328
    if-eqz p0, :cond_8

    .line 329
    .line 330
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 331
    .line 332
    .line 333
    invoke-virtual {p2, v0}, Lsu;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    goto :goto_8

    .line 338
    :cond_8
    invoke-virtual {v7}, Lwu;->c()Lef0;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    new-instance v7, Lwt;

    .line 343
    .line 344
    invoke-direct {v7, p2, v4, v2}, Lwt;-><init>(Ljava/lang/Object;Liq;I)V

    .line 345
    .line 346
    .line 347
    invoke-interface {p0, v7, v0}, Lef0;->a(Lr80;Lkq;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 351
    :goto_8
    if-ne p0, v5, :cond_9

    .line 352
    .line 353
    :goto_9
    return-object v5

    .line 354
    :cond_9
    move-object p0, p1

    .line 355
    move-object p1, v1

    .line 356
    :goto_a
    new-instance p2, Lpt;

    .line 357
    .line 358
    iget-object p1, p1, Lhz0;->j:Ljava/lang/Object;

    .line 359
    .line 360
    if-eqz p1, :cond_a

    .line 361
    .line 362
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 363
    .line 364
    .line 365
    move-result v3

    .line 366
    :cond_a
    iget p0, p0, Lfz0;->j:I

    .line 367
    .line 368
    invoke-direct {p2, v3, p1, p0}, Lpt;-><init>(ILjava/lang/Object;I)V

    .line 369
    .line 370
    .line 371
    return-object p2

    .line 372
    :goto_b
    move-object v0, v6

    .line 373
    goto :goto_c

    .line 374
    :catchall_1
    move-exception p0

    .line 375
    goto :goto_b

    .line 376
    :goto_c
    invoke-static {v0, p0}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 377
    .line 378
    .line 379
    throw v0

    .line 380
    nop

    .line 381
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final i(Ljava/lang/Object;ZLkq;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p3, Luu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Luu;

    .line 7
    .line 8
    iget v1, v0, Luu;->p:I

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
    iput v1, v0, Luu;->p:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Luu;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Luu;-><init>(Lwu;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Luu;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Luu;->p:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p0, v0, Luu;->m:Lfz0;

    .line 35
    .line 36
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 41
    .line 42
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0

    .line 47
    :cond_2
    invoke-static {p3}, Lk42;->n(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Lfz0;

    .line 51
    .line 52
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Lwu;->j:Lgb1;

    .line 56
    .line 57
    invoke-virtual {p3}, Lgb1;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    check-cast p3, Lk30;

    .line 62
    .line 63
    new-instance v3, Lvu;

    .line 64
    .line 65
    const/4 v8, 0x0

    .line 66
    move-object v5, p0

    .line 67
    move-object v6, p1

    .line 68
    move v7, p2

    .line 69
    invoke-direct/range {v3 .. v8}, Lvu;-><init>(Lfz0;Lwu;Ljava/lang/Object;ZLiq;)V

    .line 70
    .line 71
    .line 72
    iput-object v4, v0, Luu;->m:Lfz0;

    .line 73
    .line 74
    iput v2, v0, Luu;->p:I

    .line 75
    .line 76
    invoke-virtual {p3, v3, v0}, Lk30;->b(Lvu;Lkq;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget-object p1, Lar;->j:Lar;

    .line 81
    .line 82
    if-ne p0, p1, :cond_3

    .line 83
    .line 84
    return-object p1

    .line 85
    :cond_3
    move-object p0, v4

    .line 86
    :goto_1
    iget p0, p0, Lfz0;->j:I

    .line 87
    .line 88
    new-instance p1, Ljava/lang/Integer;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(I)V

    .line 91
    .line 92
    .line 93
    return-object p1
.end method
