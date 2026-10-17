.class public final Lp10;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lxe0;

.field public final b:Lt3;

.field public final c:Lwx0;

.field public d:Lf4;

.field public e:Ls3;

.field public f:I

.field public g:I

.field public h:I

.field public i:Ly11;


# direct methods
.method public constructor <init>(Lxe0;Lt3;Lwx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp10;->a:Lxe0;

    .line 5
    .line 6
    iput-object p2, p0, Lp10;->b:Lt3;

    .line 7
    .line 8
    iput-object p3, p0, Lp10;->c:Lwx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Z)Lzx0;
    .locals 13

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 2
    .line 3
    iget-boolean v0, v0, Lwx0;->v:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_27

    .line 7
    .line 8
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 9
    .line 10
    iget-object v2, v0, Lwx0;->q:Lzx0;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    if-eqz v2, :cond_7

    .line 15
    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    iget-boolean v0, v2, Lzx0;->j:Z

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, v2, Lzx0;->b:Ly11;

    .line 22
    .line 23
    iget-object v0, v0, Ly11;->a:Lt3;

    .line 24
    .line 25
    iget-object v0, v0, Lt3;->f:Led0;

    .line 26
    .line 27
    iget-object v5, p0, Lp10;->b:Lt3;

    .line 28
    .line 29
    iget-object v5, v5, Lt3;->f:Led0;

    .line 30
    .line 31
    iget v6, v0, Led0;->e:I

    .line 32
    .line 33
    iget v7, v5, Led0;->e:I

    .line 34
    .line 35
    if-ne v6, v7, :cond_1

    .line 36
    .line 37
    iget-object v0, v0, Led0;->d:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, v5, Led0;->d:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, v5}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    move v0, v4

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    move v0, v3

    .line 50
    :goto_1
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move-object v0, v1

    .line 54
    goto :goto_3

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_4

    .line 57
    :cond_3
    :goto_2
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 58
    .line 59
    invoke-virtual {v0}, Lwx0;->i()Ljava/net/Socket;

    .line 60
    .line 61
    .line 62
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :goto_3
    monitor-exit v2

    .line 64
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 65
    .line 66
    iget-object v5, v5, Lwx0;->q:Lzx0;

    .line 67
    .line 68
    if-eqz v5, :cond_5

    .line 69
    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    goto/16 :goto_11

    .line 73
    .line 74
    :cond_4
    const-string p0, "Check failed."

    .line 75
    .line 76
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_5
    if-eqz v0, :cond_6

    .line 81
    .line 82
    invoke-static {v0}, Ljg1;->c(Ljava/net/Socket;)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 86
    .line 87
    goto :goto_5

    .line 88
    :goto_4
    monitor-exit v2

    .line 89
    throw p0

    .line 90
    :cond_7
    :goto_5
    iput v3, p0, Lp10;->f:I

    .line 91
    .line 92
    iput v3, p0, Lp10;->g:I

    .line 93
    .line 94
    iput v3, p0, Lp10;->h:I

    .line 95
    .line 96
    iget-object v2, p0, Lp10;->a:Lxe0;

    .line 97
    .line 98
    iget-object v5, p0, Lp10;->b:Lt3;

    .line 99
    .line 100
    invoke-virtual {v2, v5, v0, v1, v3}, Lxe0;->a(Lt3;Lwx0;Ljava/util/ArrayList;Z)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_8

    .line 105
    .line 106
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 107
    .line 108
    iget-object v2, v0, Lwx0;->q:Lzx0;

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    goto/16 :goto_11

    .line 114
    .line 115
    :cond_8
    iget-object v0, p0, Lp10;->i:Ly11;

    .line 116
    .line 117
    if-eqz v0, :cond_9

    .line 118
    .line 119
    iput-object v1, p0, Lp10;->i:Ly11;

    .line 120
    .line 121
    :goto_6
    move-object v2, v1

    .line 122
    goto/16 :goto_10

    .line 123
    .line 124
    :cond_9
    iget-object v0, p0, Lp10;->d:Lf4;

    .line 125
    .line 126
    if-eqz v0, :cond_b

    .line 127
    .line 128
    invoke-virtual {v0}, Lf4;->c()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_b

    .line 133
    .line 134
    iget-object v0, p0, Lp10;->d:Lf4;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Lf4;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_a

    .line 144
    .line 145
    iget-object v2, v0, Lf4;->c:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v2, Ljava/util/ArrayList;

    .line 148
    .line 149
    iget v3, v0, Lf4;->b:I

    .line 150
    .line 151
    add-int/lit8 v5, v3, 0x1

    .line 152
    .line 153
    iput v5, v0, Lf4;->b:I

    .line 154
    .line 155
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Ly11;

    .line 160
    .line 161
    goto :goto_6

    .line 162
    :cond_a
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 163
    .line 164
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 165
    .line 166
    .line 167
    throw p0

    .line 168
    :cond_b
    iget-object v0, p0, Lp10;->e:Ls3;

    .line 169
    .line 170
    if-nez v0, :cond_c

    .line 171
    .line 172
    new-instance v0, Ls3;

    .line 173
    .line 174
    iget-object v2, p0, Lp10;->b:Lt3;

    .line 175
    .line 176
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 177
    .line 178
    iget-object v6, v5, Lwx0;->j:Lmr0;

    .line 179
    .line 180
    iget-object v6, v6, Lmr0;->u:Lpa0;

    .line 181
    .line 182
    invoke-direct {v0, v2, v6, v5}, Ls3;-><init>(Lt3;Lpa0;Lhi;)V

    .line 183
    .line 184
    .line 185
    iput-object v0, p0, Lp10;->e:Ls3;

    .line 186
    .line 187
    :cond_c
    invoke-virtual {v0}, Ls3;->j()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-eqz v2, :cond_26

    .line 192
    .line 193
    new-instance v2, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    :cond_d
    iget v5, v0, Ls3;->a:I

    .line 199
    .line 200
    iget-object v6, v0, Ls3;->e:Ljava/lang/Object;

    .line 201
    .line 202
    check-cast v6, Ljava/util/List;

    .line 203
    .line 204
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 205
    .line 206
    .line 207
    move-result v6

    .line 208
    if-ge v5, v6, :cond_1c

    .line 209
    .line 210
    iget-object v5, v0, Ls3;->b:Ljava/lang/Object;

    .line 211
    .line 212
    check-cast v5, Lt3;

    .line 213
    .line 214
    const-string v6, "No route to "

    .line 215
    .line 216
    iget v7, v0, Ls3;->a:I

    .line 217
    .line 218
    iget-object v8, v0, Ls3;->e:Ljava/lang/Object;

    .line 219
    .line 220
    check-cast v8, Ljava/util/List;

    .line 221
    .line 222
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    if-ge v7, v8, :cond_1b

    .line 227
    .line 228
    iget-object v7, v0, Ls3;->e:Ljava/lang/Object;

    .line 229
    .line 230
    check-cast v7, Ljava/util/List;

    .line 231
    .line 232
    iget v8, v0, Ls3;->a:I

    .line 233
    .line 234
    add-int/lit8 v9, v8, 0x1

    .line 235
    .line 236
    iput v9, v0, Ls3;->a:I

    .line 237
    .line 238
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v7

    .line 242
    check-cast v7, Ljava/net/Proxy;

    .line 243
    .line 244
    new-instance v8, Ljava/util/ArrayList;

    .line 245
    .line 246
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 247
    .line 248
    .line 249
    iput-object v8, v0, Ls3;->f:Ljava/lang/Object;

    .line 250
    .line 251
    invoke-virtual {v7}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 252
    .line 253
    .line 254
    move-result-object v9

    .line 255
    sget-object v10, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 256
    .line 257
    if-eq v9, v10, :cond_11

    .line 258
    .line 259
    invoke-virtual {v7}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 260
    .line 261
    .line 262
    move-result-object v9

    .line 263
    sget-object v10, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    .line 264
    .line 265
    if-ne v9, v10, :cond_e

    .line 266
    .line 267
    goto :goto_8

    .line 268
    :cond_e
    invoke-virtual {v7}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    instance-of v9, v5, Ljava/net/InetSocketAddress;

    .line 273
    .line 274
    if-eqz v9, :cond_10

    .line 275
    .line 276
    check-cast v5, Ljava/net/InetSocketAddress;

    .line 277
    .line 278
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 279
    .line 280
    .line 281
    move-result-object v9

    .line 282
    if-nez v9, :cond_f

    .line 283
    .line 284
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v9

    .line 288
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 289
    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_f
    invoke-virtual {v9}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v9

    .line 296
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 297
    .line 298
    .line 299
    :goto_7
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getPort()I

    .line 300
    .line 301
    .line 302
    move-result v5

    .line 303
    goto :goto_9

    .line 304
    :cond_10
    const-string p0, "Proxy.address() is not an InetSocketAddress: "

    .line 305
    .line 306
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    .line 311
    .line 312
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 323
    .line 324
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    throw p1

    .line 332
    :cond_11
    :goto_8
    iget-object v5, v5, Lt3;->f:Led0;

    .line 333
    .line 334
    iget-object v9, v5, Led0;->d:Ljava/lang/String;

    .line 335
    .line 336
    iget v5, v5, Led0;->e:I

    .line 337
    .line 338
    :goto_9
    if-gt v4, v5, :cond_1a

    .line 339
    .line 340
    const/high16 v10, 0x10000

    .line 341
    .line 342
    if-ge v5, v10, :cond_1a

    .line 343
    .line 344
    invoke-virtual {v7}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 345
    .line 346
    .line 347
    move-result-object v6

    .line 348
    sget-object v10, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    .line 349
    .line 350
    if-ne v6, v10, :cond_12

    .line 351
    .line 352
    invoke-static {v9, v5}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    goto :goto_d

    .line 360
    :cond_12
    sget-object v6, Ljg1;->a:[B

    .line 361
    .line 362
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 363
    .line 364
    .line 365
    sget-object v6, Ljg1;->e:Lkz0;

    .line 366
    .line 367
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 368
    .line 369
    .line 370
    iget-object v6, v6, Lkz0;->j:Ljava/util/regex/Pattern;

    .line 371
    .line 372
    invoke-virtual {v6, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    .line 377
    .line 378
    .line 379
    move-result v6

    .line 380
    if-eqz v6, :cond_13

    .line 381
    .line 382
    invoke-static {v9}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 383
    .line 384
    .line 385
    move-result-object v6

    .line 386
    invoke-static {v6}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 387
    .line 388
    .line 389
    move-result-object v6

    .line 390
    goto :goto_b

    .line 391
    :cond_13
    sget-object v6, Ltb0;->l:Ltb0;

    .line 392
    .line 393
    :try_start_1
    invoke-static {v9}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    .line 394
    .line 395
    .line 396
    move-result-object v10

    .line 397
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 398
    .line 399
    .line 400
    array-length v11, v10

    .line 401
    if-eqz v11, :cond_15

    .line 402
    .line 403
    if-eq v11, v4, :cond_14

    .line 404
    .line 405
    new-instance v11, Ljava/util/ArrayList;

    .line 406
    .line 407
    new-instance v12, Lz9;

    .line 408
    .line 409
    invoke-direct {v12, v10, v3}, Lz9;-><init>([Ljava/lang/Object;Z)V

    .line 410
    .line 411
    .line 412
    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 413
    .line 414
    .line 415
    move-object v10, v11

    .line 416
    goto :goto_a

    .line 417
    :cond_14
    aget-object v10, v10, v3

    .line 418
    .line 419
    invoke-static {v10}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 420
    .line 421
    .line 422
    move-result-object v10

    .line 423
    goto :goto_a

    .line 424
    :cond_15
    sget-object v10, Lu00;->j:Lu00;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    .line 425
    .line 426
    :goto_a
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 427
    .line 428
    .line 429
    move-result v11

    .line 430
    if-nez v11, :cond_19

    .line 431
    .line 432
    move-object v6, v10

    .line 433
    :goto_b
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 434
    .line 435
    .line 436
    move-result-object v6

    .line 437
    :goto_c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 438
    .line 439
    .line 440
    move-result v9

    .line 441
    if-eqz v9, :cond_16

    .line 442
    .line 443
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v9

    .line 447
    check-cast v9, Ljava/net/InetAddress;

    .line 448
    .line 449
    new-instance v10, Ljava/net/InetSocketAddress;

    .line 450
    .line 451
    invoke-direct {v10, v9, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    goto :goto_c

    .line 458
    :cond_16
    :goto_d
    iget-object v5, v0, Ls3;->f:Ljava/lang/Object;

    .line 459
    .line 460
    check-cast v5, Ljava/util/List;

    .line 461
    .line 462
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 463
    .line 464
    .line 465
    move-result-object v5

    .line 466
    :goto_e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 467
    .line 468
    .line 469
    move-result v6

    .line 470
    if-eqz v6, :cond_18

    .line 471
    .line 472
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v6

    .line 476
    check-cast v6, Ljava/net/InetSocketAddress;

    .line 477
    .line 478
    new-instance v8, Ly11;

    .line 479
    .line 480
    iget-object v9, v0, Ls3;->b:Ljava/lang/Object;

    .line 481
    .line 482
    check-cast v9, Lt3;

    .line 483
    .line 484
    invoke-direct {v8, v9, v7, v6}, Ly11;-><init>(Lt3;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 485
    .line 486
    .line 487
    iget-object v6, v0, Ls3;->d:Ljava/lang/Object;

    .line 488
    .line 489
    check-cast v6, Lpa0;

    .line 490
    .line 491
    monitor-enter v6

    .line 492
    :try_start_2
    iget-object v9, v6, Lpa0;->k:Ljava/lang/Object;

    .line 493
    .line 494
    check-cast v9, Ljava/util/LinkedHashSet;

    .line 495
    .line 496
    invoke-interface {v9, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    move-result v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 500
    monitor-exit v6

    .line 501
    if-eqz v9, :cond_17

    .line 502
    .line 503
    iget-object v6, v0, Ls3;->c:Ljava/lang/Object;

    .line 504
    .line 505
    check-cast v6, Ljava/util/ArrayList;

    .line 506
    .line 507
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    goto :goto_e

    .line 511
    :cond_17
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    goto :goto_e

    .line 515
    :catchall_1
    move-exception p0

    .line 516
    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 517
    throw p0

    .line 518
    :cond_18
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 519
    .line 520
    .line 521
    move-result v5

    .line 522
    if-nez v5, :cond_d

    .line 523
    .line 524
    goto :goto_f

    .line 525
    :cond_19
    new-instance p0, Ljava/net/UnknownHostException;

    .line 526
    .line 527
    new-instance p1, Ljava/lang/StringBuilder;

    .line 528
    .line 529
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 530
    .line 531
    .line 532
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    const-string v0, " returned no addresses for "

    .line 536
    .line 537
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .line 539
    .line 540
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object p1

    .line 547
    invoke-direct {p0, p1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    throw p0

    .line 551
    :catch_0
    move-exception p0

    .line 552
    new-instance p1, Ljava/net/UnknownHostException;

    .line 553
    .line 554
    const-string v0, "Broken system behaviour for dns lookup of "

    .line 555
    .line 556
    invoke-virtual {v0, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 557
    .line 558
    .line 559
    move-result-object v0

    .line 560
    invoke-direct {p1, v0}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    .line 561
    .line 562
    .line 563
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 564
    .line 565
    .line 566
    throw p1

    .line 567
    :cond_1a
    new-instance p0, Ljava/net/SocketException;

    .line 568
    .line 569
    new-instance p1, Ljava/lang/StringBuilder;

    .line 570
    .line 571
    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    const/16 v0, 0x3a

    .line 578
    .line 579
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 583
    .line 584
    .line 585
    const-string v0, "; port is out of range"

    .line 586
    .line 587
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object p1

    .line 594
    invoke-direct {p0, p1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .line 595
    .line 596
    .line 597
    throw p0

    .line 598
    :cond_1b
    new-instance p0, Ljava/net/SocketException;

    .line 599
    .line 600
    iget-object p1, v5, Lt3;->f:Led0;

    .line 601
    .line 602
    iget-object p1, p1, Led0;->d:Ljava/lang/String;

    .line 603
    .line 604
    const-string v1, "; exhausted proxy configurations: "

    .line 605
    .line 606
    iget-object v0, v0, Ls3;->e:Ljava/lang/Object;

    .line 607
    .line 608
    check-cast v0, Ljava/util/List;

    .line 609
    .line 610
    new-instance v2, Ljava/lang/StringBuilder;

    .line 611
    .line 612
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 613
    .line 614
    .line 615
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object p1

    .line 628
    invoke-direct {p0, p1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    throw p0

    .line 632
    :cond_1c
    :goto_f
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 633
    .line 634
    .line 635
    move-result v5

    .line 636
    if-eqz v5, :cond_1d

    .line 637
    .line 638
    iget-object v5, v0, Ls3;->c:Ljava/lang/Object;

    .line 639
    .line 640
    check-cast v5, Ljava/util/ArrayList;

    .line 641
    .line 642
    invoke-static {v5, v2}, Lhl;->x(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    .line 643
    .line 644
    .line 645
    iget-object v0, v0, Ls3;->c:Ljava/lang/Object;

    .line 646
    .line 647
    check-cast v0, Ljava/util/ArrayList;

    .line 648
    .line 649
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 650
    .line 651
    .line 652
    :cond_1d
    new-instance v0, Lf4;

    .line 653
    .line 654
    invoke-direct {v0, v2}, Lf4;-><init>(Ljava/util/ArrayList;)V

    .line 655
    .line 656
    .line 657
    iput-object v0, p0, Lp10;->d:Lf4;

    .line 658
    .line 659
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 660
    .line 661
    iget-boolean v5, v5, Lwx0;->v:Z

    .line 662
    .line 663
    if-nez v5, :cond_25

    .line 664
    .line 665
    iget-object v5, p0, Lp10;->a:Lxe0;

    .line 666
    .line 667
    iget-object v6, p0, Lp10;->b:Lt3;

    .line 668
    .line 669
    iget-object v7, p0, Lp10;->c:Lwx0;

    .line 670
    .line 671
    invoke-virtual {v5, v6, v7, v2, v3}, Lxe0;->a(Lt3;Lwx0;Ljava/util/ArrayList;Z)Z

    .line 672
    .line 673
    .line 674
    move-result v3

    .line 675
    if-eqz v3, :cond_1e

    .line 676
    .line 677
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 678
    .line 679
    iget-object v2, v0, Lwx0;->q:Lzx0;

    .line 680
    .line 681
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 682
    .line 683
    .line 684
    goto :goto_11

    .line 685
    :cond_1e
    invoke-virtual {v0}, Lf4;->c()Z

    .line 686
    .line 687
    .line 688
    move-result v3

    .line 689
    if-eqz v3, :cond_24

    .line 690
    .line 691
    iget v3, v0, Lf4;->b:I

    .line 692
    .line 693
    add-int/lit8 v5, v3, 0x1

    .line 694
    .line 695
    iput v5, v0, Lf4;->b:I

    .line 696
    .line 697
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v0

    .line 701
    check-cast v0, Ly11;

    .line 702
    .line 703
    :goto_10
    new-instance v3, Lzx0;

    .line 704
    .line 705
    iget-object v5, p0, Lp10;->a:Lxe0;

    .line 706
    .line 707
    invoke-direct {v3, v5, v0}, Lzx0;-><init>(Lxe0;Ly11;)V

    .line 708
    .line 709
    .line 710
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 711
    .line 712
    iput-object v3, v5, Lwx0;->x:Lzx0;

    .line 713
    .line 714
    :try_start_4
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 715
    .line 716
    invoke-virtual {v3, v5}, Lzx0;->c(Lhi;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 717
    .line 718
    .line 719
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 720
    .line 721
    iput-object v1, v5, Lwx0;->x:Lzx0;

    .line 722
    .line 723
    iget-object v5, p0, Lp10;->c:Lwx0;

    .line 724
    .line 725
    iget-object v5, v5, Lwx0;->j:Lmr0;

    .line 726
    .line 727
    iget-object v5, v5, Lmr0;->u:Lpa0;

    .line 728
    .line 729
    monitor-enter v5

    .line 730
    :try_start_5
    iget-object v6, v5, Lpa0;->k:Ljava/lang/Object;

    .line 731
    .line 732
    check-cast v6, Ljava/util/LinkedHashSet;

    .line 733
    .line 734
    invoke-interface {v6, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 735
    .line 736
    .line 737
    monitor-exit v5

    .line 738
    iget-object v5, p0, Lp10;->a:Lxe0;

    .line 739
    .line 740
    iget-object v6, p0, Lp10;->b:Lt3;

    .line 741
    .line 742
    iget-object v7, p0, Lp10;->c:Lwx0;

    .line 743
    .line 744
    invoke-virtual {v5, v6, v7, v2, v4}, Lxe0;->a(Lt3;Lwx0;Ljava/util/ArrayList;Z)Z

    .line 745
    .line 746
    .line 747
    move-result v2

    .line 748
    if-eqz v2, :cond_1f

    .line 749
    .line 750
    iget-object v2, p0, Lp10;->c:Lwx0;

    .line 751
    .line 752
    iget-object v2, v2, Lwx0;->q:Lzx0;

    .line 753
    .line 754
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 755
    .line 756
    .line 757
    iput-object v0, p0, Lp10;->i:Ly11;

    .line 758
    .line 759
    iget-object v0, v3, Lzx0;->d:Ljava/net/Socket;

    .line 760
    .line 761
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 762
    .line 763
    .line 764
    invoke-static {v0}, Ljg1;->c(Ljava/net/Socket;)V

    .line 765
    .line 766
    .line 767
    goto :goto_11

    .line 768
    :cond_1f
    monitor-enter v3

    .line 769
    :try_start_6
    iget-object v0, p0, Lp10;->a:Lxe0;

    .line 770
    .line 771
    sget-object v2, Ljg1;->a:[B

    .line 772
    .line 773
    iget-object v2, v0, Lxe0;->d:Ljava/lang/Object;

    .line 774
    .line 775
    check-cast v2, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 776
    .line 777
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 778
    .line 779
    .line 780
    iget-object v2, v0, Lxe0;->b:Ljava/lang/Object;

    .line 781
    .line 782
    check-cast v2, Lob1;

    .line 783
    .line 784
    iget-object v0, v0, Lxe0;->c:Ljava/lang/Object;

    .line 785
    .line 786
    check-cast v0, Lzx;

    .line 787
    .line 788
    invoke-static {v2, v0}, Lob1;->d(Lob1;Ljb1;)V

    .line 789
    .line 790
    .line 791
    iget-object v0, p0, Lp10;->c:Lwx0;

    .line 792
    .line 793
    invoke-virtual {v0, v3}, Lwx0;->a(Lzx0;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 794
    .line 795
    .line 796
    monitor-exit v3

    .line 797
    move-object v2, v3

    .line 798
    :goto_11
    invoke-virtual {v2, p1}, Lzx0;->i(Z)Z

    .line 799
    .line 800
    .line 801
    move-result v0

    .line 802
    if-eqz v0, :cond_20

    .line 803
    .line 804
    return-object v2

    .line 805
    :cond_20
    invoke-virtual {v2}, Lzx0;->k()V

    .line 806
    .line 807
    .line 808
    iget-object v0, p0, Lp10;->i:Ly11;

    .line 809
    .line 810
    if-nez v0, :cond_0

    .line 811
    .line 812
    iget-object v0, p0, Lp10;->d:Lf4;

    .line 813
    .line 814
    if-eqz v0, :cond_21

    .line 815
    .line 816
    invoke-virtual {v0}, Lf4;->c()Z

    .line 817
    .line 818
    .line 819
    move-result v0

    .line 820
    goto :goto_12

    .line 821
    :cond_21
    move v0, v4

    .line 822
    :goto_12
    if-nez v0, :cond_0

    .line 823
    .line 824
    iget-object v0, p0, Lp10;->e:Ls3;

    .line 825
    .line 826
    if-eqz v0, :cond_22

    .line 827
    .line 828
    invoke-virtual {v0}, Ls3;->j()Z

    .line 829
    .line 830
    .line 831
    move-result v4

    .line 832
    :cond_22
    if-eqz v4, :cond_23

    .line 833
    .line 834
    goto/16 :goto_0

    .line 835
    .line 836
    :cond_23
    const-string p0, "exhausted all routes"

    .line 837
    .line 838
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 839
    .line 840
    .line 841
    return-object v1

    .line 842
    :catchall_2
    move-exception p0

    .line 843
    monitor-exit v3

    .line 844
    throw p0

    .line 845
    :catchall_3
    move-exception p0

    .line 846
    :try_start_7
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 847
    throw p0

    .line 848
    :catchall_4
    move-exception p1

    .line 849
    iget-object p0, p0, Lp10;->c:Lwx0;

    .line 850
    .line 851
    iput-object v1, p0, Lwx0;->x:Lzx0;

    .line 852
    .line 853
    throw p1

    .line 854
    :cond_24
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 855
    .line 856
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 857
    .line 858
    .line 859
    throw p0

    .line 860
    :cond_25
    const-string p0, "Canceled"

    .line 861
    .line 862
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 863
    .line 864
    .line 865
    return-object v1

    .line 866
    :cond_26
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 867
    .line 868
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 869
    .line 870
    .line 871
    throw p0

    .line 872
    :cond_27
    const-string p0, "Canceled"

    .line 873
    .line 874
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 875
    .line 876
    .line 877
    return-object v1
.end method

.method public final b(Ljava/io/IOException;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lp10;->i:Ly11;

    .line 6
    .line 7
    instance-of v0, p1, Ly91;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ly91;

    .line 13
    .line 14
    iget v0, v0, Ly91;->j:I

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget p1, p0, Lp10;->f:I

    .line 21
    .line 22
    add-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    iput p1, p0, Lp10;->f:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    instance-of p1, p1, Lpo;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget p1, p0, Lp10;->g:I

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    iput p1, p0, Lp10;->g:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget p1, p0, Lp10;->h:I

    .line 39
    .line 40
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    iput p1, p0, Lp10;->h:I

    .line 43
    .line 44
    return-void
.end method
