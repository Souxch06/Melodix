.class public final Lgp;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lgp;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lpp;Lmg;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Lpp;->z:Lbp;

    .line 8
    .line 9
    iget-object v4, v1, Lpp;->x:Lbp;

    .line 10
    .line 11
    iget-object v5, v1, Lpp;->g:[I

    .line 12
    .line 13
    iget v6, v1, Lpp;->V:I

    .line 14
    .line 15
    const/16 v7, 0x8

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    if-ne v6, v7, :cond_0

    .line 19
    .line 20
    iput v8, v2, Lmg;->e:I

    .line 21
    .line 22
    iput v8, v2, Lmg;->f:I

    .line 23
    .line 24
    iput v8, v2, Lmg;->g:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget v6, v2, Lmg;->a:I

    .line 28
    .line 29
    iget v7, v2, Lmg;->b:I

    .line 30
    .line 31
    iget v9, v2, Lmg;->c:I

    .line 32
    .line 33
    iget v10, v2, Lmg;->d:I

    .line 34
    .line 35
    iget v11, v0, Lgp;->b:I

    .line 36
    .line 37
    iget v12, v0, Lgp;->c:I

    .line 38
    .line 39
    add-int/2addr v11, v12

    .line 40
    iget v12, v0, Lgp;->d:I

    .line 41
    .line 42
    iget-object v13, v1, Lpp;->U:Landroid/view/View;

    .line 43
    .line 44
    invoke-static {v6}, Loq;->t(I)I

    .line 45
    .line 46
    .line 47
    move-result v14

    .line 48
    const/4 v15, 0x1

    .line 49
    move/from16 v16, v8

    .line 50
    .line 51
    const/4 v8, 0x2

    .line 52
    if-eqz v14, :cond_b

    .line 53
    .line 54
    if-eq v14, v15, :cond_a

    .line 55
    .line 56
    if-eq v14, v8, :cond_4

    .line 57
    .line 58
    const/4 v9, 0x3

    .line 59
    if-eq v14, v9, :cond_1

    .line 60
    .line 61
    move/from16 v19, v8

    .line 62
    .line 63
    move/from16 v8, v16

    .line 64
    .line 65
    move v9, v8

    .line 66
    goto/16 :goto_8

    .line 67
    .line 68
    :cond_1
    iget v9, v0, Lgp;->f:I

    .line 69
    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    iget v14, v4, Lbp;->e:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    move/from16 v14, v16

    .line 76
    .line 77
    :goto_0
    if-eqz v3, :cond_3

    .line 78
    .line 79
    move/from16 v19, v8

    .line 80
    .line 81
    iget v8, v3, Lbp;->e:I

    .line 82
    .line 83
    add-int/2addr v14, v8

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move/from16 v19, v8

    .line 86
    .line 87
    :goto_1
    add-int/2addr v12, v14

    .line 88
    const/4 v8, -0x1

    .line 89
    invoke-static {v9, v12, v8}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 90
    .line 91
    .line 92
    move-result v9

    .line 93
    aput v8, v5, v19

    .line 94
    .line 95
    :goto_2
    move/from16 v8, v16

    .line 96
    .line 97
    goto/16 :goto_8

    .line 98
    .line 99
    :cond_4
    move/from16 v19, v8

    .line 100
    .line 101
    iget v8, v0, Lgp;->f:I

    .line 102
    .line 103
    const/4 v9, -0x2

    .line 104
    invoke-static {v8, v12, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    iget v9, v1, Lpp;->j:I

    .line 109
    .line 110
    if-ne v9, v15, :cond_5

    .line 111
    .line 112
    move v9, v15

    .line 113
    goto :goto_3

    .line 114
    :cond_5
    move/from16 v9, v16

    .line 115
    .line 116
    :goto_3
    aput v16, v5, v19

    .line 117
    .line 118
    iget-boolean v12, v2, Lmg;->j:Z

    .line 119
    .line 120
    if-eqz v12, :cond_8

    .line 121
    .line 122
    if-eqz v9, :cond_7

    .line 123
    .line 124
    const/16 v18, 0x3

    .line 125
    .line 126
    aget v12, v5, v18

    .line 127
    .line 128
    if-eqz v12, :cond_7

    .line 129
    .line 130
    aget v12, v5, v16

    .line 131
    .line 132
    invoke-virtual {v1}, Lpp;->j()I

    .line 133
    .line 134
    .line 135
    move-result v14

    .line 136
    if-ne v12, v14, :cond_6

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_6
    move v12, v15

    .line 140
    goto :goto_5

    .line 141
    :cond_7
    :goto_4
    move/from16 v12, v16

    .line 142
    .line 143
    :goto_5
    if-eqz v9, :cond_9

    .line 144
    .line 145
    if-eqz v12, :cond_8

    .line 146
    .line 147
    goto :goto_6

    .line 148
    :cond_8
    const/high16 v14, 0x40000000    # 2.0f

    .line 149
    .line 150
    goto :goto_7

    .line 151
    :cond_9
    :goto_6
    invoke-virtual {v1}, Lpp;->j()I

    .line 152
    .line 153
    .line 154
    move-result v8

    .line 155
    const/high16 v14, 0x40000000    # 2.0f

    .line 156
    .line 157
    invoke-static {v8, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 158
    .line 159
    .line 160
    move-result v9

    .line 161
    goto :goto_2

    .line 162
    :goto_7
    move v9, v8

    .line 163
    move v8, v15

    .line 164
    goto :goto_8

    .line 165
    :cond_a
    move/from16 v19, v8

    .line 166
    .line 167
    const/high16 v14, 0x40000000    # 2.0f

    .line 168
    .line 169
    iget v8, v0, Lgp;->f:I

    .line 170
    .line 171
    const/4 v9, -0x2

    .line 172
    invoke-static {v8, v12, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    aput v9, v5, v19

    .line 177
    .line 178
    goto :goto_7

    .line 179
    :cond_b
    move/from16 v19, v8

    .line 180
    .line 181
    const/high16 v14, 0x40000000    # 2.0f

    .line 182
    .line 183
    invoke-static {v9, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 184
    .line 185
    .line 186
    move-result v8

    .line 187
    aput v9, v5, v19

    .line 188
    .line 189
    move v9, v8

    .line 190
    goto :goto_2

    .line 191
    :goto_8
    invoke-static {v7}, Loq;->t(I)I

    .line 192
    .line 193
    .line 194
    move-result v12

    .line 195
    if-eqz v12, :cond_16

    .line 196
    .line 197
    if-eq v12, v15, :cond_15

    .line 198
    .line 199
    move/from16 v10, v19

    .line 200
    .line 201
    if-eq v12, v10, :cond_f

    .line 202
    .line 203
    const/4 v10, 0x3

    .line 204
    if-eq v12, v10, :cond_c

    .line 205
    .line 206
    move v4, v10

    .line 207
    move/from16 v0, v16

    .line 208
    .line 209
    move v3, v0

    .line 210
    goto/16 :goto_10

    .line 211
    .line 212
    :cond_c
    iget v0, v0, Lgp;->g:I

    .line 213
    .line 214
    if-eqz v4, :cond_d

    .line 215
    .line 216
    iget-object v4, v1, Lpp;->y:Lbp;

    .line 217
    .line 218
    iget v4, v4, Lbp;->e:I

    .line 219
    .line 220
    goto :goto_9

    .line 221
    :cond_d
    move/from16 v4, v16

    .line 222
    .line 223
    :goto_9
    if-eqz v3, :cond_e

    .line 224
    .line 225
    iget-object v3, v1, Lpp;->A:Lbp;

    .line 226
    .line 227
    iget v3, v3, Lbp;->e:I

    .line 228
    .line 229
    add-int/2addr v4, v3

    .line 230
    :cond_e
    add-int/2addr v11, v4

    .line 231
    const/4 v3, -0x1

    .line 232
    invoke-static {v0, v11, v3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    const/16 v18, 0x3

    .line 237
    .line 238
    aput v3, v5, v18

    .line 239
    .line 240
    move/from16 v3, v16

    .line 241
    .line 242
    move/from16 v4, v18

    .line 243
    .line 244
    goto/16 :goto_10

    .line 245
    .line 246
    :cond_f
    const/16 v18, 0x3

    .line 247
    .line 248
    iget v0, v0, Lgp;->g:I

    .line 249
    .line 250
    const/4 v3, -0x2

    .line 251
    invoke-static {v0, v11, v3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    iget v3, v1, Lpp;->k:I

    .line 256
    .line 257
    if-ne v3, v15, :cond_10

    .line 258
    .line 259
    move v3, v15

    .line 260
    goto :goto_a

    .line 261
    :cond_10
    move/from16 v3, v16

    .line 262
    .line 263
    :goto_a
    aput v16, v5, v18

    .line 264
    .line 265
    iget-boolean v4, v2, Lmg;->j:Z

    .line 266
    .line 267
    if-eqz v4, :cond_13

    .line 268
    .line 269
    if-eqz v3, :cond_12

    .line 270
    .line 271
    const/16 v19, 0x2

    .line 272
    .line 273
    aget v4, v5, v19

    .line 274
    .line 275
    if-eqz v4, :cond_12

    .line 276
    .line 277
    aget v4, v5, v15

    .line 278
    .line 279
    invoke-virtual {v1}, Lpp;->g()I

    .line 280
    .line 281
    .line 282
    move-result v10

    .line 283
    if-ne v4, v10, :cond_11

    .line 284
    .line 285
    goto :goto_b

    .line 286
    :cond_11
    move v4, v15

    .line 287
    goto :goto_c

    .line 288
    :cond_12
    :goto_b
    move/from16 v4, v16

    .line 289
    .line 290
    :goto_c
    if-eqz v3, :cond_14

    .line 291
    .line 292
    if-eqz v4, :cond_13

    .line 293
    .line 294
    goto :goto_d

    .line 295
    :cond_13
    const/high16 v14, 0x40000000    # 2.0f

    .line 296
    .line 297
    goto :goto_f

    .line 298
    :cond_14
    :goto_d
    invoke-virtual {v1}, Lpp;->g()I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    const/high16 v14, 0x40000000    # 2.0f

    .line 303
    .line 304
    invoke-static {v0, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    move/from16 v3, v16

    .line 309
    .line 310
    :goto_e
    const/4 v4, 0x3

    .line 311
    goto :goto_10

    .line 312
    :goto_f
    move v3, v15

    .line 313
    goto :goto_e

    .line 314
    :cond_15
    const/high16 v14, 0x40000000    # 2.0f

    .line 315
    .line 316
    iget v0, v0, Lgp;->g:I

    .line 317
    .line 318
    const/4 v3, -0x2

    .line 319
    invoke-static {v0, v11, v3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    const/4 v4, 0x3

    .line 324
    aput v3, v5, v4

    .line 325
    .line 326
    move v3, v15

    .line 327
    goto :goto_10

    .line 328
    :cond_16
    const/4 v4, 0x3

    .line 329
    const/high16 v14, 0x40000000    # 2.0f

    .line 330
    .line 331
    invoke-static {v10, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    aput v10, v5, v4

    .line 336
    .line 337
    move/from16 v3, v16

    .line 338
    .line 339
    :goto_10
    if-ne v6, v4, :cond_17

    .line 340
    .line 341
    move v10, v15

    .line 342
    goto :goto_11

    .line 343
    :cond_17
    move/from16 v10, v16

    .line 344
    .line 345
    :goto_11
    if-ne v7, v4, :cond_18

    .line 346
    .line 347
    move v4, v15

    .line 348
    goto :goto_12

    .line 349
    :cond_18
    move/from16 v4, v16

    .line 350
    .line 351
    :goto_12
    const/4 v11, 0x4

    .line 352
    if-eq v7, v11, :cond_1a

    .line 353
    .line 354
    if-ne v7, v15, :cond_19

    .line 355
    .line 356
    goto :goto_13

    .line 357
    :cond_19
    move/from16 v7, v16

    .line 358
    .line 359
    goto :goto_14

    .line 360
    :cond_1a
    :goto_13
    move v7, v15

    .line 361
    :goto_14
    if-eq v6, v11, :cond_1c

    .line 362
    .line 363
    if-ne v6, v15, :cond_1b

    .line 364
    .line 365
    goto :goto_15

    .line 366
    :cond_1b
    move/from16 v6, v16

    .line 367
    .line 368
    goto :goto_16

    .line 369
    :cond_1c
    :goto_15
    move v6, v15

    .line 370
    :goto_16
    const/4 v11, 0x0

    .line 371
    if-eqz v10, :cond_1d

    .line 372
    .line 373
    iget v12, v1, Lpp;->L:F

    .line 374
    .line 375
    cmpl-float v12, v12, v11

    .line 376
    .line 377
    if-lez v12, :cond_1d

    .line 378
    .line 379
    move v12, v15

    .line 380
    goto :goto_17

    .line 381
    :cond_1d
    move/from16 v12, v16

    .line 382
    .line 383
    :goto_17
    if-eqz v4, :cond_1e

    .line 384
    .line 385
    iget v14, v1, Lpp;->L:F

    .line 386
    .line 387
    cmpl-float v11, v14, v11

    .line 388
    .line 389
    if-lez v11, :cond_1e

    .line 390
    .line 391
    move v11, v15

    .line 392
    goto :goto_18

    .line 393
    :cond_1e
    move/from16 v11, v16

    .line 394
    .line 395
    :goto_18
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 396
    .line 397
    .line 398
    move-result-object v14

    .line 399
    check-cast v14, Lfp;

    .line 400
    .line 401
    move/from16 v17, v15

    .line 402
    .line 403
    iget-boolean v15, v2, Lmg;->j:Z

    .line 404
    .line 405
    if-nez v15, :cond_21

    .line 406
    .line 407
    if-eqz v10, :cond_21

    .line 408
    .line 409
    iget v10, v1, Lpp;->j:I

    .line 410
    .line 411
    if-nez v10, :cond_21

    .line 412
    .line 413
    if-eqz v4, :cond_21

    .line 414
    .line 415
    iget v4, v1, Lpp;->k:I

    .line 416
    .line 417
    if-eqz v4, :cond_1f

    .line 418
    .line 419
    goto :goto_1a

    .line 420
    :cond_1f
    move/from16 v3, v16

    .line 421
    .line 422
    move v5, v3

    .line 423
    move v15, v5

    .line 424
    :cond_20
    :goto_19
    const/4 v8, -0x1

    .line 425
    goto/16 :goto_21

    .line 426
    .line 427
    :cond_21
    :goto_1a
    invoke-virtual {v13, v9, v0}, Landroid/view/View;->measure(II)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    .line 431
    .line 432
    .line 433
    move-result v4

    .line 434
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    .line 435
    .line 436
    .line 437
    move-result v10

    .line 438
    invoke-virtual {v13}, Landroid/view/View;->getBaseline()I

    .line 439
    .line 440
    .line 441
    move-result v15

    .line 442
    if-eqz v8, :cond_22

    .line 443
    .line 444
    aput v4, v5, v16

    .line 445
    .line 446
    const/16 v19, 0x2

    .line 447
    .line 448
    aput v10, v5, v19

    .line 449
    .line 450
    goto :goto_1b

    .line 451
    :cond_22
    const/16 v19, 0x2

    .line 452
    .line 453
    aput v16, v5, v16

    .line 454
    .line 455
    aput v16, v5, v19

    .line 456
    .line 457
    :goto_1b
    if-eqz v3, :cond_23

    .line 458
    .line 459
    aput v10, v5, v17

    .line 460
    .line 461
    const/16 v18, 0x3

    .line 462
    .line 463
    aput v4, v5, v18

    .line 464
    .line 465
    goto :goto_1c

    .line 466
    :cond_23
    const/16 v18, 0x3

    .line 467
    .line 468
    aput v16, v5, v17

    .line 469
    .line 470
    aput v16, v5, v18

    .line 471
    .line 472
    :goto_1c
    iget v3, v1, Lpp;->m:I

    .line 473
    .line 474
    if-lez v3, :cond_24

    .line 475
    .line 476
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    goto :goto_1d

    .line 481
    :cond_24
    move v3, v4

    .line 482
    :goto_1d
    iget v5, v1, Lpp;->n:I

    .line 483
    .line 484
    if-lez v5, :cond_25

    .line 485
    .line 486
    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    .line 487
    .line 488
    .line 489
    move-result v3

    .line 490
    :cond_25
    iget v5, v1, Lpp;->p:I

    .line 491
    .line 492
    if-lez v5, :cond_26

    .line 493
    .line 494
    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    .line 495
    .line 496
    .line 497
    move-result v5

    .line 498
    goto :goto_1e

    .line 499
    :cond_26
    move v5, v10

    .line 500
    :goto_1e
    iget v8, v1, Lpp;->q:I

    .line 501
    .line 502
    if-lez v8, :cond_27

    .line 503
    .line 504
    invoke-static {v8, v5}, Ljava/lang/Math;->min(II)I

    .line 505
    .line 506
    .line 507
    move-result v5

    .line 508
    :cond_27
    const/high16 v8, 0x3f000000    # 0.5f

    .line 509
    .line 510
    if-eqz v12, :cond_28

    .line 511
    .line 512
    if-eqz v7, :cond_28

    .line 513
    .line 514
    iget v3, v1, Lpp;->L:F

    .line 515
    .line 516
    int-to-float v6, v5

    .line 517
    mul-float/2addr v6, v3

    .line 518
    add-float/2addr v6, v8

    .line 519
    float-to-int v3, v6

    .line 520
    goto :goto_1f

    .line 521
    :cond_28
    if-eqz v11, :cond_29

    .line 522
    .line 523
    if-eqz v6, :cond_29

    .line 524
    .line 525
    iget v5, v1, Lpp;->L:F

    .line 526
    .line 527
    int-to-float v6, v3

    .line 528
    div-float/2addr v6, v5

    .line 529
    add-float/2addr v6, v8

    .line 530
    float-to-int v5, v6

    .line 531
    :cond_29
    :goto_1f
    if-ne v4, v3, :cond_2a

    .line 532
    .line 533
    if-eq v10, v5, :cond_20

    .line 534
    .line 535
    :cond_2a
    if-eq v4, v3, :cond_2b

    .line 536
    .line 537
    const/high16 v4, 0x40000000    # 2.0f

    .line 538
    .line 539
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 540
    .line 541
    .line 542
    move-result v9

    .line 543
    goto :goto_20

    .line 544
    :cond_2b
    const/high16 v4, 0x40000000    # 2.0f

    .line 545
    .line 546
    :goto_20
    if-eq v10, v5, :cond_2c

    .line 547
    .line 548
    invoke-static {v5, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 549
    .line 550
    .line 551
    move-result v0

    .line 552
    :cond_2c
    invoke-virtual {v13, v9, v0}, Landroid/view/View;->measure(II)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    .line 556
    .line 557
    .line 558
    move-result v3

    .line 559
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    .line 560
    .line 561
    .line 562
    move-result v5

    .line 563
    invoke-virtual {v13}, Landroid/view/View;->getBaseline()I

    .line 564
    .line 565
    .line 566
    move-result v15

    .line 567
    goto/16 :goto_19

    .line 568
    .line 569
    :goto_21
    if-eq v15, v8, :cond_2d

    .line 570
    .line 571
    move/from16 v0, v17

    .line 572
    .line 573
    goto :goto_22

    .line 574
    :cond_2d
    move/from16 v0, v16

    .line 575
    .line 576
    :goto_22
    iget v4, v2, Lmg;->c:I

    .line 577
    .line 578
    if-ne v3, v4, :cond_2f

    .line 579
    .line 580
    iget v4, v2, Lmg;->d:I

    .line 581
    .line 582
    if-eq v5, v4, :cond_2e

    .line 583
    .line 584
    goto :goto_23

    .line 585
    :cond_2e
    move/from16 v8, v16

    .line 586
    .line 587
    goto :goto_24

    .line 588
    :cond_2f
    :goto_23
    move/from16 v8, v17

    .line 589
    .line 590
    :goto_24
    iput-boolean v8, v2, Lmg;->i:Z

    .line 591
    .line 592
    iget-boolean v4, v14, Lfp;->W:Z

    .line 593
    .line 594
    if-eqz v4, :cond_30

    .line 595
    .line 596
    move/from16 v0, v17

    .line 597
    .line 598
    :cond_30
    if-eqz v0, :cond_31

    .line 599
    .line 600
    const/4 v8, -0x1

    .line 601
    if-eq v15, v8, :cond_31

    .line 602
    .line 603
    iget v1, v1, Lpp;->P:I

    .line 604
    .line 605
    if-eq v1, v15, :cond_31

    .line 606
    .line 607
    move/from16 v1, v17

    .line 608
    .line 609
    iput-boolean v1, v2, Lmg;->i:Z

    .line 610
    .line 611
    :cond_31
    iput v3, v2, Lmg;->e:I

    .line 612
    .line 613
    iput v5, v2, Lmg;->f:I

    .line 614
    .line 615
    iput-boolean v0, v2, Lmg;->h:Z

    .line 616
    .line 617
    iput v15, v2, Lmg;->g:I

    .line 618
    .line 619
    return-void
.end method
