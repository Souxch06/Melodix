.class public final Lt91;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr50;
.implements Lq90;
.implements Ls50;


# static fields
.field public static final synthetic n:J


# instance fields
.field private volatile synthetic _state$volatile:Ljava/lang/Object;

.field public j:[Lu91;

.field public k:I

.field public l:I

.field public m:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    const-class v1, Lt91;

    .line 4
    .line 5
    const-string v2, "_state$volatile"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sput-wide v0, Lt91;->n:J

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt91;->_state$volatile:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 3
    .line 4
    sget-wide v1, Lt91;->n:J

    .line 5
    .line 6
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    const/4 v4, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {v3, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return v4

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto/16 :goto_5

    .line 23
    .line 24
    :cond_0
    :try_start_1
    invoke-static {v3, p2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    const/4 v3, 0x1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return v3

    .line 33
    :cond_1
    :try_start_2
    invoke-virtual {v0, p0, v1, v2, p2}, Lsun/misc/Unsafe;->putObjectVolatile(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget p1, p0, Lt91;->m:I

    .line 37
    .line 38
    and-int/lit8 p2, p1, 0x1

    .line 39
    .line 40
    if-nez p2, :cond_b

    .line 41
    .line 42
    add-int/2addr p1, v3

    .line 43
    iput p1, p0, Lt91;->m:I

    .line 44
    .line 45
    iget-object p2, p0, Lt91;->j:[Lu91;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    .line 47
    monitor-exit p0

    .line 48
    :goto_0
    if-eqz p2, :cond_9

    .line 49
    .line 50
    array-length v0, p2

    .line 51
    move v1, v4

    .line 52
    :goto_1
    if-ge v1, v0, :cond_9

    .line 53
    .line 54
    aget-object v2, p2, v1

    .line 55
    .line 56
    if-eqz v2, :cond_8

    .line 57
    .line 58
    iget-object v2, v2, Lu91;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 59
    .line 60
    :goto_2
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    if-nez v5, :cond_2

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_2
    sget-object v6, Lml;->f:Log0;

    .line 68
    .line 69
    if-ne v5, v6, :cond_3

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_3
    sget-object v7, Lml;->e:Log0;

    .line 73
    .line 74
    if-ne v5, v7, :cond_6

    .line 75
    .line 76
    :cond_4
    invoke-virtual {v2, v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    if-eqz v7, :cond_5

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_5
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    if-eq v7, v5, :cond_4

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_6
    invoke-virtual {v2, v5, v7}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_7

    .line 95
    .line 96
    check-cast v5, Lvi;

    .line 97
    .line 98
    sget-object v2, Lwe1;->a:Lwe1;

    .line 99
    .line 100
    invoke-virtual {v5, v2}, Lvi;->d(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_7
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    if-eq v6, v5, :cond_6

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_8
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_9
    monitor-enter p0

    .line 115
    :try_start_3
    iget p2, p0, Lt91;->m:I

    .line 116
    .line 117
    if-ne p2, p1, :cond_a

    .line 118
    .line 119
    add-int/2addr p1, v3

    .line 120
    iput p1, p0, Lt91;->m:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 121
    .line 122
    monitor-exit p0

    .line 123
    return v3

    .line 124
    :catchall_1
    move-exception p1

    .line 125
    goto :goto_4

    .line 126
    :cond_a
    :try_start_4
    iget-object p1, p0, Lt91;->j:[Lu91;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 127
    .line 128
    monitor-exit p0

    .line 129
    move v8, p2

    .line 130
    move-object p2, p1

    .line 131
    move p1, v8

    .line 132
    goto :goto_0

    .line 133
    :goto_4
    monitor-exit p0

    .line 134
    throw p1

    .line 135
    :cond_b
    add-int/lit8 p1, p1, 0x2

    .line 136
    .line 137
    :try_start_5
    iput p1, p0, Lt91;->m:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 138
    .line 139
    monitor-exit p0

    .line 140
    return v3

    .line 141
    :goto_5
    monitor-exit p0

    .line 142
    throw p1
.end method

.method public final d(Lsq;ILfh;)Lr50;
    .locals 7

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ge p2, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, -0x2

    .line 8
    if-ne p2, v0, :cond_1

    .line 9
    .line 10
    :goto_0
    sget-object v0, Lfh;->k:Lfh;

    .line 11
    .line 12
    if-ne p3, v0, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    if-eqz p2, :cond_2

    .line 16
    .line 17
    const/4 v0, -0x3

    .line 18
    if-ne p2, v0, :cond_3

    .line 19
    .line 20
    :cond_2
    sget-object v0, Lfh;->j:Lfh;

    .line 21
    .line 22
    if-ne p3, v0, :cond_3

    .line 23
    .line 24
    :goto_1
    return-object p0

    .line 25
    :cond_3
    new-instance v1, Lpj;

    .line 26
    .line 27
    const/4 v6, 0x1

    .line 28
    move-object v2, p0

    .line 29
    move-object v3, p1

    .line 30
    move v4, p2

    .line 31
    move-object v5, p3

    .line 32
    invoke-direct/range {v1 .. v6}, Lpj;-><init>(Ljava/lang/Object;Lsq;ILfh;I)V

    .line 33
    .line 34
    .line 35
    return-object v1
.end method

.method public final h(Ljava/lang/Object;Liq;)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lqe0;->d:Log0;

    .line 4
    .line 5
    :cond_0
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p2, p1}, Lt91;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    sget-object p0, Lwe1;->a:Lwe1;

    .line 10
    .line 11
    return-object p0
.end method

.method public final q(Ls50;Lkq;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    instance-of v2, v0, Ls91;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    move-object v2, v0

    .line 10
    check-cast v2, Ls91;

    .line 11
    .line 12
    iget v3, v2, Ls91;->t:I

    .line 13
    .line 14
    const/high16 v4, -0x80000000

    .line 15
    .line 16
    and-int v5, v3, v4

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    sub-int/2addr v3, v4

    .line 21
    iput v3, v2, Ls91;->t:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v2, Ls91;

    .line 25
    .line 26
    invoke-direct {v2, v1, v0}, Ls91;-><init>(Lt91;Lkq;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, v2, Ls91;->r:Ljava/lang/Object;

    .line 30
    .line 31
    sget-object v3, Lar;->j:Lar;

    .line 32
    .line 33
    iget v4, v2, Ls91;->t:I

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    const/4 v6, 0x0

    .line 37
    const/4 v7, 0x0

    .line 38
    const/4 v8, 0x2

    .line 39
    const/4 v9, 0x1

    .line 40
    if-eqz v4, :cond_4

    .line 41
    .line 42
    if-eq v4, v9, :cond_3

    .line 43
    .line 44
    if-eq v4, v8, :cond_2

    .line 45
    .line 46
    if-ne v4, v5, :cond_1

    .line 47
    .line 48
    iget-object v1, v2, Ls91;->q:Ljava/lang/Object;

    .line 49
    .line 50
    iget-object v4, v2, Ls91;->p:Lng0;

    .line 51
    .line 52
    iget-object v10, v2, Ls91;->o:Lu91;

    .line 53
    .line 54
    iget-object v11, v2, Ls91;->n:Ls50;

    .line 55
    .line 56
    iget-object v12, v2, Ls91;->m:Lt91;

    .line 57
    .line 58
    :try_start_0
    invoke-static {v0}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    .line 61
    move-object v0, v1

    .line 62
    goto/16 :goto_b

    .line 63
    .line 64
    :catchall_0
    move-exception v0

    .line 65
    goto/16 :goto_c

    .line 66
    .line 67
    :cond_1
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 68
    .line 69
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object v6

    .line 73
    :cond_2
    iget-object v1, v2, Ls91;->q:Ljava/lang/Object;

    .line 74
    .line 75
    iget-object v4, v2, Ls91;->p:Lng0;

    .line 76
    .line 77
    iget-object v10, v2, Ls91;->o:Lu91;

    .line 78
    .line 79
    iget-object v11, v2, Ls91;->n:Ls50;

    .line 80
    .line 81
    iget-object v12, v2, Ls91;->m:Lt91;

    .line 82
    .line 83
    :try_start_1
    invoke-static {v0}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    .line 85
    .line 86
    goto/16 :goto_7

    .line 87
    .line 88
    :cond_3
    iget-object v10, v2, Ls91;->o:Lu91;

    .line 89
    .line 90
    iget-object v1, v2, Ls91;->n:Ls50;

    .line 91
    .line 92
    iget-object v4, v2, Ls91;->m:Lt91;

    .line 93
    .line 94
    :try_start_2
    invoke-static {v0}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 95
    .line 96
    .line 97
    move-object v0, v1

    .line 98
    move-object v1, v4

    .line 99
    goto :goto_3

    .line 100
    :catchall_1
    move-exception v0

    .line 101
    move-object v12, v4

    .line 102
    goto/16 :goto_c

    .line 103
    .line 104
    :cond_4
    invoke-static {v0}, Lk42;->n(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    monitor-enter p0

    .line 108
    :try_start_3
    iget-object v0, v1, Lt91;->j:[Lu91;

    .line 109
    .line 110
    if-nez v0, :cond_5

    .line 111
    .line 112
    new-array v0, v8, [Lu91;

    .line 113
    .line 114
    iput-object v0, v1, Lt91;->j:[Lu91;

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :catchall_2
    move-exception v0

    .line 118
    goto/16 :goto_f

    .line 119
    .line 120
    :cond_5
    iget v4, v1, Lt91;->k:I

    .line 121
    .line 122
    array-length v10, v0

    .line 123
    if-lt v4, v10, :cond_6

    .line 124
    .line 125
    array-length v4, v0

    .line 126
    mul-int/2addr v4, v8

    .line 127
    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    move-object v4, v0

    .line 132
    check-cast v4, [Lu91;

    .line 133
    .line 134
    iput-object v4, v1, Lt91;->j:[Lu91;

    .line 135
    .line 136
    check-cast v0, [Lu91;

    .line 137
    .line 138
    :cond_6
    :goto_1
    iget v4, v1, Lt91;->l:I

    .line 139
    .line 140
    :goto_2
    aget-object v10, v0, v4

    .line 141
    .line 142
    if-nez v10, :cond_7

    .line 143
    .line 144
    new-instance v10, Lu91;

    .line 145
    .line 146
    invoke-direct {v10}, Lu91;-><init>()V

    .line 147
    .line 148
    .line 149
    aput-object v10, v0, v4

    .line 150
    .line 151
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 152
    .line 153
    array-length v11, v0

    .line 154
    if-lt v4, v11, :cond_8

    .line 155
    .line 156
    move v4, v7

    .line 157
    :cond_8
    iget-object v11, v10, Lu91;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 158
    .line 159
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    if-eqz v12, :cond_9

    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_9
    sget-object v0, Lml;->e:Log0;

    .line 167
    .line 168
    invoke-virtual {v11, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    iput v4, v1, Lt91;->l:I

    .line 172
    .line 173
    iget v0, v1, Lt91;->k:I

    .line 174
    .line 175
    add-int/2addr v0, v9

    .line 176
    iput v0, v1, Lt91;->k:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 177
    .line 178
    monitor-exit p0

    .line 179
    move-object/from16 v0, p1

    .line 180
    .line 181
    :goto_3
    :try_start_4
    iget-object v4, v2, Lkq;->k:Lsq;

    .line 182
    .line 183
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    sget-object v11, Ltb0;->n:Ltb0;

    .line 187
    .line 188
    invoke-interface {v4, v11}, Lsq;->j(Lrq;)Lqq;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    check-cast v4, Lng0;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 193
    .line 194
    move-object v11, v0

    .line 195
    move-object v12, v1

    .line 196
    move-object v0, v6

    .line 197
    :goto_4
    if-eqz v12, :cond_15

    .line 198
    .line 199
    :try_start_5
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 200
    .line 201
    sget-wide v13, Lt91;->n:J

    .line 202
    .line 203
    invoke-virtual {v1, v12, v13, v14}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    if-eqz v4, :cond_b

    .line 208
    .line 209
    invoke-virtual {v4}, Lng0;->F()Z

    .line 210
    .line 211
    .line 212
    move-result v13

    .line 213
    if-eqz v13, :cond_a

    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_a
    invoke-virtual {v4}, Lng0;->w()Ljava/util/concurrent/CancellationException;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    throw v0

    .line 221
    :cond_b
    :goto_5
    if-eqz v0, :cond_c

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v13

    .line 227
    if-nez v13, :cond_f

    .line 228
    .line 229
    :cond_c
    sget-object v0, Lqe0;->d:Log0;

    .line 230
    .line 231
    if-ne v1, v0, :cond_d

    .line 232
    .line 233
    move-object v0, v6

    .line 234
    goto :goto_6

    .line 235
    :cond_d
    move-object v0, v1

    .line 236
    :goto_6
    iput-object v12, v2, Ls91;->m:Lt91;

    .line 237
    .line 238
    iput-object v11, v2, Ls91;->n:Ls50;

    .line 239
    .line 240
    iput-object v10, v2, Ls91;->o:Lu91;

    .line 241
    .line 242
    iput-object v4, v2, Ls91;->p:Lng0;

    .line 243
    .line 244
    iput-object v1, v2, Ls91;->q:Ljava/lang/Object;

    .line 245
    .line 246
    iput v8, v2, Ls91;->t:I

    .line 247
    .line 248
    invoke-interface {v11, v0, v2}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    if-ne v0, v3, :cond_e

    .line 253
    .line 254
    goto :goto_a

    .line 255
    :cond_e
    :goto_7
    move-object v0, v1

    .line 256
    :cond_f
    iget-object v1, v10, Lu91;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 257
    .line 258
    sget-object v13, Lml;->e:Log0;

    .line 259
    .line 260
    invoke-virtual {v1, v13}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    sget-object v14, Lml;->f:Log0;

    .line 268
    .line 269
    if-ne v1, v14, :cond_10

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_10
    iput-object v12, v2, Ls91;->m:Lt91;

    .line 273
    .line 274
    iput-object v11, v2, Ls91;->n:Ls50;

    .line 275
    .line 276
    iput-object v10, v2, Ls91;->o:Lu91;

    .line 277
    .line 278
    iput-object v4, v2, Ls91;->p:Lng0;

    .line 279
    .line 280
    iput-object v0, v2, Ls91;->q:Ljava/lang/Object;

    .line 281
    .line 282
    iput v5, v2, Ls91;->t:I

    .line 283
    .line 284
    sget-object v1, Lwe1;->a:Lwe1;

    .line 285
    .line 286
    new-instance v14, Lvi;

    .line 287
    .line 288
    invoke-static {v2}, Lqe0;->i(Liq;)Liq;

    .line 289
    .line 290
    .line 291
    move-result-object v15

    .line 292
    invoke-direct {v14, v9, v15}, Lvi;-><init>(ILiq;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v14}, Lvi;->t()V

    .line 296
    .line 297
    .line 298
    iget-object v15, v10, Lu91;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 299
    .line 300
    :goto_8
    invoke-virtual {v15, v13, v14}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v16

    .line 304
    if-eqz v16, :cond_11

    .line 305
    .line 306
    goto :goto_9

    .line 307
    :cond_11
    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    if-eq v5, v13, :cond_14

    .line 312
    .line 313
    invoke-virtual {v14, v1}, Lvi;->d(Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    :goto_9
    invoke-virtual {v14}, Lvi;->s()Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v5

    .line 320
    sget-object v13, Lar;->j:Lar;

    .line 321
    .line 322
    if-ne v5, v13, :cond_12

    .line 323
    .line 324
    move-object v1, v5

    .line 325
    :cond_12
    if-ne v1, v3, :cond_13

    .line 326
    .line 327
    :goto_a
    return-object v3

    .line 328
    :cond_13
    :goto_b
    const/4 v5, 0x3

    .line 329
    goto/16 :goto_4

    .line 330
    .line 331
    :cond_14
    const/4 v5, 0x3

    .line 332
    goto :goto_8

    .line 333
    :cond_15
    new-instance v0, Ljava/lang/ClassCastException;

    .line 334
    .line 335
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 336
    .line 337
    .line 338
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 339
    :catchall_3
    move-exception v0

    .line 340
    move-object v12, v1

    .line 341
    :goto_c
    monitor-enter v12

    .line 342
    :try_start_6
    iget v1, v12, Lt91;->k:I

    .line 343
    .line 344
    add-int/lit8 v1, v1, -0x1

    .line 345
    .line 346
    iput v1, v12, Lt91;->k:I

    .line 347
    .line 348
    if-nez v1, :cond_16

    .line 349
    .line 350
    iput v7, v12, Lt91;->l:I

    .line 351
    .line 352
    goto :goto_d

    .line 353
    :catchall_4
    move-exception v0

    .line 354
    goto :goto_e

    .line 355
    :cond_16
    :goto_d
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    .line 357
    .line 358
    iget-object v1, v10, Lu91;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 359
    .line 360
    invoke-virtual {v1, v6}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 361
    .line 362
    .line 363
    monitor-exit v12

    .line 364
    throw v0

    .line 365
    :goto_e
    monitor-exit v12

    .line 366
    throw v0

    .line 367
    :goto_f
    monitor-exit p0

    .line 368
    throw v0
.end method
