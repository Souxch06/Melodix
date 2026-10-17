.class public final Lno;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lff0;


# static fields
.field public static final b:Lno;


# instance fields
.field public final synthetic a:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lno;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lno;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lno;->b:Lno;

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lno;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lay0;)Lf11;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v0, v0, Lno;->a:I

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x1

    .line 9
    const/4 v6, 0x0

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    const-string v7, "Connection"

    .line 14
    .line 15
    const-string v8, "close"

    .line 16
    .line 17
    const-string v9, "HTTP "

    .line 18
    .line 19
    iget-object v10, v1, Lay0;->d:Lai;

    .line 20
    .line 21
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget-object v0, v10, Lai;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Lwx0;

    .line 27
    .line 28
    iget-object v11, v10, Lai;->d:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v11, Lo10;

    .line 31
    .line 32
    iget-object v12, v10, Lai;->e:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v12, Lzx0;

    .line 35
    .line 36
    iget-object v1, v1, Lay0;->e:Lm01;

    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v13

    .line 42
    :try_start_0
    invoke-interface {v11, v1}, Lo10;->a(Lm01;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 43
    .line 44
    .line 45
    :try_start_1
    iget-object v15, v1, Lm01;->b:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v15}, Las;->q(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v10, v5, v6, v4}, Lwx0;->g(Lai;ZZLjava/io/IOException;)Ljava/io/IOException;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .line 52
    .line 53
    :try_start_2
    invoke-interface {v11}, Lo10;->c()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 54
    .line 55
    .line 56
    move-object v5, v4

    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception v0

    .line 59
    :try_start_3
    invoke-virtual {v10, v0}, Lai;->c(Ljava/io/IOException;)V

    .line 60
    .line 61
    .line 62
    throw v0

    .line 63
    :catch_1
    move-exception v0

    .line 64
    goto :goto_0

    .line 65
    :catch_2
    move-exception v0

    .line 66
    invoke-virtual {v10, v0}, Lai;->c(Ljava/io/IOException;)V

    .line 67
    .line 68
    .line 69
    throw v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 70
    :goto_0
    instance-of v5, v0, Lpo;

    .line 71
    .line 72
    if-nez v5, :cond_a

    .line 73
    .line 74
    iget-boolean v5, v10, Lai;->a:Z

    .line 75
    .line 76
    if-eqz v5, :cond_9

    .line 77
    .line 78
    move-object v5, v0

    .line 79
    :goto_1
    :try_start_4
    invoke-virtual {v10, v6}, Lai;->b(Z)Le11;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    iput-object v1, v0, Le11;->a:Lm01;

    .line 87
    .line 88
    iget-object v15, v12, Lzx0;->e:Lnb0;

    .line 89
    .line 90
    iput-object v15, v0, Le11;->e:Lnb0;

    .line 91
    .line 92
    iput-wide v13, v0, Le11;->k:J

    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v2

    .line 98
    iput-wide v2, v0, Le11;->l:J

    .line 99
    .line 100
    invoke-virtual {v0}, Le11;->a()Lf11;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget v2, v0, Lf11;->m:I

    .line 105
    .line 106
    const/16 v3, 0x64

    .line 107
    .line 108
    if-ne v2, v3, :cond_0

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_0
    const/16 v3, 0x66

    .line 112
    .line 113
    if-gt v3, v2, :cond_1

    .line 114
    .line 115
    const/16 v3, 0xc8

    .line 116
    .line 117
    if-ge v2, v3, :cond_1

    .line 118
    .line 119
    :goto_2
    invoke-virtual {v10, v6}, Lai;->b(Z)Le11;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    iput-object v1, v0, Le11;->a:Lm01;

    .line 127
    .line 128
    iget-object v1, v12, Lzx0;->e:Lnb0;

    .line 129
    .line 130
    iput-object v1, v0, Le11;->e:Lnb0;

    .line 131
    .line 132
    iput-wide v13, v0, Le11;->k:J

    .line 133
    .line 134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 135
    .line 136
    .line 137
    move-result-wide v1

    .line 138
    iput-wide v1, v0, Le11;->l:J

    .line 139
    .line 140
    invoke-virtual {v0}, Le11;->a()Lf11;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget v2, v0, Lf11;->m:I

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :catch_3
    move-exception v0

    .line 148
    goto/16 :goto_5

    .line 149
    .line 150
    :cond_1
    :goto_3
    invoke-virtual {v0}, Lf11;->h()Le11;

    .line 151
    .line 152
    .line 153
    move-result-object v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 154
    :try_start_5
    const-string v3, "Content-Type"

    .line 155
    .line 156
    invoke-static {v0, v3}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-interface {v11, v0}, Lo10;->e(Lf11;)J

    .line 161
    .line 162
    .line 163
    move-result-wide v12

    .line 164
    invoke-interface {v11, v0}, Lo10;->b(Lf11;)Lp81;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v6, Ln10;

    .line 169
    .line 170
    invoke-direct {v6, v10, v0, v12, v13}, Ln10;-><init>(Lai;Lp81;J)V

    .line 171
    .line 172
    .line 173
    new-instance v0, Lby0;

    .line 174
    .line 175
    new-instance v14, Lsx0;

    .line 176
    .line 177
    invoke-direct {v14, v6}, Lsx0;-><init>(Lp81;)V

    .line 178
    .line 179
    .line 180
    invoke-direct {v0, v3, v12, v13, v14}, Lby0;-><init>(Ljava/lang/String;JLsx0;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 181
    .line 182
    .line 183
    :try_start_6
    iput-object v0, v1, Le11;->g:Lh11;

    .line 184
    .line 185
    invoke-virtual {v1}, Le11;->a()Lf11;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iget-object v1, v0, Lf11;->j:Lm01;

    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    iget-object v1, v1, Lm01;->c:Lsb0;

    .line 195
    .line 196
    invoke-virtual {v1, v7}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_2

    .line 205
    .line 206
    invoke-static {v0, v7}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-eqz v1, :cond_3

    .line 215
    .line 216
    :cond_2
    invoke-interface {v11}, Lo10;->g()Lzx0;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v1}, Lzx0;->k()V

    .line 221
    .line 222
    .line 223
    :cond_3
    const/16 v1, 0xcc

    .line 224
    .line 225
    if-eq v2, v1, :cond_4

    .line 226
    .line 227
    const/16 v1, 0xcd

    .line 228
    .line 229
    if-ne v2, v1, :cond_7

    .line 230
    .line 231
    :cond_4
    iget-object v1, v0, Lf11;->p:Lh11;

    .line 232
    .line 233
    if-eqz v1, :cond_5

    .line 234
    .line 235
    invoke-virtual {v1}, Lh11;->a()J

    .line 236
    .line 237
    .line 238
    move-result-wide v6

    .line 239
    move-wide v15, v6

    .line 240
    goto :goto_4

    .line 241
    :cond_5
    const-wide/16 v15, -0x1

    .line 242
    .line 243
    :goto_4
    const-wide/16 v6, 0x0

    .line 244
    .line 245
    cmp-long v1, v15, v6

    .line 246
    .line 247
    if-lez v1, :cond_7

    .line 248
    .line 249
    new-instance v1, Ljava/net/ProtocolException;

    .line 250
    .line 251
    new-instance v3, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v3, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v2, " had non-zero Content-Length: "

    .line 260
    .line 261
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    iget-object v0, v0, Lf11;->p:Lh11;

    .line 265
    .line 266
    if-eqz v0, :cond_6

    .line 267
    .line 268
    invoke-virtual {v0}, Lh11;->a()J

    .line 269
    .line 270
    .line 271
    move-result-wide v6

    .line 272
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    :cond_6
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    throw v1

    .line 287
    :cond_7
    return-object v0

    .line 288
    :catch_4
    move-exception v0

    .line 289
    invoke-virtual {v10, v0}, Lai;->c(Ljava/io/IOException;)V

    .line 290
    .line 291
    .line 292
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 293
    :goto_5
    if-eqz v5, :cond_8

    .line 294
    .line 295
    invoke-static {v5, v0}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 296
    .line 297
    .line 298
    throw v5

    .line 299
    :cond_8
    throw v0

    .line 300
    :cond_9
    throw v0

    .line 301
    :cond_a
    throw v0

    .line 302
    :pswitch_0
    const-string v0, "Content-Encoding"

    .line 303
    .line 304
    const-string v2, "User-Agent"

    .line 305
    .line 306
    const-string v3, "gzip"

    .line 307
    .line 308
    const-string v4, "Accept-Encoding"

    .line 309
    .line 310
    const-string v7, "Connection"

    .line 311
    .line 312
    const-string v8, "Host"

    .line 313
    .line 314
    const-string v9, "Content-Type"

    .line 315
    .line 316
    const-string v10, "Content-Length"

    .line 317
    .line 318
    iget-object v11, v1, Lay0;->e:Lm01;

    .line 319
    .line 320
    invoke-virtual {v11}, Lm01;->a()Ler0;

    .line 321
    .line 322
    .line 323
    move-result-object v12

    .line 324
    iget-object v13, v11, Lm01;->a:Led0;

    .line 325
    .line 326
    iget-object v14, v11, Lm01;->c:Lsb0;

    .line 327
    .line 328
    invoke-virtual {v14, v8}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v17

    .line 332
    if-nez v17, :cond_b

    .line 333
    .line 334
    invoke-static {v13, v6}, Ljg1;->p(Led0;Z)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v15

    .line 338
    iget-object v6, v12, Ler0;->m:Ljava/lang/Object;

    .line 339
    .line 340
    check-cast v6, Lrb0;

    .line 341
    .line 342
    invoke-virtual {v6, v8, v15}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    :cond_b
    invoke-virtual {v14, v7}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v6

    .line 349
    if-nez v6, :cond_c

    .line 350
    .line 351
    const-string v6, "Keep-Alive"

    .line 352
    .line 353
    iget-object v8, v12, Ler0;->m:Ljava/lang/Object;

    .line 354
    .line 355
    check-cast v8, Lrb0;

    .line 356
    .line 357
    invoke-virtual {v8, v7, v6}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    :cond_c
    invoke-virtual {v14, v4}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v6

    .line 364
    if-nez v6, :cond_d

    .line 365
    .line 366
    const-string v6, "Range"

    .line 367
    .line 368
    invoke-virtual {v14, v6}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v6

    .line 372
    if-nez v6, :cond_d

    .line 373
    .line 374
    iget-object v6, v12, Ler0;->m:Ljava/lang/Object;

    .line 375
    .line 376
    check-cast v6, Lrb0;

    .line 377
    .line 378
    invoke-virtual {v6, v4, v3}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    goto :goto_6

    .line 382
    :cond_d
    const/4 v5, 0x0

    .line 383
    :goto_6
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v14, v2}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    if-nez v4, :cond_e

    .line 391
    .line 392
    const-string v4, "okhttp/4.12.0"

    .line 393
    .line 394
    iget-object v6, v12, Ler0;->m:Ljava/lang/Object;

    .line 395
    .line 396
    check-cast v6, Lrb0;

    .line 397
    .line 398
    invoke-virtual {v6, v2, v4}, Lrb0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    :cond_e
    invoke-virtual {v12}, Ler0;->c()Lm01;

    .line 402
    .line 403
    .line 404
    move-result-object v2

    .line 405
    invoke-virtual {v1, v2}, Lay0;->b(Lm01;)Lf11;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    sget v2, Lcd0;->a:I

    .line 410
    .line 411
    invoke-virtual {v1}, Lf11;->h()Le11;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    iput-object v11, v2, Le11;->a:Lm01;

    .line 416
    .line 417
    if-eqz v5, :cond_f

    .line 418
    .line 419
    invoke-static {v1, v0}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 424
    .line 425
    .line 426
    move-result v3

    .line 427
    if-eqz v3, :cond_f

    .line 428
    .line 429
    invoke-static {v1}, Lcd0;->a(Lf11;)Z

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    if-eqz v3, :cond_f

    .line 434
    .line 435
    iget-object v3, v1, Lf11;->p:Lh11;

    .line 436
    .line 437
    if-eqz v3, :cond_f

    .line 438
    .line 439
    new-instance v4, Lhb0;

    .line 440
    .line 441
    invoke-virtual {v3}, Lh11;->h()Llh;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    invoke-direct {v4, v3}, Lhb0;-><init>(Lp81;)V

    .line 446
    .line 447
    .line 448
    iget-object v3, v1, Lf11;->o:Lsb0;

    .line 449
    .line 450
    invoke-virtual {v3}, Lsb0;->d()Lrb0;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    invoke-virtual {v3, v0}, Lrb0;->e(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {v3, v10}, Lrb0;->e(Ljava/lang/String;)V

    .line 458
    .line 459
    .line 460
    invoke-virtual {v3}, Lrb0;->c()Lsb0;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    invoke-virtual {v0}, Lsb0;->d()Lrb0;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    iput-object v0, v2, Le11;->f:Lrb0;

    .line 469
    .line 470
    invoke-static {v1, v9}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    new-instance v1, Lby0;

    .line 475
    .line 476
    new-instance v3, Lsx0;

    .line 477
    .line 478
    invoke-direct {v3, v4}, Lsx0;-><init>(Lp81;)V

    .line 479
    .line 480
    .line 481
    const-wide/16 v4, -0x1

    .line 482
    .line 483
    invoke-direct {v1, v0, v4, v5, v3}, Lby0;-><init>(Ljava/lang/String;JLsx0;)V

    .line 484
    .line 485
    .line 486
    iput-object v1, v2, Le11;->g:Lh11;

    .line 487
    .line 488
    :cond_f
    invoke-virtual {v2}, Le11;->a()Lf11;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    return-object v0

    .line 493
    :pswitch_1
    iget-object v2, v1, Lay0;->a:Lwx0;

    .line 494
    .line 495
    monitor-enter v2

    .line 496
    :try_start_7
    iget-boolean v0, v2, Lwx0;->u:Z

    .line 497
    .line 498
    if-eqz v0, :cond_13

    .line 499
    .line 500
    iget-boolean v0, v2, Lwx0;->t:Z

    .line 501
    .line 502
    if-nez v0, :cond_12

    .line 503
    .line 504
    iget-boolean v0, v2, Lwx0;->s:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 505
    .line 506
    if-nez v0, :cond_11

    .line 507
    .line 508
    monitor-exit v2

    .line 509
    iget-object v3, v2, Lwx0;->p:Lp10;

    .line 510
    .line 511
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 512
    .line 513
    .line 514
    iget-object v0, v2, Lwx0;->j:Lmr0;

    .line 515
    .line 516
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 517
    .line 518
    .line 519
    :try_start_8
    iget-object v6, v1, Lay0;->e:Lm01;

    .line 520
    .line 521
    iget-object v6, v6, Lm01;->b:Ljava/lang/String;

    .line 522
    .line 523
    const-string v7, "GET"

    .line 524
    .line 525
    invoke-static {v6, v7}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 526
    .line 527
    .line 528
    move-result v6

    .line 529
    xor-int/2addr v6, v5

    .line 530
    invoke-virtual {v3, v6}, Lp10;->a(Z)Lzx0;

    .line 531
    .line 532
    .line 533
    move-result-object v6

    .line 534
    invoke-virtual {v6, v0, v1}, Lzx0;->j(Lmr0;Lay0;)Lo10;

    .line 535
    .line 536
    .line 537
    move-result-object v0
    :try_end_8
    .catch Lz11; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 538
    new-instance v6, Lai;

    .line 539
    .line 540
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 541
    .line 542
    .line 543
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 544
    .line 545
    .line 546
    iput-object v2, v6, Lai;->b:Ljava/lang/Object;

    .line 547
    .line 548
    iput-object v3, v6, Lai;->c:Ljava/lang/Object;

    .line 549
    .line 550
    iput-object v0, v6, Lai;->d:Ljava/lang/Object;

    .line 551
    .line 552
    invoke-interface {v0}, Lo10;->g()Lzx0;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    iput-object v0, v6, Lai;->e:Ljava/lang/Object;

    .line 557
    .line 558
    iput-object v6, v2, Lwx0;->r:Lai;

    .line 559
    .line 560
    iput-object v6, v2, Lwx0;->w:Lai;

    .line 561
    .line 562
    monitor-enter v2

    .line 563
    :try_start_9
    iput-boolean v5, v2, Lwx0;->s:Z

    .line 564
    .line 565
    iput-boolean v5, v2, Lwx0;->t:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 566
    .line 567
    monitor-exit v2

    .line 568
    iget-boolean v0, v2, Lwx0;->v:Z

    .line 569
    .line 570
    if-nez v0, :cond_10

    .line 571
    .line 572
    const/16 v0, 0x3d

    .line 573
    .line 574
    const/4 v2, 0x0

    .line 575
    invoke-static {v1, v2, v6, v4, v0}, Lay0;->a(Lay0;ILai;Lm01;I)Lay0;

    .line 576
    .line 577
    .line 578
    move-result-object v0

    .line 579
    iget-object v1, v1, Lay0;->e:Lm01;

    .line 580
    .line 581
    invoke-virtual {v0, v1}, Lay0;->b(Lm01;)Lf11;

    .line 582
    .line 583
    .line 584
    move-result-object v4

    .line 585
    goto :goto_7

    .line 586
    :cond_10
    const-string v0, "Canceled"

    .line 587
    .line 588
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    :goto_7
    return-object v4

    .line 592
    :catchall_0
    move-exception v0

    .line 593
    monitor-exit v2

    .line 594
    throw v0

    .line 595
    :catch_5
    move-exception v0

    .line 596
    goto :goto_8

    .line 597
    :catch_6
    move-exception v0

    .line 598
    goto :goto_9

    .line 599
    :goto_8
    invoke-virtual {v3, v0}, Lp10;->b(Ljava/io/IOException;)V

    .line 600
    .line 601
    .line 602
    new-instance v1, Lz11;

    .line 603
    .line 604
    invoke-direct {v1, v0}, Lz11;-><init>(Ljava/io/IOException;)V

    .line 605
    .line 606
    .line 607
    throw v1

    .line 608
    :goto_9
    iget-object v1, v0, Lz11;->k:Ljava/io/IOException;

    .line 609
    .line 610
    invoke-virtual {v3, v1}, Lp10;->b(Ljava/io/IOException;)V

    .line 611
    .line 612
    .line 613
    throw v0

    .line 614
    :cond_11
    :try_start_a
    const-string v0, "Check failed."

    .line 615
    .line 616
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 617
    .line 618
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 619
    .line 620
    .line 621
    throw v1

    .line 622
    :catchall_1
    move-exception v0

    .line 623
    goto :goto_a

    .line 624
    :cond_12
    const-string v0, "Check failed."

    .line 625
    .line 626
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 627
    .line 628
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    throw v1

    .line 632
    :cond_13
    const-string v0, "released"

    .line 633
    .line 634
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 635
    .line 636
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 637
    .line 638
    .line 639
    throw v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 640
    :goto_a
    monitor-exit v2

    .line 641
    throw v0

    .line 642
    nop

    .line 643
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
