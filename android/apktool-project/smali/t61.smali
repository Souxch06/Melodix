.class public final Lt61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:[Lb71;

.field public final b:[Landroid/graphics/Matrix;

.field public final c:[Landroid/graphics/Matrix;

.field public final d:Landroid/graphics/PointF;

.field public final e:Landroid/graphics/Path;

.field public final f:Landroid/graphics/Path;

.field public final g:Lb71;

.field public final h:[F

.field public final i:[F

.field public final j:Landroid/graphics/Path;

.field public final k:Landroid/graphics/Path;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v1, v0, [Lb71;

    .line 6
    .line 7
    iput-object v1, p0, Lt61;->a:[Lb71;

    .line 8
    .line 9
    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 10
    .line 11
    iput-object v1, p0, Lt61;->b:[Landroid/graphics/Matrix;

    .line 12
    .line 13
    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 14
    .line 15
    iput-object v1, p0, Lt61;->c:[Landroid/graphics/Matrix;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lt61;->d:Landroid/graphics/PointF;

    .line 23
    .line 24
    new-instance v1, Landroid/graphics/Path;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lt61;->e:Landroid/graphics/Path;

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/Path;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lt61;->f:Landroid/graphics/Path;

    .line 37
    .line 38
    new-instance v1, Lb71;

    .line 39
    .line 40
    invoke-direct {v1}, Lb71;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lt61;->g:Lb71;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    new-array v2, v1, [F

    .line 47
    .line 48
    iput-object v2, p0, Lt61;->h:[F

    .line 49
    .line 50
    new-array v1, v1, [F

    .line 51
    .line 52
    iput-object v1, p0, Lt61;->i:[F

    .line 53
    .line 54
    new-instance v1, Landroid/graphics/Path;

    .line 55
    .line 56
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lt61;->j:Landroid/graphics/Path;

    .line 60
    .line 61
    new-instance v1, Landroid/graphics/Path;

    .line 62
    .line 63
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lt61;->k:Landroid/graphics/Path;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    :goto_0
    if-ge v1, v0, :cond_0

    .line 70
    .line 71
    iget-object v2, p0, Lt61;->a:[Lb71;

    .line 72
    .line 73
    new-instance v3, Lb71;

    .line 74
    .line 75
    invoke-direct {v3}, Lb71;-><init>()V

    .line 76
    .line 77
    .line 78
    aput-object v3, v2, v1

    .line 79
    .line 80
    iget-object v2, p0, Lt61;->b:[Landroid/graphics/Matrix;

    .line 81
    .line 82
    new-instance v3, Landroid/graphics/Matrix;

    .line 83
    .line 84
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 85
    .line 86
    .line 87
    aput-object v3, v2, v1

    .line 88
    .line 89
    iget-object v2, p0, Lt61;->c:[Landroid/graphics/Matrix;

    .line 90
    .line 91
    new-instance v3, Landroid/graphics/Matrix;

    .line 92
    .line 93
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 94
    .line 95
    .line 96
    aput-object v3, v2, v1

    .line 97
    .line 98
    add-int/lit8 v1, v1, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Lr61;FLandroid/graphics/RectF;Lpa0;Landroid/graphics/Path;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    invoke-virtual {v4}, Landroid/graphics/Path;->rewind()V

    .line 12
    .line 13
    .line 14
    iget-object v5, v0, Lt61;->e:Landroid/graphics/Path;

    .line 15
    .line 16
    invoke-virtual {v5}, Landroid/graphics/Path;->rewind()V

    .line 17
    .line 18
    .line 19
    iget-object v6, v0, Lt61;->f:Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-virtual {v6}, Landroid/graphics/Path;->rewind()V

    .line 22
    .line 23
    .line 24
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 25
    .line 26
    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 27
    .line 28
    .line 29
    const/4 v8, 0x0

    .line 30
    :goto_0
    iget-object v9, v0, Lt61;->c:[Landroid/graphics/Matrix;

    .line 31
    .line 32
    const/4 v10, 0x2

    .line 33
    const/4 v11, 0x3

    .line 34
    iget-object v12, v0, Lt61;->h:[F

    .line 35
    .line 36
    const/4 v13, 0x4

    .line 37
    iget-object v14, v0, Lt61;->a:[Lb71;

    .line 38
    .line 39
    iget-object v15, v0, Lt61;->b:[Landroid/graphics/Matrix;

    .line 40
    .line 41
    const/16 v16, 0x0

    .line 42
    .line 43
    const/4 v7, 0x1

    .line 44
    if-ge v8, v13, :cond_9

    .line 45
    .line 46
    if-eq v8, v7, :cond_2

    .line 47
    .line 48
    if-eq v8, v10, :cond_1

    .line 49
    .line 50
    if-eq v8, v11, :cond_0

    .line 51
    .line 52
    iget-object v13, v1, Lr61;->f:Lnq;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    iget-object v13, v1, Lr61;->e:Lnq;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iget-object v13, v1, Lr61;->h:Lnq;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v13, v1, Lr61;->g:Lnq;

    .line 62
    .line 63
    :goto_1
    if-eq v8, v7, :cond_5

    .line 64
    .line 65
    if-eq v8, v10, :cond_4

    .line 66
    .line 67
    if-eq v8, v11, :cond_3

    .line 68
    .line 69
    iget-object v11, v1, Lr61;->b:Lst;

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    iget-object v11, v1, Lr61;->a:Lst;

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_4
    iget-object v11, v1, Lr61;->d:Lst;

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_5
    iget-object v11, v1, Lr61;->c:Lst;

    .line 79
    .line 80
    :goto_2
    aget-object v10, v14, v8

    .line 81
    .line 82
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    invoke-interface {v13, v2}, Lnq;->a(Landroid/graphics/RectF;)F

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    move/from16 v7, p2

    .line 90
    .line 91
    invoke-virtual {v11, v10, v7, v13}, Lst;->d(Lb71;FF)V

    .line 92
    .line 93
    .line 94
    add-int/lit8 v10, v8, 0x1

    .line 95
    .line 96
    rem-int/lit8 v11, v10, 0x4

    .line 97
    .line 98
    mul-int/lit8 v11, v11, 0x5a

    .line 99
    .line 100
    int-to-float v11, v11

    .line 101
    aget-object v13, v15, v8

    .line 102
    .line 103
    invoke-virtual {v13}, Landroid/graphics/Matrix;->reset()V

    .line 104
    .line 105
    .line 106
    iget-object v13, v0, Lt61;->d:Landroid/graphics/PointF;

    .line 107
    .line 108
    const/4 v7, 0x1

    .line 109
    if-eq v8, v7, :cond_8

    .line 110
    .line 111
    const/4 v7, 0x2

    .line 112
    if-eq v8, v7, :cond_7

    .line 113
    .line 114
    const/4 v7, 0x3

    .line 115
    if-eq v8, v7, :cond_6

    .line 116
    .line 117
    iget v7, v2, Landroid/graphics/RectF;->right:F

    .line 118
    .line 119
    move/from16 v17, v8

    .line 120
    .line 121
    iget v8, v2, Landroid/graphics/RectF;->top:F

    .line 122
    .line 123
    invoke-virtual {v13, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_6
    move/from16 v17, v8

    .line 128
    .line 129
    iget v7, v2, Landroid/graphics/RectF;->left:F

    .line 130
    .line 131
    iget v8, v2, Landroid/graphics/RectF;->top:F

    .line 132
    .line 133
    invoke-virtual {v13, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_7
    move/from16 v17, v8

    .line 138
    .line 139
    iget v7, v2, Landroid/graphics/RectF;->left:F

    .line 140
    .line 141
    iget v8, v2, Landroid/graphics/RectF;->bottom:F

    .line 142
    .line 143
    invoke-virtual {v13, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_8
    move/from16 v17, v8

    .line 148
    .line 149
    iget v7, v2, Landroid/graphics/RectF;->right:F

    .line 150
    .line 151
    iget v8, v2, Landroid/graphics/RectF;->bottom:F

    .line 152
    .line 153
    invoke-virtual {v13, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 154
    .line 155
    .line 156
    :goto_3
    aget-object v7, v15, v17

    .line 157
    .line 158
    iget v8, v13, Landroid/graphics/PointF;->x:F

    .line 159
    .line 160
    iget v13, v13, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    invoke-virtual {v7, v8, v13}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 163
    .line 164
    .line 165
    aget-object v7, v15, v17

    .line 166
    .line 167
    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 168
    .line 169
    .line 170
    aget-object v7, v14, v17

    .line 171
    .line 172
    iget v8, v7, Lb71;->b:F

    .line 173
    .line 174
    aput v8, v12, v16

    .line 175
    .line 176
    iget v7, v7, Lb71;->c:F

    .line 177
    .line 178
    const/16 v18, 0x1

    .line 179
    .line 180
    aput v7, v12, v18

    .line 181
    .line 182
    aget-object v7, v15, v17

    .line 183
    .line 184
    invoke-virtual {v7, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 185
    .line 186
    .line 187
    aget-object v7, v9, v17

    .line 188
    .line 189
    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 190
    .line 191
    .line 192
    aget-object v7, v9, v17

    .line 193
    .line 194
    aget v8, v12, v16

    .line 195
    .line 196
    aget v12, v12, v18

    .line 197
    .line 198
    invoke-virtual {v7, v8, v12}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 199
    .line 200
    .line 201
    aget-object v7, v9, v17

    .line 202
    .line 203
    invoke-virtual {v7, v11}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 204
    .line 205
    .line 206
    move v8, v10

    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_9
    move/from16 v7, v16

    .line 210
    .line 211
    :goto_4
    if-ge v7, v13, :cond_13

    .line 212
    .line 213
    aget-object v8, v14, v7

    .line 214
    .line 215
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    .line 217
    .line 218
    const/4 v10, 0x0

    .line 219
    aput v10, v12, v16

    .line 220
    .line 221
    iget v8, v8, Lb71;->a:F

    .line 222
    .line 223
    const/16 v18, 0x1

    .line 224
    .line 225
    aput v8, v12, v18

    .line 226
    .line 227
    aget-object v8, v15, v7

    .line 228
    .line 229
    invoke-virtual {v8, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 230
    .line 231
    .line 232
    if-nez v7, :cond_a

    .line 233
    .line 234
    aget v8, v12, v16

    .line 235
    .line 236
    aget v11, v12, v18

    .line 237
    .line 238
    invoke-virtual {v4, v8, v11}, Landroid/graphics/Path;->moveTo(FF)V

    .line 239
    .line 240
    .line 241
    goto :goto_5

    .line 242
    :cond_a
    aget v8, v12, v16

    .line 243
    .line 244
    aget v11, v12, v18

    .line 245
    .line 246
    invoke-virtual {v4, v8, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 247
    .line 248
    .line 249
    :goto_5
    aget-object v8, v14, v7

    .line 250
    .line 251
    aget-object v11, v15, v7

    .line 252
    .line 253
    invoke-virtual {v8, v11, v4}, Lb71;->b(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 254
    .line 255
    .line 256
    if-eqz v3, :cond_b

    .line 257
    .line 258
    aget-object v8, v14, v7

    .line 259
    .line 260
    aget-object v11, v15, v7

    .line 261
    .line 262
    iget-object v13, v3, Lpa0;->k:Ljava/lang/Object;

    .line 263
    .line 264
    check-cast v13, Lfm0;

    .line 265
    .line 266
    move/from16 p2, v10

    .line 267
    .line 268
    iget-object v10, v13, Lfm0;->m:Ljava/util/BitSet;

    .line 269
    .line 270
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 271
    .line 272
    .line 273
    move/from16 v2, v16

    .line 274
    .line 275
    invoke-virtual {v10, v7, v2}, Ljava/util/BitSet;->set(IZ)V

    .line 276
    .line 277
    .line 278
    iget-object v2, v13, Lfm0;->k:[La71;

    .line 279
    .line 280
    iget v10, v8, Lb71;->e:F

    .line 281
    .line 282
    invoke-virtual {v8, v10}, Lb71;->a(F)V

    .line 283
    .line 284
    .line 285
    new-instance v10, Landroid/graphics/Matrix;

    .line 286
    .line 287
    invoke-direct {v10, v11}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 288
    .line 289
    .line 290
    new-instance v11, Ljava/util/ArrayList;

    .line 291
    .line 292
    iget-object v8, v8, Lb71;->g:Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {v11, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 295
    .line 296
    .line 297
    new-instance v8, Lu61;

    .line 298
    .line 299
    invoke-direct {v8, v11, v10}, Lu61;-><init>(Ljava/util/ArrayList;Landroid/graphics/Matrix;)V

    .line 300
    .line 301
    .line 302
    aput-object v8, v2, v7

    .line 303
    .line 304
    goto :goto_6

    .line 305
    :cond_b
    move/from16 p2, v10

    .line 306
    .line 307
    :goto_6
    add-int/lit8 v2, v7, 0x1

    .line 308
    .line 309
    rem-int/lit8 v8, v2, 0x4

    .line 310
    .line 311
    aget-object v10, v14, v7

    .line 312
    .line 313
    iget v11, v10, Lb71;->b:F

    .line 314
    .line 315
    const/16 v16, 0x0

    .line 316
    .line 317
    aput v11, v12, v16

    .line 318
    .line 319
    iget v10, v10, Lb71;->c:F

    .line 320
    .line 321
    const/16 v18, 0x1

    .line 322
    .line 323
    aput v10, v12, v18

    .line 324
    .line 325
    aget-object v10, v15, v7

    .line 326
    .line 327
    invoke-virtual {v10, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 328
    .line 329
    .line 330
    aget-object v10, v14, v8

    .line 331
    .line 332
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 333
    .line 334
    .line 335
    iget-object v11, v0, Lt61;->i:[F

    .line 336
    .line 337
    aput p2, v11, v16

    .line 338
    .line 339
    iget v10, v10, Lb71;->a:F

    .line 340
    .line 341
    aput v10, v11, v18

    .line 342
    .line 343
    aget-object v10, v15, v8

    .line 344
    .line 345
    invoke-virtual {v10, v11}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 346
    .line 347
    .line 348
    aget v10, v12, v16

    .line 349
    .line 350
    aget v13, v11, v16

    .line 351
    .line 352
    sub-float/2addr v10, v13

    .line 353
    move-object v13, v9

    .line 354
    float-to-double v9, v10

    .line 355
    aget v19, v12, v18

    .line 356
    .line 357
    aget v11, v11, v18

    .line 358
    .line 359
    sub-float v11, v19, v11

    .line 360
    .line 361
    move-object/from16 v20, v13

    .line 362
    .line 363
    move-object/from16 v19, v14

    .line 364
    .line 365
    float-to-double v13, v11

    .line 366
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    .line 367
    .line 368
    .line 369
    move-result-wide v9

    .line 370
    double-to-float v9, v9

    .line 371
    const v10, 0x3a83126f    # 0.001f

    .line 372
    .line 373
    .line 374
    sub-float/2addr v9, v10

    .line 375
    move/from16 v10, p2

    .line 376
    .line 377
    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    .line 378
    .line 379
    .line 380
    move-result v9

    .line 381
    aget-object v10, v19, v7

    .line 382
    .line 383
    iget v11, v10, Lb71;->b:F

    .line 384
    .line 385
    const/16 v16, 0x0

    .line 386
    .line 387
    aput v11, v12, v16

    .line 388
    .line 389
    iget v10, v10, Lb71;->c:F

    .line 390
    .line 391
    const/4 v11, 0x1

    .line 392
    aput v10, v12, v11

    .line 393
    .line 394
    aget-object v10, v15, v7

    .line 395
    .line 396
    invoke-virtual {v10, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 397
    .line 398
    .line 399
    if-eq v7, v11, :cond_c

    .line 400
    .line 401
    const/4 v10, 0x3

    .line 402
    if-eq v7, v10, :cond_c

    .line 403
    .line 404
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerY()F

    .line 405
    .line 406
    .line 407
    move-result v10

    .line 408
    aget v13, v12, v11

    .line 409
    .line 410
    sub-float/2addr v10, v13

    .line 411
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    .line 412
    .line 413
    .line 414
    goto :goto_7

    .line 415
    :cond_c
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->centerX()F

    .line 416
    .line 417
    .line 418
    move-result v10

    .line 419
    const/16 v16, 0x0

    .line 420
    .line 421
    aget v11, v12, v16

    .line 422
    .line 423
    sub-float/2addr v10, v11

    .line 424
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    .line 425
    .line 426
    .line 427
    :goto_7
    const/high16 v10, 0x43870000    # 270.0f

    .line 428
    .line 429
    iget-object v11, v0, Lt61;->g:Lb71;

    .line 430
    .line 431
    const/4 v13, 0x0

    .line 432
    invoke-virtual {v11, v13, v10, v13}, Lb71;->d(FFF)V

    .line 433
    .line 434
    .line 435
    const/4 v10, 0x1

    .line 436
    if-eq v7, v10, :cond_f

    .line 437
    .line 438
    const/4 v10, 0x2

    .line 439
    if-eq v7, v10, :cond_e

    .line 440
    .line 441
    const/4 v13, 0x3

    .line 442
    if-eq v7, v13, :cond_d

    .line 443
    .line 444
    iget-object v14, v1, Lr61;->j:Lmz;

    .line 445
    .line 446
    goto :goto_8

    .line 447
    :cond_d
    iget-object v14, v1, Lr61;->i:Lmz;

    .line 448
    .line 449
    goto :goto_8

    .line 450
    :cond_e
    const/4 v13, 0x3

    .line 451
    iget-object v14, v1, Lr61;->l:Lmz;

    .line 452
    .line 453
    goto :goto_8

    .line 454
    :cond_f
    const/4 v10, 0x2

    .line 455
    const/4 v13, 0x3

    .line 456
    iget-object v14, v1, Lr61;->k:Lmz;

    .line 457
    .line 458
    :goto_8
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 459
    .line 460
    .line 461
    const/4 v14, 0x0

    .line 462
    invoke-virtual {v11, v9, v14}, Lb71;->c(FF)V

    .line 463
    .line 464
    .line 465
    iget-object v9, v0, Lt61;->j:Landroid/graphics/Path;

    .line 466
    .line 467
    invoke-virtual {v9}, Landroid/graphics/Path;->reset()V

    .line 468
    .line 469
    .line 470
    aget-object v14, v20, v7

    .line 471
    .line 472
    invoke-virtual {v11, v14, v9}, Lb71;->b(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v0, v9, v7}, Lt61;->b(Landroid/graphics/Path;I)Z

    .line 476
    .line 477
    .line 478
    move-result v14

    .line 479
    if-nez v14, :cond_11

    .line 480
    .line 481
    invoke-virtual {v0, v9, v8}, Lt61;->b(Landroid/graphics/Path;I)Z

    .line 482
    .line 483
    .line 484
    move-result v8

    .line 485
    if-eqz v8, :cond_10

    .line 486
    .line 487
    goto :goto_9

    .line 488
    :cond_10
    aget-object v8, v20, v7

    .line 489
    .line 490
    invoke-virtual {v11, v8, v4}, Lb71;->b(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 491
    .line 492
    .line 493
    const/16 v18, 0x1

    .line 494
    .line 495
    goto :goto_a

    .line 496
    :cond_11
    :goto_9
    sget-object v8, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 497
    .line 498
    invoke-virtual {v9, v9, v6, v8}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 499
    .line 500
    .line 501
    const/4 v14, 0x0

    .line 502
    const/16 v16, 0x0

    .line 503
    .line 504
    aput v14, v12, v16

    .line 505
    .line 506
    iget v8, v11, Lb71;->a:F

    .line 507
    .line 508
    const/16 v18, 0x1

    .line 509
    .line 510
    aput v8, v12, v18

    .line 511
    .line 512
    aget-object v8, v20, v7

    .line 513
    .line 514
    invoke-virtual {v8, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 515
    .line 516
    .line 517
    aget v8, v12, v16

    .line 518
    .line 519
    aget v9, v12, v18

    .line 520
    .line 521
    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    .line 522
    .line 523
    .line 524
    aget-object v8, v20, v7

    .line 525
    .line 526
    invoke-virtual {v11, v8, v5}, Lb71;->b(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 527
    .line 528
    .line 529
    :goto_a
    if-eqz v3, :cond_12

    .line 530
    .line 531
    aget-object v8, v20, v7

    .line 532
    .line 533
    iget-object v9, v3, Lpa0;->k:Ljava/lang/Object;

    .line 534
    .line 535
    check-cast v9, Lfm0;

    .line 536
    .line 537
    iget-object v14, v9, Lfm0;->m:Ljava/util/BitSet;

    .line 538
    .line 539
    add-int/lit8 v10, v7, 0x4

    .line 540
    .line 541
    const/4 v13, 0x0

    .line 542
    invoke-virtual {v14, v10, v13}, Ljava/util/BitSet;->set(IZ)V

    .line 543
    .line 544
    .line 545
    iget-object v9, v9, Lfm0;->l:[La71;

    .line 546
    .line 547
    iget v10, v11, Lb71;->e:F

    .line 548
    .line 549
    invoke-virtual {v11, v10}, Lb71;->a(F)V

    .line 550
    .line 551
    .line 552
    new-instance v10, Landroid/graphics/Matrix;

    .line 553
    .line 554
    invoke-direct {v10, v8}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 555
    .line 556
    .line 557
    new-instance v8, Ljava/util/ArrayList;

    .line 558
    .line 559
    iget-object v11, v11, Lb71;->g:Ljava/util/ArrayList;

    .line 560
    .line 561
    invoke-direct {v8, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 562
    .line 563
    .line 564
    new-instance v11, Lu61;

    .line 565
    .line 566
    invoke-direct {v11, v8, v10}, Lu61;-><init>(Ljava/util/ArrayList;Landroid/graphics/Matrix;)V

    .line 567
    .line 568
    .line 569
    aput-object v11, v9, v7

    .line 570
    .line 571
    goto :goto_b

    .line 572
    :cond_12
    const/4 v13, 0x0

    .line 573
    :goto_b
    move v7, v2

    .line 574
    move/from16 v16, v13

    .line 575
    .line 576
    move-object/from16 v14, v19

    .line 577
    .line 578
    move-object/from16 v9, v20

    .line 579
    .line 580
    const/4 v13, 0x4

    .line 581
    move-object/from16 v2, p3

    .line 582
    .line 583
    goto/16 :goto_4

    .line 584
    .line 585
    :cond_13
    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    .line 589
    .line 590
    .line 591
    invoke-virtual {v5}, Landroid/graphics/Path;->isEmpty()Z

    .line 592
    .line 593
    .line 594
    move-result v0

    .line 595
    if-nez v0, :cond_14

    .line 596
    .line 597
    sget-object v0, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    .line 598
    .line 599
    invoke-virtual {v4, v5, v0}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 600
    .line 601
    .line 602
    :cond_14
    return-void
.end method

.method public final b(Landroid/graphics/Path;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lt61;->k:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lt61;->a:[Lb71;

    .line 7
    .line 8
    aget-object v1, v1, p2

    .line 9
    .line 10
    iget-object p0, p0, Lt61;->b:[Landroid/graphics/Matrix;

    .line 11
    .line 12
    aget-object p0, p0, p2

    .line 13
    .line 14
    invoke-virtual {v1, p0, v0}, Lb71;->b(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0, p2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 27
    .line 28
    .line 29
    sget-object v1, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/graphics/RectF;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/high16 v0, 0x3f800000    # 1.0f

    .line 48
    .line 49
    cmpl-float p1, p1, v0

    .line 50
    .line 51
    if-lez p1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    cmpl-float p0, p0, v0

    .line 58
    .line 59
    if-lez p0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    return p2
.end method
