.class public final Lai;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lw72;Ltw0;)V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v0, Lai;->a:Z

    .line 10
    .line 11
    iget-object v3, v1, Lw72;->a:Li72;

    .line 12
    .line 13
    iget-object v4, v1, Lw72;->b:Lz62;

    .line 14
    .line 15
    iget-object v3, v3, Li72;->a:Lce0;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lz62;->y()Lz62;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3, v4}, Lnp1;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    :cond_0
    invoke-virtual {v4}, Lz62;->r()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iput-object v3, v0, Lai;->b:Ljava/lang/Object;

    .line 36
    .line 37
    invoke-virtual {v4}, Lz62;->s()Lxo1;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iput-object v3, v0, Lai;->c:Ljava/lang/Object;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Lz62;->v()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/4 v5, 0x0

    .line 54
    if-nez v3, :cond_1

    .line 55
    .line 56
    move-object v3, v5

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v4}, Lz62;->w()Ljava/util/Map;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    :goto_0
    if-eqz v3, :cond_3

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    instance-of v6, v3, Lbe0;

    .line 69
    .line 70
    if-eqz v6, :cond_2

    .line 71
    .line 72
    instance-of v6, v3, Ljava/util/SortedSet;

    .line 73
    .line 74
    if-nez v6, :cond_2

    .line 75
    .line 76
    move-object v6, v3

    .line 77
    check-cast v6, Lbe0;

    .line 78
    .line 79
    invoke-virtual {v6}, Lud0;->h()Z

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    if-nez v6, :cond_2

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    invoke-interface {v3}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    array-length v6, v3

    .line 91
    invoke-static {v6, v3}, Lbe0;->o(I[Ljava/lang/Object;)Lbe0;

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    sget v3, Lbe0;->l:I

    .line 96
    .line 97
    sget-object v3, Lsz0;->r:[Ljava/lang/Object;

    .line 98
    .line 99
    :goto_1
    invoke-virtual {v4}, Lz62;->v()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    iget-object v1, v1, Lw72;->a:Li72;

    .line 104
    .line 105
    const/4 v6, 0x3

    .line 106
    const/4 v7, 0x0

    .line 107
    if-lez v3, :cond_c

    .line 108
    .line 109
    invoke-virtual {v4}, Lz62;->w()Ljava/util/Map;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    const/4 v8, 0x4

    .line 118
    if-nez v3, :cond_4

    .line 119
    .line 120
    sget-object v3, Lrz0;->p:Lrz0;

    .line 121
    .line 122
    goto/16 :goto_3

    .line 123
    .line 124
    :cond_4
    new-instance v9, Lo7;

    .line 125
    .line 126
    invoke-direct {v9, v8}, Lo7;-><init>(I)V

    .line 127
    .line 128
    .line 129
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v10

    .line 137
    if-eqz v10, :cond_b

    .line 138
    .line 139
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v10

    .line 143
    check-cast v10, Ln62;

    .line 144
    .line 145
    invoke-virtual {v10}, Ln62;->F()I

    .line 146
    .line 147
    .line 148
    move-result v11

    .line 149
    add-int/lit8 v12, v11, -0x1

    .line 150
    .line 151
    if-eqz v11, :cond_a

    .line 152
    .line 153
    if-eqz v12, :cond_9

    .line 154
    .line 155
    if-eq v12, v2, :cond_8

    .line 156
    .line 157
    const/4 v11, 0x2

    .line 158
    if-eq v12, v11, :cond_7

    .line 159
    .line 160
    if-eq v12, v6, :cond_6

    .line 161
    .line 162
    if-ne v12, v8, :cond_5

    .line 163
    .line 164
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v11

    .line 168
    invoke-virtual {v10}, Ln62;->w()Lxo1;

    .line 169
    .line 170
    .line 171
    move-result-object v10

    .line 172
    invoke-virtual {v10}, Lxo1;->p()[B

    .line 173
    .line 174
    .line 175
    move-result-object v10

    .line 176
    invoke-virtual {v9, v11, v10}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_5
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-string v1, "Could not serialize Flag for override: "

    .line 189
    .line 190
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    throw v5

    .line 198
    :cond_6
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v11

    .line 202
    invoke-virtual {v10}, Ln62;->v()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    invoke-virtual {v9, v11, v10}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_7
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v11

    .line 214
    invoke-virtual {v10}, Ln62;->u()D

    .line 215
    .line 216
    .line 217
    move-result-wide v12

    .line 218
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 219
    .line 220
    .line 221
    move-result-object v10

    .line 222
    invoke-virtual {v9, v11, v10}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_8
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v11

    .line 230
    invoke-virtual {v10}, Ln62;->t()Z

    .line 231
    .line 232
    .line 233
    move-result v10

    .line 234
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 235
    .line 236
    .line 237
    move-result-object v10

    .line 238
    invoke-virtual {v9, v11, v10}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_9
    invoke-virtual {v10}, Ln62;->r()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v11

    .line 246
    invoke-virtual {v10}, Ln62;->s()J

    .line 247
    .line 248
    .line 249
    move-result-wide v12

    .line 250
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 251
    .line 252
    .line 253
    move-result-object v10

    .line 254
    invoke-virtual {v9, v11, v10}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    goto :goto_2

    .line 258
    :cond_a
    throw v5

    .line 259
    :cond_b
    invoke-virtual {v9, v7}, Lo7;->b(Z)Lrz0;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    :goto_3
    invoke-virtual {v3}, Lrz0;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result v9

    .line 267
    if-eqz v9, :cond_d

    .line 268
    .line 269
    :cond_c
    move/from16 p1, v6

    .line 270
    .line 271
    goto/16 :goto_12

    .line 272
    .line 273
    :cond_d
    new-instance v9, Ljava/util/HashMap;

    .line 274
    .line 275
    invoke-direct {v9, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 276
    .line 277
    .line 278
    iget-object v1, v1, Li72;->a:Lce0;

    .line 279
    .line 280
    new-instance v3, Lvd0;

    .line 281
    .line 282
    invoke-direct {v3, v8}, Lvd0;-><init>(I)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v1}, Lud0;->j()Lcf1;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    :goto_4
    move-object v8, v1

    .line 290
    check-cast v8, Lwd0;

    .line 291
    .line 292
    invoke-virtual {v8}, Lwd0;->hasNext()Z

    .line 293
    .line 294
    .line 295
    move-result v10

    .line 296
    const-string v11, ": "

    .line 297
    .line 298
    if-eqz v10, :cond_16

    .line 299
    .line 300
    invoke-virtual {v8}, Lwd0;->next()Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v8

    .line 304
    check-cast v8, Lg72;

    .line 305
    .line 306
    iget-object v10, v8, Lg72;->k:Ljava/lang/String;

    .line 307
    .line 308
    iget-wide v12, v8, Lg72;->j:J

    .line 309
    .line 310
    if-eqz v10, :cond_e

    .line 311
    .line 312
    goto :goto_5

    .line 313
    :cond_e
    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v10

    .line 317
    :goto_5
    invoke-virtual {v9, v10}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object v10

    .line 321
    if-nez v10, :cond_f

    .line 322
    .line 323
    invoke-virtual {v3, v8}, Lvd0;->a(Ljava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    goto :goto_4

    .line 327
    :cond_f
    instance-of v14, v10, Ljava/lang/String;

    .line 328
    .line 329
    if-eqz v14, :cond_10

    .line 330
    .line 331
    new-instance v14, Lg72;

    .line 332
    .line 333
    iget-wide v11, v8, Lg72;->j:J

    .line 334
    .line 335
    iget-object v8, v8, Lg72;->k:Ljava/lang/String;

    .line 336
    .line 337
    const/16 v18, 0x4

    .line 338
    .line 339
    const-wide/16 v19, 0x0

    .line 340
    .line 341
    move-object/from16 v17, v8

    .line 342
    .line 343
    move-object/from16 v21, v10

    .line 344
    .line 345
    move-wide v15, v11

    .line 346
    invoke-direct/range {v14 .. v21}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3, v14}, Lvd0;->a(Ljava/lang/Object;)V

    .line 350
    .line 351
    .line 352
    goto :goto_4

    .line 353
    :cond_10
    instance-of v14, v10, [B

    .line 354
    .line 355
    if-eqz v14, :cond_11

    .line 356
    .line 357
    new-instance v14, Lg72;

    .line 358
    .line 359
    iget-wide v11, v8, Lg72;->j:J

    .line 360
    .line 361
    iget-object v8, v8, Lg72;->k:Ljava/lang/String;

    .line 362
    .line 363
    const/16 v18, 0x5

    .line 364
    .line 365
    const-wide/16 v19, 0x0

    .line 366
    .line 367
    move-object/from16 v17, v8

    .line 368
    .line 369
    move-object/from16 v21, v10

    .line 370
    .line 371
    move-wide v15, v11

    .line 372
    invoke-direct/range {v14 .. v21}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v3, v14}, Lvd0;->a(Ljava/lang/Object;)V

    .line 376
    .line 377
    .line 378
    goto :goto_4

    .line 379
    :cond_11
    instance-of v14, v10, Ljava/lang/Boolean;

    .line 380
    .line 381
    if-eqz v14, :cond_12

    .line 382
    .line 383
    check-cast v10, Ljava/lang/Boolean;

    .line 384
    .line 385
    new-instance v11, Lg72;

    .line 386
    .line 387
    iget-wide v12, v8, Lg72;->j:J

    .line 388
    .line 389
    iget-object v14, v8, Lg72;->k:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 392
    .line 393
    .line 394
    move-result v15

    .line 395
    const-wide/16 v16, 0x0

    .line 396
    .line 397
    const/16 v18, 0x0

    .line 398
    .line 399
    invoke-direct/range {v11 .. v18}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v3, v11}, Lvd0;->a(Ljava/lang/Object;)V

    .line 403
    .line 404
    .line 405
    goto :goto_4

    .line 406
    :cond_12
    instance-of v14, v10, Ljava/lang/Long;

    .line 407
    .line 408
    if-eqz v14, :cond_13

    .line 409
    .line 410
    new-instance v15, Lg72;

    .line 411
    .line 412
    iget-wide v11, v8, Lg72;->j:J

    .line 413
    .line 414
    iget-object v8, v8, Lg72;->k:Ljava/lang/String;

    .line 415
    .line 416
    check-cast v10, Ljava/lang/Long;

    .line 417
    .line 418
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    .line 419
    .line 420
    .line 421
    move-result-wide v20

    .line 422
    const/16 v22, 0x0

    .line 423
    .line 424
    const/16 v19, 0x2

    .line 425
    .line 426
    move-object/from16 v18, v8

    .line 427
    .line 428
    move-wide/from16 v16, v11

    .line 429
    .line 430
    invoke-direct/range {v15 .. v22}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v3, v15}, Lvd0;->a(Ljava/lang/Object;)V

    .line 434
    .line 435
    .line 436
    goto/16 :goto_4

    .line 437
    .line 438
    :cond_13
    instance-of v14, v10, Ljava/lang/Double;

    .line 439
    .line 440
    if-eqz v14, :cond_14

    .line 441
    .line 442
    check-cast v10, Ljava/lang/Double;

    .line 443
    .line 444
    new-instance v11, Lg72;

    .line 445
    .line 446
    iget-wide v12, v8, Lg72;->j:J

    .line 447
    .line 448
    iget-object v14, v8, Lg72;->k:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    .line 451
    .line 452
    .line 453
    move-result-wide v15

    .line 454
    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 455
    .line 456
    .line 457
    move-result-wide v16

    .line 458
    const/16 v18, 0x0

    .line 459
    .line 460
    const/4 v15, 0x3

    .line 461
    invoke-direct/range {v11 .. v18}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v3, v11}, Lvd0;->a(Ljava/lang/Object;)V

    .line 465
    .line 466
    .line 467
    goto/16 :goto_4

    .line 468
    .line 469
    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 470
    .line 471
    iget-object v1, v8, Lg72;->k:Ljava/lang/String;

    .line 472
    .line 473
    if-eqz v1, :cond_15

    .line 474
    .line 475
    goto :goto_6

    .line 476
    :cond_15
    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    :goto_6
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v3

    .line 488
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 489
    .line 490
    .line 491
    move-result v3

    .line 492
    add-int/lit8 v3, v3, 0x2e

    .line 493
    .line 494
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 495
    .line 496
    .line 497
    move-result v4

    .line 498
    new-instance v5, Ljava/lang/StringBuilder;

    .line 499
    .line 500
    add-int/2addr v3, v4

    .line 501
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 502
    .line 503
    .line 504
    const-string v3, "Cannot serialize override for existing flag "

    .line 505
    .line 506
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v1

    .line 522
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    throw v0

    .line 526
    :cond_16
    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 527
    .line 528
    .line 529
    move-result-object v1

    .line 530
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 535
    .line 536
    .line 537
    move-result v8

    .line 538
    if-eqz v8, :cond_27

    .line 539
    .line 540
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 541
    .line 542
    .line 543
    move-result-object v8

    .line 544
    check-cast v8, Ljava/lang/String;

    .line 545
    .line 546
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    move-result-object v10

    .line 550
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 551
    .line 552
    .line 553
    move-result v12

    .line 554
    const/16 v13, 0x13

    .line 555
    .line 556
    if-gt v12, v13, :cond_20

    .line 557
    .line 558
    if-nez v12, :cond_17

    .line 559
    .line 560
    move/from16 p1, v6

    .line 561
    .line 562
    :goto_8
    const-wide/16 v17, 0x0

    .line 563
    .line 564
    const-wide/16 v23, 0x0

    .line 565
    .line 566
    goto/16 :goto_f

    .line 567
    .line 568
    :cond_17
    invoke-virtual {v8, v7}, Ljava/lang/String;->charAt(I)C

    .line 569
    .line 570
    .line 571
    move-result v13

    .line 572
    add-int/lit8 v13, v13, -0x30

    .line 573
    .line 574
    move/from16 p1, v6

    .line 575
    .line 576
    int-to-long v5, v13

    .line 577
    const-wide/16 v16, 0x1

    .line 578
    .line 579
    cmp-long v13, v5, v16

    .line 580
    .line 581
    if-ltz v13, :cond_1f

    .line 582
    .line 583
    const-wide/16 v16, 0x9

    .line 584
    .line 585
    cmp-long v13, v5, v16

    .line 586
    .line 587
    if-lez v13, :cond_18

    .line 588
    .line 589
    goto :goto_8

    .line 590
    :cond_18
    move v13, v2

    .line 591
    :goto_9
    if-ge v13, v12, :cond_1d

    .line 592
    .line 593
    invoke-virtual {v8, v13}, Ljava/lang/String;->charAt(I)C

    .line 594
    .line 595
    .line 596
    move-result v16

    .line 597
    add-int/lit8 v2, v16, -0x30

    .line 598
    .line 599
    if-gez v2, :cond_19

    .line 600
    .line 601
    const/16 v16, 0x1

    .line 602
    .line 603
    :goto_a
    const-wide/16 v17, 0x0

    .line 604
    .line 605
    goto :goto_b

    .line 606
    :cond_19
    move/from16 v16, v7

    .line 607
    .line 608
    goto :goto_a

    .line 609
    :goto_b
    const/16 v14, 0x9

    .line 610
    .line 611
    if-le v2, v14, :cond_1a

    .line 612
    .line 613
    const/4 v14, 0x1

    .line 614
    goto :goto_c

    .line 615
    :cond_1a
    move v14, v7

    .line 616
    :goto_c
    or-int v14, v16, v14

    .line 617
    .line 618
    if-eqz v14, :cond_1c

    .line 619
    .line 620
    :cond_1b
    :goto_d
    move-wide/from16 v23, v17

    .line 621
    .line 622
    goto :goto_f

    .line 623
    :cond_1c
    const-wide/16 v14, 0xa

    .line 624
    .line 625
    mul-long/2addr v5, v14

    .line 626
    int-to-long v14, v2

    .line 627
    add-long/2addr v5, v14

    .line 628
    add-int/lit8 v13, v13, 0x1

    .line 629
    .line 630
    const/4 v2, 0x1

    .line 631
    goto :goto_9

    .line 632
    :cond_1d
    const-wide/16 v17, 0x0

    .line 633
    .line 634
    cmp-long v2, v5, v17

    .line 635
    .line 636
    if-ltz v2, :cond_1b

    .line 637
    .line 638
    const-wide v12, 0x1fffffffffffffffL

    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    cmp-long v2, v5, v12

    .line 644
    .line 645
    if-lez v2, :cond_1e

    .line 646
    .line 647
    goto :goto_d

    .line 648
    :cond_1e
    move-wide/from16 v23, v5

    .line 649
    .line 650
    goto :goto_f

    .line 651
    :cond_1f
    :goto_e
    const-wide/16 v17, 0x0

    .line 652
    .line 653
    goto :goto_d

    .line 654
    :cond_20
    move/from16 p1, v6

    .line 655
    .line 656
    goto :goto_e

    .line 657
    :goto_f
    cmp-long v2, v23, v17

    .line 658
    .line 659
    if-nez v2, :cond_21

    .line 660
    .line 661
    move-object/from16 v25, v8

    .line 662
    .line 663
    goto :goto_10

    .line 664
    :cond_21
    const/16 v25, 0x0

    .line 665
    .line 666
    :goto_10
    instance-of v2, v10, Ljava/lang/String;

    .line 667
    .line 668
    if-eqz v2, :cond_22

    .line 669
    .line 670
    new-instance v12, Lg72;

    .line 671
    .line 672
    const/16 v16, 0x4

    .line 673
    .line 674
    const-wide/16 v17, 0x0

    .line 675
    .line 676
    move-object/from16 v19, v10

    .line 677
    .line 678
    move-wide/from16 v13, v23

    .line 679
    .line 680
    move-object/from16 v15, v25

    .line 681
    .line 682
    invoke-direct/range {v12 .. v19}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 683
    .line 684
    .line 685
    invoke-virtual {v3, v12}, Lvd0;->a(Ljava/lang/Object;)V

    .line 686
    .line 687
    .line 688
    :goto_11
    move/from16 v6, p1

    .line 689
    .line 690
    const/4 v2, 0x1

    .line 691
    const/4 v5, 0x0

    .line 692
    goto/16 :goto_7

    .line 693
    .line 694
    :cond_22
    move-object v2, v10

    .line 695
    instance-of v5, v2, [B

    .line 696
    .line 697
    if-eqz v5, :cond_23

    .line 698
    .line 699
    new-instance v12, Lg72;

    .line 700
    .line 701
    const/16 v16, 0x5

    .line 702
    .line 703
    const-wide/16 v17, 0x0

    .line 704
    .line 705
    move-object/from16 v19, v2

    .line 706
    .line 707
    move-wide/from16 v13, v23

    .line 708
    .line 709
    move-object/from16 v15, v25

    .line 710
    .line 711
    invoke-direct/range {v12 .. v19}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 712
    .line 713
    .line 714
    invoke-virtual {v3, v12}, Lvd0;->a(Ljava/lang/Object;)V

    .line 715
    .line 716
    .line 717
    goto :goto_11

    .line 718
    :cond_23
    instance-of v5, v2, Ljava/lang/Boolean;

    .line 719
    .line 720
    if-eqz v5, :cond_24

    .line 721
    .line 722
    move-object v10, v2

    .line 723
    check-cast v10, Ljava/lang/Boolean;

    .line 724
    .line 725
    new-instance v22, Lg72;

    .line 726
    .line 727
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 728
    .line 729
    .line 730
    move-result v26

    .line 731
    const-wide/16 v27, 0x0

    .line 732
    .line 733
    const/16 v29, 0x0

    .line 734
    .line 735
    invoke-direct/range {v22 .. v29}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 736
    .line 737
    .line 738
    move-object/from16 v2, v22

    .line 739
    .line 740
    invoke-virtual {v3, v2}, Lvd0;->a(Ljava/lang/Object;)V

    .line 741
    .line 742
    .line 743
    goto :goto_11

    .line 744
    :cond_24
    instance-of v5, v2, Ljava/lang/Long;

    .line 745
    .line 746
    if-eqz v5, :cond_25

    .line 747
    .line 748
    new-instance v22, Lg72;

    .line 749
    .line 750
    move-object v10, v2

    .line 751
    check-cast v10, Ljava/lang/Long;

    .line 752
    .line 753
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    .line 754
    .line 755
    .line 756
    move-result-wide v27

    .line 757
    const/16 v29, 0x0

    .line 758
    .line 759
    const/16 v26, 0x2

    .line 760
    .line 761
    invoke-direct/range {v22 .. v29}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 762
    .line 763
    .line 764
    move-object/from16 v2, v22

    .line 765
    .line 766
    invoke-virtual {v3, v2}, Lvd0;->a(Ljava/lang/Object;)V

    .line 767
    .line 768
    .line 769
    goto :goto_11

    .line 770
    :cond_25
    instance-of v5, v2, Ljava/lang/Double;

    .line 771
    .line 772
    if-eqz v5, :cond_26

    .line 773
    .line 774
    move-object v10, v2

    .line 775
    check-cast v10, Ljava/lang/Double;

    .line 776
    .line 777
    new-instance v22, Lg72;

    .line 778
    .line 779
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    .line 780
    .line 781
    .line 782
    move-result-wide v5

    .line 783
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 784
    .line 785
    .line 786
    move-result-wide v27

    .line 787
    const/16 v29, 0x0

    .line 788
    .line 789
    const/16 v26, 0x3

    .line 790
    .line 791
    invoke-direct/range {v22 .. v29}, Lg72;-><init>(JLjava/lang/String;IJLjava/lang/Object;)V

    .line 792
    .line 793
    .line 794
    move-object/from16 v2, v22

    .line 795
    .line 796
    invoke-virtual {v3, v2}, Lvd0;->a(Ljava/lang/Object;)V

    .line 797
    .line 798
    .line 799
    goto :goto_11

    .line 800
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 801
    .line 802
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 807
    .line 808
    .line 809
    move-result v2

    .line 810
    add-int/lit8 v2, v2, 0x1c

    .line 811
    .line 812
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 813
    .line 814
    .line 815
    move-result v3

    .line 816
    add-int/2addr v2, v3

    .line 817
    new-instance v3, Ljava/lang/StringBuilder;

    .line 818
    .line 819
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 820
    .line 821
    .line 822
    const-string v2, "Cannot serialize override "

    .line 823
    .line 824
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 825
    .line 826
    .line 827
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 828
    .line 829
    .line 830
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    .line 832
    .line 833
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    .line 835
    .line 836
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 837
    .line 838
    .line 839
    move-result-object v1

    .line 840
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 841
    .line 842
    .line 843
    throw v0

    .line 844
    :cond_27
    move/from16 p1, v6

    .line 845
    .line 846
    new-instance v1, Li72;

    .line 847
    .line 848
    invoke-virtual {v3}, Lvd0;->c()Ltz0;

    .line 849
    .line 850
    .line 851
    move-result-object v2

    .line 852
    invoke-direct {v1, v2}, Li72;-><init>(Lce0;)V

    .line 853
    .line 854
    .line 855
    :goto_12
    iget-object v2, v1, Li72;->a:Lce0;

    .line 856
    .line 857
    check-cast v2, Ltz0;

    .line 858
    .line 859
    iget-object v2, v2, Ltz0;->p:Lzd0;

    .line 860
    .line 861
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->size()I

    .line 862
    .line 863
    .line 864
    move-result v2

    .line 865
    add-int/lit8 v2, v2, 0x3

    .line 866
    .line 867
    const-string v3, "expectedSize"

    .line 868
    .line 869
    invoke-static {v2, v3}, Lkp1;->a(ILjava/lang/String;)V

    .line 870
    .line 871
    .line 872
    new-instance v3, Lo7;

    .line 873
    .line 874
    invoke-direct {v3, v2}, Lo7;-><init>(I)V

    .line 875
    .line 876
    .line 877
    iget-object v1, v1, Li72;->a:Lce0;

    .line 878
    .line 879
    invoke-virtual {v1}, Lud0;->j()Lcf1;

    .line 880
    .line 881
    .line 882
    move-result-object v1

    .line 883
    :goto_13
    move-object v2, v1

    .line 884
    check-cast v2, Lwd0;

    .line 885
    .line 886
    invoke-virtual {v2}, Lwd0;->hasNext()Z

    .line 887
    .line 888
    .line 889
    move-result v5

    .line 890
    if-eqz v5, :cond_29

    .line 891
    .line 892
    invoke-virtual {v2}, Lwd0;->next()Ljava/lang/Object;

    .line 893
    .line 894
    .line 895
    move-result-object v2

    .line 896
    check-cast v2, Lg72;

    .line 897
    .line 898
    iget-object v5, v2, Lg72;->k:Ljava/lang/String;

    .line 899
    .line 900
    if-eqz v5, :cond_28

    .line 901
    .line 902
    goto :goto_14

    .line 903
    :cond_28
    iget-wide v5, v2, Lg72;->j:J

    .line 904
    .line 905
    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 906
    .line 907
    .line 908
    move-result-object v5

    .line 909
    :goto_14
    invoke-virtual {v2}, Lg72;->a()Ljava/lang/Object;

    .line 910
    .line 911
    .line 912
    move-result-object v2

    .line 913
    invoke-virtual {v3, v5, v2}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 914
    .line 915
    .line 916
    goto :goto_13

    .line 917
    :cond_29
    invoke-virtual {v4}, Lz62;->t()Ljava/lang/String;

    .line 918
    .line 919
    .line 920
    move-result-object v1

    .line 921
    const-string v2, "__phenotype_server_token"

    .line 922
    .line 923
    invoke-virtual {v3, v2, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 924
    .line 925
    .line 926
    invoke-virtual {v4}, Lz62;->r()Ljava/lang/String;

    .line 927
    .line 928
    .line 929
    move-result-object v1

    .line 930
    const-string v2, "__phenotype_snapshot_token"

    .line 931
    .line 932
    invoke-virtual {v3, v2, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 933
    .line 934
    .line 935
    invoke-virtual {v4}, Lz62;->u()J

    .line 936
    .line 937
    .line 938
    move-result-wide v1

    .line 939
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 940
    .line 941
    .line 942
    move-result-object v1

    .line 943
    const-string v2, "__phenotype_configuration_version"

    .line 944
    .line 945
    invoke-virtual {v3, v2, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 946
    .line 947
    .line 948
    invoke-virtual {v3, v7}, Lo7;->b(Z)Lrz0;

    .line 949
    .line 950
    .line 951
    move-result-object v1

    .line 952
    iput-object v1, v0, Lai;->d:Ljava/lang/Object;

    .line 953
    .line 954
    move-object/from16 v1, p2

    .line 955
    .line 956
    iput-object v1, v0, Lai;->e:Ljava/lang/Object;

    .line 957
    .line 958
    return-void
.end method

.method public constructor <init>(Lyb2;Ltw0;)V
    .locals 8

    .line 959
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lai;->a:Z

    invoke-static {}, Lyb2;->y()Lyb2;

    move-result-object v1

    invoke-virtual {v1, p1}, Lnp1;->equals(Ljava/lang/Object;)Z

    .line 960
    invoke-virtual {p1}, Lyb2;->r()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lai;->b:Ljava/lang/Object;

    .line 961
    invoke-virtual {p1}, Lyb2;->s()Lxo1;

    move-result-object v1

    iput-object v1, p0, Lai;->c:Ljava/lang/Object;

    .line 962
    sget v1, Lbe0;->l:I

    .line 963
    sget-object v1, Lsz0;->r:[Ljava/lang/Object;

    .line 964
    invoke-virtual {p1}, Lyb2;->w()I

    move-result v1

    const/4 v2, 0x3

    add-int/2addr v1, v2

    .line 965
    const-string v3, "expectedSize"

    invoke-static {v1, v3}, Lkp1;->a(ILjava/lang/String;)V

    .line 966
    new-instance v3, Lo7;

    invoke-direct {v3, v1}, Lo7;-><init>(I)V

    .line 967
    invoke-virtual {p1}, Lyb2;->v()Lyp1;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lac2;

    .line 968
    invoke-virtual {v4}, Lac2;->E()I

    move-result v5

    add-int/lit8 v6, v5, -0x1

    if-eqz v5, :cond_5

    if-eqz v6, :cond_4

    const/4 v5, 0x1

    if-eq v6, v5, :cond_3

    const/4 v5, 0x2

    if-eq v6, v5, :cond_2

    if-eq v6, v2, :cond_1

    const/4 v5, 0x4

    if-eq v6, v5, :cond_0

    goto :goto_0

    .line 969
    :cond_0
    invoke-virtual {v4}, Lac2;->r()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lac2;->w()Lxo1;

    move-result-object v4

    invoke-virtual {v4}, Lxo1;->p()[B

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 970
    :cond_1
    invoke-virtual {v4}, Lac2;->r()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lac2;->v()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 971
    :cond_2
    invoke-virtual {v4}, Lac2;->r()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lac2;->u()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 972
    :cond_3
    invoke-virtual {v4}, Lac2;->r()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lac2;->t()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 973
    :cond_4
    invoke-virtual {v4}, Lac2;->r()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lac2;->s()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_5
    const/4 p0, 0x0

    .line 974
    throw p0

    .line 975
    :cond_6
    invoke-virtual {p1}, Lyb2;->t()Ljava/lang/String;

    move-result-object v1

    const-string v2, "__phenotype_server_token"

    invoke-virtual {v3, v2, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 976
    invoke-virtual {p1}, Lyb2;->r()Ljava/lang/String;

    move-result-object v1

    const-string v2, "__phenotype_snapshot_token"

    invoke-virtual {v3, v2, v1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 977
    invoke-virtual {p1}, Lyb2;->u()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v1, "__phenotype_configuration_version"

    .line 978
    invoke-virtual {v3, v1, p1}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 979
    invoke-virtual {v3, v0}, Lo7;->b(Z)Lrz0;

    move-result-object p1

    .line 980
    iput-object p1, p0, Lai;->d:Ljava/lang/Object;

    iput-object p2, p0, Lai;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lai;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lbi;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lai;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    :try_start_1
    iput-boolean v1, p0, Lai;->a:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    iget-object v0, p0, Lai;->c:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, La81;

    .line 19
    .line 20
    invoke-static {v0}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 21
    .line 22
    .line 23
    :try_start_2
    iget-object p0, p0, Lai;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p0, Lvx;

    .line 26
    .line 27
    invoke-virtual {p0}, Lvx;->a()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 28
    .line 29
    .line 30
    :catch_0
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    monitor-exit v0

    .line 33
    throw p0
.end method

.method public b(Z)Le11;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lai;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lo10;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lo10;->f(Z)Le11;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iput-object p0, p1, Le11;->m:Lai;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    return-object p1

    .line 14
    :catch_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p1

    .line 17
    :goto_0
    invoke-virtual {p0, p1}, Lai;->c(Ljava/io/IOException;)V

    .line 18
    .line 19
    .line 20
    throw p1
.end method

.method public c(Ljava/io/IOException;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lai;->a:Z

    .line 3
    .line 4
    iget-object v1, p0, Lai;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Lp10;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lp10;->b(Ljava/io/IOException;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lai;->d:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lo10;

    .line 14
    .line 15
    invoke-interface {v1}, Lo10;->g()Lzx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Lai;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lwx0;

    .line 22
    .line 23
    monitor-enter v1

    .line 24
    :try_start_0
    instance-of v2, p1, Ly91;

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    move-object v2, p1

    .line 29
    check-cast v2, Ly91;

    .line 30
    .line 31
    iget v2, v2, Ly91;->j:I

    .line 32
    .line 33
    const/16 v3, 0x8

    .line 34
    .line 35
    if-ne v2, v3, :cond_0

    .line 36
    .line 37
    iget p0, v1, Lzx0;->n:I

    .line 38
    .line 39
    add-int/2addr p0, v0

    .line 40
    iput p0, v1, Lzx0;->n:I

    .line 41
    .line 42
    if-le p0, v0, :cond_5

    .line 43
    .line 44
    iput-boolean v0, v1, Lzx0;->j:Z

    .line 45
    .line 46
    iget p0, v1, Lzx0;->l:I

    .line 47
    .line 48
    add-int/2addr p0, v0

    .line 49
    iput p0, v1, Lzx0;->l:I

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_2

    .line 54
    :cond_0
    check-cast p1, Ly91;

    .line 55
    .line 56
    iget p1, p1, Ly91;->j:I

    .line 57
    .line 58
    const/16 v2, 0x9

    .line 59
    .line 60
    if-ne p1, v2, :cond_1

    .line 61
    .line 62
    iget-boolean p0, p0, Lwx0;->v:Z

    .line 63
    .line 64
    if-nez p0, :cond_5

    .line 65
    .line 66
    :cond_1
    iput-boolean v0, v1, Lzx0;->j:Z

    .line 67
    .line 68
    iget p0, v1, Lzx0;->l:I

    .line 69
    .line 70
    add-int/2addr p0, v0

    .line 71
    iput p0, v1, Lzx0;->l:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    iget-object v2, v1, Lzx0;->g:Ltc0;

    .line 75
    .line 76
    if-eqz v2, :cond_3

    .line 77
    .line 78
    move v2, v0

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    const/4 v2, 0x0

    .line 81
    :goto_0
    if-eqz v2, :cond_4

    .line 82
    .line 83
    instance-of v2, p1, Lpo;

    .line 84
    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    :cond_4
    iput-boolean v0, v1, Lzx0;->j:Z

    .line 88
    .line 89
    iget v2, v1, Lzx0;->m:I

    .line 90
    .line 91
    if-nez v2, :cond_5

    .line 92
    .line 93
    iget-object p0, p0, Lwx0;->j:Lmr0;

    .line 94
    .line 95
    iget-object v2, v1, Lzx0;->b:Ly11;

    .line 96
    .line 97
    invoke-static {p0, v2, p1}, Lzx0;->d(Lmr0;Ly11;Ljava/io/IOException;)V

    .line 98
    .line 99
    .line 100
    iget p0, v1, Lzx0;->l:I

    .line 101
    .line 102
    add-int/2addr p0, v0

    .line 103
    iput p0, v1, Lzx0;->l:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    .line 105
    :cond_5
    :goto_1
    monitor-exit v1

    .line 106
    return-void

    .line 107
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    throw p0
.end method
