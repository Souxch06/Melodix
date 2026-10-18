.class public final Lmr;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/Throwable;

.field public final synthetic c:Ljava/lang/Thread;

.field public final synthetic d:Ldn;

.field public final synthetic e:Lor;


# direct methods
.method public constructor <init>(Lor;JLjava/lang/Throwable;Ljava/lang/Thread;Ldn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lmr;->e:Lor;

    .line 5
    .line 6
    iput-wide p2, p0, Lmr;->a:J

    .line 7
    .line 8
    iput-object p4, p0, Lmr;->b:Ljava/lang/Throwable;

    .line 9
    .line 10
    iput-object p5, p0, Lmr;->c:Ljava/lang/Thread;

    .line 11
    .line 12
    iput-object p6, p0, Lmr;->d:Ldn;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    iget-wide v3, v0, Lmr;->a:J

    .line 6
    .line 7
    div-long v1, v3, v1

    .line 8
    .line 9
    iget-object v5, v0, Lmr;->e:Lor;

    .line 10
    .line 11
    iget-object v6, v5, Lor;->m:Li7;

    .line 12
    .line 13
    iget-object v6, v6, Li7;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v6, Lxs;

    .line 16
    .line 17
    invoke-virtual {v6}, Lxs;->c()Ljava/util/NavigableSet;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    const/4 v8, 0x0

    .line 26
    if-nez v7, :cond_0

    .line 27
    .line 28
    invoke-interface {v6}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    check-cast v6, Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object v6, v8

    .line 36
    :goto_0
    if-nez v6, :cond_1

    .line 37
    .line 38
    invoke-static {v8}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0

    .line 43
    :cond_1
    iget-object v7, v5, Lor;->c:Ls7;

    .line 44
    .line 45
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :try_start_0
    iget-object v9, v7, Ls7;->l:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v9, Lm30;

    .line 51
    .line 52
    iget-object v7, v7, Ls7;->k:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v7, Ljava/lang/String;

    .line 55
    .line 56
    new-instance v10, Ljava/io/File;

    .line 57
    .line 58
    iget-object v9, v9, Lm30;->l:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v9, Ljava/io/File;

    .line 61
    .line 62
    invoke-direct {v10, v9, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    :catch_0
    iget-object v7, v5, Lor;->m:Li7;

    .line 69
    .line 70
    iget-object v9, v7, Li7;->j:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v9, Lvs;

    .line 73
    .line 74
    iget-object v10, v9, Lvs;->a:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v11

    .line 80
    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    iget v11, v11, Landroid/content/res/Configuration;->orientation:I

    .line 85
    .line 86
    iget-object v12, v9, Lvs;->d:Lxn0;

    .line 87
    .line 88
    new-instance v13, Ljava/util/Stack;

    .line 89
    .line 90
    invoke-direct {v13}, Ljava/util/Stack;-><init>()V

    .line 91
    .line 92
    .line 93
    iget-object v14, v0, Lmr;->b:Ljava/lang/Throwable;

    .line 94
    .line 95
    :goto_1
    if-eqz v14, :cond_2

    .line 96
    .line 97
    invoke-virtual {v13, v14}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v14}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 101
    .line 102
    .line 103
    move-result-object v14

    .line 104
    goto :goto_1

    .line 105
    :cond_2
    move-object/from16 v19, v8

    .line 106
    .line 107
    :goto_2
    invoke-virtual {v13}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v14

    .line 111
    if-nez v14, :cond_3

    .line 112
    .line 113
    invoke-virtual {v13}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v14

    .line 117
    check-cast v14, Ljava/lang/Throwable;

    .line 118
    .line 119
    new-instance v15, Ler0;

    .line 120
    .line 121
    invoke-virtual {v14}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v16

    .line 125
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    move-result-object v17

    .line 129
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v17

    .line 133
    invoke-virtual {v14}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 134
    .line 135
    .line 136
    move-result-object v14

    .line 137
    invoke-virtual {v12, v14}, Lxn0;->e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;

    .line 138
    .line 139
    .line 140
    move-result-object v18

    .line 141
    const/16 v20, 0xe

    .line 142
    .line 143
    invoke-direct/range {v15 .. v20}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 144
    .line 145
    .line 146
    move-object/from16 v19, v15

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_3
    move-object/from16 v15, v19

    .line 150
    .line 151
    new-instance v13, Lmd;

    .line 152
    .line 153
    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    .line 154
    .line 155
    .line 156
    const-string v14, "crash"

    .line 157
    .line 158
    iput-object v14, v13, Lmd;->b:Ljava/lang/String;

    .line 159
    .line 160
    iput-wide v1, v13, Lmd;->a:J

    .line 161
    .line 162
    iget-byte v1, v13, Lmd;->g:B

    .line 163
    .line 164
    const/4 v2, 0x1

    .line 165
    or-int/2addr v1, v2

    .line 166
    int-to-byte v1, v1

    .line 167
    iput-byte v1, v13, Lmd;->g:B

    .line 168
    .line 169
    sget-object v1, Lt11;->o:Lt11;

    .line 170
    .line 171
    invoke-virtual {v1, v10}, Lt11;->m(Landroid/content/Context;)Ljs;

    .line 172
    .line 173
    .line 174
    move-result-object v17

    .line 175
    move-object/from16 v1, v17

    .line 176
    .line 177
    check-cast v1, Lxd;

    .line 178
    .line 179
    iget v1, v1, Lxd;->c:I

    .line 180
    .line 181
    move-object/from16 v20, v8

    .line 182
    .line 183
    if-lez v1, :cond_5

    .line 184
    .line 185
    const/16 v8, 0x64

    .line 186
    .line 187
    if-eq v1, v8, :cond_4

    .line 188
    .line 189
    move v1, v2

    .line 190
    goto :goto_3

    .line 191
    :cond_4
    const/4 v1, 0x0

    .line 192
    :goto_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    move-object/from16 v16, v1

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_5
    move-object/from16 v16, v20

    .line 200
    .line 201
    :goto_4
    invoke-static {v10}, Lt11;->l(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 202
    .line 203
    .line 204
    move-result-object v18

    .line 205
    new-instance v1, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .line 209
    .line 210
    iget-object v8, v15, Ler0;->m:Ljava/lang/Object;

    .line 211
    .line 212
    check-cast v8, [Ljava/lang/StackTraceElement;

    .line 213
    .line 214
    iget-object v10, v0, Lmr;->c:Ljava/lang/Thread;

    .line 215
    .line 216
    invoke-virtual {v10}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    const-string v19, "Null name"

    .line 221
    .line 222
    if-eqz v2, :cond_e

    .line 223
    .line 224
    const/4 v14, 0x4

    .line 225
    invoke-static {v8, v14}, Lvs;->d([Ljava/lang/StackTraceElement;I)Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    const-string v22, "Null frames"

    .line 230
    .line 231
    if-eqz v8, :cond_d

    .line 232
    .line 233
    move/from16 v23, v11

    .line 234
    .line 235
    new-instance v11, Ltd;

    .line 236
    .line 237
    invoke-direct {v11, v2, v14, v8}, Ltd;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    if-eqz v8, :cond_9

    .line 260
    .line 261
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v8

    .line 265
    check-cast v8, Ljava/util/Map$Entry;

    .line 266
    .line 267
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v11

    .line 271
    check-cast v11, Ljava/lang/Thread;

    .line 272
    .line 273
    invoke-virtual {v11, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v14

    .line 277
    if-nez v14, :cond_8

    .line 278
    .line 279
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v8

    .line 283
    check-cast v8, [Ljava/lang/StackTraceElement;

    .line 284
    .line 285
    invoke-virtual {v12, v8}, Lxn0;->e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;

    .line 286
    .line 287
    .line 288
    move-result-object v8

    .line 289
    invoke-virtual {v11}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v11

    .line 293
    if-eqz v11, :cond_7

    .line 294
    .line 295
    const/4 v14, 0x0

    .line 296
    invoke-static {v8, v14}, Lvs;->d([Ljava/lang/StackTraceElement;I)Ljava/util/List;

    .line 297
    .line 298
    .line 299
    move-result-object v8

    .line 300
    if-eqz v8, :cond_6

    .line 301
    .line 302
    move-object/from16 v21, v2

    .line 303
    .line 304
    new-instance v2, Ltd;

    .line 305
    .line 306
    invoke-direct {v2, v11, v14, v8}, Ltd;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    goto :goto_6

    .line 313
    :cond_6
    invoke-static/range {v22 .. v22}, Lwd1;->d(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    return-object v20

    .line 317
    :cond_7
    invoke-static/range {v19 .. v19}, Lwd1;->d(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    return-object v20

    .line 321
    :cond_8
    move-object/from16 v21, v2

    .line 322
    .line 323
    const/4 v14, 0x0

    .line 324
    :goto_6
    move-object/from16 v2, v21

    .line 325
    .line 326
    goto :goto_5

    .line 327
    :cond_9
    const/4 v14, 0x0

    .line 328
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 329
    .line 330
    .line 331
    move-result-object v25

    .line 332
    invoke-static {v15, v14}, Lvs;->c(Ler0;I)Lrd;

    .line 333
    .line 334
    .line 335
    move-result-object v26

    .line 336
    invoke-static {}, Lvs;->e()Lsd;

    .line 337
    .line 338
    .line 339
    move-result-object v28

    .line 340
    invoke-virtual {v9}, Lvs;->a()Ljava/util/List;

    .line 341
    .line 342
    .line 343
    move-result-object v29

    .line 344
    if-eqz v29, :cond_c

    .line 345
    .line 346
    new-instance v24, Lpd;

    .line 347
    .line 348
    const/16 v27, 0x0

    .line 349
    .line 350
    invoke-direct/range {v24 .. v29}, Lpd;-><init>(Ljava/util/List;Lrd;Lwr;Lsd;Ljava/util/List;)V

    .line 351
    .line 352
    .line 353
    new-instance v12, Lod;

    .line 354
    .line 355
    move/from16 v21, v14

    .line 356
    .line 357
    const/4 v14, 0x0

    .line 358
    const/4 v15, 0x0

    .line 359
    move-object v1, v13

    .line 360
    move/from16 v2, v21

    .line 361
    .line 362
    move/from16 v19, v23

    .line 363
    .line 364
    move-object/from16 v13, v24

    .line 365
    .line 366
    invoke-direct/range {v12 .. v19}, Lod;-><init>(Lpd;Ljava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljs;Ljava/util/List;I)V

    .line 367
    .line 368
    .line 369
    move/from16 v8, v19

    .line 370
    .line 371
    iput-object v12, v1, Lmd;->c:Lks;

    .line 372
    .line 373
    invoke-virtual {v9, v8}, Lvs;->b(I)Lzd;

    .line 374
    .line 375
    .line 376
    move-result-object v8

    .line 377
    iput-object v8, v1, Lmd;->d:Lls;

    .line 378
    .line 379
    invoke-virtual {v1}, Lmd;->a()Lnd;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    iget-object v8, v7, Li7;->m:Ljava/lang/Object;

    .line 384
    .line 385
    check-cast v8, Ls7;

    .line 386
    .line 387
    iget-object v9, v7, Li7;->n:Ljava/lang/Object;

    .line 388
    .line 389
    check-cast v9, Lnm;

    .line 390
    .line 391
    sget-object v10, Lv00;->j:Lv00;

    .line 392
    .line 393
    invoke-static {v1, v8, v9, v10}, Li7;->h(Lnd;Ls7;Lnm;Ljava/util/Map;)Lnd;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    invoke-static {v1, v9}, Li7;->i(Lnd;Lnm;)Lqs;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    iget-object v7, v7, Li7;->k:Ljava/lang/Object;

    .line 402
    .line 403
    check-cast v7, Lxs;

    .line 404
    .line 405
    const/4 v8, 0x1

    .line 406
    invoke-virtual {v7, v1, v6, v8}, Lxs;->d(Lqs;Ljava/lang/String;Z)V

    .line 407
    .line 408
    .line 409
    const-string v1, ".ae"

    .line 410
    .line 411
    :try_start_1
    iget-object v7, v5, Lor;->g:Lm30;

    .line 412
    .line 413
    new-instance v8, Ljava/lang/StringBuilder;

    .line 414
    .line 415
    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v8, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    new-instance v3, Ljava/io/File;

    .line 426
    .line 427
    iget-object v4, v7, Lm30;->l:Ljava/lang/Object;

    .line 428
    .line 429
    check-cast v4, Ljava/io/File;

    .line 430
    .line 431
    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-eqz v1, :cond_a

    .line 439
    .line 440
    goto :goto_7

    .line 441
    :cond_a
    new-instance v1, Ljava/io/IOException;

    .line 442
    .line 443
    const-string v3, "Create new file failed."

    .line 444
    .line 445
    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    throw v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 449
    :catch_1
    :goto_7
    iget-object v1, v0, Lmr;->d:Ldn;

    .line 450
    .line 451
    invoke-virtual {v5, v2, v1, v2}, Lor;->a(ZLdn;Z)V

    .line 452
    .line 453
    .line 454
    new-instance v2, Lvh;

    .line 455
    .line 456
    invoke-direct {v2}, Lvh;-><init>()V

    .line 457
    .line 458
    .line 459
    iget-object v2, v2, Lvh;->a:Ljava/lang/String;

    .line 460
    .line 461
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 462
    .line 463
    invoke-virtual {v5, v2, v3}, Lor;->b(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 464
    .line 465
    .line 466
    iget-object v2, v5, Lor;->b:Lqt;

    .line 467
    .line 468
    invoke-virtual {v2}, Lqt;->l()Z

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    if-nez v2, :cond_b

    .line 473
    .line 474
    invoke-static/range {v20 .. v20}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    return-object v0

    .line 479
    :cond_b
    iget-object v1, v1, Ldn;->h:Ljava/lang/Object;

    .line 480
    .line 481
    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 482
    .line 483
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    check-cast v1, Llb1;

    .line 488
    .line 489
    iget-object v1, v1, Llb1;->a:Ljd2;

    .line 490
    .line 491
    iget-object v2, v5, Lor;->e:Lc9;

    .line 492
    .line 493
    iget-object v2, v2, Lc9;->k:Ljava/lang/Object;

    .line 494
    .line 495
    check-cast v2, Lzs;

    .line 496
    .line 497
    new-instance v3, Lbv1;

    .line 498
    .line 499
    invoke-direct {v3, v0, v6}, Lbv1;-><init>(Lmr;Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    invoke-virtual {v1, v2, v3}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    return-object v0

    .line 507
    :cond_c
    const-string v0, "Null binaries"

    .line 508
    .line 509
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    return-object v20

    .line 513
    :cond_d
    invoke-static/range {v22 .. v22}, Lwd1;->d(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    return-object v20

    .line 517
    :cond_e
    invoke-static/range {v19 .. v19}, Lwd1;->d(Ljava/lang/String;)V

    .line 518
    .line 519
    .line 520
    return-object v20
.end method
