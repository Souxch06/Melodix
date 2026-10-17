.class public Lv31;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final synthetic b:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic c:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic d:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

.field public static final synthetic e:J

.field public static final synthetic f:J

.field public static final synthetic g:J


# instance fields
.field private volatile synthetic _availablePermits$volatile:I

.field public final a:Lui;

.field private volatile synthetic deqIdx$volatile:J

.field private volatile synthetic enqIdx$volatile:J

.field private volatile synthetic head$volatile:Ljava/lang/Object;

.field private volatile synthetic tail$volatile:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    const-class v1, Lv31;

    .line 4
    .line 5
    const-string v2, "head$volatile"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    sput-wide v2, Lv31;->f:J

    .line 16
    .line 17
    const-string v2, "deqIdx$volatile"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sput-object v2, Lv31;->b:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 24
    .line 25
    const-string v2, "tail$volatile"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    sput-wide v2, Lv31;->g:J

    .line 36
    .line 37
    const-string v2, "enqIdx$volatile"

    .line 38
    .line 39
    invoke-static {v1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sput-object v2, Lv31;->c:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 44
    .line 45
    const-string v2, "_availablePermits$volatile"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sput-object v3, Lv31;->d:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    sput-wide v0, Lv31;->e:J

    .line 62
    .line 63
    return-void
.end method

.method public constructor <init>(I)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Lx31;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x2

    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    invoke-direct {v1, v4, v5, v2, v3}, Lx31;-><init>(JLx31;I)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lv31;->head$volatile:Ljava/lang/Object;

    .line 19
    .line 20
    iput-object v1, p0, Lv31;->tail$volatile:Ljava/lang/Object;

    .line 21
    .line 22
    sub-int/2addr v0, p1

    .line 23
    iput v0, p0, Lv31;->_availablePermits$volatile:I

    .line 24
    .line 25
    new-instance p1, Lui;

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    invoke-direct {p1, v0, p0}, Lui;-><init>(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lv31;->a:Lui;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p0, "The number of acquired permits should be in 0..1"

    .line 35
    .line 36
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    throw p0
.end method


# virtual methods
.method public final a(Lyo0;)V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    iget-object v7, v6, Lyo0;->j:Lvi;

    .line 6
    .line 7
    iget-object v8, v6, Lyo0;->k:Lzo0;

    .line 8
    .line 9
    :cond_0
    :goto_0
    sget-object v0, Lv31;->d:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->getAndDecrement(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-gt v0, v2, :cond_0

    .line 17
    .line 18
    const/4 v9, 0x0

    .line 19
    sget-object v10, Lwe1;->a:Lwe1;

    .line 20
    .line 21
    const/4 v11, 0x0

    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lzo0;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 25
    .line 26
    invoke-virtual {v0, v8, v11}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Lm;

    .line 30
    .line 31
    invoke-direct {v0, v8, v6}, Lm;-><init>(Lzo0;Lyo0;)V

    .line 32
    .line 33
    .line 34
    iget v1, v7, Ley;->l:I

    .line 35
    .line 36
    new-instance v2, Lui;

    .line 37
    .line 38
    invoke-direct {v2, v9, v0}, Lui;-><init>(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v7, v10, v1, v2}, Lvi;->B(Ljava/lang/Object;ILg90;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 46
    .line 47
    sget-wide v12, Lv31;->g:J

    .line 48
    .line 49
    invoke-virtual {v0, v1, v12, v13}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    move-object v14, v0

    .line 54
    check-cast v14, Lx31;

    .line 55
    .line 56
    sget-object v0, Lv31;->c:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v15

    .line 62
    sget-object v0, Lt31;->r:Lt31;

    .line 63
    .line 64
    sget v2, Lw31;->f:I

    .line 65
    .line 66
    int-to-long v2, v2

    .line 67
    div-long v2, v15, v2

    .line 68
    .line 69
    :goto_1
    invoke-static {v14, v2, v3, v0}, Lqe0;->e(Lq31;JLf90;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v17

    .line 73
    invoke-static/range {v17 .. v17}, Lxg;->l(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-nez v4, :cond_7

    .line 78
    .line 79
    invoke-static/range {v17 .. v17}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    :goto_2
    sget-object v4, Lja;->a:Lsun/misc/Unsafe;

    .line 84
    .line 85
    invoke-virtual {v4, v1, v12, v13}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lq31;

    .line 90
    .line 91
    move-object/from16 v18, v10

    .line 92
    .line 93
    iget-wide v9, v4, Lq31;->d:J

    .line 94
    .line 95
    move-wide/from16 v19, v12

    .line 96
    .line 97
    iget-wide v11, v5, Lq31;->d:J

    .line 98
    .line 99
    cmp-long v9, v9, v11

    .line 100
    .line 101
    if-ltz v9, :cond_2

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_2
    invoke-virtual {v5}, Lq31;->i()Z

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    if-nez v9, :cond_3

    .line 109
    .line 110
    move-object/from16 v10, v18

    .line 111
    .line 112
    move-wide/from16 v12, v19

    .line 113
    .line 114
    const/4 v9, 0x0

    .line 115
    const/4 v11, 0x0

    .line 116
    goto :goto_1

    .line 117
    :cond_3
    move-object v9, v0

    .line 118
    :goto_3
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 119
    .line 120
    move-wide v10, v2

    .line 121
    sget-wide v2, Lv31;->g:J

    .line 122
    .line 123
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_4

    .line 128
    .line 129
    invoke-virtual {v4}, Lq31;->e()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    invoke-virtual {v4}, Lsm;->d()V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_4
    move-wide/from16 v2, v19

    .line 140
    .line 141
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    if-eq v0, v4, :cond_6

    .line 146
    .line 147
    invoke-virtual {v5}, Lq31;->e()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_5

    .line 152
    .line 153
    invoke-virtual {v5}, Lsm;->d()V

    .line 154
    .line 155
    .line 156
    :cond_5
    move-wide v12, v2

    .line 157
    move-object v0, v9

    .line 158
    move-wide v2, v10

    .line 159
    move-object/from16 v10, v18

    .line 160
    .line 161
    const/4 v9, 0x0

    .line 162
    const/4 v11, 0x0

    .line 163
    goto :goto_2

    .line 164
    :cond_6
    move-wide/from16 v19, v2

    .line 165
    .line 166
    move-wide v2, v10

    .line 167
    goto :goto_3

    .line 168
    :cond_7
    move-object/from16 v18, v10

    .line 169
    .line 170
    :cond_8
    :goto_4
    invoke-static/range {v17 .. v17}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Lx31;

    .line 175
    .line 176
    iget-object v2, v0, Lx31;->g:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 177
    .line 178
    sget v3, Lw31;->f:I

    .line 179
    .line 180
    int-to-long v3, v3

    .line 181
    rem-long v3, v15, v3

    .line 182
    .line 183
    long-to-int v3, v3

    .line 184
    :cond_9
    const/4 v4, 0x0

    .line 185
    invoke-virtual {v2, v3, v4, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    if-eqz v5, :cond_a

    .line 190
    .line 191
    invoke-interface {v6, v0, v3}, Lui1;->a(Lq31;I)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_a
    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    if-eqz v4, :cond_9

    .line 200
    .line 201
    sget-object v4, Lw31;->b:Log0;

    .line 202
    .line 203
    sget-object v5, Lw31;->c:Log0;

    .line 204
    .line 205
    :goto_5
    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_b

    .line 210
    .line 211
    sget-object v0, Lzo0;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 212
    .line 213
    const/4 v9, 0x0

    .line 214
    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    new-instance v0, Lm;

    .line 218
    .line 219
    invoke-direct {v0, v8, v6}, Lm;-><init>(Lzo0;Lyo0;)V

    .line 220
    .line 221
    .line 222
    iget v1, v7, Ley;->l:I

    .line 223
    .line 224
    new-instance v2, Lui;

    .line 225
    .line 226
    const/4 v10, 0x0

    .line 227
    invoke-direct {v2, v10, v0}, Lui;-><init>(ILjava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    move-object/from16 v11, v18

    .line 231
    .line 232
    invoke-virtual {v7, v11, v1, v2}, Lvi;->B(Ljava/lang/Object;ILg90;)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_b
    move-object/from16 v11, v18

    .line 237
    .line 238
    const/4 v9, 0x0

    .line 239
    const/4 v10, 0x0

    .line 240
    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    if-eq v0, v4, :cond_c

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_c
    move-object/from16 v18, v11

    .line 249
    .line 250
    goto :goto_5
.end method

.method public final b()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    :cond_0
    sget-object v0, Lv31;->d:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->getAndIncrement(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v6, 0x1

    .line 10
    if-ge v0, v6, :cond_12

    .line 11
    .line 12
    if-ltz v0, :cond_1

    .line 13
    .line 14
    goto/16 :goto_9

    .line 15
    .line 16
    :cond_1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 17
    .line 18
    sget-wide v7, Lv31;->f:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v7, v8}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    move-object v9, v0

    .line 25
    check-cast v9, Lx31;

    .line 26
    .line 27
    sget-object v0, Lv31;->b:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v10

    .line 33
    sget v0, Lw31;->f:I

    .line 34
    .line 35
    int-to-long v2, v0

    .line 36
    div-long v12, v10, v2

    .line 37
    .line 38
    sget-object v14, Lu31;->r:Lu31;

    .line 39
    .line 40
    :goto_0
    invoke-static {v9, v12, v13, v14}, Lqe0;->e(Lq31;JLf90;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v15

    .line 44
    invoke-static {v15}, Lxg;->l(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_7

    .line 49
    .line 50
    invoke-static {v15}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    :goto_1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v7, v8}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    move-object v4, v0

    .line 61
    check-cast v4, Lq31;

    .line 62
    .line 63
    iget-wide v2, v4, Lq31;->d:J

    .line 64
    .line 65
    move/from16 v16, v6

    .line 66
    .line 67
    move-wide/from16 v17, v7

    .line 68
    .line 69
    iget-wide v6, v5, Lq31;->d:J

    .line 70
    .line 71
    cmp-long v0, v2, v6

    .line 72
    .line 73
    if-ltz v0, :cond_2

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_2
    invoke-virtual {v5}, Lq31;->i()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    move/from16 v6, v16

    .line 83
    .line 84
    move-wide/from16 v7, v17

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    :goto_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 88
    .line 89
    sget-wide v2, Lv31;->f:J

    .line 90
    .line 91
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    invoke-virtual {v4}, Lq31;->e()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    invoke-virtual {v4}, Lsm;->d()V

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_4
    move-wide/from16 v2, v17

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    if-eq v0, v4, :cond_6

    .line 114
    .line 115
    invoke-virtual {v5}, Lq31;->e()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    invoke-virtual {v5}, Lsm;->d()V

    .line 122
    .line 123
    .line 124
    :cond_5
    move-wide v7, v2

    .line 125
    move/from16 v6, v16

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_6
    move-wide/from16 v17, v2

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_7
    move/from16 v16, v6

    .line 132
    .line 133
    :cond_8
    :goto_3
    invoke-static {v15}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lx31;

    .line 138
    .line 139
    iget-object v2, v0, Lx31;->g:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 140
    .line 141
    invoke-virtual {v0}, Lsm;->a()V

    .line 142
    .line 143
    .line 144
    iget-wide v3, v0, Lq31;->d:J

    .line 145
    .line 146
    cmp-long v0, v3, v12

    .line 147
    .line 148
    const/4 v3, 0x0

    .line 149
    if-lez v0, :cond_a

    .line 150
    .line 151
    :cond_9
    :goto_4
    move v6, v3

    .line 152
    goto :goto_8

    .line 153
    :cond_a
    sget v0, Lw31;->f:I

    .line 154
    .line 155
    int-to-long v4, v0

    .line 156
    rem-long/2addr v10, v4

    .line 157
    long-to-int v0, v10

    .line 158
    sget-object v4, Lw31;->b:Log0;

    .line 159
    .line 160
    invoke-virtual {v2, v0, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    if-nez v4, :cond_f

    .line 165
    .line 166
    sget v4, Lw31;->a:I

    .line 167
    .line 168
    move v5, v3

    .line 169
    :goto_5
    if-ge v5, v4, :cond_c

    .line 170
    .line 171
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    sget-object v7, Lw31;->c:Log0;

    .line 176
    .line 177
    if-ne v6, v7, :cond_b

    .line 178
    .line 179
    :goto_6
    move/from16 v6, v16

    .line 180
    .line 181
    goto :goto_8

    .line 182
    :cond_b
    add-int/lit8 v5, v5, 0x1

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_c
    sget-object v5, Lw31;->b:Log0;

    .line 186
    .line 187
    sget-object v6, Lw31;->d:Log0;

    .line 188
    .line 189
    :cond_d
    invoke-virtual {v2, v0, v5, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    if-eqz v4, :cond_e

    .line 194
    .line 195
    move/from16 v3, v16

    .line 196
    .line 197
    goto :goto_7

    .line 198
    :cond_e
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    if-eq v4, v5, :cond_d

    .line 203
    .line 204
    :goto_7
    xor-int/lit8 v6, v3, 0x1

    .line 205
    .line 206
    goto :goto_8

    .line 207
    :cond_f
    sget-object v0, Lw31;->e:Log0;

    .line 208
    .line 209
    if-ne v4, v0, :cond_10

    .line 210
    .line 211
    goto :goto_4

    .line 212
    :cond_10
    instance-of v0, v4, Lti;

    .line 213
    .line 214
    if-eqz v0, :cond_11

    .line 215
    .line 216
    check-cast v4, Lti;

    .line 217
    .line 218
    sget-object v0, Lwe1;->a:Lwe1;

    .line 219
    .line 220
    iget-object v2, v1, Lv31;->a:Lui;

    .line 221
    .line 222
    invoke-interface {v4, v0, v2}, Lti;->i(Ljava/lang/Object;Lg90;)Log0;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    if-eqz v0, :cond_9

    .line 227
    .line 228
    invoke-interface {v4, v0}, Lti;->k(Ljava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    goto :goto_6

    .line 232
    :goto_8
    if-eqz v6, :cond_0

    .line 233
    .line 234
    :goto_9
    return-void

    .line 235
    :cond_11
    const-string v0, "unexpected: "

    .line 236
    .line 237
    invoke-static {v4, v0}, Lo40;->q(Ljava/lang/Object;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_12
    :goto_a
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 242
    .line 243
    sget-wide v2, Lv31;->e:J

    .line 244
    .line 245
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getIntVolatile(Ljava/lang/Object;J)I

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    const/4 v5, 0x1

    .line 250
    if-le v4, v5, :cond_13

    .line 251
    .line 252
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapInt(Ljava/lang/Object;JII)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_13

    .line 257
    .line 258
    move-object/from16 v1, p0

    .line 259
    .line 260
    goto :goto_a

    .line 261
    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 262
    .line 263
    const-string v1, "The number of released permits cannot be greater than 1"

    .line 264
    .line 265
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    throw v0
.end method
