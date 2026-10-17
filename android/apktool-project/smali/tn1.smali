.class public final Ltn1;
.super Let;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final o:Ljava/util/Set;

.field public static final p:Lif2;

.field public static final q:Lrn1;


# instance fields
.field public final k:Ljava/lang/String;

.field public final l:Ljava/util/logging/Level;

.field public final m:Ljava/util/Set;

.field public final n:Lif2;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    sget-object v1, Lhe2;->a:Lre2;

    .line 4
    .line 5
    sget-object v2, Lze2;->a:Lre2;

    .line 6
    .line 7
    sget-object v3, Laf2;->a:Lre2;

    .line 8
    .line 9
    filled-new-array {v1, v2, v3}, [Lre2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ltn1;->o:Ljava/util/Set;

    .line 25
    .line 26
    invoke-static {v0}, Lea1;->l(Ljava/util/Set;)Lif2;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Lif2;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Lif2;-><init>(Lif2;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Ltn1;->p:Lif2;

    .line 36
    .line 37
    new-instance v1, Lrn1;

    .line 38
    .line 39
    sget-object v3, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    .line 40
    .line 41
    invoke-direct {v1, v3, v0, v2}, Lrn1;-><init>(Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V

    .line 42
    .line 43
    .line 44
    sput-object v1, Ltn1;->q:Lrn1;

    .line 45
    .line 46
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Let;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lqe0;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ltn1;->k:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p2, p0, Ltn1;->l:Ljava/util/logging/Level;

    .line 11
    .line 12
    iput-object p3, p0, Ltn1;->m:Ljava/util/Set;

    .line 13
    .line 14
    iput-object p4, p0, Ltn1;->n:Lif2;

    .line 15
    .line 16
    return-void
.end method

.method public static m(Lee2;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lee2;->d()Lk42;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v0, Lee2;->a:Ljava/util/logging/Level;

    .line 8
    .line 9
    sget-object v3, Laf2;->a:Lre2;

    .line 10
    .line 11
    invoke-virtual {v1, v3}, Lk42;->s(Lre2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Boolean;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object v1, Lgn1;->a:Lhn1;

    .line 27
    .line 28
    check-cast v1, Lln1;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    sget-object v1, Lqn1;->b:Lqn1;

    .line 34
    .line 35
    invoke-virtual {v1}, Lqn1;->c()Lk42;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0}, Lee2;->d()Lk42;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Lk42;->o()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_1

    .line 48
    .line 49
    sget-object v1, Lfn1;->a:Ljf2;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const/16 v5, 0x1c

    .line 53
    .line 54
    if-gt v4, v5, :cond_2

    .line 55
    .line 56
    new-instance v4, Llf2;

    .line 57
    .line 58
    invoke-direct {v4, v1, v3}, Llf2;-><init>(Lk42;Lk42;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    move-object v1, v4

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    new-instance v4, Lmf2;

    .line 64
    .line 65
    invoke-direct {v4, v1, v3}, Lmf2;-><init>(Lk42;Lk42;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_1
    invoke-virtual {v2}, Ljava/util/logging/Level;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/Level;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    const/4 v5, 0x0

    .line 78
    if-ge v3, v4, :cond_3

    .line 79
    .line 80
    const/4 v3, 0x1

    .line 81
    goto :goto_2

    .line 82
    :cond_3
    move v3, v5

    .line 83
    :goto_2
    const-string v4, "cannot get literal argument before calling log()"

    .line 84
    .line 85
    const-string v7, "cannot get literal argument if a template context exists"

    .line 86
    .line 87
    if-nez v3, :cond_8

    .line 88
    .line 89
    sget v8, Lin1;->a:I

    .line 90
    .line 91
    iget-object v8, v0, Lee2;->f:Ljn1;

    .line 92
    .line 93
    if-nez v8, :cond_8

    .line 94
    .line 95
    invoke-virtual {v1}, Lfn1;->b()I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->size()I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    if-gt v8, v9, :cond_8

    .line 104
    .line 105
    invoke-virtual {v1}, Lfn1;->c()Ljava/util/Set;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    move-object/from16 v9, p2

    .line 110
    .line 111
    invoke-interface {v9, v8}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-nez v8, :cond_4

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :cond_4
    iget-object v1, v0, Lee2;->f:Ljn1;

    .line 119
    .line 120
    if-nez v1, :cond_5

    .line 121
    .line 122
    const/4 v6, 0x1

    .line 123
    goto :goto_3

    .line 124
    :cond_5
    move v6, v5

    .line 125
    :goto_3
    if-eqz v6, :cond_7

    .line 126
    .line 127
    iget-object v1, v0, Lee2;->g:[Ljava/lang/Object;

    .line 128
    .line 129
    if-eqz v1, :cond_6

    .line 130
    .line 131
    aget-object v1, v1, v5

    .line 132
    .line 133
    invoke-static {v1}, Lef2;->a(Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    :goto_4
    move-object/from16 v19, v2

    .line 137
    .line 138
    goto/16 :goto_1d

    .line 139
    .line 140
    :cond_6
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_7
    invoke-static {v7}, Lz0;->g(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_8
    :goto_5
    new-instance v8, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    iget-object v9, v0, Lee2;->d:Lne2;

    .line 154
    .line 155
    if-eqz v9, :cond_48

    .line 156
    .line 157
    const/4 v10, 0x2

    .line 158
    invoke-static {v10, v9, v8}, Lju1;->A(ILne2;Ljava/lang/StringBuilder;)Z

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    if-eqz v9, :cond_9

    .line 163
    .line 164
    const-string v9, " "

    .line 165
    .line 166
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    :cond_9
    if-eqz v3, :cond_a

    .line 170
    .line 171
    iget-object v3, v0, Lee2;->f:Ljn1;

    .line 172
    .line 173
    if-eqz v3, :cond_a

    .line 174
    .line 175
    const-string v1, "(REDACTED) "

    .line 176
    .line 177
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object v1, v0, Lee2;->f:Ljn1;

    .line 181
    .line 182
    iget-object v1, v1, Ljn1;->a:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    goto :goto_4

    .line 188
    :cond_a
    iget-object v3, v0, Lee2;->f:Ljn1;

    .line 189
    .line 190
    if-eqz v3, :cond_42

    .line 191
    .line 192
    new-instance v4, Lk00;

    .line 193
    .line 194
    if-eqz v3, :cond_b

    .line 195
    .line 196
    const/4 v7, 0x1

    .line 197
    goto :goto_6

    .line 198
    :cond_b
    move v7, v5

    .line 199
    :goto_6
    const-string v9, "cannot get arguments unless a template context exists"

    .line 200
    .line 201
    if-eqz v7, :cond_41

    .line 202
    .line 203
    iget-object v7, v0, Lee2;->g:[Ljava/lang/Object;

    .line 204
    .line 205
    const-string v11, "cannot get arguments before calling log()"

    .line 206
    .line 207
    if-eqz v7, :cond_40

    .line 208
    .line 209
    invoke-direct {v4, v3, v7, v8}, Lk00;-><init>(Ljn1;[Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 210
    .line 211
    .line 212
    iget-object v3, v4, Lk00;->g:Ljava/lang/Object;

    .line 213
    .line 214
    check-cast v3, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    iget-object v7, v4, Lk00;->e:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v7, Ljn1;

    .line 219
    .line 220
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    sget-object v12, Leo1;->b:Leo1;

    .line 224
    .line 225
    iget-object v7, v7, Ljn1;->a:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v5, v7}, Lfo1;->b(ILjava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v12

    .line 231
    move v14, v5

    .line 232
    const/4 v15, -0x1

    .line 233
    :goto_7
    if-ltz v12, :cond_3a

    .line 234
    .line 235
    add-int/lit8 v10, v12, 0x1

    .line 236
    .line 237
    move v6, v10

    .line 238
    const/16 v16, 0x0

    .line 239
    .line 240
    :goto_8
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    const-string v13, "unterminated parameter"

    .line 245
    .line 246
    if-ge v6, v5, :cond_39

    .line 247
    .line 248
    add-int/lit8 v5, v6, 0x1

    .line 249
    .line 250
    move-object/from16 v19, v2

    .line 251
    .line 252
    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    move/from16 v20, v6

    .line 257
    .line 258
    add-int/lit8 v6, v2, -0x30

    .line 259
    .line 260
    int-to-char v6, v6

    .line 261
    move-object/from16 v21, v9

    .line 262
    .line 263
    const/16 v9, 0xa

    .line 264
    .line 265
    if-ge v6, v9, :cond_d

    .line 266
    .line 267
    mul-int/lit8 v16, v16, 0xa

    .line 268
    .line 269
    add-int v2, v16, v6

    .line 270
    .line 271
    const v6, 0xf4240

    .line 272
    .line 273
    .line 274
    if-ge v2, v6, :cond_c

    .line 275
    .line 276
    move/from16 v16, v2

    .line 277
    .line 278
    move v6, v5

    .line 279
    move-object/from16 v2, v19

    .line 280
    .line 281
    move-object/from16 v9, v21

    .line 282
    .line 283
    goto :goto_8

    .line 284
    :cond_c
    const-string v0, "index too large"

    .line 285
    .line 286
    invoke-static {v12, v5, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    throw v0

    .line 291
    :cond_d
    const/16 v6, 0x24

    .line 292
    .line 293
    const/16 v9, 0x30

    .line 294
    .line 295
    if-ne v2, v6, :cond_11

    .line 296
    .line 297
    sub-int v6, v20, v10

    .line 298
    .line 299
    if-eqz v6, :cond_10

    .line 300
    .line 301
    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    if-eq v2, v9, :cond_f

    .line 306
    .line 307
    add-int/lit8 v16, v16, -0x1

    .line 308
    .line 309
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    if-eq v5, v2, :cond_e

    .line 314
    .line 315
    add-int/lit8 v6, v20, 0x2

    .line 316
    .line 317
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    .line 318
    .line 319
    .line 320
    move v10, v5

    .line 321
    move v5, v6

    .line 322
    move/from16 v15, v16

    .line 323
    .line 324
    const/4 v6, -0x1

    .line 325
    goto :goto_9

    .line 326
    :cond_e
    new-instance v0, Lrl;

    .line 327
    .line 328
    const/4 v6, -0x1

    .line 329
    invoke-static {v12, v6, v13, v7}, Lrl;->c(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    const/4 v2, 0x7

    .line 334
    invoke-direct {v0, v1, v2}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 335
    .line 336
    .line 337
    throw v0

    .line 338
    :cond_f
    const-string v0, "index has leading zero"

    .line 339
    .line 340
    invoke-static {v12, v5, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    throw v0

    .line 345
    :cond_10
    const-string v0, "missing index"

    .line 346
    .line 347
    invoke-static {v12, v5, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    throw v0

    .line 352
    :cond_11
    const/4 v6, -0x1

    .line 353
    const/16 v9, 0x3c

    .line 354
    .line 355
    if-ne v2, v9, :cond_14

    .line 356
    .line 357
    if-eq v15, v6, :cond_13

    .line 358
    .line 359
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 360
    .line 361
    .line 362
    move-result v2

    .line 363
    if-eq v5, v2, :cond_12

    .line 364
    .line 365
    add-int/lit8 v2, v20, 0x2

    .line 366
    .line 367
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    .line 368
    .line 369
    .line 370
    move v10, v5

    .line 371
    move v5, v2

    .line 372
    goto :goto_9

    .line 373
    :cond_12
    new-instance v0, Lrl;

    .line 374
    .line 375
    invoke-static {v12, v6, v13, v7}, Lrl;->c(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    const/4 v2, 0x7

    .line 380
    invoke-direct {v0, v1, v2}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 381
    .line 382
    .line 383
    throw v0

    .line 384
    :cond_13
    const-string v0, "invalid relative parameter"

    .line 385
    .line 386
    invoke-static {v12, v5, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    throw v0

    .line 391
    :cond_14
    add-int/lit8 v2, v14, 0x1

    .line 392
    .line 393
    move v15, v14

    .line 394
    move v14, v2

    .line 395
    :goto_9
    add-int/2addr v5, v6

    .line 396
    :goto_a
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 397
    .line 398
    .line 399
    move-result v2

    .line 400
    if-ge v5, v2, :cond_38

    .line 401
    .line 402
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    and-int/lit8 v2, v2, -0x21

    .line 407
    .line 408
    add-int/lit8 v2, v2, -0x41

    .line 409
    .line 410
    int-to-char v2, v2

    .line 411
    const/16 v6, 0x1a

    .line 412
    .line 413
    if-ge v2, v6, :cond_37

    .line 414
    .line 415
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    and-int/lit8 v6, v2, 0x20

    .line 420
    .line 421
    if-nez v6, :cond_15

    .line 422
    .line 423
    const/4 v9, 0x1

    .line 424
    goto :goto_b

    .line 425
    :cond_15
    const/4 v9, 0x0

    .line 426
    :goto_b
    sget-object v13, Lcf2;->e:Lcf2;

    .line 427
    .line 428
    const/16 v18, 0x3

    .line 429
    .line 430
    if-ne v10, v5, :cond_16

    .line 431
    .line 432
    if-eqz v9, :cond_17

    .line 433
    .line 434
    :cond_16
    const/4 v13, 0x1

    .line 435
    goto :goto_d

    .line 436
    :cond_17
    sget-object v9, Lcf2;->e:Lcf2;

    .line 437
    .line 438
    move/from16 v23, v6

    .line 439
    .line 440
    :goto_c
    move-object/from16 v24, v11

    .line 441
    .line 442
    move/from16 v25, v14

    .line 443
    .line 444
    move/from16 v16, v15

    .line 445
    .line 446
    goto/16 :goto_12

    .line 447
    .line 448
    :goto_d
    if-eq v13, v9, :cond_18

    .line 449
    .line 450
    const/4 v9, 0x0

    .line 451
    goto :goto_e

    .line 452
    :cond_18
    const/16 v9, 0x80

    .line 453
    .line 454
    :goto_e
    if-ne v10, v5, :cond_19

    .line 455
    .line 456
    new-instance v10, Lcf2;

    .line 457
    .line 458
    const/4 v13, -0x1

    .line 459
    invoke-direct {v10, v9, v13, v13}, Lcf2;-><init>(III)V

    .line 460
    .line 461
    .line 462
    move/from16 v23, v6

    .line 463
    .line 464
    move-object v9, v10

    .line 465
    goto :goto_c

    .line 466
    :cond_19
    add-int/lit8 v13, v10, 0x1

    .line 467
    .line 468
    move/from16 v23, v6

    .line 469
    .line 470
    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    .line 471
    .line 472
    .line 473
    move-result v6

    .line 474
    move-object/from16 v24, v11

    .line 475
    .line 476
    const-string v11, "invalid flag"

    .line 477
    .line 478
    move/from16 v25, v14

    .line 479
    .line 480
    const/16 v14, 0x20

    .line 481
    .line 482
    if-lt v6, v14, :cond_1a

    .line 483
    .line 484
    const/16 v14, 0x30

    .line 485
    .line 486
    if-le v6, v14, :cond_1b

    .line 487
    .line 488
    :cond_1a
    move/from16 v16, v15

    .line 489
    .line 490
    goto :goto_f

    .line 491
    :cond_1b
    add-int/lit8 v16, v6, -0x20

    .line 492
    .line 493
    sget-wide v27, Lcf2;->d:J

    .line 494
    .line 495
    mul-int/lit8 v16, v16, 0x3

    .line 496
    .line 497
    ushr-long v27, v27, v16

    .line 498
    .line 499
    const-wide/16 v29, 0x7

    .line 500
    .line 501
    move/from16 v16, v15

    .line 502
    .line 503
    and-long v14, v27, v29

    .line 504
    .line 505
    long-to-int v14, v14

    .line 506
    const/4 v15, -0x1

    .line 507
    add-int/2addr v14, v15

    .line 508
    if-gez v14, :cond_1d

    .line 509
    .line 510
    const/16 v15, 0x2e

    .line 511
    .line 512
    if-ne v6, v15, :cond_1c

    .line 513
    .line 514
    new-instance v6, Lcf2;

    .line 515
    .line 516
    invoke-static {v13, v5, v7}, Lcf2;->e(IILjava/lang/String;)I

    .line 517
    .line 518
    .line 519
    move-result v10

    .line 520
    const/4 v13, -0x1

    .line 521
    invoke-direct {v6, v9, v13, v10}, Lcf2;-><init>(III)V

    .line 522
    .line 523
    .line 524
    move-object v9, v6

    .line 525
    goto :goto_12

    .line 526
    :cond_1c
    invoke-static {v11, v7, v10}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    throw v0

    .line 531
    :cond_1d
    const/16 v17, 0x1

    .line 532
    .line 533
    shl-int v6, v17, v14

    .line 534
    .line 535
    and-int v11, v9, v6

    .line 536
    .line 537
    if-nez v11, :cond_1e

    .line 538
    .line 539
    or-int/2addr v9, v6

    .line 540
    move v10, v13

    .line 541
    move/from16 v15, v16

    .line 542
    .line 543
    move/from16 v6, v23

    .line 544
    .line 545
    move-object/from16 v11, v24

    .line 546
    .line 547
    move/from16 v14, v25

    .line 548
    .line 549
    goto :goto_e

    .line 550
    :cond_1e
    const-string v0, "repeated flag"

    .line 551
    .line 552
    invoke-static {v0, v7, v10}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    throw v0

    .line 557
    :goto_f
    const/16 v14, 0x39

    .line 558
    .line 559
    if-gt v6, v14, :cond_36

    .line 560
    .line 561
    add-int/lit8 v6, v6, -0x30

    .line 562
    .line 563
    :goto_10
    if-ne v13, v5, :cond_1f

    .line 564
    .line 565
    new-instance v10, Lcf2;

    .line 566
    .line 567
    const/4 v13, -0x1

    .line 568
    invoke-direct {v10, v9, v6, v13}, Lcf2;-><init>(III)V

    .line 569
    .line 570
    .line 571
    :goto_11
    move-object v9, v10

    .line 572
    goto :goto_12

    .line 573
    :cond_1f
    add-int/lit8 v11, v13, 0x1

    .line 574
    .line 575
    invoke-virtual {v7, v13}, Ljava/lang/String;->charAt(I)C

    .line 576
    .line 577
    .line 578
    move-result v14

    .line 579
    const/16 v15, 0x2e

    .line 580
    .line 581
    if-ne v14, v15, :cond_33

    .line 582
    .line 583
    new-instance v10, Lcf2;

    .line 584
    .line 585
    invoke-static {v11, v5, v7}, Lcf2;->e(IILjava/lang/String;)I

    .line 586
    .line 587
    .line 588
    move-result v11

    .line 589
    invoke-direct {v10, v9, v6, v11}, Lcf2;-><init>(III)V

    .line 590
    .line 591
    .line 592
    goto :goto_11

    .line 593
    :goto_12
    sget-object v6, Lbf2;->o:[Lbf2;

    .line 594
    .line 595
    or-int/lit8 v10, v2, 0x20

    .line 596
    .line 597
    add-int/lit8 v10, v10, -0x61

    .line 598
    .line 599
    aget-object v6, v6, v10

    .line 600
    .line 601
    const/4 v10, 0x0

    .line 602
    if-nez v23, :cond_21

    .line 603
    .line 604
    if-eqz v6, :cond_20

    .line 605
    .line 606
    iget v11, v6, Lbf2;->l:I

    .line 607
    .line 608
    const/16 v13, 0x80

    .line 609
    .line 610
    and-int/2addr v11, v13

    .line 611
    if-eqz v11, :cond_20

    .line 612
    .line 613
    goto :goto_13

    .line 614
    :cond_20
    move-object v6, v10

    .line 615
    :cond_21
    :goto_13
    add-int/lit8 v11, v5, 0x1

    .line 616
    .line 617
    if-eqz v6, :cond_27

    .line 618
    .line 619
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 620
    .line 621
    .line 622
    iget v2, v6, Lbf2;->l:I

    .line 623
    .line 624
    iget v5, v6, Lbf2;->k:I

    .line 625
    .line 626
    const/4 v13, 0x1

    .line 627
    if-eq v5, v13, :cond_24

    .line 628
    .line 629
    const/4 v13, 0x2

    .line 630
    if-eq v5, v13, :cond_23

    .line 631
    .line 632
    move/from16 v14, v18

    .line 633
    .line 634
    if-eq v5, v14, :cond_23

    .line 635
    .line 636
    const/4 v14, 0x4

    .line 637
    if-eq v5, v14, :cond_23

    .line 638
    .line 639
    const/4 v14, 0x5

    .line 640
    if-ne v5, v14, :cond_22

    .line 641
    .line 642
    :goto_14
    const/4 v5, 0x1

    .line 643
    goto :goto_15

    .line 644
    :cond_22
    throw v10

    .line 645
    :cond_23
    const/4 v5, 0x0

    .line 646
    goto :goto_15

    .line 647
    :cond_24
    const/4 v13, 0x2

    .line 648
    goto :goto_14

    .line 649
    :goto_15
    invoke-virtual {v9, v2, v5}, Lcf2;->b(IZ)Z

    .line 650
    .line 651
    .line 652
    move-result v2

    .line 653
    if-eqz v2, :cond_26

    .line 654
    .line 655
    move/from16 v10, v16

    .line 656
    .line 657
    const/16 v2, 0xa

    .line 658
    .line 659
    if-ge v10, v2, :cond_25

    .line 660
    .line 661
    sget-object v2, Lco1;->d:Ljava/util/Map;

    .line 662
    .line 663
    invoke-virtual {v9}, Lcf2;->a()Z

    .line 664
    .line 665
    .line 666
    move-result v2

    .line 667
    if-eqz v2, :cond_25

    .line 668
    .line 669
    sget-object v2, Lco1;->d:Ljava/util/Map;

    .line 670
    .line 671
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    move-result-object v2

    .line 675
    check-cast v2, [Lco1;

    .line 676
    .line 677
    const-string v5, "default parameter"

    .line 678
    .line 679
    invoke-static {v2, v5}, Ldl1;->u(Ljava/lang/Object;Ljava/lang/String;)V

    .line 680
    .line 681
    .line 682
    aget-object v2, v2, v10

    .line 683
    .line 684
    goto/16 :goto_18

    .line 685
    .line 686
    :cond_25
    new-instance v2, Lco1;

    .line 687
    .line 688
    invoke-direct {v2, v10, v6, v9}, Lco1;-><init>(ILbf2;Lcf2;)V

    .line 689
    .line 690
    .line 691
    goto :goto_18

    .line 692
    :cond_26
    const-string v0, "invalid format specifier"

    .line 693
    .line 694
    invoke-static {v12, v11, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 695
    .line 696
    .line 697
    move-result-object v0

    .line 698
    throw v0

    .line 699
    :cond_27
    move/from16 v10, v16

    .line 700
    .line 701
    const/4 v13, 0x2

    .line 702
    const/16 v6, 0x74

    .line 703
    .line 704
    const/16 v14, 0xa0

    .line 705
    .line 706
    const-string v15, "invalid format specification"

    .line 707
    .line 708
    if-eq v2, v6, :cond_28

    .line 709
    .line 710
    const/16 v6, 0x54

    .line 711
    .line 712
    if-ne v2, v6, :cond_29

    .line 713
    .line 714
    :cond_28
    const/4 v2, 0x0

    .line 715
    goto :goto_17

    .line 716
    :cond_29
    const/16 v5, 0x68

    .line 717
    .line 718
    if-eq v2, v5, :cond_2a

    .line 719
    .line 720
    const/16 v5, 0x48

    .line 721
    .line 722
    if-ne v2, v5, :cond_2b

    .line 723
    .line 724
    :cond_2a
    const/4 v2, 0x0

    .line 725
    goto :goto_16

    .line 726
    :cond_2b
    invoke-static {v12, v11, v15, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 727
    .line 728
    .line 729
    move-result-object v0

    .line 730
    throw v0

    .line 731
    :goto_16
    invoke-virtual {v9, v14, v2}, Lcf2;->b(IZ)Z

    .line 732
    .line 733
    .line 734
    move-result v5

    .line 735
    if-eqz v5, :cond_2c

    .line 736
    .line 737
    new-instance v5, Ldo1;

    .line 738
    .line 739
    invoke-direct {v5, v9, v10}, Lvk;-><init>(Lcf2;I)V

    .line 740
    .line 741
    .line 742
    move-object v2, v5

    .line 743
    goto :goto_18

    .line 744
    :cond_2c
    invoke-static {v12, v11, v15, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 745
    .line 746
    .line 747
    move-result-object v0

    .line 748
    throw v0

    .line 749
    :goto_17
    invoke-virtual {v9, v14, v2}, Lcf2;->b(IZ)Z

    .line 750
    .line 751
    .line 752
    move-result v6

    .line 753
    if-eqz v6, :cond_32

    .line 754
    .line 755
    add-int/lit8 v5, v5, 0x2

    .line 756
    .line 757
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 758
    .line 759
    .line 760
    move-result v2

    .line 761
    if-gt v5, v2, :cond_31

    .line 762
    .line 763
    invoke-virtual {v7, v11}, Ljava/lang/String;->charAt(I)C

    .line 764
    .line 765
    .line 766
    move-result v2

    .line 767
    sget-object v6, Lao1;->k:Ljava/util/Map;

    .line 768
    .line 769
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 770
    .line 771
    .line 772
    move-result-object v2

    .line 773
    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 774
    .line 775
    .line 776
    move-result-object v2

    .line 777
    check-cast v2, Lao1;

    .line 778
    .line 779
    if-eqz v2, :cond_30

    .line 780
    .line 781
    new-instance v6, Lbo1;

    .line 782
    .line 783
    invoke-direct {v6, v9, v10, v2}, Lbo1;-><init>(Lcf2;ILao1;)V

    .line 784
    .line 785
    .line 786
    move v11, v5

    .line 787
    move-object v2, v6

    .line 788
    :goto_18
    iget v5, v2, Lvk;->a:I

    .line 789
    .line 790
    const/16 v6, 0x20

    .line 791
    .line 792
    if-ge v5, v6, :cond_2d

    .line 793
    .line 794
    iget v6, v4, Lk00;->b:I

    .line 795
    .line 796
    const/16 v17, 0x1

    .line 797
    .line 798
    shl-int v9, v17, v5

    .line 799
    .line 800
    or-int/2addr v6, v9

    .line 801
    iput v6, v4, Lk00;->b:I

    .line 802
    .line 803
    :cond_2d
    iget v6, v4, Lk00;->c:I

    .line 804
    .line 805
    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    .line 806
    .line 807
    .line 808
    move-result v5

    .line 809
    iput v5, v4, Lk00;->c:I

    .line 810
    .line 811
    iget v5, v4, Lk00;->d:I

    .line 812
    .line 813
    invoke-static {v5, v12, v7, v3}, Lfo1;->a(IILjava/lang/String;Ljava/lang/StringBuilder;)V

    .line 814
    .line 815
    .line 816
    iget-object v5, v4, Lk00;->f:Ljava/lang/Object;

    .line 817
    .line 818
    check-cast v5, [Ljava/lang/Object;

    .line 819
    .line 820
    iget v6, v2, Lvk;->a:I

    .line 821
    .line 822
    array-length v9, v5

    .line 823
    if-ge v6, v9, :cond_2f

    .line 824
    .line 825
    aget-object v5, v5, v6

    .line 826
    .line 827
    if-eqz v5, :cond_2e

    .line 828
    .line 829
    invoke-virtual {v2, v4, v5}, Lvk;->z(Lk00;Ljava/lang/Object;)V

    .line 830
    .line 831
    .line 832
    goto :goto_19

    .line 833
    :cond_2e
    const-string v2, "null"

    .line 834
    .line 835
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 836
    .line 837
    .line 838
    goto :goto_19

    .line 839
    :cond_2f
    const-string v2, "[ERROR: MISSING LOG ARGUMENT]"

    .line 840
    .line 841
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    .line 843
    .line 844
    :goto_19
    iput v11, v4, Lk00;->d:I

    .line 845
    .line 846
    invoke-static {v11, v7}, Lfo1;->b(ILjava/lang/String;)I

    .line 847
    .line 848
    .line 849
    move-result v12

    .line 850
    move v15, v10

    .line 851
    move v10, v13

    .line 852
    move-object/from16 v2, v19

    .line 853
    .line 854
    move-object/from16 v9, v21

    .line 855
    .line 856
    move-object/from16 v11, v24

    .line 857
    .line 858
    move/from16 v14, v25

    .line 859
    .line 860
    goto/16 :goto_7

    .line 861
    .line 862
    :cond_30
    const-string v0, "illegal date/time conversion"

    .line 863
    .line 864
    invoke-static {v0, v7, v11}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 865
    .line 866
    .line 867
    move-result-object v0

    .line 868
    throw v0

    .line 869
    :cond_31
    const-string v0, "truncated format specifier"

    .line 870
    .line 871
    invoke-static {v0, v7, v12}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    throw v0

    .line 876
    :cond_32
    invoke-static {v12, v11, v15, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 877
    .line 878
    .line 879
    move-result-object v0

    .line 880
    throw v0

    .line 881
    :cond_33
    const/16 v20, 0x20

    .line 882
    .line 883
    const/16 v22, 0x2

    .line 884
    .line 885
    const/16 v26, 0x80

    .line 886
    .line 887
    add-int/lit8 v14, v14, -0x30

    .line 888
    .line 889
    int-to-char v14, v14

    .line 890
    const/16 v15, 0xa

    .line 891
    .line 892
    if-ge v14, v15, :cond_35

    .line 893
    .line 894
    mul-int/lit8 v6, v6, 0xa

    .line 895
    .line 896
    add-int/2addr v6, v14

    .line 897
    const v13, 0xf423f

    .line 898
    .line 899
    .line 900
    if-gt v6, v13, :cond_34

    .line 901
    .line 902
    move v13, v11

    .line 903
    goto/16 :goto_10

    .line 904
    .line 905
    :cond_34
    const-string v0, "width too large"

    .line 906
    .line 907
    invoke-static {v10, v5, v0, v7}, Lrl;->a(IILjava/lang/String;Ljava/lang/String;)Lrl;

    .line 908
    .line 909
    .line 910
    move-result-object v0

    .line 911
    throw v0

    .line 912
    :cond_35
    const-string v0, "invalid width character"

    .line 913
    .line 914
    invoke-static {v0, v7, v13}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 915
    .line 916
    .line 917
    move-result-object v0

    .line 918
    throw v0

    .line 919
    :cond_36
    invoke-static {v11, v7, v10}, Lrl;->b(Ljava/lang/String;Ljava/lang/String;I)Lrl;

    .line 920
    .line 921
    .line 922
    move-result-object v0

    .line 923
    throw v0

    .line 924
    :cond_37
    move-object/from16 v24, v11

    .line 925
    .line 926
    move/from16 v25, v14

    .line 927
    .line 928
    move/from16 v16, v15

    .line 929
    .line 930
    const/16 v15, 0xa

    .line 931
    .line 932
    const/16 v22, 0x2

    .line 933
    .line 934
    add-int/lit8 v5, v5, 0x1

    .line 935
    .line 936
    move/from16 v15, v16

    .line 937
    .line 938
    goto/16 :goto_a

    .line 939
    .line 940
    :cond_38
    new-instance v0, Lrl;

    .line 941
    .line 942
    const/4 v15, -0x1

    .line 943
    invoke-static {v12, v15, v13, v7}, Lrl;->c(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 944
    .line 945
    .line 946
    move-result-object v1

    .line 947
    const/4 v2, 0x7

    .line 948
    invoke-direct {v0, v1, v2}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 949
    .line 950
    .line 951
    throw v0

    .line 952
    :cond_39
    const/4 v2, 0x7

    .line 953
    const/4 v15, -0x1

    .line 954
    new-instance v0, Lrl;

    .line 955
    .line 956
    invoke-static {v12, v15, v13, v7}, Lrl;->c(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 957
    .line 958
    .line 959
    move-result-object v1

    .line 960
    invoke-direct {v0, v1, v2}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 961
    .line 962
    .line 963
    throw v0

    .line 964
    :cond_3a
    move-object/from16 v19, v2

    .line 965
    .line 966
    move-object/from16 v21, v9

    .line 967
    .line 968
    move-object/from16 v24, v11

    .line 969
    .line 970
    const/4 v15, -0x1

    .line 971
    iget v2, v4, Lk00;->b:I

    .line 972
    .line 973
    add-int/lit8 v5, v2, 0x1

    .line 974
    .line 975
    and-int/2addr v5, v2

    .line 976
    if-nez v5, :cond_3f

    .line 977
    .line 978
    iget v5, v4, Lk00;->c:I

    .line 979
    .line 980
    const/16 v6, 0x1f

    .line 981
    .line 982
    if-le v5, v6, :cond_3b

    .line 983
    .line 984
    if-ne v2, v15, :cond_3f

    .line 985
    .line 986
    :cond_3b
    iget v2, v4, Lk00;->d:I

    .line 987
    .line 988
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 989
    .line 990
    .line 991
    move-result v5

    .line 992
    invoke-static {v2, v5, v7, v3}, Lfo1;->a(IILjava/lang/String;Ljava/lang/StringBuilder;)V

    .line 993
    .line 994
    .line 995
    iget-object v2, v0, Lee2;->f:Ljn1;

    .line 996
    .line 997
    if-eqz v2, :cond_3c

    .line 998
    .line 999
    const/4 v5, 0x1

    .line 1000
    goto :goto_1a

    .line 1001
    :cond_3c
    const/4 v5, 0x0

    .line 1002
    :goto_1a
    if-eqz v5, :cond_3e

    .line 1003
    .line 1004
    iget-object v2, v0, Lee2;->g:[Ljava/lang/Object;

    .line 1005
    .line 1006
    if-eqz v2, :cond_3d

    .line 1007
    .line 1008
    array-length v2, v2

    .line 1009
    iget v4, v4, Lk00;->c:I

    .line 1010
    .line 1011
    const/16 v17, 0x1

    .line 1012
    .line 1013
    add-int/lit8 v4, v4, 0x1

    .line 1014
    .line 1015
    if-le v2, v4, :cond_44

    .line 1016
    .line 1017
    const-string v2, " [ERROR: UNUSED LOG ARGUMENTS]"

    .line 1018
    .line 1019
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1020
    .line 1021
    .line 1022
    goto :goto_1c

    .line 1023
    :cond_3d
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    .line 1024
    .line 1025
    .line 1026
    return-void

    .line 1027
    :cond_3e
    invoke-static/range {v21 .. v21}, Lz0;->g(Ljava/lang/String;)V

    .line 1028
    .line 1029
    .line 1030
    return-void

    .line 1031
    :cond_3f
    not-int v0, v2

    .line 1032
    invoke-static {v0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 1033
    .line 1034
    .line 1035
    move-result v0

    .line 1036
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v0

    .line 1040
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v0

    .line 1044
    const-string v1, "unreferenced arguments [first missing index=%d]"

    .line 1045
    .line 1046
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v0

    .line 1050
    new-instance v1, Lrl;

    .line 1051
    .line 1052
    const/4 v2, 0x7

    .line 1053
    invoke-direct {v1, v0, v2}, Lrl;-><init>(Ljava/lang/String;I)V

    .line 1054
    .line 1055
    .line 1056
    throw v1

    .line 1057
    :cond_40
    move-object/from16 v24, v11

    .line 1058
    .line 1059
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    .line 1060
    .line 1061
    .line 1062
    return-void

    .line 1063
    :cond_41
    move-object/from16 v21, v9

    .line 1064
    .line 1065
    invoke-static/range {v21 .. v21}, Lz0;->g(Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    return-void

    .line 1069
    :cond_42
    move-object/from16 v19, v2

    .line 1070
    .line 1071
    const/16 v17, 0x1

    .line 1072
    .line 1073
    if-nez v3, :cond_43

    .line 1074
    .line 1075
    move/from16 v6, v17

    .line 1076
    .line 1077
    goto :goto_1b

    .line 1078
    :cond_43
    const/4 v6, 0x0

    .line 1079
    :goto_1b
    if-eqz v6, :cond_47

    .line 1080
    .line 1081
    iget-object v2, v0, Lee2;->g:[Ljava/lang/Object;

    .line 1082
    .line 1083
    if-eqz v2, :cond_46

    .line 1084
    .line 1085
    const/4 v3, 0x0

    .line 1086
    aget-object v2, v2, v3

    .line 1087
    .line 1088
    invoke-static {v2}, Lef2;->a(Ljava/lang/Object;)Ljava/lang/String;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v2

    .line 1092
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1093
    .line 1094
    .line 1095
    :cond_44
    :goto_1c
    sget v2, Lin1;->a:I

    .line 1096
    .line 1097
    new-instance v2, Ldf2;

    .line 1098
    .line 1099
    invoke-direct {v2, v8}, Ldf2;-><init>(Ljava/lang/StringBuilder;)V

    .line 1100
    .line 1101
    .line 1102
    move-object/from16 v3, p3

    .line 1103
    .line 1104
    invoke-virtual {v1, v3, v2}, Lfn1;->a(Lif2;Ldf2;)V

    .line 1105
    .line 1106
    .line 1107
    iget-boolean v1, v2, Ldf2;->b:Z

    .line 1108
    .line 1109
    if-eqz v1, :cond_45

    .line 1110
    .line 1111
    const-string v1, " ]"

    .line 1112
    .line 1113
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1114
    .line 1115
    .line 1116
    :cond_45
    :goto_1d
    invoke-virtual {v0}, Lee2;->d()Lk42;

    .line 1117
    .line 1118
    .line 1119
    move-result-object v0

    .line 1120
    sget-object v1, Lhe2;->a:Lre2;

    .line 1121
    .line 1122
    invoke-virtual {v0, v1}, Lk42;->s(Lre2;)Ljava/lang/Object;

    .line 1123
    .line 1124
    .line 1125
    move-result-object v0

    .line 1126
    check-cast v0, Ljava/lang/Throwable;

    .line 1127
    .line 1128
    invoke-static/range {v19 .. v19}, Lqe0;->n(Ljava/util/logging/Level;)I

    .line 1129
    .line 1130
    .line 1131
    return-void

    .line 1132
    :cond_46
    invoke-static {v4}, Lz0;->g(Ljava/lang/String;)V

    .line 1133
    .line 1134
    .line 1135
    return-void

    .line 1136
    :cond_47
    invoke-static {v7}, Lz0;->g(Ljava/lang/String;)V

    .line 1137
    .line 1138
    .line 1139
    return-void

    .line 1140
    :cond_48
    const-string v0, "cannot request log site information prior to postProcess()"

    .line 1141
    .line 1142
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 1143
    .line 1144
    .line 1145
    return-void
.end method


# virtual methods
.method public final i(Ljava/util/logging/Level;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lqe0;->n(Ljava/util/logging/Level;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ltn1;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const-string p0, "all"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public final j(Lee2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltn1;->m:Ljava/util/Set;

    .line 2
    .line 3
    iget-object v1, p0, Ltn1;->n:Lif2;

    .line 4
    .line 5
    iget-object p0, p0, Ltn1;->l:Ljava/util/logging/Level;

    .line 6
    .line 7
    invoke-static {p1, p0, v0, v1}, Ltn1;->m(Lee2;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
