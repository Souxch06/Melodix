.class public final Lbc0;
.super Loj1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final k:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lbc0;->k:[I

    .line 5
    .line 6
    return-void
.end method

.method public static m([IIIIIFI)V
    .locals 2

    .line 1
    sub-int/2addr p2, p1

    .line 2
    sub-int/2addr p4, p3

    .line 3
    const/4 p1, -0x1

    .line 4
    const/4 p3, 0x0

    .line 5
    const/high16 v0, 0x3f000000    # 0.5f

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq p6, p1, :cond_2

    .line 9
    .line 10
    if-eqz p6, :cond_1

    .line 11
    .line 12
    if-eq p6, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    int-to-float p1, p2

    .line 16
    mul-float/2addr p1, p5

    .line 17
    add-float/2addr p1, v0

    .line 18
    float-to-int p1, p1

    .line 19
    aput p2, p0, p3

    .line 20
    .line 21
    aput p1, p0, v1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    int-to-float p1, p4

    .line 25
    mul-float/2addr p1, p5

    .line 26
    add-float/2addr p1, v0

    .line 27
    float-to-int p1, p1

    .line 28
    aput p1, p0, p3

    .line 29
    .line 30
    aput p4, p0, v1

    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    int-to-float p1, p4

    .line 34
    mul-float/2addr p1, p5

    .line 35
    add-float/2addr p1, v0

    .line 36
    float-to-int p1, p1

    .line 37
    int-to-float p6, p2

    .line 38
    div-float/2addr p6, p5

    .line 39
    add-float/2addr p6, v0

    .line 40
    float-to-int p5, p6

    .line 41
    if-gt p1, p2, :cond_3

    .line 42
    .line 43
    aput p1, p0, p3

    .line 44
    .line 45
    aput p4, p0, v1

    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    if-gt p5, p4, :cond_4

    .line 49
    .line 50
    aput p2, p0, p3

    .line 51
    .line 52
    aput p5, p0, v1

    .line 53
    .line 54
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public final a(Lcx;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Loj1;->j:I

    .line 4
    .line 5
    invoke-static {v1}, Loq;->t(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eq v1, v2, :cond_26

    .line 12
    .line 13
    iget-object v1, v0, Loj1;->e:Lrx;

    .line 14
    .line 15
    iget-boolean v4, v1, Lfx;->j:Z

    .line 16
    .line 17
    const/high16 v5, 0x3f000000    # 0.5f

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    iget-object v7, v0, Loj1;->h:Lfx;

    .line 21
    .line 22
    iget-object v8, v0, Loj1;->i:Lfx;

    .line 23
    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    iget v4, v0, Loj1;->d:I

    .line 27
    .line 28
    if-ne v4, v2, :cond_0

    .line 29
    .line 30
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 31
    .line 32
    iget v9, v4, Lpp;->j:I

    .line 33
    .line 34
    iget-object v10, v4, Lpp;->e:Lgh1;

    .line 35
    .line 36
    const/4 v11, 0x2

    .line 37
    if-eq v9, v11, :cond_1c

    .line 38
    .line 39
    if-eq v9, v2, :cond_1

    .line 40
    .line 41
    :cond_0
    :goto_0
    move/from16 p1, v5

    .line 42
    .line 43
    goto/16 :goto_a

    .line 44
    .line 45
    :cond_1
    iget v9, v4, Lpp;->k:I

    .line 46
    .line 47
    const/4 v11, -0x1

    .line 48
    if-eqz v9, :cond_6

    .line 49
    .line 50
    if-ne v9, v2, :cond_2

    .line 51
    .line 52
    goto :goto_4

    .line 53
    :cond_2
    iget v9, v4, Lpp;->M:I

    .line 54
    .line 55
    if-eq v9, v11, :cond_5

    .line 56
    .line 57
    if-eqz v9, :cond_4

    .line 58
    .line 59
    if-eq v9, v6, :cond_3

    .line 60
    .line 61
    move v4, v3

    .line 62
    goto :goto_3

    .line 63
    :cond_3
    iget-object v9, v10, Loj1;->e:Lrx;

    .line 64
    .line 65
    iget v9, v9, Lfx;->g:I

    .line 66
    .line 67
    int-to-float v9, v9

    .line 68
    iget v4, v4, Lpp;->L:F

    .line 69
    .line 70
    :goto_1
    mul-float/2addr v9, v4

    .line 71
    :goto_2
    add-float/2addr v9, v5

    .line 72
    float-to-int v4, v9

    .line 73
    goto :goto_3

    .line 74
    :cond_4
    iget-object v9, v10, Loj1;->e:Lrx;

    .line 75
    .line 76
    iget v9, v9, Lfx;->g:I

    .line 77
    .line 78
    int-to-float v9, v9

    .line 79
    iget v4, v4, Lpp;->L:F

    .line 80
    .line 81
    div-float/2addr v9, v4

    .line 82
    goto :goto_2

    .line 83
    :cond_5
    iget-object v9, v10, Loj1;->e:Lrx;

    .line 84
    .line 85
    iget v9, v9, Lfx;->g:I

    .line 86
    .line 87
    int-to-float v9, v9

    .line 88
    iget v4, v4, Lpp;->L:F

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :goto_3
    invoke-virtual {v1, v4}, Lrx;->d(I)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    :goto_4
    iget-object v9, v10, Loj1;->h:Lfx;

    .line 96
    .line 97
    iget-object v10, v10, Loj1;->i:Lfx;

    .line 98
    .line 99
    iget-object v12, v4, Lpp;->x:Lbp;

    .line 100
    .line 101
    iget-object v12, v12, Lbp;->d:Lbp;

    .line 102
    .line 103
    if-eqz v12, :cond_7

    .line 104
    .line 105
    move v12, v6

    .line 106
    goto :goto_5

    .line 107
    :cond_7
    move v12, v3

    .line 108
    :goto_5
    iget-object v13, v4, Lpp;->y:Lbp;

    .line 109
    .line 110
    iget-object v13, v13, Lbp;->d:Lbp;

    .line 111
    .line 112
    if-eqz v13, :cond_8

    .line 113
    .line 114
    move v13, v6

    .line 115
    goto :goto_6

    .line 116
    :cond_8
    move v13, v3

    .line 117
    :goto_6
    iget-object v14, v4, Lpp;->z:Lbp;

    .line 118
    .line 119
    iget-object v14, v14, Lbp;->d:Lbp;

    .line 120
    .line 121
    if-eqz v14, :cond_9

    .line 122
    .line 123
    move v14, v6

    .line 124
    goto :goto_7

    .line 125
    :cond_9
    move v14, v3

    .line 126
    :goto_7
    iget-object v15, v4, Lpp;->A:Lbp;

    .line 127
    .line 128
    iget-object v15, v15, Lbp;->d:Lbp;

    .line 129
    .line 130
    if-eqz v15, :cond_a

    .line 131
    .line 132
    move v15, v6

    .line 133
    :goto_8
    move/from16 p1, v5

    .line 134
    .line 135
    goto :goto_9

    .line 136
    :cond_a
    move v15, v3

    .line 137
    goto :goto_8

    .line 138
    :goto_9
    iget v5, v4, Lpp;->M:I

    .line 139
    .line 140
    if-eqz v12, :cond_10

    .line 141
    .line 142
    if-eqz v13, :cond_10

    .line 143
    .line 144
    if-eqz v14, :cond_10

    .line 145
    .line 146
    if-eqz v15, :cond_10

    .line 147
    .line 148
    iget v4, v4, Lpp;->L:F

    .line 149
    .line 150
    iget-boolean v11, v9, Lfx;->j:Z

    .line 151
    .line 152
    iget-object v12, v9, Lfx;->l:Ljava/util/ArrayList;

    .line 153
    .line 154
    sget-object v16, Lbc0;->k:[I

    .line 155
    .line 156
    if-eqz v11, :cond_c

    .line 157
    .line 158
    iget-boolean v11, v10, Lfx;->j:Z

    .line 159
    .line 160
    if-eqz v11, :cond_c

    .line 161
    .line 162
    iget-boolean v2, v7, Lfx;->c:Z

    .line 163
    .line 164
    if-eqz v2, :cond_25

    .line 165
    .line 166
    iget-boolean v2, v8, Lfx;->c:Z

    .line 167
    .line 168
    if-nez v2, :cond_b

    .line 169
    .line 170
    goto/16 :goto_c

    .line 171
    .line 172
    :cond_b
    iget-object v2, v7, Lfx;->l:Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, Lfx;

    .line 179
    .line 180
    iget v2, v2, Lfx;->g:I

    .line 181
    .line 182
    iget v7, v7, Lfx;->f:I

    .line 183
    .line 184
    add-int v17, v2, v7

    .line 185
    .line 186
    iget-object v2, v8, Lfx;->l:Ljava/util/ArrayList;

    .line 187
    .line 188
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Lfx;

    .line 193
    .line 194
    iget v2, v2, Lfx;->g:I

    .line 195
    .line 196
    iget v7, v8, Lfx;->f:I

    .line 197
    .line 198
    sub-int v18, v2, v7

    .line 199
    .line 200
    iget v2, v9, Lfx;->g:I

    .line 201
    .line 202
    iget v7, v9, Lfx;->f:I

    .line 203
    .line 204
    add-int v19, v2, v7

    .line 205
    .line 206
    iget v2, v10, Lfx;->g:I

    .line 207
    .line 208
    iget v7, v10, Lfx;->f:I

    .line 209
    .line 210
    sub-int v20, v2, v7

    .line 211
    .line 212
    move/from16 v21, v4

    .line 213
    .line 214
    move/from16 v22, v5

    .line 215
    .line 216
    invoke-static/range {v16 .. v22}, Lbc0;->m([IIIIIFI)V

    .line 217
    .line 218
    .line 219
    aget v2, v16, v3

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Lrx;->d(I)V

    .line 222
    .line 223
    .line 224
    iget-object v0, v0, Loj1;->b:Lpp;

    .line 225
    .line 226
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 227
    .line 228
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 229
    .line 230
    aget v1, v16, v6

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Lrx;->d(I)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_c
    move/from16 v21, v4

    .line 237
    .line 238
    move/from16 v22, v5

    .line 239
    .line 240
    iget-boolean v4, v7, Lfx;->j:Z

    .line 241
    .line 242
    if-eqz v4, :cond_e

    .line 243
    .line 244
    iget-boolean v4, v8, Lfx;->j:Z

    .line 245
    .line 246
    if-eqz v4, :cond_e

    .line 247
    .line 248
    iget-boolean v4, v9, Lfx;->c:Z

    .line 249
    .line 250
    if-eqz v4, :cond_25

    .line 251
    .line 252
    iget-boolean v4, v10, Lfx;->c:Z

    .line 253
    .line 254
    if-nez v4, :cond_d

    .line 255
    .line 256
    goto/16 :goto_c

    .line 257
    .line 258
    :cond_d
    iget v4, v7, Lfx;->g:I

    .line 259
    .line 260
    iget v5, v7, Lfx;->f:I

    .line 261
    .line 262
    add-int v17, v4, v5

    .line 263
    .line 264
    iget v4, v8, Lfx;->g:I

    .line 265
    .line 266
    iget v5, v8, Lfx;->f:I

    .line 267
    .line 268
    sub-int v18, v4, v5

    .line 269
    .line 270
    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    check-cast v4, Lfx;

    .line 275
    .line 276
    iget v4, v4, Lfx;->g:I

    .line 277
    .line 278
    iget v5, v9, Lfx;->f:I

    .line 279
    .line 280
    add-int v19, v4, v5

    .line 281
    .line 282
    iget-object v4, v10, Lfx;->l:Ljava/util/ArrayList;

    .line 283
    .line 284
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    check-cast v4, Lfx;

    .line 289
    .line 290
    iget v4, v4, Lfx;->g:I

    .line 291
    .line 292
    iget v5, v10, Lfx;->f:I

    .line 293
    .line 294
    sub-int v20, v4, v5

    .line 295
    .line 296
    invoke-static/range {v16 .. v22}, Lbc0;->m([IIIIIFI)V

    .line 297
    .line 298
    .line 299
    aget v4, v16, v3

    .line 300
    .line 301
    invoke-virtual {v1, v4}, Lrx;->d(I)V

    .line 302
    .line 303
    .line 304
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 305
    .line 306
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 307
    .line 308
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 309
    .line 310
    aget v5, v16, v6

    .line 311
    .line 312
    invoke-virtual {v4, v5}, Lrx;->d(I)V

    .line 313
    .line 314
    .line 315
    :cond_e
    iget-boolean v4, v7, Lfx;->c:Z

    .line 316
    .line 317
    if-eqz v4, :cond_25

    .line 318
    .line 319
    iget-boolean v4, v8, Lfx;->c:Z

    .line 320
    .line 321
    if-eqz v4, :cond_25

    .line 322
    .line 323
    iget-boolean v4, v9, Lfx;->c:Z

    .line 324
    .line 325
    if-eqz v4, :cond_25

    .line 326
    .line 327
    iget-boolean v4, v10, Lfx;->c:Z

    .line 328
    .line 329
    if-nez v4, :cond_f

    .line 330
    .line 331
    goto/16 :goto_c

    .line 332
    .line 333
    :cond_f
    iget-object v4, v7, Lfx;->l:Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    check-cast v4, Lfx;

    .line 340
    .line 341
    iget v4, v4, Lfx;->g:I

    .line 342
    .line 343
    iget v5, v7, Lfx;->f:I

    .line 344
    .line 345
    add-int v17, v4, v5

    .line 346
    .line 347
    iget-object v4, v8, Lfx;->l:Ljava/util/ArrayList;

    .line 348
    .line 349
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    check-cast v4, Lfx;

    .line 354
    .line 355
    iget v4, v4, Lfx;->g:I

    .line 356
    .line 357
    iget v5, v8, Lfx;->f:I

    .line 358
    .line 359
    sub-int v18, v4, v5

    .line 360
    .line 361
    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v4

    .line 365
    check-cast v4, Lfx;

    .line 366
    .line 367
    iget v4, v4, Lfx;->g:I

    .line 368
    .line 369
    iget v5, v9, Lfx;->f:I

    .line 370
    .line 371
    add-int v19, v4, v5

    .line 372
    .line 373
    iget-object v4, v10, Lfx;->l:Ljava/util/ArrayList;

    .line 374
    .line 375
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    check-cast v4, Lfx;

    .line 380
    .line 381
    iget v4, v4, Lfx;->g:I

    .line 382
    .line 383
    iget v5, v10, Lfx;->f:I

    .line 384
    .line 385
    sub-int v20, v4, v5

    .line 386
    .line 387
    invoke-static/range {v16 .. v22}, Lbc0;->m([IIIIIFI)V

    .line 388
    .line 389
    .line 390
    aget v4, v16, v3

    .line 391
    .line 392
    invoke-virtual {v1, v4}, Lrx;->d(I)V

    .line 393
    .line 394
    .line 395
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 396
    .line 397
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 398
    .line 399
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 400
    .line 401
    aget v5, v16, v6

    .line 402
    .line 403
    invoke-virtual {v4, v5}, Lrx;->d(I)V

    .line 404
    .line 405
    .line 406
    goto/16 :goto_a

    .line 407
    .line 408
    :cond_10
    if-eqz v12, :cond_16

    .line 409
    .line 410
    if-eqz v14, :cond_16

    .line 411
    .line 412
    iget-boolean v9, v7, Lfx;->c:Z

    .line 413
    .line 414
    if-eqz v9, :cond_25

    .line 415
    .line 416
    iget-boolean v9, v8, Lfx;->c:Z

    .line 417
    .line 418
    if-nez v9, :cond_11

    .line 419
    .line 420
    goto/16 :goto_c

    .line 421
    .line 422
    :cond_11
    iget v4, v4, Lpp;->L:F

    .line 423
    .line 424
    iget-object v9, v7, Lfx;->l:Ljava/util/ArrayList;

    .line 425
    .line 426
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v9

    .line 430
    check-cast v9, Lfx;

    .line 431
    .line 432
    iget v9, v9, Lfx;->g:I

    .line 433
    .line 434
    iget v10, v7, Lfx;->f:I

    .line 435
    .line 436
    add-int/2addr v9, v10

    .line 437
    iget-object v10, v8, Lfx;->l:Ljava/util/ArrayList;

    .line 438
    .line 439
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    move-result-object v10

    .line 443
    check-cast v10, Lfx;

    .line 444
    .line 445
    iget v10, v10, Lfx;->g:I

    .line 446
    .line 447
    iget v12, v8, Lfx;->f:I

    .line 448
    .line 449
    sub-int/2addr v10, v12

    .line 450
    if-eq v5, v11, :cond_14

    .line 451
    .line 452
    if-eqz v5, :cond_14

    .line 453
    .line 454
    if-eq v5, v6, :cond_12

    .line 455
    .line 456
    goto/16 :goto_a

    .line 457
    .line 458
    :cond_12
    sub-int/2addr v10, v9

    .line 459
    invoke-virtual {v0, v10, v3}, Loj1;->g(II)I

    .line 460
    .line 461
    .line 462
    move-result v5

    .line 463
    int-to-float v9, v5

    .line 464
    div-float/2addr v9, v4

    .line 465
    add-float v9, v9, p1

    .line 466
    .line 467
    float-to-int v9, v9

    .line 468
    invoke-virtual {v0, v9, v6}, Loj1;->g(II)I

    .line 469
    .line 470
    .line 471
    move-result v10

    .line 472
    if-eq v9, v10, :cond_13

    .line 473
    .line 474
    int-to-float v5, v10

    .line 475
    mul-float/2addr v5, v4

    .line 476
    add-float v5, v5, p1

    .line 477
    .line 478
    float-to-int v5, v5

    .line 479
    :cond_13
    invoke-virtual {v1, v5}, Lrx;->d(I)V

    .line 480
    .line 481
    .line 482
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 483
    .line 484
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 485
    .line 486
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 487
    .line 488
    invoke-virtual {v4, v10}, Lrx;->d(I)V

    .line 489
    .line 490
    .line 491
    goto/16 :goto_a

    .line 492
    .line 493
    :cond_14
    sub-int/2addr v10, v9

    .line 494
    invoke-virtual {v0, v10, v3}, Loj1;->g(II)I

    .line 495
    .line 496
    .line 497
    move-result v5

    .line 498
    int-to-float v9, v5

    .line 499
    mul-float/2addr v9, v4

    .line 500
    add-float v9, v9, p1

    .line 501
    .line 502
    float-to-int v9, v9

    .line 503
    invoke-virtual {v0, v9, v6}, Loj1;->g(II)I

    .line 504
    .line 505
    .line 506
    move-result v10

    .line 507
    if-eq v9, v10, :cond_15

    .line 508
    .line 509
    int-to-float v5, v10

    .line 510
    div-float/2addr v5, v4

    .line 511
    add-float v5, v5, p1

    .line 512
    .line 513
    float-to-int v5, v5

    .line 514
    :cond_15
    invoke-virtual {v1, v5}, Lrx;->d(I)V

    .line 515
    .line 516
    .line 517
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 518
    .line 519
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 520
    .line 521
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 522
    .line 523
    invoke-virtual {v4, v10}, Lrx;->d(I)V

    .line 524
    .line 525
    .line 526
    goto/16 :goto_a

    .line 527
    .line 528
    :cond_16
    if-eqz v13, :cond_1d

    .line 529
    .line 530
    if-eqz v15, :cond_1d

    .line 531
    .line 532
    iget-boolean v12, v9, Lfx;->c:Z

    .line 533
    .line 534
    if-eqz v12, :cond_25

    .line 535
    .line 536
    iget-boolean v12, v10, Lfx;->c:Z

    .line 537
    .line 538
    if-nez v12, :cond_17

    .line 539
    .line 540
    goto/16 :goto_c

    .line 541
    .line 542
    :cond_17
    iget v4, v4, Lpp;->L:F

    .line 543
    .line 544
    iget-object v12, v9, Lfx;->l:Ljava/util/ArrayList;

    .line 545
    .line 546
    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    move-result-object v12

    .line 550
    check-cast v12, Lfx;

    .line 551
    .line 552
    iget v12, v12, Lfx;->g:I

    .line 553
    .line 554
    iget v9, v9, Lfx;->f:I

    .line 555
    .line 556
    add-int/2addr v12, v9

    .line 557
    iget-object v9, v10, Lfx;->l:Ljava/util/ArrayList;

    .line 558
    .line 559
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object v9

    .line 563
    check-cast v9, Lfx;

    .line 564
    .line 565
    iget v9, v9, Lfx;->g:I

    .line 566
    .line 567
    iget v10, v10, Lfx;->f:I

    .line 568
    .line 569
    sub-int/2addr v9, v10

    .line 570
    if-eq v5, v11, :cond_1a

    .line 571
    .line 572
    if-eqz v5, :cond_18

    .line 573
    .line 574
    if-eq v5, v6, :cond_1a

    .line 575
    .line 576
    goto :goto_a

    .line 577
    :cond_18
    sub-int/2addr v9, v12

    .line 578
    invoke-virtual {v0, v9, v6}, Loj1;->g(II)I

    .line 579
    .line 580
    .line 581
    move-result v5

    .line 582
    int-to-float v9, v5

    .line 583
    mul-float/2addr v9, v4

    .line 584
    add-float v9, v9, p1

    .line 585
    .line 586
    float-to-int v9, v9

    .line 587
    invoke-virtual {v0, v9, v3}, Loj1;->g(II)I

    .line 588
    .line 589
    .line 590
    move-result v10

    .line 591
    if-eq v9, v10, :cond_19

    .line 592
    .line 593
    int-to-float v5, v10

    .line 594
    div-float/2addr v5, v4

    .line 595
    add-float v5, v5, p1

    .line 596
    .line 597
    float-to-int v5, v5

    .line 598
    :cond_19
    invoke-virtual {v1, v10}, Lrx;->d(I)V

    .line 599
    .line 600
    .line 601
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 602
    .line 603
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 604
    .line 605
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 606
    .line 607
    invoke-virtual {v4, v5}, Lrx;->d(I)V

    .line 608
    .line 609
    .line 610
    goto :goto_a

    .line 611
    :cond_1a
    sub-int/2addr v9, v12

    .line 612
    invoke-virtual {v0, v9, v6}, Loj1;->g(II)I

    .line 613
    .line 614
    .line 615
    move-result v5

    .line 616
    int-to-float v9, v5

    .line 617
    div-float/2addr v9, v4

    .line 618
    add-float v9, v9, p1

    .line 619
    .line 620
    float-to-int v9, v9

    .line 621
    invoke-virtual {v0, v9, v3}, Loj1;->g(II)I

    .line 622
    .line 623
    .line 624
    move-result v10

    .line 625
    if-eq v9, v10, :cond_1b

    .line 626
    .line 627
    int-to-float v5, v10

    .line 628
    mul-float/2addr v5, v4

    .line 629
    add-float v5, v5, p1

    .line 630
    .line 631
    float-to-int v5, v5

    .line 632
    :cond_1b
    invoke-virtual {v1, v10}, Lrx;->d(I)V

    .line 633
    .line 634
    .line 635
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 636
    .line 637
    iget-object v4, v4, Lpp;->e:Lgh1;

    .line 638
    .line 639
    iget-object v4, v4, Loj1;->e:Lrx;

    .line 640
    .line 641
    invoke-virtual {v4, v5}, Lrx;->d(I)V

    .line 642
    .line 643
    .line 644
    goto :goto_a

    .line 645
    :cond_1c
    move/from16 p1, v5

    .line 646
    .line 647
    iget-object v5, v4, Lpp;->I:Lqp;

    .line 648
    .line 649
    if-eqz v5, :cond_1d

    .line 650
    .line 651
    iget-object v5, v5, Lpp;->d:Lbc0;

    .line 652
    .line 653
    iget-object v5, v5, Loj1;->e:Lrx;

    .line 654
    .line 655
    iget-boolean v9, v5, Lfx;->j:Z

    .line 656
    .line 657
    if-eqz v9, :cond_1d

    .line 658
    .line 659
    iget v4, v4, Lpp;->o:F

    .line 660
    .line 661
    iget v5, v5, Lfx;->g:I

    .line 662
    .line 663
    int-to-float v5, v5

    .line 664
    mul-float/2addr v5, v4

    .line 665
    add-float v5, v5, p1

    .line 666
    .line 667
    float-to-int v4, v5

    .line 668
    invoke-virtual {v1, v4}, Lrx;->d(I)V

    .line 669
    .line 670
    .line 671
    :cond_1d
    :goto_a
    iget-boolean v4, v7, Lfx;->c:Z

    .line 672
    .line 673
    iget-object v5, v7, Lfx;->l:Ljava/util/ArrayList;

    .line 674
    .line 675
    if-eqz v4, :cond_25

    .line 676
    .line 677
    iget-boolean v4, v8, Lfx;->c:Z

    .line 678
    .line 679
    iget-object v9, v8, Lfx;->l:Ljava/util/ArrayList;

    .line 680
    .line 681
    if-nez v4, :cond_1e

    .line 682
    .line 683
    goto/16 :goto_c

    .line 684
    .line 685
    :cond_1e
    iget-boolean v4, v7, Lfx;->j:Z

    .line 686
    .line 687
    if-eqz v4, :cond_1f

    .line 688
    .line 689
    iget-boolean v4, v8, Lfx;->j:Z

    .line 690
    .line 691
    if-eqz v4, :cond_1f

    .line 692
    .line 693
    iget-boolean v4, v1, Lfx;->j:Z

    .line 694
    .line 695
    if-eqz v4, :cond_1f

    .line 696
    .line 697
    goto/16 :goto_c

    .line 698
    .line 699
    :cond_1f
    iget-boolean v4, v1, Lfx;->j:Z

    .line 700
    .line 701
    if-nez v4, :cond_20

    .line 702
    .line 703
    iget v4, v0, Loj1;->d:I

    .line 704
    .line 705
    if-ne v4, v2, :cond_20

    .line 706
    .line 707
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 708
    .line 709
    iget v10, v4, Lpp;->j:I

    .line 710
    .line 711
    if-nez v10, :cond_20

    .line 712
    .line 713
    invoke-virtual {v4}, Lpp;->o()Z

    .line 714
    .line 715
    .line 716
    move-result v4

    .line 717
    if-nez v4, :cond_20

    .line 718
    .line 719
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 720
    .line 721
    .line 722
    move-result-object v0

    .line 723
    check-cast v0, Lfx;

    .line 724
    .line 725
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 726
    .line 727
    .line 728
    move-result-object v2

    .line 729
    check-cast v2, Lfx;

    .line 730
    .line 731
    iget v0, v0, Lfx;->g:I

    .line 732
    .line 733
    iget v3, v7, Lfx;->f:I

    .line 734
    .line 735
    add-int/2addr v0, v3

    .line 736
    iget v2, v2, Lfx;->g:I

    .line 737
    .line 738
    iget v3, v8, Lfx;->f:I

    .line 739
    .line 740
    add-int/2addr v2, v3

    .line 741
    sub-int v3, v2, v0

    .line 742
    .line 743
    invoke-virtual {v7, v0}, Lfx;->d(I)V

    .line 744
    .line 745
    .line 746
    invoke-virtual {v8, v2}, Lfx;->d(I)V

    .line 747
    .line 748
    .line 749
    invoke-virtual {v1, v3}, Lrx;->d(I)V

    .line 750
    .line 751
    .line 752
    return-void

    .line 753
    :cond_20
    iget-boolean v4, v1, Lfx;->j:Z

    .line 754
    .line 755
    if-nez v4, :cond_22

    .line 756
    .line 757
    iget v4, v0, Loj1;->d:I

    .line 758
    .line 759
    if-ne v4, v2, :cond_22

    .line 760
    .line 761
    iget v2, v0, Loj1;->a:I

    .line 762
    .line 763
    if-ne v2, v6, :cond_22

    .line 764
    .line 765
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 766
    .line 767
    .line 768
    move-result v2

    .line 769
    if-lez v2, :cond_22

    .line 770
    .line 771
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 772
    .line 773
    .line 774
    move-result v2

    .line 775
    if-lez v2, :cond_22

    .line 776
    .line 777
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 778
    .line 779
    .line 780
    move-result-object v2

    .line 781
    check-cast v2, Lfx;

    .line 782
    .line 783
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 784
    .line 785
    .line 786
    move-result-object v4

    .line 787
    check-cast v4, Lfx;

    .line 788
    .line 789
    iget v2, v2, Lfx;->g:I

    .line 790
    .line 791
    iget v6, v7, Lfx;->f:I

    .line 792
    .line 793
    add-int/2addr v2, v6

    .line 794
    iget v4, v4, Lfx;->g:I

    .line 795
    .line 796
    iget v6, v8, Lfx;->f:I

    .line 797
    .line 798
    add-int/2addr v4, v6

    .line 799
    sub-int/2addr v4, v2

    .line 800
    iget v2, v1, Lrx;->m:I

    .line 801
    .line 802
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 803
    .line 804
    .line 805
    move-result v2

    .line 806
    iget-object v4, v0, Loj1;->b:Lpp;

    .line 807
    .line 808
    iget v6, v4, Lpp;->n:I

    .line 809
    .line 810
    iget v4, v4, Lpp;->m:I

    .line 811
    .line 812
    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    .line 813
    .line 814
    .line 815
    move-result v2

    .line 816
    if-lez v6, :cond_21

    .line 817
    .line 818
    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    .line 819
    .line 820
    .line 821
    move-result v2

    .line 822
    :cond_21
    invoke-virtual {v1, v2}, Lrx;->d(I)V

    .line 823
    .line 824
    .line 825
    :cond_22
    iget-boolean v2, v1, Lfx;->j:Z

    .line 826
    .line 827
    if-nez v2, :cond_23

    .line 828
    .line 829
    goto :goto_c

    .line 830
    :cond_23
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 831
    .line 832
    .line 833
    move-result-object v2

    .line 834
    check-cast v2, Lfx;

    .line 835
    .line 836
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 837
    .line 838
    .line 839
    move-result-object v3

    .line 840
    check-cast v3, Lfx;

    .line 841
    .line 842
    iget v4, v2, Lfx;->g:I

    .line 843
    .line 844
    iget v5, v7, Lfx;->f:I

    .line 845
    .line 846
    add-int/2addr v5, v4

    .line 847
    iget v6, v3, Lfx;->g:I

    .line 848
    .line 849
    iget v9, v8, Lfx;->f:I

    .line 850
    .line 851
    add-int/2addr v9, v6

    .line 852
    iget-object v0, v0, Loj1;->b:Lpp;

    .line 853
    .line 854
    iget v0, v0, Lpp;->S:F

    .line 855
    .line 856
    if-ne v2, v3, :cond_24

    .line 857
    .line 858
    move/from16 v0, p1

    .line 859
    .line 860
    goto :goto_b

    .line 861
    :cond_24
    move v4, v5

    .line 862
    move v6, v9

    .line 863
    :goto_b
    sub-int/2addr v6, v4

    .line 864
    iget v2, v1, Lfx;->g:I

    .line 865
    .line 866
    sub-int/2addr v6, v2

    .line 867
    int-to-float v2, v4

    .line 868
    add-float v2, v2, p1

    .line 869
    .line 870
    int-to-float v3, v6

    .line 871
    mul-float/2addr v3, v0

    .line 872
    add-float/2addr v3, v2

    .line 873
    float-to-int v0, v3

    .line 874
    invoke-virtual {v7, v0}, Lfx;->d(I)V

    .line 875
    .line 876
    .line 877
    iget v0, v7, Lfx;->g:I

    .line 878
    .line 879
    iget v1, v1, Lfx;->g:I

    .line 880
    .line 881
    add-int/2addr v0, v1

    .line 882
    invoke-virtual {v8, v0}, Lfx;->d(I)V

    .line 883
    .line 884
    .line 885
    :cond_25
    :goto_c
    return-void

    .line 886
    :cond_26
    iget-object v1, v0, Loj1;->b:Lpp;

    .line 887
    .line 888
    iget-object v2, v1, Lpp;->x:Lbp;

    .line 889
    .line 890
    iget-object v1, v1, Lpp;->z:Lbp;

    .line 891
    .line 892
    invoke-virtual {v0, v2, v1, v3}, Loj1;->l(Lbp;Lbp;I)V

    .line 893
    .line 894
    .line 895
    return-void
.end method

.method public final d()V
    .locals 13

    .line 1
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 2
    .line 3
    iget-boolean v1, v0, Lpp;->a:Z

    .line 4
    .line 5
    iget-object v2, p0, Loj1;->e:Lrx;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lpp;->j()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {v2, v0}, Lrx;->d(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-boolean v0, v2, Lfx;->j:Z

    .line 17
    .line 18
    iget-object v1, v2, Lfx;->k:Ljava/util/ArrayList;

    .line 19
    .line 20
    iget-object v3, v2, Lfx;->l:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    const/4 v5, 0x4

    .line 24
    const/4 v6, 0x1

    .line 25
    const/4 v7, 0x0

    .line 26
    iget-object v8, p0, Loj1;->i:Lfx;

    .line 27
    .line 28
    iget-object v9, p0, Loj1;->h:Lfx;

    .line 29
    .line 30
    if-nez v0, :cond_4

    .line 31
    .line 32
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 33
    .line 34
    iget-object v10, v0, Lpp;->c0:[I

    .line 35
    .line 36
    aget v10, v10, v7

    .line 37
    .line 38
    iput v10, p0, Loj1;->d:I

    .line 39
    .line 40
    if-eq v10, v4, :cond_7

    .line 41
    .line 42
    if-ne v10, v5, :cond_3

    .line 43
    .line 44
    iget-object v11, v0, Lpp;->I:Lqp;

    .line 45
    .line 46
    if-eqz v11, :cond_1

    .line 47
    .line 48
    iget-object v12, v11, Lpp;->c0:[I

    .line 49
    .line 50
    aget v12, v12, v7

    .line 51
    .line 52
    if-eq v12, v6, :cond_2

    .line 53
    .line 54
    :cond_1
    iget-object v12, v11, Lpp;->c0:[I

    .line 55
    .line 56
    aget v12, v12, v7

    .line 57
    .line 58
    if-ne v12, v5, :cond_3

    .line 59
    .line 60
    :cond_2
    invoke-virtual {v11}, Lpp;->j()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, v11, Lpp;->d:Lbc0;

    .line 65
    .line 66
    iget-object v3, p0, Loj1;->b:Lpp;

    .line 67
    .line 68
    iget-object v3, v3, Lpp;->x:Lbp;

    .line 69
    .line 70
    invoke-virtual {v3}, Lbp;->b()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    sub-int/2addr v0, v3

    .line 75
    iget-object v3, p0, Loj1;->b:Lpp;

    .line 76
    .line 77
    iget-object v3, v3, Lpp;->z:Lbp;

    .line 78
    .line 79
    invoke-virtual {v3}, Lbp;->b()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    sub-int/2addr v0, v3

    .line 84
    iget-object v3, v1, Loj1;->h:Lfx;

    .line 85
    .line 86
    iget-object v4, p0, Loj1;->b:Lpp;

    .line 87
    .line 88
    iget-object v4, v4, Lpp;->x:Lbp;

    .line 89
    .line 90
    invoke-virtual {v4}, Lbp;->b()I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    invoke-static {v9, v3, v4}, Loj1;->b(Lfx;Lfx;I)V

    .line 95
    .line 96
    .line 97
    iget-object v1, v1, Loj1;->i:Lfx;

    .line 98
    .line 99
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 100
    .line 101
    iget-object p0, p0, Lpp;->z:Lbp;

    .line 102
    .line 103
    invoke-virtual {p0}, Lbp;->b()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    neg-int p0, p0

    .line 108
    invoke-static {v8, v1, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v0}, Lrx;->d(I)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    if-ne v10, v6, :cond_7

    .line 116
    .line 117
    invoke-virtual {v0}, Lpp;->j()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-virtual {v2, v0}, Lrx;->d(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    iget v0, p0, Loj1;->d:I

    .line 126
    .line 127
    if-ne v0, v5, :cond_7

    .line 128
    .line 129
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 130
    .line 131
    iget-object v10, v0, Lpp;->I:Lqp;

    .line 132
    .line 133
    if-eqz v10, :cond_5

    .line 134
    .line 135
    iget-object v11, v10, Lpp;->c0:[I

    .line 136
    .line 137
    aget v11, v11, v7

    .line 138
    .line 139
    if-eq v11, v6, :cond_6

    .line 140
    .line 141
    :cond_5
    iget-object v11, v10, Lpp;->c0:[I

    .line 142
    .line 143
    aget v11, v11, v7

    .line 144
    .line 145
    if-ne v11, v5, :cond_7

    .line 146
    .line 147
    :cond_6
    iget-object v1, v10, Lpp;->d:Lbc0;

    .line 148
    .line 149
    iget-object v1, v1, Loj1;->h:Lfx;

    .line 150
    .line 151
    iget-object v0, v0, Lpp;->x:Lbp;

    .line 152
    .line 153
    invoke-virtual {v0}, Lbp;->b()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-static {v9, v1, v0}, Loj1;->b(Lfx;Lfx;I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, v10, Lpp;->d:Lbc0;

    .line 161
    .line 162
    iget-object v0, v0, Loj1;->i:Lfx;

    .line 163
    .line 164
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 165
    .line 166
    iget-object p0, p0, Lpp;->z:Lbp;

    .line 167
    .line 168
    invoke-virtual {p0}, Lbp;->b()I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    neg-int p0, p0

    .line 173
    invoke-static {v8, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_7
    :goto_0
    iget-boolean v0, v2, Lfx;->j:Z

    .line 178
    .line 179
    if-eqz v0, :cond_e

    .line 180
    .line 181
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 182
    .line 183
    iget-boolean v10, v0, Lpp;->a:Z

    .line 184
    .line 185
    if-eqz v10, :cond_e

    .line 186
    .line 187
    iget-object v1, v0, Lpp;->F:[Lbp;

    .line 188
    .line 189
    aget-object v3, v1, v7

    .line 190
    .line 191
    iget-object v4, v3, Lbp;->d:Lbp;

    .line 192
    .line 193
    if-eqz v4, :cond_b

    .line 194
    .line 195
    aget-object v5, v1, v6

    .line 196
    .line 197
    iget-object v5, v5, Lbp;->d:Lbp;

    .line 198
    .line 199
    if-eqz v5, :cond_b

    .line 200
    .line 201
    invoke-virtual {v0}, Lpp;->o()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 206
    .line 207
    if-eqz v0, :cond_8

    .line 208
    .line 209
    iget-object v0, v1, Lpp;->F:[Lbp;

    .line 210
    .line 211
    aget-object v0, v0, v7

    .line 212
    .line 213
    invoke-virtual {v0}, Lbp;->b()I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    iput v0, v9, Lfx;->f:I

    .line 218
    .line 219
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 220
    .line 221
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 222
    .line 223
    aget-object p0, p0, v6

    .line 224
    .line 225
    invoke-virtual {p0}, Lbp;->b()I

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    neg-int p0, p0

    .line 230
    iput p0, v8, Lfx;->f:I

    .line 231
    .line 232
    return-void

    .line 233
    :cond_8
    iget-object v0, v1, Lpp;->F:[Lbp;

    .line 234
    .line 235
    aget-object v0, v0, v7

    .line 236
    .line 237
    invoke-static {v0}, Loj1;->h(Lbp;)Lfx;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    if-eqz v0, :cond_9

    .line 242
    .line 243
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 244
    .line 245
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 246
    .line 247
    aget-object v1, v1, v7

    .line 248
    .line 249
    invoke-virtual {v1}, Lbp;->b()I

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    invoke-static {v9, v0, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 254
    .line 255
    .line 256
    :cond_9
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 257
    .line 258
    iget-object v0, v0, Lpp;->F:[Lbp;

    .line 259
    .line 260
    aget-object v0, v0, v6

    .line 261
    .line 262
    invoke-static {v0}, Loj1;->h(Lbp;)Lfx;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    if-eqz v0, :cond_a

    .line 267
    .line 268
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 269
    .line 270
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 271
    .line 272
    aget-object p0, p0, v6

    .line 273
    .line 274
    invoke-virtual {p0}, Lbp;->b()I

    .line 275
    .line 276
    .line 277
    move-result p0

    .line 278
    neg-int p0, p0

    .line 279
    invoke-static {v8, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 280
    .line 281
    .line 282
    :cond_a
    iput-boolean v6, v9, Lfx;->b:Z

    .line 283
    .line 284
    iput-boolean v6, v8, Lfx;->b:Z

    .line 285
    .line 286
    return-void

    .line 287
    :cond_b
    if-eqz v4, :cond_c

    .line 288
    .line 289
    invoke-static {v3}, Loj1;->h(Lbp;)Lfx;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    if-eqz v0, :cond_1a

    .line 294
    .line 295
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 296
    .line 297
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 298
    .line 299
    aget-object p0, p0, v7

    .line 300
    .line 301
    invoke-virtual {p0}, Lbp;->b()I

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    invoke-static {v9, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 306
    .line 307
    .line 308
    iget p0, v2, Lfx;->g:I

    .line 309
    .line 310
    invoke-static {v8, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 311
    .line 312
    .line 313
    return-void

    .line 314
    :cond_c
    aget-object v1, v1, v6

    .line 315
    .line 316
    iget-object v3, v1, Lbp;->d:Lbp;

    .line 317
    .line 318
    if-eqz v3, :cond_d

    .line 319
    .line 320
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    if-eqz v0, :cond_1a

    .line 325
    .line 326
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 327
    .line 328
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 329
    .line 330
    aget-object p0, p0, v6

    .line 331
    .line 332
    invoke-virtual {p0}, Lbp;->b()I

    .line 333
    .line 334
    .line 335
    move-result p0

    .line 336
    neg-int p0, p0

    .line 337
    invoke-static {v8, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 338
    .line 339
    .line 340
    iget p0, v2, Lfx;->g:I

    .line 341
    .line 342
    neg-int p0, p0

    .line 343
    invoke-static {v9, v8, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :cond_d
    instance-of v1, v0, Lbg;

    .line 348
    .line 349
    if-nez v1, :cond_1a

    .line 350
    .line 351
    iget-object v1, v0, Lpp;->I:Lqp;

    .line 352
    .line 353
    if-eqz v1, :cond_1a

    .line 354
    .line 355
    const/4 v1, 0x7

    .line 356
    invoke-virtual {v0, v1}, Lpp;->e(I)Lbp;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iget-object v0, v0, Lbp;->d:Lbp;

    .line 361
    .line 362
    if-nez v0, :cond_1a

    .line 363
    .line 364
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 365
    .line 366
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 367
    .line 368
    iget-object v0, v0, Lpp;->d:Lbc0;

    .line 369
    .line 370
    iget-object v0, v0, Loj1;->h:Lfx;

    .line 371
    .line 372
    invoke-virtual {p0}, Lpp;->k()I

    .line 373
    .line 374
    .line 375
    move-result p0

    .line 376
    invoke-static {v9, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 377
    .line 378
    .line 379
    iget p0, v2, Lfx;->g:I

    .line 380
    .line 381
    invoke-static {v8, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 382
    .line 383
    .line 384
    return-void

    .line 385
    :cond_e
    iget v0, p0, Loj1;->d:I

    .line 386
    .line 387
    if-ne v0, v4, :cond_15

    .line 388
    .line 389
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 390
    .line 391
    iget v10, v0, Lpp;->j:I

    .line 392
    .line 393
    iget-object v11, v0, Lpp;->e:Lgh1;

    .line 394
    .line 395
    const/4 v12, 0x2

    .line 396
    if-eq v10, v12, :cond_13

    .line 397
    .line 398
    if-eq v10, v4, :cond_f

    .line 399
    .line 400
    goto/16 :goto_1

    .line 401
    .line 402
    :cond_f
    iget v10, v0, Lpp;->k:I

    .line 403
    .line 404
    if-ne v10, v4, :cond_12

    .line 405
    .line 406
    iput-object p0, v9, Lfx;->a:Loj1;

    .line 407
    .line 408
    iput-object p0, v8, Lfx;->a:Loj1;

    .line 409
    .line 410
    iget-object v4, v11, Loj1;->h:Lfx;

    .line 411
    .line 412
    iput-object p0, v4, Lfx;->a:Loj1;

    .line 413
    .line 414
    iget-object v4, v11, Loj1;->i:Lfx;

    .line 415
    .line 416
    iput-object p0, v4, Lfx;->a:Loj1;

    .line 417
    .line 418
    iput-object p0, v2, Lfx;->a:Loj1;

    .line 419
    .line 420
    invoke-virtual {v0}, Lpp;->p()Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    if-eqz v0, :cond_10

    .line 425
    .line 426
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 427
    .line 428
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 429
    .line 430
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 431
    .line 432
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 436
    .line 437
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 438
    .line 439
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 440
    .line 441
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 442
    .line 443
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 447
    .line 448
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 449
    .line 450
    iget-object v1, v0, Loj1;->e:Lrx;

    .line 451
    .line 452
    iput-object p0, v1, Lfx;->a:Loj1;

    .line 453
    .line 454
    iget-object v0, v0, Loj1;->h:Lfx;

    .line 455
    .line 456
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 460
    .line 461
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 462
    .line 463
    iget-object v0, v0, Loj1;->i:Lfx;

    .line 464
    .line 465
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 469
    .line 470
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 471
    .line 472
    iget-object v0, v0, Loj1;->h:Lfx;

    .line 473
    .line 474
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 475
    .line 476
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 480
    .line 481
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 482
    .line 483
    iget-object v0, v0, Loj1;->i:Lfx;

    .line 484
    .line 485
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 486
    .line 487
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    goto/16 :goto_1

    .line 491
    .line 492
    :cond_10
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 493
    .line 494
    invoke-virtual {v0}, Lpp;->o()Z

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    iget-object v3, p0, Loj1;->b:Lpp;

    .line 499
    .line 500
    if-eqz v0, :cond_11

    .line 501
    .line 502
    iget-object v0, v3, Lpp;->e:Lgh1;

    .line 503
    .line 504
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 505
    .line 506
    iget-object v0, v0, Lfx;->l:Ljava/util/ArrayList;

    .line 507
    .line 508
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 512
    .line 513
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 514
    .line 515
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 516
    .line 517
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    goto :goto_1

    .line 521
    :cond_11
    iget-object v0, v3, Lpp;->e:Lgh1;

    .line 522
    .line 523
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 524
    .line 525
    iget-object v0, v0, Lfx;->l:Ljava/util/ArrayList;

    .line 526
    .line 527
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    goto :goto_1

    .line 531
    :cond_12
    iget-object v0, v11, Loj1;->e:Lrx;

    .line 532
    .line 533
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 537
    .line 538
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 542
    .line 543
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 544
    .line 545
    iget-object v0, v0, Loj1;->h:Lfx;

    .line 546
    .line 547
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 548
    .line 549
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 553
    .line 554
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 555
    .line 556
    iget-object v0, v0, Loj1;->i:Lfx;

    .line 557
    .line 558
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 559
    .line 560
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 561
    .line 562
    .line 563
    iput-boolean v6, v2, Lfx;->b:Z

    .line 564
    .line 565
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 566
    .line 567
    .line 568
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 569
    .line 570
    .line 571
    iget-object v0, v9, Lfx;->l:Ljava/util/ArrayList;

    .line 572
    .line 573
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 574
    .line 575
    .line 576
    iget-object v0, v8, Lfx;->l:Ljava/util/ArrayList;

    .line 577
    .line 578
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 579
    .line 580
    .line 581
    goto :goto_1

    .line 582
    :cond_13
    iget-object v0, v0, Lpp;->I:Lqp;

    .line 583
    .line 584
    if-nez v0, :cond_14

    .line 585
    .line 586
    goto :goto_1

    .line 587
    :cond_14
    iget-object v0, v0, Lpp;->e:Lgh1;

    .line 588
    .line 589
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 590
    .line 591
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 592
    .line 593
    .line 594
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 595
    .line 596
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 597
    .line 598
    .line 599
    iput-boolean v6, v2, Lfx;->b:Z

    .line 600
    .line 601
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    .line 603
    .line 604
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 605
    .line 606
    .line 607
    :cond_15
    :goto_1
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 608
    .line 609
    iget-object v1, v0, Lpp;->F:[Lbp;

    .line 610
    .line 611
    aget-object v3, v1, v7

    .line 612
    .line 613
    iget-object v4, v3, Lbp;->d:Lbp;

    .line 614
    .line 615
    if-eqz v4, :cond_17

    .line 616
    .line 617
    aget-object v10, v1, v6

    .line 618
    .line 619
    iget-object v10, v10, Lbp;->d:Lbp;

    .line 620
    .line 621
    if-eqz v10, :cond_17

    .line 622
    .line 623
    invoke-virtual {v0}, Lpp;->o()Z

    .line 624
    .line 625
    .line 626
    move-result v0

    .line 627
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 628
    .line 629
    if-eqz v0, :cond_16

    .line 630
    .line 631
    iget-object v0, v1, Lpp;->F:[Lbp;

    .line 632
    .line 633
    aget-object v0, v0, v7

    .line 634
    .line 635
    invoke-virtual {v0}, Lbp;->b()I

    .line 636
    .line 637
    .line 638
    move-result v0

    .line 639
    iput v0, v9, Lfx;->f:I

    .line 640
    .line 641
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 642
    .line 643
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 644
    .line 645
    aget-object p0, p0, v6

    .line 646
    .line 647
    invoke-virtual {p0}, Lbp;->b()I

    .line 648
    .line 649
    .line 650
    move-result p0

    .line 651
    neg-int p0, p0

    .line 652
    iput p0, v8, Lfx;->f:I

    .line 653
    .line 654
    return-void

    .line 655
    :cond_16
    iget-object v0, v1, Lpp;->F:[Lbp;

    .line 656
    .line 657
    aget-object v0, v0, v7

    .line 658
    .line 659
    invoke-static {v0}, Loj1;->h(Lbp;)Lfx;

    .line 660
    .line 661
    .line 662
    move-result-object v0

    .line 663
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 664
    .line 665
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 666
    .line 667
    aget-object v1, v1, v6

    .line 668
    .line 669
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 670
    .line 671
    .line 672
    move-result-object v1

    .line 673
    invoke-virtual {v0, p0}, Lfx;->b(Loj1;)V

    .line 674
    .line 675
    .line 676
    invoke-virtual {v1, p0}, Lfx;->b(Loj1;)V

    .line 677
    .line 678
    .line 679
    iput v5, p0, Loj1;->j:I

    .line 680
    .line 681
    return-void

    .line 682
    :cond_17
    if-eqz v4, :cond_18

    .line 683
    .line 684
    invoke-static {v3}, Loj1;->h(Lbp;)Lfx;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    if-eqz v0, :cond_1a

    .line 689
    .line 690
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 691
    .line 692
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 693
    .line 694
    aget-object v1, v1, v7

    .line 695
    .line 696
    invoke-virtual {v1}, Lbp;->b()I

    .line 697
    .line 698
    .line 699
    move-result v1

    .line 700
    invoke-static {v9, v0, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 701
    .line 702
    .line 703
    invoke-virtual {p0, v8, v9, v6, v2}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 704
    .line 705
    .line 706
    return-void

    .line 707
    :cond_18
    aget-object v1, v1, v6

    .line 708
    .line 709
    iget-object v3, v1, Lbp;->d:Lbp;

    .line 710
    .line 711
    if-eqz v3, :cond_19

    .line 712
    .line 713
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 714
    .line 715
    .line 716
    move-result-object v0

    .line 717
    if-eqz v0, :cond_1a

    .line 718
    .line 719
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 720
    .line 721
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 722
    .line 723
    aget-object v1, v1, v6

    .line 724
    .line 725
    invoke-virtual {v1}, Lbp;->b()I

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    neg-int v1, v1

    .line 730
    invoke-static {v8, v0, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 731
    .line 732
    .line 733
    const/4 v0, -0x1

    .line 734
    invoke-virtual {p0, v9, v8, v0, v2}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 735
    .line 736
    .line 737
    return-void

    .line 738
    :cond_19
    instance-of v1, v0, Lbg;

    .line 739
    .line 740
    if-nez v1, :cond_1a

    .line 741
    .line 742
    iget-object v1, v0, Lpp;->I:Lqp;

    .line 743
    .line 744
    if-eqz v1, :cond_1a

    .line 745
    .line 746
    iget-object v1, v1, Lpp;->d:Lbc0;

    .line 747
    .line 748
    iget-object v1, v1, Loj1;->h:Lfx;

    .line 749
    .line 750
    invoke-virtual {v0}, Lpp;->k()I

    .line 751
    .line 752
    .line 753
    move-result v0

    .line 754
    invoke-static {v9, v1, v0}, Loj1;->b(Lfx;Lfx;I)V

    .line 755
    .line 756
    .line 757
    invoke-virtual {p0, v8, v9, v6, v2}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 758
    .line 759
    .line 760
    :cond_1a
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Loj1;->h:Lfx;

    .line 2
    .line 3
    iget-boolean v1, v0, Lfx;->j:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 8
    .line 9
    iget v0, v0, Lfx;->g:I

    .line 10
    .line 11
    iput v0, p0, Lpp;->N:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Loj1;->c:Lb21;

    .line 3
    .line 4
    iget-object v0, p0, Loj1;->h:Lfx;

    .line 5
    .line 6
    invoke-virtual {v0}, Lfx;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Loj1;->i:Lfx;

    .line 10
    .line 11
    invoke-virtual {v0}, Lfx;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Loj1;->e:Lrx;

    .line 15
    .line 16
    invoke-virtual {v0}, Lfx;->c()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Loj1;->g:Z

    .line 21
    .line 22
    return-void
.end method

.method public final k()Z
    .locals 2

    .line 1
    iget v0, p0, Loj1;->d:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 7
    .line 8
    iget p0, p0, Lpp;->j:I

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public final n()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Loj1;->g:Z

    .line 3
    .line 4
    iget-object v1, p0, Loj1;->h:Lfx;

    .line 5
    .line 6
    invoke-virtual {v1}, Lfx;->c()V

    .line 7
    .line 8
    .line 9
    iput-boolean v0, v1, Lfx;->j:Z

    .line 10
    .line 11
    iget-object v1, p0, Loj1;->i:Lfx;

    .line 12
    .line 13
    invoke-virtual {v1}, Lfx;->c()V

    .line 14
    .line 15
    .line 16
    iput-boolean v0, v1, Lfx;->j:Z

    .line 17
    .line 18
    iget-object p0, p0, Loj1;->e:Lrx;

    .line 19
    .line 20
    iput-boolean v0, p0, Lfx;->j:Z

    .line 21
    .line 22
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "HorizontalRun "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 9
    .line 10
    iget-object p0, p0, Lpp;->W:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
