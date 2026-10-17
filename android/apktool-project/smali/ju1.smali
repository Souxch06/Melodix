.class public abstract Lju1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static j:Ljava/lang/ClassLoader;

.field public static k:Ljava/lang/Thread;

.field public static final l:Lmz;

.field public static final m:[I

.field public static n:Ljava/lang/reflect/Field;

.field public static o:Z

.field public static p:Ljava/lang/Class;

.field public static q:Z

.field public static r:Ljava/lang/reflect/Field;

.field public static s:Z

.field public static t:Ljava/lang/reflect/Field;

.field public static u:Z

.field public static v:Ljava/io/File;

.field public static w:Z


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lmz;

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lmz;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lju1;->l:Lmz;

    .line 9
    .line 10
    const v0, 0x101009e

    .line 11
    .line 12
    .line 13
    const v1, 0x10100a7

    .line 14
    .line 15
    .line 16
    filled-new-array {v0, v1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lju1;->m:[I

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A(ILne2;Ljava/lang/StringBuilder;)Z
    .locals 0

    .line 1
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p0, Lne2;->a:Lle2;

    .line 7
    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    :goto_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    invoke-virtual {p1}, Lne2;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const/16 p0, 0x2e

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lne2;->b()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/16 p0, 0x3a

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lne2;->c()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0
.end method

.method public static c(Lgq;Lf90;)Lmw;
    .locals 2

    .line 1
    sget-object v0, Ls00;->j:Ls00;

    .line 2
    .line 3
    invoke-static {p0, v0}, Ldl1;->m(Lzq;Lsq;)Lsq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lmw;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, p0, v1}, Ln;-><init>(Lsq;Z)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcr;->j:Lcr;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v0, p1}, Ln;->V(Lcr;Ln;Lf90;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static f(JLeh;ILjava/util/ArrayList;IILjava/util/ArrayList;)V
    .locals 20

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v5, p4

    .line 6
    .line 7
    move/from16 v2, p5

    .line 8
    .line 9
    move/from16 v10, p6

    .line 10
    .line 11
    move-object/from16 v8, p7

    .line 12
    .line 13
    const-string v3, "Failed requirement."

    .line 14
    .line 15
    if-ge v2, v10, :cond_11

    .line 16
    .line 17
    move v4, v2

    .line 18
    :goto_0
    if-ge v4, v10, :cond_1

    .line 19
    .line 20
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    check-cast v6, Lth;

    .line 25
    .line 26
    invoke-virtual {v6}, Lth;->c()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    if-lt v6, v1, :cond_0

    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {v3}, Lz0;->d(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual/range {p4 .. p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lth;

    .line 44
    .line 45
    add-int/lit8 v4, v10, -0x1

    .line 46
    .line 47
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lth;

    .line 52
    .line 53
    invoke-virtual {v3}, Lth;->c()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-ne v1, v6, :cond_2

    .line 58
    .line 59
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Ljava/lang/Number;

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    check-cast v6, Lth;

    .line 76
    .line 77
    move-object/from16 v19, v6

    .line 78
    .line 79
    move v6, v2

    .line 80
    move v2, v3

    .line 81
    move-object/from16 v3, v19

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    move v6, v2

    .line 85
    const/4 v2, -0x1

    .line 86
    :goto_1
    invoke-virtual {v3, v1}, Lth;->f(I)B

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    invoke-virtual {v4, v1}, Lth;->f(I)B

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    const-wide/16 v14, 0x2

    .line 95
    .line 96
    if-eq v7, v9, :cond_c

    .line 97
    .line 98
    add-int/lit8 v3, v6, 0x1

    .line 99
    .line 100
    const/4 v4, 0x1

    .line 101
    :goto_2
    if-ge v3, v10, :cond_4

    .line 102
    .line 103
    add-int/lit8 v7, v3, -0x1

    .line 104
    .line 105
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    check-cast v7, Lth;

    .line 110
    .line 111
    invoke-virtual {v7, v1}, Lth;->f(I)B

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    check-cast v9, Lth;

    .line 120
    .line 121
    invoke-virtual {v9, v1}, Lth;->f(I)B

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    if-eq v7, v9, :cond_3

    .line 126
    .line 127
    add-int/lit8 v4, v4, 0x1

    .line 128
    .line 129
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    const/16 v16, -0x1

    .line 133
    .line 134
    const-wide/16 v17, 0x4

    .line 135
    .line 136
    iget-wide v11, v0, Leh;->k:J

    .line 137
    .line 138
    div-long v11, v11, v17

    .line 139
    .line 140
    add-long v11, v11, p0

    .line 141
    .line 142
    add-long/2addr v11, v14

    .line 143
    mul-int/lit8 v3, v4, 0x2

    .line 144
    .line 145
    int-to-long v13, v3

    .line 146
    add-long/2addr v11, v13

    .line 147
    invoke-virtual {v0, v4}, Leh;->C(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v2}, Leh;->C(I)V

    .line 151
    .line 152
    .line 153
    move v2, v6

    .line 154
    :goto_3
    if-ge v2, v10, :cond_7

    .line 155
    .line 156
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lth;

    .line 161
    .line 162
    invoke-virtual {v3, v1}, Lth;->f(I)B

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eq v2, v6, :cond_5

    .line 167
    .line 168
    add-int/lit8 v4, v2, -0x1

    .line 169
    .line 170
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    check-cast v4, Lth;

    .line 175
    .line 176
    invoke-virtual {v4, v1}, Lth;->f(I)B

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-eq v3, v4, :cond_6

    .line 181
    .line 182
    :cond_5
    and-int/lit16 v3, v3, 0xff

    .line 183
    .line 184
    invoke-virtual {v0, v3}, Leh;->C(I)V

    .line 185
    .line 186
    .line 187
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_7
    new-instance v4, Leh;

    .line 191
    .line 192
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 193
    .line 194
    .line 195
    move v7, v6

    .line 196
    :goto_4
    if-ge v7, v10, :cond_b

    .line 197
    .line 198
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    check-cast v2, Lth;

    .line 203
    .line 204
    invoke-virtual {v2, v1}, Lth;->f(I)B

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    add-int/lit8 v3, v7, 0x1

    .line 209
    .line 210
    move v6, v3

    .line 211
    :goto_5
    if-ge v6, v10, :cond_9

    .line 212
    .line 213
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v9

    .line 217
    check-cast v9, Lth;

    .line 218
    .line 219
    invoke-virtual {v9, v1}, Lth;->f(I)B

    .line 220
    .line 221
    .line 222
    move-result v9

    .line 223
    if-eq v2, v9, :cond_8

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 227
    .line 228
    goto :goto_5

    .line 229
    :cond_9
    move v6, v10

    .line 230
    :goto_6
    if-ne v3, v6, :cond_a

    .line 231
    .line 232
    add-int/lit8 v2, v1, 0x1

    .line 233
    .line 234
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Lth;

    .line 239
    .line 240
    invoke-virtual {v3}, Lth;->c()I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-ne v2, v3, :cond_a

    .line 245
    .line 246
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    check-cast v2, Ljava/lang/Number;

    .line 251
    .line 252
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    invoke-virtual {v0, v2}, Leh;->C(I)V

    .line 257
    .line 258
    .line 259
    move-object v9, v8

    .line 260
    move-wide v2, v11

    .line 261
    move v8, v6

    .line 262
    goto :goto_7

    .line 263
    :cond_a
    iget-wide v2, v4, Leh;->k:J

    .line 264
    .line 265
    div-long v2, v2, v17

    .line 266
    .line 267
    add-long/2addr v2, v11

    .line 268
    long-to-int v2, v2

    .line 269
    mul-int/lit8 v2, v2, -0x1

    .line 270
    .line 271
    invoke-virtual {v0, v2}, Leh;->C(I)V

    .line 272
    .line 273
    .line 274
    add-int/lit8 v5, v1, 0x1

    .line 275
    .line 276
    move-object v9, v8

    .line 277
    move-wide v2, v11

    .line 278
    move v8, v6

    .line 279
    move-object/from16 v6, p4

    .line 280
    .line 281
    invoke-static/range {v2 .. v9}, Lju1;->f(JLeh;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    .line 282
    .line 283
    .line 284
    move-object v5, v6

    .line 285
    :goto_7
    move-wide v11, v2

    .line 286
    move v7, v8

    .line 287
    move-object v8, v9

    .line 288
    goto :goto_4

    .line 289
    :cond_b
    invoke-virtual {v0, v4}, Leh;->y(Lp81;)V

    .line 290
    .line 291
    .line 292
    return-void

    .line 293
    :cond_c
    move-object v9, v8

    .line 294
    const/16 v16, -0x1

    .line 295
    .line 296
    const-wide/16 v17, 0x4

    .line 297
    .line 298
    invoke-virtual {v3}, Lth;->c()I

    .line 299
    .line 300
    .line 301
    move-result v7

    .line 302
    invoke-virtual {v4}, Lth;->c()I

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    .line 307
    .line 308
    .line 309
    move-result v7

    .line 310
    const/4 v8, 0x0

    .line 311
    move v11, v1

    .line 312
    :goto_8
    if-ge v11, v7, :cond_d

    .line 313
    .line 314
    invoke-virtual {v3, v11}, Lth;->f(I)B

    .line 315
    .line 316
    .line 317
    move-result v12

    .line 318
    invoke-virtual {v4, v11}, Lth;->f(I)B

    .line 319
    .line 320
    .line 321
    move-result v13

    .line 322
    if-ne v12, v13, :cond_d

    .line 323
    .line 324
    add-int/lit8 v8, v8, 0x1

    .line 325
    .line 326
    add-int/lit8 v11, v11, 0x1

    .line 327
    .line 328
    goto :goto_8

    .line 329
    :cond_d
    iget-wide v11, v0, Leh;->k:J

    .line 330
    .line 331
    div-long v11, v11, v17

    .line 332
    .line 333
    add-long v11, v11, p0

    .line 334
    .line 335
    add-long/2addr v11, v14

    .line 336
    int-to-long v13, v8

    .line 337
    add-long/2addr v11, v13

    .line 338
    const-wide/16 v13, 0x1

    .line 339
    .line 340
    add-long/2addr v11, v13

    .line 341
    neg-int v4, v8

    .line 342
    invoke-virtual {v0, v4}, Leh;->C(I)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0, v2}, Leh;->C(I)V

    .line 346
    .line 347
    .line 348
    add-int v4, v1, v8

    .line 349
    .line 350
    :goto_9
    if-ge v1, v4, :cond_e

    .line 351
    .line 352
    invoke-virtual {v3, v1}, Lth;->f(I)B

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    and-int/lit16 v2, v2, 0xff

    .line 357
    .line 358
    invoke-virtual {v0, v2}, Leh;->C(I)V

    .line 359
    .line 360
    .line 361
    add-int/lit8 v1, v1, 0x1

    .line 362
    .line 363
    goto :goto_9

    .line 364
    :cond_e
    add-int/lit8 v1, v6, 0x1

    .line 365
    .line 366
    if-ne v1, v10, :cond_10

    .line 367
    .line 368
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    check-cast v1, Lth;

    .line 373
    .line 374
    invoke-virtual {v1}, Lth;->c()I

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    if-ne v4, v1, :cond_f

    .line 379
    .line 380
    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    check-cast v1, Ljava/lang/Number;

    .line 385
    .line 386
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    invoke-virtual {v0, v1}, Leh;->C(I)V

    .line 391
    .line 392
    .line 393
    return-void

    .line 394
    :cond_f
    const-string v0, "Check failed."

    .line 395
    .line 396
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    return-void

    .line 400
    :cond_10
    new-instance v3, Leh;

    .line 401
    .line 402
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 403
    .line 404
    .line 405
    iget-wide v1, v3, Leh;->k:J

    .line 406
    .line 407
    div-long v1, v1, v17

    .line 408
    .line 409
    add-long/2addr v1, v11

    .line 410
    long-to-int v1, v1

    .line 411
    mul-int/lit8 v1, v1, -0x1

    .line 412
    .line 413
    invoke-virtual {v0, v1}, Leh;->C(I)V

    .line 414
    .line 415
    .line 416
    move-object v8, v9

    .line 417
    move v7, v10

    .line 418
    move-wide v1, v11

    .line 419
    invoke-static/range {v1 .. v8}, Lju1;->f(JLeh;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0, v3}, Leh;->y(Lp81;)V

    .line 423
    .line 424
    .line 425
    return-void

    .line 426
    :cond_11
    invoke-static {v3}, Lz0;->d(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)Lwl;
    .locals 2

    .line 1
    new-instance v0, Lue;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-class p0, Lue;

    .line 7
    .line 8
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 p1, 0x1

    .line 13
    iput p1, p0, Lvl;->e:I

    .line 14
    .line 15
    new-instance p1, Lul;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {p1, v1, v0}, Lul;-><init>(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lvl;->f:Ljm;

    .line 22
    .line 23
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static k(Landroid/content/Context;)Lm60;
    .locals 8

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    const/16 v2, 0xc

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Lev;

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ltb0;-><init>(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Ltb0;

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ltb0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Package manager required to locate emoji font provider"

    .line 25
    .line 26
    invoke-static {v1, v2}, Lqe0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Landroid/content/Intent;

    .line 30
    .line 31
    const-string v3, "androidx.content.action.LOAD_EMOJI_FONT"

    .line 32
    .line 33
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->queryIntentContentProviders(Landroid/content/Intent;I)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/4 v5, 0x0

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 57
    .line 58
    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->providerInfo:Landroid/content/pm/ProviderInfo;

    .line 59
    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    iget-object v6, v4, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 63
    .line 64
    if-eqz v6, :cond_1

    .line 65
    .line 66
    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 67
    .line 68
    const/4 v7, 0x1

    .line 69
    and-int/2addr v6, v7

    .line 70
    if-ne v6, v7, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    move-object v4, v5

    .line 74
    :goto_1
    if-nez v4, :cond_3

    .line 75
    .line 76
    :goto_2
    move-object v1, v5

    .line 77
    goto :goto_4

    .line 78
    :cond_3
    :try_start_0
    iget-object v2, v4, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v4, v4, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v1, v4}, Ltb0;->f(Landroid/content/pm/PackageManager;Ljava/lang/String;)[Landroid/content/pm/Signature;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    array-length v6, v0

    .line 92
    :goto_3
    if-ge v3, v6, :cond_4

    .line 93
    .line 94
    aget-object v7, v0, v3

    .line 95
    .line 96
    invoke-virtual {v7}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v1, Law;

    .line 111
    .line 112
    const-string v3, "emojicompat-emoji-font"

    .line 113
    .line 114
    invoke-direct {v1, v2, v4, v3, v0}, Law;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .line 116
    .line 117
    goto :goto_4

    .line 118
    :catch_0
    move-exception v0

    .line 119
    const-string v1, "emoji2.text.DefaultEmojiConfig"

    .line 120
    .line 121
    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :goto_4
    if-nez v1, :cond_5

    .line 126
    .line 127
    goto :goto_5

    .line 128
    :cond_5
    new-instance v5, Lm60;

    .line 129
    .line 130
    new-instance v0, Ll60;

    .line 131
    .line 132
    invoke-direct {v0, p0, v1}, Ll60;-><init>(Landroid/content/Context;Law;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {v5, v0}, Lvz;-><init>(Lyz;)V

    .line 136
    .line 137
    .line 138
    :goto_5
    return-object v5
.end method

.method public static l(Ljava/lang/String;Lz0;)Lwl;
    .locals 3

    .line 1
    const-class v0, Lue;

    .line 2
    .line 3
    invoke-static {v0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, v0, Lvl;->e:I

    .line 9
    .line 10
    const-class v1, Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v1}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lvl;->a(Lbx;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lkm;

    .line 20
    .line 21
    const/4 v2, 0x6

    .line 22
    invoke-direct {v1, p0, v2, p1}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, v0, Lvl;->f:Ljm;

    .line 26
    .line 27
    invoke-virtual {v0}, Lvl;->b()Lwl;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static o(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "v"

    .line 4
    .line 5
    const-string v2, "."

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-static {p0, v1, v0}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-static {p0, v5}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v5, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    check-cast v6, Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v6}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-static {v6}, Lka1;->r(Ljava/lang/String;)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    if-eqz v6, :cond_0

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-static {p1, v1, v0}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    filled-new-array {v2}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p0, p1}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p1, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Lka1;->r(Ljava/lang/String;)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    move v0, v3

    .line 130
    :goto_2
    if-ge v0, p0, :cond_8

    .line 131
    .line 132
    if-ltz v0, :cond_4

    .line 133
    .line 134
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-ge v0, v1, :cond_4

    .line 139
    .line 140
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    goto :goto_3

    .line 145
    :cond_4
    move-object v1, v4

    .line 146
    :goto_3
    check-cast v1, Ljava/lang/Number;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-ltz v0, :cond_5

    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-ge v0, v2, :cond_5

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    goto :goto_4

    .line 165
    :cond_5
    move-object v2, v4

    .line 166
    :goto_4
    check-cast v2, Ljava/lang/Number;

    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 169
    .line 170
    .line 171
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    if-le v2, v1, :cond_6

    .line 173
    .line 174
    const/4 p0, 0x1

    .line 175
    return p0

    .line 176
    :cond_6
    if-le v1, v2, :cond_7

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :catch_0
    :cond_8
    :goto_5
    return v3
.end method

.method public static p(Lzq;Lf90;)Ln91;
    .locals 2

    .line 1
    sget-object v0, Ls00;->j:Ls00;

    .line 2
    .line 3
    invoke-static {p0, v0}, Ldl1;->m(Lzq;Lsq;)Lsq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ln91;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, p0, v1}, Ln;-><init>(Lsq;Z)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcr;->j:Lcr;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v0, p1}, Ln;->V(Lcr;Ln;Lf90;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static varargs q([Ljava/lang/Object;)Ljava/util/List;
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    if-eqz v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    aget-object p0, p0, v0

    .line 18
    .line 19
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 25
    .line 26
    return-object p0
.end method

.method public static t(Lcom/melodix/music/MainActivity;Ljava/io/File;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v1, 0x1a

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-lt v0, v1, :cond_4

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Li1;->C(Landroid/content/pm/PackageManager;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_4

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sput-object p1, Lju1;->v:Ljava/io/File;

    .line 42
    .line 43
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v0, "style"

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v3, "Theme.Spotifuck.Settings.Dialog"

    .line 54
    .line 55
    invoke-virtual {p1, v3, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    new-instance v0, Lf4;

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-direct {v0, p0, p1}, Lf4;-><init>(Landroid/content/Context;I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-direct {v0, p0}, Lf4;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p1, v0, Lf4;->c:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast p1, Lb4;

    .line 73
    .line 74
    const-string v1, "Permission Required"

    .line 75
    .line 76
    iput-object v1, p1, Lb4;->d:Ljava/lang/CharSequence;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    iput-boolean v1, p1, Lb4;->m:Z

    .line 80
    .line 81
    const-string v1, "To install the update, please allow Melodix to install unknown apps on the next screen."

    .line 82
    .line 83
    iput-object v1, p1, Lb4;->f:Ljava/lang/CharSequence;

    .line 84
    .line 85
    new-instance p1, Ly51;

    .line 86
    .line 87
    invoke-direct {p1, v2, p0}, Ly51;-><init>(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    const-string p0, "Allow"

    .line 91
    .line 92
    invoke-virtual {v0, p0, p1}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    new-instance p0, Ltf1;

    .line 96
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string p1, "Cancel"

    .line 101
    .line 102
    invoke-virtual {v0, p1, p0}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Lf4;->g()V

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_1
    return-void

    .line 109
    :cond_4
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 110
    .line 111
    const-string v1, "android.intent.action.VIEW"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const v1, 0x10000001

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v1, ".fileprovider"

    .line 135
    .line 136
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-static {p0, v1, p1}, Landroidx/core/content/FileProvider;->c(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    const-string v1, "application/vnd.android.package-archive"

    .line 148
    .line 149
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 153
    .line 154
    .line 155
    const/4 p1, 0x0

    .line 156
    sput-object p1, Lju1;->v:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .line 158
    return-void

    .line 159
    :catch_0
    move-exception p1

    .line 160
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v1, "Failed to launch installer: "

    .line 167
    .line 168
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public static w(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v2, 0x1b

    .line 7
    .line 8
    if-gt v1, v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    sget-object v1, Lju1;->m:[I

    .line 21
    .line 22
    invoke-virtual {p0, v1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p0

    .line 30
    :cond_1
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static final x(Lsq;Lf90;Lkq;)Ljava/lang/Object;
    .locals 8

    .line 1
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    new-instance v2, Li9;

    .line 8
    .line 9
    const/4 v3, 0x3

    .line 10
    invoke-direct {v2, v3}, Li9;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v1, v2}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0, p0}, Lsq;->h(Lsq;)Lsq;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    invoke-static {v0, p0, v1}, Ldl1;->f(Lsq;Lsq;Z)Lsq;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    sget-object v1, Ltb0;->n:Ltb0;

    .line 36
    .line 37
    invoke-interface {p0, v1}, Lsq;->j(Lrq;)Lqq;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lng0;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Lng0;->F()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {v1}, Lng0;->w()Ljava/util/concurrent/CancellationException;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    throw p0

    .line 57
    :cond_2
    :goto_1
    if-ne p0, v0, :cond_3

    .line 58
    .line 59
    new-instance v0, Lh31;

    .line 60
    .line 61
    invoke-direct {v0, p2, p0}, Lh31;-><init>(Liq;Lsq;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v0, p1}, Lkp1;->g(Lh31;Lh31;Lf90;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_2

    .line 69
    :cond_3
    sget-object v1, Lok0;->l:Lok0;

    .line 70
    .line 71
    invoke-interface {p0, v1}, Lsq;->j(Lrq;)Lqq;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-interface {v0, v1}, Lsq;->j(Lrq;)Lqq;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v2, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    const/4 v1, 0x0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    new-instance v0, Lte1;

    .line 87
    .line 88
    invoke-direct {v0, p0, p2}, Lte1;-><init>(Lsq;Lkq;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, v0, Ln;->l:Lsq;

    .line 92
    .line 93
    invoke-static {p0, v1}, Lbh;->E(Lsq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    :try_start_0
    invoke-static {v0, v0, p1}, Lkp1;->g(Lh31;Lh31;Lf90;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    invoke-static {p0, p2}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    move-object p0, p1

    .line 105
    goto :goto_2

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    invoke-static {p0, p2}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    throw p1

    .line 112
    :cond_4
    new-instance v3, Ldy;

    .line 113
    .line 114
    invoke-direct {v3, p2, p0}, Lh31;-><init>(Liq;Lsq;)V

    .line 115
    .line 116
    .line 117
    :try_start_1
    check-cast p1, Lkq;

    .line 118
    .line 119
    invoke-virtual {p1, v3, v3}, Lkq;->j(Liq;Ljava/lang/Object;)Liq;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Lqe0;->i(Liq;)Liq;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    sget-object p1, Lwe1;->a:Lwe1;

    .line 128
    .line 129
    invoke-static {p0, p1}, Lfe1;->C(Liq;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 130
    .line 131
    .line 132
    :cond_5
    sget-object v2, Lja;->a:Lsun/misc/Unsafe;

    .line 133
    .line 134
    sget-wide v4, Ldy;->n:J

    .line 135
    .line 136
    invoke-virtual {v2, v3, v4, v5}, Lsun/misc/Unsafe;->getIntVolatile(Ljava/lang/Object;J)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_8

    .line 141
    .line 142
    const/4 p1, 0x2

    .line 143
    if-ne p0, p1, :cond_7

    .line 144
    .line 145
    invoke-virtual {v3}, Lng0;->A()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {p0}, Lxg;->s(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    instance-of p1, p0, Lql;

    .line 154
    .line 155
    if-nez p1, :cond_6

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_6
    check-cast p0, Lql;

    .line 159
    .line 160
    iget-object p0, p0, Lql;->a:Ljava/lang/Throwable;

    .line 161
    .line 162
    throw p0

    .line 163
    :cond_7
    const-string p0, "Already suspended"

    .line 164
    .line 165
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-object v1

    .line 169
    :cond_8
    const/4 v6, 0x0

    .line 170
    const/4 v7, 0x1

    .line 171
    invoke-virtual/range {v2 .. v7}, Lsun/misc/Unsafe;->compareAndSwapInt(Ljava/lang/Object;JII)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_5

    .line 176
    .line 177
    sget-object p0, Lar;->j:Lar;

    .line 178
    .line 179
    :goto_2
    return-object p0

    .line 180
    :catchall_1
    move-exception v0

    .line 181
    move-object p0, v0

    .line 182
    new-instance p1, Lj11;

    .line 183
    .line 184
    invoke-direct {p1, p0}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v3, p1}, Ln;->d(Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    throw p0
.end method

.method public static y(I)I
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x3

    .line 4
    filled-new-array {v0, v1, v2}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v3, 0x0

    .line 9
    :goto_0
    if-ge v3, v2, :cond_2

    .line 10
    .line 11
    aget v4, v1, v3

    .line 12
    .line 13
    add-int/lit8 v5, v4, -0x1

    .line 14
    .line 15
    if-eqz v4, :cond_1

    .line 16
    .line 17
    if-ne v5, p0, :cond_0

    .line 18
    .line 19
    return v4

    .line 20
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    throw p0

    .line 25
    :cond_2
    return v0
.end method

.method public static declared-synchronized z()Ljava/lang/ClassLoader;
    .locals 11

    .line 1
    const-class v0, Lju1;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lju1;->j:Ljava/lang/ClassLoader;

    .line 5
    .line 6
    if-nez v1, :cond_8

    .line 7
    .line 8
    sget-object v1, Lju1;->k:Ljava/lang/Thread;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v1, :cond_7

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    move-object v1, v2

    .line 28
    goto/16 :goto_8

    .line 29
    .line 30
    :cond_0
    const-class v3, Ljava/lang/Void;

    .line 31
    .line 32
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 33
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/ThreadGroup;->activeGroupCount()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    new-array v5, v4, [Ljava/lang/ThreadGroup;

    .line 38
    .line 39
    invoke-virtual {v1, v5}, Ljava/lang/ThreadGroup;->enumerate([Ljava/lang/ThreadGroup;)I

    .line 40
    .line 41
    .line 42
    const/4 v6, 0x0

    .line 43
    move v7, v6

    .line 44
    :goto_0
    if-ge v7, v4, :cond_2

    .line 45
    .line 46
    aget-object v8, v5, v7

    .line 47
    .line 48
    const-string v9, "dynamiteLoader"

    .line 49
    .line 50
    invoke-virtual {v8}, Ljava/lang/ThreadGroup;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v10

    .line 54
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    if-eqz v9, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception v1

    .line 65
    goto/16 :goto_a

    .line 66
    .line 67
    :catch_0
    move-exception v1

    .line 68
    goto :goto_5

    .line 69
    :cond_2
    move-object v8, v2

    .line 70
    :goto_1
    if-nez v8, :cond_3

    .line 71
    .line 72
    new-instance v8, Ljava/lang/ThreadGroup;

    .line 73
    .line 74
    const-string v4, "dynamiteLoader"

    .line 75
    .line 76
    invoke-direct {v8, v1, v4}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    invoke-virtual {v8}, Ljava/lang/ThreadGroup;->activeCount()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    new-array v4, v1, [Ljava/lang/Thread;

    .line 84
    .line 85
    invoke-virtual {v8, v4}, Ljava/lang/ThreadGroup;->enumerate([Ljava/lang/Thread;)I

    .line 86
    .line 87
    .line 88
    :goto_2
    if-ge v6, v1, :cond_5

    .line 89
    .line 90
    aget-object v5, v4, v6

    .line 91
    .line 92
    const-string v7, "GmsDynamite"

    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v7
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    if-eqz v7, :cond_4

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    move-object v5, v2

    .line 109
    :goto_3
    if-nez v5, :cond_6

    .line 110
    .line 111
    :try_start_2
    new-instance v1, Lxm1;

    .line 112
    .line 113
    const-string v4, "GmsDynamite"

    .line 114
    .line 115
    invoke-direct {v1, v8, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 116
    .line 117
    .line 118
    :try_start_3
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 122
    .line 123
    .line 124
    move-object v5, v1

    .line 125
    goto :goto_7

    .line 126
    :catch_1
    move-exception v4

    .line 127
    move-object v5, v1

    .line 128
    goto :goto_6

    .line 129
    :goto_4
    move-object v4, v1

    .line 130
    goto :goto_6

    .line 131
    :catch_2
    move-exception v1

    .line 132
    goto :goto_4

    .line 133
    :goto_5
    move-object v4, v1

    .line 134
    move-object v5, v2

    .line 135
    :goto_6
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    add-int/lit8 v1, v1, 0x27

    .line 148
    .line 149
    new-instance v4, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 152
    .line 153
    .line 154
    :cond_6
    :goto_7
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 155
    move-object v1, v5

    .line 156
    :goto_8
    :try_start_5
    sput-object v1, Lju1;->k:Ljava/lang/Thread;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 157
    .line 158
    if-nez v1, :cond_7

    .line 159
    .line 160
    :goto_9
    move-object v1, v2

    .line 161
    goto :goto_c

    .line 162
    :catchall_1
    move-exception v1

    .line 163
    goto :goto_f

    .line 164
    :goto_a
    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 165
    :try_start_7
    throw v1

    .line 166
    :cond_7
    monitor-enter v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 167
    :try_start_8
    sget-object v3, Lju1;->k:Ljava/lang/Thread;

    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 170
    .line 171
    .line 172
    move-result-object v2
    :try_end_8
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 173
    goto :goto_b

    .line 174
    :catchall_2
    move-exception v2

    .line 175
    goto :goto_d

    .line 176
    :catch_3
    move-exception v3

    .line 177
    :try_start_9
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    add-int/lit8 v3, v3, 0x29

    .line 190
    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 194
    .line 195
    .line 196
    :goto_b
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 197
    goto :goto_9

    .line 198
    :goto_c
    :try_start_a
    sput-object v1, Lju1;->j:Ljava/lang/ClassLoader;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 199
    .line 200
    goto :goto_e

    .line 201
    :goto_d
    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 202
    :try_start_c
    throw v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 203
    :cond_8
    :goto_e
    monitor-exit v0

    .line 204
    return-object v1

    .line 205
    :goto_f
    :try_start_d
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 206
    throw v1
.end method


# virtual methods
.method public abstract g(Lc0;Lt;Lt;)Z
.end method

.method public abstract h(Lc0;Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public abstract i(Lc0;Lb0;Lb0;)Z
.end method

.method public abstract m(Lc0;)Lt;
.end method

.method public abstract n(Lc0;)Lb0;
.end method

.method public abstract r(I)Landroid/view/View;
.end method

.method public abstract s()Z
.end method

.method public abstract u(Lb0;Lb0;)V
.end method

.method public abstract v(Lb0;Ljava/lang/Thread;)V
.end method
