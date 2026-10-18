.class public final Ls6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lor0;
.implements Lhn0;


# instance fields
.field public final synthetic j:Lg7;


# direct methods
.method public synthetic constructor <init>(Lg7;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls6;->j:Lg7;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lrm0;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls6;->j:Lg7;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lg7;->p(Lrm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Landroid/view/View;Lkk1;)Lkk1;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v1, Lkk1;->a:Lhk1;

    .line 6
    .line 7
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget v3, v3, Lne0;->b:I

    .line 12
    .line 13
    move-object/from16 v4, p0

    .line 14
    .line 15
    iget-object v4, v4, Ls6;->j:Lg7;

    .line 16
    .line 17
    iget-object v5, v4, Lg7;->t:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    iget v6, v6, Lne0;->b:I

    .line 24
    .line 25
    iget-object v7, v4, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 26
    .line 27
    const/16 v8, 0x1d

    .line 28
    .line 29
    if-eqz v7, :cond_11

    .line 30
    .line 31
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    instance-of v7, v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 36
    .line 37
    if-eqz v7, :cond_11

    .line 38
    .line 39
    iget-object v7, v4, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 40
    .line 41
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 46
    .line 47
    iget-object v11, v4, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 48
    .line 49
    invoke-virtual {v11}, Landroid/view/View;->isShown()Z

    .line 50
    .line 51
    .line 52
    move-result v11

    .line 53
    const/4 v12, 0x1

    .line 54
    if-eqz v11, :cond_f

    .line 55
    .line 56
    iget-object v11, v4, Lg7;->l0:Landroid/graphics/Rect;

    .line 57
    .line 58
    if-nez v11, :cond_0

    .line 59
    .line 60
    new-instance v11, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v11, v4, Lg7;->l0:Landroid/graphics/Rect;

    .line 66
    .line 67
    new-instance v11, Landroid/graphics/Rect;

    .line 68
    .line 69
    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v11, v4, Lg7;->m0:Landroid/graphics/Rect;

    .line 73
    .line 74
    :cond_0
    iget-object v11, v4, Lg7;->l0:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget-object v13, v4, Lg7;->m0:Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 79
    .line 80
    .line 81
    move-result-object v14

    .line 82
    iget v14, v14, Lne0;->a:I

    .line 83
    .line 84
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 85
    .line 86
    .line 87
    move-result-object v15

    .line 88
    iget v15, v15, Lne0;->b:I

    .line 89
    .line 90
    const/16 p0, 0x0

    .line 91
    .line 92
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    iget v10, v10, Lne0;->c:I

    .line 97
    .line 98
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    iget v9, v9, Lne0;->d:I

    .line 103
    .line 104
    invoke-virtual {v11, v14, v15, v10, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 105
    .line 106
    .line 107
    iget-object v9, v4, Lg7;->J:Landroid/view/ViewGroup;

    .line 108
    .line 109
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 110
    .line 111
    if-lt v10, v8, :cond_1

    .line 112
    .line 113
    sget-boolean v10, Lri1;->a:Z

    .line 114
    .line 115
    invoke-static {v9, v11, v13}, Lqi1;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    sget-boolean v10, Lri1;->a:Z

    .line 120
    .line 121
    if-nez v10, :cond_2

    .line 122
    .line 123
    sput-boolean v12, Lri1;->a:Z

    .line 124
    .line 125
    :try_start_0
    const-class v10, Landroid/view/View;

    .line 126
    .line 127
    const-string v14, "computeFitSystemWindows"

    .line 128
    .line 129
    const/4 v15, 0x2

    .line 130
    new-array v15, v15, [Ljava/lang/Class;

    .line 131
    .line 132
    const-class v16, Landroid/graphics/Rect;

    .line 133
    .line 134
    aput-object v16, v15, p0

    .line 135
    .line 136
    aput-object v16, v15, v12

    .line 137
    .line 138
    invoke-virtual {v10, v14, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 139
    .line 140
    .line 141
    move-result-object v10

    .line 142
    sput-object v10, Lri1;->b:Ljava/lang/reflect/Method;

    .line 143
    .line 144
    invoke-virtual {v10}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    if-nez v10, :cond_2

    .line 149
    .line 150
    sget-object v10, Lri1;->b:Ljava/lang/reflect/Method;

    .line 151
    .line 152
    invoke-virtual {v10, v12}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .line 154
    .line 155
    :catch_0
    :cond_2
    sget-object v10, Lri1;->b:Ljava/lang/reflect/Method;

    .line 156
    .line 157
    if-eqz v10, :cond_3

    .line 158
    .line 159
    :try_start_1
    filled-new-array {v11, v13}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v13

    .line 163
    invoke-virtual {v10, v9, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 164
    .line 165
    .line 166
    :catch_1
    :cond_3
    :goto_0
    iget v9, v11, Landroid/graphics/Rect;->top:I

    .line 167
    .line 168
    iget v10, v11, Landroid/graphics/Rect;->left:I

    .line 169
    .line 170
    iget v11, v11, Landroid/graphics/Rect;->right:I

    .line 171
    .line 172
    iget-object v13, v4, Lg7;->J:Landroid/view/ViewGroup;

    .line 173
    .line 174
    sget-object v14, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 175
    .line 176
    invoke-static {v13}, Lph1;->a(Landroid/view/View;)Lkk1;

    .line 177
    .line 178
    .line 179
    move-result-object v13

    .line 180
    if-nez v13, :cond_4

    .line 181
    .line 182
    move/from16 v14, p0

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_4
    iget-object v14, v13, Lkk1;->a:Lhk1;

    .line 186
    .line 187
    invoke-virtual {v14}, Lhk1;->j()Lne0;

    .line 188
    .line 189
    .line 190
    move-result-object v14

    .line 191
    iget v14, v14, Lne0;->a:I

    .line 192
    .line 193
    :goto_1
    if-nez v13, :cond_5

    .line 194
    .line 195
    move/from16 v13, p0

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_5
    iget-object v13, v13, Lkk1;->a:Lhk1;

    .line 199
    .line 200
    invoke-virtual {v13}, Lhk1;->j()Lne0;

    .line 201
    .line 202
    .line 203
    move-result-object v13

    .line 204
    iget v13, v13, Lne0;->c:I

    .line 205
    .line 206
    :goto_2
    iget v15, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 207
    .line 208
    if-ne v15, v9, :cond_7

    .line 209
    .line 210
    iget v15, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 211
    .line 212
    if-ne v15, v10, :cond_7

    .line 213
    .line 214
    iget v15, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 215
    .line 216
    if-eq v15, v11, :cond_6

    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_6
    move/from16 v10, p0

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_7
    :goto_3
    iput v9, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 223
    .line 224
    iput v10, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 225
    .line 226
    iput v11, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 227
    .line 228
    move v10, v12

    .line 229
    :goto_4
    if-lez v9, :cond_8

    .line 230
    .line 231
    iget-object v9, v4, Lg7;->L:Landroid/view/View;

    .line 232
    .line 233
    if-nez v9, :cond_8

    .line 234
    .line 235
    new-instance v9, Landroid/view/View;

    .line 236
    .line 237
    invoke-direct {v9, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 238
    .line 239
    .line 240
    iput-object v9, v4, Lg7;->L:Landroid/view/View;

    .line 241
    .line 242
    const/16 v11, 0x8

    .line 243
    .line 244
    invoke-virtual {v9, v11}, Landroid/view/View;->setVisibility(I)V

    .line 245
    .line 246
    .line 247
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    .line 248
    .line 249
    iget v15, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 250
    .line 251
    const/16 v11, 0x33

    .line 252
    .line 253
    const/4 v12, -0x1

    .line 254
    invoke-direct {v9, v12, v15, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 255
    .line 256
    .line 257
    iput v14, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 258
    .line 259
    iput v13, v9, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 260
    .line 261
    iget-object v11, v4, Lg7;->J:Landroid/view/ViewGroup;

    .line 262
    .line 263
    iget-object v13, v4, Lg7;->L:Landroid/view/View;

    .line 264
    .line 265
    invoke-virtual {v11, v13, v12, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 266
    .line 267
    .line 268
    goto :goto_5

    .line 269
    :cond_8
    iget-object v9, v4, Lg7;->L:Landroid/view/View;

    .line 270
    .line 271
    if-eqz v9, :cond_a

    .line 272
    .line 273
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 274
    .line 275
    .line 276
    move-result-object v9

    .line 277
    check-cast v9, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 278
    .line 279
    iget v11, v9, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 280
    .line 281
    iget v12, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 282
    .line 283
    if-ne v11, v12, :cond_9

    .line 284
    .line 285
    iget v11, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 286
    .line 287
    if-ne v11, v14, :cond_9

    .line 288
    .line 289
    iget v11, v9, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 290
    .line 291
    if-eq v11, v13, :cond_a

    .line 292
    .line 293
    :cond_9
    iput v12, v9, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 294
    .line 295
    iput v14, v9, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 296
    .line 297
    iput v13, v9, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 298
    .line 299
    iget-object v11, v4, Lg7;->L:Landroid/view/View;

    .line 300
    .line 301
    invoke-virtual {v11, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    .line 303
    .line 304
    :cond_a
    :goto_5
    iget-object v9, v4, Lg7;->L:Landroid/view/View;

    .line 305
    .line 306
    if-eqz v9, :cond_b

    .line 307
    .line 308
    const/4 v12, 0x1

    .line 309
    goto :goto_6

    .line 310
    :cond_b
    move/from16 v12, p0

    .line 311
    .line 312
    :goto_6
    if-eqz v12, :cond_d

    .line 313
    .line 314
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    .line 315
    .line 316
    .line 317
    move-result v9

    .line 318
    if-eqz v9, :cond_d

    .line 319
    .line 320
    iget-object v9, v4, Lg7;->L:Landroid/view/View;

    .line 321
    .line 322
    invoke-virtual {v9}, Landroid/view/View;->getWindowSystemUiVisibility()I

    .line 323
    .line 324
    .line 325
    move-result v11

    .line 326
    and-int/lit16 v11, v11, 0x2000

    .line 327
    .line 328
    if-eqz v11, :cond_c

    .line 329
    .line 330
    const v11, 0x7f060006

    .line 331
    .line 332
    .line 333
    invoke-static {v5, v11}, Lbq;->a(Landroid/content/Context;I)I

    .line 334
    .line 335
    .line 336
    move-result v5

    .line 337
    goto :goto_7

    .line 338
    :cond_c
    const v11, 0x7f060005

    .line 339
    .line 340
    .line 341
    invoke-static {v5, v11}, Lbq;->a(Landroid/content/Context;I)I

    .line 342
    .line 343
    .line 344
    move-result v5

    .line 345
    :goto_7
    invoke-virtual {v9, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 346
    .line 347
    .line 348
    :cond_d
    iget-boolean v5, v4, Lg7;->Q:Z

    .line 349
    .line 350
    if-nez v5, :cond_e

    .line 351
    .line 352
    if-eqz v12, :cond_e

    .line 353
    .line 354
    move/from16 v6, p0

    .line 355
    .line 356
    :cond_e
    move/from16 v16, v10

    .line 357
    .line 358
    move v5, v12

    .line 359
    move/from16 v12, p0

    .line 360
    .line 361
    goto :goto_8

    .line 362
    :cond_f
    const/16 p0, 0x0

    .line 363
    .line 364
    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 365
    .line 366
    move/from16 v12, p0

    .line 367
    .line 368
    if-eqz v5, :cond_10

    .line 369
    .line 370
    iput v12, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 371
    .line 372
    move v5, v12

    .line 373
    const/16 v16, 0x1

    .line 374
    .line 375
    goto :goto_8

    .line 376
    :cond_10
    move v5, v12

    .line 377
    move/from16 v16, v5

    .line 378
    .line 379
    :goto_8
    if-eqz v16, :cond_12

    .line 380
    .line 381
    iget-object v9, v4, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 382
    .line 383
    invoke-virtual {v9, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 384
    .line 385
    .line 386
    goto :goto_9

    .line 387
    :cond_11
    const/4 v12, 0x0

    .line 388
    move v5, v12

    .line 389
    :cond_12
    :goto_9
    iget-object v4, v4, Lg7;->L:Landroid/view/View;

    .line 390
    .line 391
    if-eqz v4, :cond_14

    .line 392
    .line 393
    if-eqz v5, :cond_13

    .line 394
    .line 395
    move v9, v12

    .line 396
    goto :goto_a

    .line 397
    :cond_13
    const/16 v9, 0x8

    .line 398
    .line 399
    :goto_a
    invoke-virtual {v4, v9}, Landroid/view/View;->setVisibility(I)V

    .line 400
    .line 401
    .line 402
    :cond_14
    if-eq v3, v6, :cond_17

    .line 403
    .line 404
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    iget v3, v3, Lne0;->a:I

    .line 409
    .line 410
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 411
    .line 412
    .line 413
    move-result-object v4

    .line 414
    iget v4, v4, Lne0;->c:I

    .line 415
    .line 416
    invoke-virtual {v2}, Lhk1;->j()Lne0;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    iget v2, v2, Lne0;->d:I

    .line 421
    .line 422
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 423
    .line 424
    const/16 v7, 0x1e

    .line 425
    .line 426
    if-lt v5, v7, :cond_15

    .line 427
    .line 428
    new-instance v5, Lak1;

    .line 429
    .line 430
    invoke-direct {v5, v1}, Lak1;-><init>(Lkk1;)V

    .line 431
    .line 432
    .line 433
    goto :goto_b

    .line 434
    :cond_15
    if-lt v5, v8, :cond_16

    .line 435
    .line 436
    new-instance v5, Lzj1;

    .line 437
    .line 438
    invoke-direct {v5, v1}, Lzj1;-><init>(Lkk1;)V

    .line 439
    .line 440
    .line 441
    goto :goto_b

    .line 442
    :cond_16
    new-instance v5, Lxj1;

    .line 443
    .line 444
    invoke-direct {v5, v1}, Lxj1;-><init>(Lkk1;)V

    .line 445
    .line 446
    .line 447
    :goto_b
    invoke-static {v3, v6, v4, v2}, Lne0;->a(IIII)Lne0;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-virtual {v5, v1}, Lbk1;->d(Lne0;)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v5}, Lbk1;->b()Lkk1;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    :cond_17
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 459
    .line 460
    invoke-virtual {v1}, Lkk1;->b()Landroid/view/WindowInsets;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    if-eqz v2, :cond_18

    .line 465
    .line 466
    invoke-static {v0, v2}, Lmh1;->b(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 467
    .line 468
    .line 469
    move-result-object v3

    .line 470
    invoke-virtual {v3, v2}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    if-nez v2, :cond_18

    .line 475
    .line 476
    invoke-static {v3, v0}, Lkk1;->c(Landroid/view/WindowInsets;Landroid/view/View;)Lkk1;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    :cond_18
    return-object v1
.end method

.method public l(Lrm0;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ls6;->j:Lg7;

    .line 2
    .line 3
    iget-object p0, p0, Lg7;->u:Landroid/view/Window;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x6c

    .line 12
    .line 13
    invoke-interface {p0, v0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method
