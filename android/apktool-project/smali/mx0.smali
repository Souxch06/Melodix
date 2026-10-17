.class public final Lmx0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final i:J


# instance fields
.field public a:Loc1;

.field public b:Llx0;

.field public c:J

.field public d:D

.field public final e:Llx0;

.field public final f:Llx0;

.field public final g:J

.field public final h:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xf4240

    .line 5
    .line 6
    .line 7
    sput-wide v0, Lmx0;->i:J

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Llx0;Lmz;Lkn;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1f4

    .line 5
    .line 6
    iput-wide v0, p0, Lmx0;->c:J

    .line 7
    .line 8
    iput-object p1, p0, Lmx0;->b:Llx0;

    .line 9
    .line 10
    const-wide p1, 0x407f400000000000L    # 500.0

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    iput-wide p1, p0, Lmx0;->d:D

    .line 16
    .line 17
    new-instance p1, Loc1;

    .line 18
    .line 19
    invoke-direct {p1}, Loc1;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lmx0;->a:Loc1;

    .line 23
    .line 24
    const-string p1, "Trace"

    .line 25
    .line 26
    if-ne p4, p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p3}, Lkn;->j()J

    .line 29
    .line 30
    .line 31
    move-result-wide p1

    .line 32
    :goto_0
    move-wide v3, p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-virtual {p3}, Lkn;->j()J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    goto :goto_0

    .line 39
    :goto_1
    const-string p1, "Trace"

    .line 40
    .line 41
    if-ne p4, p1, :cond_4

    .line 42
    .line 43
    const-class p1, Lko;

    .line 44
    .line 45
    monitor-enter p1

    .line 46
    :try_start_0
    sget-object p2, Lko;->d:Lko;

    .line 47
    .line 48
    if-nez p2, :cond_1

    .line 49
    .line 50
    new-instance p2, Lko;

    .line 51
    .line 52
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 53
    .line 54
    .line 55
    sput-object p2, Lko;->d:Lko;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    move-object p0, v0

    .line 60
    goto :goto_4

    .line 61
    :cond_1
    :goto_2
    monitor-exit p1

    .line 62
    iget-object p1, p3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 63
    .line 64
    const-string v0, "fpr_rl_trace_event_count_fg"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ljava/lang/Long;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 83
    .line 84
    .line 85
    move-result-wide v0

    .line 86
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object p2, p3, Lkn;->c:Lgx;

    .line 93
    .line 94
    const-string v0, "com.google.firebase.perf.TraceEventCountForeground"

    .line 95
    .line 96
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Ljava/lang/Long;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    invoke-virtual {p2, v0, v1, v2}, Lgx;->e(Ljava/lang/String;J)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ljava/lang/Long;

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 116
    .line 117
    .line 118
    move-result-wide p1

    .line 119
    :goto_3
    move-wide v1, p1

    .line 120
    goto/16 :goto_6

    .line 121
    .line 122
    :cond_2
    invoke-virtual {p3, p2}, Lkn;->c(Lbe2;)Lgs0;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-eqz p2, :cond_3

    .line 131
    .line 132
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    check-cast p2, Ljava/lang/Long;

    .line 137
    .line 138
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-eqz p2, :cond_3

    .line 147
    .line 148
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Ljava/lang/Long;

    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 155
    .line 156
    .line 157
    move-result-wide p1

    .line 158
    goto :goto_3

    .line 159
    :cond_3
    const-wide/16 p1, 0x12c

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :goto_4
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    throw p0

    .line 164
    :cond_4
    const-class p1, Lxn;

    .line 165
    .line 166
    monitor-enter p1

    .line 167
    :try_start_2
    sget-object p2, Lxn;->d:Lxn;

    .line 168
    .line 169
    if-nez p2, :cond_5

    .line 170
    .line 171
    new-instance p2, Lxn;

    .line 172
    .line 173
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 174
    .line 175
    .line 176
    sput-object p2, Lxn;->d:Lxn;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :catchall_1
    move-exception v0

    .line 180
    move-object p0, v0

    .line 181
    goto/16 :goto_f

    .line 182
    .line 183
    :cond_5
    :goto_5
    monitor-exit p1

    .line 184
    iget-object p1, p3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 185
    .line 186
    const-string v0, "fpr_rl_network_event_count_fg"

    .line 187
    .line 188
    invoke-virtual {p1, v0}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-eqz v0, :cond_6

    .line 197
    .line 198
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Ljava/lang/Long;

    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 205
    .line 206
    .line 207
    move-result-wide v0

    .line 208
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-eqz v0, :cond_6

    .line 213
    .line 214
    iget-object p2, p3, Lkn;->c:Lgx;

    .line 215
    .line 216
    const-string v0, "com.google.firebase.perf.NetworkEventCountForeground"

    .line 217
    .line 218
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    check-cast v1, Ljava/lang/Long;

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 225
    .line 226
    .line 227
    move-result-wide v1

    .line 228
    invoke-virtual {p2, v0, v1, v2}, Lgx;->e(Ljava/lang/String;J)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Ljava/lang/Long;

    .line 236
    .line 237
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 238
    .line 239
    .line 240
    move-result-wide p1

    .line 241
    goto :goto_3

    .line 242
    :cond_6
    invoke-virtual {p3, p2}, Lkn;->c(Lbe2;)Lgs0;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    if-eqz p2, :cond_7

    .line 251
    .line 252
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    check-cast p2, Ljava/lang/Long;

    .line 257
    .line 258
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 259
    .line 260
    .line 261
    move-result-wide v0

    .line 262
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 263
    .line 264
    .line 265
    move-result p2

    .line 266
    if-eqz p2, :cond_7

    .line 267
    .line 268
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    check-cast p1, Ljava/lang/Long;

    .line 273
    .line 274
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 275
    .line 276
    .line 277
    move-result-wide p1

    .line 278
    goto/16 :goto_3

    .line 279
    .line 280
    :cond_7
    const-wide/16 p1, 0x2bc

    .line 281
    .line 282
    goto/16 :goto_3

    .line 283
    .line 284
    :goto_6
    new-instance v0, Llx0;

    .line 285
    .line 286
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 287
    .line 288
    invoke-direct/range {v0 .. v5}, Llx0;-><init>(JJLjava/util/concurrent/TimeUnit;)V

    .line 289
    .line 290
    .line 291
    iput-object v0, p0, Lmx0;->e:Llx0;

    .line 292
    .line 293
    iput-wide v1, p0, Lmx0;->g:J

    .line 294
    .line 295
    const-string p1, "Trace"

    .line 296
    .line 297
    if-ne p4, p1, :cond_8

    .line 298
    .line 299
    invoke-virtual {p3}, Lkn;->j()J

    .line 300
    .line 301
    .line 302
    move-result-wide p1

    .line 303
    :goto_7
    move-wide v8, p1

    .line 304
    goto :goto_8

    .line 305
    :cond_8
    invoke-virtual {p3}, Lkn;->j()J

    .line 306
    .line 307
    .line 308
    move-result-wide p1

    .line 309
    goto :goto_7

    .line 310
    :goto_8
    const-string p1, "Trace"

    .line 311
    .line 312
    if-ne p4, p1, :cond_c

    .line 313
    .line 314
    const-class p1, Ljo;

    .line 315
    .line 316
    monitor-enter p1

    .line 317
    :try_start_3
    sget-object p2, Ljo;->d:Ljo;

    .line 318
    .line 319
    if-nez p2, :cond_9

    .line 320
    .line 321
    new-instance p2, Ljo;

    .line 322
    .line 323
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 324
    .line 325
    .line 326
    sput-object p2, Ljo;->d:Ljo;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 327
    .line 328
    goto :goto_9

    .line 329
    :catchall_2
    move-exception v0

    .line 330
    move-object p0, v0

    .line 331
    goto :goto_b

    .line 332
    :cond_9
    :goto_9
    monitor-exit p1

    .line 333
    iget-object p1, p3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 334
    .line 335
    const-string p4, "fpr_rl_trace_event_count_bg"

    .line 336
    .line 337
    invoke-virtual {p1, p4}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 342
    .line 343
    .line 344
    move-result p4

    .line 345
    if-eqz p4, :cond_a

    .line 346
    .line 347
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object p4

    .line 351
    check-cast p4, Ljava/lang/Long;

    .line 352
    .line 353
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 354
    .line 355
    .line 356
    move-result-wide v0

    .line 357
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 358
    .line 359
    .line 360
    move-result p4

    .line 361
    if-eqz p4, :cond_a

    .line 362
    .line 363
    iget-object p2, p3, Lkn;->c:Lgx;

    .line 364
    .line 365
    const-string p3, "com.google.firebase.perf.TraceEventCountBackground"

    .line 366
    .line 367
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object p4

    .line 371
    check-cast p4, Ljava/lang/Long;

    .line 372
    .line 373
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 374
    .line 375
    .line 376
    move-result-wide v0

    .line 377
    invoke-virtual {p2, p3, v0, v1}, Lgx;->e(Ljava/lang/String;J)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    check-cast p1, Ljava/lang/Long;

    .line 385
    .line 386
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 387
    .line 388
    .line 389
    move-result-wide p1

    .line 390
    :goto_a
    move-wide v6, p1

    .line 391
    move-object v10, v5

    .line 392
    goto/16 :goto_d

    .line 393
    .line 394
    :cond_a
    invoke-virtual {p3, p2}, Lkn;->c(Lbe2;)Lgs0;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 399
    .line 400
    .line 401
    move-result p2

    .line 402
    if-eqz p2, :cond_b

    .line 403
    .line 404
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object p2

    .line 408
    check-cast p2, Ljava/lang/Long;

    .line 409
    .line 410
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 411
    .line 412
    .line 413
    move-result-wide p2

    .line 414
    invoke-static {p2, p3}, Lkn;->k(J)Z

    .line 415
    .line 416
    .line 417
    move-result p2

    .line 418
    if-eqz p2, :cond_b

    .line 419
    .line 420
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    check-cast p1, Ljava/lang/Long;

    .line 425
    .line 426
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 427
    .line 428
    .line 429
    move-result-wide p1

    .line 430
    goto :goto_a

    .line 431
    :cond_b
    const-wide/16 p1, 0x1e

    .line 432
    .line 433
    goto :goto_a

    .line 434
    :goto_b
    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 435
    throw p0

    .line 436
    :cond_c
    const-class p2, Lwn;

    .line 437
    .line 438
    monitor-enter p2

    .line 439
    :try_start_5
    sget-object p1, Lwn;->d:Lwn;

    .line 440
    .line 441
    if-nez p1, :cond_d

    .line 442
    .line 443
    new-instance p1, Lwn;

    .line 444
    .line 445
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 446
    .line 447
    .line 448
    sput-object p1, Lwn;->d:Lwn;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 449
    .line 450
    goto :goto_c

    .line 451
    :catchall_3
    move-exception v0

    .line 452
    move-object p0, v0

    .line 453
    goto :goto_e

    .line 454
    :cond_d
    :goto_c
    monitor-exit p2

    .line 455
    iget-object p2, p3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 456
    .line 457
    const-string p4, "fpr_rl_network_event_count_bg"

    .line 458
    .line 459
    invoke-virtual {p2, p4}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 460
    .line 461
    .line 462
    move-result-object p2

    .line 463
    invoke-virtual {p2}, Lgs0;->b()Z

    .line 464
    .line 465
    .line 466
    move-result p4

    .line 467
    if-eqz p4, :cond_e

    .line 468
    .line 469
    invoke-virtual {p2}, Lgs0;->a()Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object p4

    .line 473
    check-cast p4, Ljava/lang/Long;

    .line 474
    .line 475
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 476
    .line 477
    .line 478
    move-result-wide v0

    .line 479
    invoke-static {v0, v1}, Lkn;->k(J)Z

    .line 480
    .line 481
    .line 482
    move-result p4

    .line 483
    if-eqz p4, :cond_e

    .line 484
    .line 485
    iget-object p1, p3, Lkn;->c:Lgx;

    .line 486
    .line 487
    const-string p3, "com.google.firebase.perf.NetworkEventCountBackground"

    .line 488
    .line 489
    invoke-virtual {p2}, Lgs0;->a()Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object p4

    .line 493
    check-cast p4, Ljava/lang/Long;

    .line 494
    .line 495
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 496
    .line 497
    .line 498
    move-result-wide v0

    .line 499
    invoke-virtual {p1, p3, v0, v1}, Lgx;->e(Ljava/lang/String;J)V

    .line 500
    .line 501
    .line 502
    invoke-virtual {p2}, Lgs0;->a()Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object p1

    .line 506
    check-cast p1, Ljava/lang/Long;

    .line 507
    .line 508
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 509
    .line 510
    .line 511
    move-result-wide p1

    .line 512
    goto :goto_a

    .line 513
    :cond_e
    invoke-virtual {p3, p1}, Lkn;->c(Lbe2;)Lgs0;

    .line 514
    .line 515
    .line 516
    move-result-object p1

    .line 517
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 518
    .line 519
    .line 520
    move-result p2

    .line 521
    if-eqz p2, :cond_f

    .line 522
    .line 523
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object p2

    .line 527
    check-cast p2, Ljava/lang/Long;

    .line 528
    .line 529
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 530
    .line 531
    .line 532
    move-result-wide p2

    .line 533
    invoke-static {p2, p3}, Lkn;->k(J)Z

    .line 534
    .line 535
    .line 536
    move-result p2

    .line 537
    if-eqz p2, :cond_f

    .line 538
    .line 539
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    check-cast p1, Ljava/lang/Long;

    .line 544
    .line 545
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 546
    .line 547
    .line 548
    move-result-wide p1

    .line 549
    goto/16 :goto_a

    .line 550
    .line 551
    :cond_f
    const-wide/16 p1, 0x46

    .line 552
    .line 553
    goto/16 :goto_a

    .line 554
    .line 555
    :goto_d
    new-instance v5, Llx0;

    .line 556
    .line 557
    invoke-direct/range {v5 .. v10}, Llx0;-><init>(JJLjava/util/concurrent/TimeUnit;)V

    .line 558
    .line 559
    .line 560
    iput-object v5, p0, Lmx0;->f:Llx0;

    .line 561
    .line 562
    iput-wide v6, p0, Lmx0;->h:J

    .line 563
    .line 564
    return-void

    .line 565
    :goto_e
    :try_start_6
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 566
    throw p0

    .line 567
    :goto_f
    :try_start_7
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 568
    throw p0
.end method


# virtual methods
.method public final declared-synchronized a(Z)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Lmx0;->e:Llx0;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    goto :goto_2

    .line 9
    :cond_0
    iget-object v0, p0, Lmx0;->f:Llx0;

    .line 10
    .line 11
    :goto_0
    iput-object v0, p0, Lmx0;->b:Llx0;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Lmx0;->g:J

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget-wide v0, p0, Lmx0;->h:J

    .line 19
    .line 20
    :goto_1
    iput-wide v0, p0, Lmx0;->c:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public final declared-synchronized b()Z
    .locals 11

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Loc1;

    .line 3
    .line 4
    invoke-direct {v0}, Loc1;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lmx0;->a:Loc1;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-wide v2, v0, Loc1;->k:J

    .line 13
    .line 14
    iget-wide v4, v1, Loc1;->k:J

    .line 15
    .line 16
    sub-long/2addr v2, v4

    .line 17
    long-to-double v1, v2

    .line 18
    iget-object v3, p0, Lmx0;->b:Llx0;

    .line 19
    .line 20
    iget-wide v4, v3, Llx0;->a:J

    .line 21
    .line 22
    iget-wide v6, v3, Llx0;->b:J

    .line 23
    .line 24
    sget-object v8, Lkx0;->a:[I

    .line 25
    .line 26
    iget-object v3, v3, Llx0;->c:Ljava/util/concurrent/TimeUnit;

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result v9

    .line 32
    aget v8, v8, v9

    .line 33
    .line 34
    const/4 v9, 0x1

    .line 35
    if-eq v8, v9, :cond_2

    .line 36
    .line 37
    const/4 v10, 0x2

    .line 38
    if-eq v8, v10, :cond_1

    .line 39
    .line 40
    const/4 v10, 0x3

    .line 41
    if-eq v8, v10, :cond_0

    .line 42
    .line 43
    long-to-double v4, v4

    .line 44
    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v6

    .line 48
    long-to-double v6, v6

    .line 49
    div-double/2addr v4, v6

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    long-to-double v3, v4

    .line 52
    long-to-double v5, v6

    .line 53
    div-double/2addr v3, v5

    .line 54
    const-wide v5, 0x408f400000000000L    # 1000.0

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :goto_0
    mul-double v4, v3, v5

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    long-to-double v3, v4

    .line 63
    long-to-double v5, v6

    .line 64
    div-double/2addr v3, v5

    .line 65
    const-wide v5, 0x412e848000000000L    # 1000000.0

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    long-to-double v3, v4

    .line 72
    long-to-double v5, v6

    .line 73
    div-double/2addr v3, v5

    .line 74
    const-wide v5, 0x41cdcd6500000000L    # 1.0E9

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :goto_1
    mul-double/2addr v1, v4

    .line 81
    sget-wide v3, Lmx0;->i:J

    .line 82
    .line 83
    long-to-double v3, v3

    .line 84
    div-double/2addr v1, v3

    .line 85
    const-wide/16 v3, 0x0

    .line 86
    .line 87
    cmpl-double v3, v1, v3

    .line 88
    .line 89
    if-lez v3, :cond_3

    .line 90
    .line 91
    iget-wide v3, p0, Lmx0;->d:D

    .line 92
    .line 93
    add-double/2addr v3, v1

    .line 94
    iget-wide v1, p0, Lmx0;->c:J

    .line 95
    .line 96
    long-to-double v1, v1

    .line 97
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(DD)D

    .line 98
    .line 99
    .line 100
    move-result-wide v1

    .line 101
    iput-wide v1, p0, Lmx0;->d:D

    .line 102
    .line 103
    iput-object v0, p0, Lmx0;->a:Loc1;

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    goto :goto_3

    .line 108
    :cond_3
    :goto_2
    iget-wide v0, p0, Lmx0;->d:D

    .line 109
    .line 110
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 111
    .line 112
    cmpl-double v4, v0, v2

    .line 113
    .line 114
    if-ltz v4, :cond_4

    .line 115
    .line 116
    sub-double/2addr v0, v2

    .line 117
    iput-wide v0, p0, Lmx0;->d:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    .line 119
    monitor-exit p0

    .line 120
    return v9

    .line 121
    :cond_4
    monitor-exit p0

    .line 122
    const/4 p0, 0x0

    .line 123
    return p0

    .line 124
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    throw v0
.end method
