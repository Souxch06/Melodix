.class public final Lrn0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lb31;


# static fields
.field public static final j:[I

.field public static final k:Lsun/misc/Unsafe;


# instance fields
.field public final a:[I

.field public final b:[Ljava/lang/Object;

.field public final c:Lh0;

.field public final d:[I

.field public final e:I

.field public final f:Lrp0;

.field public final g:Lzi0;

.field public final h:Lze1;

.field public final i:Lol0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lrn0;->j:[I

    .line 5
    .line 6
    :try_start_0
    new-instance v0, Lz;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-direct {v0, v1}, Lz;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lsun/misc/Unsafe;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    sput-object v0, Lrn0;->k:Lsun/misc/Unsafe;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>([I[Ljava/lang/Object;Lh0;[IILrp0;Lzi0;Lze1;Lg20;Lol0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrn0;->a:[I

    .line 5
    .line 6
    iput-object p2, p0, Lrn0;->b:[Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p4, p0, Lrn0;->d:[I

    .line 9
    .line 10
    iput p5, p0, Lrn0;->e:I

    .line 11
    .line 12
    iput-object p6, p0, Lrn0;->f:Lrp0;

    .line 13
    .line 14
    iput-object p7, p0, Lrn0;->g:Lzi0;

    .line 15
    .line 16
    iput-object p8, p0, Lrn0;->h:Lze1;

    .line 17
    .line 18
    iput-object p3, p0, Lrn0;->c:Lh0;

    .line 19
    .line 20
    iput-object p10, p0, Lrn0;->i:Lol0;

    .line 21
    .line 22
    return-void
.end method

.method public static m(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p0, Lia0;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lia0;

    .line 10
    .line 11
    invoke-virtual {p0}, Lia0;->m()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static q(Lox0;Lrp0;Lzi0;Lze1;Lg20;Lol0;)Lrn0;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    instance-of v1, v0, Lox0;

    .line 4
    .line 5
    if-eqz v1, :cond_36

    .line 6
    .line 7
    iget-object v1, v0, Lox0;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const v6, 0xd800

    .line 19
    .line 20
    .line 21
    if-lt v4, v6, :cond_0

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    :goto_0
    add-int/lit8 v7, v4, 0x1

    .line 25
    .line 26
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-lt v4, v6, :cond_1

    .line 31
    .line 32
    move v4, v7

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v7, 0x1

    .line 35
    :cond_1
    add-int/lit8 v4, v7, 0x1

    .line 36
    .line 37
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-lt v7, v6, :cond_3

    .line 42
    .line 43
    and-int/lit16 v7, v7, 0x1fff

    .line 44
    .line 45
    const/16 v9, 0xd

    .line 46
    .line 47
    :goto_1
    add-int/lit8 v10, v4, 0x1

    .line 48
    .line 49
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-lt v4, v6, :cond_2

    .line 54
    .line 55
    and-int/lit16 v4, v4, 0x1fff

    .line 56
    .line 57
    shl-int/2addr v4, v9

    .line 58
    or-int/2addr v7, v4

    .line 59
    add-int/lit8 v9, v9, 0xd

    .line 60
    .line 61
    move v4, v10

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    shl-int/2addr v4, v9

    .line 64
    or-int/2addr v7, v4

    .line 65
    move v4, v10

    .line 66
    :cond_3
    if-nez v7, :cond_4

    .line 67
    .line 68
    sget-object v7, Lrn0;->j:[I

    .line 69
    .line 70
    move v9, v3

    .line 71
    move v10, v9

    .line 72
    move v11, v10

    .line 73
    move v14, v11

    .line 74
    move-object v13, v7

    .line 75
    move v7, v14

    .line 76
    goto/16 :goto_a

    .line 77
    .line 78
    :cond_4
    add-int/lit8 v7, v4, 0x1

    .line 79
    .line 80
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-lt v4, v6, :cond_6

    .line 85
    .line 86
    and-int/lit16 v4, v4, 0x1fff

    .line 87
    .line 88
    const/16 v9, 0xd

    .line 89
    .line 90
    :goto_2
    add-int/lit8 v10, v7, 0x1

    .line 91
    .line 92
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-lt v7, v6, :cond_5

    .line 97
    .line 98
    and-int/lit16 v7, v7, 0x1fff

    .line 99
    .line 100
    shl-int/2addr v7, v9

    .line 101
    or-int/2addr v4, v7

    .line 102
    add-int/lit8 v9, v9, 0xd

    .line 103
    .line 104
    move v7, v10

    .line 105
    goto :goto_2

    .line 106
    :cond_5
    shl-int/2addr v7, v9

    .line 107
    or-int/2addr v4, v7

    .line 108
    move v7, v10

    .line 109
    :cond_6
    add-int/lit8 v9, v7, 0x1

    .line 110
    .line 111
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-lt v7, v6, :cond_8

    .line 116
    .line 117
    and-int/lit16 v7, v7, 0x1fff

    .line 118
    .line 119
    const/16 v10, 0xd

    .line 120
    .line 121
    :goto_3
    add-int/lit8 v11, v9, 0x1

    .line 122
    .line 123
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    if-lt v9, v6, :cond_7

    .line 128
    .line 129
    and-int/lit16 v9, v9, 0x1fff

    .line 130
    .line 131
    shl-int/2addr v9, v10

    .line 132
    or-int/2addr v7, v9

    .line 133
    add-int/lit8 v10, v10, 0xd

    .line 134
    .line 135
    move v9, v11

    .line 136
    goto :goto_3

    .line 137
    :cond_7
    shl-int/2addr v9, v10

    .line 138
    or-int/2addr v7, v9

    .line 139
    move v9, v11

    .line 140
    :cond_8
    add-int/lit8 v10, v9, 0x1

    .line 141
    .line 142
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    if-lt v9, v6, :cond_a

    .line 147
    .line 148
    :goto_4
    add-int/lit8 v9, v10, 0x1

    .line 149
    .line 150
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    if-lt v10, v6, :cond_9

    .line 155
    .line 156
    move v10, v9

    .line 157
    goto :goto_4

    .line 158
    :cond_9
    move v10, v9

    .line 159
    :cond_a
    add-int/lit8 v9, v10, 0x1

    .line 160
    .line 161
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 162
    .line 163
    .line 164
    move-result v10

    .line 165
    if-lt v10, v6, :cond_c

    .line 166
    .line 167
    :goto_5
    add-int/lit8 v10, v9, 0x1

    .line 168
    .line 169
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    if-lt v9, v6, :cond_b

    .line 174
    .line 175
    move v9, v10

    .line 176
    goto :goto_5

    .line 177
    :cond_b
    move v9, v10

    .line 178
    :cond_c
    add-int/lit8 v10, v9, 0x1

    .line 179
    .line 180
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 181
    .line 182
    .line 183
    move-result v9

    .line 184
    if-lt v9, v6, :cond_e

    .line 185
    .line 186
    and-int/lit16 v9, v9, 0x1fff

    .line 187
    .line 188
    const/16 v11, 0xd

    .line 189
    .line 190
    :goto_6
    add-int/lit8 v12, v10, 0x1

    .line 191
    .line 192
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v10

    .line 196
    if-lt v10, v6, :cond_d

    .line 197
    .line 198
    and-int/lit16 v10, v10, 0x1fff

    .line 199
    .line 200
    shl-int/2addr v10, v11

    .line 201
    or-int/2addr v9, v10

    .line 202
    add-int/lit8 v11, v11, 0xd

    .line 203
    .line 204
    move v10, v12

    .line 205
    goto :goto_6

    .line 206
    :cond_d
    shl-int/2addr v10, v11

    .line 207
    or-int/2addr v9, v10

    .line 208
    move v10, v12

    .line 209
    :cond_e
    add-int/lit8 v11, v10, 0x1

    .line 210
    .line 211
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 212
    .line 213
    .line 214
    move-result v10

    .line 215
    if-lt v10, v6, :cond_10

    .line 216
    .line 217
    and-int/lit16 v10, v10, 0x1fff

    .line 218
    .line 219
    const/16 v12, 0xd

    .line 220
    .line 221
    :goto_7
    add-int/lit8 v13, v11, 0x1

    .line 222
    .line 223
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 224
    .line 225
    .line 226
    move-result v11

    .line 227
    if-lt v11, v6, :cond_f

    .line 228
    .line 229
    and-int/lit16 v11, v11, 0x1fff

    .line 230
    .line 231
    shl-int/2addr v11, v12

    .line 232
    or-int/2addr v10, v11

    .line 233
    add-int/lit8 v12, v12, 0xd

    .line 234
    .line 235
    move v11, v13

    .line 236
    goto :goto_7

    .line 237
    :cond_f
    shl-int/2addr v11, v12

    .line 238
    or-int/2addr v10, v11

    .line 239
    move v11, v13

    .line 240
    :cond_10
    add-int/lit8 v12, v11, 0x1

    .line 241
    .line 242
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 243
    .line 244
    .line 245
    move-result v11

    .line 246
    if-lt v11, v6, :cond_12

    .line 247
    .line 248
    and-int/lit16 v11, v11, 0x1fff

    .line 249
    .line 250
    const/16 v13, 0xd

    .line 251
    .line 252
    :goto_8
    add-int/lit8 v14, v12, 0x1

    .line 253
    .line 254
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 255
    .line 256
    .line 257
    move-result v12

    .line 258
    if-lt v12, v6, :cond_11

    .line 259
    .line 260
    and-int/lit16 v12, v12, 0x1fff

    .line 261
    .line 262
    shl-int/2addr v12, v13

    .line 263
    or-int/2addr v11, v12

    .line 264
    add-int/lit8 v13, v13, 0xd

    .line 265
    .line 266
    move v12, v14

    .line 267
    goto :goto_8

    .line 268
    :cond_11
    shl-int/2addr v12, v13

    .line 269
    or-int/2addr v11, v12

    .line 270
    move v12, v14

    .line 271
    :cond_12
    add-int/lit8 v13, v12, 0x1

    .line 272
    .line 273
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 274
    .line 275
    .line 276
    move-result v12

    .line 277
    if-lt v12, v6, :cond_14

    .line 278
    .line 279
    and-int/lit16 v12, v12, 0x1fff

    .line 280
    .line 281
    const/16 v14, 0xd

    .line 282
    .line 283
    :goto_9
    add-int/lit8 v15, v13, 0x1

    .line 284
    .line 285
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 286
    .line 287
    .line 288
    move-result v13

    .line 289
    if-lt v13, v6, :cond_13

    .line 290
    .line 291
    and-int/lit16 v13, v13, 0x1fff

    .line 292
    .line 293
    shl-int/2addr v13, v14

    .line 294
    or-int/2addr v12, v13

    .line 295
    add-int/lit8 v14, v14, 0xd

    .line 296
    .line 297
    move v13, v15

    .line 298
    goto :goto_9

    .line 299
    :cond_13
    shl-int/2addr v13, v14

    .line 300
    or-int/2addr v12, v13

    .line 301
    move v13, v15

    .line 302
    :cond_14
    add-int v14, v12, v10

    .line 303
    .line 304
    add-int/2addr v14, v11

    .line 305
    new-array v11, v14, [I

    .line 306
    .line 307
    mul-int/lit8 v14, v4, 0x2

    .line 308
    .line 309
    add-int/2addr v14, v7

    .line 310
    move v7, v4

    .line 311
    move v4, v13

    .line 312
    move-object v13, v11

    .line 313
    move v11, v14

    .line 314
    move v14, v12

    .line 315
    :goto_a
    iget-object v12, v0, Lox0;->c:[Ljava/lang/Object;

    .line 316
    .line 317
    iget-object v15, v0, Lox0;->a:Lh0;

    .line 318
    .line 319
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 320
    .line 321
    .line 322
    move-result-object v15

    .line 323
    mul-int/lit8 v3, v9, 0x3

    .line 324
    .line 325
    new-array v3, v3, [I

    .line 326
    .line 327
    mul-int/lit8 v9, v9, 0x2

    .line 328
    .line 329
    new-array v9, v9, [Ljava/lang/Object;

    .line 330
    .line 331
    add-int/2addr v10, v14

    .line 332
    move/from16 v19, v14

    .line 333
    .line 334
    const/16 v17, 0x0

    .line 335
    .line 336
    const/16 v18, 0x0

    .line 337
    .line 338
    :goto_b
    if-ge v4, v2, :cond_35

    .line 339
    .line 340
    add-int/lit8 v20, v4, 0x1

    .line 341
    .line 342
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 343
    .line 344
    .line 345
    move-result v4

    .line 346
    if-lt v4, v6, :cond_16

    .line 347
    .line 348
    and-int/lit16 v4, v4, 0x1fff

    .line 349
    .line 350
    move/from16 v8, v20

    .line 351
    .line 352
    const/16 v20, 0xd

    .line 353
    .line 354
    :goto_c
    add-int/lit8 v21, v8, 0x1

    .line 355
    .line 356
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 357
    .line 358
    .line 359
    move-result v8

    .line 360
    if-lt v8, v6, :cond_15

    .line 361
    .line 362
    and-int/lit16 v8, v8, 0x1fff

    .line 363
    .line 364
    shl-int v8, v8, v20

    .line 365
    .line 366
    or-int/2addr v4, v8

    .line 367
    add-int/lit8 v20, v20, 0xd

    .line 368
    .line 369
    move/from16 v8, v21

    .line 370
    .line 371
    goto :goto_c

    .line 372
    :cond_15
    shl-int v8, v8, v20

    .line 373
    .line 374
    or-int/2addr v4, v8

    .line 375
    move/from16 v8, v21

    .line 376
    .line 377
    goto :goto_d

    .line 378
    :cond_16
    move/from16 v8, v20

    .line 379
    .line 380
    :goto_d
    add-int/lit8 v20, v8, 0x1

    .line 381
    .line 382
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 383
    .line 384
    .line 385
    move-result v8

    .line 386
    if-lt v8, v6, :cond_18

    .line 387
    .line 388
    and-int/lit16 v8, v8, 0x1fff

    .line 389
    .line 390
    move/from16 v5, v20

    .line 391
    .line 392
    const/16 v20, 0xd

    .line 393
    .line 394
    :goto_e
    add-int/lit8 v22, v5, 0x1

    .line 395
    .line 396
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    .line 397
    .line 398
    .line 399
    move-result v5

    .line 400
    if-lt v5, v6, :cond_17

    .line 401
    .line 402
    and-int/lit16 v5, v5, 0x1fff

    .line 403
    .line 404
    shl-int v5, v5, v20

    .line 405
    .line 406
    or-int/2addr v8, v5

    .line 407
    add-int/lit8 v20, v20, 0xd

    .line 408
    .line 409
    move/from16 v5, v22

    .line 410
    .line 411
    goto :goto_e

    .line 412
    :cond_17
    shl-int v5, v5, v20

    .line 413
    .line 414
    or-int/2addr v8, v5

    .line 415
    move/from16 v5, v22

    .line 416
    .line 417
    goto :goto_f

    .line 418
    :cond_18
    move/from16 v5, v20

    .line 419
    .line 420
    :goto_f
    and-int/lit16 v6, v8, 0xff

    .line 421
    .line 422
    move/from16 v22, v2

    .line 423
    .line 424
    and-int/lit16 v2, v8, 0x400

    .line 425
    .line 426
    if-eqz v2, :cond_19

    .line 427
    .line 428
    add-int/lit8 v2, v17, 0x1

    .line 429
    .line 430
    aput v18, v13, v17

    .line 431
    .line 432
    move/from16 v17, v2

    .line 433
    .line 434
    :cond_19
    const/16 v2, 0x33

    .line 435
    .line 436
    move-object/from16 v25, v3

    .line 437
    .line 438
    sget-object v3, Lrn0;->k:Lsun/misc/Unsafe;

    .line 439
    .line 440
    if-lt v6, v2, :cond_22

    .line 441
    .line 442
    add-int/lit8 v2, v5, 0x1

    .line 443
    .line 444
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    move/from16 v27, v2

    .line 449
    .line 450
    const v2, 0xd800

    .line 451
    .line 452
    .line 453
    if-lt v5, v2, :cond_1b

    .line 454
    .line 455
    and-int/lit16 v5, v5, 0x1fff

    .line 456
    .line 457
    move/from16 v28, v27

    .line 458
    .line 459
    move/from16 v27, v5

    .line 460
    .line 461
    move/from16 v5, v28

    .line 462
    .line 463
    const/16 v28, 0xd

    .line 464
    .line 465
    :goto_10
    add-int/lit8 v29, v5, 0x1

    .line 466
    .line 467
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    .line 468
    .line 469
    .line 470
    move-result v5

    .line 471
    if-lt v5, v2, :cond_1a

    .line 472
    .line 473
    and-int/lit16 v2, v5, 0x1fff

    .line 474
    .line 475
    shl-int v2, v2, v28

    .line 476
    .line 477
    or-int v27, v27, v2

    .line 478
    .line 479
    add-int/lit8 v28, v28, 0xd

    .line 480
    .line 481
    move/from16 v5, v29

    .line 482
    .line 483
    const v2, 0xd800

    .line 484
    .line 485
    .line 486
    goto :goto_10

    .line 487
    :cond_1a
    shl-int v2, v5, v28

    .line 488
    .line 489
    or-int v5, v27, v2

    .line 490
    .line 491
    move/from16 v2, v29

    .line 492
    .line 493
    goto :goto_11

    .line 494
    :cond_1b
    move/from16 v2, v27

    .line 495
    .line 496
    :goto_11
    move/from16 v27, v2

    .line 497
    .line 498
    add-int/lit8 v2, v6, -0x33

    .line 499
    .line 500
    move/from16 v28, v4

    .line 501
    .line 502
    const/16 v4, 0x9

    .line 503
    .line 504
    if-eq v2, v4, :cond_1e

    .line 505
    .line 506
    const/16 v4, 0x11

    .line 507
    .line 508
    if-ne v2, v4, :cond_1c

    .line 509
    .line 510
    goto :goto_13

    .line 511
    :cond_1c
    const/16 v4, 0xc

    .line 512
    .line 513
    if-ne v2, v4, :cond_1f

    .line 514
    .line 515
    invoke-virtual {v0}, Lox0;->a()I

    .line 516
    .line 517
    .line 518
    move-result v2

    .line 519
    const/4 v4, 0x1

    .line 520
    invoke-static {v2, v4}, Loq;->a(II)Z

    .line 521
    .line 522
    .line 523
    move-result v2

    .line 524
    if-nez v2, :cond_1d

    .line 525
    .line 526
    and-int/lit16 v2, v8, 0x800

    .line 527
    .line 528
    if-eqz v2, :cond_1f

    .line 529
    .line 530
    :cond_1d
    div-int/lit8 v2, v18, 0x3

    .line 531
    .line 532
    mul-int/lit8 v2, v2, 0x2

    .line 533
    .line 534
    add-int/2addr v2, v4

    .line 535
    add-int/lit8 v4, v11, 0x1

    .line 536
    .line 537
    aget-object v11, v12, v11

    .line 538
    .line 539
    aput-object v11, v9, v2

    .line 540
    .line 541
    :goto_12
    move v11, v4

    .line 542
    goto :goto_14

    .line 543
    :cond_1e
    :goto_13
    div-int/lit8 v2, v18, 0x3

    .line 544
    .line 545
    mul-int/lit8 v2, v2, 0x2

    .line 546
    .line 547
    const/16 v21, 0x1

    .line 548
    .line 549
    add-int/lit8 v2, v2, 0x1

    .line 550
    .line 551
    add-int/lit8 v4, v11, 0x1

    .line 552
    .line 553
    aget-object v11, v12, v11

    .line 554
    .line 555
    aput-object v11, v9, v2

    .line 556
    .line 557
    goto :goto_12

    .line 558
    :cond_1f
    :goto_14
    mul-int/lit8 v5, v5, 0x2

    .line 559
    .line 560
    aget-object v2, v12, v5

    .line 561
    .line 562
    instance-of v4, v2, Ljava/lang/reflect/Field;

    .line 563
    .line 564
    if-eqz v4, :cond_20

    .line 565
    .line 566
    check-cast v2, Ljava/lang/reflect/Field;

    .line 567
    .line 568
    :goto_15
    move/from16 v23, v5

    .line 569
    .line 570
    goto :goto_16

    .line 571
    :cond_20
    check-cast v2, Ljava/lang/String;

    .line 572
    .line 573
    invoke-static {v15, v2}, Lrn0;->t(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 574
    .line 575
    .line 576
    move-result-object v2

    .line 577
    aput-object v2, v12, v5

    .line 578
    .line 579
    goto :goto_15

    .line 580
    :goto_16
    invoke-virtual {v3, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 581
    .line 582
    .line 583
    move-result-wide v4

    .line 584
    long-to-int v2, v4

    .line 585
    add-int/lit8 v5, v23, 0x1

    .line 586
    .line 587
    aget-object v4, v12, v5

    .line 588
    .line 589
    move/from16 v23, v2

    .line 590
    .line 591
    instance-of v2, v4, Ljava/lang/reflect/Field;

    .line 592
    .line 593
    if-eqz v2, :cond_21

    .line 594
    .line 595
    check-cast v4, Ljava/lang/reflect/Field;

    .line 596
    .line 597
    goto :goto_17

    .line 598
    :cond_21
    check-cast v4, Ljava/lang/String;

    .line 599
    .line 600
    invoke-static {v15, v4}, Lrn0;->t(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 601
    .line 602
    .line 603
    move-result-object v4

    .line 604
    aput-object v4, v12, v5

    .line 605
    .line 606
    :goto_17
    invoke-virtual {v3, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 607
    .line 608
    .line 609
    move-result-wide v2

    .line 610
    long-to-int v2, v2

    .line 611
    move-object/from16 v26, v1

    .line 612
    .line 613
    move v1, v2

    .line 614
    move/from16 v24, v11

    .line 615
    .line 616
    move/from16 v2, v23

    .line 617
    .line 618
    move/from16 v4, v27

    .line 619
    .line 620
    const/4 v5, 0x0

    .line 621
    move/from16 v23, v7

    .line 622
    .line 623
    move v11, v8

    .line 624
    goto/16 :goto_23

    .line 625
    .line 626
    :cond_22
    move/from16 v28, v4

    .line 627
    .line 628
    add-int/lit8 v2, v11, 0x1

    .line 629
    .line 630
    aget-object v4, v12, v11

    .line 631
    .line 632
    check-cast v4, Ljava/lang/String;

    .line 633
    .line 634
    invoke-static {v15, v4}, Lrn0;->t(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 635
    .line 636
    .line 637
    move-result-object v4

    .line 638
    move/from16 v27, v2

    .line 639
    .line 640
    const/16 v2, 0x9

    .line 641
    .line 642
    if-eq v6, v2, :cond_23

    .line 643
    .line 644
    const/16 v2, 0x11

    .line 645
    .line 646
    if-ne v6, v2, :cond_24

    .line 647
    .line 648
    :cond_23
    move/from16 v23, v7

    .line 649
    .line 650
    const/4 v7, 0x1

    .line 651
    goto/16 :goto_1b

    .line 652
    .line 653
    :cond_24
    const/16 v2, 0x1b

    .line 654
    .line 655
    if-eq v6, v2, :cond_25

    .line 656
    .line 657
    const/16 v2, 0x31

    .line 658
    .line 659
    if-ne v6, v2, :cond_26

    .line 660
    .line 661
    :cond_25
    move/from16 v23, v7

    .line 662
    .line 663
    const/4 v7, 0x1

    .line 664
    goto :goto_1a

    .line 665
    :cond_26
    const/16 v2, 0xc

    .line 666
    .line 667
    if-eq v6, v2, :cond_2a

    .line 668
    .line 669
    const/16 v2, 0x1e

    .line 670
    .line 671
    if-eq v6, v2, :cond_2a

    .line 672
    .line 673
    const/16 v2, 0x2c

    .line 674
    .line 675
    if-ne v6, v2, :cond_27

    .line 676
    .line 677
    goto :goto_18

    .line 678
    :cond_27
    const/16 v2, 0x32

    .line 679
    .line 680
    if-ne v6, v2, :cond_29

    .line 681
    .line 682
    add-int/lit8 v2, v19, 0x1

    .line 683
    .line 684
    aput v18, v13, v19

    .line 685
    .line 686
    div-int/lit8 v19, v18, 0x3

    .line 687
    .line 688
    mul-int/lit8 v19, v19, 0x2

    .line 689
    .line 690
    add-int/lit8 v23, v11, 0x2

    .line 691
    .line 692
    aget-object v24, v12, v27

    .line 693
    .line 694
    aput-object v24, v9, v19

    .line 695
    .line 696
    move/from16 v24, v2

    .line 697
    .line 698
    and-int/lit16 v2, v8, 0x800

    .line 699
    .line 700
    if-eqz v2, :cond_28

    .line 701
    .line 702
    add-int/lit8 v19, v19, 0x1

    .line 703
    .line 704
    add-int/lit8 v2, v11, 0x3

    .line 705
    .line 706
    aget-object v11, v12, v23

    .line 707
    .line 708
    aput-object v11, v9, v19

    .line 709
    .line 710
    move/from16 v23, v7

    .line 711
    .line 712
    move v11, v8

    .line 713
    move/from16 v19, v24

    .line 714
    .line 715
    goto :goto_1d

    .line 716
    :cond_28
    move v11, v8

    .line 717
    move/from16 v2, v23

    .line 718
    .line 719
    move/from16 v19, v24

    .line 720
    .line 721
    move/from16 v23, v7

    .line 722
    .line 723
    goto :goto_1d

    .line 724
    :cond_29
    move/from16 v23, v7

    .line 725
    .line 726
    const/4 v7, 0x1

    .line 727
    goto :goto_1c

    .line 728
    :cond_2a
    :goto_18
    invoke-virtual {v0}, Lox0;->a()I

    .line 729
    .line 730
    .line 731
    move-result v2

    .line 732
    move/from16 v23, v7

    .line 733
    .line 734
    const/4 v7, 0x1

    .line 735
    if-eq v2, v7, :cond_2b

    .line 736
    .line 737
    and-int/lit16 v2, v8, 0x800

    .line 738
    .line 739
    if-eqz v2, :cond_2c

    .line 740
    .line 741
    :cond_2b
    div-int/lit8 v2, v18, 0x3

    .line 742
    .line 743
    mul-int/lit8 v2, v2, 0x2

    .line 744
    .line 745
    add-int/2addr v2, v7

    .line 746
    add-int/lit8 v11, v11, 0x2

    .line 747
    .line 748
    aget-object v21, v12, v27

    .line 749
    .line 750
    aput-object v21, v9, v2

    .line 751
    .line 752
    :goto_19
    move v2, v11

    .line 753
    move v11, v8

    .line 754
    goto :goto_1d

    .line 755
    :goto_1a
    div-int/lit8 v2, v18, 0x3

    .line 756
    .line 757
    mul-int/lit8 v2, v2, 0x2

    .line 758
    .line 759
    add-int/2addr v2, v7

    .line 760
    add-int/lit8 v11, v11, 0x2

    .line 761
    .line 762
    aget-object v21, v12, v27

    .line 763
    .line 764
    aput-object v21, v9, v2

    .line 765
    .line 766
    goto :goto_19

    .line 767
    :goto_1b
    div-int/lit8 v2, v18, 0x3

    .line 768
    .line 769
    mul-int/lit8 v2, v2, 0x2

    .line 770
    .line 771
    add-int/2addr v2, v7

    .line 772
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 773
    .line 774
    .line 775
    move-result-object v11

    .line 776
    aput-object v11, v9, v2

    .line 777
    .line 778
    :cond_2c
    :goto_1c
    move v11, v8

    .line 779
    move/from16 v2, v27

    .line 780
    .line 781
    :goto_1d
    invoke-virtual {v3, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 782
    .line 783
    .line 784
    move-result-wide v7

    .line 785
    long-to-int v4, v7

    .line 786
    and-int/lit16 v7, v11, 0x1000

    .line 787
    .line 788
    if-eqz v7, :cond_30

    .line 789
    .line 790
    const/16 v7, 0x11

    .line 791
    .line 792
    if-gt v6, v7, :cond_30

    .line 793
    .line 794
    add-int/lit8 v7, v5, 0x1

    .line 795
    .line 796
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    .line 797
    .line 798
    .line 799
    move-result v5

    .line 800
    const v8, 0xd800

    .line 801
    .line 802
    .line 803
    if-lt v5, v8, :cond_2e

    .line 804
    .line 805
    and-int/lit16 v5, v5, 0x1fff

    .line 806
    .line 807
    const/16 v20, 0xd

    .line 808
    .line 809
    :goto_1e
    add-int/lit8 v24, v7, 0x1

    .line 810
    .line 811
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 812
    .line 813
    .line 814
    move-result v7

    .line 815
    if-lt v7, v8, :cond_2d

    .line 816
    .line 817
    and-int/lit16 v7, v7, 0x1fff

    .line 818
    .line 819
    shl-int v7, v7, v20

    .line 820
    .line 821
    or-int/2addr v5, v7

    .line 822
    add-int/lit8 v20, v20, 0xd

    .line 823
    .line 824
    move/from16 v7, v24

    .line 825
    .line 826
    goto :goto_1e

    .line 827
    :cond_2d
    shl-int v7, v7, v20

    .line 828
    .line 829
    or-int/2addr v5, v7

    .line 830
    move/from16 v7, v24

    .line 831
    .line 832
    :cond_2e
    mul-int/lit8 v20, v23, 0x2

    .line 833
    .line 834
    div-int/lit8 v24, v5, 0x20

    .line 835
    .line 836
    add-int v24, v24, v20

    .line 837
    .line 838
    aget-object v8, v12, v24

    .line 839
    .line 840
    move-object/from16 v26, v1

    .line 841
    .line 842
    instance-of v1, v8, Ljava/lang/reflect/Field;

    .line 843
    .line 844
    if-eqz v1, :cond_2f

    .line 845
    .line 846
    check-cast v8, Ljava/lang/reflect/Field;

    .line 847
    .line 848
    :goto_1f
    move/from16 v24, v2

    .line 849
    .line 850
    goto :goto_20

    .line 851
    :cond_2f
    check-cast v8, Ljava/lang/String;

    .line 852
    .line 853
    invoke-static {v15, v8}, Lrn0;->t(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 854
    .line 855
    .line 856
    move-result-object v8

    .line 857
    aput-object v8, v12, v24

    .line 858
    .line 859
    goto :goto_1f

    .line 860
    :goto_20
    invoke-virtual {v3, v8}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 861
    .line 862
    .line 863
    move-result-wide v1

    .line 864
    long-to-int v1, v1

    .line 865
    rem-int/lit8 v5, v5, 0x20

    .line 866
    .line 867
    :goto_21
    move v2, v1

    .line 868
    goto :goto_22

    .line 869
    :cond_30
    move-object/from16 v26, v1

    .line 870
    .line 871
    move/from16 v24, v2

    .line 872
    .line 873
    const v1, 0xfffff

    .line 874
    .line 875
    .line 876
    move v7, v5

    .line 877
    const/4 v5, 0x0

    .line 878
    goto :goto_21

    .line 879
    :goto_22
    const/16 v1, 0x12

    .line 880
    .line 881
    if-lt v6, v1, :cond_31

    .line 882
    .line 883
    const/16 v1, 0x31

    .line 884
    .line 885
    if-gt v6, v1, :cond_31

    .line 886
    .line 887
    add-int/lit8 v1, v10, 0x1

    .line 888
    .line 889
    aput v4, v13, v10

    .line 890
    .line 891
    move v10, v1

    .line 892
    :cond_31
    move v1, v2

    .line 893
    move v2, v4

    .line 894
    move v4, v7

    .line 895
    :goto_23
    add-int/lit8 v3, v18, 0x1

    .line 896
    .line 897
    aput v28, v25, v18

    .line 898
    .line 899
    add-int/lit8 v7, v18, 0x2

    .line 900
    .line 901
    and-int/lit16 v8, v11, 0x200

    .line 902
    .line 903
    if-eqz v8, :cond_32

    .line 904
    .line 905
    const/high16 v8, 0x20000000

    .line 906
    .line 907
    goto :goto_24

    .line 908
    :cond_32
    const/4 v8, 0x0

    .line 909
    :goto_24
    move/from16 v27, v1

    .line 910
    .line 911
    and-int/lit16 v1, v11, 0x100

    .line 912
    .line 913
    if-eqz v1, :cond_33

    .line 914
    .line 915
    const/high16 v1, 0x10000000

    .line 916
    .line 917
    goto :goto_25

    .line 918
    :cond_33
    const/4 v1, 0x0

    .line 919
    :goto_25
    or-int/2addr v1, v8

    .line 920
    and-int/lit16 v8, v11, 0x800

    .line 921
    .line 922
    if-eqz v8, :cond_34

    .line 923
    .line 924
    const/high16 v8, -0x80000000

    .line 925
    .line 926
    goto :goto_26

    .line 927
    :cond_34
    const/4 v8, 0x0

    .line 928
    :goto_26
    or-int/2addr v1, v8

    .line 929
    shl-int/lit8 v6, v6, 0x14

    .line 930
    .line 931
    or-int/2addr v1, v6

    .line 932
    or-int/2addr v1, v2

    .line 933
    aput v1, v25, v3

    .line 934
    .line 935
    add-int/lit8 v18, v18, 0x3

    .line 936
    .line 937
    shl-int/lit8 v1, v5, 0x14

    .line 938
    .line 939
    or-int v1, v1, v27

    .line 940
    .line 941
    aput v1, v25, v7

    .line 942
    .line 943
    move/from16 v2, v22

    .line 944
    .line 945
    move/from16 v7, v23

    .line 946
    .line 947
    move/from16 v11, v24

    .line 948
    .line 949
    move-object/from16 v3, v25

    .line 950
    .line 951
    move-object/from16 v1, v26

    .line 952
    .line 953
    const v6, 0xd800

    .line 954
    .line 955
    .line 956
    goto/16 :goto_b

    .line 957
    .line 958
    :cond_35
    move-object/from16 v25, v3

    .line 959
    .line 960
    new-instance v1, Lrn0;

    .line 961
    .line 962
    iget-object v12, v0, Lox0;->a:Lh0;

    .line 963
    .line 964
    move-object/from16 v15, p1

    .line 965
    .line 966
    move-object/from16 v16, p2

    .line 967
    .line 968
    move-object/from16 v17, p3

    .line 969
    .line 970
    move-object/from16 v18, p4

    .line 971
    .line 972
    move-object/from16 v19, p5

    .line 973
    .line 974
    move-object v11, v9

    .line 975
    move-object/from16 v10, v25

    .line 976
    .line 977
    move-object v9, v1

    .line 978
    invoke-direct/range {v9 .. v19}, Lrn0;-><init>([I[Ljava/lang/Object;Lh0;[IILrp0;Lzi0;Lze1;Lg20;Lol0;)V

    .line 979
    .line 980
    .line 981
    return-object v9

    .line 982
    :cond_36
    invoke-static {}, Lz0;->a()V

    .line 983
    .line 984
    .line 985
    const/4 v0, 0x0

    .line 986
    return-object v0
.end method

.method public static r(JLjava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static s(JLjava/lang/Object;)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static t(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v3, "Field "

    .line 43
    .line 44
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p1, " for "

    .line 51
    .line 52
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, " not found. Known fields are "

    .line 59
    .line 60
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw v1
.end method

.method public static v(I)I
    .locals 1

    .line 1
    const/high16 v0, 0xff00000

    .line 2
    .line 3
    and-int/2addr p0, v0

    .line 4
    ushr-int/lit8 p0, p0, 0x14

    .line 5
    .line 6
    return p0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 11

    .line 1
    invoke-static {p1}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, Lrn0;->a:[I

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    if-ge v0, v2, :cond_4

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrn0;->w(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const v3, 0xfffff

    .line 21
    .line 22
    .line 23
    and-int v4, v2, v3

    .line 24
    .line 25
    int-to-long v7, v4

    .line 26
    aget v4, v1, v0

    .line 27
    .line 28
    invoke-static {v2}, Lrn0;->v(I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    packed-switch v2, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :pswitch_0
    invoke-virtual {p0, p1, v0, p2}, Lrn0;->p(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    :goto_1
    move-object v6, p1

    .line 40
    goto/16 :goto_2

    .line 41
    .line 42
    :pswitch_1
    invoke-virtual {p0, v4, p2, v0}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {p1, v7, v8, v2}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v2, v0, 0x2

    .line 56
    .line 57
    aget v1, v1, v2

    .line 58
    .line 59
    and-int/2addr v1, v3

    .line 60
    int-to-long v1, v1

    .line 61
    invoke-static {p1, v1, v2, v4}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :pswitch_2
    invoke-virtual {p0, p1, v0, p2}, Lrn0;->p(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :pswitch_3
    invoke-virtual {p0, v4, p2, v0}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_0

    .line 74
    .line 75
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {p1, v7, v8, v2}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v2, v0, 0x2

    .line 83
    .line 84
    aget v1, v1, v2

    .line 85
    .line 86
    and-int/2addr v1, v3

    .line 87
    int-to-long v1, v1

    .line 88
    invoke-static {p1, v1, v2, v4}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :pswitch_4
    sget-object v1, Lf31;->a:Ljava/lang/Class;

    .line 93
    .line 94
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iget-object v3, p0, Lrn0;->i:Lol0;

    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    .line 106
    .line 107
    check-cast v1, Lml0;

    .line 108
    .line 109
    check-cast v2, Lml0;

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-nez v3, :cond_2

    .line 116
    .line 117
    iget-boolean v3, v1, Lml0;->j:Z

    .line 118
    .line 119
    if-nez v3, :cond_1

    .line 120
    .line 121
    invoke-virtual {v1}, Lml0;->c()Lml0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    :cond_1
    invoke-virtual {v1}, Lml0;->b()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-nez v3, :cond_2

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Lml0;->putAll(Ljava/util/Map;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    invoke-static {p1, v7, v8, v1}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :pswitch_5
    iget-object v1, p0, Lrn0;->g:Lzi0;

    .line 142
    .line 143
    invoke-virtual {v1, p1, v7, v8, p2}, Lzi0;->b(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :pswitch_6
    invoke-virtual {p0, p1, v0, p2}, Lrn0;->o(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :pswitch_7
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_0

    .line 156
    .line 157
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 158
    .line 159
    .line 160
    move-result-wide v9

    .line 161
    sget-object v1, Lmf1;->c:Llf1;

    .line 162
    .line 163
    iget-object v5, v1, Llf1;->b:Lsun/misc/Unsafe;

    .line 164
    .line 165
    move-object v6, p1

    .line 166
    invoke-virtual/range {v5 .. v10}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_2

    .line 173
    .line 174
    :pswitch_8
    move-object v6, p1

    .line 175
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_3

    .line 180
    .line 181
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    goto/16 :goto_2

    .line 192
    .line 193
    :pswitch_9
    move-object v6, p1

    .line 194
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_3

    .line 199
    .line 200
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 201
    .line 202
    .line 203
    move-result-wide v9

    .line 204
    sget-object p1, Lmf1;->c:Llf1;

    .line 205
    .line 206
    iget-object v5, p1, Llf1;->b:Lsun/misc/Unsafe;

    .line 207
    .line 208
    invoke-virtual/range {v5 .. v10}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_2

    .line 215
    .line 216
    :pswitch_a
    move-object v6, p1

    .line 217
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_3

    .line 222
    .line 223
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_2

    .line 234
    .line 235
    :pswitch_b
    move-object v6, p1

    .line 236
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_3

    .line 241
    .line 242
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    goto/16 :goto_2

    .line 253
    .line 254
    :pswitch_c
    move-object v6, p1

    .line 255
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_3

    .line 260
    .line 261
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_2

    .line 272
    .line 273
    :pswitch_d
    move-object v6, p1

    .line 274
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_3

    .line 279
    .line 280
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {v6, v7, v8, p1}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    goto/16 :goto_2

    .line 291
    .line 292
    :pswitch_e
    move-object v6, p1

    .line 293
    invoke-virtual {p0, v6, v0, p2}, Lrn0;->o(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    goto/16 :goto_2

    .line 297
    .line 298
    :pswitch_f
    move-object v6, p1

    .line 299
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-eqz p1, :cond_3

    .line 304
    .line 305
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-static {v6, v7, v8, p1}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 313
    .line 314
    .line 315
    goto/16 :goto_2

    .line 316
    .line 317
    :pswitch_10
    move-object v6, p1

    .line 318
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-eqz p1, :cond_3

    .line 323
    .line 324
    sget-object p1, Lmf1;->c:Llf1;

    .line 325
    .line 326
    invoke-virtual {p1, v7, v8, p2}, Llf1;->a(JLjava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-virtual {p1, v6, v7, v8, v1}, Llf1;->e(Ljava/lang/Object;JZ)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_2

    .line 337
    .line 338
    :pswitch_11
    move-object v6, p1

    .line 339
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-eqz p1, :cond_3

    .line 344
    .line 345
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 353
    .line 354
    .line 355
    goto/16 :goto_2

    .line 356
    .line 357
    :pswitch_12
    move-object v6, p1

    .line 358
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    if-eqz p1, :cond_3

    .line 363
    .line 364
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 365
    .line 366
    .line 367
    move-result-wide v9

    .line 368
    sget-object p1, Lmf1;->c:Llf1;

    .line 369
    .line 370
    iget-object v5, p1, Llf1;->b:Lsun/misc/Unsafe;

    .line 371
    .line 372
    invoke-virtual/range {v5 .. v10}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 376
    .line 377
    .line 378
    goto :goto_2

    .line 379
    :pswitch_13
    move-object v6, p1

    .line 380
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result p1

    .line 384
    if-eqz p1, :cond_3

    .line 385
    .line 386
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    invoke-static {v6, v7, v8, p1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 394
    .line 395
    .line 396
    goto :goto_2

    .line 397
    :pswitch_14
    move-object v6, p1

    .line 398
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    if-eqz p1, :cond_3

    .line 403
    .line 404
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 405
    .line 406
    .line 407
    move-result-wide v9

    .line 408
    sget-object p1, Lmf1;->c:Llf1;

    .line 409
    .line 410
    iget-object v5, p1, Llf1;->b:Lsun/misc/Unsafe;

    .line 411
    .line 412
    invoke-virtual/range {v5 .. v10}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 416
    .line 417
    .line 418
    goto :goto_2

    .line 419
    :pswitch_15
    move-object v6, p1

    .line 420
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result p1

    .line 424
    if-eqz p1, :cond_3

    .line 425
    .line 426
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 427
    .line 428
    .line 429
    move-result-wide v9

    .line 430
    sget-object p1, Lmf1;->c:Llf1;

    .line 431
    .line 432
    iget-object v5, p1, Llf1;->b:Lsun/misc/Unsafe;

    .line 433
    .line 434
    invoke-virtual/range {v5 .. v10}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 438
    .line 439
    .line 440
    goto :goto_2

    .line 441
    :pswitch_16
    move-object v6, p1

    .line 442
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    move-result p1

    .line 446
    if-eqz p1, :cond_3

    .line 447
    .line 448
    sget-object p1, Lmf1;->c:Llf1;

    .line 449
    .line 450
    invoke-virtual {p1, v7, v8, p2}, Llf1;->d(JLjava/lang/Object;)F

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    invoke-virtual {p1, v6, v7, v8, v1}, Llf1;->h(Ljava/lang/Object;JF)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 458
    .line 459
    .line 460
    goto :goto_2

    .line 461
    :pswitch_17
    move-object v6, p1

    .line 462
    invoke-virtual {p0, v0, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result p1

    .line 466
    if-eqz p1, :cond_3

    .line 467
    .line 468
    sget-object v5, Lmf1;->c:Llf1;

    .line 469
    .line 470
    invoke-virtual {v5, v7, v8, p2}, Llf1;->c(JLjava/lang/Object;)D

    .line 471
    .line 472
    .line 473
    move-result-wide v9

    .line 474
    invoke-virtual/range {v5 .. v10}, Llf1;->g(Ljava/lang/Object;JD)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {p0, v0, v6}, Lrn0;->u(ILjava/lang/Object;)V

    .line 478
    .line 479
    .line 480
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x3

    .line 481
    .line 482
    move-object p1, v6

    .line 483
    goto/16 :goto_0

    .line 484
    .line 485
    :cond_4
    move-object v6, p1

    .line 486
    iget-object p0, p0, Lrn0;->h:Lze1;

    .line 487
    .line 488
    invoke-static {p0, v6, p2}, Lf31;->j(Lze1;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 489
    .line 490
    .line 491
    return-void

    .line 492
    :cond_5
    move-object v6, p1

    .line 493
    const-string p0, "Mutating immutable message: "

    .line 494
    .line 495
    invoke-static {v6, p0}, Lo40;->v(Ljava/lang/Object;Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    return-void

    .line 499
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)V
    .locals 9

    .line 1
    invoke-static {p1}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, Lia0;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lia0;

    .line 16
    .line 17
    const v2, 0x7fffffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lia0;->q(I)V

    .line 21
    .line 22
    .line 23
    iput v1, v0, Lh0;->memoizedHashCode:I

    .line 24
    .line 25
    invoke-virtual {v0}, Lia0;->n()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lrn0;->a:[I

    .line 29
    .line 30
    array-length v2, v0

    .line 31
    move v3, v1

    .line 32
    :goto_0
    if-ge v3, v2, :cond_5

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Lrn0;->w(I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const v5, 0xfffff

    .line 39
    .line 40
    .line 41
    and-int/2addr v5, v4

    .line 42
    int-to-long v5, v5

    .line 43
    invoke-static {v4}, Lrn0;->v(I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const/16 v7, 0x9

    .line 48
    .line 49
    sget-object v8, Lrn0;->k:Lsun/misc/Unsafe;

    .line 50
    .line 51
    if-eq v4, v7, :cond_3

    .line 52
    .line 53
    const/16 v7, 0x3c

    .line 54
    .line 55
    if-eq v4, v7, :cond_2

    .line 56
    .line 57
    const/16 v7, 0x44

    .line 58
    .line 59
    if-eq v4, v7, :cond_2

    .line 60
    .line 61
    packed-switch v4, :pswitch_data_0

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :pswitch_0
    invoke-virtual {v8, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    iget-object v7, p0, Lrn0;->i:Lol0;

    .line 72
    .line 73
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    move-object v7, v4

    .line 77
    check-cast v7, Lml0;

    .line 78
    .line 79
    iput-boolean v1, v7, Lml0;->j:Z

    .line 80
    .line 81
    invoke-virtual {v8, p1, v5, v6, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :pswitch_1
    iget-object v4, p0, Lrn0;->g:Lzi0;

    .line 86
    .line 87
    invoke-virtual {v4, v5, v6, p1}, Lzi0;->a(JLjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    aget v4, v0, v3

    .line 92
    .line 93
    invoke-virtual {p0, v4, p1, v3}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-eqz v4, :cond_4

    .line 98
    .line 99
    invoke-virtual {p0, v3}, Lrn0;->j(I)Lb31;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v8, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-interface {v4, v5}, Lb31;->b(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    :pswitch_2
    invoke-virtual {p0, v3, p1}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    if-eqz v4, :cond_4

    .line 116
    .line 117
    invoke-virtual {p0, v3}, Lrn0;->j(I)Lb31;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v8, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-interface {v4, v5}, Lb31;->b(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x3

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_5
    iget-object p0, p0, Lrn0;->h:Lze1;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    check-cast p1, Lia0;

    .line 137
    .line 138
    iget-object p0, p1, Lia0;->unknownFields:Lxe1;

    .line 139
    .line 140
    iget-boolean p1, p0, Lxe1;->e:Z

    .line 141
    .line 142
    if-eqz p1, :cond_6

    .line 143
    .line 144
    iput-boolean v1, p0, Lxe1;->e:Z

    .line 145
    .line 146
    :cond_6
    :goto_2
    return-void

    .line 147
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ljava/lang/Object;)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const v6, 0xfffff

    .line 6
    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    move v2, v6

    .line 10
    move v3, v7

    .line 11
    move v8, v3

    .line 12
    :goto_0
    iget v4, v0, Lrn0;->e:I

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    if-ge v8, v4, :cond_e

    .line 16
    .line 17
    iget-object v4, v0, Lrn0;->d:[I

    .line 18
    .line 19
    aget v4, v4, v8

    .line 20
    .line 21
    iget-object v9, v0, Lrn0;->a:[I

    .line 22
    .line 23
    aget v10, v9, v4

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Lrn0;->w(I)I

    .line 26
    .line 27
    .line 28
    move-result v11

    .line 29
    add-int/lit8 v12, v4, 0x2

    .line 30
    .line 31
    aget v9, v9, v12

    .line 32
    .line 33
    and-int v12, v9, v6

    .line 34
    .line 35
    ushr-int/lit8 v9, v9, 0x14

    .line 36
    .line 37
    shl-int/2addr v5, v9

    .line 38
    if-eq v12, v2, :cond_1

    .line 39
    .line 40
    if-eq v12, v6, :cond_0

    .line 41
    .line 42
    sget-object v2, Lrn0;->k:Lsun/misc/Unsafe;

    .line 43
    .line 44
    int-to-long v13, v12

    .line 45
    invoke-virtual {v2, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    :cond_0
    move v2, v4

    .line 50
    move v4, v3

    .line 51
    move v3, v12

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v15, v3

    .line 54
    move v3, v2

    .line 55
    move v2, v4

    .line 56
    move v4, v15

    .line 57
    :goto_1
    const/high16 v9, 0x10000000

    .line 58
    .line 59
    and-int/2addr v9, v11

    .line 60
    if-eqz v9, :cond_2

    .line 61
    .line 62
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    if-nez v9, :cond_2

    .line 67
    .line 68
    goto/16 :goto_3

    .line 69
    .line 70
    :cond_2
    invoke-static {v11}, Lrn0;->v(I)I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    const/16 v12, 0x9

    .line 75
    .line 76
    if-eq v9, v12, :cond_c

    .line 77
    .line 78
    const/16 v12, 0x11

    .line 79
    .line 80
    if-eq v9, v12, :cond_c

    .line 81
    .line 82
    const/16 v5, 0x1b

    .line 83
    .line 84
    if-eq v9, v5, :cond_9

    .line 85
    .line 86
    const/16 v5, 0x3c

    .line 87
    .line 88
    if-eq v9, v5, :cond_8

    .line 89
    .line 90
    const/16 v5, 0x44

    .line 91
    .line 92
    if-eq v9, v5, :cond_8

    .line 93
    .line 94
    const/16 v5, 0x31

    .line 95
    .line 96
    if-eq v9, v5, :cond_9

    .line 97
    .line 98
    const/16 v5, 0x32

    .line 99
    .line 100
    if-eq v9, v5, :cond_3

    .line 101
    .line 102
    goto/16 :goto_4

    .line 103
    .line 104
    :cond_3
    and-int v5, v11, v6

    .line 105
    .line 106
    int-to-long v9, v5

    .line 107
    invoke-static {v9, v10, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    iget-object v9, v0, Lrn0;->i:Lol0;

    .line 112
    .line 113
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    check-cast v5, Lml0;

    .line 117
    .line 118
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v9

    .line 122
    if-eqz v9, :cond_4

    .line 123
    .line 124
    goto/16 :goto_4

    .line 125
    .line 126
    :cond_4
    div-int/lit8 v2, v2, 0x3

    .line 127
    .line 128
    mul-int/lit8 v2, v2, 0x2

    .line 129
    .line 130
    iget-object v9, v0, Lrn0;->b:[Ljava/lang/Object;

    .line 131
    .line 132
    aget-object v2, v9, v2

    .line 133
    .line 134
    check-cast v2, Lkl0;

    .line 135
    .line 136
    iget-object v2, v2, Lkl0;->a:Lc9;

    .line 137
    .line 138
    iget-object v2, v2, Lc9;->l:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast v2, Lvk1;

    .line 141
    .line 142
    iget-object v2, v2, Lvk1;->j:Lxk1;

    .line 143
    .line 144
    sget-object v9, Lxk1;->r:Lxk1;

    .line 145
    .line 146
    if-eq v2, v9, :cond_5

    .line 147
    .line 148
    goto/16 :goto_4

    .line 149
    .line 150
    :cond_5
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const/4 v5, 0x0

    .line 159
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 160
    .line 161
    .line 162
    move-result v9

    .line 163
    if-eqz v9, :cond_d

    .line 164
    .line 165
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v9

    .line 169
    if-nez v5, :cond_7

    .line 170
    .line 171
    sget-object v5, Lcw0;->c:Lcw0;

    .line 172
    .line 173
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    move-result-object v10

    .line 177
    invoke-virtual {v5, v10}, Lcw0;->a(Ljava/lang/Class;)Lb31;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    :cond_7
    invoke-interface {v5, v9}, Lb31;->c(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v9

    .line 185
    if-nez v9, :cond_6

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_8
    invoke-virtual {v0, v10, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    if-eqz v5, :cond_d

    .line 193
    .line 194
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    and-int v5, v11, v6

    .line 199
    .line 200
    int-to-long v9, v5

    .line 201
    invoke-static {v9, v10, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-interface {v2, v5}, Lb31;->c(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-nez v2, :cond_d

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_9
    and-int v5, v11, v6

    .line 213
    .line 214
    int-to-long v9, v5

    .line 215
    invoke-static {v9, v10, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    check-cast v5, Ljava/util/List;

    .line 220
    .line 221
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    if-eqz v9, :cond_a

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_a
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    move v9, v7

    .line 233
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 234
    .line 235
    .line 236
    move-result v10

    .line 237
    if-ge v9, v10, :cond_d

    .line 238
    .line 239
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v10

    .line 243
    invoke-interface {v2, v10}, Lb31;->c(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v10

    .line 247
    if-nez v10, :cond_b

    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_b
    add-int/lit8 v9, v9, 0x1

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :cond_c
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    if-eqz v5, :cond_d

    .line 258
    .line 259
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    and-int v5, v11, v6

    .line 264
    .line 265
    int-to-long v9, v5

    .line 266
    invoke-static {v9, v10, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    invoke-interface {v2, v5}, Lb31;->c(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    if-nez v2, :cond_d

    .line 275
    .line 276
    :goto_3
    return v7

    .line 277
    :cond_d
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 278
    .line 279
    move v2, v3

    .line 280
    move v3, v4

    .line 281
    goto/16 :goto_0

    .line 282
    .line 283
    :cond_e
    return v5
.end method

.method public final d()Lia0;
    .locals 1

    .line 1
    iget-object v0, p0, Lrn0;->f:Lrp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrn0;->c:Lh0;

    .line 7
    .line 8
    check-cast p0, Lia0;

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    invoke-virtual {p0, v0}, Lia0;->j(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lia0;

    .line 16
    .line 17
    return-object p0
.end method

.method public final e(Lia0;)I
    .locals 11

    .line 1
    iget-object v0, p0, Lrn0;->a:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v2, v1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0, v2}, Lrn0;->w(I)I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    aget v5, v0, v2

    .line 13
    .line 14
    const v6, 0xfffff

    .line 15
    .line 16
    .line 17
    and-int/2addr v6, v4

    .line 18
    int-to-long v6, v6

    .line 19
    invoke-static {v4}, Lrn0;->v(I)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/16 v8, 0x4d5

    .line 24
    .line 25
    const/16 v9, 0x4cf

    .line 26
    .line 27
    const/16 v10, 0x25

    .line 28
    .line 29
    packed-switch v4, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    goto/16 :goto_4

    .line 33
    .line 34
    :pswitch_0
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    mul-int/lit8 v3, v3, 0x35

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    :goto_1
    add-int/2addr v4, v3

    .line 51
    move v3, v4

    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :pswitch_1
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-eqz v4, :cond_2

    .line 59
    .line 60
    mul-int/lit8 v3, v3, 0x35

    .line 61
    .line 62
    invoke-static {v6, v7, p1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    goto :goto_1

    .line 71
    :pswitch_2
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    mul-int/lit8 v3, v3, 0x35

    .line 78
    .line 79
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    goto :goto_1

    .line 84
    :pswitch_3
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_2

    .line 89
    .line 90
    mul-int/lit8 v3, v3, 0x35

    .line 91
    .line 92
    invoke-static {v6, v7, p1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v4

    .line 96
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    goto :goto_1

    .line 101
    :pswitch_4
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_2

    .line 106
    .line 107
    mul-int/lit8 v3, v3, 0x35

    .line 108
    .line 109
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    goto :goto_1

    .line 114
    :pswitch_5
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz v4, :cond_2

    .line 119
    .line 120
    mul-int/lit8 v3, v3, 0x35

    .line 121
    .line 122
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    goto :goto_1

    .line 127
    :pswitch_6
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_2

    .line 132
    .line 133
    mul-int/lit8 v3, v3, 0x35

    .line 134
    .line 135
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    goto :goto_1

    .line 140
    :pswitch_7
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    if-eqz v4, :cond_2

    .line 145
    .line 146
    mul-int/lit8 v3, v3, 0x35

    .line 147
    .line 148
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    goto :goto_1

    .line 157
    :pswitch_8
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-eqz v4, :cond_2

    .line 162
    .line 163
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    mul-int/lit8 v3, v3, 0x35

    .line 168
    .line 169
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    goto :goto_1

    .line 174
    :pswitch_9
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-eqz v4, :cond_2

    .line 179
    .line 180
    mul-int/lit8 v3, v3, 0x35

    .line 181
    .line 182
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    check-cast v4, Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    goto/16 :goto_1

    .line 193
    .line 194
    :pswitch_a
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    if-eqz v4, :cond_2

    .line 199
    .line 200
    mul-int/lit8 v3, v3, 0x35

    .line 201
    .line 202
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Ljava/lang/Boolean;

    .line 207
    .line 208
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    sget-object v5, Lkf0;->a:Ljava/nio/charset/Charset;

    .line 213
    .line 214
    if-eqz v4, :cond_0

    .line 215
    .line 216
    :goto_2
    move v8, v9

    .line 217
    :cond_0
    add-int/2addr v8, v3

    .line 218
    move v3, v8

    .line 219
    goto/16 :goto_4

    .line 220
    .line 221
    :pswitch_b
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    if-eqz v4, :cond_2

    .line 226
    .line 227
    mul-int/lit8 v3, v3, 0x35

    .line 228
    .line 229
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :pswitch_c
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    if-eqz v4, :cond_2

    .line 240
    .line 241
    mul-int/lit8 v3, v3, 0x35

    .line 242
    .line 243
    invoke-static {v6, v7, p1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 244
    .line 245
    .line 246
    move-result-wide v4

    .line 247
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 248
    .line 249
    .line 250
    move-result v4

    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :pswitch_d
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    if-eqz v4, :cond_2

    .line 258
    .line 259
    mul-int/lit8 v3, v3, 0x35

    .line 260
    .line 261
    invoke-static {v6, v7, p1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    goto/16 :goto_1

    .line 266
    .line 267
    :pswitch_e
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 268
    .line 269
    .line 270
    move-result v4

    .line 271
    if-eqz v4, :cond_2

    .line 272
    .line 273
    mul-int/lit8 v3, v3, 0x35

    .line 274
    .line 275
    invoke-static {v6, v7, p1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 276
    .line 277
    .line 278
    move-result-wide v4

    .line 279
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 280
    .line 281
    .line 282
    move-result v4

    .line 283
    goto/16 :goto_1

    .line 284
    .line 285
    :pswitch_f
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    if-eqz v4, :cond_2

    .line 290
    .line 291
    mul-int/lit8 v3, v3, 0x35

    .line 292
    .line 293
    invoke-static {v6, v7, p1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 294
    .line 295
    .line 296
    move-result-wide v4

    .line 297
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    goto/16 :goto_1

    .line 302
    .line 303
    :pswitch_10
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 304
    .line 305
    .line 306
    move-result v4

    .line 307
    if-eqz v4, :cond_2

    .line 308
    .line 309
    mul-int/lit8 v3, v3, 0x35

    .line 310
    .line 311
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v4

    .line 315
    check-cast v4, Ljava/lang/Float;

    .line 316
    .line 317
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 318
    .line 319
    .line 320
    move-result v4

    .line 321
    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    goto/16 :goto_1

    .line 326
    .line 327
    :pswitch_11
    invoke-virtual {p0, v5, p1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 328
    .line 329
    .line 330
    move-result v4

    .line 331
    if-eqz v4, :cond_2

    .line 332
    .line 333
    mul-int/lit8 v3, v3, 0x35

    .line 334
    .line 335
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    check-cast v4, Ljava/lang/Double;

    .line 340
    .line 341
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 342
    .line 343
    .line 344
    move-result-wide v4

    .line 345
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 346
    .line 347
    .line 348
    move-result-wide v4

    .line 349
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 350
    .line 351
    .line 352
    move-result v4

    .line 353
    goto/16 :goto_1

    .line 354
    .line 355
    :pswitch_12
    mul-int/lit8 v3, v3, 0x35

    .line 356
    .line 357
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    goto/16 :goto_1

    .line 366
    .line 367
    :pswitch_13
    mul-int/lit8 v3, v3, 0x35

    .line 368
    .line 369
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v4

    .line 373
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 374
    .line 375
    .line 376
    move-result v4

    .line 377
    goto/16 :goto_1

    .line 378
    .line 379
    :pswitch_14
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    if-eqz v4, :cond_1

    .line 384
    .line 385
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 386
    .line 387
    .line 388
    move-result v10

    .line 389
    :cond_1
    :goto_3
    mul-int/lit8 v3, v3, 0x35

    .line 390
    .line 391
    add-int/2addr v3, v10

    .line 392
    goto/16 :goto_4

    .line 393
    .line 394
    :pswitch_15
    mul-int/lit8 v3, v3, 0x35

    .line 395
    .line 396
    invoke-static {v6, v7, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 397
    .line 398
    .line 399
    move-result-wide v4

    .line 400
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    goto/16 :goto_1

    .line 405
    .line 406
    :pswitch_16
    mul-int/lit8 v3, v3, 0x35

    .line 407
    .line 408
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 409
    .line 410
    .line 411
    move-result v4

    .line 412
    goto/16 :goto_1

    .line 413
    .line 414
    :pswitch_17
    mul-int/lit8 v3, v3, 0x35

    .line 415
    .line 416
    invoke-static {v6, v7, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 417
    .line 418
    .line 419
    move-result-wide v4

    .line 420
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 421
    .line 422
    .line 423
    move-result v4

    .line 424
    goto/16 :goto_1

    .line 425
    .line 426
    :pswitch_18
    mul-int/lit8 v3, v3, 0x35

    .line 427
    .line 428
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    goto/16 :goto_1

    .line 433
    .line 434
    :pswitch_19
    mul-int/lit8 v3, v3, 0x35

    .line 435
    .line 436
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 437
    .line 438
    .line 439
    move-result v4

    .line 440
    goto/16 :goto_1

    .line 441
    .line 442
    :pswitch_1a
    mul-int/lit8 v3, v3, 0x35

    .line 443
    .line 444
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 445
    .line 446
    .line 447
    move-result v4

    .line 448
    goto/16 :goto_1

    .line 449
    .line 450
    :pswitch_1b
    mul-int/lit8 v3, v3, 0x35

    .line 451
    .line 452
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 457
    .line 458
    .line 459
    move-result v4

    .line 460
    goto/16 :goto_1

    .line 461
    .line 462
    :pswitch_1c
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    if-eqz v4, :cond_1

    .line 467
    .line 468
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 469
    .line 470
    .line 471
    move-result v10

    .line 472
    goto :goto_3

    .line 473
    :pswitch_1d
    mul-int/lit8 v3, v3, 0x35

    .line 474
    .line 475
    invoke-static {v6, v7, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    check-cast v4, Ljava/lang/String;

    .line 480
    .line 481
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 482
    .line 483
    .line 484
    move-result v4

    .line 485
    goto/16 :goto_1

    .line 486
    .line 487
    :pswitch_1e
    mul-int/lit8 v3, v3, 0x35

    .line 488
    .line 489
    sget-object v4, Lmf1;->c:Llf1;

    .line 490
    .line 491
    invoke-virtual {v4, v6, v7, p1}, Llf1;->a(JLjava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result v4

    .line 495
    sget-object v5, Lkf0;->a:Ljava/nio/charset/Charset;

    .line 496
    .line 497
    if-eqz v4, :cond_0

    .line 498
    .line 499
    goto/16 :goto_2

    .line 500
    .line 501
    :pswitch_1f
    mul-int/lit8 v3, v3, 0x35

    .line 502
    .line 503
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 504
    .line 505
    .line 506
    move-result v4

    .line 507
    goto/16 :goto_1

    .line 508
    .line 509
    :pswitch_20
    mul-int/lit8 v3, v3, 0x35

    .line 510
    .line 511
    invoke-static {v6, v7, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 512
    .line 513
    .line 514
    move-result-wide v4

    .line 515
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 516
    .line 517
    .line 518
    move-result v4

    .line 519
    goto/16 :goto_1

    .line 520
    .line 521
    :pswitch_21
    mul-int/lit8 v3, v3, 0x35

    .line 522
    .line 523
    invoke-static {v6, v7, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 524
    .line 525
    .line 526
    move-result v4

    .line 527
    goto/16 :goto_1

    .line 528
    .line 529
    :pswitch_22
    mul-int/lit8 v3, v3, 0x35

    .line 530
    .line 531
    invoke-static {v6, v7, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 532
    .line 533
    .line 534
    move-result-wide v4

    .line 535
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 536
    .line 537
    .line 538
    move-result v4

    .line 539
    goto/16 :goto_1

    .line 540
    .line 541
    :pswitch_23
    mul-int/lit8 v3, v3, 0x35

    .line 542
    .line 543
    invoke-static {v6, v7, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 544
    .line 545
    .line 546
    move-result-wide v4

    .line 547
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 548
    .line 549
    .line 550
    move-result v4

    .line 551
    goto/16 :goto_1

    .line 552
    .line 553
    :pswitch_24
    mul-int/lit8 v3, v3, 0x35

    .line 554
    .line 555
    sget-object v4, Lmf1;->c:Llf1;

    .line 556
    .line 557
    invoke-virtual {v4, v6, v7, p1}, Llf1;->d(JLjava/lang/Object;)F

    .line 558
    .line 559
    .line 560
    move-result v4

    .line 561
    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 562
    .line 563
    .line 564
    move-result v4

    .line 565
    goto/16 :goto_1

    .line 566
    .line 567
    :pswitch_25
    mul-int/lit8 v3, v3, 0x35

    .line 568
    .line 569
    sget-object v4, Lmf1;->c:Llf1;

    .line 570
    .line 571
    invoke-virtual {v4, v6, v7, p1}, Llf1;->c(JLjava/lang/Object;)D

    .line 572
    .line 573
    .line 574
    move-result-wide v4

    .line 575
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 576
    .line 577
    .line 578
    move-result-wide v4

    .line 579
    invoke-static {v4, v5}, Lkf0;->a(J)I

    .line 580
    .line 581
    .line 582
    move-result v4

    .line 583
    goto/16 :goto_1

    .line 584
    .line 585
    :cond_2
    :goto_4
    add-int/lit8 v2, v2, 0x3

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :cond_3
    mul-int/lit8 v3, v3, 0x35

    .line 590
    .line 591
    iget-object p0, p0, Lrn0;->h:Lze1;

    .line 592
    .line 593
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 594
    .line 595
    .line 596
    iget-object p0, p1, Lia0;->unknownFields:Lxe1;

    .line 597
    .line 598
    invoke-virtual {p0}, Lxe1;->hashCode()I

    .line 599
    .line 600
    .line 601
    move-result p0

    .line 602
    add-int/2addr p0, v3

    .line 603
    return p0

    .line 604
    nop

    .line 605
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Lia0;)I
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const v7, 0xfffff

    .line 6
    .line 7
    .line 8
    move v3, v7

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v8, 0x0

    .line 12
    :goto_0
    iget-object v5, v0, Lrn0;->a:[I

    .line 13
    .line 14
    array-length v9, v5

    .line 15
    if-ge v2, v9, :cond_26

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lrn0;->w(I)I

    .line 18
    .line 19
    .line 20
    move-result v9

    .line 21
    invoke-static {v9}, Lrn0;->v(I)I

    .line 22
    .line 23
    .line 24
    move-result v10

    .line 25
    aget v11, v5, v2

    .line 26
    .line 27
    add-int/lit8 v12, v2, 0x2

    .line 28
    .line 29
    aget v5, v5, v12

    .line 30
    .line 31
    and-int v12, v5, v7

    .line 32
    .line 33
    const/16 v13, 0x11

    .line 34
    .line 35
    const/4 v14, 0x1

    .line 36
    sget-object v15, Lrn0;->k:Lsun/misc/Unsafe;

    .line 37
    .line 38
    if-gt v10, v13, :cond_2

    .line 39
    .line 40
    if-eq v12, v3, :cond_1

    .line 41
    .line 42
    if-ne v12, v7, :cond_0

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    int-to-long v3, v12

    .line 47
    invoke-virtual {v15, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    move v4, v3

    .line 52
    :goto_1
    move v3, v12

    .line 53
    :cond_1
    ushr-int/lit8 v5, v5, 0x14

    .line 54
    .line 55
    shl-int v5, v14, v5

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_2
    const/4 v5, 0x0

    .line 59
    :goto_2
    and-int/2addr v9, v7

    .line 60
    int-to-long v12, v9

    .line 61
    sget-object v9, Ly20;->k:Ly20;

    .line 62
    .line 63
    iget v9, v9, Ly20;->j:I

    .line 64
    .line 65
    if-lt v10, v9, :cond_3

    .line 66
    .line 67
    sget-object v9, Ly20;->l:Ly20;

    .line 68
    .line 69
    iget v9, v9, Ly20;->j:I

    .line 70
    .line 71
    :cond_3
    const/16 v9, 0x3f

    .line 72
    .line 73
    const/16 v16, 0x2

    .line 74
    .line 75
    const/16 v17, 0x4

    .line 76
    .line 77
    const/16 v18, 0x8

    .line 78
    .line 79
    packed-switch v10, :pswitch_data_0

    .line 80
    .line 81
    .line 82
    goto/16 :goto_2a

    .line 83
    .line 84
    :pswitch_0
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_25

    .line 89
    .line 90
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    check-cast v5, Lh0;

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    invoke-static {v11}, Lxk;->c(I)I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    mul-int/lit8 v10, v10, 0x2

    .line 105
    .line 106
    invoke-virtual {v5, v9}, Lh0;->g(Lb31;)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    add-int/2addr v5, v10

    .line 111
    :goto_3
    add-int/2addr v8, v5

    .line 112
    goto/16 :goto_2a

    .line 113
    .line 114
    :pswitch_1
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_25

    .line 119
    .line 120
    invoke-static {v12, v13, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v12

    .line 124
    invoke-static {v11}, Lxk;->c(I)I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    shl-long v10, v12, v14

    .line 129
    .line 130
    shr-long/2addr v12, v9

    .line 131
    xor-long v9, v10, v12

    .line 132
    .line 133
    invoke-static {v9, v10}, Lxk;->e(J)I

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    :goto_4
    add-int/2addr v9, v5

    .line 138
    add-int/2addr v8, v9

    .line 139
    goto/16 :goto_2a

    .line 140
    .line 141
    :pswitch_2
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    if-eqz v5, :cond_25

    .line 146
    .line 147
    invoke-static {v12, v13, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    invoke-static {v11}, Lxk;->c(I)I

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    shl-int/lit8 v10, v5, 0x1

    .line 156
    .line 157
    shr-int/lit8 v5, v5, 0x1f

    .line 158
    .line 159
    xor-int/2addr v5, v10

    .line 160
    invoke-static {v5}, Lxk;->d(I)I

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    :goto_5
    add-int/2addr v5, v9

    .line 165
    goto :goto_3

    .line 166
    :pswitch_3
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-eqz v5, :cond_25

    .line 171
    .line 172
    invoke-static {v11}, Lxk;->c(I)I

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    :goto_6
    add-int/lit8 v5, v5, 0x8

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :pswitch_4
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_25

    .line 184
    .line 185
    invoke-static {v11}, Lxk;->c(I)I

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    :goto_7
    add-int/lit8 v5, v5, 0x4

    .line 190
    .line 191
    goto :goto_3

    .line 192
    :pswitch_5
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-eqz v5, :cond_25

    .line 197
    .line 198
    invoke-static {v12, v13, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    invoke-static {v11}, Lxk;->c(I)I

    .line 203
    .line 204
    .line 205
    move-result v9

    .line 206
    invoke-static {v5}, Lxk;->a(I)I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    goto :goto_5

    .line 211
    :pswitch_6
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    if-eqz v5, :cond_25

    .line 216
    .line 217
    invoke-static {v12, v13, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    invoke-static {v11}, Lxk;->c(I)I

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    invoke-static {v5}, Lxk;->d(I)I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    goto :goto_5

    .line 230
    :pswitch_7
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    if-eqz v5, :cond_25

    .line 235
    .line 236
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    check-cast v5, Lrh;

    .line 241
    .line 242
    invoke-static {v11}, Lxk;->c(I)I

    .line 243
    .line 244
    .line 245
    move-result v9

    .line 246
    invoke-virtual {v5}, Lrh;->size()I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    invoke-static {v5, v5, v9, v8}, Loq;->c(IIII)I

    .line 251
    .line 252
    .line 253
    move-result v8

    .line 254
    goto/16 :goto_2a

    .line 255
    .line 256
    :pswitch_8
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    if-eqz v5, :cond_25

    .line 261
    .line 262
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 267
    .line 268
    .line 269
    move-result-object v9

    .line 270
    sget-object v10, Lf31;->a:Ljava/lang/Class;

    .line 271
    .line 272
    check-cast v5, Lh0;

    .line 273
    .line 274
    invoke-static {v11}, Lxk;->c(I)I

    .line 275
    .line 276
    .line 277
    move-result v10

    .line 278
    invoke-virtual {v5, v9}, Lh0;->g(Lb31;)I

    .line 279
    .line 280
    .line 281
    move-result v5

    .line 282
    invoke-static {v5, v5, v10, v8}, Loq;->c(IIII)I

    .line 283
    .line 284
    .line 285
    move-result v8

    .line 286
    goto/16 :goto_2a

    .line 287
    .line 288
    :pswitch_9
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    if-eqz v5, :cond_25

    .line 293
    .line 294
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v5

    .line 298
    instance-of v9, v5, Lrh;

    .line 299
    .line 300
    if-eqz v9, :cond_4

    .line 301
    .line 302
    check-cast v5, Lrh;

    .line 303
    .line 304
    invoke-static {v11}, Lxk;->c(I)I

    .line 305
    .line 306
    .line 307
    move-result v9

    .line 308
    invoke-virtual {v5}, Lrh;->size()I

    .line 309
    .line 310
    .line 311
    move-result v5

    .line 312
    invoke-static {v5, v5, v9, v8}, Loq;->c(IIII)I

    .line 313
    .line 314
    .line 315
    move-result v5

    .line 316
    :goto_8
    move v8, v5

    .line 317
    goto/16 :goto_2a

    .line 318
    .line 319
    :cond_4
    check-cast v5, Ljava/lang/String;

    .line 320
    .line 321
    invoke-static {v11}, Lxk;->c(I)I

    .line 322
    .line 323
    .line 324
    move-result v9

    .line 325
    invoke-static {v5}, Lxk;->b(Ljava/lang/String;)I

    .line 326
    .line 327
    .line 328
    move-result v5

    .line 329
    add-int/2addr v5, v9

    .line 330
    add-int/2addr v5, v8

    .line 331
    goto :goto_8

    .line 332
    :pswitch_a
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    if-eqz v5, :cond_25

    .line 337
    .line 338
    invoke-static {v11}, Lxk;->c(I)I

    .line 339
    .line 340
    .line 341
    move-result v5

    .line 342
    add-int/2addr v5, v14

    .line 343
    goto/16 :goto_3

    .line 344
    .line 345
    :pswitch_b
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 346
    .line 347
    .line 348
    move-result v5

    .line 349
    if-eqz v5, :cond_25

    .line 350
    .line 351
    invoke-static {v11}, Lxk;->c(I)I

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    goto/16 :goto_7

    .line 356
    .line 357
    :pswitch_c
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 358
    .line 359
    .line 360
    move-result v5

    .line 361
    if-eqz v5, :cond_25

    .line 362
    .line 363
    invoke-static {v11}, Lxk;->c(I)I

    .line 364
    .line 365
    .line 366
    move-result v5

    .line 367
    goto/16 :goto_6

    .line 368
    .line 369
    :pswitch_d
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 370
    .line 371
    .line 372
    move-result v5

    .line 373
    if-eqz v5, :cond_25

    .line 374
    .line 375
    invoke-static {v12, v13, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 376
    .line 377
    .line 378
    move-result v5

    .line 379
    invoke-static {v11}, Lxk;->c(I)I

    .line 380
    .line 381
    .line 382
    move-result v9

    .line 383
    invoke-static {v5}, Lxk;->a(I)I

    .line 384
    .line 385
    .line 386
    move-result v5

    .line 387
    goto/16 :goto_5

    .line 388
    .line 389
    :pswitch_e
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 390
    .line 391
    .line 392
    move-result v5

    .line 393
    if-eqz v5, :cond_25

    .line 394
    .line 395
    invoke-static {v12, v13, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 396
    .line 397
    .line 398
    move-result-wide v9

    .line 399
    invoke-static {v11}, Lxk;->c(I)I

    .line 400
    .line 401
    .line 402
    move-result v5

    .line 403
    invoke-static {v9, v10}, Lxk;->e(J)I

    .line 404
    .line 405
    .line 406
    move-result v9

    .line 407
    goto/16 :goto_4

    .line 408
    .line 409
    :pswitch_f
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 410
    .line 411
    .line 412
    move-result v5

    .line 413
    if-eqz v5, :cond_25

    .line 414
    .line 415
    invoke-static {v12, v13, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 416
    .line 417
    .line 418
    move-result-wide v9

    .line 419
    invoke-static {v11}, Lxk;->c(I)I

    .line 420
    .line 421
    .line 422
    move-result v5

    .line 423
    invoke-static {v9, v10}, Lxk;->e(J)I

    .line 424
    .line 425
    .line 426
    move-result v9

    .line 427
    goto/16 :goto_4

    .line 428
    .line 429
    :pswitch_10
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 430
    .line 431
    .line 432
    move-result v5

    .line 433
    if-eqz v5, :cond_25

    .line 434
    .line 435
    invoke-static {v11}, Lxk;->c(I)I

    .line 436
    .line 437
    .line 438
    move-result v5

    .line 439
    goto/16 :goto_7

    .line 440
    .line 441
    :pswitch_11
    invoke-virtual {v0, v11, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 442
    .line 443
    .line 444
    move-result v5

    .line 445
    if-eqz v5, :cond_25

    .line 446
    .line 447
    invoke-static {v11}, Lxk;->c(I)I

    .line 448
    .line 449
    .line 450
    move-result v5

    .line 451
    goto/16 :goto_6

    .line 452
    .line 453
    :pswitch_12
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    move-result-object v5

    .line 457
    div-int/lit8 v10, v2, 0x3

    .line 458
    .line 459
    mul-int/lit8 v10, v10, 0x2

    .line 460
    .line 461
    iget-object v12, v0, Lrn0;->b:[Ljava/lang/Object;

    .line 462
    .line 463
    aget-object v10, v12, v10

    .line 464
    .line 465
    iget-object v12, v0, Lrn0;->i:Lol0;

    .line 466
    .line 467
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 468
    .line 469
    .line 470
    check-cast v5, Lml0;

    .line 471
    .line 472
    check-cast v10, Lkl0;

    .line 473
    .line 474
    invoke-virtual {v5}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 475
    .line 476
    .line 477
    move-result v12

    .line 478
    if-eqz v12, :cond_6

    .line 479
    .line 480
    const/4 v12, 0x0

    .line 481
    :cond_5
    move/from16 v22, v3

    .line 482
    .line 483
    move/from16 v23, v4

    .line 484
    .line 485
    goto/16 :goto_12

    .line 486
    .line 487
    :cond_6
    invoke-virtual {v5}, Lml0;->entrySet()Ljava/util/Set;

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 492
    .line 493
    .line 494
    move-result-object v5

    .line 495
    const/4 v12, 0x0

    .line 496
    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 497
    .line 498
    .line 499
    move-result v13

    .line 500
    if-eqz v13, :cond_5

    .line 501
    .line 502
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v13

    .line 506
    check-cast v13, Ljava/util/Map$Entry;

    .line 507
    .line 508
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v15

    .line 512
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    move-result-object v13

    .line 516
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 517
    .line 518
    .line 519
    invoke-static {v11}, Lxk;->c(I)I

    .line 520
    .line 521
    .line 522
    move-result v6

    .line 523
    iget-object v7, v10, Lkl0;->a:Lc9;

    .line 524
    .line 525
    move/from16 v19, v9

    .line 526
    .line 527
    iget-object v9, v7, Lc9;->k:Ljava/lang/Object;

    .line 528
    .line 529
    check-cast v9, Lvk1;

    .line 530
    .line 531
    sget v20, Lw20;->c:I

    .line 532
    .line 533
    invoke-static {v14}, Lxk;->c(I)I

    .line 534
    .line 535
    .line 536
    move-result v20

    .line 537
    move/from16 v21, v14

    .line 538
    .line 539
    sget-object v14, Lvk1;->n:Lpk1;

    .line 540
    .line 541
    if-ne v9, v14, :cond_7

    .line 542
    .line 543
    mul-int/lit8 v20, v20, 0x2

    .line 544
    .line 545
    :cond_7
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    .line 546
    .line 547
    .line 548
    move-result v9

    .line 549
    move/from16 v22, v3

    .line 550
    .line 551
    const-string v3, "There is no way to get here, but the compiler thinks otherwise."

    .line 552
    .line 553
    move/from16 v23, v4

    .line 554
    .line 555
    const/4 v4, 0x0

    .line 556
    packed-switch v9, :pswitch_data_1

    .line 557
    .line 558
    .line 559
    new-instance v0, Ljava/lang/RuntimeException;

    .line 560
    .line 561
    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    throw v0

    .line 565
    :pswitch_13
    check-cast v15, Ljava/lang/Long;

    .line 566
    .line 567
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 568
    .line 569
    .line 570
    move-result-wide v24

    .line 571
    shl-long v26, v24, v21

    .line 572
    .line 573
    shr-long v24, v24, v19

    .line 574
    .line 575
    xor-long v24, v26, v24

    .line 576
    .line 577
    invoke-static/range {v24 .. v25}, Lxk;->e(J)I

    .line 578
    .line 579
    .line 580
    move-result v9

    .line 581
    goto/16 :goto_d

    .line 582
    .line 583
    :pswitch_14
    check-cast v15, Ljava/lang/Integer;

    .line 584
    .line 585
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 586
    .line 587
    .line 588
    move-result v9

    .line 589
    shl-int/lit8 v15, v9, 0x1

    .line 590
    .line 591
    shr-int/lit8 v9, v9, 0x1f

    .line 592
    .line 593
    xor-int/2addr v9, v15

    .line 594
    invoke-static {v9}, Lxk;->d(I)I

    .line 595
    .line 596
    .line 597
    move-result v9

    .line 598
    goto/16 :goto_d

    .line 599
    .line 600
    :pswitch_15
    check-cast v15, Ljava/lang/Long;

    .line 601
    .line 602
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 603
    .line 604
    .line 605
    :goto_a
    move/from16 v9, v18

    .line 606
    .line 607
    goto/16 :goto_d

    .line 608
    .line 609
    :pswitch_16
    check-cast v15, Ljava/lang/Integer;

    .line 610
    .line 611
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 612
    .line 613
    .line 614
    :goto_b
    move/from16 v9, v17

    .line 615
    .line 616
    goto/16 :goto_d

    .line 617
    .line 618
    :pswitch_17
    instance-of v9, v15, Lx9;

    .line 619
    .line 620
    if-eqz v9, :cond_8

    .line 621
    .line 622
    check-cast v15, Lx9;

    .line 623
    .line 624
    iget v9, v15, Lx9;->j:I

    .line 625
    .line 626
    invoke-static {v9}, Lxk;->a(I)I

    .line 627
    .line 628
    .line 629
    move-result v9

    .line 630
    goto/16 :goto_d

    .line 631
    .line 632
    :cond_8
    check-cast v15, Ljava/lang/Integer;

    .line 633
    .line 634
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 635
    .line 636
    .line 637
    move-result v9

    .line 638
    invoke-static {v9}, Lxk;->a(I)I

    .line 639
    .line 640
    .line 641
    move-result v9

    .line 642
    goto/16 :goto_d

    .line 643
    .line 644
    :pswitch_18
    check-cast v15, Ljava/lang/Integer;

    .line 645
    .line 646
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 647
    .line 648
    .line 649
    move-result v9

    .line 650
    invoke-static {v9}, Lxk;->d(I)I

    .line 651
    .line 652
    .line 653
    move-result v9

    .line 654
    goto/16 :goto_d

    .line 655
    .line 656
    :pswitch_19
    instance-of v9, v15, Lrh;

    .line 657
    .line 658
    if-eqz v9, :cond_9

    .line 659
    .line 660
    check-cast v15, Lrh;

    .line 661
    .line 662
    invoke-virtual {v15}, Lrh;->size()I

    .line 663
    .line 664
    .line 665
    move-result v9

    .line 666
    invoke-static {v9}, Lxk;->d(I)I

    .line 667
    .line 668
    .line 669
    move-result v15

    .line 670
    :goto_c
    add-int/2addr v9, v15

    .line 671
    goto/16 :goto_d

    .line 672
    .line 673
    :cond_9
    check-cast v15, [B

    .line 674
    .line 675
    array-length v9, v15

    .line 676
    invoke-static {v9}, Lxk;->d(I)I

    .line 677
    .line 678
    .line 679
    move-result v15

    .line 680
    goto :goto_c

    .line 681
    :pswitch_1a
    check-cast v15, Lh0;

    .line 682
    .line 683
    check-cast v15, Lia0;

    .line 684
    .line 685
    invoke-virtual {v15, v4}, Lia0;->g(Lb31;)I

    .line 686
    .line 687
    .line 688
    move-result v9

    .line 689
    invoke-static {v9}, Lxk;->d(I)I

    .line 690
    .line 691
    .line 692
    move-result v15

    .line 693
    goto :goto_c

    .line 694
    :pswitch_1b
    check-cast v15, Lh0;

    .line 695
    .line 696
    check-cast v15, Lia0;

    .line 697
    .line 698
    invoke-virtual {v15, v4}, Lia0;->g(Lb31;)I

    .line 699
    .line 700
    .line 701
    move-result v9

    .line 702
    goto :goto_d

    .line 703
    :pswitch_1c
    instance-of v9, v15, Lrh;

    .line 704
    .line 705
    if-eqz v9, :cond_a

    .line 706
    .line 707
    check-cast v15, Lrh;

    .line 708
    .line 709
    invoke-virtual {v15}, Lrh;->size()I

    .line 710
    .line 711
    .line 712
    move-result v9

    .line 713
    invoke-static {v9}, Lxk;->d(I)I

    .line 714
    .line 715
    .line 716
    move-result v15

    .line 717
    goto :goto_c

    .line 718
    :cond_a
    check-cast v15, Ljava/lang/String;

    .line 719
    .line 720
    invoke-static {v15}, Lxk;->b(Ljava/lang/String;)I

    .line 721
    .line 722
    .line 723
    move-result v9

    .line 724
    goto :goto_d

    .line 725
    :pswitch_1d
    check-cast v15, Ljava/lang/Boolean;

    .line 726
    .line 727
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 728
    .line 729
    .line 730
    move/from16 v9, v21

    .line 731
    .line 732
    goto :goto_d

    .line 733
    :pswitch_1e
    check-cast v15, Ljava/lang/Integer;

    .line 734
    .line 735
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 736
    .line 737
    .line 738
    goto :goto_b

    .line 739
    :pswitch_1f
    check-cast v15, Ljava/lang/Long;

    .line 740
    .line 741
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 742
    .line 743
    .line 744
    goto/16 :goto_a

    .line 745
    .line 746
    :pswitch_20
    check-cast v15, Ljava/lang/Integer;

    .line 747
    .line 748
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 749
    .line 750
    .line 751
    move-result v9

    .line 752
    invoke-static {v9}, Lxk;->a(I)I

    .line 753
    .line 754
    .line 755
    move-result v9

    .line 756
    goto :goto_d

    .line 757
    :pswitch_21
    check-cast v15, Ljava/lang/Long;

    .line 758
    .line 759
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 760
    .line 761
    .line 762
    move-result-wide v24

    .line 763
    invoke-static/range {v24 .. v25}, Lxk;->e(J)I

    .line 764
    .line 765
    .line 766
    move-result v9

    .line 767
    goto :goto_d

    .line 768
    :pswitch_22
    check-cast v15, Ljava/lang/Long;

    .line 769
    .line 770
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 771
    .line 772
    .line 773
    move-result-wide v24

    .line 774
    invoke-static/range {v24 .. v25}, Lxk;->e(J)I

    .line 775
    .line 776
    .line 777
    move-result v9

    .line 778
    goto :goto_d

    .line 779
    :pswitch_23
    check-cast v15, Ljava/lang/Float;

    .line 780
    .line 781
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 782
    .line 783
    .line 784
    goto/16 :goto_b

    .line 785
    .line 786
    :pswitch_24
    check-cast v15, Ljava/lang/Double;

    .line 787
    .line 788
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 789
    .line 790
    .line 791
    goto/16 :goto_a

    .line 792
    .line 793
    :goto_d
    add-int v9, v9, v20

    .line 794
    .line 795
    iget-object v7, v7, Lc9;->l:Ljava/lang/Object;

    .line 796
    .line 797
    check-cast v7, Lvk1;

    .line 798
    .line 799
    invoke-static/range {v16 .. v16}, Lxk;->c(I)I

    .line 800
    .line 801
    .line 802
    move-result v15

    .line 803
    if-ne v7, v14, :cond_b

    .line 804
    .line 805
    mul-int/lit8 v15, v15, 0x2

    .line 806
    .line 807
    :cond_b
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 808
    .line 809
    .line 810
    move-result v7

    .line 811
    packed-switch v7, :pswitch_data_2

    .line 812
    .line 813
    .line 814
    new-instance v0, Ljava/lang/RuntimeException;

    .line 815
    .line 816
    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 817
    .line 818
    .line 819
    throw v0

    .line 820
    :pswitch_25
    check-cast v13, Ljava/lang/Long;

    .line 821
    .line 822
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 823
    .line 824
    .line 825
    move-result-wide v3

    .line 826
    shl-long v13, v3, v21

    .line 827
    .line 828
    shr-long v3, v3, v19

    .line 829
    .line 830
    xor-long/2addr v3, v13

    .line 831
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 832
    .line 833
    .line 834
    move-result v3

    .line 835
    goto/16 :goto_11

    .line 836
    .line 837
    :pswitch_26
    check-cast v13, Ljava/lang/Integer;

    .line 838
    .line 839
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 840
    .line 841
    .line 842
    move-result v3

    .line 843
    shl-int/lit8 v4, v3, 0x1

    .line 844
    .line 845
    shr-int/lit8 v3, v3, 0x1f

    .line 846
    .line 847
    xor-int/2addr v3, v4

    .line 848
    invoke-static {v3}, Lxk;->d(I)I

    .line 849
    .line 850
    .line 851
    move-result v3

    .line 852
    goto/16 :goto_11

    .line 853
    .line 854
    :pswitch_27
    check-cast v13, Ljava/lang/Long;

    .line 855
    .line 856
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 857
    .line 858
    .line 859
    :goto_e
    move/from16 v3, v18

    .line 860
    .line 861
    goto/16 :goto_11

    .line 862
    .line 863
    :pswitch_28
    check-cast v13, Ljava/lang/Integer;

    .line 864
    .line 865
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 866
    .line 867
    .line 868
    :goto_f
    move/from16 v3, v17

    .line 869
    .line 870
    goto/16 :goto_11

    .line 871
    .line 872
    :pswitch_29
    instance-of v3, v13, Lx9;

    .line 873
    .line 874
    if-eqz v3, :cond_c

    .line 875
    .line 876
    check-cast v13, Lx9;

    .line 877
    .line 878
    iget v3, v13, Lx9;->j:I

    .line 879
    .line 880
    invoke-static {v3}, Lxk;->a(I)I

    .line 881
    .line 882
    .line 883
    move-result v3

    .line 884
    goto/16 :goto_11

    .line 885
    .line 886
    :cond_c
    check-cast v13, Ljava/lang/Integer;

    .line 887
    .line 888
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 889
    .line 890
    .line 891
    move-result v3

    .line 892
    invoke-static {v3}, Lxk;->a(I)I

    .line 893
    .line 894
    .line 895
    move-result v3

    .line 896
    goto/16 :goto_11

    .line 897
    .line 898
    :pswitch_2a
    check-cast v13, Ljava/lang/Integer;

    .line 899
    .line 900
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 901
    .line 902
    .line 903
    move-result v3

    .line 904
    invoke-static {v3}, Lxk;->d(I)I

    .line 905
    .line 906
    .line 907
    move-result v3

    .line 908
    goto/16 :goto_11

    .line 909
    .line 910
    :pswitch_2b
    instance-of v3, v13, Lrh;

    .line 911
    .line 912
    if-eqz v3, :cond_d

    .line 913
    .line 914
    check-cast v13, Lrh;

    .line 915
    .line 916
    invoke-virtual {v13}, Lrh;->size()I

    .line 917
    .line 918
    .line 919
    move-result v3

    .line 920
    invoke-static {v3}, Lxk;->d(I)I

    .line 921
    .line 922
    .line 923
    move-result v4

    .line 924
    :goto_10
    add-int/2addr v3, v4

    .line 925
    goto/16 :goto_11

    .line 926
    .line 927
    :cond_d
    check-cast v13, [B

    .line 928
    .line 929
    array-length v3, v13

    .line 930
    invoke-static {v3}, Lxk;->d(I)I

    .line 931
    .line 932
    .line 933
    move-result v4

    .line 934
    goto :goto_10

    .line 935
    :pswitch_2c
    check-cast v13, Lh0;

    .line 936
    .line 937
    check-cast v13, Lia0;

    .line 938
    .line 939
    invoke-virtual {v13, v4}, Lia0;->g(Lb31;)I

    .line 940
    .line 941
    .line 942
    move-result v3

    .line 943
    invoke-static {v3}, Lxk;->d(I)I

    .line 944
    .line 945
    .line 946
    move-result v4

    .line 947
    goto :goto_10

    .line 948
    :pswitch_2d
    check-cast v13, Lh0;

    .line 949
    .line 950
    check-cast v13, Lia0;

    .line 951
    .line 952
    invoke-virtual {v13, v4}, Lia0;->g(Lb31;)I

    .line 953
    .line 954
    .line 955
    move-result v3

    .line 956
    goto :goto_11

    .line 957
    :pswitch_2e
    instance-of v3, v13, Lrh;

    .line 958
    .line 959
    if-eqz v3, :cond_e

    .line 960
    .line 961
    check-cast v13, Lrh;

    .line 962
    .line 963
    invoke-virtual {v13}, Lrh;->size()I

    .line 964
    .line 965
    .line 966
    move-result v3

    .line 967
    invoke-static {v3}, Lxk;->d(I)I

    .line 968
    .line 969
    .line 970
    move-result v4

    .line 971
    goto :goto_10

    .line 972
    :cond_e
    check-cast v13, Ljava/lang/String;

    .line 973
    .line 974
    invoke-static {v13}, Lxk;->b(Ljava/lang/String;)I

    .line 975
    .line 976
    .line 977
    move-result v3

    .line 978
    goto :goto_11

    .line 979
    :pswitch_2f
    check-cast v13, Ljava/lang/Boolean;

    .line 980
    .line 981
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 982
    .line 983
    .line 984
    move/from16 v3, v21

    .line 985
    .line 986
    goto :goto_11

    .line 987
    :pswitch_30
    check-cast v13, Ljava/lang/Integer;

    .line 988
    .line 989
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 990
    .line 991
    .line 992
    goto :goto_f

    .line 993
    :pswitch_31
    check-cast v13, Ljava/lang/Long;

    .line 994
    .line 995
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 996
    .line 997
    .line 998
    goto/16 :goto_e

    .line 999
    .line 1000
    :pswitch_32
    check-cast v13, Ljava/lang/Integer;

    .line 1001
    .line 1002
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 1003
    .line 1004
    .line 1005
    move-result v3

    .line 1006
    invoke-static {v3}, Lxk;->a(I)I

    .line 1007
    .line 1008
    .line 1009
    move-result v3

    .line 1010
    goto :goto_11

    .line 1011
    :pswitch_33
    check-cast v13, Ljava/lang/Long;

    .line 1012
    .line 1013
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 1014
    .line 1015
    .line 1016
    move-result-wide v3

    .line 1017
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 1018
    .line 1019
    .line 1020
    move-result v3

    .line 1021
    goto :goto_11

    .line 1022
    :pswitch_34
    check-cast v13, Ljava/lang/Long;

    .line 1023
    .line 1024
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 1025
    .line 1026
    .line 1027
    move-result-wide v3

    .line 1028
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 1029
    .line 1030
    .line 1031
    move-result v3

    .line 1032
    goto :goto_11

    .line 1033
    :pswitch_35
    check-cast v13, Ljava/lang/Float;

    .line 1034
    .line 1035
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1036
    .line 1037
    .line 1038
    goto/16 :goto_f

    .line 1039
    .line 1040
    :pswitch_36
    check-cast v13, Ljava/lang/Double;

    .line 1041
    .line 1042
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1043
    .line 1044
    .line 1045
    goto/16 :goto_e

    .line 1046
    .line 1047
    :goto_11
    add-int/2addr v3, v15

    .line 1048
    add-int/2addr v3, v9

    .line 1049
    invoke-static {v3, v3, v6, v12}, Loq;->c(IIII)I

    .line 1050
    .line 1051
    .line 1052
    move-result v12

    .line 1053
    move/from16 v9, v19

    .line 1054
    .line 1055
    move/from16 v14, v21

    .line 1056
    .line 1057
    move/from16 v3, v22

    .line 1058
    .line 1059
    move/from16 v4, v23

    .line 1060
    .line 1061
    const v7, 0xfffff

    .line 1062
    .line 1063
    .line 1064
    goto/16 :goto_9

    .line 1065
    .line 1066
    :goto_12
    add-int/2addr v8, v12

    .line 1067
    :cond_f
    :goto_13
    move/from16 v3, v22

    .line 1068
    .line 1069
    move/from16 v4, v23

    .line 1070
    .line 1071
    goto/16 :goto_2a

    .line 1072
    .line 1073
    :pswitch_37
    move/from16 v22, v3

    .line 1074
    .line 1075
    move/from16 v23, v4

    .line 1076
    .line 1077
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v3

    .line 1081
    check-cast v3, Ljava/util/List;

    .line 1082
    .line 1083
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v4

    .line 1087
    sget-object v5, Lf31;->a:Ljava/lang/Class;

    .line 1088
    .line 1089
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1090
    .line 1091
    .line 1092
    move-result v5

    .line 1093
    if-nez v5, :cond_10

    .line 1094
    .line 1095
    const/4 v7, 0x0

    .line 1096
    goto :goto_15

    .line 1097
    :cond_10
    const/4 v6, 0x0

    .line 1098
    const/4 v7, 0x0

    .line 1099
    :goto_14
    if-ge v6, v5, :cond_11

    .line 1100
    .line 1101
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v9

    .line 1105
    check-cast v9, Lh0;

    .line 1106
    .line 1107
    invoke-static {v11}, Lxk;->c(I)I

    .line 1108
    .line 1109
    .line 1110
    move-result v10

    .line 1111
    mul-int/lit8 v10, v10, 0x2

    .line 1112
    .line 1113
    invoke-virtual {v9, v4}, Lh0;->g(Lb31;)I

    .line 1114
    .line 1115
    .line 1116
    move-result v9

    .line 1117
    add-int/2addr v9, v10

    .line 1118
    add-int/2addr v7, v9

    .line 1119
    add-int/lit8 v6, v6, 0x1

    .line 1120
    .line 1121
    goto :goto_14

    .line 1122
    :cond_11
    :goto_15
    add-int/2addr v8, v7

    .line 1123
    goto :goto_13

    .line 1124
    :pswitch_38
    move/from16 v22, v3

    .line 1125
    .line 1126
    move/from16 v23, v4

    .line 1127
    .line 1128
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1129
    .line 1130
    .line 1131
    move-result-object v3

    .line 1132
    check-cast v3, Ljava/util/List;

    .line 1133
    .line 1134
    invoke-static {v3}, Lf31;->g(Ljava/util/List;)I

    .line 1135
    .line 1136
    .line 1137
    move-result v3

    .line 1138
    if-lez v3, :cond_f

    .line 1139
    .line 1140
    invoke-static {v11}, Lxk;->c(I)I

    .line 1141
    .line 1142
    .line 1143
    move-result v4

    .line 1144
    :goto_16
    invoke-static {v3, v4, v3, v8}, Loq;->c(IIII)I

    .line 1145
    .line 1146
    .line 1147
    move-result v8

    .line 1148
    goto :goto_13

    .line 1149
    :pswitch_39
    move/from16 v22, v3

    .line 1150
    .line 1151
    move/from16 v23, v4

    .line 1152
    .line 1153
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v3

    .line 1157
    check-cast v3, Ljava/util/List;

    .line 1158
    .line 1159
    invoke-static {v3}, Lf31;->f(Ljava/util/List;)I

    .line 1160
    .line 1161
    .line 1162
    move-result v3

    .line 1163
    if-lez v3, :cond_f

    .line 1164
    .line 1165
    invoke-static {v11}, Lxk;->c(I)I

    .line 1166
    .line 1167
    .line 1168
    move-result v4

    .line 1169
    goto :goto_16

    .line 1170
    :pswitch_3a
    move/from16 v22, v3

    .line 1171
    .line 1172
    move/from16 v23, v4

    .line 1173
    .line 1174
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v3

    .line 1178
    check-cast v3, Ljava/util/List;

    .line 1179
    .line 1180
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1181
    .line 1182
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1183
    .line 1184
    .line 1185
    move-result v3

    .line 1186
    mul-int/lit8 v3, v3, 0x8

    .line 1187
    .line 1188
    if-lez v3, :cond_f

    .line 1189
    .line 1190
    invoke-static {v11}, Lxk;->c(I)I

    .line 1191
    .line 1192
    .line 1193
    move-result v4

    .line 1194
    goto :goto_16

    .line 1195
    :pswitch_3b
    move/from16 v22, v3

    .line 1196
    .line 1197
    move/from16 v23, v4

    .line 1198
    .line 1199
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v3

    .line 1203
    check-cast v3, Ljava/util/List;

    .line 1204
    .line 1205
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1206
    .line 1207
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1208
    .line 1209
    .line 1210
    move-result v3

    .line 1211
    mul-int/lit8 v3, v3, 0x4

    .line 1212
    .line 1213
    if-lez v3, :cond_f

    .line 1214
    .line 1215
    invoke-static {v11}, Lxk;->c(I)I

    .line 1216
    .line 1217
    .line 1218
    move-result v4

    .line 1219
    goto :goto_16

    .line 1220
    :pswitch_3c
    move/from16 v22, v3

    .line 1221
    .line 1222
    move/from16 v23, v4

    .line 1223
    .line 1224
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1225
    .line 1226
    .line 1227
    move-result-object v3

    .line 1228
    check-cast v3, Ljava/util/List;

    .line 1229
    .line 1230
    invoke-static {v3}, Lf31;->a(Ljava/util/List;)I

    .line 1231
    .line 1232
    .line 1233
    move-result v3

    .line 1234
    if-lez v3, :cond_f

    .line 1235
    .line 1236
    invoke-static {v11}, Lxk;->c(I)I

    .line 1237
    .line 1238
    .line 1239
    move-result v4

    .line 1240
    goto :goto_16

    .line 1241
    :pswitch_3d
    move/from16 v22, v3

    .line 1242
    .line 1243
    move/from16 v23, v4

    .line 1244
    .line 1245
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v3

    .line 1249
    check-cast v3, Ljava/util/List;

    .line 1250
    .line 1251
    invoke-static {v3}, Lf31;->h(Ljava/util/List;)I

    .line 1252
    .line 1253
    .line 1254
    move-result v3

    .line 1255
    if-lez v3, :cond_f

    .line 1256
    .line 1257
    invoke-static {v11}, Lxk;->c(I)I

    .line 1258
    .line 1259
    .line 1260
    move-result v4

    .line 1261
    goto :goto_16

    .line 1262
    :pswitch_3e
    move/from16 v22, v3

    .line 1263
    .line 1264
    move/from16 v23, v4

    .line 1265
    .line 1266
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v3

    .line 1270
    check-cast v3, Ljava/util/List;

    .line 1271
    .line 1272
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1273
    .line 1274
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1275
    .line 1276
    .line 1277
    move-result v3

    .line 1278
    if-lez v3, :cond_f

    .line 1279
    .line 1280
    invoke-static {v11}, Lxk;->c(I)I

    .line 1281
    .line 1282
    .line 1283
    move-result v4

    .line 1284
    goto/16 :goto_16

    .line 1285
    .line 1286
    :pswitch_3f
    move/from16 v22, v3

    .line 1287
    .line 1288
    move/from16 v23, v4

    .line 1289
    .line 1290
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v3

    .line 1294
    check-cast v3, Ljava/util/List;

    .line 1295
    .line 1296
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1297
    .line 1298
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1299
    .line 1300
    .line 1301
    move-result v3

    .line 1302
    mul-int/lit8 v3, v3, 0x4

    .line 1303
    .line 1304
    if-lez v3, :cond_f

    .line 1305
    .line 1306
    invoke-static {v11}, Lxk;->c(I)I

    .line 1307
    .line 1308
    .line 1309
    move-result v4

    .line 1310
    goto/16 :goto_16

    .line 1311
    .line 1312
    :pswitch_40
    move/from16 v22, v3

    .line 1313
    .line 1314
    move/from16 v23, v4

    .line 1315
    .line 1316
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1317
    .line 1318
    .line 1319
    move-result-object v3

    .line 1320
    check-cast v3, Ljava/util/List;

    .line 1321
    .line 1322
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1323
    .line 1324
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1325
    .line 1326
    .line 1327
    move-result v3

    .line 1328
    mul-int/lit8 v3, v3, 0x8

    .line 1329
    .line 1330
    if-lez v3, :cond_f

    .line 1331
    .line 1332
    invoke-static {v11}, Lxk;->c(I)I

    .line 1333
    .line 1334
    .line 1335
    move-result v4

    .line 1336
    goto/16 :goto_16

    .line 1337
    .line 1338
    :pswitch_41
    move/from16 v22, v3

    .line 1339
    .line 1340
    move/from16 v23, v4

    .line 1341
    .line 1342
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1343
    .line 1344
    .line 1345
    move-result-object v3

    .line 1346
    check-cast v3, Ljava/util/List;

    .line 1347
    .line 1348
    invoke-static {v3}, Lf31;->d(Ljava/util/List;)I

    .line 1349
    .line 1350
    .line 1351
    move-result v3

    .line 1352
    if-lez v3, :cond_f

    .line 1353
    .line 1354
    invoke-static {v11}, Lxk;->c(I)I

    .line 1355
    .line 1356
    .line 1357
    move-result v4

    .line 1358
    goto/16 :goto_16

    .line 1359
    .line 1360
    :pswitch_42
    move/from16 v22, v3

    .line 1361
    .line 1362
    move/from16 v23, v4

    .line 1363
    .line 1364
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1365
    .line 1366
    .line 1367
    move-result-object v3

    .line 1368
    check-cast v3, Ljava/util/List;

    .line 1369
    .line 1370
    invoke-static {v3}, Lf31;->i(Ljava/util/List;)I

    .line 1371
    .line 1372
    .line 1373
    move-result v3

    .line 1374
    if-lez v3, :cond_f

    .line 1375
    .line 1376
    invoke-static {v11}, Lxk;->c(I)I

    .line 1377
    .line 1378
    .line 1379
    move-result v4

    .line 1380
    goto/16 :goto_16

    .line 1381
    .line 1382
    :pswitch_43
    move/from16 v22, v3

    .line 1383
    .line 1384
    move/from16 v23, v4

    .line 1385
    .line 1386
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v3

    .line 1390
    check-cast v3, Ljava/util/List;

    .line 1391
    .line 1392
    invoke-static {v3}, Lf31;->e(Ljava/util/List;)I

    .line 1393
    .line 1394
    .line 1395
    move-result v3

    .line 1396
    if-lez v3, :cond_f

    .line 1397
    .line 1398
    invoke-static {v11}, Lxk;->c(I)I

    .line 1399
    .line 1400
    .line 1401
    move-result v4

    .line 1402
    goto/16 :goto_16

    .line 1403
    .line 1404
    :pswitch_44
    move/from16 v22, v3

    .line 1405
    .line 1406
    move/from16 v23, v4

    .line 1407
    .line 1408
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1409
    .line 1410
    .line 1411
    move-result-object v3

    .line 1412
    check-cast v3, Ljava/util/List;

    .line 1413
    .line 1414
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1415
    .line 1416
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1417
    .line 1418
    .line 1419
    move-result v3

    .line 1420
    mul-int/lit8 v3, v3, 0x4

    .line 1421
    .line 1422
    if-lez v3, :cond_f

    .line 1423
    .line 1424
    invoke-static {v11}, Lxk;->c(I)I

    .line 1425
    .line 1426
    .line 1427
    move-result v4

    .line 1428
    goto/16 :goto_16

    .line 1429
    .line 1430
    :pswitch_45
    move/from16 v22, v3

    .line 1431
    .line 1432
    move/from16 v23, v4

    .line 1433
    .line 1434
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v3

    .line 1438
    check-cast v3, Ljava/util/List;

    .line 1439
    .line 1440
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1441
    .line 1442
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1443
    .line 1444
    .line 1445
    move-result v3

    .line 1446
    mul-int/lit8 v3, v3, 0x8

    .line 1447
    .line 1448
    if-lez v3, :cond_f

    .line 1449
    .line 1450
    invoke-static {v11}, Lxk;->c(I)I

    .line 1451
    .line 1452
    .line 1453
    move-result v4

    .line 1454
    goto/16 :goto_16

    .line 1455
    .line 1456
    :pswitch_46
    move/from16 v22, v3

    .line 1457
    .line 1458
    move/from16 v23, v4

    .line 1459
    .line 1460
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1461
    .line 1462
    .line 1463
    move-result-object v3

    .line 1464
    check-cast v3, Ljava/util/List;

    .line 1465
    .line 1466
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1467
    .line 1468
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1469
    .line 1470
    .line 1471
    move-result v4

    .line 1472
    if-nez v4, :cond_12

    .line 1473
    .line 1474
    :goto_17
    const/4 v5, 0x0

    .line 1475
    goto :goto_19

    .line 1476
    :cond_12
    invoke-static {v3}, Lf31;->g(Ljava/util/List;)I

    .line 1477
    .line 1478
    .line 1479
    move-result v3

    .line 1480
    invoke-static {v11}, Lxk;->c(I)I

    .line 1481
    .line 1482
    .line 1483
    move-result v5

    .line 1484
    :goto_18
    mul-int/2addr v5, v4

    .line 1485
    add-int/2addr v5, v3

    .line 1486
    :cond_13
    :goto_19
    add-int/2addr v8, v5

    .line 1487
    goto/16 :goto_13

    .line 1488
    .line 1489
    :pswitch_47
    move/from16 v22, v3

    .line 1490
    .line 1491
    move/from16 v23, v4

    .line 1492
    .line 1493
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1494
    .line 1495
    .line 1496
    move-result-object v3

    .line 1497
    check-cast v3, Ljava/util/List;

    .line 1498
    .line 1499
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1500
    .line 1501
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1502
    .line 1503
    .line 1504
    move-result v4

    .line 1505
    if-nez v4, :cond_14

    .line 1506
    .line 1507
    goto :goto_17

    .line 1508
    :cond_14
    invoke-static {v3}, Lf31;->f(Ljava/util/List;)I

    .line 1509
    .line 1510
    .line 1511
    move-result v3

    .line 1512
    invoke-static {v11}, Lxk;->c(I)I

    .line 1513
    .line 1514
    .line 1515
    move-result v5

    .line 1516
    goto :goto_18

    .line 1517
    :pswitch_48
    move/from16 v22, v3

    .line 1518
    .line 1519
    move/from16 v23, v4

    .line 1520
    .line 1521
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1522
    .line 1523
    .line 1524
    move-result-object v3

    .line 1525
    check-cast v3, Ljava/util/List;

    .line 1526
    .line 1527
    invoke-static {v11, v3}, Lf31;->c(ILjava/util/List;)I

    .line 1528
    .line 1529
    .line 1530
    move-result v3

    .line 1531
    :goto_1a
    add-int/2addr v8, v3

    .line 1532
    move/from16 v3, v22

    .line 1533
    .line 1534
    goto/16 :goto_2a

    .line 1535
    .line 1536
    :pswitch_49
    move/from16 v22, v3

    .line 1537
    .line 1538
    move/from16 v23, v4

    .line 1539
    .line 1540
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1541
    .line 1542
    .line 1543
    move-result-object v3

    .line 1544
    check-cast v3, Ljava/util/List;

    .line 1545
    .line 1546
    invoke-static {v11, v3}, Lf31;->b(ILjava/util/List;)I

    .line 1547
    .line 1548
    .line 1549
    move-result v3

    .line 1550
    goto :goto_1a

    .line 1551
    :pswitch_4a
    move/from16 v22, v3

    .line 1552
    .line 1553
    move/from16 v23, v4

    .line 1554
    .line 1555
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1556
    .line 1557
    .line 1558
    move-result-object v3

    .line 1559
    check-cast v3, Ljava/util/List;

    .line 1560
    .line 1561
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1562
    .line 1563
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1564
    .line 1565
    .line 1566
    move-result v4

    .line 1567
    if-nez v4, :cond_15

    .line 1568
    .line 1569
    goto :goto_17

    .line 1570
    :cond_15
    invoke-static {v3}, Lf31;->a(Ljava/util/List;)I

    .line 1571
    .line 1572
    .line 1573
    move-result v3

    .line 1574
    invoke-static {v11}, Lxk;->c(I)I

    .line 1575
    .line 1576
    .line 1577
    move-result v5

    .line 1578
    goto :goto_18

    .line 1579
    :pswitch_4b
    move/from16 v22, v3

    .line 1580
    .line 1581
    move/from16 v23, v4

    .line 1582
    .line 1583
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1584
    .line 1585
    .line 1586
    move-result-object v3

    .line 1587
    check-cast v3, Ljava/util/List;

    .line 1588
    .line 1589
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1590
    .line 1591
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1592
    .line 1593
    .line 1594
    move-result v4

    .line 1595
    if-nez v4, :cond_16

    .line 1596
    .line 1597
    goto :goto_17

    .line 1598
    :cond_16
    invoke-static {v3}, Lf31;->h(Ljava/util/List;)I

    .line 1599
    .line 1600
    .line 1601
    move-result v3

    .line 1602
    invoke-static {v11}, Lxk;->c(I)I

    .line 1603
    .line 1604
    .line 1605
    move-result v5

    .line 1606
    goto :goto_18

    .line 1607
    :pswitch_4c
    move/from16 v22, v3

    .line 1608
    .line 1609
    move/from16 v23, v4

    .line 1610
    .line 1611
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1612
    .line 1613
    .line 1614
    move-result-object v3

    .line 1615
    check-cast v3, Ljava/util/List;

    .line 1616
    .line 1617
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1618
    .line 1619
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1620
    .line 1621
    .line 1622
    move-result v4

    .line 1623
    if-nez v4, :cond_17

    .line 1624
    .line 1625
    goto/16 :goto_17

    .line 1626
    .line 1627
    :cond_17
    invoke-static {v11}, Lxk;->c(I)I

    .line 1628
    .line 1629
    .line 1630
    move-result v5

    .line 1631
    mul-int/2addr v5, v4

    .line 1632
    const/4 v4, 0x0

    .line 1633
    :goto_1b
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1634
    .line 1635
    .line 1636
    move-result v6

    .line 1637
    if-ge v4, v6, :cond_13

    .line 1638
    .line 1639
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1640
    .line 1641
    .line 1642
    move-result-object v6

    .line 1643
    check-cast v6, Lrh;

    .line 1644
    .line 1645
    invoke-virtual {v6}, Lrh;->size()I

    .line 1646
    .line 1647
    .line 1648
    move-result v6

    .line 1649
    invoke-static {v6}, Lxk;->d(I)I

    .line 1650
    .line 1651
    .line 1652
    move-result v7

    .line 1653
    add-int/2addr v7, v6

    .line 1654
    add-int/2addr v5, v7

    .line 1655
    add-int/lit8 v4, v4, 0x1

    .line 1656
    .line 1657
    goto :goto_1b

    .line 1658
    :pswitch_4d
    move/from16 v22, v3

    .line 1659
    .line 1660
    move/from16 v23, v4

    .line 1661
    .line 1662
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1663
    .line 1664
    .line 1665
    move-result-object v3

    .line 1666
    check-cast v3, Ljava/util/List;

    .line 1667
    .line 1668
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 1669
    .line 1670
    .line 1671
    move-result-object v4

    .line 1672
    sget-object v5, Lf31;->a:Ljava/lang/Class;

    .line 1673
    .line 1674
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1675
    .line 1676
    .line 1677
    move-result v5

    .line 1678
    if-nez v5, :cond_18

    .line 1679
    .line 1680
    const/4 v6, 0x0

    .line 1681
    goto :goto_1d

    .line 1682
    :cond_18
    invoke-static {v11}, Lxk;->c(I)I

    .line 1683
    .line 1684
    .line 1685
    move-result v6

    .line 1686
    mul-int/2addr v6, v5

    .line 1687
    const/4 v7, 0x0

    .line 1688
    :goto_1c
    if-ge v7, v5, :cond_19

    .line 1689
    .line 1690
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v9

    .line 1694
    check-cast v9, Lh0;

    .line 1695
    .line 1696
    invoke-virtual {v9, v4}, Lh0;->g(Lb31;)I

    .line 1697
    .line 1698
    .line 1699
    move-result v9

    .line 1700
    invoke-static {v9}, Lxk;->d(I)I

    .line 1701
    .line 1702
    .line 1703
    move-result v10

    .line 1704
    add-int/2addr v10, v9

    .line 1705
    add-int/2addr v6, v10

    .line 1706
    add-int/lit8 v7, v7, 0x1

    .line 1707
    .line 1708
    goto :goto_1c

    .line 1709
    :cond_19
    :goto_1d
    add-int/2addr v8, v6

    .line 1710
    goto/16 :goto_13

    .line 1711
    .line 1712
    :pswitch_4e
    move/from16 v22, v3

    .line 1713
    .line 1714
    move/from16 v23, v4

    .line 1715
    .line 1716
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1717
    .line 1718
    .line 1719
    move-result-object v3

    .line 1720
    check-cast v3, Ljava/util/List;

    .line 1721
    .line 1722
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1723
    .line 1724
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1725
    .line 1726
    .line 1727
    move-result v4

    .line 1728
    if-nez v4, :cond_1a

    .line 1729
    .line 1730
    goto/16 :goto_17

    .line 1731
    .line 1732
    :cond_1a
    invoke-static {v11}, Lxk;->c(I)I

    .line 1733
    .line 1734
    .line 1735
    move-result v5

    .line 1736
    mul-int/2addr v5, v4

    .line 1737
    instance-of v6, v3, Loh0;

    .line 1738
    .line 1739
    if-eqz v6, :cond_1c

    .line 1740
    .line 1741
    check-cast v3, Loh0;

    .line 1742
    .line 1743
    const/4 v6, 0x0

    .line 1744
    :goto_1e
    if-ge v6, v4, :cond_13

    .line 1745
    .line 1746
    invoke-interface {v3, v6}, Loh0;->m(I)Ljava/lang/Object;

    .line 1747
    .line 1748
    .line 1749
    move-result-object v7

    .line 1750
    instance-of v9, v7, Lrh;

    .line 1751
    .line 1752
    if-eqz v9, :cond_1b

    .line 1753
    .line 1754
    check-cast v7, Lrh;

    .line 1755
    .line 1756
    invoke-virtual {v7}, Lrh;->size()I

    .line 1757
    .line 1758
    .line 1759
    move-result v7

    .line 1760
    invoke-static {v7}, Lxk;->d(I)I

    .line 1761
    .line 1762
    .line 1763
    move-result v9

    .line 1764
    add-int/2addr v9, v7

    .line 1765
    add-int/2addr v9, v5

    .line 1766
    move v5, v9

    .line 1767
    goto :goto_1f

    .line 1768
    :cond_1b
    check-cast v7, Ljava/lang/String;

    .line 1769
    .line 1770
    invoke-static {v7}, Lxk;->b(Ljava/lang/String;)I

    .line 1771
    .line 1772
    .line 1773
    move-result v7

    .line 1774
    add-int/2addr v7, v5

    .line 1775
    move v5, v7

    .line 1776
    :goto_1f
    add-int/lit8 v6, v6, 0x1

    .line 1777
    .line 1778
    goto :goto_1e

    .line 1779
    :cond_1c
    const/4 v6, 0x0

    .line 1780
    :goto_20
    if-ge v6, v4, :cond_13

    .line 1781
    .line 1782
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1783
    .line 1784
    .line 1785
    move-result-object v7

    .line 1786
    instance-of v9, v7, Lrh;

    .line 1787
    .line 1788
    if-eqz v9, :cond_1d

    .line 1789
    .line 1790
    check-cast v7, Lrh;

    .line 1791
    .line 1792
    invoke-virtual {v7}, Lrh;->size()I

    .line 1793
    .line 1794
    .line 1795
    move-result v7

    .line 1796
    invoke-static {v7}, Lxk;->d(I)I

    .line 1797
    .line 1798
    .line 1799
    move-result v9

    .line 1800
    add-int/2addr v9, v7

    .line 1801
    add-int/2addr v9, v5

    .line 1802
    move v5, v9

    .line 1803
    goto :goto_21

    .line 1804
    :cond_1d
    check-cast v7, Ljava/lang/String;

    .line 1805
    .line 1806
    invoke-static {v7}, Lxk;->b(Ljava/lang/String;)I

    .line 1807
    .line 1808
    .line 1809
    move-result v7

    .line 1810
    add-int/2addr v7, v5

    .line 1811
    move v5, v7

    .line 1812
    :goto_21
    add-int/lit8 v6, v6, 0x1

    .line 1813
    .line 1814
    goto :goto_20

    .line 1815
    :pswitch_4f
    move/from16 v22, v3

    .line 1816
    .line 1817
    move/from16 v23, v4

    .line 1818
    .line 1819
    move/from16 v21, v14

    .line 1820
    .line 1821
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1822
    .line 1823
    .line 1824
    move-result-object v3

    .line 1825
    check-cast v3, Ljava/util/List;

    .line 1826
    .line 1827
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1828
    .line 1829
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1830
    .line 1831
    .line 1832
    move-result v3

    .line 1833
    if-nez v3, :cond_1e

    .line 1834
    .line 1835
    const/4 v4, 0x0

    .line 1836
    goto :goto_22

    .line 1837
    :cond_1e
    invoke-static {v11}, Lxk;->c(I)I

    .line 1838
    .line 1839
    .line 1840
    move-result v4

    .line 1841
    add-int/lit8 v4, v4, 0x1

    .line 1842
    .line 1843
    mul-int/2addr v4, v3

    .line 1844
    :goto_22
    add-int/2addr v8, v4

    .line 1845
    goto/16 :goto_13

    .line 1846
    .line 1847
    :pswitch_50
    move/from16 v22, v3

    .line 1848
    .line 1849
    move/from16 v23, v4

    .line 1850
    .line 1851
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1852
    .line 1853
    .line 1854
    move-result-object v3

    .line 1855
    check-cast v3, Ljava/util/List;

    .line 1856
    .line 1857
    invoke-static {v11, v3}, Lf31;->b(ILjava/util/List;)I

    .line 1858
    .line 1859
    .line 1860
    move-result v3

    .line 1861
    goto/16 :goto_1a

    .line 1862
    .line 1863
    :pswitch_51
    move/from16 v22, v3

    .line 1864
    .line 1865
    move/from16 v23, v4

    .line 1866
    .line 1867
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1868
    .line 1869
    .line 1870
    move-result-object v3

    .line 1871
    check-cast v3, Ljava/util/List;

    .line 1872
    .line 1873
    invoke-static {v11, v3}, Lf31;->c(ILjava/util/List;)I

    .line 1874
    .line 1875
    .line 1876
    move-result v3

    .line 1877
    goto/16 :goto_1a

    .line 1878
    .line 1879
    :pswitch_52
    move/from16 v22, v3

    .line 1880
    .line 1881
    move/from16 v23, v4

    .line 1882
    .line 1883
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1884
    .line 1885
    .line 1886
    move-result-object v3

    .line 1887
    check-cast v3, Ljava/util/List;

    .line 1888
    .line 1889
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1890
    .line 1891
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1892
    .line 1893
    .line 1894
    move-result v4

    .line 1895
    if-nez v4, :cond_1f

    .line 1896
    .line 1897
    goto/16 :goto_17

    .line 1898
    .line 1899
    :cond_1f
    invoke-static {v3}, Lf31;->d(Ljava/util/List;)I

    .line 1900
    .line 1901
    .line 1902
    move-result v3

    .line 1903
    invoke-static {v11}, Lxk;->c(I)I

    .line 1904
    .line 1905
    .line 1906
    move-result v5

    .line 1907
    goto/16 :goto_18

    .line 1908
    .line 1909
    :pswitch_53
    move/from16 v22, v3

    .line 1910
    .line 1911
    move/from16 v23, v4

    .line 1912
    .line 1913
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1914
    .line 1915
    .line 1916
    move-result-object v3

    .line 1917
    check-cast v3, Ljava/util/List;

    .line 1918
    .line 1919
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1920
    .line 1921
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1922
    .line 1923
    .line 1924
    move-result v4

    .line 1925
    if-nez v4, :cond_20

    .line 1926
    .line 1927
    goto/16 :goto_17

    .line 1928
    .line 1929
    :cond_20
    invoke-static {v3}, Lf31;->i(Ljava/util/List;)I

    .line 1930
    .line 1931
    .line 1932
    move-result v3

    .line 1933
    invoke-static {v11}, Lxk;->c(I)I

    .line 1934
    .line 1935
    .line 1936
    move-result v5

    .line 1937
    goto/16 :goto_18

    .line 1938
    .line 1939
    :pswitch_54
    move/from16 v22, v3

    .line 1940
    .line 1941
    move/from16 v23, v4

    .line 1942
    .line 1943
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1944
    .line 1945
    .line 1946
    move-result-object v3

    .line 1947
    check-cast v3, Ljava/util/List;

    .line 1948
    .line 1949
    sget-object v4, Lf31;->a:Ljava/lang/Class;

    .line 1950
    .line 1951
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1952
    .line 1953
    .line 1954
    move-result v4

    .line 1955
    if-nez v4, :cond_21

    .line 1956
    .line 1957
    goto/16 :goto_17

    .line 1958
    .line 1959
    :cond_21
    invoke-static {v3}, Lf31;->e(Ljava/util/List;)I

    .line 1960
    .line 1961
    .line 1962
    move-result v4

    .line 1963
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 1964
    .line 1965
    .line 1966
    move-result v3

    .line 1967
    invoke-static {v11}, Lxk;->c(I)I

    .line 1968
    .line 1969
    .line 1970
    move-result v5

    .line 1971
    mul-int/2addr v5, v3

    .line 1972
    add-int/2addr v5, v4

    .line 1973
    goto/16 :goto_19

    .line 1974
    .line 1975
    :pswitch_55
    move/from16 v22, v3

    .line 1976
    .line 1977
    move/from16 v23, v4

    .line 1978
    .line 1979
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1980
    .line 1981
    .line 1982
    move-result-object v3

    .line 1983
    check-cast v3, Ljava/util/List;

    .line 1984
    .line 1985
    invoke-static {v11, v3}, Lf31;->b(ILjava/util/List;)I

    .line 1986
    .line 1987
    .line 1988
    move-result v3

    .line 1989
    goto/16 :goto_1a

    .line 1990
    .line 1991
    :pswitch_56
    move/from16 v22, v3

    .line 1992
    .line 1993
    move/from16 v23, v4

    .line 1994
    .line 1995
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1996
    .line 1997
    .line 1998
    move-result-object v3

    .line 1999
    check-cast v3, Ljava/util/List;

    .line 2000
    .line 2001
    invoke-static {v11, v3}, Lf31;->c(ILjava/util/List;)I

    .line 2002
    .line 2003
    .line 2004
    move-result v3

    .line 2005
    goto/16 :goto_1a

    .line 2006
    .line 2007
    :pswitch_57
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2008
    .line 2009
    .line 2010
    move-result v5

    .line 2011
    if-eqz v5, :cond_25

    .line 2012
    .line 2013
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2014
    .line 2015
    .line 2016
    move-result-object v5

    .line 2017
    check-cast v5, Lh0;

    .line 2018
    .line 2019
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 2020
    .line 2021
    .line 2022
    move-result-object v6

    .line 2023
    invoke-static {v11}, Lxk;->c(I)I

    .line 2024
    .line 2025
    .line 2026
    move-result v7

    .line 2027
    mul-int/lit8 v7, v7, 0x2

    .line 2028
    .line 2029
    invoke-virtual {v5, v6}, Lh0;->g(Lb31;)I

    .line 2030
    .line 2031
    .line 2032
    move-result v5

    .line 2033
    add-int/2addr v5, v7

    .line 2034
    goto/16 :goto_3

    .line 2035
    .line 2036
    :pswitch_58
    move/from16 v19, v9

    .line 2037
    .line 2038
    move/from16 v21, v14

    .line 2039
    .line 2040
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2041
    .line 2042
    .line 2043
    move-result v5

    .line 2044
    if-eqz v5, :cond_22

    .line 2045
    .line 2046
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2047
    .line 2048
    .line 2049
    move-result-wide v5

    .line 2050
    invoke-static {v11}, Lxk;->c(I)I

    .line 2051
    .line 2052
    .line 2053
    move-result v0

    .line 2054
    shl-long v9, v5, v21

    .line 2055
    .line 2056
    shr-long v5, v5, v19

    .line 2057
    .line 2058
    xor-long/2addr v5, v9

    .line 2059
    invoke-static {v5, v6}, Lxk;->e(J)I

    .line 2060
    .line 2061
    .line 2062
    move-result v5

    .line 2063
    :goto_23
    add-int/2addr v5, v0

    .line 2064
    add-int/2addr v8, v5

    .line 2065
    :cond_22
    :goto_24
    move-object/from16 v0, p0

    .line 2066
    .line 2067
    goto/16 :goto_2a

    .line 2068
    .line 2069
    :pswitch_59
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2070
    .line 2071
    .line 2072
    move-result v5

    .line 2073
    if-eqz v5, :cond_22

    .line 2074
    .line 2075
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2076
    .line 2077
    .line 2078
    move-result v0

    .line 2079
    invoke-static {v11}, Lxk;->c(I)I

    .line 2080
    .line 2081
    .line 2082
    move-result v5

    .line 2083
    shl-int/lit8 v6, v0, 0x1

    .line 2084
    .line 2085
    shr-int/lit8 v0, v0, 0x1f

    .line 2086
    .line 2087
    xor-int/2addr v0, v6

    .line 2088
    invoke-static {v0}, Lxk;->d(I)I

    .line 2089
    .line 2090
    .line 2091
    move-result v0

    .line 2092
    :goto_25
    add-int/2addr v0, v5

    .line 2093
    add-int/2addr v8, v0

    .line 2094
    goto :goto_24

    .line 2095
    :pswitch_5a
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2096
    .line 2097
    .line 2098
    move-result v5

    .line 2099
    if-eqz v5, :cond_23

    .line 2100
    .line 2101
    invoke-static {v11}, Lxk;->c(I)I

    .line 2102
    .line 2103
    .line 2104
    move-result v0

    .line 2105
    :goto_26
    add-int/lit8 v0, v0, 0x8

    .line 2106
    .line 2107
    :goto_27
    add-int/2addr v8, v0

    .line 2108
    :cond_23
    move-object/from16 v0, p0

    .line 2109
    .line 2110
    move-object/from16 v1, p1

    .line 2111
    .line 2112
    goto/16 :goto_2a

    .line 2113
    .line 2114
    :pswitch_5b
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2115
    .line 2116
    .line 2117
    move-result v5

    .line 2118
    if-eqz v5, :cond_23

    .line 2119
    .line 2120
    invoke-static {v11}, Lxk;->c(I)I

    .line 2121
    .line 2122
    .line 2123
    move-result v0

    .line 2124
    :goto_28
    add-int/lit8 v0, v0, 0x4

    .line 2125
    .line 2126
    goto :goto_27

    .line 2127
    :pswitch_5c
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2128
    .line 2129
    .line 2130
    move-result v5

    .line 2131
    if-eqz v5, :cond_22

    .line 2132
    .line 2133
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2134
    .line 2135
    .line 2136
    move-result v0

    .line 2137
    invoke-static {v11}, Lxk;->c(I)I

    .line 2138
    .line 2139
    .line 2140
    move-result v5

    .line 2141
    invoke-static {v0}, Lxk;->a(I)I

    .line 2142
    .line 2143
    .line 2144
    move-result v0

    .line 2145
    goto :goto_25

    .line 2146
    :pswitch_5d
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2147
    .line 2148
    .line 2149
    move-result v5

    .line 2150
    if-eqz v5, :cond_22

    .line 2151
    .line 2152
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2153
    .line 2154
    .line 2155
    move-result v0

    .line 2156
    invoke-static {v11}, Lxk;->c(I)I

    .line 2157
    .line 2158
    .line 2159
    move-result v5

    .line 2160
    invoke-static {v0}, Lxk;->d(I)I

    .line 2161
    .line 2162
    .line 2163
    move-result v0

    .line 2164
    goto :goto_25

    .line 2165
    :pswitch_5e
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2166
    .line 2167
    .line 2168
    move-result v5

    .line 2169
    if-eqz v5, :cond_22

    .line 2170
    .line 2171
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2172
    .line 2173
    .line 2174
    move-result-object v0

    .line 2175
    check-cast v0, Lrh;

    .line 2176
    .line 2177
    invoke-static {v11}, Lxk;->c(I)I

    .line 2178
    .line 2179
    .line 2180
    move-result v5

    .line 2181
    invoke-virtual {v0}, Lrh;->size()I

    .line 2182
    .line 2183
    .line 2184
    move-result v0

    .line 2185
    invoke-static {v0, v0, v5, v8}, Loq;->c(IIII)I

    .line 2186
    .line 2187
    .line 2188
    move-result v8

    .line 2189
    goto :goto_24

    .line 2190
    :pswitch_5f
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2191
    .line 2192
    .line 2193
    move-result v5

    .line 2194
    if-eqz v5, :cond_25

    .line 2195
    .line 2196
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2197
    .line 2198
    .line 2199
    move-result-object v5

    .line 2200
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 2201
    .line 2202
    .line 2203
    move-result-object v6

    .line 2204
    sget-object v7, Lf31;->a:Ljava/lang/Class;

    .line 2205
    .line 2206
    check-cast v5, Lh0;

    .line 2207
    .line 2208
    invoke-static {v11}, Lxk;->c(I)I

    .line 2209
    .line 2210
    .line 2211
    move-result v7

    .line 2212
    invoke-virtual {v5, v6}, Lh0;->g(Lb31;)I

    .line 2213
    .line 2214
    .line 2215
    move-result v5

    .line 2216
    invoke-static {v5, v5, v7, v8}, Loq;->c(IIII)I

    .line 2217
    .line 2218
    .line 2219
    move-result v8

    .line 2220
    goto/16 :goto_2a

    .line 2221
    .line 2222
    :pswitch_60
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2223
    .line 2224
    .line 2225
    move-result v5

    .line 2226
    if-eqz v5, :cond_22

    .line 2227
    .line 2228
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2229
    .line 2230
    .line 2231
    move-result-object v0

    .line 2232
    instance-of v5, v0, Lrh;

    .line 2233
    .line 2234
    if-eqz v5, :cond_24

    .line 2235
    .line 2236
    check-cast v0, Lrh;

    .line 2237
    .line 2238
    invoke-static {v11}, Lxk;->c(I)I

    .line 2239
    .line 2240
    .line 2241
    move-result v5

    .line 2242
    invoke-virtual {v0}, Lrh;->size()I

    .line 2243
    .line 2244
    .line 2245
    move-result v0

    .line 2246
    invoke-static {v0, v0, v5, v8}, Loq;->c(IIII)I

    .line 2247
    .line 2248
    .line 2249
    move-result v0

    .line 2250
    :goto_29
    move v8, v0

    .line 2251
    goto/16 :goto_24

    .line 2252
    .line 2253
    :cond_24
    check-cast v0, Ljava/lang/String;

    .line 2254
    .line 2255
    invoke-static {v11}, Lxk;->c(I)I

    .line 2256
    .line 2257
    .line 2258
    move-result v5

    .line 2259
    invoke-static {v0}, Lxk;->b(Ljava/lang/String;)I

    .line 2260
    .line 2261
    .line 2262
    move-result v0

    .line 2263
    add-int/2addr v0, v5

    .line 2264
    add-int/2addr v0, v8

    .line 2265
    goto :goto_29

    .line 2266
    :pswitch_61
    move/from16 v21, v14

    .line 2267
    .line 2268
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2269
    .line 2270
    .line 2271
    move-result v5

    .line 2272
    if-eqz v5, :cond_23

    .line 2273
    .line 2274
    invoke-static {v11}, Lxk;->c(I)I

    .line 2275
    .line 2276
    .line 2277
    move-result v0

    .line 2278
    add-int/lit8 v0, v0, 0x1

    .line 2279
    .line 2280
    goto/16 :goto_27

    .line 2281
    .line 2282
    :pswitch_62
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2283
    .line 2284
    .line 2285
    move-result v5

    .line 2286
    if-eqz v5, :cond_23

    .line 2287
    .line 2288
    invoke-static {v11}, Lxk;->c(I)I

    .line 2289
    .line 2290
    .line 2291
    move-result v0

    .line 2292
    goto/16 :goto_28

    .line 2293
    .line 2294
    :pswitch_63
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2295
    .line 2296
    .line 2297
    move-result v5

    .line 2298
    if-eqz v5, :cond_23

    .line 2299
    .line 2300
    invoke-static {v11}, Lxk;->c(I)I

    .line 2301
    .line 2302
    .line 2303
    move-result v0

    .line 2304
    goto/16 :goto_26

    .line 2305
    .line 2306
    :pswitch_64
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2307
    .line 2308
    .line 2309
    move-result v5

    .line 2310
    if-eqz v5, :cond_22

    .line 2311
    .line 2312
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2313
    .line 2314
    .line 2315
    move-result v0

    .line 2316
    invoke-static {v11}, Lxk;->c(I)I

    .line 2317
    .line 2318
    .line 2319
    move-result v5

    .line 2320
    invoke-static {v0}, Lxk;->a(I)I

    .line 2321
    .line 2322
    .line 2323
    move-result v0

    .line 2324
    goto/16 :goto_25

    .line 2325
    .line 2326
    :pswitch_65
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2327
    .line 2328
    .line 2329
    move-result v5

    .line 2330
    if-eqz v5, :cond_22

    .line 2331
    .line 2332
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2333
    .line 2334
    .line 2335
    move-result-wide v5

    .line 2336
    invoke-static {v11}, Lxk;->c(I)I

    .line 2337
    .line 2338
    .line 2339
    move-result v0

    .line 2340
    invoke-static {v5, v6}, Lxk;->e(J)I

    .line 2341
    .line 2342
    .line 2343
    move-result v5

    .line 2344
    goto/16 :goto_23

    .line 2345
    .line 2346
    :pswitch_66
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2347
    .line 2348
    .line 2349
    move-result v5

    .line 2350
    if-eqz v5, :cond_22

    .line 2351
    .line 2352
    invoke-virtual {v15, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2353
    .line 2354
    .line 2355
    move-result-wide v5

    .line 2356
    invoke-static {v11}, Lxk;->c(I)I

    .line 2357
    .line 2358
    .line 2359
    move-result v0

    .line 2360
    invoke-static {v5, v6}, Lxk;->e(J)I

    .line 2361
    .line 2362
    .line 2363
    move-result v5

    .line 2364
    goto/16 :goto_23

    .line 2365
    .line 2366
    :pswitch_67
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2367
    .line 2368
    .line 2369
    move-result v5

    .line 2370
    if-eqz v5, :cond_23

    .line 2371
    .line 2372
    invoke-static {v11}, Lxk;->c(I)I

    .line 2373
    .line 2374
    .line 2375
    move-result v0

    .line 2376
    goto/16 :goto_28

    .line 2377
    .line 2378
    :pswitch_68
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2379
    .line 2380
    .line 2381
    move-result v5

    .line 2382
    if-eqz v5, :cond_25

    .line 2383
    .line 2384
    invoke-static {v11}, Lxk;->c(I)I

    .line 2385
    .line 2386
    .line 2387
    move-result v5

    .line 2388
    goto/16 :goto_6

    .line 2389
    .line 2390
    :cond_25
    :goto_2a
    add-int/lit8 v2, v2, 0x3

    .line 2391
    .line 2392
    const v7, 0xfffff

    .line 2393
    .line 2394
    .line 2395
    goto/16 :goto_0

    .line 2396
    .line 2397
    :cond_26
    iget-object v0, v0, Lrn0;->h:Lze1;

    .line 2398
    .line 2399
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2400
    .line 2401
    .line 2402
    iget-object v0, v1, Lia0;->unknownFields:Lxe1;

    .line 2403
    .line 2404
    invoke-virtual {v0}, Lxe1;->a()I

    .line 2405
    .line 2406
    .line 2407
    move-result v0

    .line 2408
    add-int/2addr v0, v8

    .line 2409
    return v0

    .line 2410
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;Lpa0;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v6, p2

    .line 6
    .line 7
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v2, v6, Lpa0;->k:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v7, v2

    .line 13
    check-cast v7, Lxk;

    .line 14
    .line 15
    iget-object v8, v0, Lrn0;->a:[I

    .line 16
    .line 17
    array-length v9, v8

    .line 18
    const v10, 0xfffff

    .line 19
    .line 20
    .line 21
    move v3, v10

    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    :goto_0
    if-ge v2, v9, :cond_16

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lrn0;->w(I)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    aget v12, v8, v2

    .line 31
    .line 32
    invoke-static {v5}, Lrn0;->v(I)I

    .line 33
    .line 34
    .line 35
    move-result v13

    .line 36
    const/16 v14, 0x11

    .line 37
    .line 38
    const/16 v16, 0x1

    .line 39
    .line 40
    sget-object v15, Lrn0;->k:Lsun/misc/Unsafe;

    .line 41
    .line 42
    if-gt v13, v14, :cond_2

    .line 43
    .line 44
    add-int/lit8 v14, v2, 0x2

    .line 45
    .line 46
    aget v14, v8, v14

    .line 47
    .line 48
    and-int v11, v14, v10

    .line 49
    .line 50
    if-eq v11, v3, :cond_1

    .line 51
    .line 52
    if-ne v11, v10, :cond_0

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    int-to-long v3, v11

    .line 57
    invoke-virtual {v15, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    move v4, v3

    .line 62
    :goto_1
    move v3, v11

    .line 63
    :cond_1
    ushr-int/lit8 v11, v14, 0x14

    .line 64
    .line 65
    shl-int v11, v16, v11

    .line 66
    .line 67
    move/from16 v30, v11

    .line 68
    .line 69
    move v11, v5

    .line 70
    move/from16 v5, v30

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    move v11, v5

    .line 74
    const/4 v5, 0x0

    .line 75
    :goto_2
    and-int/2addr v11, v10

    .line 76
    int-to-long v10, v11

    .line 77
    const/16 v17, 0x3f

    .line 78
    .line 79
    const/4 v14, 0x2

    .line 80
    packed-switch v13, :pswitch_data_0

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_3
    const/4 v13, 0x0

    .line 84
    goto/16 :goto_18

    .line 85
    .line 86
    :pswitch_0
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eqz v5, :cond_3

    .line 91
    .line 92
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    invoke-virtual {v6, v12, v5, v10}, Lpa0;->u(ILjava/lang/Object;Lb31;)V

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :pswitch_1
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    invoke-static {v10, v11, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 111
    .line 112
    .line 113
    move-result-wide v10

    .line 114
    shl-long v13, v10, v16

    .line 115
    .line 116
    shr-long v10, v10, v17

    .line 117
    .line 118
    xor-long/2addr v10, v13

    .line 119
    const/4 v5, 0x0

    .line 120
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 124
    .line 125
    .line 126
    :cond_4
    move v13, v5

    .line 127
    goto/16 :goto_18

    .line 128
    .line 129
    :pswitch_2
    const/4 v5, 0x0

    .line 130
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 131
    .line 132
    .line 133
    move-result v13

    .line 134
    if-eqz v13, :cond_4

    .line 135
    .line 136
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 137
    .line 138
    .line 139
    move-result v10

    .line 140
    shl-int/lit8 v11, v10, 0x1

    .line 141
    .line 142
    shr-int/lit8 v10, v10, 0x1f

    .line 143
    .line 144
    xor-int/2addr v10, v11

    .line 145
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v7, v10}, Lxk;->n(I)V

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :pswitch_3
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_3

    .line 157
    .line 158
    invoke-static {v10, v11, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 159
    .line 160
    .line 161
    move-result-wide v10

    .line 162
    move/from16 v5, v16

    .line 163
    .line 164
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :pswitch_4
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-eqz v5, :cond_3

    .line 176
    .line 177
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    const/4 v10, 0x5

    .line 182
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v7, v5}, Lxk;->i(I)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :pswitch_5
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_3

    .line 194
    .line 195
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    const/4 v13, 0x0

    .line 200
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v7, v5}, Lxk;->k(I)V

    .line 204
    .line 205
    .line 206
    goto/16 :goto_18

    .line 207
    .line 208
    :pswitch_6
    const/4 v13, 0x0

    .line 209
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    if-eqz v5, :cond_15

    .line 214
    .line 215
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v7, v5}, Lxk;->n(I)V

    .line 223
    .line 224
    .line 225
    goto/16 :goto_3

    .line 226
    .line 227
    :pswitch_7
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    if-eqz v5, :cond_3

    .line 232
    .line 233
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    check-cast v5, Lrh;

    .line 238
    .line 239
    invoke-virtual {v7, v12, v14}, Lxk;->m(II)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v7, v5}, Lxk;->h(Lrh;)V

    .line 243
    .line 244
    .line 245
    goto/16 :goto_3

    .line 246
    .line 247
    :pswitch_8
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-eqz v5, :cond_3

    .line 252
    .line 253
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 258
    .line 259
    .line 260
    move-result-object v10

    .line 261
    invoke-virtual {v6, v12, v5, v10}, Lpa0;->v(ILjava/lang/Object;Lb31;)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_3

    .line 265
    .line 266
    :pswitch_9
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    if-eqz v5, :cond_3

    .line 271
    .line 272
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v5

    .line 276
    instance-of v10, v5, Ljava/lang/String;

    .line 277
    .line 278
    if-eqz v10, :cond_5

    .line 279
    .line 280
    check-cast v5, Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v7, v12, v14}, Lxk;->m(II)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v7, v5}, Lxk;->l(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    goto/16 :goto_3

    .line 289
    .line 290
    :cond_5
    check-cast v5, Lrh;

    .line 291
    .line 292
    invoke-virtual {v7, v12, v14}, Lxk;->m(II)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v7, v5}, Lxk;->h(Lrh;)V

    .line 296
    .line 297
    .line 298
    goto/16 :goto_3

    .line 299
    .line 300
    :pswitch_a
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 301
    .line 302
    .line 303
    move-result v5

    .line 304
    if-eqz v5, :cond_3

    .line 305
    .line 306
    invoke-static {v10, v11, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v5

    .line 310
    check-cast v5, Ljava/lang/Boolean;

    .line 311
    .line 312
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 313
    .line 314
    .line 315
    move-result v5

    .line 316
    const/4 v13, 0x0

    .line 317
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 318
    .line 319
    .line 320
    int-to-byte v5, v5

    .line 321
    invoke-virtual {v7, v5}, Lxk;->f(B)V

    .line 322
    .line 323
    .line 324
    goto/16 :goto_3

    .line 325
    .line 326
    :pswitch_b
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_3

    .line 331
    .line 332
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    const/4 v10, 0x5

    .line 337
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v7, v5}, Lxk;->i(I)V

    .line 341
    .line 342
    .line 343
    goto/16 :goto_3

    .line 344
    .line 345
    :pswitch_c
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 346
    .line 347
    .line 348
    move-result v5

    .line 349
    if-eqz v5, :cond_3

    .line 350
    .line 351
    invoke-static {v10, v11, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 352
    .line 353
    .line 354
    move-result-wide v10

    .line 355
    const/4 v5, 0x1

    .line 356
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 360
    .line 361
    .line 362
    goto/16 :goto_3

    .line 363
    .line 364
    :pswitch_d
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 365
    .line 366
    .line 367
    move-result v5

    .line 368
    if-eqz v5, :cond_3

    .line 369
    .line 370
    invoke-static {v10, v11, v1}, Lrn0;->r(JLjava/lang/Object;)I

    .line 371
    .line 372
    .line 373
    move-result v5

    .line 374
    const/4 v13, 0x0

    .line 375
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v7, v5}, Lxk;->k(I)V

    .line 379
    .line 380
    .line 381
    goto/16 :goto_18

    .line 382
    .line 383
    :pswitch_e
    const/4 v13, 0x0

    .line 384
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 385
    .line 386
    .line 387
    move-result v5

    .line 388
    if-eqz v5, :cond_15

    .line 389
    .line 390
    invoke-static {v10, v11, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 391
    .line 392
    .line 393
    move-result-wide v10

    .line 394
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 398
    .line 399
    .line 400
    goto/16 :goto_18

    .line 401
    .line 402
    :pswitch_f
    const/4 v13, 0x0

    .line 403
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 404
    .line 405
    .line 406
    move-result v5

    .line 407
    if-eqz v5, :cond_15

    .line 408
    .line 409
    invoke-static {v10, v11, v1}, Lrn0;->s(JLjava/lang/Object;)J

    .line 410
    .line 411
    .line 412
    move-result-wide v10

    .line 413
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 417
    .line 418
    .line 419
    goto/16 :goto_3

    .line 420
    .line 421
    :pswitch_10
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 422
    .line 423
    .line 424
    move-result v5

    .line 425
    if-eqz v5, :cond_3

    .line 426
    .line 427
    invoke-static {v10, v11, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v5

    .line 431
    check-cast v5, Ljava/lang/Float;

    .line 432
    .line 433
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 434
    .line 435
    .line 436
    move-result v5

    .line 437
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 438
    .line 439
    .line 440
    move-result v5

    .line 441
    const/4 v10, 0x5

    .line 442
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 443
    .line 444
    .line 445
    invoke-virtual {v7, v5}, Lxk;->i(I)V

    .line 446
    .line 447
    .line 448
    goto/16 :goto_3

    .line 449
    .line 450
    :pswitch_11
    invoke-virtual {v0, v12, v1, v2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 451
    .line 452
    .line 453
    move-result v5

    .line 454
    if-eqz v5, :cond_3

    .line 455
    .line 456
    invoke-static {v10, v11, v1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v5

    .line 460
    check-cast v5, Ljava/lang/Double;

    .line 461
    .line 462
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    .line 463
    .line 464
    .line 465
    move-result-wide v10

    .line 466
    invoke-static {v10, v11}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 467
    .line 468
    .line 469
    move-result-wide v10

    .line 470
    const/4 v5, 0x1

    .line 471
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 475
    .line 476
    .line 477
    goto/16 :goto_3

    .line 478
    .line 479
    :pswitch_12
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object v5

    .line 483
    if-eqz v5, :cond_e

    .line 484
    .line 485
    div-int/lit8 v10, v2, 0x3

    .line 486
    .line 487
    mul-int/2addr v10, v14

    .line 488
    iget-object v11, v0, Lrn0;->b:[Ljava/lang/Object;

    .line 489
    .line 490
    aget-object v10, v11, v10

    .line 491
    .line 492
    iget-object v11, v0, Lrn0;->i:Lol0;

    .line 493
    .line 494
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 495
    .line 496
    .line 497
    check-cast v10, Lkl0;

    .line 498
    .line 499
    iget-object v10, v10, Lkl0;->a:Lc9;

    .line 500
    .line 501
    iget-object v11, v10, Lc9;->l:Ljava/lang/Object;

    .line 502
    .line 503
    check-cast v11, Lvk1;

    .line 504
    .line 505
    iget-object v10, v10, Lc9;->k:Ljava/lang/Object;

    .line 506
    .line 507
    check-cast v10, Lvk1;

    .line 508
    .line 509
    check-cast v5, Lml0;

    .line 510
    .line 511
    invoke-virtual {v5}, Lml0;->entrySet()Ljava/util/Set;

    .line 512
    .line 513
    .line 514
    move-result-object v5

    .line 515
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 516
    .line 517
    .line 518
    move-result-object v5

    .line 519
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 520
    .line 521
    .line 522
    move-result v13

    .line 523
    if-eqz v13, :cond_e

    .line 524
    .line 525
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object v13

    .line 529
    check-cast v13, Ljava/util/Map$Entry;

    .line 530
    .line 531
    invoke-virtual {v7, v12, v14}, Lxk;->m(II)V

    .line 532
    .line 533
    .line 534
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v15

    .line 538
    move/from16 v18, v14

    .line 539
    .line 540
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 541
    .line 542
    .line 543
    move-result-object v14

    .line 544
    sget v19, Lw20;->c:I

    .line 545
    .line 546
    const/16 v16, 0x1

    .line 547
    .line 548
    invoke-static/range {v16 .. v16}, Lxk;->c(I)I

    .line 549
    .line 550
    .line 551
    move-result v19

    .line 552
    move/from16 v20, v3

    .line 553
    .line 554
    sget-object v3, Lvk1;->n:Lpk1;

    .line 555
    .line 556
    if-ne v10, v3, :cond_6

    .line 557
    .line 558
    mul-int/lit8 v19, v19, 0x2

    .line 559
    .line 560
    :cond_6
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 561
    .line 562
    .line 563
    move-result v21

    .line 564
    move/from16 v22, v4

    .line 565
    .line 566
    const-string v4, "There is no way to get here, but the compiler thinks otherwise."

    .line 567
    .line 568
    const/16 v23, 0x8

    .line 569
    .line 570
    const/16 v24, 0x4

    .line 571
    .line 572
    move-object/from16 v25, v5

    .line 573
    .line 574
    packed-switch v21, :pswitch_data_1

    .line 575
    .line 576
    .line 577
    new-instance v0, Ljava/lang/RuntimeException;

    .line 578
    .line 579
    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    throw v0

    .line 583
    :pswitch_13
    check-cast v15, Ljava/lang/Long;

    .line 584
    .line 585
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 586
    .line 587
    .line 588
    move-result-wide v26

    .line 589
    const/16 v16, 0x1

    .line 590
    .line 591
    shl-long v28, v26, v16

    .line 592
    .line 593
    shr-long v26, v26, v17

    .line 594
    .line 595
    xor-long v26, v28, v26

    .line 596
    .line 597
    invoke-static/range {v26 .. v27}, Lxk;->e(J)I

    .line 598
    .line 599
    .line 600
    move-result v15

    .line 601
    :goto_5
    move v5, v15

    .line 602
    goto/16 :goto_9

    .line 603
    .line 604
    :pswitch_14
    check-cast v15, Ljava/lang/Integer;

    .line 605
    .line 606
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 607
    .line 608
    .line 609
    move-result v15

    .line 610
    shl-int/lit8 v21, v15, 0x1

    .line 611
    .line 612
    shr-int/lit8 v15, v15, 0x1f

    .line 613
    .line 614
    xor-int v15, v21, v15

    .line 615
    .line 616
    invoke-static {v15}, Lxk;->d(I)I

    .line 617
    .line 618
    .line 619
    move-result v15

    .line 620
    goto :goto_5

    .line 621
    :pswitch_15
    check-cast v15, Ljava/lang/Long;

    .line 622
    .line 623
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 624
    .line 625
    .line 626
    :goto_6
    move/from16 v5, v23

    .line 627
    .line 628
    goto/16 :goto_9

    .line 629
    .line 630
    :pswitch_16
    check-cast v15, Ljava/lang/Integer;

    .line 631
    .line 632
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 633
    .line 634
    .line 635
    :goto_7
    move/from16 v5, v24

    .line 636
    .line 637
    goto/16 :goto_9

    .line 638
    .line 639
    :pswitch_17
    instance-of v5, v15, Lx9;

    .line 640
    .line 641
    if-eqz v5, :cond_7

    .line 642
    .line 643
    check-cast v15, Lx9;

    .line 644
    .line 645
    iget v5, v15, Lx9;->j:I

    .line 646
    .line 647
    invoke-static {v5}, Lxk;->a(I)I

    .line 648
    .line 649
    .line 650
    move-result v5

    .line 651
    goto/16 :goto_9

    .line 652
    .line 653
    :cond_7
    check-cast v15, Ljava/lang/Integer;

    .line 654
    .line 655
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 656
    .line 657
    .line 658
    move-result v5

    .line 659
    invoke-static {v5}, Lxk;->a(I)I

    .line 660
    .line 661
    .line 662
    move-result v5

    .line 663
    goto/16 :goto_9

    .line 664
    .line 665
    :pswitch_18
    check-cast v15, Ljava/lang/Integer;

    .line 666
    .line 667
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 668
    .line 669
    .line 670
    move-result v5

    .line 671
    invoke-static {v5}, Lxk;->d(I)I

    .line 672
    .line 673
    .line 674
    move-result v5

    .line 675
    goto/16 :goto_9

    .line 676
    .line 677
    :pswitch_19
    instance-of v5, v15, Lrh;

    .line 678
    .line 679
    if-eqz v5, :cond_8

    .line 680
    .line 681
    check-cast v15, Lrh;

    .line 682
    .line 683
    invoke-virtual {v15}, Lrh;->size()I

    .line 684
    .line 685
    .line 686
    move-result v5

    .line 687
    invoke-static {v5}, Lxk;->d(I)I

    .line 688
    .line 689
    .line 690
    move-result v15

    .line 691
    :goto_8
    add-int/2addr v5, v15

    .line 692
    goto/16 :goto_9

    .line 693
    .line 694
    :cond_8
    check-cast v15, [B

    .line 695
    .line 696
    array-length v5, v15

    .line 697
    invoke-static {v5}, Lxk;->d(I)I

    .line 698
    .line 699
    .line 700
    move-result v15

    .line 701
    goto :goto_8

    .line 702
    :pswitch_1a
    check-cast v15, Lh0;

    .line 703
    .line 704
    check-cast v15, Lia0;

    .line 705
    .line 706
    const/4 v5, 0x0

    .line 707
    invoke-virtual {v15, v5}, Lia0;->g(Lb31;)I

    .line 708
    .line 709
    .line 710
    move-result v15

    .line 711
    invoke-static {v15}, Lxk;->d(I)I

    .line 712
    .line 713
    .line 714
    move-result v21

    .line 715
    add-int v15, v21, v15

    .line 716
    .line 717
    goto :goto_5

    .line 718
    :pswitch_1b
    const/4 v5, 0x0

    .line 719
    check-cast v15, Lh0;

    .line 720
    .line 721
    check-cast v15, Lia0;

    .line 722
    .line 723
    invoke-virtual {v15, v5}, Lia0;->g(Lb31;)I

    .line 724
    .line 725
    .line 726
    move-result v15

    .line 727
    goto :goto_5

    .line 728
    :pswitch_1c
    instance-of v5, v15, Lrh;

    .line 729
    .line 730
    if-eqz v5, :cond_9

    .line 731
    .line 732
    check-cast v15, Lrh;

    .line 733
    .line 734
    invoke-virtual {v15}, Lrh;->size()I

    .line 735
    .line 736
    .line 737
    move-result v5

    .line 738
    invoke-static {v5}, Lxk;->d(I)I

    .line 739
    .line 740
    .line 741
    move-result v15

    .line 742
    goto :goto_8

    .line 743
    :cond_9
    check-cast v15, Ljava/lang/String;

    .line 744
    .line 745
    invoke-static {v15}, Lxk;->b(Ljava/lang/String;)I

    .line 746
    .line 747
    .line 748
    move-result v5

    .line 749
    goto :goto_9

    .line 750
    :pswitch_1d
    check-cast v15, Ljava/lang/Boolean;

    .line 751
    .line 752
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 753
    .line 754
    .line 755
    const/4 v5, 0x1

    .line 756
    goto :goto_9

    .line 757
    :pswitch_1e
    check-cast v15, Ljava/lang/Integer;

    .line 758
    .line 759
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 760
    .line 761
    .line 762
    goto :goto_7

    .line 763
    :pswitch_1f
    check-cast v15, Ljava/lang/Long;

    .line 764
    .line 765
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 766
    .line 767
    .line 768
    goto/16 :goto_6

    .line 769
    .line 770
    :pswitch_20
    check-cast v15, Ljava/lang/Integer;

    .line 771
    .line 772
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 773
    .line 774
    .line 775
    move-result v5

    .line 776
    invoke-static {v5}, Lxk;->a(I)I

    .line 777
    .line 778
    .line 779
    move-result v5

    .line 780
    goto :goto_9

    .line 781
    :pswitch_21
    check-cast v15, Ljava/lang/Long;

    .line 782
    .line 783
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 784
    .line 785
    .line 786
    move-result-wide v26

    .line 787
    invoke-static/range {v26 .. v27}, Lxk;->e(J)I

    .line 788
    .line 789
    .line 790
    move-result v5

    .line 791
    goto :goto_9

    .line 792
    :pswitch_22
    check-cast v15, Ljava/lang/Long;

    .line 793
    .line 794
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 795
    .line 796
    .line 797
    move-result-wide v26

    .line 798
    invoke-static/range {v26 .. v27}, Lxk;->e(J)I

    .line 799
    .line 800
    .line 801
    move-result v5

    .line 802
    goto :goto_9

    .line 803
    :pswitch_23
    check-cast v15, Ljava/lang/Float;

    .line 804
    .line 805
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 806
    .line 807
    .line 808
    goto/16 :goto_7

    .line 809
    .line 810
    :pswitch_24
    check-cast v15, Ljava/lang/Double;

    .line 811
    .line 812
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 813
    .line 814
    .line 815
    goto/16 :goto_6

    .line 816
    .line 817
    :goto_9
    add-int v5, v5, v19

    .line 818
    .line 819
    invoke-static/range {v18 .. v18}, Lxk;->c(I)I

    .line 820
    .line 821
    .line 822
    move-result v15

    .line 823
    if-ne v11, v3, :cond_a

    .line 824
    .line 825
    mul-int/lit8 v15, v15, 0x2

    .line 826
    .line 827
    :cond_a
    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    .line 828
    .line 829
    .line 830
    move-result v3

    .line 831
    packed-switch v3, :pswitch_data_2

    .line 832
    .line 833
    .line 834
    new-instance v0, Ljava/lang/RuntimeException;

    .line 835
    .line 836
    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 837
    .line 838
    .line 839
    throw v0

    .line 840
    :pswitch_25
    check-cast v14, Ljava/lang/Long;

    .line 841
    .line 842
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    .line 843
    .line 844
    .line 845
    move-result-wide v3

    .line 846
    const/16 v16, 0x1

    .line 847
    .line 848
    shl-long v23, v3, v16

    .line 849
    .line 850
    shr-long v3, v3, v17

    .line 851
    .line 852
    xor-long v3, v23, v3

    .line 853
    .line 854
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 855
    .line 856
    .line 857
    move-result v3

    .line 858
    goto/16 :goto_d

    .line 859
    .line 860
    :pswitch_26
    check-cast v14, Ljava/lang/Integer;

    .line 861
    .line 862
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 863
    .line 864
    .line 865
    move-result v3

    .line 866
    shl-int/lit8 v4, v3, 0x1

    .line 867
    .line 868
    shr-int/lit8 v3, v3, 0x1f

    .line 869
    .line 870
    xor-int/2addr v3, v4

    .line 871
    invoke-static {v3}, Lxk;->d(I)I

    .line 872
    .line 873
    .line 874
    move-result v3

    .line 875
    goto/16 :goto_d

    .line 876
    .line 877
    :pswitch_27
    check-cast v14, Ljava/lang/Long;

    .line 878
    .line 879
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 880
    .line 881
    .line 882
    :goto_a
    move/from16 v3, v23

    .line 883
    .line 884
    goto/16 :goto_d

    .line 885
    .line 886
    :pswitch_28
    check-cast v14, Ljava/lang/Integer;

    .line 887
    .line 888
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 889
    .line 890
    .line 891
    :goto_b
    move/from16 v3, v24

    .line 892
    .line 893
    goto/16 :goto_d

    .line 894
    .line 895
    :pswitch_29
    instance-of v3, v14, Lx9;

    .line 896
    .line 897
    if-eqz v3, :cond_b

    .line 898
    .line 899
    check-cast v14, Lx9;

    .line 900
    .line 901
    iget v3, v14, Lx9;->j:I

    .line 902
    .line 903
    invoke-static {v3}, Lxk;->a(I)I

    .line 904
    .line 905
    .line 906
    move-result v3

    .line 907
    goto/16 :goto_d

    .line 908
    .line 909
    :cond_b
    check-cast v14, Ljava/lang/Integer;

    .line 910
    .line 911
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 912
    .line 913
    .line 914
    move-result v3

    .line 915
    invoke-static {v3}, Lxk;->a(I)I

    .line 916
    .line 917
    .line 918
    move-result v3

    .line 919
    goto/16 :goto_d

    .line 920
    .line 921
    :pswitch_2a
    check-cast v14, Ljava/lang/Integer;

    .line 922
    .line 923
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 924
    .line 925
    .line 926
    move-result v3

    .line 927
    invoke-static {v3}, Lxk;->d(I)I

    .line 928
    .line 929
    .line 930
    move-result v3

    .line 931
    goto/16 :goto_d

    .line 932
    .line 933
    :pswitch_2b
    instance-of v3, v14, Lrh;

    .line 934
    .line 935
    if-eqz v3, :cond_c

    .line 936
    .line 937
    check-cast v14, Lrh;

    .line 938
    .line 939
    invoke-virtual {v14}, Lrh;->size()I

    .line 940
    .line 941
    .line 942
    move-result v3

    .line 943
    invoke-static {v3}, Lxk;->d(I)I

    .line 944
    .line 945
    .line 946
    move-result v4

    .line 947
    :goto_c
    add-int/2addr v3, v4

    .line 948
    goto/16 :goto_d

    .line 949
    .line 950
    :cond_c
    check-cast v14, [B

    .line 951
    .line 952
    array-length v3, v14

    .line 953
    invoke-static {v3}, Lxk;->d(I)I

    .line 954
    .line 955
    .line 956
    move-result v4

    .line 957
    goto :goto_c

    .line 958
    :pswitch_2c
    check-cast v14, Lh0;

    .line 959
    .line 960
    check-cast v14, Lia0;

    .line 961
    .line 962
    const/4 v3, 0x0

    .line 963
    invoke-virtual {v14, v3}, Lia0;->g(Lb31;)I

    .line 964
    .line 965
    .line 966
    move-result v3

    .line 967
    invoke-static {v3}, Lxk;->d(I)I

    .line 968
    .line 969
    .line 970
    move-result v4

    .line 971
    goto :goto_c

    .line 972
    :pswitch_2d
    const/4 v3, 0x0

    .line 973
    check-cast v14, Lh0;

    .line 974
    .line 975
    check-cast v14, Lia0;

    .line 976
    .line 977
    invoke-virtual {v14, v3}, Lia0;->g(Lb31;)I

    .line 978
    .line 979
    .line 980
    move-result v3

    .line 981
    goto :goto_d

    .line 982
    :pswitch_2e
    instance-of v3, v14, Lrh;

    .line 983
    .line 984
    if-eqz v3, :cond_d

    .line 985
    .line 986
    check-cast v14, Lrh;

    .line 987
    .line 988
    invoke-virtual {v14}, Lrh;->size()I

    .line 989
    .line 990
    .line 991
    move-result v3

    .line 992
    invoke-static {v3}, Lxk;->d(I)I

    .line 993
    .line 994
    .line 995
    move-result v4

    .line 996
    goto :goto_c

    .line 997
    :cond_d
    check-cast v14, Ljava/lang/String;

    .line 998
    .line 999
    invoke-static {v14}, Lxk;->b(Ljava/lang/String;)I

    .line 1000
    .line 1001
    .line 1002
    move-result v3

    .line 1003
    goto :goto_d

    .line 1004
    :pswitch_2f
    check-cast v14, Ljava/lang/Boolean;

    .line 1005
    .line 1006
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1007
    .line 1008
    .line 1009
    const/4 v3, 0x1

    .line 1010
    goto :goto_d

    .line 1011
    :pswitch_30
    check-cast v14, Ljava/lang/Integer;

    .line 1012
    .line 1013
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1014
    .line 1015
    .line 1016
    goto :goto_b

    .line 1017
    :pswitch_31
    check-cast v14, Ljava/lang/Long;

    .line 1018
    .line 1019
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1020
    .line 1021
    .line 1022
    goto/16 :goto_a

    .line 1023
    .line 1024
    :pswitch_32
    check-cast v14, Ljava/lang/Integer;

    .line 1025
    .line 1026
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 1027
    .line 1028
    .line 1029
    move-result v3

    .line 1030
    invoke-static {v3}, Lxk;->a(I)I

    .line 1031
    .line 1032
    .line 1033
    move-result v3

    .line 1034
    goto :goto_d

    .line 1035
    :pswitch_33
    check-cast v14, Ljava/lang/Long;

    .line 1036
    .line 1037
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    .line 1038
    .line 1039
    .line 1040
    move-result-wide v3

    .line 1041
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 1042
    .line 1043
    .line 1044
    move-result v3

    .line 1045
    goto :goto_d

    .line 1046
    :pswitch_34
    check-cast v14, Ljava/lang/Long;

    .line 1047
    .line 1048
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    .line 1049
    .line 1050
    .line 1051
    move-result-wide v3

    .line 1052
    invoke-static {v3, v4}, Lxk;->e(J)I

    .line 1053
    .line 1054
    .line 1055
    move-result v3

    .line 1056
    goto :goto_d

    .line 1057
    :pswitch_35
    check-cast v14, Ljava/lang/Float;

    .line 1058
    .line 1059
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1060
    .line 1061
    .line 1062
    goto/16 :goto_b

    .line 1063
    .line 1064
    :pswitch_36
    check-cast v14, Ljava/lang/Double;

    .line 1065
    .line 1066
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1067
    .line 1068
    .line 1069
    goto/16 :goto_a

    .line 1070
    .line 1071
    :goto_d
    add-int/2addr v3, v15

    .line 1072
    add-int/2addr v3, v5

    .line 1073
    invoke-virtual {v7, v3}, Lxk;->n(I)V

    .line 1074
    .line 1075
    .line 1076
    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v3

    .line 1080
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v4

    .line 1084
    const/4 v5, 0x1

    .line 1085
    invoke-static {v7, v10, v5, v3}, Lw20;->b(Lxk;Lvk1;ILjava/lang/Object;)V

    .line 1086
    .line 1087
    .line 1088
    move/from16 v3, v18

    .line 1089
    .line 1090
    invoke-static {v7, v11, v3, v4}, Lw20;->b(Lxk;Lvk1;ILjava/lang/Object;)V

    .line 1091
    .line 1092
    .line 1093
    move v14, v3

    .line 1094
    move/from16 v3, v20

    .line 1095
    .line 1096
    move/from16 v4, v22

    .line 1097
    .line 1098
    move-object/from16 v5, v25

    .line 1099
    .line 1100
    goto/16 :goto_4

    .line 1101
    .line 1102
    :cond_e
    move/from16 v20, v3

    .line 1103
    .line 1104
    move/from16 v22, v4

    .line 1105
    .line 1106
    :cond_f
    :goto_e
    move/from16 v3, v20

    .line 1107
    .line 1108
    move/from16 v4, v22

    .line 1109
    .line 1110
    goto/16 :goto_3

    .line 1111
    .line 1112
    :pswitch_37
    move/from16 v20, v3

    .line 1113
    .line 1114
    move/from16 v22, v4

    .line 1115
    .line 1116
    aget v3, v8, v2

    .line 1117
    .line 1118
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1119
    .line 1120
    .line 1121
    move-result-object v4

    .line 1122
    check-cast v4, Ljava/util/List;

    .line 1123
    .line 1124
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 1125
    .line 1126
    .line 1127
    move-result-object v5

    .line 1128
    sget-object v10, Lf31;->a:Ljava/lang/Class;

    .line 1129
    .line 1130
    if-eqz v4, :cond_f

    .line 1131
    .line 1132
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1133
    .line 1134
    .line 1135
    move-result v10

    .line 1136
    if-nez v10, :cond_f

    .line 1137
    .line 1138
    const/4 v10, 0x0

    .line 1139
    :goto_f
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1140
    .line 1141
    .line 1142
    move-result v11

    .line 1143
    if-ge v10, v11, :cond_f

    .line 1144
    .line 1145
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v11

    .line 1149
    invoke-virtual {v6, v3, v11, v5}, Lpa0;->u(ILjava/lang/Object;Lb31;)V

    .line 1150
    .line 1151
    .line 1152
    add-int/lit8 v10, v10, 0x1

    .line 1153
    .line 1154
    goto :goto_f

    .line 1155
    :pswitch_38
    move/from16 v20, v3

    .line 1156
    .line 1157
    move/from16 v22, v4

    .line 1158
    .line 1159
    aget v3, v8, v2

    .line 1160
    .line 1161
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1162
    .line 1163
    .line 1164
    move-result-object v4

    .line 1165
    check-cast v4, Ljava/util/List;

    .line 1166
    .line 1167
    const/4 v5, 0x1

    .line 1168
    invoke-static {v3, v4, v6, v5}, Lf31;->w(ILjava/util/List;Lpa0;Z)V

    .line 1169
    .line 1170
    .line 1171
    goto :goto_e

    .line 1172
    :pswitch_39
    move/from16 v20, v3

    .line 1173
    .line 1174
    move/from16 v22, v4

    .line 1175
    .line 1176
    move/from16 v5, v16

    .line 1177
    .line 1178
    aget v3, v8, v2

    .line 1179
    .line 1180
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v4

    .line 1184
    check-cast v4, Ljava/util/List;

    .line 1185
    .line 1186
    invoke-static {v3, v4, v6, v5}, Lf31;->v(ILjava/util/List;Lpa0;Z)V

    .line 1187
    .line 1188
    .line 1189
    goto :goto_e

    .line 1190
    :pswitch_3a
    move/from16 v20, v3

    .line 1191
    .line 1192
    move/from16 v22, v4

    .line 1193
    .line 1194
    move/from16 v5, v16

    .line 1195
    .line 1196
    aget v3, v8, v2

    .line 1197
    .line 1198
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1199
    .line 1200
    .line 1201
    move-result-object v4

    .line 1202
    check-cast v4, Ljava/util/List;

    .line 1203
    .line 1204
    invoke-static {v3, v4, v6, v5}, Lf31;->u(ILjava/util/List;Lpa0;Z)V

    .line 1205
    .line 1206
    .line 1207
    goto :goto_e

    .line 1208
    :pswitch_3b
    move/from16 v20, v3

    .line 1209
    .line 1210
    move/from16 v22, v4

    .line 1211
    .line 1212
    move/from16 v5, v16

    .line 1213
    .line 1214
    aget v3, v8, v2

    .line 1215
    .line 1216
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v4

    .line 1220
    check-cast v4, Ljava/util/List;

    .line 1221
    .line 1222
    invoke-static {v3, v4, v6, v5}, Lf31;->t(ILjava/util/List;Lpa0;Z)V

    .line 1223
    .line 1224
    .line 1225
    goto :goto_e

    .line 1226
    :pswitch_3c
    move/from16 v20, v3

    .line 1227
    .line 1228
    move/from16 v22, v4

    .line 1229
    .line 1230
    move/from16 v5, v16

    .line 1231
    .line 1232
    aget v3, v8, v2

    .line 1233
    .line 1234
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v4

    .line 1238
    check-cast v4, Ljava/util/List;

    .line 1239
    .line 1240
    invoke-static {v3, v4, v6, v5}, Lf31;->n(ILjava/util/List;Lpa0;Z)V

    .line 1241
    .line 1242
    .line 1243
    goto/16 :goto_e

    .line 1244
    .line 1245
    :pswitch_3d
    move/from16 v20, v3

    .line 1246
    .line 1247
    move/from16 v22, v4

    .line 1248
    .line 1249
    move/from16 v5, v16

    .line 1250
    .line 1251
    aget v3, v8, v2

    .line 1252
    .line 1253
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1254
    .line 1255
    .line 1256
    move-result-object v4

    .line 1257
    check-cast v4, Ljava/util/List;

    .line 1258
    .line 1259
    invoke-static {v3, v4, v6, v5}, Lf31;->x(ILjava/util/List;Lpa0;Z)V

    .line 1260
    .line 1261
    .line 1262
    goto/16 :goto_e

    .line 1263
    .line 1264
    :pswitch_3e
    move/from16 v20, v3

    .line 1265
    .line 1266
    move/from16 v22, v4

    .line 1267
    .line 1268
    move/from16 v5, v16

    .line 1269
    .line 1270
    aget v3, v8, v2

    .line 1271
    .line 1272
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1273
    .line 1274
    .line 1275
    move-result-object v4

    .line 1276
    check-cast v4, Ljava/util/List;

    .line 1277
    .line 1278
    invoke-static {v3, v4, v6, v5}, Lf31;->l(ILjava/util/List;Lpa0;Z)V

    .line 1279
    .line 1280
    .line 1281
    goto/16 :goto_e

    .line 1282
    .line 1283
    :pswitch_3f
    move/from16 v20, v3

    .line 1284
    .line 1285
    move/from16 v22, v4

    .line 1286
    .line 1287
    move/from16 v5, v16

    .line 1288
    .line 1289
    aget v3, v8, v2

    .line 1290
    .line 1291
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v4

    .line 1295
    check-cast v4, Ljava/util/List;

    .line 1296
    .line 1297
    invoke-static {v3, v4, v6, v5}, Lf31;->o(ILjava/util/List;Lpa0;Z)V

    .line 1298
    .line 1299
    .line 1300
    goto/16 :goto_e

    .line 1301
    .line 1302
    :pswitch_40
    move/from16 v20, v3

    .line 1303
    .line 1304
    move/from16 v22, v4

    .line 1305
    .line 1306
    move/from16 v5, v16

    .line 1307
    .line 1308
    aget v3, v8, v2

    .line 1309
    .line 1310
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1311
    .line 1312
    .line 1313
    move-result-object v4

    .line 1314
    check-cast v4, Ljava/util/List;

    .line 1315
    .line 1316
    invoke-static {v3, v4, v6, v5}, Lf31;->p(ILjava/util/List;Lpa0;Z)V

    .line 1317
    .line 1318
    .line 1319
    goto/16 :goto_e

    .line 1320
    .line 1321
    :pswitch_41
    move/from16 v20, v3

    .line 1322
    .line 1323
    move/from16 v22, v4

    .line 1324
    .line 1325
    move/from16 v5, v16

    .line 1326
    .line 1327
    aget v3, v8, v2

    .line 1328
    .line 1329
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1330
    .line 1331
    .line 1332
    move-result-object v4

    .line 1333
    check-cast v4, Ljava/util/List;

    .line 1334
    .line 1335
    invoke-static {v3, v4, v6, v5}, Lf31;->r(ILjava/util/List;Lpa0;Z)V

    .line 1336
    .line 1337
    .line 1338
    goto/16 :goto_e

    .line 1339
    .line 1340
    :pswitch_42
    move/from16 v20, v3

    .line 1341
    .line 1342
    move/from16 v22, v4

    .line 1343
    .line 1344
    move/from16 v5, v16

    .line 1345
    .line 1346
    aget v3, v8, v2

    .line 1347
    .line 1348
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1349
    .line 1350
    .line 1351
    move-result-object v4

    .line 1352
    check-cast v4, Ljava/util/List;

    .line 1353
    .line 1354
    invoke-static {v3, v4, v6, v5}, Lf31;->y(ILjava/util/List;Lpa0;Z)V

    .line 1355
    .line 1356
    .line 1357
    goto/16 :goto_e

    .line 1358
    .line 1359
    :pswitch_43
    move/from16 v20, v3

    .line 1360
    .line 1361
    move/from16 v22, v4

    .line 1362
    .line 1363
    move/from16 v5, v16

    .line 1364
    .line 1365
    aget v3, v8, v2

    .line 1366
    .line 1367
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v4

    .line 1371
    check-cast v4, Ljava/util/List;

    .line 1372
    .line 1373
    invoke-static {v3, v4, v6, v5}, Lf31;->s(ILjava/util/List;Lpa0;Z)V

    .line 1374
    .line 1375
    .line 1376
    goto/16 :goto_e

    .line 1377
    .line 1378
    :pswitch_44
    move/from16 v20, v3

    .line 1379
    .line 1380
    move/from16 v22, v4

    .line 1381
    .line 1382
    move/from16 v5, v16

    .line 1383
    .line 1384
    aget v3, v8, v2

    .line 1385
    .line 1386
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v4

    .line 1390
    check-cast v4, Ljava/util/List;

    .line 1391
    .line 1392
    invoke-static {v3, v4, v6, v5}, Lf31;->q(ILjava/util/List;Lpa0;Z)V

    .line 1393
    .line 1394
    .line 1395
    goto/16 :goto_e

    .line 1396
    .line 1397
    :pswitch_45
    move/from16 v20, v3

    .line 1398
    .line 1399
    move/from16 v22, v4

    .line 1400
    .line 1401
    move/from16 v5, v16

    .line 1402
    .line 1403
    aget v3, v8, v2

    .line 1404
    .line 1405
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v4

    .line 1409
    check-cast v4, Ljava/util/List;

    .line 1410
    .line 1411
    invoke-static {v3, v4, v6, v5}, Lf31;->m(ILjava/util/List;Lpa0;Z)V

    .line 1412
    .line 1413
    .line 1414
    goto/16 :goto_e

    .line 1415
    .line 1416
    :pswitch_46
    move/from16 v20, v3

    .line 1417
    .line 1418
    move/from16 v22, v4

    .line 1419
    .line 1420
    aget v3, v8, v2

    .line 1421
    .line 1422
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1423
    .line 1424
    .line 1425
    move-result-object v4

    .line 1426
    check-cast v4, Ljava/util/List;

    .line 1427
    .line 1428
    const/4 v13, 0x0

    .line 1429
    invoke-static {v3, v4, v6, v13}, Lf31;->w(ILjava/util/List;Lpa0;Z)V

    .line 1430
    .line 1431
    .line 1432
    :goto_10
    move/from16 v3, v20

    .line 1433
    .line 1434
    move/from16 v4, v22

    .line 1435
    .line 1436
    goto/16 :goto_18

    .line 1437
    .line 1438
    :pswitch_47
    move/from16 v20, v3

    .line 1439
    .line 1440
    move/from16 v22, v4

    .line 1441
    .line 1442
    const/4 v13, 0x0

    .line 1443
    aget v3, v8, v2

    .line 1444
    .line 1445
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1446
    .line 1447
    .line 1448
    move-result-object v4

    .line 1449
    check-cast v4, Ljava/util/List;

    .line 1450
    .line 1451
    invoke-static {v3, v4, v6, v13}, Lf31;->v(ILjava/util/List;Lpa0;Z)V

    .line 1452
    .line 1453
    .line 1454
    goto :goto_10

    .line 1455
    :pswitch_48
    move/from16 v20, v3

    .line 1456
    .line 1457
    move/from16 v22, v4

    .line 1458
    .line 1459
    const/4 v13, 0x0

    .line 1460
    aget v3, v8, v2

    .line 1461
    .line 1462
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1463
    .line 1464
    .line 1465
    move-result-object v4

    .line 1466
    check-cast v4, Ljava/util/List;

    .line 1467
    .line 1468
    invoke-static {v3, v4, v6, v13}, Lf31;->u(ILjava/util/List;Lpa0;Z)V

    .line 1469
    .line 1470
    .line 1471
    goto :goto_10

    .line 1472
    :pswitch_49
    move/from16 v20, v3

    .line 1473
    .line 1474
    move/from16 v22, v4

    .line 1475
    .line 1476
    const/4 v13, 0x0

    .line 1477
    aget v3, v8, v2

    .line 1478
    .line 1479
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1480
    .line 1481
    .line 1482
    move-result-object v4

    .line 1483
    check-cast v4, Ljava/util/List;

    .line 1484
    .line 1485
    invoke-static {v3, v4, v6, v13}, Lf31;->t(ILjava/util/List;Lpa0;Z)V

    .line 1486
    .line 1487
    .line 1488
    goto :goto_10

    .line 1489
    :pswitch_4a
    move/from16 v20, v3

    .line 1490
    .line 1491
    move/from16 v22, v4

    .line 1492
    .line 1493
    const/4 v13, 0x0

    .line 1494
    aget v3, v8, v2

    .line 1495
    .line 1496
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1497
    .line 1498
    .line 1499
    move-result-object v4

    .line 1500
    check-cast v4, Ljava/util/List;

    .line 1501
    .line 1502
    invoke-static {v3, v4, v6, v13}, Lf31;->n(ILjava/util/List;Lpa0;Z)V

    .line 1503
    .line 1504
    .line 1505
    goto :goto_10

    .line 1506
    :pswitch_4b
    move/from16 v20, v3

    .line 1507
    .line 1508
    move/from16 v22, v4

    .line 1509
    .line 1510
    const/4 v13, 0x0

    .line 1511
    aget v3, v8, v2

    .line 1512
    .line 1513
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1514
    .line 1515
    .line 1516
    move-result-object v4

    .line 1517
    check-cast v4, Ljava/util/List;

    .line 1518
    .line 1519
    invoke-static {v3, v4, v6, v13}, Lf31;->x(ILjava/util/List;Lpa0;Z)V

    .line 1520
    .line 1521
    .line 1522
    goto :goto_10

    .line 1523
    :pswitch_4c
    move/from16 v20, v3

    .line 1524
    .line 1525
    move/from16 v22, v4

    .line 1526
    .line 1527
    aget v3, v8, v2

    .line 1528
    .line 1529
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1530
    .line 1531
    .line 1532
    move-result-object v4

    .line 1533
    check-cast v4, Ljava/util/List;

    .line 1534
    .line 1535
    sget-object v5, Lf31;->a:Ljava/lang/Class;

    .line 1536
    .line 1537
    if-eqz v4, :cond_f

    .line 1538
    .line 1539
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1540
    .line 1541
    .line 1542
    move-result v5

    .line 1543
    if-nez v5, :cond_f

    .line 1544
    .line 1545
    const/4 v5, 0x0

    .line 1546
    :goto_11
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1547
    .line 1548
    .line 1549
    move-result v10

    .line 1550
    if-ge v5, v10, :cond_f

    .line 1551
    .line 1552
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1553
    .line 1554
    .line 1555
    move-result-object v10

    .line 1556
    check-cast v10, Lrh;

    .line 1557
    .line 1558
    const/4 v11, 0x2

    .line 1559
    invoke-virtual {v7, v3, v11}, Lxk;->m(II)V

    .line 1560
    .line 1561
    .line 1562
    invoke-virtual {v7, v10}, Lxk;->h(Lrh;)V

    .line 1563
    .line 1564
    .line 1565
    add-int/lit8 v5, v5, 0x1

    .line 1566
    .line 1567
    goto :goto_11

    .line 1568
    :pswitch_4d
    move/from16 v20, v3

    .line 1569
    .line 1570
    move/from16 v22, v4

    .line 1571
    .line 1572
    aget v3, v8, v2

    .line 1573
    .line 1574
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1575
    .line 1576
    .line 1577
    move-result-object v4

    .line 1578
    check-cast v4, Ljava/util/List;

    .line 1579
    .line 1580
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 1581
    .line 1582
    .line 1583
    move-result-object v5

    .line 1584
    sget-object v10, Lf31;->a:Ljava/lang/Class;

    .line 1585
    .line 1586
    if-eqz v4, :cond_f

    .line 1587
    .line 1588
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1589
    .line 1590
    .line 1591
    move-result v10

    .line 1592
    if-nez v10, :cond_f

    .line 1593
    .line 1594
    const/4 v10, 0x0

    .line 1595
    :goto_12
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1596
    .line 1597
    .line 1598
    move-result v11

    .line 1599
    if-ge v10, v11, :cond_f

    .line 1600
    .line 1601
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1602
    .line 1603
    .line 1604
    move-result-object v11

    .line 1605
    invoke-virtual {v6, v3, v11, v5}, Lpa0;->v(ILjava/lang/Object;Lb31;)V

    .line 1606
    .line 1607
    .line 1608
    add-int/lit8 v10, v10, 0x1

    .line 1609
    .line 1610
    goto :goto_12

    .line 1611
    :pswitch_4e
    move/from16 v20, v3

    .line 1612
    .line 1613
    move/from16 v22, v4

    .line 1614
    .line 1615
    aget v3, v8, v2

    .line 1616
    .line 1617
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1618
    .line 1619
    .line 1620
    move-result-object v4

    .line 1621
    check-cast v4, Ljava/util/List;

    .line 1622
    .line 1623
    sget-object v5, Lf31;->a:Ljava/lang/Class;

    .line 1624
    .line 1625
    if-eqz v4, :cond_f

    .line 1626
    .line 1627
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1628
    .line 1629
    .line 1630
    move-result v5

    .line 1631
    if-nez v5, :cond_f

    .line 1632
    .line 1633
    instance-of v5, v4, Loh0;

    .line 1634
    .line 1635
    if-eqz v5, :cond_11

    .line 1636
    .line 1637
    move-object v5, v4

    .line 1638
    check-cast v5, Loh0;

    .line 1639
    .line 1640
    const/4 v10, 0x0

    .line 1641
    :goto_13
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1642
    .line 1643
    .line 1644
    move-result v11

    .line 1645
    if-ge v10, v11, :cond_f

    .line 1646
    .line 1647
    invoke-interface {v5, v10}, Loh0;->m(I)Ljava/lang/Object;

    .line 1648
    .line 1649
    .line 1650
    move-result-object v11

    .line 1651
    instance-of v12, v11, Ljava/lang/String;

    .line 1652
    .line 1653
    if-eqz v12, :cond_10

    .line 1654
    .line 1655
    check-cast v11, Ljava/lang/String;

    .line 1656
    .line 1657
    const/4 v12, 0x2

    .line 1658
    invoke-virtual {v7, v3, v12}, Lxk;->m(II)V

    .line 1659
    .line 1660
    .line 1661
    invoke-virtual {v7, v11}, Lxk;->l(Ljava/lang/String;)V

    .line 1662
    .line 1663
    .line 1664
    goto :goto_14

    .line 1665
    :cond_10
    const/4 v12, 0x2

    .line 1666
    check-cast v11, Lrh;

    .line 1667
    .line 1668
    invoke-virtual {v7, v3, v12}, Lxk;->m(II)V

    .line 1669
    .line 1670
    .line 1671
    invoke-virtual {v7, v11}, Lxk;->h(Lrh;)V

    .line 1672
    .line 1673
    .line 1674
    :goto_14
    add-int/lit8 v10, v10, 0x1

    .line 1675
    .line 1676
    goto :goto_13

    .line 1677
    :cond_11
    const/4 v5, 0x0

    .line 1678
    :goto_15
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1679
    .line 1680
    .line 1681
    move-result v10

    .line 1682
    if-ge v5, v10, :cond_f

    .line 1683
    .line 1684
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1685
    .line 1686
    .line 1687
    move-result-object v10

    .line 1688
    check-cast v10, Ljava/lang/String;

    .line 1689
    .line 1690
    const/4 v11, 0x2

    .line 1691
    invoke-virtual {v7, v3, v11}, Lxk;->m(II)V

    .line 1692
    .line 1693
    .line 1694
    invoke-virtual {v7, v10}, Lxk;->l(Ljava/lang/String;)V

    .line 1695
    .line 1696
    .line 1697
    add-int/lit8 v5, v5, 0x1

    .line 1698
    .line 1699
    goto :goto_15

    .line 1700
    :pswitch_4f
    move/from16 v20, v3

    .line 1701
    .line 1702
    move/from16 v22, v4

    .line 1703
    .line 1704
    aget v3, v8, v2

    .line 1705
    .line 1706
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1707
    .line 1708
    .line 1709
    move-result-object v4

    .line 1710
    check-cast v4, Ljava/util/List;

    .line 1711
    .line 1712
    const/4 v13, 0x0

    .line 1713
    invoke-static {v3, v4, v6, v13}, Lf31;->l(ILjava/util/List;Lpa0;Z)V

    .line 1714
    .line 1715
    .line 1716
    goto/16 :goto_10

    .line 1717
    .line 1718
    :pswitch_50
    move/from16 v20, v3

    .line 1719
    .line 1720
    move/from16 v22, v4

    .line 1721
    .line 1722
    const/4 v13, 0x0

    .line 1723
    aget v3, v8, v2

    .line 1724
    .line 1725
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1726
    .line 1727
    .line 1728
    move-result-object v4

    .line 1729
    check-cast v4, Ljava/util/List;

    .line 1730
    .line 1731
    invoke-static {v3, v4, v6, v13}, Lf31;->o(ILjava/util/List;Lpa0;Z)V

    .line 1732
    .line 1733
    .line 1734
    goto/16 :goto_10

    .line 1735
    .line 1736
    :pswitch_51
    move/from16 v20, v3

    .line 1737
    .line 1738
    move/from16 v22, v4

    .line 1739
    .line 1740
    const/4 v13, 0x0

    .line 1741
    aget v3, v8, v2

    .line 1742
    .line 1743
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1744
    .line 1745
    .line 1746
    move-result-object v4

    .line 1747
    check-cast v4, Ljava/util/List;

    .line 1748
    .line 1749
    invoke-static {v3, v4, v6, v13}, Lf31;->p(ILjava/util/List;Lpa0;Z)V

    .line 1750
    .line 1751
    .line 1752
    goto/16 :goto_10

    .line 1753
    .line 1754
    :pswitch_52
    move/from16 v20, v3

    .line 1755
    .line 1756
    move/from16 v22, v4

    .line 1757
    .line 1758
    const/4 v13, 0x0

    .line 1759
    aget v3, v8, v2

    .line 1760
    .line 1761
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1762
    .line 1763
    .line 1764
    move-result-object v4

    .line 1765
    check-cast v4, Ljava/util/List;

    .line 1766
    .line 1767
    invoke-static {v3, v4, v6, v13}, Lf31;->r(ILjava/util/List;Lpa0;Z)V

    .line 1768
    .line 1769
    .line 1770
    goto/16 :goto_10

    .line 1771
    .line 1772
    :pswitch_53
    move/from16 v20, v3

    .line 1773
    .line 1774
    move/from16 v22, v4

    .line 1775
    .line 1776
    const/4 v13, 0x0

    .line 1777
    aget v3, v8, v2

    .line 1778
    .line 1779
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1780
    .line 1781
    .line 1782
    move-result-object v4

    .line 1783
    check-cast v4, Ljava/util/List;

    .line 1784
    .line 1785
    invoke-static {v3, v4, v6, v13}, Lf31;->y(ILjava/util/List;Lpa0;Z)V

    .line 1786
    .line 1787
    .line 1788
    goto/16 :goto_10

    .line 1789
    .line 1790
    :pswitch_54
    move/from16 v20, v3

    .line 1791
    .line 1792
    move/from16 v22, v4

    .line 1793
    .line 1794
    const/4 v13, 0x0

    .line 1795
    aget v3, v8, v2

    .line 1796
    .line 1797
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1798
    .line 1799
    .line 1800
    move-result-object v4

    .line 1801
    check-cast v4, Ljava/util/List;

    .line 1802
    .line 1803
    invoke-static {v3, v4, v6, v13}, Lf31;->s(ILjava/util/List;Lpa0;Z)V

    .line 1804
    .line 1805
    .line 1806
    goto/16 :goto_10

    .line 1807
    .line 1808
    :pswitch_55
    move/from16 v20, v3

    .line 1809
    .line 1810
    move/from16 v22, v4

    .line 1811
    .line 1812
    const/4 v13, 0x0

    .line 1813
    aget v3, v8, v2

    .line 1814
    .line 1815
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1816
    .line 1817
    .line 1818
    move-result-object v4

    .line 1819
    check-cast v4, Ljava/util/List;

    .line 1820
    .line 1821
    invoke-static {v3, v4, v6, v13}, Lf31;->q(ILjava/util/List;Lpa0;Z)V

    .line 1822
    .line 1823
    .line 1824
    goto/16 :goto_10

    .line 1825
    .line 1826
    :pswitch_56
    move/from16 v20, v3

    .line 1827
    .line 1828
    move/from16 v22, v4

    .line 1829
    .line 1830
    const/4 v13, 0x0

    .line 1831
    aget v3, v8, v2

    .line 1832
    .line 1833
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1834
    .line 1835
    .line 1836
    move-result-object v4

    .line 1837
    check-cast v4, Ljava/util/List;

    .line 1838
    .line 1839
    invoke-static {v3, v4, v6, v13}, Lf31;->m(ILjava/util/List;Lpa0;Z)V

    .line 1840
    .line 1841
    .line 1842
    goto/16 :goto_10

    .line 1843
    .line 1844
    :pswitch_57
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1845
    .line 1846
    .line 1847
    move-result v5

    .line 1848
    if-eqz v5, :cond_3

    .line 1849
    .line 1850
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1851
    .line 1852
    .line 1853
    move-result-object v5

    .line 1854
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 1855
    .line 1856
    .line 1857
    move-result-object v10

    .line 1858
    invoke-virtual {v6, v12, v5, v10}, Lpa0;->u(ILjava/lang/Object;Lb31;)V

    .line 1859
    .line 1860
    .line 1861
    goto/16 :goto_3

    .line 1862
    .line 1863
    :pswitch_58
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1864
    .line 1865
    .line 1866
    move-result v5

    .line 1867
    if-eqz v5, :cond_13

    .line 1868
    .line 1869
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1870
    .line 1871
    .line 1872
    move-result-wide v10

    .line 1873
    const/16 v16, 0x1

    .line 1874
    .line 1875
    shl-long v13, v10, v16

    .line 1876
    .line 1877
    shr-long v10, v10, v17

    .line 1878
    .line 1879
    xor-long/2addr v10, v13

    .line 1880
    const/4 v13, 0x0

    .line 1881
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 1882
    .line 1883
    .line 1884
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 1885
    .line 1886
    .line 1887
    :cond_12
    :goto_16
    move-object/from16 v0, p0

    .line 1888
    .line 1889
    goto/16 :goto_18

    .line 1890
    .line 1891
    :cond_13
    :goto_17
    const/4 v13, 0x0

    .line 1892
    goto :goto_16

    .line 1893
    :pswitch_59
    const/4 v13, 0x0

    .line 1894
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1895
    .line 1896
    .line 1897
    move-result v5

    .line 1898
    if-eqz v5, :cond_12

    .line 1899
    .line 1900
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1901
    .line 1902
    .line 1903
    move-result v0

    .line 1904
    shl-int/lit8 v5, v0, 0x1

    .line 1905
    .line 1906
    shr-int/lit8 v0, v0, 0x1f

    .line 1907
    .line 1908
    xor-int/2addr v0, v5

    .line 1909
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 1910
    .line 1911
    .line 1912
    invoke-virtual {v7, v0}, Lxk;->n(I)V

    .line 1913
    .line 1914
    .line 1915
    goto :goto_17

    .line 1916
    :pswitch_5a
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1917
    .line 1918
    .line 1919
    move-result v5

    .line 1920
    if-eqz v5, :cond_13

    .line 1921
    .line 1922
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1923
    .line 1924
    .line 1925
    move-result-wide v10

    .line 1926
    const/4 v5, 0x1

    .line 1927
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 1928
    .line 1929
    .line 1930
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 1931
    .line 1932
    .line 1933
    goto :goto_17

    .line 1934
    :pswitch_5b
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1935
    .line 1936
    .line 1937
    move-result v5

    .line 1938
    if-eqz v5, :cond_13

    .line 1939
    .line 1940
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1941
    .line 1942
    .line 1943
    move-result v0

    .line 1944
    const/4 v10, 0x5

    .line 1945
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 1946
    .line 1947
    .line 1948
    invoke-virtual {v7, v0}, Lxk;->i(I)V

    .line 1949
    .line 1950
    .line 1951
    goto :goto_17

    .line 1952
    :pswitch_5c
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1953
    .line 1954
    .line 1955
    move-result v5

    .line 1956
    if-eqz v5, :cond_13

    .line 1957
    .line 1958
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1959
    .line 1960
    .line 1961
    move-result v0

    .line 1962
    const/4 v13, 0x0

    .line 1963
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 1964
    .line 1965
    .line 1966
    invoke-virtual {v7, v0}, Lxk;->k(I)V

    .line 1967
    .line 1968
    .line 1969
    goto :goto_16

    .line 1970
    :pswitch_5d
    const/4 v13, 0x0

    .line 1971
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1972
    .line 1973
    .line 1974
    move-result v5

    .line 1975
    if-eqz v5, :cond_12

    .line 1976
    .line 1977
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1978
    .line 1979
    .line 1980
    move-result v0

    .line 1981
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 1982
    .line 1983
    .line 1984
    invoke-virtual {v7, v0}, Lxk;->n(I)V

    .line 1985
    .line 1986
    .line 1987
    goto :goto_17

    .line 1988
    :pswitch_5e
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 1989
    .line 1990
    .line 1991
    move-result v5

    .line 1992
    if-eqz v5, :cond_13

    .line 1993
    .line 1994
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1995
    .line 1996
    .line 1997
    move-result-object v0

    .line 1998
    check-cast v0, Lrh;

    .line 1999
    .line 2000
    const/4 v11, 0x2

    .line 2001
    invoke-virtual {v7, v12, v11}, Lxk;->m(II)V

    .line 2002
    .line 2003
    .line 2004
    invoke-virtual {v7, v0}, Lxk;->h(Lrh;)V

    .line 2005
    .line 2006
    .line 2007
    goto :goto_17

    .line 2008
    :pswitch_5f
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2009
    .line 2010
    .line 2011
    move-result v5

    .line 2012
    if-eqz v5, :cond_3

    .line 2013
    .line 2014
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v5

    .line 2018
    invoke-virtual {v0, v2}, Lrn0;->j(I)Lb31;

    .line 2019
    .line 2020
    .line 2021
    move-result-object v10

    .line 2022
    invoke-virtual {v6, v12, v5, v10}, Lpa0;->v(ILjava/lang/Object;Lb31;)V

    .line 2023
    .line 2024
    .line 2025
    goto/16 :goto_3

    .line 2026
    .line 2027
    :pswitch_60
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2028
    .line 2029
    .line 2030
    move-result v5

    .line 2031
    if-eqz v5, :cond_13

    .line 2032
    .line 2033
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2034
    .line 2035
    .line 2036
    move-result-object v0

    .line 2037
    instance-of v5, v0, Ljava/lang/String;

    .line 2038
    .line 2039
    if-eqz v5, :cond_14

    .line 2040
    .line 2041
    check-cast v0, Ljava/lang/String;

    .line 2042
    .line 2043
    const/4 v11, 0x2

    .line 2044
    invoke-virtual {v7, v12, v11}, Lxk;->m(II)V

    .line 2045
    .line 2046
    .line 2047
    invoke-virtual {v7, v0}, Lxk;->l(Ljava/lang/String;)V

    .line 2048
    .line 2049
    .line 2050
    goto/16 :goto_17

    .line 2051
    .line 2052
    :cond_14
    const/4 v11, 0x2

    .line 2053
    check-cast v0, Lrh;

    .line 2054
    .line 2055
    invoke-virtual {v7, v12, v11}, Lxk;->m(II)V

    .line 2056
    .line 2057
    .line 2058
    invoke-virtual {v7, v0}, Lxk;->h(Lrh;)V

    .line 2059
    .line 2060
    .line 2061
    goto/16 :goto_17

    .line 2062
    .line 2063
    :pswitch_61
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2064
    .line 2065
    .line 2066
    move-result v5

    .line 2067
    if-eqz v5, :cond_13

    .line 2068
    .line 2069
    sget-object v0, Lmf1;->c:Llf1;

    .line 2070
    .line 2071
    invoke-virtual {v0, v10, v11, v1}, Llf1;->a(JLjava/lang/Object;)Z

    .line 2072
    .line 2073
    .line 2074
    move-result v0

    .line 2075
    const/4 v13, 0x0

    .line 2076
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 2077
    .line 2078
    .line 2079
    int-to-byte v0, v0

    .line 2080
    invoke-virtual {v7, v0}, Lxk;->f(B)V

    .line 2081
    .line 2082
    .line 2083
    goto/16 :goto_17

    .line 2084
    .line 2085
    :pswitch_62
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2086
    .line 2087
    .line 2088
    move-result v5

    .line 2089
    if-eqz v5, :cond_13

    .line 2090
    .line 2091
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2092
    .line 2093
    .line 2094
    move-result v0

    .line 2095
    const/4 v10, 0x5

    .line 2096
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 2097
    .line 2098
    .line 2099
    invoke-virtual {v7, v0}, Lxk;->i(I)V

    .line 2100
    .line 2101
    .line 2102
    goto/16 :goto_17

    .line 2103
    .line 2104
    :pswitch_63
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2105
    .line 2106
    .line 2107
    move-result v5

    .line 2108
    if-eqz v5, :cond_13

    .line 2109
    .line 2110
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2111
    .line 2112
    .line 2113
    move-result-wide v10

    .line 2114
    const/4 v5, 0x1

    .line 2115
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 2116
    .line 2117
    .line 2118
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 2119
    .line 2120
    .line 2121
    goto/16 :goto_17

    .line 2122
    .line 2123
    :pswitch_64
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2124
    .line 2125
    .line 2126
    move-result v5

    .line 2127
    if-eqz v5, :cond_13

    .line 2128
    .line 2129
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 2130
    .line 2131
    .line 2132
    move-result v0

    .line 2133
    const/4 v13, 0x0

    .line 2134
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 2135
    .line 2136
    .line 2137
    invoke-virtual {v7, v0}, Lxk;->k(I)V

    .line 2138
    .line 2139
    .line 2140
    goto/16 :goto_16

    .line 2141
    .line 2142
    :pswitch_65
    const/4 v13, 0x0

    .line 2143
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2144
    .line 2145
    .line 2146
    move-result v5

    .line 2147
    if-eqz v5, :cond_12

    .line 2148
    .line 2149
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2150
    .line 2151
    .line 2152
    move-result-wide v10

    .line 2153
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 2154
    .line 2155
    .line 2156
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 2157
    .line 2158
    .line 2159
    goto/16 :goto_16

    .line 2160
    .line 2161
    :pswitch_66
    const/4 v13, 0x0

    .line 2162
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2163
    .line 2164
    .line 2165
    move-result v5

    .line 2166
    if-eqz v5, :cond_12

    .line 2167
    .line 2168
    invoke-virtual {v15, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2169
    .line 2170
    .line 2171
    move-result-wide v10

    .line 2172
    invoke-virtual {v7, v12, v13}, Lxk;->m(II)V

    .line 2173
    .line 2174
    .line 2175
    invoke-virtual {v7, v10, v11}, Lxk;->o(J)V

    .line 2176
    .line 2177
    .line 2178
    goto/16 :goto_16

    .line 2179
    .line 2180
    :pswitch_67
    const/4 v13, 0x0

    .line 2181
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2182
    .line 2183
    .line 2184
    move-result v5

    .line 2185
    if-eqz v5, :cond_12

    .line 2186
    .line 2187
    sget-object v0, Lmf1;->c:Llf1;

    .line 2188
    .line 2189
    invoke-virtual {v0, v10, v11, v1}, Llf1;->d(JLjava/lang/Object;)F

    .line 2190
    .line 2191
    .line 2192
    move-result v0

    .line 2193
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 2194
    .line 2195
    .line 2196
    move-result v0

    .line 2197
    const/4 v10, 0x5

    .line 2198
    invoke-virtual {v7, v12, v10}, Lxk;->m(II)V

    .line 2199
    .line 2200
    .line 2201
    invoke-virtual {v7, v0}, Lxk;->i(I)V

    .line 2202
    .line 2203
    .line 2204
    goto/16 :goto_16

    .line 2205
    .line 2206
    :pswitch_68
    const/4 v13, 0x0

    .line 2207
    invoke-virtual/range {v0 .. v5}, Lrn0;->l(Ljava/lang/Object;IIII)Z

    .line 2208
    .line 2209
    .line 2210
    move-result v5

    .line 2211
    if-eqz v5, :cond_15

    .line 2212
    .line 2213
    sget-object v5, Lmf1;->c:Llf1;

    .line 2214
    .line 2215
    invoke-virtual {v5, v10, v11, v1}, Llf1;->c(JLjava/lang/Object;)D

    .line 2216
    .line 2217
    .line 2218
    move-result-wide v10

    .line 2219
    invoke-static {v10, v11}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 2220
    .line 2221
    .line 2222
    move-result-wide v10

    .line 2223
    const/4 v5, 0x1

    .line 2224
    invoke-virtual {v7, v12, v5}, Lxk;->m(II)V

    .line 2225
    .line 2226
    .line 2227
    invoke-virtual {v7, v10, v11}, Lxk;->j(J)V

    .line 2228
    .line 2229
    .line 2230
    :cond_15
    :goto_18
    add-int/lit8 v2, v2, 0x3

    .line 2231
    .line 2232
    const v10, 0xfffff

    .line 2233
    .line 2234
    .line 2235
    goto/16 :goto_0

    .line 2236
    .line 2237
    :cond_16
    iget-object v0, v0, Lrn0;->h:Lze1;

    .line 2238
    .line 2239
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2240
    .line 2241
    .line 2242
    move-object v0, v1

    .line 2243
    check-cast v0, Lia0;

    .line 2244
    .line 2245
    iget-object v0, v0, Lia0;->unknownFields:Lxe1;

    .line 2246
    .line 2247
    invoke-virtual {v0, v6}, Lxe1;->b(Lpa0;)V

    .line 2248
    .line 2249
    .line 2250
    return-void

    .line 2251
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 2252
    .line 2253
    .line 2254
    .line 2255
    .line 2256
    .line 2257
    .line 2258
    .line 2259
    .line 2260
    .line 2261
    .line 2262
    .line 2263
    .line 2264
    .line 2265
    .line 2266
    .line 2267
    .line 2268
    .line 2269
    .line 2270
    .line 2271
    .line 2272
    .line 2273
    .line 2274
    .line 2275
    .line 2276
    .line 2277
    .line 2278
    .line 2279
    .line 2280
    .line 2281
    .line 2282
    .line 2283
    .line 2284
    .line 2285
    .line 2286
    .line 2287
    .line 2288
    .line 2289
    .line 2290
    .line 2291
    .line 2292
    .line 2293
    .line 2294
    .line 2295
    .line 2296
    .line 2297
    .line 2298
    .line 2299
    .line 2300
    .line 2301
    .line 2302
    .line 2303
    .line 2304
    .line 2305
    .line 2306
    .line 2307
    .line 2308
    .line 2309
    .line 2310
    .line 2311
    .line 2312
    .line 2313
    .line 2314
    .line 2315
    .line 2316
    .line 2317
    .line 2318
    .line 2319
    .line 2320
    .line 2321
    .line 2322
    .line 2323
    .line 2324
    .line 2325
    .line 2326
    .line 2327
    .line 2328
    .line 2329
    .line 2330
    .line 2331
    .line 2332
    .line 2333
    .line 2334
    .line 2335
    .line 2336
    .line 2337
    .line 2338
    .line 2339
    .line 2340
    .line 2341
    .line 2342
    .line 2343
    .line 2344
    .line 2345
    .line 2346
    .line 2347
    .line 2348
    .line 2349
    .line 2350
    .line 2351
    .line 2352
    .line 2353
    .line 2354
    .line 2355
    .line 2356
    .line 2357
    .line 2358
    .line 2359
    .line 2360
    .line 2361
    .line 2362
    .line 2363
    .line 2364
    .line 2365
    .line 2366
    .line 2367
    .line 2368
    .line 2369
    .line 2370
    .line 2371
    .line 2372
    .line 2373
    .line 2374
    .line 2375
    .line 2376
    .line 2377
    .line 2378
    .line 2379
    .line 2380
    .line 2381
    .line 2382
    .line 2383
    .line 2384
    .line 2385
    .line 2386
    .line 2387
    .line 2388
    .line 2389
    .line 2390
    .line 2391
    .line 2392
    .line 2393
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
    .end packed-switch

    .line 2394
    .line 2395
    .line 2396
    .line 2397
    .line 2398
    .line 2399
    .line 2400
    .line 2401
    .line 2402
    .line 2403
    .line 2404
    .line 2405
    .line 2406
    .line 2407
    .line 2408
    .line 2409
    .line 2410
    .line 2411
    .line 2412
    .line 2413
    .line 2414
    .line 2415
    .line 2416
    .line 2417
    .line 2418
    .line 2419
    .line 2420
    .line 2421
    .line 2422
    .line 2423
    .line 2424
    .line 2425
    .line 2426
    .line 2427
    .line 2428
    .line 2429
    .line 2430
    .line 2431
    .line 2432
    .line 2433
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
    .end packed-switch
.end method

.method public final h(Lia0;Lia0;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lrn0;->a:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    const/4 v4, 0x1

    .line 7
    if-ge v3, v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, v3}, Lrn0;->w(I)I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    const v6, 0xfffff

    .line 14
    .line 15
    .line 16
    and-int v7, v5, v6

    .line 17
    .line 18
    int-to-long v7, v7

    .line 19
    invoke-static {v5}, Lrn0;->v(I)I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    packed-switch v5, :pswitch_data_0

    .line 24
    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :pswitch_0
    add-int/lit8 v5, v3, 0x2

    .line 29
    .line 30
    aget v5, v0, v5

    .line 31
    .line 32
    and-int/2addr v5, v6

    .line 33
    int-to-long v5, v5

    .line 34
    invoke-static {v5, v6, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 35
    .line 36
    .line 37
    move-result v9

    .line 38
    invoke-static {v5, v6, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-ne v9, v5, :cond_0

    .line 43
    .line 44
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-static {v5, v6}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-eqz v5, :cond_0

    .line 57
    .line 58
    goto/16 :goto_1

    .line 59
    .line 60
    :cond_0
    move v4, v2

    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :pswitch_1
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-static {v4, v5}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    goto/16 :goto_1

    .line 76
    .line 77
    :pswitch_2
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v4, v5}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    goto/16 :goto_1

    .line 90
    .line 91
    :pswitch_3
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_0

    .line 96
    .line 97
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-static {v5, v6}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    if-eqz v5, :cond_0

    .line 110
    .line 111
    goto/16 :goto_1

    .line 112
    .line 113
    :pswitch_4
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v5, :cond_0

    .line 118
    .line 119
    invoke-static {v7, v8, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 120
    .line 121
    .line 122
    move-result-wide v5

    .line 123
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 124
    .line 125
    .line 126
    move-result-wide v7

    .line 127
    cmp-long v5, v5, v7

    .line 128
    .line 129
    if-nez v5, :cond_0

    .line 130
    .line 131
    goto/16 :goto_1

    .line 132
    .line 133
    :pswitch_5
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_0

    .line 138
    .line 139
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    if-ne v5, v6, :cond_0

    .line 148
    .line 149
    goto/16 :goto_1

    .line 150
    .line 151
    :pswitch_6
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-eqz v5, :cond_0

    .line 156
    .line 157
    invoke-static {v7, v8, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 158
    .line 159
    .line 160
    move-result-wide v5

    .line 161
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 162
    .line 163
    .line 164
    move-result-wide v7

    .line 165
    cmp-long v5, v5, v7

    .line 166
    .line 167
    if-nez v5, :cond_0

    .line 168
    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :pswitch_7
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-eqz v5, :cond_0

    .line 176
    .line 177
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    if-ne v5, v6, :cond_0

    .line 186
    .line 187
    goto/16 :goto_1

    .line 188
    .line 189
    :pswitch_8
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_0

    .line 194
    .line 195
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    if-ne v5, v6, :cond_0

    .line 204
    .line 205
    goto/16 :goto_1

    .line 206
    .line 207
    :pswitch_9
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    if-eqz v5, :cond_0

    .line 212
    .line 213
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 218
    .line 219
    .line 220
    move-result v6

    .line 221
    if-ne v5, v6, :cond_0

    .line 222
    .line 223
    goto/16 :goto_1

    .line 224
    .line 225
    :pswitch_a
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    if-eqz v5, :cond_0

    .line 230
    .line 231
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    invoke-static {v5, v6}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-eqz v5, :cond_0

    .line 244
    .line 245
    goto/16 :goto_1

    .line 246
    .line 247
    :pswitch_b
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-eqz v5, :cond_0

    .line 252
    .line 253
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v6

    .line 261
    invoke-static {v5, v6}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    if-eqz v5, :cond_0

    .line 266
    .line 267
    goto/16 :goto_1

    .line 268
    .line 269
    :pswitch_c
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    if-eqz v5, :cond_0

    .line 274
    .line 275
    invoke-static {v7, v8, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    invoke-static {v7, v8, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    invoke-static {v5, v6}, Lf31;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    if-eqz v5, :cond_0

    .line 288
    .line 289
    goto/16 :goto_1

    .line 290
    .line 291
    :pswitch_d
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    if-eqz v5, :cond_0

    .line 296
    .line 297
    sget-object v5, Lmf1;->c:Llf1;

    .line 298
    .line 299
    invoke-virtual {v5, v7, v8, p1}, Llf1;->a(JLjava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v6

    .line 303
    invoke-virtual {v5, v7, v8, p2}, Llf1;->a(JLjava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    if-ne v6, v5, :cond_0

    .line 308
    .line 309
    goto/16 :goto_1

    .line 310
    .line 311
    :pswitch_e
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 312
    .line 313
    .line 314
    move-result v5

    .line 315
    if-eqz v5, :cond_0

    .line 316
    .line 317
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 322
    .line 323
    .line 324
    move-result v6

    .line 325
    if-ne v5, v6, :cond_0

    .line 326
    .line 327
    goto/16 :goto_1

    .line 328
    .line 329
    :pswitch_f
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 330
    .line 331
    .line 332
    move-result v5

    .line 333
    if-eqz v5, :cond_0

    .line 334
    .line 335
    invoke-static {v7, v8, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 336
    .line 337
    .line 338
    move-result-wide v5

    .line 339
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 340
    .line 341
    .line 342
    move-result-wide v7

    .line 343
    cmp-long v5, v5, v7

    .line 344
    .line 345
    if-nez v5, :cond_0

    .line 346
    .line 347
    goto/16 :goto_1

    .line 348
    .line 349
    :pswitch_10
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    if-eqz v5, :cond_0

    .line 354
    .line 355
    invoke-static {v7, v8, p1}, Lmf1;->h(JLjava/lang/Object;)I

    .line 356
    .line 357
    .line 358
    move-result v5

    .line 359
    invoke-static {v7, v8, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 360
    .line 361
    .line 362
    move-result v6

    .line 363
    if-ne v5, v6, :cond_0

    .line 364
    .line 365
    goto :goto_1

    .line 366
    :pswitch_11
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 367
    .line 368
    .line 369
    move-result v5

    .line 370
    if-eqz v5, :cond_0

    .line 371
    .line 372
    invoke-static {v7, v8, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 373
    .line 374
    .line 375
    move-result-wide v5

    .line 376
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 377
    .line 378
    .line 379
    move-result-wide v7

    .line 380
    cmp-long v5, v5, v7

    .line 381
    .line 382
    if-nez v5, :cond_0

    .line 383
    .line 384
    goto :goto_1

    .line 385
    :pswitch_12
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 386
    .line 387
    .line 388
    move-result v5

    .line 389
    if-eqz v5, :cond_0

    .line 390
    .line 391
    invoke-static {v7, v8, p1}, Lmf1;->i(JLjava/lang/Object;)J

    .line 392
    .line 393
    .line 394
    move-result-wide v5

    .line 395
    invoke-static {v7, v8, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 396
    .line 397
    .line 398
    move-result-wide v7

    .line 399
    cmp-long v5, v5, v7

    .line 400
    .line 401
    if-nez v5, :cond_0

    .line 402
    .line 403
    goto :goto_1

    .line 404
    :pswitch_13
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 405
    .line 406
    .line 407
    move-result v5

    .line 408
    if-eqz v5, :cond_0

    .line 409
    .line 410
    sget-object v5, Lmf1;->c:Llf1;

    .line 411
    .line 412
    invoke-virtual {v5, v7, v8, p1}, Llf1;->d(JLjava/lang/Object;)F

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    invoke-static {v6}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 417
    .line 418
    .line 419
    move-result v6

    .line 420
    invoke-virtual {v5, v7, v8, p2}, Llf1;->d(JLjava/lang/Object;)F

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    invoke-static {v5}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 425
    .line 426
    .line 427
    move-result v5

    .line 428
    if-ne v6, v5, :cond_0

    .line 429
    .line 430
    goto :goto_1

    .line 431
    :pswitch_14
    invoke-virtual {p0, p1, p2, v3}, Lrn0;->i(Lia0;Lia0;I)Z

    .line 432
    .line 433
    .line 434
    move-result v5

    .line 435
    if-eqz v5, :cond_0

    .line 436
    .line 437
    sget-object v5, Lmf1;->c:Llf1;

    .line 438
    .line 439
    invoke-virtual {v5, v7, v8, p1}, Llf1;->c(JLjava/lang/Object;)D

    .line 440
    .line 441
    .line 442
    move-result-wide v9

    .line 443
    invoke-static {v9, v10}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 444
    .line 445
    .line 446
    move-result-wide v9

    .line 447
    invoke-virtual {v5, v7, v8, p2}, Llf1;->c(JLjava/lang/Object;)D

    .line 448
    .line 449
    .line 450
    move-result-wide v5

    .line 451
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 452
    .line 453
    .line 454
    move-result-wide v5

    .line 455
    cmp-long v5, v9, v5

    .line 456
    .line 457
    if-nez v5, :cond_0

    .line 458
    .line 459
    :goto_1
    if-nez v4, :cond_1

    .line 460
    .line 461
    goto :goto_2

    .line 462
    :cond_1
    add-int/lit8 v3, v3, 0x3

    .line 463
    .line 464
    goto/16 :goto_0

    .line 465
    .line 466
    :cond_2
    iget-object p0, p0, Lrn0;->h:Lze1;

    .line 467
    .line 468
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 469
    .line 470
    .line 471
    iget-object p0, p1, Lia0;->unknownFields:Lxe1;

    .line 472
    .line 473
    iget-object p1, p2, Lia0;->unknownFields:Lxe1;

    .line 474
    .line 475
    invoke-virtual {p0, p1}, Lxe1;->equals(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    move-result p0

    .line 479
    if-nez p0, :cond_3

    .line 480
    .line 481
    :goto_2
    return v2

    .line 482
    :cond_3
    return v4

    .line 483
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final i(Lia0;Lia0;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p3, p2}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final j(I)Lb31;
    .locals 2

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iget-object p0, p0, Lrn0;->b:[Ljava/lang/Object;

    .line 6
    .line 7
    aget-object v0, p0, p1

    .line 8
    .line 9
    check-cast v0, Lb31;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    sget-object v0, Lcw0;->c:Lcw0;

    .line 15
    .line 16
    add-int/lit8 v1, p1, 0x1

    .line 17
    .line 18
    aget-object v1, p0, v1

    .line 19
    .line 20
    check-cast v1, Ljava/lang/Class;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcw0;->a(Ljava/lang/Class;)Lb31;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    aput-object v0, p0, p1

    .line 27
    .line 28
    return-object v0
.end method

.method public final k(ILjava/lang/Object;)Z
    .locals 6

    .line 1
    add-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    iget-object v1, p0, Lrn0;->a:[I

    .line 4
    .line 5
    aget v0, v1, v0

    .line 6
    .line 7
    const v1, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int v2, v0, v1

    .line 11
    .line 12
    int-to-long v2, v2

    .line 13
    const-wide/32 v4, 0xfffff

    .line 14
    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    if-nez v4, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrn0;->w(I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    and-int p1, p0, v1

    .line 26
    .line 27
    int-to-long v0, p1

    .line 28
    invoke-static {p0}, Lrn0;->v(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    packed-switch p0, :pswitch_data_0

    .line 35
    .line 36
    .line 37
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :pswitch_0
    invoke-static {v0, v1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :pswitch_1
    invoke-static {v0, v1, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 52
    .line 53
    .line 54
    move-result-wide p0

    .line 55
    cmp-long p0, p0, v2

    .line 56
    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :pswitch_2
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :pswitch_3
    invoke-static {v0, v1, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    cmp-long p0, p0, v2

    .line 74
    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :pswitch_4
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :pswitch_5
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :pswitch_6
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :pswitch_7
    sget-object p0, Lrh;->l:Lrh;

    .line 104
    .line 105
    invoke-static {v0, v1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Lrh;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    xor-int/2addr p0, v5

    .line 114
    return p0

    .line 115
    :pswitch_8
    invoke-static {v0, v1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    if-eqz p0, :cond_3

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :pswitch_9
    invoke-static {v0, v1, p2}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    instance-of p1, p0, Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p1, :cond_0

    .line 130
    .line 131
    check-cast p0, Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    xor-int/2addr p0, v5

    .line 138
    return p0

    .line 139
    :cond_0
    instance-of p1, p0, Lrh;

    .line 140
    .line 141
    if-eqz p1, :cond_1

    .line 142
    .line 143
    sget-object p1, Lrh;->l:Lrh;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Lrh;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    xor-int/2addr p0, v5

    .line 150
    return p0

    .line 151
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 152
    .line 153
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 154
    .line 155
    .line 156
    throw p0

    .line 157
    :pswitch_a
    sget-object p0, Lmf1;->c:Llf1;

    .line 158
    .line 159
    invoke-virtual {p0, v0, v1, p2}, Llf1;->a(JLjava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    return p0

    .line 164
    :pswitch_b
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-eqz p0, :cond_3

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :pswitch_c
    invoke-static {v0, v1, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 172
    .line 173
    .line 174
    move-result-wide p0

    .line 175
    cmp-long p0, p0, v2

    .line 176
    .line 177
    if-eqz p0, :cond_3

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :pswitch_d
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-eqz p0, :cond_3

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :pswitch_e
    invoke-static {v0, v1, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 188
    .line 189
    .line 190
    move-result-wide p0

    .line 191
    cmp-long p0, p0, v2

    .line 192
    .line 193
    if-eqz p0, :cond_3

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :pswitch_f
    invoke-static {v0, v1, p2}, Lmf1;->i(JLjava/lang/Object;)J

    .line 197
    .line 198
    .line 199
    move-result-wide p0

    .line 200
    cmp-long p0, p0, v2

    .line 201
    .line 202
    if-eqz p0, :cond_3

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :pswitch_10
    sget-object p0, Lmf1;->c:Llf1;

    .line 206
    .line 207
    invoke-virtual {p0, v0, v1, p2}, Llf1;->d(JLjava/lang/Object;)F

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_3

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :pswitch_11
    sget-object p0, Lmf1;->c:Llf1;

    .line 219
    .line 220
    invoke-virtual {p0, v0, v1, p2}, Llf1;->c(JLjava/lang/Object;)D

    .line 221
    .line 222
    .line 223
    move-result-wide p0

    .line 224
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 225
    .line 226
    .line 227
    move-result-wide p0

    .line 228
    cmp-long p0, p0, v2

    .line 229
    .line 230
    if-eqz p0, :cond_3

    .line 231
    .line 232
    goto :goto_0

    .line 233
    :cond_2
    ushr-int/lit8 p0, v0, 0x14

    .line 234
    .line 235
    shl-int p0, v5, p0

    .line 236
    .line 237
    invoke-static {v2, v3, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    and-int/2addr p0, p1

    .line 242
    if-eqz p0, :cond_3

    .line 243
    .line 244
    :goto_0
    return v5

    .line 245
    :cond_3
    const/4 p0, 0x0

    .line 246
    return p0

    .line 247
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final l(Ljava/lang/Object;IIII)Z
    .locals 1

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    and-int p0, p4, p5

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final n(ILjava/lang/Object;I)Z
    .locals 2

    .line 1
    add-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lrn0;->a:[I

    .line 4
    .line 5
    aget p0, p0, p3

    .line 6
    .line 7
    const p3, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p0, p3

    .line 11
    int-to-long v0, p0

    .line 12
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final o(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2, p3}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p2}, Lrn0;->w(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0xfffff

    .line 13
    .line 14
    .line 15
    and-int/2addr v0, v1

    .line 16
    int-to-long v0, v0

    .line 17
    sget-object v2, Lrn0;->k:Lsun/misc/Unsafe;

    .line 18
    .line 19
    invoke-virtual {v2, p3, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-eqz v3, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lrn0;->j(I)Lb31;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p0, p2, p1}, Lrn0;->k(ILjava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    invoke-static {v3}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2, p1, v0, v1, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p3}, Lb31;->d()Lia0;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {p3, v4, v3}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1, v0, v1, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p2, p1}, Lrn0;->u(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {v2, p1, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_3

    .line 68
    .line 69
    invoke-interface {p3}, Lb31;->d()Lia0;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p3, p2, p0}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1, v0, v1, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    move-object p0, p2

    .line 80
    :cond_3
    invoke-interface {p3, p0, v3}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    iget-object p0, p0, Lrn0;->a:[I

    .line 85
    .line 86
    aget p0, p0, p2

    .line 87
    .line 88
    invoke-static {p0, p3}, Lo40;->e(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final p(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lrn0;->a:[I

    .line 2
    .line 3
    aget v1, v0, p2

    .line 4
    .line 5
    invoke-virtual {p0, v1, p3, p2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lrn0;->w(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const v3, 0xfffff

    .line 17
    .line 18
    .line 19
    and-int/2addr v2, v3

    .line 20
    int-to-long v4, v2

    .line 21
    sget-object v2, Lrn0;->k:Lsun/misc/Unsafe;

    .line 22
    .line 23
    invoke-virtual {v2, p3, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    if-eqz v6, :cond_4

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Lrn0;->j(I)Lb31;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p0, v1, p1, p2}, Lrn0;->n(ILjava/lang/Object;I)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    invoke-static {v6}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v2, p1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {p3}, Lb31;->d()Lia0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p3, p0, v6}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p1, v4, v5, p0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    add-int/lit8 p2, p2, 0x2

    .line 60
    .line 61
    aget p0, v0, p2

    .line 62
    .line 63
    and-int/2addr p0, v3

    .line 64
    int-to-long p2, p0

    .line 65
    invoke-static {p1, p2, p3, v1}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-virtual {v2, p1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Lrn0;->m(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_3

    .line 78
    .line 79
    invoke-interface {p3}, Lb31;->d()Lia0;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-interface {p3, p2, p0}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, p1, v4, v5, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    move-object p0, p2

    .line 90
    :cond_3
    invoke-interface {p3, p0, v6}, Lb31;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_4
    aget p0, v0, p2

    .line 95
    .line 96
    invoke-static {p0, p3}, Lo40;->e(ILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final u(ILjava/lang/Object;)V
    .locals 4

    .line 1
    add-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lrn0;->a:[I

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    const p1, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p1, p0

    .line 11
    int-to-long v0, p1

    .line 12
    const-wide/32 v2, 0xfffff

    .line 13
    .line 14
    .line 15
    cmp-long p1, v0, v2

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    ushr-int/lit8 p0, p0, 0x14

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    shl-int p0, p1, p0

    .line 24
    .line 25
    invoke-static {v0, v1, p2}, Lmf1;->h(JLjava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    or-int/2addr p0, p1

    .line 30
    invoke-static {p2, v0, v1, p0}, Lmf1;->o(Ljava/lang/Object;JI)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final w(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iget-object p0, p0, Lrn0;->a:[I

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method
