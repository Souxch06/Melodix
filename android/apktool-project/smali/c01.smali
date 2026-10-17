.class public final Lc01;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ln61;


# static fields
.field public static final g:I

.field public static final h:Lkz0;


# instance fields
.field public final a:Lkc1;

.field public final b:Lh40;

.field public final c:Lv9;

.field public final d:Le01;

.field public final e:Lm61;

.field public final f:Lzo0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget v0, Lbz;->m:I

    .line 2
    .line 3
    const/16 v0, 0x18

    .line 4
    .line 5
    sget-object v1, Ldz;->o:Ldz;

    .line 6
    .line 7
    invoke-static {v0, v1}, Lbe2;->u(ILdz;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    sget-object v2, Ldz;->m:Ldz;

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Lbz;->d(JLdz;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    long-to-int v0, v0

    .line 18
    sput v0, Lc01;->g:I

    .line 19
    .line 20
    new-instance v0, Lkz0;

    .line 21
    .line 22
    const-string v1, "com/google/firebase/sessions//"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Lkz0;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lc01;->h:Lkz0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Lkc1;Lh40;Lv9;Le01;Lm61;)V
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lc01;->a:Lkc1;

    .line 20
    .line 21
    iput-object p2, p0, Lc01;->b:Lh40;

    .line 22
    .line 23
    iput-object p3, p0, Lc01;->c:Lv9;

    .line 24
    .line 25
    iput-object p4, p0, Lc01;->d:Le01;

    .line 26
    .line 27
    iput-object p5, p0, Lc01;->e:Lm61;

    .line 28
    .line 29
    invoke-static {}, Lbv;->a()Lzo0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lc01;->f:Lzo0;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lc01;->e:Lm61;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm61;->a()Lr41;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lr41;->a:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b()Ljava/lang/Double;
    .locals 0

    .line 1
    iget-object p0, p0, Lc01;->e:Lm61;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm61;->a()Lr41;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lr41;->b:Ljava/lang/Double;

    .line 8
    .line 9
    return-object p0
.end method

.method public final c(Liq;)Ljava/lang/Object;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    instance-of v3, v1, Lb01;

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    move-object v3, v1

    .line 12
    check-cast v3, Lb01;

    .line 13
    .line 14
    iget v4, v3, Lb01;->q:I

    .line 15
    .line 16
    const/high16 v5, -0x80000000

    .line 17
    .line 18
    and-int v6, v4, v5

    .line 19
    .line 20
    if-eqz v6, :cond_0

    .line 21
    .line 22
    sub-int/2addr v4, v5

    .line 23
    iput v4, v3, Lb01;->q:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v3, Lb01;

    .line 27
    .line 28
    check-cast v1, Lkq;

    .line 29
    .line 30
    invoke-direct {v3, v0, v1}, Lb01;-><init>(Lc01;Lkq;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v1, v3, Lb01;->o:Ljava/lang/Object;

    .line 34
    .line 35
    iget v4, v3, Lb01;->q:I

    .line 36
    .line 37
    sget-object v5, Lar;->j:Lar;

    .line 38
    .line 39
    const/4 v6, 0x3

    .line 40
    const/4 v7, 0x2

    .line 41
    const/4 v8, 0x1

    .line 42
    sget-object v9, Lwe1;->a:Lwe1;

    .line 43
    .line 44
    const/4 v10, 0x0

    .line 45
    if-eqz v4, :cond_4

    .line 46
    .line 47
    if-eq v4, v8, :cond_3

    .line 48
    .line 49
    if-eq v4, v7, :cond_2

    .line 50
    .line 51
    if-ne v4, v6, :cond_1

    .line 52
    .line 53
    iget-object v0, v3, Lb01;->m:Ljava/lang/Object;

    .line 54
    .line 55
    move-object v2, v0

    .line 56
    check-cast v2, Lzo0;

    .line 57
    .line 58
    :try_start_0
    invoke-static {v1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    .line 61
    goto/16 :goto_6

    .line 62
    .line 63
    :catchall_0
    move-exception v0

    .line 64
    goto/16 :goto_7

    .line 65
    .line 66
    :cond_1
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 67
    .line 68
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-object v10

    .line 72
    :cond_2
    iget-object v4, v3, Lb01;->n:Lzo0;

    .line 73
    .line 74
    iget-object v0, v3, Lb01;->m:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v0, Lc01;

    .line 77
    .line 78
    :try_start_1
    invoke-static {v1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :catchall_1
    move-exception v0

    .line 83
    move-object v2, v4

    .line 84
    goto/16 :goto_7

    .line 85
    .line 86
    :cond_3
    iget-object v0, v3, Lb01;->n:Lzo0;

    .line 87
    .line 88
    iget-object v4, v3, Lb01;->m:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v4, Lc01;

    .line 91
    .line 92
    invoke-static {v1}, Lk42;->n(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    move-object v1, v0

    .line 96
    move-object v0, v4

    .line 97
    goto :goto_1

    .line 98
    :cond_4
    invoke-static {v1}, Lk42;->n(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, v0, Lc01;->f:Lzo0;

    .line 102
    .line 103
    invoke-virtual {v1}, Lzo0;->c()Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-nez v4, :cond_5

    .line 108
    .line 109
    iget-object v4, v0, Lc01;->e:Lm61;

    .line 110
    .line 111
    invoke-virtual {v4}, Lm61;->b()Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    if-nez v4, :cond_5

    .line 116
    .line 117
    return-object v9

    .line 118
    :cond_5
    iput-object v0, v3, Lb01;->m:Ljava/lang/Object;

    .line 119
    .line 120
    iput-object v1, v3, Lb01;->n:Lzo0;

    .line 121
    .line 122
    iput v8, v3, Lb01;->q:I

    .line 123
    .line 124
    invoke-virtual {v1, v3}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    if-ne v4, v5, :cond_6

    .line 129
    .line 130
    goto/16 :goto_5

    .line 131
    .line 132
    :cond_6
    :goto_1
    :try_start_2
    iget-object v4, v0, Lc01;->e:Lm61;

    .line 133
    .line 134
    invoke-virtual {v4}, Lm61;->b()Z

    .line 135
    .line 136
    .line 137
    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 138
    if-nez v4, :cond_7

    .line 139
    .line 140
    invoke-virtual {v1, v10}, Lzo0;->f(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    return-object v9

    .line 144
    :cond_7
    :try_start_3
    sget-object v4, Lpe0;->c:Lt11;

    .line 145
    .line 146
    iget-object v11, v0, Lc01;->b:Lh40;

    .line 147
    .line 148
    iput-object v0, v3, Lb01;->m:Ljava/lang/Object;

    .line 149
    .line 150
    iput-object v1, v3, Lb01;->n:Lzo0;

    .line 151
    .line 152
    iput v7, v3, Lb01;->q:I

    .line 153
    .line 154
    invoke-virtual {v4, v11, v3}, Lt11;->g(Lh40;Lkq;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 158
    if-ne v4, v5, :cond_8

    .line 159
    .line 160
    goto/16 :goto_5

    .line 161
    .line 162
    :cond_8
    move-object/from16 v17, v4

    .line 163
    .line 164
    move-object v4, v1

    .line 165
    move-object/from16 v1, v17

    .line 166
    .line 167
    :goto_2
    :try_start_4
    check-cast v1, Lpe0;

    .line 168
    .line 169
    iget-object v1, v1, Lpe0;->a:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 175
    if-eqz v2, :cond_9

    .line 176
    .line 177
    invoke-virtual {v4, v10}, Lzo0;->f(Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    return-object v9

    .line 181
    :cond_9
    :try_start_5
    const-string v2, "X-Crashlytics-Installation-ID"

    .line 182
    .line 183
    new-instance v11, Lps0;

    .line 184
    .line 185
    invoke-direct {v11, v2, v1}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    const-string v1, "X-Crashlytics-Device-Model"

    .line 189
    .line 190
    new-instance v2, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    sget-object v12, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    sget-object v12, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    .line 211
    .line 212
    sget-object v12, Lc01;->h:Lkz0;

    .line 213
    .line 214
    invoke-virtual {v12, v2}, Lkz0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    new-instance v13, Lps0;

    .line 219
    .line 220
    invoke-direct {v13, v1, v2}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    const-string v1, "X-Crashlytics-OS-Build-Version"

    .line 224
    .line 225
    sget-object v2, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v12, v2}, Lkz0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    new-instance v14, Lps0;

    .line 235
    .line 236
    invoke-direct {v14, v1, v2}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    const-string v1, "X-Crashlytics-OS-Display-Version"

    .line 240
    .line 241
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v12, v2}, Lkz0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    new-instance v12, Lps0;

    .line 251
    .line 252
    invoke-direct {v12, v1, v2}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    const-string v1, "X-Crashlytics-API-Client-Version"

    .line 256
    .line 257
    iget-object v2, v0, Lc01;->c:Lv9;

    .line 258
    .line 259
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 260
    .line 261
    .line 262
    const-string v2, "3.0.5"

    .line 263
    .line 264
    new-instance v15, Lps0;

    .line 265
    .line 266
    invoke-direct {v15, v1, v2}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    filled-new-array {v11, v13, v14, v12, v15}, [Lps0;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    new-instance v13, Ljava/util/LinkedHashMap;

    .line 274
    .line 275
    const/4 v2, 0x5

    .line 276
    invoke-static {v2}, Lsl0;->I(I)I

    .line 277
    .line 278
    .line 279
    move-result v11

    .line 280
    invoke-direct {v13, v11}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 281
    .line 282
    .line 283
    const/4 v11, 0x0

    .line 284
    :goto_3
    if-ge v11, v2, :cond_a

    .line 285
    .line 286
    aget-object v12, v1, v11

    .line 287
    .line 288
    iget-object v14, v12, Lps0;->j:Ljava/lang/Object;

    .line 289
    .line 290
    iget-object v12, v12, Lps0;->k:Ljava/lang/Object;

    .line 291
    .line 292
    invoke-interface {v13, v14, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    add-int/lit8 v11, v11, 0x1

    .line 296
    .line 297
    goto :goto_3

    .line 298
    :cond_a
    iget-object v12, v0, Lc01;->d:Le01;

    .line 299
    .line 300
    new-instance v14, Loj;

    .line 301
    .line 302
    const/16 v1, 0xb

    .line 303
    .line 304
    invoke-direct {v14, v0, v10, v1}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 305
    .line 306
    .line 307
    new-instance v15, Lfu;

    .line 308
    .line 309
    invoke-direct {v15, v7, v10, v8}, Lfu;-><init>(ILiq;I)V

    .line 310
    .line 311
    .line 312
    iput-object v4, v3, Lb01;->m:Ljava/lang/Object;

    .line 313
    .line 314
    iput-object v10, v3, Lb01;->n:Lzo0;

    .line 315
    .line 316
    iput v6, v3, Lb01;->q:I

    .line 317
    .line 318
    iget-object v0, v12, Le01;->b:Lsq;

    .line 319
    .line 320
    new-instance v11, Ld01;

    .line 321
    .line 322
    const/16 v16, 0x0

    .line 323
    .line 324
    invoke-direct/range {v11 .. v16}, Ld01;-><init>(Le01;Ljava/util/LinkedHashMap;Loj;Lfu;Liq;)V

    .line 325
    .line 326
    .line 327
    invoke-static {v0, v11, v3}, Lju1;->x(Lsq;Lf90;Lkq;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 331
    if-ne v0, v5, :cond_b

    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_b
    move-object v0, v9

    .line 335
    :goto_4
    if-ne v0, v5, :cond_c

    .line 336
    .line 337
    :goto_5
    return-object v5

    .line 338
    :cond_c
    move-object v2, v4

    .line 339
    :goto_6
    invoke-virtual {v2, v10}, Lzo0;->f(Ljava/lang/Object;)V

    .line 340
    .line 341
    .line 342
    return-object v9

    .line 343
    :catchall_2
    move-exception v0

    .line 344
    move-object v2, v1

    .line 345
    :goto_7
    invoke-virtual {v2, v10}, Lzo0;->f(Ljava/lang/Object;)V

    .line 346
    .line 347
    .line 348
    throw v0
.end method

.method public final d()Lbz;
    .locals 2

    .line 1
    iget-object p0, p0, Lc01;->e:Lm61;

    .line 2
    .line 3
    invoke-virtual {p0}, Lm61;->a()Lr41;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lr41;->c:Ljava/lang/Integer;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget v0, Lbz;->m:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    sget-object v0, Ldz;->m:Ldz;

    .line 18
    .line 19
    invoke-static {p0, v0}, Lbe2;->u(ILdz;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    new-instance p0, Lbz;

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lbz;-><init>(J)V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method
