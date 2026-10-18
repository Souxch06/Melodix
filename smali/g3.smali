.class public final Lg3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lg3;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v0, v0, Lg3;->a:I

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    const/4 v3, 0x2

    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x1

    .line 11
    const/4 v6, 0x0

    .line 12
    packed-switch v0, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    move v7, v6

    .line 20
    move-object v6, v4

    .line 21
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 22
    .line 23
    .line 24
    move-result v8

    .line 25
    if-ge v8, v0, :cond_3

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    int-to-char v9, v8

    .line 32
    if-eq v9, v5, :cond_2

    .line 33
    .line 34
    if-eq v9, v3, :cond_1

    .line 35
    .line 36
    if-eq v9, v2, :cond_0

    .line 37
    .line 38
    invoke-static {v1, v8}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object v6, Lvm1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 43
    .line 44
    invoke-static {v1, v8, v6}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    check-cast v6, Lvm1;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget-object v4, Loo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 52
    .line 53
    invoke-static {v1, v8, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Loo;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-static {v1, v8}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Lnm1;

    .line 69
    .line 70
    invoke-direct {v0, v7, v4, v6}, Lnm1;-><init>(ILoo;Lvm1;)V

    .line 71
    .line 72
    .line 73
    return-object v0

    .line 74
    :pswitch_0
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    move-object v2, v4

    .line 79
    move-object v6, v2

    .line 80
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    if-ge v7, v0, :cond_7

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    int-to-char v8, v7

    .line 91
    if-eq v8, v5, :cond_5

    .line 92
    .line 93
    if-eq v8, v3, :cond_4

    .line 94
    .line 95
    invoke-static {v1, v7}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    invoke-static {v1, v7}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    goto :goto_1

    .line 104
    :cond_5
    invoke-static {v1, v7}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    if-nez v2, :cond_6

    .line 113
    .line 114
    move-object v2, v4

    .line 115
    goto :goto_1

    .line 116
    :cond_6
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    add-int/2addr v7, v2

    .line 121
    invoke-virtual {v1, v7}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 122
    .line 123
    .line 124
    move-object v2, v8

    .line 125
    goto :goto_1

    .line 126
    :cond_7
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Lkm1;

    .line 130
    .line 131
    invoke-direct {v0, v6, v2}, Lkm1;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 132
    .line 133
    .line 134
    return-object v0

    .line 135
    :pswitch_1
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    const-wide/16 v2, 0x0

    .line 140
    .line 141
    move-wide v15, v2

    .line 142
    move-object v9, v4

    .line 143
    move-object v10, v9

    .line 144
    move-object v11, v10

    .line 145
    move-object v12, v11

    .line 146
    move-object v13, v12

    .line 147
    move-object v14, v13

    .line 148
    move-object/from16 v17, v14

    .line 149
    .line 150
    move-object/from16 v18, v17

    .line 151
    .line 152
    move-object/from16 v19, v18

    .line 153
    .line 154
    move-object/from16 v20, v19

    .line 155
    .line 156
    move v8, v6

    .line 157
    :goto_2
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    if-ge v2, v0, :cond_8

    .line 162
    .line 163
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    int-to-char v3, v2

    .line 168
    packed-switch v3, :pswitch_data_1

    .line 169
    .line 170
    .line 171
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :pswitch_2
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    move-object/from16 v20, v2

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :pswitch_3
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    move-object/from16 v19, v2

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :pswitch_4
    sget-object v3, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 190
    .line 191
    invoke-static {v1, v2, v3}, Lcg1;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    move-object/from16 v18, v2

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :pswitch_5
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    move-object/from16 v17, v2

    .line 203
    .line 204
    goto :goto_2

    .line 205
    :pswitch_6
    invoke-static {v1, v2}, Lcg1;->s(Landroid/os/Parcel;I)J

    .line 206
    .line 207
    .line 208
    move-result-wide v2

    .line 209
    move-wide v15, v2

    .line 210
    goto :goto_2

    .line 211
    :pswitch_7
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    move-object v14, v2

    .line 216
    goto :goto_2

    .line 217
    :pswitch_8
    sget-object v3, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 218
    .line 219
    invoke-static {v1, v2, v3}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    check-cast v2, Landroid/net/Uri;

    .line 224
    .line 225
    move-object v13, v2

    .line 226
    goto :goto_2

    .line 227
    :pswitch_9
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    move-object v12, v2

    .line 232
    goto :goto_2

    .line 233
    :pswitch_a
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    move-object v11, v2

    .line 238
    goto :goto_2

    .line 239
    :pswitch_b
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    move-object v10, v2

    .line 244
    goto :goto_2

    .line 245
    :pswitch_c
    invoke-static {v1, v2}, Lcg1;->h(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    move-object v9, v2

    .line 250
    goto :goto_2

    .line 251
    :pswitch_d
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    move v8, v2

    .line 256
    goto :goto_2

    .line 257
    :cond_8
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 258
    .line 259
    .line 260
    new-instance v7, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 261
    .line 262
    invoke-direct/range {v7 .. v20}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;JLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return-object v7

    .line 266
    :pswitch_e
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    move v7, v6

    .line 271
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    if-ge v8, v0, :cond_c

    .line 276
    .line 277
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 278
    .line 279
    .line 280
    move-result v8

    .line 281
    int-to-char v9, v8

    .line 282
    if-eq v9, v5, :cond_b

    .line 283
    .line 284
    if-eq v9, v3, :cond_a

    .line 285
    .line 286
    if-eq v9, v2, :cond_9

    .line 287
    .line 288
    invoke-static {v1, v8}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 289
    .line 290
    .line 291
    goto :goto_3

    .line 292
    :cond_9
    sget-object v4, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 293
    .line 294
    invoke-static {v1, v8, v4}, Lcg1;->g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    check-cast v4, Landroid/content/Intent;

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :cond_a
    invoke-static {v1, v8}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 302
    .line 303
    .line 304
    move-result v7

    .line 305
    goto :goto_3

    .line 306
    :cond_b
    invoke-static {v1, v8}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 307
    .line 308
    .line 309
    move-result v6

    .line 310
    goto :goto_3

    .line 311
    :cond_c
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 312
    .line 313
    .line 314
    new-instance v0, Lel1;

    .line 315
    .line 316
    invoke-direct {v0, v6, v7, v4}, Lel1;-><init>(IILandroid/content/Intent;)V

    .line 317
    .line 318
    .line 319
    return-object v0

    .line 320
    :pswitch_f
    invoke-static {v1}, Lcg1;->B(Landroid/os/Parcel;)I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    :goto_4
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 325
    .line 326
    .line 327
    move-result v2

    .line 328
    if-ge v2, v0, :cond_f

    .line 329
    .line 330
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    int-to-char v7, v2

    .line 335
    if-eq v7, v5, :cond_e

    .line 336
    .line 337
    if-eq v7, v3, :cond_d

    .line 338
    .line 339
    invoke-static {v1, v2}, Lcg1;->y(Landroid/os/Parcel;I)V

    .line 340
    .line 341
    .line 342
    goto :goto_4

    .line 343
    :cond_d
    sget-object v4, Lco0;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 344
    .line 345
    invoke-static {v1, v2, v4}, Lcg1;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 346
    .line 347
    .line 348
    move-result-object v4

    .line 349
    goto :goto_4

    .line 350
    :cond_e
    invoke-static {v1, v2}, Lcg1;->r(Landroid/os/Parcel;I)I

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    goto :goto_4

    .line 355
    :cond_f
    invoke-static {v1, v0}, Lcg1;->l(Landroid/os/Parcel;I)V

    .line 356
    .line 357
    .line 358
    new-instance v0, Lsb1;

    .line 359
    .line 360
    invoke-direct {v0, v6, v4}, Lsb1;-><init>(ILjava/util/List;)V

    .line 361
    .line 362
    .line 363
    return-object v0

    .line 364
    :pswitch_10
    new-instance v0, Lee1;

    .line 365
    .line 366
    invoke-direct {v0, v1}, Lee1;-><init>(Landroid/os/Parcel;)V

    .line 367
    .line 368
    .line 369
    return-object v0

    .line 370
    :pswitch_11
    new-instance v0, Lcom/google/firebase/perf/metrics/Trace;

    .line 371
    .line 372
    invoke-direct {v0, v1, v6}, Lcom/google/firebase/perf/metrics/Trace;-><init>(Landroid/os/Parcel;Z)V

    .line 373
    .line 374
    .line 375
    return-object v0

    .line 376
    :pswitch_12
    new-instance v0, Loc1;

    .line 377
    .line 378
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 379
    .line 380
    .line 381
    move-result-wide v2

    .line 382
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 383
    .line 384
    .line 385
    move-result-wide v4

    .line 386
    invoke-direct {v0, v2, v3, v4, v5}, Loc1;-><init>(JJ)V

    .line 387
    .line 388
    .line 389
    return-object v0

    .line 390
    :pswitch_13
    new-instance v0, Lk91;

    .line 391
    .line 392
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    iput v2, v0, Lk91;->j:I

    .line 400
    .line 401
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    iput v2, v0, Lk91;->k:I

    .line 406
    .line 407
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 408
    .line 409
    .line 410
    move-result v2

    .line 411
    iput v2, v0, Lk91;->l:I

    .line 412
    .line 413
    if-lez v2, :cond_10

    .line 414
    .line 415
    new-array v2, v2, [I

    .line 416
    .line 417
    iput-object v2, v0, Lk91;->m:[I

    .line 418
    .line 419
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->readIntArray([I)V

    .line 420
    .line 421
    .line 422
    :cond_10
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 423
    .line 424
    .line 425
    move-result v2

    .line 426
    iput v2, v0, Lk91;->n:I

    .line 427
    .line 428
    if-lez v2, :cond_11

    .line 429
    .line 430
    new-array v2, v2, [I

    .line 431
    .line 432
    iput-object v2, v0, Lk91;->o:[I

    .line 433
    .line 434
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->readIntArray([I)V

    .line 435
    .line 436
    .line 437
    :cond_11
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    if-ne v2, v5, :cond_12

    .line 442
    .line 443
    move v2, v5

    .line 444
    goto :goto_5

    .line 445
    :cond_12
    move v2, v6

    .line 446
    :goto_5
    iput-boolean v2, v0, Lk91;->q:Z

    .line 447
    .line 448
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 449
    .line 450
    .line 451
    move-result v2

    .line 452
    if-ne v2, v5, :cond_13

    .line 453
    .line 454
    move v2, v5

    .line 455
    goto :goto_6

    .line 456
    :cond_13
    move v2, v6

    .line 457
    :goto_6
    iput-boolean v2, v0, Lk91;->r:Z

    .line 458
    .line 459
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    if-ne v2, v5, :cond_14

    .line 464
    .line 465
    goto :goto_7

    .line 466
    :cond_14
    move v5, v6

    .line 467
    :goto_7
    iput-boolean v5, v0, Lk91;->s:Z

    .line 468
    .line 469
    const-class v2, Lj91;

    .line 470
    .line 471
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    iput-object v1, v0, Lk91;->p:Ljava/util/ArrayList;

    .line 480
    .line 481
    return-object v0

    .line 482
    :pswitch_14
    new-instance v0, Lj91;

    .line 483
    .line 484
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 488
    .line 489
    .line 490
    move-result v2

    .line 491
    iput v2, v0, Lj91;->j:I

    .line 492
    .line 493
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 494
    .line 495
    .line 496
    move-result v2

    .line 497
    iput v2, v0, Lj91;->k:I

    .line 498
    .line 499
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 500
    .line 501
    .line 502
    move-result v2

    .line 503
    if-ne v2, v5, :cond_15

    .line 504
    .line 505
    goto :goto_8

    .line 506
    :cond_15
    move v5, v6

    .line 507
    :goto_8
    iput-boolean v5, v0, Lj91;->m:Z

    .line 508
    .line 509
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    if-lez v2, :cond_16

    .line 514
    .line 515
    new-array v2, v2, [I

    .line 516
    .line 517
    iput-object v2, v0, Lj91;->l:[I

    .line 518
    .line 519
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->readIntArray([I)V

    .line 520
    .line 521
    .line 522
    :cond_16
    return-object v0

    .line 523
    :pswitch_15
    new-instance v0, Lo31;

    .line 524
    .line 525
    invoke-direct {v0, v1}, Lo31;-><init>(Landroid/os/Parcel;)V

    .line 526
    .line 527
    .line 528
    return-object v0

    .line 529
    :pswitch_16
    new-instance v0, Ln11;

    .line 530
    .line 531
    invoke-direct {v0, v1}, Ln11;-><init>(Landroid/os/Parcel;)V

    .line 532
    .line 533
    .line 534
    return-object v0

    .line 535
    :pswitch_17
    new-instance v0, Leu0;

    .line 536
    .line 537
    invoke-direct {v0, v1}, Leu0;-><init>(Landroid/os/Parcel;)V

    .line 538
    .line 539
    .line 540
    return-object v0

    .line 541
    :pswitch_18
    new-instance v0, Lst0;

    .line 542
    .line 543
    invoke-direct {v0, v1}, Lst0;-><init>(Landroid/os/Parcel;)V

    .line 544
    .line 545
    .line 546
    return-object v0

    .line 547
    :pswitch_19
    new-instance v0, Lct0;

    .line 548
    .line 549
    invoke-direct {v0, v1}, Lct0;-><init>(Landroid/os/Parcel;)V

    .line 550
    .line 551
    .line 552
    return-object v0

    .line 553
    :pswitch_1a
    new-instance v0, Landroidx/versionedparcelable/ParcelImpl;

    .line 554
    .line 555
    invoke-direct {v0, v1}, Landroidx/versionedparcelable/ParcelImpl;-><init>(Landroid/os/Parcel;)V

    .line 556
    .line 557
    .line 558
    return-object v0

    .line 559
    :pswitch_1b
    new-instance v0, Lfp0;

    .line 560
    .line 561
    invoke-direct {v0, v1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 565
    .line 566
    .line 567
    move-result v1

    .line 568
    iput v1, v0, Lfp0;->j:I

    .line 569
    .line 570
    return-object v0

    .line 571
    :pswitch_1c
    new-instance v0, Loo0;

    .line 572
    .line 573
    invoke-direct {v0, v1}, Loo0;-><init>(Landroid/os/Parcel;)V

    .line 574
    .line 575
    .line 576
    return-object v0

    .line 577
    :pswitch_1d
    new-instance v0, Lbm0;

    .line 578
    .line 579
    invoke-direct {v0, v1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 580
    .line 581
    .line 582
    const-class v2, Lbm0;

    .line 583
    .line 584
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 585
    .line 586
    .line 587
    move-result-object v2

    .line 588
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object v1

    .line 592
    check-cast v1, Ljava/lang/Integer;

    .line 593
    .line 594
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 595
    .line 596
    .line 597
    move-result v1

    .line 598
    iput v1, v0, Lbm0;->j:I

    .line 599
    .line 600
    return-object v0

    .line 601
    :pswitch_1e
    new-instance v0, Lmj0;

    .line 602
    .line 603
    invoke-direct {v0, v1}, Lmj0;-><init>(Landroid/os/Parcel;)V

    .line 604
    .line 605
    .line 606
    return-object v0

    .line 607
    :pswitch_1f
    new-instance v0, Lni0;

    .line 608
    .line 609
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 610
    .line 611
    .line 612
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 613
    .line 614
    .line 615
    move-result v2

    .line 616
    iput v2, v0, Lni0;->j:I

    .line 617
    .line 618
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 619
    .line 620
    .line 621
    move-result v2

    .line 622
    iput v2, v0, Lni0;->k:I

    .line 623
    .line 624
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 625
    .line 626
    .line 627
    move-result v1

    .line 628
    if-ne v1, v5, :cond_17

    .line 629
    .line 630
    goto :goto_9

    .line 631
    :cond_17
    move v5, v6

    .line 632
    :goto_9
    iput-boolean v5, v0, Lni0;->l:Z

    .line 633
    .line 634
    return-object v0

    .line 635
    :pswitch_20
    new-instance v0, Le80;

    .line 636
    .line 637
    invoke-direct {v0, v1}, Le80;-><init>(Landroid/os/Parcel;)V

    .line 638
    .line 639
    .line 640
    return-object v0

    .line 641
    :pswitch_21
    new-instance v0, La80;

    .line 642
    .line 643
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 644
    .line 645
    .line 646
    iput-object v4, v0, La80;->n:Ljava/lang/String;

    .line 647
    .line 648
    new-instance v2, Ljava/util/ArrayList;

    .line 649
    .line 650
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 651
    .line 652
    .line 653
    iput-object v2, v0, La80;->o:Ljava/util/ArrayList;

    .line 654
    .line 655
    new-instance v2, Ljava/util/ArrayList;

    .line 656
    .line 657
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 658
    .line 659
    .line 660
    iput-object v2, v0, La80;->p:Ljava/util/ArrayList;

    .line 661
    .line 662
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 663
    .line 664
    .line 665
    move-result-object v2

    .line 666
    iput-object v2, v0, La80;->j:Ljava/util/ArrayList;

    .line 667
    .line 668
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 669
    .line 670
    .line 671
    move-result-object v2

    .line 672
    iput-object v2, v0, La80;->k:Ljava/util/ArrayList;

    .line 673
    .line 674
    sget-object v2, Luf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 675
    .line 676
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    check-cast v2, [Luf;

    .line 681
    .line 682
    iput-object v2, v0, La80;->l:[Luf;

    .line 683
    .line 684
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 685
    .line 686
    .line 687
    move-result v2

    .line 688
    iput v2, v0, La80;->m:I

    .line 689
    .line 690
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v2

    .line 694
    iput-object v2, v0, La80;->n:Ljava/lang/String;

    .line 695
    .line 696
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 697
    .line 698
    .line 699
    move-result-object v2

    .line 700
    iput-object v2, v0, La80;->o:Ljava/util/ArrayList;

    .line 701
    .line 702
    sget-object v2, Lvf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 703
    .line 704
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 705
    .line 706
    .line 707
    move-result-object v2

    .line 708
    iput-object v2, v0, La80;->p:Ljava/util/ArrayList;

    .line 709
    .line 710
    sget-object v2, Lw70;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 711
    .line 712
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 713
    .line 714
    .line 715
    move-result-object v1

    .line 716
    iput-object v1, v0, La80;->q:Ljava/util/ArrayList;

    .line 717
    .line 718
    return-object v0

    .line 719
    :pswitch_22
    new-instance v0, Lw70;

    .line 720
    .line 721
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 722
    .line 723
    .line 724
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 725
    .line 726
    .line 727
    move-result-object v2

    .line 728
    iput-object v2, v0, Lw70;->j:Ljava/lang/String;

    .line 729
    .line 730
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 731
    .line 732
    .line 733
    move-result v1

    .line 734
    iput v1, v0, Lw70;->k:I

    .line 735
    .line 736
    return-object v0

    .line 737
    :pswitch_23
    new-instance v0, Lnz;

    .line 738
    .line 739
    invoke-direct {v0, v1}, Lnz;-><init>(Landroid/os/Parcel;)V

    .line 740
    .line 741
    .line 742
    return-object v0

    .line 743
    :pswitch_24
    new-instance v0, Lfr;

    .line 744
    .line 745
    invoke-direct {v0, v1}, Lfr;-><init>(Landroid/os/Parcel;)V

    .line 746
    .line 747
    .line 748
    return-object v0

    .line 749
    :pswitch_25
    new-instance v0, Lvf;

    .line 750
    .line 751
    invoke-direct {v0, v1}, Lvf;-><init>(Landroid/os/Parcel;)V

    .line 752
    .line 753
    .line 754
    return-object v0

    .line 755
    :pswitch_26
    new-instance v0, Luf;

    .line 756
    .line 757
    invoke-direct {v0, v1}, Luf;-><init>(Landroid/os/Parcel;)V

    .line 758
    .line 759
    .line 760
    return-object v0

    .line 761
    :pswitch_27
    new-instance v0, Lg8;

    .line 762
    .line 763
    invoke-direct {v0, v1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 764
    .line 765
    .line 766
    invoke-virtual {v1}, Landroid/os/Parcel;->readByte()B

    .line 767
    .line 768
    .line 769
    move-result v1

    .line 770
    if-eqz v1, :cond_18

    .line 771
    .line 772
    goto :goto_a

    .line 773
    :cond_18
    move v5, v6

    .line 774
    :goto_a
    iput-boolean v5, v0, Lg8;->j:Z

    .line 775
    .line 776
    return-object v0

    .line 777
    :pswitch_28
    new-instance v0, Lh3;

    .line 778
    .line 779
    invoke-direct {v0, v1}, Lh3;-><init>(Landroid/os/Parcel;)V

    .line 780
    .line 781
    .line 782
    return-object v0

    .line 783
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_28
        :pswitch_27
        :pswitch_26
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
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    :pswitch_data_1
    .packed-switch 0x1
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
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Lg3;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p0, p1, [Lnm1;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    new-array p0, p1, [Lkm1;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    new-array p0, p1, [Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_2
    new-array p0, p1, [Lel1;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_3
    new-array p0, p1, [Lsb1;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_4
    new-array p0, p1, [Lee1;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_5
    new-array p0, p1, [Lcom/google/firebase/perf/metrics/Trace;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_6
    new-array p0, p1, [Loc1;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_7
    new-array p0, p1, [Lk91;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_8
    new-array p0, p1, [Lj91;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_9
    new-array p0, p1, [Lo31;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_a
    new-array p0, p1, [Ln11;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_b
    new-array p0, p1, [Leu0;

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_c
    new-array p0, p1, [Lst0;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_d
    new-array p0, p1, [Lct0;

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_e
    new-array p0, p1, [Landroidx/versionedparcelable/ParcelImpl;

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_f
    new-array p0, p1, [Lfp0;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_10
    new-array p0, p1, [Loo0;

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_11
    new-array p0, p1, [Lbm0;

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_12
    new-array p0, p1, [Lmj0;

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_13
    new-array p0, p1, [Lni0;

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_14
    new-array p0, p1, [Le80;

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_15
    new-array p0, p1, [La80;

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_16
    new-array p0, p1, [Lw70;

    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_17
    new-array p0, p1, [Lnz;

    .line 79
    .line 80
    return-object p0

    .line 81
    :pswitch_18
    new-array p0, p1, [Lfr;

    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_19
    new-array p0, p1, [Lvf;

    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_1a
    new-array p0, p1, [Luf;

    .line 88
    .line 89
    return-object p0

    .line 90
    :pswitch_1b
    new-array p0, p1, [Lg8;

    .line 91
    .line 92
    return-object p0

    .line 93
    :pswitch_1c
    new-array p0, p1, [Lh3;

    .line 94
    .line 95
    return-object p0

    .line 96
    nop

    .line 97
    :pswitch_data_0
    .packed-switch 0x0
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
