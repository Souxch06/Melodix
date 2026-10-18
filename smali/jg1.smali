.class public abstract Ljg1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:[B

.field public static final b:Lsb0;

.field public static final c:Lg11;

.field public static final d:Ljava/util/TimeZone;

.field public static final e:Lkz0;

.field public static final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    sput-object v1, Ljg1;->a:[B

    .line 5
    .line 6
    new-array v2, v0, [Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v2}, Lml;->v([Ljava/lang/String;)Lsb0;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sput-object v2, Ljg1;->b:Lsb0;

    .line 13
    .line 14
    new-instance v2, Leh;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v0, v1}, Leh;->w(I[B)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lg11;

    .line 23
    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    invoke-direct {v1, v3, v4, v2}, Lg11;-><init>(JLeh;)V

    .line 27
    .line 28
    .line 29
    sput-object v1, Ljg1;->c:Lg11;

    .line 30
    .line 31
    sget-object v1, Lth;->m:Lth;

    .line 32
    .line 33
    const-string v1, "efbbbf"

    .line 34
    .line 35
    invoke-static {v1}, Lmz;->g(Ljava/lang/String;)Lth;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "feff"

    .line 40
    .line 41
    invoke-static {v2}, Lmz;->g(Ljava/lang/String;)Lth;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v3, "fffe"

    .line 46
    .line 47
    invoke-static {v3}, Lmz;->g(Ljava/lang/String;)Lth;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "0000ffff"

    .line 52
    .line 53
    invoke-static {v4}, Lmz;->g(Ljava/lang/String;)Lth;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "ffff0000"

    .line 58
    .line 59
    invoke-static {v5}, Lmz;->g(Ljava/lang/String;)Lth;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    filled-new-array {v1, v2, v3, v4, v5}, [Lth;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v6, Ljava/util/ArrayList;

    .line 68
    .line 69
    new-instance v2, Lz9;

    .line 70
    .line 71
    invoke-direct {v2, v1, v0}, Lz9;-><init>([Ljava/lang/Object;Z)V

    .line 72
    .line 73
    .line 74
    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    const/4 v3, 0x1

    .line 82
    if-le v2, v3, :cond_0

    .line 83
    .line 84
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 88
    .line 89
    const/4 v10, 0x5

    .line 90
    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 91
    .line 92
    .line 93
    move v4, v0

    .line 94
    :goto_0
    const/4 v5, -0x1

    .line 95
    if-ge v4, v10, :cond_1

    .line 96
    .line 97
    aget-object v7, v1, v4

    .line 98
    .line 99
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    add-int/lit8 v4, v4, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_1
    new-array v4, v0, [Ljava/lang/Integer;

    .line 110
    .line 111
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, [Ljava/lang/Integer;

    .line 116
    .line 117
    array-length v4, v2

    .line 118
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    array-length v4, v2

    .line 123
    if-nez v4, :cond_2

    .line 124
    .line 125
    new-instance v2, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    move-object v9, v2

    .line 131
    goto :goto_1

    .line 132
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    .line 133
    .line 134
    new-instance v7, Lz9;

    .line 135
    .line 136
    invoke-direct {v7, v2, v3}, Lz9;-><init>([Ljava/lang/Object;Z)V

    .line 137
    .line 138
    .line 139
    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 140
    .line 141
    .line 142
    move-object v9, v4

    .line 143
    :goto_1
    move v2, v0

    .line 144
    move v4, v2

    .line 145
    :goto_2
    if-ge v2, v10, :cond_b

    .line 146
    .line 147
    aget-object v7, v1, v2

    .line 148
    .line 149
    add-int/lit8 v8, v4, 0x1

    .line 150
    .line 151
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 152
    .line 153
    .line 154
    move-result v11

    .line 155
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 156
    .line 157
    .line 158
    move-result v12

    .line 159
    const-string v13, ")."

    .line 160
    .line 161
    if-ltz v11, :cond_a

    .line 162
    .line 163
    if-gt v11, v12, :cond_9

    .line 164
    .line 165
    add-int/lit8 v11, v11, -0x1

    .line 166
    .line 167
    move v12, v0

    .line 168
    :goto_3
    if-gt v12, v11, :cond_7

    .line 169
    .line 170
    add-int v13, v12, v11

    .line 171
    .line 172
    ushr-int/2addr v13, v3

    .line 173
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v14

    .line 177
    check-cast v14, Ljava/lang/Comparable;

    .line 178
    .line 179
    if-ne v14, v7, :cond_3

    .line 180
    .line 181
    move v14, v0

    .line 182
    goto :goto_4

    .line 183
    :cond_3
    if-nez v14, :cond_4

    .line 184
    .line 185
    move v14, v5

    .line 186
    goto :goto_4

    .line 187
    :cond_4
    if-nez v7, :cond_5

    .line 188
    .line 189
    move v14, v3

    .line 190
    goto :goto_4

    .line 191
    :cond_5
    invoke-interface {v14, v7}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 192
    .line 193
    .line 194
    move-result v14

    .line 195
    :goto_4
    if-gez v14, :cond_6

    .line 196
    .line 197
    add-int/lit8 v12, v13, 0x1

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_6
    if-lez v14, :cond_8

    .line 201
    .line 202
    add-int/lit8 v11, v13, -0x1

    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_7
    add-int/lit8 v12, v12, 0x1

    .line 206
    .line 207
    neg-int v13, v12

    .line 208
    :cond_8
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-interface {v9, v13, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    add-int/lit8 v2, v2, 0x1

    .line 216
    .line 217
    move v4, v8

    .line 218
    goto :goto_2

    .line 219
    :cond_9
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    .line 220
    .line 221
    new-instance v1, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    const-string v2, "toIndex ("

    .line 224
    .line 225
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v2, ") is greater than size ("

    .line 232
    .line 233
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    throw v0

    .line 250
    :cond_a
    const-string v0, "fromIndex (0) is greater than toIndex ("

    .line 251
    .line 252
    invoke-static {v0, v13, v11}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_b
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    check-cast v2, Lth;

    .line 265
    .line 266
    invoke-virtual {v2}, Lth;->c()I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-lez v2, :cond_12

    .line 271
    .line 272
    move v2, v0

    .line 273
    :goto_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-ge v2, v3, :cond_f

    .line 278
    .line 279
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    check-cast v3, Lth;

    .line 284
    .line 285
    add-int/lit8 v4, v2, 0x1

    .line 286
    .line 287
    move v5, v4

    .line 288
    :goto_6
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    if-ge v5, v7, :cond_e

    .line 293
    .line 294
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v7

    .line 298
    check-cast v7, Lth;

    .line 299
    .line 300
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v3}, Lth;->c()I

    .line 307
    .line 308
    .line 309
    move-result v8

    .line 310
    invoke-virtual {v7, v3, v8}, Lth;->h(Lth;I)Z

    .line 311
    .line 312
    .line 313
    move-result v8

    .line 314
    if-eqz v8, :cond_e

    .line 315
    .line 316
    invoke-virtual {v7}, Lth;->c()I

    .line 317
    .line 318
    .line 319
    move-result v8

    .line 320
    invoke-virtual {v3}, Lth;->c()I

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    if-eq v8, v11, :cond_d

    .line 325
    .line 326
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v7

    .line 330
    check-cast v7, Ljava/lang/Number;

    .line 331
    .line 332
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 333
    .line 334
    .line 335
    move-result v7

    .line 336
    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v8

    .line 340
    check-cast v8, Ljava/lang/Number;

    .line 341
    .line 342
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 343
    .line 344
    .line 345
    move-result v8

    .line 346
    if-le v7, v8, :cond_c

    .line 347
    .line 348
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    invoke-interface {v9, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    goto :goto_6

    .line 355
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 356
    .line 357
    goto :goto_6

    .line 358
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    const-string v1, "duplicate option: "

    .line 361
    .line 362
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 373
    .line 374
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    throw v1

    .line 382
    :cond_e
    move v2, v4

    .line 383
    goto :goto_5

    .line 384
    :cond_f
    new-instance v4, Leh;

    .line 385
    .line 386
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 387
    .line 388
    .line 389
    const/4 v7, 0x0

    .line 390
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 391
    .line 392
    .line 393
    move-result v8

    .line 394
    const-wide/16 v2, 0x0

    .line 395
    .line 396
    const/4 v5, 0x0

    .line 397
    invoke-static/range {v2 .. v9}, Lju1;->f(JLeh;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    .line 398
    .line 399
    .line 400
    iget-wide v2, v4, Leh;->k:J

    .line 401
    .line 402
    const-wide/16 v5, 0x4

    .line 403
    .line 404
    div-long/2addr v2, v5

    .line 405
    long-to-int v2, v2

    .line 406
    new-array v2, v2, [I

    .line 407
    .line 408
    move v3, v0

    .line 409
    :goto_7
    invoke-virtual {v4}, Leh;->g()Z

    .line 410
    .line 411
    .line 412
    move-result v5

    .line 413
    if-nez v5, :cond_10

    .line 414
    .line 415
    add-int/lit8 v5, v3, 0x1

    .line 416
    .line 417
    invoke-virtual {v4}, Leh;->readInt()I

    .line 418
    .line 419
    .line 420
    move-result v6

    .line 421
    aput v6, v2, v3

    .line 422
    .line 423
    move v3, v5

    .line 424
    goto :goto_7

    .line 425
    :cond_10
    invoke-static {v1, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    check-cast v1, [Lth;

    .line 430
    .line 431
    const-string v1, "GMT"

    .line 432
    .line 433
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 438
    .line 439
    .line 440
    sput-object v1, Ljg1;->d:Ljava/util/TimeZone;

    .line 441
    .line 442
    new-instance v1, Lkz0;

    .line 443
    .line 444
    const-string v2, "([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)"

    .line 445
    .line 446
    invoke-direct {v1, v2}, Lkz0;-><init>(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    sput-object v1, Ljg1;->e:Lkz0;

    .line 450
    .line 451
    const-class v1, Lmr0;

    .line 452
    .line 453
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v1

    .line 457
    const-string v2, "okhttp3."

    .line 458
    .line 459
    invoke-static {v1, v2}, Lda1;->K(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    const-string v2, "Client"

    .line 464
    .line 465
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 466
    .line 467
    .line 468
    move-result v2

    .line 469
    if-eqz v2, :cond_11

    .line 470
    .line 471
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 472
    .line 473
    .line 474
    move-result v2

    .line 475
    add-int/lit8 v2, v2, -0x6

    .line 476
    .line 477
    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v1

    .line 481
    :cond_11
    sput-object v1, Ljg1;->f:Ljava/lang/String;

    .line 482
    .line 483
    return-void

    .line 484
    :cond_12
    const-string v0, "the empty byte string is not a supported option"

    .line 485
    .line 486
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    return-void
.end method

.method public static final a(Led0;Led0;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Led0;->d:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p1, Led0;->d:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget v0, p0, Led0;->e:I

    .line 15
    .line 16
    iget v1, p1, Led0;->e:I

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Led0;->a:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p1, Led0;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public static final b(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    :catch_0
    return-void

    .line 8
    :catch_1
    move-exception p0

    .line 9
    throw p0
.end method

.method public static final c(Ljava/net/Socket;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    :catch_0
    return-void

    .line 8
    :catch_1
    move-exception p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "bio == null"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    throw p0

    .line 23
    :catch_2
    move-exception p0

    .line 24
    throw p0
.end method

.method public static final d(IILjava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :goto_0
    if-ge p0, p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {p3, v0}, Lda1;->z(Ljava/lang/CharSequence;C)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    return p1
.end method

.method public static final e(Ljava/lang/String;CII)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :goto_0
    if-ge p2, p3, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ne v0, p1, :cond_0

    .line 11
    .line 12
    return p2

    .line 13
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    return p3
.end method

.method public static final varargs f(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    array-length v1, p1

    .line 9
    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final g([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_3

    .line 9
    :cond_0
    if-eqz p1, :cond_5

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_3

    .line 15
    :cond_1
    array-length v0, p0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_5

    .line 18
    .line 19
    aget-object v3, p0, v2

    .line 20
    .line 21
    move v4, v1

    .line 22
    :goto_1
    array-length v5, p1

    .line 23
    const/4 v6, 0x1

    .line 24
    if-ge v4, v5, :cond_2

    .line 25
    .line 26
    move v5, v6

    .line 27
    goto :goto_2

    .line 28
    :cond_2
    move v5, v1

    .line 29
    :goto_2
    if-eqz v5, :cond_4

    .line 30
    .line 31
    add-int/lit8 v5, v4, 0x1

    .line 32
    .line 33
    :try_start_0
    aget-object v4, p1, v4
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    invoke-interface {p2, v3, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_3

    .line 40
    .line 41
    return v6

    .line 42
    :cond_3
    move v4, v5

    .line 43
    goto :goto_1

    .line 44
    :catch_0
    move-exception p0

    .line 45
    new-instance p1, Ljava/util/NoSuchElementException;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    :goto_3
    return v1
.end method

.method public static final h(Lf11;)J
    .locals 2

    .line 1
    iget-object p0, p0, Lf11;->o:Lsb0;

    .line 2
    .line 3
    const-string v0, "Content-Length"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    :catch_0
    :cond_0
    return-wide v0
.end method

.method public static final varargs i([Ljava/lang/Object;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, [Ljava/lang/Object;

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public static final j([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)[Ljava/lang/String;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    array-length v1, p0

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ge v3, v1, :cond_2

    .line 13
    .line 14
    aget-object v4, p0, v3

    .line 15
    .line 16
    array-length v5, p1

    .line 17
    move v6, v2

    .line 18
    :goto_1
    if-ge v6, v5, :cond_1

    .line 19
    .line 20
    aget-object v7, p1, v6

    .line 21
    .line 22
    invoke-interface {p2, v4, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    if-nez v7, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    new-array p0, v2, [Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, [Ljava/lang/String;

    .line 45
    .line 46
    return-object p0
.end method

.method public static final k(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "Authorization"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "Cookie"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "Proxy-Authorization"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string v0, "Set-Cookie"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public static final l(C)I
    .locals 2

    .line 1
    const/16 v0, 0x30

    .line 2
    .line 3
    if-gt v0, p0, :cond_0

    .line 4
    .line 5
    const/16 v1, 0x3a

    .line 6
    .line 7
    if-ge p0, v1, :cond_0

    .line 8
    .line 9
    sub-int/2addr p0, v0

    .line 10
    return p0

    .line 11
    :cond_0
    const/16 v0, 0x61

    .line 12
    .line 13
    if-gt v0, p0, :cond_1

    .line 14
    .line 15
    const/16 v0, 0x67

    .line 16
    .line 17
    if-ge p0, v0, :cond_1

    .line 18
    .line 19
    add-int/lit8 p0, p0, -0x57

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    const/16 v0, 0x41

    .line 23
    .line 24
    if-gt v0, p0, :cond_2

    .line 25
    .line 26
    const/16 v0, 0x47

    .line 27
    .line 28
    if-ge p0, v0, :cond_2

    .line 29
    .line 30
    add-int/lit8 p0, p0, -0x37

    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method public static final m(Llh;)I
    .locals 2

    .line 1
    invoke-interface {p0}, Llh;->readByte()B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x10

    .line 8
    .line 9
    invoke-interface {p0}, Llh;->readByte()B

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    shl-int/lit8 v1, v1, 0x8

    .line 16
    .line 17
    or-int/2addr v0, v1

    .line 18
    invoke-interface {p0}, Llh;->readByte()B

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    and-int/lit16 p0, p0, 0xff

    .line 23
    .line 24
    or-int/2addr p0, v0

    .line 25
    return p0
.end method

.method public static final n(Lp81;I)Z
    .locals 12

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Lnc1;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const-wide v4, 0x7fffffffffffffffL

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Lnc1;->c()J

    .line 30
    .line 31
    .line 32
    move-result-wide v6

    .line 33
    sub-long/2addr v6, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-wide v6, v4

    .line 36
    :goto_0
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    int-to-long v8, p1

    .line 41
    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 42
    .line 43
    .line 44
    move-result-wide v8

    .line 45
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 46
    .line 47
    .line 48
    move-result-wide v8

    .line 49
    add-long/2addr v8, v1

    .line 50
    invoke-virtual {v3, v8, v9}, Lnc1;->d(J)Lnc1;

    .line 51
    .line 52
    .line 53
    :try_start_0
    new-instance p1, Leh;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 56
    .line 57
    .line 58
    :goto_1
    const-wide/16 v8, 0x2000

    .line 59
    .line 60
    invoke-interface {p0, v8, v9, p1}, Lp81;->c(JLeh;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v8

    .line 64
    const-wide/16 v10, -0x1

    .line 65
    .line 66
    cmp-long v0, v8, v10

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-wide v8, p1, Leh;->k:J

    .line 71
    .line 72
    invoke-virtual {p1, v8, v9}, Leh;->skip(J)V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    cmp-long p1, v6, v4

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lnc1;->a()Lnc1;

    .line 86
    .line 87
    .line 88
    return v0

    .line 89
    :cond_2
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    add-long/2addr v1, v6

    .line 94
    invoke-virtual {p0, v1, v2}, Lnc1;->d(J)Lnc1;

    .line 95
    .line 96
    .line 97
    return v0

    .line 98
    :catchall_0
    move-exception p1

    .line 99
    cmp-long v0, v6, v4

    .line 100
    .line 101
    if-nez v0, :cond_3

    .line 102
    .line 103
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Lnc1;->a()Lnc1;

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    add-long/2addr v1, v6

    .line 116
    invoke-virtual {p0, v1, v2}, Lnc1;->d(J)Lnc1;

    .line 117
    .line 118
    .line 119
    :goto_2
    throw p1

    .line 120
    :catch_0
    cmp-long p1, v6, v4

    .line 121
    .line 122
    if-nez p1, :cond_4

    .line 123
    .line 124
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Lnc1;->a()Lnc1;

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_4
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    add-long/2addr v1, v6

    .line 137
    invoke-virtual {p0, v1, v2}, Lnc1;->d(J)Lnc1;

    .line 138
    .line 139
    .line 140
    :goto_3
    const/4 p0, 0x0

    .line 141
    return p0
.end method

.method public static final o(Ljava/util/List;)Lsb0;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lqb0;

    .line 23
    .line 24
    iget-object v2, v1, Lqb0;->a:Lth;

    .line 25
    .line 26
    iget-object v1, v1, Lqb0;->b:Lth;

    .line 27
    .line 28
    invoke-virtual {v2}, Lth;->j()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1}, Lth;->j()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance p0, Lsb0;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    new-array v1, v1, [Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, [Ljava/lang/String;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Lsb0;-><init>([Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method

.method public static final p(Led0;Z)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Led0;->e:I

    .line 5
    .line 6
    iget-object v1, p0, Led0;->d:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, ":"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "["

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 v1, 0x5d

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_0
    if-nez p1, :cond_4

    .line 37
    .line 38
    iget-object p0, p0, Led0;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    const-string p1, "http"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const/16 p0, 0x50

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const-string p1, "https"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    const/16 p0, 0x1bb

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/4 p0, -0x1

    .line 66
    :goto_0
    if-eq v0, p0, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    return-object v1

    .line 70
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const/16 p1, 0x3a

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public static final q(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static final r(ILjava/lang/String;)I
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p0, v0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    const p0, 0x7fffffff

    .line 15
    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    cmp-long v0, p0, v0

    .line 21
    .line 22
    if-gez v0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    long-to-int p0, p0

    .line 27
    :catch_0
    :cond_2
    return p0
.end method
