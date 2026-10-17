.class public final synthetic Lgt;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lgt;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lgt;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lgt;->j:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget-object v0, v0, Lgt;->k:Ljava/lang/Object;

    .line 7
    .line 8
    packed-switch v1, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    check-cast v0, Lg4;

    .line 12
    .line 13
    invoke-virtual {v0}, Lg4;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_0
    check-cast v0, Lcom/melodix/music/SettingsActivity$a;

    .line 18
    .line 19
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->F:Z

    .line 20
    .line 21
    if-eqz v1, :cond_8

    .line 22
    .line 23
    const-string v1, "NONE"

    .line 24
    .line 25
    invoke-virtual {v0}, Lh70;->G()Le6;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const/4 v9, 0x0

    .line 30
    :try_start_0
    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const v3, 0x7f0c0032

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v2, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, ","

    .line 44
    .line 45
    filled-new-array {v3}, [Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v2, v3}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    new-instance v3, Ljava/util/ArrayList;

    .line 54
    .line 55
    const/16 v5, 0xa

    .line 56
    .line 57
    invoke-static {v2, v5}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_0

    .line 73
    .line 74
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v5}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catch_0
    move-exception v0

    .line 93
    goto/16 :goto_7

    .line 94
    .line 95
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    move v6, v9

    .line 105
    :cond_1
    :goto_1
    if-ge v6, v5, :cond_2

    .line 106
    .line 107
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    add-int/lit8 v6, v6, 0x1

    .line 112
    .line 113
    move-object v8, v7

    .line 114
    check-cast v8, Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    if-lez v8, :cond_1

    .line 121
    .line 122
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_2
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    const/4 v10, 0x6

    .line 131
    if-eqz v3, :cond_4

    .line 132
    .line 133
    new-instance v3, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v3, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 136
    .line 137
    .line 138
    move v5, v9

    .line 139
    :goto_2
    if-ge v5, v10, :cond_3

    .line 140
    .line 141
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    add-int/lit8 v5, v5, 0x1

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_3
    invoke-static {v2, v3}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v10, v2}, Lbl;->D(ILjava/util/List;)Ljava/util/List;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    new-instance v3, Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 158
    .line 159
    .line 160
    :goto_3
    move-object v7, v3

    .line 161
    goto :goto_5

    .line 162
    :cond_4
    const-string v11, "PLAY"

    .line 163
    .line 164
    const-string v12, "PREV"

    .line 165
    .line 166
    const-string v13, "NEXT"

    .line 167
    .line 168
    const-string v14, "FAV"

    .line 169
    .line 170
    const-string v15, "REPEAT"

    .line 171
    .line 172
    const-string v16, "SHUFFLE"

    .line 173
    .line 174
    filled-new-array/range {v11 .. v16}, [Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-static {v3}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    new-instance v5, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    :cond_5
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    if-eqz v7, :cond_6

    .line 196
    .line 197
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    move-object v8, v7

    .line 202
    check-cast v8, Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    if-nez v8, :cond_5

    .line 209
    .line 210
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_6
    invoke-static {v2, v5}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-static {v2, v3}, Lbl;->C(Ljava/util/Collection;Ljava/util/List;)Ljava/util/ArrayList;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-static {v10, v2}, Lbl;->D(ILjava/util/List;)Ljava/util/List;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    new-instance v3, Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :goto_5
    new-array v2, v10, [Landroid/widget/ImageButton;

    .line 233
    .line 234
    const v3, 0x7f090061

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    aput-object v3, v2, v9

    .line 242
    .line 243
    const v3, 0x7f090062

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    const/4 v5, 0x1

    .line 251
    aput-object v3, v2, v5

    .line 252
    .line 253
    const v3, 0x7f090063

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    const/4 v5, 0x2

    .line 261
    aput-object v3, v2, v5

    .line 262
    .line 263
    const v3, 0x7f090064

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    const/4 v11, 0x3

    .line 271
    aput-object v3, v2, v11

    .line 272
    .line 273
    const v3, 0x7f090065

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    const/4 v5, 0x4

    .line 281
    aput-object v3, v2, v5

    .line 282
    .line 283
    const v3, 0x7f090066

    .line 284
    .line 285
    .line 286
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    const/4 v5, 0x5

    .line 291
    aput-object v3, v2, v5

    .line 292
    .line 293
    invoke-static {v2}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v8

    .line 297
    new-instance v12, Lcom/melodix/music/e;

    .line 298
    .line 299
    const-string v2, "PREV"

    .line 300
    .line 301
    const-string v3, "Previous Track"

    .line 302
    .line 303
    const v5, 0x7f080124

    .line 304
    .line 305
    .line 306
    invoke-direct {v12, v2, v3, v5}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 307
    .line 308
    .line 309
    new-instance v13, Lcom/melodix/music/e;

    .line 310
    .line 311
    const-string v2, "PLAY"

    .line 312
    .line 313
    const-string v3, "Play / Pause"

    .line 314
    .line 315
    const v5, 0x7f080122

    .line 316
    .line 317
    .line 318
    invoke-direct {v13, v2, v3, v5}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 319
    .line 320
    .line 321
    new-instance v14, Lcom/melodix/music/e;

    .line 322
    .line 323
    const-string v2, "NEXT"

    .line 324
    .line 325
    const-string v3, "Next Track"

    .line 326
    .line 327
    const v5, 0x7f080113

    .line 328
    .line 329
    .line 330
    invoke-direct {v14, v2, v3, v5}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 331
    .line 332
    .line 333
    new-instance v15, Lcom/melodix/music/e;

    .line 334
    .line 335
    const-string v2, "FAV"

    .line 336
    .line 337
    const-string v3, "Favorite / Like"

    .line 338
    .line 339
    const v5, 0x7f0800aa

    .line 340
    .line 341
    .line 342
    invoke-direct {v15, v2, v3, v5}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 343
    .line 344
    .line 345
    new-instance v2, Lcom/melodix/music/e;

    .line 346
    .line 347
    const-string v3, "REPEAT"

    .line 348
    .line 349
    const-string v5, "Repeat Mode"

    .line 350
    .line 351
    const v6, 0x7f080126

    .line 352
    .line 353
    .line 354
    invoke-direct {v2, v3, v5, v6}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 355
    .line 356
    .line 357
    new-instance v3, Lcom/melodix/music/e;

    .line 358
    .line 359
    const-string v5, "SHUFFLE"

    .line 360
    .line 361
    const-string v6, "Shuffle Mode"

    .line 362
    .line 363
    const v9, 0x7f080129

    .line 364
    .line 365
    .line 366
    invoke-direct {v3, v5, v6, v9}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 367
    .line 368
    .line 369
    new-instance v5, Lcom/melodix/music/e;

    .line 370
    .line 371
    const-string v6, "None (Empty Slot)"

    .line 372
    .line 373
    const v9, 0x108001d

    .line 374
    .line 375
    .line 376
    invoke-direct {v5, v1, v6, v9}, Lcom/melodix/music/e;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 377
    .line 378
    .line 379
    move-object/from16 v16, v2

    .line 380
    .line 381
    move-object/from16 v17, v3

    .line 382
    .line 383
    move-object/from16 v18, v5

    .line 384
    .line 385
    filled-new-array/range {v12 .. v18}, [Lcom/melodix/music/e;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v1}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 390
    .line 391
    .line 392
    move-result-object v6

    .line 393
    invoke-static {v8, v7, v6}, Lcom/melodix/music/SettingsActivity$a;->U(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 394
    .line 395
    .line 396
    const/4 v5, 0x0

    .line 397
    :goto_6
    if-ge v5, v10, :cond_7

    .line 398
    .line 399
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    check-cast v1, Landroid/widget/ImageButton;

    .line 404
    .line 405
    new-instance v3, Lc61;

    .line 406
    .line 407
    invoke-direct/range {v3 .. v8}, Lc61;-><init>(Le6;ILjava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 411
    .line 412
    .line 413
    add-int/lit8 v5, v5, 0x1

    .line 414
    .line 415
    goto :goto_6

    .line 416
    :cond_7
    new-instance v1, Lf4;

    .line 417
    .line 418
    invoke-direct {v1, v4}, Lf4;-><init>(Landroid/content/Context;)V

    .line 419
    .line 420
    .line 421
    iget-object v2, v1, Lf4;->c:Ljava/lang/Object;

    .line 422
    .line 423
    check-cast v2, Lb4;

    .line 424
    .line 425
    iput-object v0, v2, Lb4;->r:Landroid/view/View;

    .line 426
    .line 427
    invoke-virtual {v1}, Lf4;->a()Lg4;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    const v2, 0x7f09005e

    .line 432
    .line 433
    .line 434
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v2

    .line 438
    check-cast v2, Landroid/widget/Button;

    .line 439
    .line 440
    new-instance v3, Lw51;

    .line 441
    .line 442
    invoke-direct {v3, v7, v8, v6, v11}, Lw51;-><init>(Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 443
    .line 444
    .line 445
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 446
    .line 447
    .line 448
    const v2, 0x7f09005f

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    check-cast v0, Landroid/widget/Button;

    .line 456
    .line 457
    new-instance v2, Ld61;

    .line 458
    .line 459
    invoke-direct {v2, v7, v1}, Ld61;-><init>(Ljava/util/ArrayList;Lg4;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 466
    .line 467
    .line 468
    goto :goto_8

    .line 469
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    new-instance v1, Ljava/lang/StringBuilder;

    .line 474
    .line 475
    const-string v2, "Error: "

    .line 476
    .line 477
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    const/4 v1, 0x0

    .line 488
    invoke-static {v4, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 493
    .line 494
    .line 495
    :cond_8
    :goto_8
    return-void

    .line 496
    :pswitch_1
    check-cast v0, Lcom/melodix/music/CustomPrefTitle;

    .line 497
    .line 498
    iget-object v0, v0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    .line 499
    .line 500
    instance-of v1, v0, Landroidx/activity/a;

    .line 501
    .line 502
    if-eqz v1, :cond_9

    .line 503
    .line 504
    move-object v1, v0

    .line 505
    check-cast v1, Landroidx/activity/a;

    .line 506
    .line 507
    goto :goto_9

    .line 508
    :cond_9
    move-object v1, v2

    .line 509
    :goto_9
    if-eqz v1, :cond_a

    .line 510
    .line 511
    invoke-virtual {v1}, Landroidx/activity/a;->i()Landroidx/activity/b;

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    invoke-virtual {v0}, Landroidx/activity/b;->b()V

    .line 516
    .line 517
    .line 518
    goto :goto_a

    .line 519
    :cond_a
    instance-of v1, v0, Landroid/app/Activity;

    .line 520
    .line 521
    if-eqz v1, :cond_b

    .line 522
    .line 523
    move-object v2, v0

    .line 524
    check-cast v2, Landroid/app/Activity;

    .line 525
    .line 526
    :cond_b
    if-eqz v2, :cond_c

    .line 527
    .line 528
    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 529
    .line 530
    .line 531
    :cond_c
    :goto_a
    return-void

    .line 532
    nop

    .line 533
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
