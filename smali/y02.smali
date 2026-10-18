.class public final Ly02;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lo22;


# static fields
.field public static volatile O:Ly02;


# instance fields
.field public A:Li82;

.field public B:Lou1;

.field public C:Lky1;

.field public D:Lj52;

.field public E:Z

.field public F:Ljava/lang/Boolean;

.field public G:J

.field public volatile H:Ljava/lang/Boolean;

.field public volatile I:Z

.field public J:I

.field public K:I

.field public final L:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final M:J

.field public final N:J

.field public final j:Landroid/content/Context;

.field public final k:Z

.field public final l:Ltb0;

.field public final m:Lmt1;

.field public final n:Lvz1;

.field public final o:Lzy1;

.field public final p:Ls02;

.field public final q:Lh92;

.field public final r:Lcb2;

.field public final s:Lry1;

.field public final t:Lmz;

.field public final u:Lz52;

.field public final v:Lc52;

.field public final w:Lfw1;

.field public final x:Li52;

.field public final y:Ljava/lang/String;

.field public z:Lpy1;


# direct methods
.method public constructor <init>(Lz22;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ly02;->E:Z

    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    iget-object v1, p1, Lz22;->a:Landroid/content/Context;

    .line 15
    .line 16
    new-instance v2, Ltb0;

    .line 17
    .line 18
    const/16 v3, 0x18

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ltb0;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iput-object v2, p0, Ly02;->l:Ltb0;

    .line 24
    .line 25
    sput-object v2, Lk42;->t:Ltb0;

    .line 26
    .line 27
    iput-object v1, p0, Ly02;->j:Landroid/content/Context;

    .line 28
    .line 29
    iget-boolean v2, p1, Lz22;->e:Z

    .line 30
    .line 31
    iput-boolean v2, p0, Ly02;->k:Z

    .line 32
    .line 33
    iget-object v2, p1, Lz22;->b:Ljava/lang/Boolean;

    .line 34
    .line 35
    iput-object v2, p0, Ly02;->H:Ljava/lang/Boolean;

    .line 36
    .line 37
    iget-object v2, p1, Lz22;->h:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, p0, Ly02;->y:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    iput-boolean v2, p0, Ly02;->I:Z

    .line 43
    .line 44
    sget-object v3, Lp52;->b:Lt42;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    if-nez v3, :cond_7

    .line 48
    .line 49
    sget-object v3, Lp52;->a:Ljava/lang/Object;

    .line 50
    .line 51
    monitor-enter v3

    .line 52
    :try_start_0
    sget-object v5, Lp52;->b:Lt42;

    .line 53
    .line 54
    if-nez v5, :cond_6

    .line 55
    .line 56
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 57
    :try_start_1
    sget-object v5, Lp52;->b:Lt42;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    if-eqz v6, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    move-object v6, v1

    .line 67
    :goto_0
    if-eqz v5, :cond_1

    .line 68
    .line 69
    iget-object v7, v5, Lt42;->a:Landroid/content/Context;

    .line 70
    .line 71
    if-eq v7, v6, :cond_5

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto :goto_3

    .line 76
    :cond_1
    :goto_1
    if-eqz v5, :cond_4

    .line 77
    .line 78
    sget-object v5, Lu42;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 79
    .line 80
    invoke-virtual {v5}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-nez v7, :cond_2

    .line 93
    .line 94
    invoke-static {}, Ly52;->a()V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    if-nez p0, :cond_3

    .line 103
    .line 104
    throw v4

    .line 105
    :cond_3
    new-instance p0, Ljava/lang/ClassCastException;

    .line 106
    .line 107
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 108
    .line 109
    .line 110
    throw p0

    .line 111
    :cond_4
    :goto_2
    new-instance v5, Lnt;

    .line 112
    .line 113
    const/4 v7, 0x3

    .line 114
    invoke-direct {v5, v6, v7}, Lnt;-><init>(Landroid/content/Context;I)V

    .line 115
    .line 116
    .line 117
    invoke-static {v5}, Lkn1;->h(Lsa1;)Lsa1;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    new-instance v7, Lt42;

    .line 122
    .line 123
    invoke-direct {v7, v6, v5}, Lt42;-><init>(Landroid/content/Context;Lsa1;)V

    .line 124
    .line 125
    .line 126
    sput-object v7, Lp52;->b:Lt42;

    .line 127
    .line 128
    sget-object v5, Lp52;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 129
    .line 130
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 131
    .line 132
    .line 133
    :cond_5
    monitor-exit v3

    .line 134
    goto :goto_4

    .line 135
    :goto_3
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    :try_start_2
    throw p0

    .line 137
    :catchall_1
    move-exception p0

    .line 138
    goto :goto_5

    .line 139
    :cond_6
    :goto_4
    monitor-exit v3

    .line 140
    goto :goto_6

    .line 141
    :goto_5
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 142
    throw p0

    .line 143
    :cond_7
    :goto_6
    sget-object v3, Lmz;->l:Lmz;

    .line 144
    .line 145
    iput-object v3, p0, Ly02;->t:Lmz;

    .line 146
    .line 147
    new-instance v3, Lu32;

    .line 148
    .line 149
    sget-object v5, Le32;->a:Ls7;

    .line 150
    .line 151
    sget-object v6, Lt5;->a:Ls5;

    .line 152
    .line 153
    sget-object v7, Lta0;->c:Lta0;

    .line 154
    .line 155
    invoke-direct {v3, v1, v5, v6, v7}, Lua0;-><init>(Landroid/content/Context;Ls7;Lt5;Lta0;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    new-array v6, v0, [Ljava/lang/String;

    .line 167
    .line 168
    const-string v7, "com.google.android.gms.measurement#"

    .line 169
    .line 170
    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    invoke-static {}, Lo80;->b()Lo80;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    new-instance v8, Lxn0;

    .line 179
    .line 180
    const/16 v9, 0x1a

    .line 181
    .line 182
    invoke-direct {v8, v5, v9, v6}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    iput-object v8, v7, Lo80;->b:Ljava/lang/Object;

    .line 186
    .line 187
    invoke-virtual {v7}, Lo80;->a()Lo80;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-virtual {v3, v0, v5}, Lua0;->b(ILo80;)Ljd2;

    .line 192
    .line 193
    .line 194
    sget-object v3, Le52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    if-eqz v5, :cond_8

    .line 201
    .line 202
    goto :goto_8

    .line 203
    :cond_8
    :try_start_3
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 204
    .line 205
    .line 206
    move-result-object v1
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0

    .line 207
    goto :goto_7

    .line 208
    :catch_0
    invoke-static {}, Le52;->b()V

    .line 209
    .line 210
    .line 211
    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 212
    .line 213
    sget-object v5, Le52;->m:Lsa1;

    .line 214
    .line 215
    invoke-interface {v5}, Lsa1;->get()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 220
    .line 221
    const-string v6, "context.getApplicationContext() yielded NullPointerException"

    .line 222
    .line 223
    new-array v7, v0, [Ljava/lang/Object;

    .line 224
    .line 225
    invoke-static {v1, v5, v4, v6, v7}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    move-object v1, v4

    .line 229
    :goto_7
    if-eqz v1, :cond_b

    .line 230
    .line 231
    :cond_9
    invoke-virtual {v3, v4, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    if-eqz v5, :cond_a

    .line 236
    .line 237
    goto :goto_8

    .line 238
    :cond_a
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    if-eqz v5, :cond_9

    .line 243
    .line 244
    :cond_b
    :goto_8
    iget-object v1, p1, Lz22;->f:Ljava/lang/Long;

    .line 245
    .line 246
    if-eqz v1, :cond_c

    .line 247
    .line 248
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 249
    .line 250
    .line 251
    move-result-wide v3

    .line 252
    goto :goto_9

    .line 253
    :cond_c
    iget-object v1, p0, Ly02;->t:Lmz;

    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 256
    .line 257
    .line 258
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 259
    .line 260
    .line 261
    move-result-wide v3

    .line 262
    :goto_9
    iput-wide v3, p0, Ly02;->M:J

    .line 263
    .line 264
    iget-object v1, p1, Lz22;->g:Ljava/lang/Long;

    .line 265
    .line 266
    if-eqz v1, :cond_d

    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 269
    .line 270
    .line 271
    move-result-wide v3

    .line 272
    goto :goto_a

    .line 273
    :cond_d
    iget-object v1, p0, Ly02;->t:Lmz;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    .line 277
    .line 278
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 279
    .line 280
    .line 281
    move-result-wide v3

    .line 282
    :goto_a
    iput-wide v3, p0, Ly02;->N:J

    .line 283
    .line 284
    new-instance v1, Lmt1;

    .line 285
    .line 286
    invoke-direct {v1, p0}, Let;-><init>(Ly02;)V

    .line 287
    .line 288
    .line 289
    sget-object v3, Lok0;->t:Lok0;

    .line 290
    .line 291
    iput-object v3, v1, Lmt1;->m:Llt1;

    .line 292
    .line 293
    iput-object v1, p0, Ly02;->m:Lmt1;

    .line 294
    .line 295
    new-instance v1, Lvz1;

    .line 296
    .line 297
    invoke-direct {v1, p0}, Lvz1;-><init>(Ly02;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v1}, Lm22;->o()V

    .line 301
    .line 302
    .line 303
    iput-object v1, p0, Ly02;->n:Lvz1;

    .line 304
    .line 305
    new-instance v1, Lzy1;

    .line 306
    .line 307
    invoke-direct {v1, p0}, Lzy1;-><init>(Ly02;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v1}, Lm22;->o()V

    .line 311
    .line 312
    .line 313
    iput-object v1, p0, Ly02;->o:Lzy1;

    .line 314
    .line 315
    new-instance v3, Lcb2;

    .line 316
    .line 317
    invoke-direct {v3, p0}, Lcb2;-><init>(Ly02;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3}, Lm22;->o()V

    .line 321
    .line 322
    .line 323
    iput-object v3, p0, Ly02;->r:Lcb2;

    .line 324
    .line 325
    new-instance v3, Lzz1;

    .line 326
    .line 327
    invoke-direct {v3, p0, p1}, Lzz1;-><init>(Ly02;Lz22;)V

    .line 328
    .line 329
    .line 330
    new-instance v4, Lry1;

    .line 331
    .line 332
    invoke-direct {v4, v3}, Lry1;-><init>(Lzz1;)V

    .line 333
    .line 334
    .line 335
    iput-object v4, p0, Ly02;->s:Lry1;

    .line 336
    .line 337
    new-instance v3, Lfw1;

    .line 338
    .line 339
    invoke-direct {v3, p0}, Lfw1;-><init>(Ly02;)V

    .line 340
    .line 341
    .line 342
    iput-object v3, p0, Ly02;->w:Lfw1;

    .line 343
    .line 344
    new-instance v3, Lz52;

    .line 345
    .line 346
    invoke-direct {v3, p0}, Lz52;-><init>(Ly02;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3}, Lay1;->n()V

    .line 350
    .line 351
    .line 352
    iput-object v3, p0, Ly02;->u:Lz52;

    .line 353
    .line 354
    new-instance v3, Lc52;

    .line 355
    .line 356
    invoke-direct {v3, p0}, Lc52;-><init>(Ly02;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v3}, Lay1;->n()V

    .line 360
    .line 361
    .line 362
    iput-object v3, p0, Ly02;->v:Lc52;

    .line 363
    .line 364
    new-instance v4, Lh92;

    .line 365
    .line 366
    invoke-direct {v4, p0}, Lh92;-><init>(Ly02;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v4}, Lay1;->n()V

    .line 370
    .line 371
    .line 372
    iput-object v4, p0, Ly02;->q:Lh92;

    .line 373
    .line 374
    new-instance v4, Li52;

    .line 375
    .line 376
    invoke-direct {v4, p0}, Let;-><init>(Ly02;)V

    .line 377
    .line 378
    .line 379
    iget-object v5, v4, Let;->j:Ljava/lang/Object;

    .line 380
    .line 381
    check-cast v5, Ly02;

    .line 382
    .line 383
    iget v6, v5, Ly02;->J:I

    .line 384
    .line 385
    add-int/2addr v6, v2

    .line 386
    iput v6, v5, Ly02;->J:I

    .line 387
    .line 388
    invoke-virtual {v4}, Lm22;->o()V

    .line 389
    .line 390
    .line 391
    iput-object v4, p0, Ly02;->x:Li52;

    .line 392
    .line 393
    new-instance v4, Ls02;

    .line 394
    .line 395
    invoke-direct {v4, p0}, Ls02;-><init>(Ly02;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v4}, Lm22;->o()V

    .line 399
    .line 400
    .line 401
    iput-object v4, p0, Ly02;->p:Ls02;

    .line 402
    .line 403
    iget-object v5, p1, Lz22;->d:Llw1;

    .line 404
    .line 405
    if-eqz v5, :cond_e

    .line 406
    .line 407
    iget-wide v5, v5, Llw1;->k:J

    .line 408
    .line 409
    const-wide/16 v7, 0x0

    .line 410
    .line 411
    cmp-long v5, v5, v7

    .line 412
    .line 413
    if-eqz v5, :cond_e

    .line 414
    .line 415
    goto :goto_b

    .line 416
    :cond_e
    move v0, v2

    .line 417
    :goto_b
    iget-object v5, p0, Ly02;->j:Landroid/content/Context;

    .line 418
    .line 419
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 420
    .line 421
    .line 422
    move-result-object v5

    .line 423
    instance-of v5, v5, Landroid/app/Application;

    .line 424
    .line 425
    if-eqz v5, :cond_10

    .line 426
    .line 427
    invoke-static {v3}, Ly02;->k(Lay1;)V

    .line 428
    .line 429
    .line 430
    iget-object v1, v3, Let;->j:Ljava/lang/Object;

    .line 431
    .line 432
    check-cast v1, Ly02;

    .line 433
    .line 434
    iget-object v1, v1, Ly02;->j:Landroid/content/Context;

    .line 435
    .line 436
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    instance-of v1, v1, Landroid/app/Application;

    .line 441
    .line 442
    if-eqz v1, :cond_11

    .line 443
    .line 444
    iget-object v1, v3, Let;->j:Ljava/lang/Object;

    .line 445
    .line 446
    check-cast v1, Ly02;

    .line 447
    .line 448
    iget-object v1, v1, Ly02;->j:Landroid/content/Context;

    .line 449
    .line 450
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    check-cast v1, Landroid/app/Application;

    .line 455
    .line 456
    iget-object v5, v3, Lc52;->l:Lcx1;

    .line 457
    .line 458
    if-nez v5, :cond_f

    .line 459
    .line 460
    new-instance v5, Lcx1;

    .line 461
    .line 462
    invoke-direct {v5, v2, v3}, Lcx1;-><init>(ILjava/lang/Object;)V

    .line 463
    .line 464
    .line 465
    iput-object v5, v3, Lc52;->l:Lcx1;

    .line 466
    .line 467
    :cond_f
    if-eqz v0, :cond_11

    .line 468
    .line 469
    invoke-virtual {v1, v5}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 470
    .line 471
    .line 472
    iget-object v0, v3, Lc52;->l:Lcx1;

    .line 473
    .line 474
    invoke-virtual {v1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 475
    .line 476
    .line 477
    iget-object v0, v3, Let;->j:Ljava/lang/Object;

    .line 478
    .line 479
    check-cast v0, Ly02;

    .line 480
    .line 481
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 482
    .line 483
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 484
    .line 485
    .line 486
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 487
    .line 488
    const-string v1, "Registered activity lifecycle callback"

    .line 489
    .line 490
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    goto :goto_c

    .line 494
    :cond_10
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 495
    .line 496
    .line 497
    iget-object v0, v1, Lzy1;->r:Lso;

    .line 498
    .line 499
    const-string v1, "Application context is not an Application"

    .line 500
    .line 501
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    :cond_11
    :goto_c
    new-instance v0, Lw02;

    .line 505
    .line 506
    invoke-direct {v0, p0, p1}, Lw02;-><init>(Ly02;Lz22;)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {v4, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 510
    .line 511
    .line 512
    return-void
.end method

.method public static final i(Lgx1;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Component not created"

    .line 5
    .line 6
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final j(Let;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Component not created"

    .line 5
    .line 6
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final k(Lay1;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lay1;->k:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "Component not initialized: "

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const-string p0, "Component not created"

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static final l(Lm22;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lm22;->k:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "Component not initialized: "

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const-string p0, "Component not created"

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static q(Landroid/content/Context;Llw1;Ljava/lang/Long;Ljava/lang/Long;)Ly02;
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v6, p1, Llw1;->m:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-boolean v5, p1, Llw1;->l:Z

    .line 6
    .line 7
    iget-wide v3, p1, Llw1;->k:J

    .line 8
    .line 9
    iget-wide v1, p1, Llw1;->j:J

    .line 10
    .line 11
    new-instance v0, Llw1;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    invoke-direct/range {v0 .. v7}, Llw1;-><init>(JJZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object p1, v0

    .line 18
    :cond_0
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ly02;->O:Ly02;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    const-class v1, Ly02;

    .line 33
    .line 34
    monitor-enter v1

    .line 35
    :try_start_0
    sget-object v0, Ly02;->O:Ly02;

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Lz22;

    .line 40
    .line 41
    invoke-direct {v0, p0, p1, p2, p3}, Lz22;-><init>(Landroid/content/Context;Llw1;Ljava/lang/Long;Ljava/lang/Long;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ly02;

    .line 45
    .line 46
    invoke-direct {p0, v0}, Ly02;-><init>(Lz22;)V

    .line 47
    .line 48
    .line 49
    sput-object p0, Ly02;->O:Ly02;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    move-object p0, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    monitor-exit v1

    .line 56
    goto :goto_2

    .line 57
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0

    .line 59
    :cond_2
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p0, p1, Llw1;->m:Landroid/os/Bundle;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    const-string p1, "dataCollectionDefaultEnabled"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    sget-object p1, Ly02;->O:Ly02;

    .line 74
    .line 75
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    sget-object p1, Ly02;->O:Ly02;

    .line 79
    .line 80
    const-string p2, "dataCollectionDefaultEnabled"

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    iput-object p0, p1, Ly02;->H:Ljava/lang/Boolean;

    .line 91
    .line 92
    :cond_3
    :goto_2
    sget-object p0, Ly02;->O:Ly02;

    .line 93
    .line 94
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Ly02;->O:Ly02;

    .line 98
    .line 99
    return-object p0
.end method


# virtual methods
.method public final a()Ltb0;
    .locals 0

    .line 1
    iget-object p0, p0, Ly02;->l:Ltb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lzy1;
    .locals 0

    .line 1
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 2
    .line 3
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final c()Ls02;
    .locals 0

    .line 1
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 2
    .line 3
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final d()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ly02;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ly02;->g()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final f()Lmz;
    .locals 0

    .line 1
    iget-object p0, p0, Ly02;->t:Lmz;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()I
    .locals 5

    .line 1
    iget-object v0, p0, Ly02;->p:Ls02;

    .line 2
    .line 3
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ls02;->l()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ly02;->m:Lmt1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lmt1;->z()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    if-nez v2, :cond_8

    .line 17
    .line 18
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ls02;->l()V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Ly02;->I:Z

    .line 25
    .line 26
    if-eqz v0, :cond_7

    .line 27
    .line 28
    iget-object v0, p0, Ly02;->n:Lvz1;

    .line 29
    .line 30
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Let;->l()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v4, "measurement_enabled"

    .line 41
    .line 42
    invoke-interface {v2, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/4 v0, 0x0

    .line 62
    :goto_0
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const/4 p0, 0x3

    .line 72
    return p0

    .line 73
    :cond_2
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ly02;

    .line 76
    .line 77
    iget-object v0, v0, Ly02;->l:Ltb0;

    .line 78
    .line 79
    const-string v0, "firebase_analytics_collection_enabled"

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const/4 p0, 0x4

    .line 95
    return p0

    .line 96
    :cond_4
    iget-object v0, p0, Ly02;->H:Ljava/lang/Boolean;

    .line 97
    .line 98
    if-eqz v0, :cond_6

    .line 99
    .line 100
    iget-object p0, p0, Ly02;->H:Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_5

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_5
    const/4 p0, 0x7

    .line 110
    return p0

    .line 111
    :cond_6
    :goto_1
    const/4 p0, 0x0

    .line 112
    return p0

    .line 113
    :cond_7
    const/16 p0, 0x8

    .line 114
    .line 115
    return p0

    .line 116
    :cond_8
    return v3
.end method

.method public final h()Z
    .locals 7

    .line 1
    iget-boolean v0, p0, Ly02;->E:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Ly02;->p:Ls02;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ls02;->l()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ly02;->F:Ljava/lang/Boolean;

    .line 15
    .line 16
    iget-object v2, p0, Ly02;->t:Lmz;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-wide v3, p0, Ly02;->G:J

    .line 21
    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    cmp-long v3, v3, v5

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    iget-wide v5, p0, Ly02;->G:J

    .line 42
    .line 43
    sub-long/2addr v3, v5

    .line 44
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    const-wide/16 v5, 0x3e8

    .line 49
    .line 50
    cmp-long v0, v3, v5

    .line 51
    .line 52
    if-lez v0, :cond_3

    .line 53
    .line 54
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v2

    .line 61
    iput-wide v2, p0, Ly02;->G:J

    .line 62
    .line 63
    iget-object v0, p0, Ly02;->r:Lcb2;

    .line 64
    .line 65
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 66
    .line 67
    .line 68
    const-string v2, "android.permission.INTERNET"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcb2;->O(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    const-string v2, "android.permission.ACCESS_NETWORK_STATE"

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Lcb2;->O(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    iget-object v2, p0, Ly02;->j:Landroid/content/Context;

    .line 85
    .line 86
    invoke-static {v2}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Lb00;->c()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    const/4 v4, 0x1

    .line 95
    if-nez v3, :cond_1

    .line 96
    .line 97
    iget-object v3, p0, Ly02;->m:Lmt1;

    .line 98
    .line 99
    invoke-virtual {v3}, Lmt1;->o()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-nez v3, :cond_1

    .line 104
    .line 105
    invoke-static {v2}, Lcb2;->g0(Landroid/content/Context;)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-eqz v3, :cond_2

    .line 110
    .line 111
    invoke-static {v2}, Lcb2;->G(Landroid/content/Context;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_2

    .line 116
    .line 117
    :cond_1
    move v1, v4

    .line 118
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    iput-object v2, p0, Ly02;->F:Ljava/lang/Boolean;

    .line 123
    .line 124
    if-eqz v1, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0}, Ly02;->p()Lky1;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1}, Lky1;->s()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Lcb2;->r(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Ly02;->F:Ljava/lang/Boolean;

    .line 143
    .line 144
    :cond_3
    iget-object p0, p0, Ly02;->F:Ljava/lang/Boolean;

    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    return p0

    .line 151
    :cond_4
    const-string p0, "AppMeasurement is not initialized"

    .line 152
    .line 153
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return v1
.end method

.method public final m()Lpy1;
    .locals 1

    .line 1
    iget-object v0, p0, Ly02;->z:Lpy1;

    .line 2
    .line 3
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ly02;->z:Lpy1;

    .line 7
    .line 8
    return-object p0
.end method

.method public final n()Li82;
    .locals 1

    .line 1
    iget-object v0, p0, Ly02;->A:Li82;

    .line 2
    .line 3
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ly02;->A:Li82;

    .line 7
    .line 8
    return-object p0
.end method

.method public final o()Lou1;
    .locals 1

    .line 1
    iget-object v0, p0, Ly02;->B:Lou1;

    .line 2
    .line 3
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ly02;->B:Lou1;

    .line 7
    .line 8
    return-object p0
.end method

.method public final p()Lky1;
    .locals 1

    .line 1
    iget-object v0, p0, Ly02;->C:Lky1;

    .line 2
    .line 3
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ly02;->C:Lky1;

    .line 7
    .line 8
    return-object p0
.end method
