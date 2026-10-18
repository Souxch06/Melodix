.class public final Lwc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final m:Ljava/util/logging/Logger;


# instance fields
.field public final j:Llh;

.field public final k:Lvc0;

.field public final l:Lcc0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lkc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    sput-object v0, Lwc0;->m:Ljava/util/logging/Logger;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lsx0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lwc0;->j:Llh;

    .line 8
    .line 9
    new-instance v0, Lvc0;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lvc0;-><init>(Llh;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lwc0;->k:Lvc0;

    .line 15
    .line 16
    new-instance p1, Lcc0;

    .line 17
    .line 18
    invoke-direct {p1, v0}, Lcc0;-><init>(Lvc0;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lwc0;->l:Lcc0;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a(ZLpc0;)Z
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, v0, Lwc0;->j:Llh;

    .line 7
    .line 8
    const-wide/16 v4, 0x9

    .line 9
    .line 10
    invoke-interface {v3, v4, v5}, Llh;->n(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    iget-object v3, v0, Lwc0;->j:Llh;

    .line 14
    .line 15
    invoke-static {v3}, Ljg1;->m(Llh;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/16 v4, 0x4000

    .line 20
    .line 21
    if-gt v3, v4, :cond_32

    .line 22
    .line 23
    iget-object v5, v0, Lwc0;->j:Llh;

    .line 24
    .line 25
    invoke-interface {v5}, Llh;->readByte()B

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    and-int/lit16 v5, v5, 0xff

    .line 30
    .line 31
    iget-object v6, v0, Lwc0;->j:Llh;

    .line 32
    .line 33
    invoke-interface {v6}, Llh;->readByte()B

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    and-int/lit16 v7, v6, 0xff

    .line 38
    .line 39
    iget-object v8, v0, Lwc0;->j:Llh;

    .line 40
    .line 41
    invoke-interface {v8}, Llh;->readInt()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    const v9, 0x7fffffff

    .line 46
    .line 47
    .line 48
    and-int v13, v8, v9

    .line 49
    .line 50
    sget-object v9, Lwc0;->m:Ljava/util/logging/Logger;

    .line 51
    .line 52
    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 53
    .line 54
    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    const/4 v11, 0x1

    .line 59
    if-eqz v10, :cond_0

    .line 60
    .line 61
    invoke-static {v11, v13, v3, v5, v7}, Lkc0;->a(ZIIII)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    const/4 v9, 0x4

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    if-ne v5, v9, :cond_1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    new-instance v0, Ljava/io/IOException;

    .line 75
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v2, "Expected a SETTINGS frame but was "

    .line 79
    .line 80
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sget-object v2, Lkc0;->b:[Ljava/lang/String;

    .line 84
    .line 85
    array-length v3, v2

    .line 86
    if-ge v5, v3, :cond_2

    .line 87
    .line 88
    aget-object v2, v2, v5

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    const-string v2, "0x%02x"

    .line 92
    .line 93
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-static {v2, v3}, Ljg1;->f(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw v0

    .line 116
    :cond_3
    :goto_1
    const/4 v12, 0x5

    .line 117
    const/4 v14, 0x3

    .line 118
    const/4 v15, 0x2

    .line 119
    const/16 p1, 0xe

    .line 120
    .line 121
    const/16 v10, 0x8

    .line 122
    .line 123
    move/from16 v17, v5

    .line 124
    .line 125
    const-wide/16 v4, 0x0

    .line 126
    .line 127
    packed-switch v17, :pswitch_data_0

    .line 128
    .line 129
    .line 130
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 131
    .line 132
    int-to-long v1, v3

    .line 133
    invoke-interface {v0, v1, v2}, Llh;->skip(J)V

    .line 134
    .line 135
    .line 136
    return v11

    .line 137
    :pswitch_0
    if-ne v3, v9, :cond_8

    .line 138
    .line 139
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 140
    .line 141
    invoke-interface {v0}, Llh;->readInt()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    const-wide/32 v6, 0x7fffffff

    .line 146
    .line 147
    .line 148
    int-to-long v8, v0

    .line 149
    and-long/2addr v6, v8

    .line 150
    cmp-long v0, v6, v4

    .line 151
    .line 152
    if-eqz v0, :cond_7

    .line 153
    .line 154
    iget-object v1, v1, Lpc0;->k:Ltc0;

    .line 155
    .line 156
    if-nez v13, :cond_4

    .line 157
    .line 158
    monitor-enter v1

    .line 159
    :try_start_1
    iget-wide v2, v1, Ltc0;->D:J

    .line 160
    .line 161
    add-long/2addr v2, v6

    .line 162
    iput-wide v2, v1, Ltc0;->D:J

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    .line 166
    .line 167
    monitor-exit v1

    .line 168
    return v11

    .line 169
    :catchall_0
    move-exception v0

    .line 170
    monitor-exit v1

    .line 171
    throw v0

    .line 172
    :cond_4
    invoke-virtual {v1, v13}, Ltc0;->g(I)Lad0;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    if-eqz v1, :cond_6

    .line 177
    .line 178
    monitor-enter v1

    .line 179
    :try_start_2
    iget-wide v2, v1, Lad0;->f:J

    .line 180
    .line 181
    add-long/2addr v2, v6

    .line 182
    iput-wide v2, v1, Lad0;->f:J

    .line 183
    .line 184
    if-lez v0, :cond_5

    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 187
    .line 188
    .line 189
    :cond_5
    monitor-exit v1

    .line 190
    return v11

    .line 191
    :catchall_1
    move-exception v0

    .line 192
    monitor-exit v1

    .line 193
    throw v0

    .line 194
    :cond_6
    :goto_2
    move v2, v11

    .line 195
    goto/16 :goto_11

    .line 196
    .line 197
    :cond_7
    const-string v0, "windowSizeIncrement was 0"

    .line 198
    .line 199
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    return v2

    .line 203
    :cond_8
    const-string v0, "TYPE_WINDOW_UPDATE length !=4: "

    .line 204
    .line 205
    invoke-static {v3, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    return v2

    .line 213
    :pswitch_1
    if-lt v3, v10, :cond_10

    .line 214
    .line 215
    if-nez v13, :cond_f

    .line 216
    .line 217
    iget-object v4, v0, Lwc0;->j:Llh;

    .line 218
    .line 219
    invoke-interface {v4}, Llh;->readInt()I

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    iget-object v5, v0, Lwc0;->j:Llh;

    .line 224
    .line 225
    invoke-interface {v5}, Llh;->readInt()I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    sub-int/2addr v3, v10

    .line 230
    invoke-static/range {p1 .. p1}, Loq;->u(I)[I

    .line 231
    .line 232
    .line 233
    move-result-object v6

    .line 234
    array-length v7, v6

    .line 235
    move v8, v2

    .line 236
    :goto_3
    if-ge v8, v7, :cond_a

    .line 237
    .line 238
    aget v9, v6, v8

    .line 239
    .line 240
    invoke-static {v9}, Loq;->t(I)I

    .line 241
    .line 242
    .line 243
    move-result v12

    .line 244
    if-ne v12, v5, :cond_9

    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_9
    add-int/lit8 v8, v8, 0x1

    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_a
    move v9, v2

    .line 251
    :goto_4
    if-eqz v9, :cond_e

    .line 252
    .line 253
    sget-object v5, Lth;->m:Lth;

    .line 254
    .line 255
    if-lez v3, :cond_b

    .line 256
    .line 257
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 258
    .line 259
    int-to-long v5, v3

    .line 260
    invoke-interface {v0, v5, v6}, Llh;->e(J)Lth;

    .line 261
    .line 262
    .line 263
    move-result-object v5

    .line 264
    :cond_b
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v5}, Lth;->c()I

    .line 268
    .line 269
    .line 270
    iget-object v3, v1, Lpc0;->k:Ltc0;

    .line 271
    .line 272
    monitor-enter v3

    .line 273
    :try_start_3
    iget-object v0, v3, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 274
    .line 275
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    new-array v5, v2, [Lad0;

    .line 280
    .line 281
    invoke-interface {v0, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iput-boolean v11, v3, Ltc0;->o:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 286
    .line 287
    monitor-exit v3

    .line 288
    check-cast v0, [Lad0;

    .line 289
    .line 290
    array-length v3, v0

    .line 291
    :goto_5
    if-ge v2, v3, :cond_6

    .line 292
    .line 293
    aget-object v5, v0, v2

    .line 294
    .line 295
    iget v6, v5, Lad0;->a:I

    .line 296
    .line 297
    if-le v6, v4, :cond_d

    .line 298
    .line 299
    invoke-virtual {v5}, Lad0;->f()Z

    .line 300
    .line 301
    .line 302
    move-result v6

    .line 303
    if-eqz v6, :cond_d

    .line 304
    .line 305
    monitor-enter v5

    .line 306
    :try_start_4
    iget v6, v5, Lad0;->m:I

    .line 307
    .line 308
    if-nez v6, :cond_c

    .line 309
    .line 310
    iput v10, v5, Lad0;->m:I

    .line 311
    .line 312
    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 313
    .line 314
    .line 315
    goto :goto_6

    .line 316
    :catchall_2
    move-exception v0

    .line 317
    goto :goto_7

    .line 318
    :cond_c
    :goto_6
    monitor-exit v5

    .line 319
    iget-object v6, v1, Lpc0;->k:Ltc0;

    .line 320
    .line 321
    iget v5, v5, Lad0;->a:I

    .line 322
    .line 323
    invoke-virtual {v6, v5}, Ltc0;->h(I)Lad0;

    .line 324
    .line 325
    .line 326
    goto :goto_8

    .line 327
    :goto_7
    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 328
    throw v0

    .line 329
    :cond_d
    :goto_8
    add-int/lit8 v2, v2, 0x1

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :catchall_3
    move-exception v0

    .line 333
    monitor-exit v3

    .line 334
    throw v0

    .line 335
    :cond_e
    const-string v0, "TYPE_GOAWAY unexpected error code: "

    .line 336
    .line 337
    invoke-static {v5, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    return v2

    .line 345
    :cond_f
    const-string v0, "TYPE_GOAWAY streamId != 0"

    .line 346
    .line 347
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    return v2

    .line 351
    :cond_10
    const-string v0, "TYPE_GOAWAY length < 8: "

    .line 352
    .line 353
    invoke-static {v3, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    return v2

    .line 361
    :pswitch_2
    if-ne v3, v10, :cond_17

    .line 362
    .line 363
    if-nez v13, :cond_16

    .line 364
    .line 365
    iget-object v3, v0, Lwc0;->j:Llh;

    .line 366
    .line 367
    invoke-interface {v3}, Llh;->readInt()I

    .line 368
    .line 369
    .line 370
    move-result v3

    .line 371
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 372
    .line 373
    invoke-interface {v0}, Llh;->readInt()I

    .line 374
    .line 375
    .line 376
    move-result v20

    .line 377
    and-int/lit8 v0, v6, 0x1

    .line 378
    .line 379
    if-eqz v0, :cond_11

    .line 380
    .line 381
    move v2, v11

    .line 382
    :cond_11
    iget-object v6, v1, Lpc0;->k:Ltc0;

    .line 383
    .line 384
    if-eqz v2, :cond_15

    .line 385
    .line 386
    monitor-enter v6

    .line 387
    const-wide/16 v0, 0x1

    .line 388
    .line 389
    if-eq v3, v11, :cond_14

    .line 390
    .line 391
    if-eq v3, v15, :cond_13

    .line 392
    .line 393
    if-eq v3, v14, :cond_12

    .line 394
    .line 395
    goto :goto_9

    .line 396
    :cond_12
    :try_start_6
    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 397
    .line 398
    .line 399
    goto :goto_9

    .line 400
    :catchall_4
    move-exception v0

    .line 401
    goto :goto_a

    .line 402
    :cond_13
    iget-wide v2, v6, Ltc0;->w:J

    .line 403
    .line 404
    add-long/2addr v2, v0

    .line 405
    iput-wide v2, v6, Ltc0;->w:J

    .line 406
    .line 407
    goto :goto_9

    .line 408
    :cond_14
    iget-wide v2, v6, Ltc0;->u:J

    .line 409
    .line 410
    add-long/2addr v2, v0

    .line 411
    iput-wide v2, v6, Ltc0;->u:J
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 412
    .line 413
    :goto_9
    monitor-exit v6

    .line 414
    return v11

    .line 415
    :goto_a
    monitor-exit v6

    .line 416
    throw v0

    .line 417
    :cond_15
    iget-object v0, v6, Ltc0;->q:Lob1;

    .line 418
    .line 419
    new-instance v2, Ljava/lang/StringBuilder;

    .line 420
    .line 421
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 422
    .line 423
    .line 424
    iget-object v6, v1, Lpc0;->k:Ltc0;

    .line 425
    .line 426
    iget-object v6, v6, Ltc0;->l:Ljava/lang/String;

    .line 427
    .line 428
    const-string v7, " ping"

    .line 429
    .line 430
    invoke-static {v2, v6, v7}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v17

    .line 434
    iget-object v1, v1, Lpc0;->k:Ltc0;

    .line 435
    .line 436
    new-instance v16, Loc0;

    .line 437
    .line 438
    const/16 v21, 0x0

    .line 439
    .line 440
    move-object/from16 v18, v1

    .line 441
    .line 442
    move/from16 v19, v3

    .line 443
    .line 444
    invoke-direct/range {v16 .. v21}, Loc0;-><init>(Ljava/lang/String;Ltc0;III)V

    .line 445
    .line 446
    .line 447
    move-object/from16 v1, v16

    .line 448
    .line 449
    invoke-virtual {v0, v1, v4, v5}, Lob1;->c(Ljb1;J)V

    .line 450
    .line 451
    .line 452
    return v11

    .line 453
    :cond_16
    const-string v0, "TYPE_PING streamId != 0"

    .line 454
    .line 455
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    return v2

    .line 459
    :cond_17
    const-string v0, "TYPE_PING length != 8: "

    .line 460
    .line 461
    invoke-static {v3, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    return v2

    .line 469
    :pswitch_3
    invoke-virtual {v0, v1, v3, v7, v13}, Lwc0;->l(Lpc0;III)V

    .line 470
    .line 471
    .line 472
    return v11

    .line 473
    :pswitch_4
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 474
    .line 475
    if-nez v13, :cond_26

    .line 476
    .line 477
    and-int/2addr v6, v11

    .line 478
    if-eqz v6, :cond_19

    .line 479
    .line 480
    if-nez v3, :cond_18

    .line 481
    .line 482
    goto/16 :goto_2

    .line 483
    .line 484
    :cond_18
    const-string v0, "FRAME_SIZE_ERROR ack frame should be empty!"

    .line 485
    .line 486
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    return v2

    .line 490
    :cond_19
    rem-int/lit8 v6, v3, 0x6

    .line 491
    .line 492
    if-nez v6, :cond_25

    .line 493
    .line 494
    new-instance v6, Lo51;

    .line 495
    .line 496
    invoke-direct {v6}, Lo51;-><init>()V

    .line 497
    .line 498
    .line 499
    invoke-static {v2, v3}, Lkn1;->p(II)Lcf0;

    .line 500
    .line 501
    .line 502
    move-result-object v3

    .line 503
    const/4 v7, 0x6

    .line 504
    invoke-static {v3, v7}, Lkn1;->n(Lcf0;I)Laf0;

    .line 505
    .line 506
    .line 507
    move-result-object v3

    .line 508
    iget v7, v3, Laf0;->j:I

    .line 509
    .line 510
    iget v8, v3, Laf0;->k:I

    .line 511
    .line 512
    iget v3, v3, Laf0;->l:I

    .line 513
    .line 514
    if-lez v3, :cond_1a

    .line 515
    .line 516
    if-le v7, v8, :cond_1b

    .line 517
    .line 518
    :cond_1a
    if-gez v3, :cond_24

    .line 519
    .line 520
    if-gt v8, v7, :cond_24

    .line 521
    .line 522
    :cond_1b
    :goto_b
    invoke-interface {v0}, Llh;->readShort()S

    .line 523
    .line 524
    .line 525
    move-result v10

    .line 526
    sget-object v13, Ljg1;->a:[B

    .line 527
    .line 528
    const v13, 0xffff

    .line 529
    .line 530
    .line 531
    and-int/2addr v10, v13

    .line 532
    invoke-interface {v0}, Llh;->readInt()I

    .line 533
    .line 534
    .line 535
    move-result v13

    .line 536
    if-eq v10, v15, :cond_21

    .line 537
    .line 538
    if-eq v10, v14, :cond_20

    .line 539
    .line 540
    if-eq v10, v9, :cond_1e

    .line 541
    .line 542
    if-eq v10, v12, :cond_1c

    .line 543
    .line 544
    move/from16 v17, v2

    .line 545
    .line 546
    goto :goto_c

    .line 547
    :cond_1c
    move/from16 v17, v2

    .line 548
    .line 549
    const/16 v2, 0x4000

    .line 550
    .line 551
    if-lt v13, v2, :cond_1d

    .line 552
    .line 553
    const v2, 0xffffff

    .line 554
    .line 555
    .line 556
    if-gt v13, v2, :cond_1d

    .line 557
    .line 558
    goto :goto_c

    .line 559
    :cond_1d
    const-string v0, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: "

    .line 560
    .line 561
    invoke-static {v13, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 566
    .line 567
    .line 568
    return v17

    .line 569
    :cond_1e
    move/from16 v17, v2

    .line 570
    .line 571
    if-ltz v13, :cond_1f

    .line 572
    .line 573
    const/4 v10, 0x7

    .line 574
    goto :goto_c

    .line 575
    :cond_1f
    const-string v0, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    .line 576
    .line 577
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    return v17

    .line 581
    :cond_20
    move/from16 v17, v2

    .line 582
    .line 583
    move v10, v9

    .line 584
    goto :goto_c

    .line 585
    :cond_21
    move/from16 v17, v2

    .line 586
    .line 587
    if-eqz v13, :cond_23

    .line 588
    .line 589
    if-ne v13, v11, :cond_22

    .line 590
    .line 591
    goto :goto_c

    .line 592
    :cond_22
    const-string v0, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    .line 593
    .line 594
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 595
    .line 596
    .line 597
    return v17

    .line 598
    :cond_23
    :goto_c
    invoke-virtual {v6, v10, v13}, Lo51;->b(II)V

    .line 599
    .line 600
    .line 601
    if-eq v7, v8, :cond_24

    .line 602
    .line 603
    add-int/2addr v7, v3

    .line 604
    move/from16 v2, v17

    .line 605
    .line 606
    goto :goto_b

    .line 607
    :cond_24
    iget-object v0, v1, Lpc0;->k:Ltc0;

    .line 608
    .line 609
    iget-object v2, v0, Ltc0;->q:Lob1;

    .line 610
    .line 611
    new-instance v3, Ljava/lang/StringBuilder;

    .line 612
    .line 613
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 614
    .line 615
    .line 616
    iget-object v0, v0, Ltc0;->l:Ljava/lang/String;

    .line 617
    .line 618
    const-string v7, " applyAndAckSettings"

    .line 619
    .line 620
    invoke-static {v3, v0, v7}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v0

    .line 624
    new-instance v3, Lnc0;

    .line 625
    .line 626
    invoke-direct {v3, v0, v1, v6, v15}, Lnc0;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 627
    .line 628
    .line 629
    invoke-virtual {v2, v3, v4, v5}, Lob1;->c(Ljb1;J)V

    .line 630
    .line 631
    .line 632
    return v11

    .line 633
    :cond_25
    move/from16 v17, v2

    .line 634
    .line 635
    const-string v0, "TYPE_SETTINGS length % 6 != 0: "

    .line 636
    .line 637
    invoke-static {v3, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object v0

    .line 641
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 642
    .line 643
    .line 644
    return v17

    .line 645
    :cond_26
    move/from16 v17, v2

    .line 646
    .line 647
    const-string v0, "TYPE_SETTINGS streamId != 0"

    .line 648
    .line 649
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 650
    .line 651
    .line 652
    return v17

    .line 653
    :pswitch_5
    move/from16 v17, v2

    .line 654
    .line 655
    if-ne v3, v9, :cond_2f

    .line 656
    .line 657
    if-eqz v13, :cond_2e

    .line 658
    .line 659
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 660
    .line 661
    invoke-interface {v0}, Llh;->readInt()I

    .line 662
    .line 663
    .line 664
    move-result v0

    .line 665
    invoke-static/range {p1 .. p1}, Loq;->u(I)[I

    .line 666
    .line 667
    .line 668
    move-result-object v2

    .line 669
    array-length v3, v2

    .line 670
    move/from16 v6, v17

    .line 671
    .line 672
    :goto_d
    if-ge v6, v3, :cond_28

    .line 673
    .line 674
    aget v7, v2, v6

    .line 675
    .line 676
    invoke-static {v7}, Loq;->t(I)I

    .line 677
    .line 678
    .line 679
    move-result v9

    .line 680
    if-ne v9, v0, :cond_27

    .line 681
    .line 682
    move v14, v7

    .line 683
    goto :goto_e

    .line 684
    :cond_27
    add-int/lit8 v6, v6, 0x1

    .line 685
    .line 686
    goto :goto_d

    .line 687
    :cond_28
    move/from16 v14, v17

    .line 688
    .line 689
    :goto_e
    if-eqz v14, :cond_2d

    .line 690
    .line 691
    iget-object v12, v1, Lpc0;->k:Ltc0;

    .line 692
    .line 693
    if-eqz v13, :cond_29

    .line 694
    .line 695
    and-int/lit8 v0, v8, 0x1

    .line 696
    .line 697
    if-nez v0, :cond_29

    .line 698
    .line 699
    iget-object v0, v12, Ltc0;->r:Lob1;

    .line 700
    .line 701
    new-instance v1, Ljava/lang/StringBuilder;

    .line 702
    .line 703
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 704
    .line 705
    .line 706
    iget-object v2, v12, Ltc0;->l:Ljava/lang/String;

    .line 707
    .line 708
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 709
    .line 710
    .line 711
    const/16 v2, 0x5b

    .line 712
    .line 713
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 717
    .line 718
    .line 719
    const-string v2, "] onReset"

    .line 720
    .line 721
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 722
    .line 723
    .line 724
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 725
    .line 726
    .line 727
    move-result-object v1

    .line 728
    new-instance v10, Loc0;

    .line 729
    .line 730
    const/4 v15, 0x1

    .line 731
    move v2, v11

    .line 732
    move-object v11, v1

    .line 733
    invoke-direct/range {v10 .. v15}, Loc0;-><init>(Ljava/lang/String;Ltc0;III)V

    .line 734
    .line 735
    .line 736
    invoke-virtual {v0, v10, v4, v5}, Lob1;->c(Ljb1;J)V

    .line 737
    .line 738
    .line 739
    return v2

    .line 740
    :cond_29
    move v2, v11

    .line 741
    invoke-virtual {v12, v13}, Ltc0;->h(I)Lad0;

    .line 742
    .line 743
    .line 744
    move-result-object v1

    .line 745
    if-eqz v1, :cond_2c

    .line 746
    .line 747
    monitor-enter v1

    .line 748
    if-eqz v14, :cond_2b

    .line 749
    .line 750
    :try_start_7
    iget v0, v1, Lad0;->m:I

    .line 751
    .line 752
    if-nez v0, :cond_2a

    .line 753
    .line 754
    iput v14, v1, Lad0;->m:I

    .line 755
    .line 756
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 757
    .line 758
    .line 759
    goto :goto_f

    .line 760
    :catchall_5
    move-exception v0

    .line 761
    goto :goto_10

    .line 762
    :cond_2a
    :goto_f
    monitor-exit v1

    .line 763
    return v2

    .line 764
    :cond_2b
    const/4 v0, 0x0

    .line 765
    :try_start_8
    throw v0

    .line 766
    :goto_10
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 767
    throw v0

    .line 768
    :cond_2c
    :goto_11
    return v2

    .line 769
    :cond_2d
    const-string v1, "TYPE_RST_STREAM unexpected error code: "

    .line 770
    .line 771
    invoke-static {v0, v1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v0

    .line 775
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 776
    .line 777
    .line 778
    return v17

    .line 779
    :cond_2e
    const-string v0, "TYPE_RST_STREAM streamId == 0"

    .line 780
    .line 781
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    return v17

    .line 785
    :cond_2f
    const-string v0, "TYPE_RST_STREAM length: "

    .line 786
    .line 787
    const-string v1, " != 4"

    .line 788
    .line 789
    invoke-static {v0, v1, v3}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 790
    .line 791
    .line 792
    move-result-object v0

    .line 793
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 794
    .line 795
    .line 796
    return v17

    .line 797
    :pswitch_6
    move/from16 v17, v2

    .line 798
    .line 799
    move v2, v11

    .line 800
    if-ne v3, v12, :cond_31

    .line 801
    .line 802
    if-eqz v13, :cond_30

    .line 803
    .line 804
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 805
    .line 806
    invoke-interface {v0}, Llh;->readInt()I

    .line 807
    .line 808
    .line 809
    invoke-interface {v0}, Llh;->readByte()B

    .line 810
    .line 811
    .line 812
    return v2

    .line 813
    :cond_30
    const-string v0, "TYPE_PRIORITY streamId == 0"

    .line 814
    .line 815
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 816
    .line 817
    .line 818
    return v17

    .line 819
    :cond_31
    const-string v0, "TYPE_PRIORITY length: "

    .line 820
    .line 821
    const-string v1, " != 5"

    .line 822
    .line 823
    invoke-static {v0, v1, v3}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 824
    .line 825
    .line 826
    move-result-object v0

    .line 827
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 828
    .line 829
    .line 830
    return v17

    .line 831
    :pswitch_7
    move v2, v11

    .line 832
    invoke-virtual {v0, v1, v3, v7, v13}, Lwc0;->j(Lpc0;III)V

    .line 833
    .line 834
    .line 835
    return v2

    .line 836
    :pswitch_8
    move v2, v11

    .line 837
    invoke-virtual {v0, v1, v3, v7, v13}, Lwc0;->g(Lpc0;III)V

    .line 838
    .line 839
    .line 840
    return v2

    .line 841
    :cond_32
    move/from16 v17, v2

    .line 842
    .line 843
    const-string v0, "FRAME_SIZE_ERROR: "

    .line 844
    .line 845
    invoke-static {v3, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 846
    .line 847
    .line 848
    move-result-object v0

    .line 849
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    return v17

    .line 853
    :catch_0
    move/from16 v17, v2

    .line 854
    .line 855
    return v17

    .line 856
    nop

    .line 857
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lwc0;->j:Llh;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Lpc0;III)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v4, p4

    .line 8
    .line 9
    if-eqz v4, :cond_f

    .line 10
    .line 11
    and-int/lit8 v3, v2, 0x1

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    const/4 v7, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v7, 0x0

    .line 18
    :goto_0
    and-int/lit8 v3, v2, 0x20

    .line 19
    .line 20
    if-nez v3, :cond_e

    .line 21
    .line 22
    and-int/lit8 v3, v2, 0x8

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-object v3, v0, Lwc0;->j:Llh;

    .line 27
    .line 28
    invoke-interface {v3}, Llh;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sget-object v8, Ljg1;->a:[B

    .line 33
    .line 34
    and-int/lit16 v3, v3, 0xff

    .line 35
    .line 36
    move v8, v3

    .line 37
    :goto_1
    move/from16 v3, p2

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    const/4 v8, 0x0

    .line 41
    goto :goto_1

    .line 42
    :goto_2
    invoke-static {v3, v2, v8}, Lbh;->v(III)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iget-object v3, v0, Lwc0;->j:Llh;

    .line 47
    .line 48
    iget-object v9, v1, Lpc0;->k:Ltc0;

    .line 49
    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    and-int/lit8 v10, v4, 0x1

    .line 53
    .line 54
    if-nez v10, :cond_2

    .line 55
    .line 56
    const/4 v10, 0x1

    .line 57
    goto :goto_3

    .line 58
    :cond_2
    const/4 v10, 0x0

    .line 59
    :goto_3
    const-wide/16 v11, 0x0

    .line 60
    .line 61
    if-eqz v10, :cond_3

    .line 62
    .line 63
    new-instance v5, Leh;

    .line 64
    .line 65
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 66
    .line 67
    .line 68
    int-to-long v13, v2

    .line 69
    invoke-interface {v3, v13, v14}, Llh;->n(J)V

    .line 70
    .line 71
    .line 72
    invoke-interface {v3, v13, v14, v5}, Lp81;->c(JLeh;)J

    .line 73
    .line 74
    .line 75
    iget-object v10, v9, Ltc0;->r:Lob1;

    .line 76
    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v3, v9, Ltc0;->l:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const/16 v3, 0x5b

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v3, "] onData"

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    move v6, v2

    .line 105
    move-object v2, v1

    .line 106
    new-instance v1, Lqc0;

    .line 107
    .line 108
    move-object v3, v9

    .line 109
    invoke-direct/range {v1 .. v7}, Lqc0;-><init>(Ljava/lang/String;Ltc0;ILeh;IZ)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v10, v1, v11, v12}, Lob1;->c(Ljb1;J)V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_a

    .line 116
    .line 117
    :cond_3
    invoke-virtual {v9, v4}, Ltc0;->g(I)Lad0;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    if-nez v9, :cond_4

    .line 122
    .line 123
    iget-object v5, v1, Lpc0;->k:Ltc0;

    .line 124
    .line 125
    const/4 v6, 0x2

    .line 126
    invoke-virtual {v5, v4, v6}, Ltc0;->s(II)V

    .line 127
    .line 128
    .line 129
    iget-object v1, v1, Lpc0;->k:Ltc0;

    .line 130
    .line 131
    int-to-long v4, v2

    .line 132
    invoke-virtual {v1, v4, v5}, Ltc0;->l(J)V

    .line 133
    .line 134
    .line 135
    invoke-interface {v3, v4, v5}, Llh;->skip(J)V

    .line 136
    .line 137
    .line 138
    goto/16 :goto_a

    .line 139
    .line 140
    :cond_4
    sget-object v1, Ljg1;->a:[B

    .line 141
    .line 142
    iget-object v1, v9, Lad0;->i:Lyc0;

    .line 143
    .line 144
    int-to-long v13, v2

    .line 145
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    move-wide/from16 p2, v11

    .line 149
    .line 150
    move-wide v11, v13

    .line 151
    :goto_4
    cmp-long v2, v11, p2

    .line 152
    .line 153
    iget-object v4, v1, Lyc0;->o:Lad0;

    .line 154
    .line 155
    if-lez v2, :cond_c

    .line 156
    .line 157
    monitor-enter v4

    .line 158
    :try_start_0
    iget-boolean v2, v1, Lyc0;->k:Z

    .line 159
    .line 160
    iget-object v10, v1, Lyc0;->m:Leh;

    .line 161
    .line 162
    iget-wide v5, v10, Leh;->k:J

    .line 163
    .line 164
    add-long/2addr v5, v11

    .line 165
    move-wide v15, v5

    .line 166
    iget-wide v5, v1, Lyc0;->j:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 167
    .line 168
    cmp-long v5, v15, v5

    .line 169
    .line 170
    if-lez v5, :cond_5

    .line 171
    .line 172
    const/4 v5, 0x1

    .line 173
    goto :goto_5

    .line 174
    :cond_5
    const/4 v5, 0x0

    .line 175
    :goto_5
    monitor-exit v4

    .line 176
    if-eqz v5, :cond_6

    .line 177
    .line 178
    invoke-interface {v3, v11, v12}, Llh;->skip(J)V

    .line 179
    .line 180
    .line 181
    iget-object v1, v1, Lyc0;->o:Lad0;

    .line 182
    .line 183
    const/4 v2, 0x4

    .line 184
    invoke-virtual {v1, v2}, Lad0;->e(I)V

    .line 185
    .line 186
    .line 187
    goto :goto_9

    .line 188
    :cond_6
    if-eqz v2, :cond_7

    .line 189
    .line 190
    invoke-interface {v3, v11, v12}, Llh;->skip(J)V

    .line 191
    .line 192
    .line 193
    goto :goto_9

    .line 194
    :cond_7
    iget-object v2, v1, Lyc0;->l:Leh;

    .line 195
    .line 196
    invoke-interface {v3, v11, v12, v2}, Lp81;->c(JLeh;)J

    .line 197
    .line 198
    .line 199
    move-result-wide v4

    .line 200
    const-wide/16 v15, -0x1

    .line 201
    .line 202
    cmp-long v2, v4, v15

    .line 203
    .line 204
    if-eqz v2, :cond_b

    .line 205
    .line 206
    sub-long/2addr v11, v4

    .line 207
    iget-object v2, v1, Lyc0;->o:Lad0;

    .line 208
    .line 209
    monitor-enter v2

    .line 210
    :try_start_1
    iget-boolean v4, v1, Lyc0;->n:Z

    .line 211
    .line 212
    if-eqz v4, :cond_8

    .line 213
    .line 214
    iget-object v4, v1, Lyc0;->l:Leh;

    .line 215
    .line 216
    iget-wide v5, v4, Leh;->k:J

    .line 217
    .line 218
    invoke-virtual {v4, v5, v6}, Leh;->skip(J)V

    .line 219
    .line 220
    .line 221
    goto :goto_7

    .line 222
    :catchall_0
    move-exception v0

    .line 223
    goto :goto_8

    .line 224
    :cond_8
    iget-object v4, v1, Lyc0;->m:Leh;

    .line 225
    .line 226
    iget-wide v5, v4, Leh;->k:J

    .line 227
    .line 228
    cmp-long v5, v5, p2

    .line 229
    .line 230
    if-nez v5, :cond_9

    .line 231
    .line 232
    const/4 v5, 0x1

    .line 233
    goto :goto_6

    .line 234
    :cond_9
    const/4 v5, 0x0

    .line 235
    :goto_6
    iget-object v6, v1, Lyc0;->l:Leh;

    .line 236
    .line 237
    invoke-virtual {v4, v6}, Leh;->y(Lp81;)V

    .line 238
    .line 239
    .line 240
    if-eqz v5, :cond_a

    .line 241
    .line 242
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 243
    .line 244
    .line 245
    :cond_a
    :goto_7
    monitor-exit v2

    .line 246
    goto :goto_4

    .line 247
    :goto_8
    monitor-exit v2

    .line 248
    throw v0

    .line 249
    :cond_b
    new-instance v0, Ljava/io/EOFException;

    .line 250
    .line 251
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 252
    .line 253
    .line 254
    throw v0

    .line 255
    :catchall_1
    move-exception v0

    .line 256
    monitor-exit v4

    .line 257
    throw v0

    .line 258
    :cond_c
    sget-object v1, Ljg1;->a:[B

    .line 259
    .line 260
    iget-object v1, v4, Lad0;->b:Ltc0;

    .line 261
    .line 262
    invoke-virtual {v1, v13, v14}, Ltc0;->l(J)V

    .line 263
    .line 264
    .line 265
    :goto_9
    if-eqz v7, :cond_d

    .line 266
    .line 267
    sget-object v1, Ljg1;->b:Lsb0;

    .line 268
    .line 269
    const/4 v2, 0x1

    .line 270
    invoke-virtual {v9, v1, v2}, Lad0;->h(Lsb0;Z)V

    .line 271
    .line 272
    .line 273
    :cond_d
    :goto_a
    iget-object v0, v0, Lwc0;->j:Llh;

    .line 274
    .line 275
    int-to-long v1, v8

    .line 276
    invoke-interface {v0, v1, v2}, Llh;->skip(J)V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_e
    const-string v0, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    .line 281
    .line 282
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :cond_f
    const-string v0, "PROTOCOL_ERROR: TYPE_DATA streamId == 0"

    .line 287
    .line 288
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method public final h(IIII)Ljava/util/List;
    .locals 3

    .line 1
    iget-object v0, p0, Lwc0;->k:Lvc0;

    .line 2
    .line 3
    iput p1, v0, Lvc0;->n:I

    .line 4
    .line 5
    iput p1, v0, Lvc0;->k:I

    .line 6
    .line 7
    iput p2, v0, Lvc0;->o:I

    .line 8
    .line 9
    iput p3, v0, Lvc0;->l:I

    .line 10
    .line 11
    iput p4, v0, Lvc0;->m:I

    .line 12
    .line 13
    iget-object p0, p0, Lwc0;->l:Lcc0;

    .line 14
    .line 15
    iget-object p1, p0, Lcc0;->c:Lsx0;

    .line 16
    .line 17
    iget-object p2, p0, Lcc0;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lsx0;->a()Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-nez p3, :cond_c

    .line 24
    .line 25
    invoke-virtual {p1}, Lsx0;->readByte()B

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    sget-object p4, Ljg1;->a:[B

    .line 30
    .line 31
    and-int/lit16 p4, p3, 0xff

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    const/16 v1, 0x80

    .line 35
    .line 36
    if-eq p4, v1, :cond_b

    .line 37
    .line 38
    and-int/lit16 v2, p3, 0x80

    .line 39
    .line 40
    if-ne v2, v1, :cond_3

    .line 41
    .line 42
    const/16 p3, 0x7f

    .line 43
    .line 44
    invoke-virtual {p0, p4, p3}, Lcc0;->e(II)I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    add-int/lit8 p4, p3, -0x1

    .line 49
    .line 50
    if-ltz p4, :cond_1

    .line 51
    .line 52
    sget-object v1, Lec0;->a:[Lqb0;

    .line 53
    .line 54
    array-length v2, v1

    .line 55
    add-int/lit8 v2, v2, -0x1

    .line 56
    .line 57
    if-gt p4, v2, :cond_1

    .line 58
    .line 59
    aget-object p3, v1, p4

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    sget-object v1, Lec0;->a:[Lqb0;

    .line 66
    .line 67
    array-length v1, v1

    .line 68
    sub-int/2addr p4, v1

    .line 69
    iget v1, p0, Lcc0;->e:I

    .line 70
    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    add-int/2addr v1, p4

    .line 74
    if-ltz v1, :cond_2

    .line 75
    .line 76
    iget-object p4, p0, Lcc0;->d:[Lqb0;

    .line 77
    .line 78
    array-length v2, p4

    .line 79
    if-ge v1, v2, :cond_2

    .line 80
    .line 81
    aget-object p3, p4, v1

    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const-string p0, "Header index too large "

    .line 91
    .line 92
    invoke-static {p3, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :cond_3
    const/16 v1, 0x40

    .line 101
    .line 102
    if-ne p4, v1, :cond_4

    .line 103
    .line 104
    sget-object p3, Lec0;->a:[Lqb0;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-static {p3}, Lec0;->a(Lth;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 114
    .line 115
    .line 116
    move-result-object p4

    .line 117
    new-instance v0, Lqb0;

    .line 118
    .line 119
    invoke-direct {v0, p3, p4}, Lqb0;-><init>(Lth;Lth;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v0}, Lcc0;->c(Lqb0;)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_4
    and-int/lit8 v2, p3, 0x40

    .line 127
    .line 128
    if-ne v2, v1, :cond_5

    .line 129
    .line 130
    const/16 p3, 0x3f

    .line 131
    .line 132
    invoke-virtual {p0, p4, p3}, Lcc0;->e(II)I

    .line 133
    .line 134
    .line 135
    move-result p3

    .line 136
    add-int/lit8 p3, p3, -0x1

    .line 137
    .line 138
    invoke-virtual {p0, p3}, Lcc0;->b(I)Lth;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 143
    .line 144
    .line 145
    move-result-object p4

    .line 146
    new-instance v0, Lqb0;

    .line 147
    .line 148
    invoke-direct {v0, p3, p4}, Lqb0;-><init>(Lth;Lth;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v0}, Lcc0;->c(Lqb0;)V

    .line 152
    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_5
    and-int/lit8 p3, p3, 0x20

    .line 157
    .line 158
    const/16 v1, 0x20

    .line 159
    .line 160
    if-ne p3, v1, :cond_8

    .line 161
    .line 162
    const/16 p3, 0x1f

    .line 163
    .line 164
    invoke-virtual {p0, p4, p3}, Lcc0;->e(II)I

    .line 165
    .line 166
    .line 167
    move-result p3

    .line 168
    iput p3, p0, Lcc0;->a:I

    .line 169
    .line 170
    if-ltz p3, :cond_7

    .line 171
    .line 172
    const/16 p4, 0x1000

    .line 173
    .line 174
    if-gt p3, p4, :cond_7

    .line 175
    .line 176
    iget p4, p0, Lcc0;->g:I

    .line 177
    .line 178
    if-ge p3, p4, :cond_0

    .line 179
    .line 180
    if-nez p3, :cond_6

    .line 181
    .line 182
    iget-object p3, p0, Lcc0;->d:[Lqb0;

    .line 183
    .line 184
    array-length p4, p3

    .line 185
    const/4 v1, 0x0

    .line 186
    invoke-static {p3, v1, p4, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    iget-object p3, p0, Lcc0;->d:[Lqb0;

    .line 190
    .line 191
    array-length p3, p3

    .line 192
    add-int/lit8 p3, p3, -0x1

    .line 193
    .line 194
    iput p3, p0, Lcc0;->e:I

    .line 195
    .line 196
    iput v1, p0, Lcc0;->f:I

    .line 197
    .line 198
    iput v1, p0, Lcc0;->g:I

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_6
    sub-int/2addr p4, p3

    .line 203
    invoke-virtual {p0, p4}, Lcc0;->a(I)I

    .line 204
    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_7
    new-instance p1, Ljava/io/IOException;

    .line 209
    .line 210
    iget p0, p0, Lcc0;->a:I

    .line 211
    .line 212
    new-instance p2, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    const-string p3, "Invalid dynamic table size update "

    .line 215
    .line 216
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    throw p1

    .line 230
    :cond_8
    const/16 p3, 0x10

    .line 231
    .line 232
    if-eq p4, p3, :cond_a

    .line 233
    .line 234
    if-nez p4, :cond_9

    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_9
    const/16 p3, 0xf

    .line 238
    .line 239
    invoke-virtual {p0, p4, p3}, Lcc0;->e(II)I

    .line 240
    .line 241
    .line 242
    move-result p3

    .line 243
    add-int/lit8 p3, p3, -0x1

    .line 244
    .line 245
    invoke-virtual {p0, p3}, Lcc0;->b(I)Lth;

    .line 246
    .line 247
    .line 248
    move-result-object p3

    .line 249
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 250
    .line 251
    .line 252
    move-result-object p4

    .line 253
    new-instance v0, Lqb0;

    .line 254
    .line 255
    invoke-direct {v0, p3, p4}, Lqb0;-><init>(Lth;Lth;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_a
    :goto_1
    sget-object p3, Lec0;->a:[Lqb0;

    .line 264
    .line 265
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    invoke-static {p3}, Lec0;->a(Lth;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Lcc0;->d()Lth;

    .line 273
    .line 274
    .line 275
    move-result-object p4

    .line 276
    new-instance v0, Lqb0;

    .line 277
    .line 278
    invoke-direct {v0, p3, p4}, Lqb0;-><init>(Lth;Lth;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :cond_b
    const-string p0, "index == 0"

    .line 287
    .line 288
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-object v0

    .line 292
    :cond_c
    invoke-static {p2}, Lbl;->F(Ljava/lang/Iterable;)Ljava/util/List;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 297
    .line 298
    .line 299
    return-object p0
.end method

.method public final j(Lpc0;III)V
    .locals 9

    .line 1
    if-eqz p4, :cond_9

    .line 2
    .line 3
    and-int/lit8 v0, p3, 0x1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move v7, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v7, v1

    .line 12
    :goto_0
    and-int/lit8 v0, p3, 0x8

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lwc0;->j:Llh;

    .line 17
    .line 18
    invoke-interface {v0}, Llh;->readByte()B

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sget-object v3, Ljg1;->a:[B

    .line 23
    .line 24
    and-int/lit16 v0, v0, 0xff

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v0, v1

    .line 28
    :goto_1
    and-int/lit8 v3, p3, 0x20

    .line 29
    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    iget-object v3, p0, Lwc0;->j:Llh;

    .line 33
    .line 34
    invoke-interface {v3}, Llh;->readInt()I

    .line 35
    .line 36
    .line 37
    invoke-interface {v3}, Llh;->readByte()B

    .line 38
    .line 39
    .line 40
    sget-object v3, Ljg1;->a:[B

    .line 41
    .line 42
    add-int/lit8 p2, p2, -0x5

    .line 43
    .line 44
    :cond_2
    invoke-static {p2, p3, v0}, Lbh;->v(III)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {p0, p2, v0, p3, p4}, Lwc0;->h(IIII)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object v5, p1, Lpc0;->k:Ltc0;

    .line 53
    .line 54
    if-eqz p4, :cond_3

    .line 55
    .line 56
    and-int/lit8 p1, p4, 0x1

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    move v1, v2

    .line 61
    :cond_3
    const-wide/16 p1, 0x0

    .line 62
    .line 63
    const/16 p3, 0x5b

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    iget-object v0, v5, Ltc0;->r:Lob1;

    .line 68
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v2, v5, Ltc0;->l:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p3, "] onHeaders"

    .line 86
    .line 87
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    new-instance v3, Lrc0;

    .line 95
    .line 96
    move v6, p4

    .line 97
    move v8, v7

    .line 98
    move-object v7, p0

    .line 99
    invoke-direct/range {v3 .. v8}, Lrc0;-><init>(Ljava/lang/String;Ltc0;ILjava/util/List;Z)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3, p1, p2}, Lob1;->c(Ljb1;J)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    move v4, p4

    .line 107
    monitor-enter v5

    .line 108
    :try_start_0
    invoke-virtual {v5, v4}, Ltc0;->g(I)Lad0;

    .line 109
    .line 110
    .line 111
    move-result-object p4

    .line 112
    if-nez p4, :cond_8

    .line 113
    .line 114
    iget-boolean p4, v5, Ltc0;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    .line 116
    if-eqz p4, :cond_5

    .line 117
    .line 118
    monitor-exit v5

    .line 119
    return-void

    .line 120
    :cond_5
    :try_start_1
    iget p4, v5, Ltc0;->m:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    .line 122
    if-gt v4, p4, :cond_6

    .line 123
    .line 124
    monitor-exit v5

    .line 125
    return-void

    .line 126
    :cond_6
    :try_start_2
    rem-int/lit8 p4, v4, 0x2

    .line 127
    .line 128
    iget v0, v5, Ltc0;->n:I

    .line 129
    .line 130
    rem-int/lit8 v0, v0, 0x2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    .line 132
    if-ne p4, v0, :cond_7

    .line 133
    .line 134
    monitor-exit v5

    .line 135
    return-void

    .line 136
    :cond_7
    :try_start_3
    invoke-static {p0}, Ljg1;->o(Ljava/util/List;)Lsb0;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    new-instance v3, Lad0;

    .line 141
    .line 142
    const/4 v6, 0x0

    .line 143
    invoke-direct/range {v3 .. v8}, Lad0;-><init>(ILtc0;ZZLsb0;)V

    .line 144
    .line 145
    .line 146
    iput v4, v5, Ltc0;->m:I

    .line 147
    .line 148
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iget-object p4, v5, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 153
    .line 154
    invoke-interface {p4, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object p0, v5, Ltc0;->p:Lqb1;

    .line 158
    .line 159
    invoke-virtual {p0}, Lqb1;->d()Lob1;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    new-instance p4, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    iget-object v0, v5, Ltc0;->l:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p4, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string p3, "] onStream"

    .line 180
    .line 181
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    new-instance p4, Lnc0;

    .line 189
    .line 190
    invoke-direct {p4, p3, v5, v3, v2}, Lnc0;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p4, p1, p2}, Lob1;->c(Ljb1;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 194
    .line 195
    .line 196
    monitor-exit v5

    .line 197
    return-void

    .line 198
    :catchall_0
    move-exception v0

    .line 199
    move-object p0, v0

    .line 200
    goto :goto_2

    .line 201
    :cond_8
    monitor-exit v5

    .line 202
    invoke-static {p0}, Ljg1;->o(Ljava/util/List;)Lsb0;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p4, p0, v7}, Lad0;->h(Lsb0;Z)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :goto_2
    monitor-exit v5

    .line 211
    throw p0

    .line 212
    :cond_9
    const-string p0, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    .line 213
    .line 214
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public final l(Lpc0;III)V
    .locals 3

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    and-int/lit8 v0, p3, 0x8

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lwc0;->j:Llh;

    .line 8
    .line 9
    invoke-interface {v0}, Llh;->readByte()B

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Ljg1;->a:[B

    .line 14
    .line 15
    and-int/lit16 v0, v0, 0xff

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Lwc0;->j:Llh;

    .line 20
    .line 21
    invoke-interface {v1}, Llh;->readInt()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const v2, 0x7fffffff

    .line 26
    .line 27
    .line 28
    and-int/2addr v1, v2

    .line 29
    add-int/lit8 p2, p2, -0x4

    .line 30
    .line 31
    invoke-static {p2, p3, v0}, Lbh;->v(III)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    invoke-virtual {p0, p2, v0, p3, p4}, Lwc0;->h(IIII)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p1, p1, Lpc0;->k:Ltc0;

    .line 40
    .line 41
    monitor-enter p1

    .line 42
    :try_start_0
    iget-object p2, p1, Ltc0;->H:Ljava/util/LinkedHashSet;

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-interface {p2, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    const/4 p0, 0x2

    .line 55
    invoke-virtual {p1, v1, p0}, Ltc0;->s(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    monitor-exit p1

    .line 59
    return-void

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :try_start_1
    iget-object p2, p1, Ltc0;->H:Ljava/util/LinkedHashSet;

    .line 63
    .line 64
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-interface {p2, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    .line 71
    monitor-exit p1

    .line 72
    iget-object p2, p1, Ltc0;->r:Lob1;

    .line 73
    .line 74
    new-instance p3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object p4, p1, Ltc0;->l:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const/16 p4, 0x5b

    .line 85
    .line 86
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string p4, "] onRequest"

    .line 93
    .line 94
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    new-instance p4, Lrc0;

    .line 102
    .line 103
    invoke-direct {p4, p3, p1, v1, p0}, Lrc0;-><init>(Ljava/lang/String;Ltc0;ILjava/util/List;)V

    .line 104
    .line 105
    .line 106
    const-wide/16 p0, 0x0

    .line 107
    .line 108
    invoke-virtual {p2, p4, p0, p1}, Lob1;->c(Ljb1;J)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_1
    monitor-exit p1

    .line 113
    throw p0

    .line 114
    :cond_2
    const-string p0, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    .line 115
    .line 116
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
