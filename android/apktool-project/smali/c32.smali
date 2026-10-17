.class public final Lc32;
.super Lfu1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lc52;


# direct methods
.method public constructor <init>(Lc52;Lo22;I)V
    .locals 0

    .line 1
    iput p3, p0, Lc32;->e:I

    .line 2
    .line 3
    packed-switch p3, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lc32;->f:Lc52;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lfu1;-><init>(Lo22;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lc32;->f:Lc52;

    .line 19
    .line 20
    invoke-direct {p0, p2}, Lfu1;-><init>(Lo22;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic constructor <init>(Lc52;Lo22;IZ)V
    .locals 0

    .line 25
    iput p3, p0, Lc32;->e:I

    iput-object p1, p0, Lc32;->f:Lc52;

    invoke-direct {p0, p2}, Lfu1;-><init>(Lo22;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lc32;->e:I

    .line 4
    .line 5
    iget-object v2, v0, Lc32;->f:Lc52;

    .line 6
    .line 7
    packed-switch v1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget-object v0, v2, Let;->j:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Ly02;

    .line 14
    .line 15
    iget-object v3, v1, Ly02;->n:Lvz1;

    .line 16
    .line 17
    iget-object v4, v1, Ly02;->o:Lzy1;

    .line 18
    .line 19
    iget-object v0, v1, Ly02;->p:Ls02;

    .line 20
    .line 21
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ls02;->l()V

    .line 25
    .line 26
    .line 27
    iget-object v6, v1, Ly02;->x:Li52;

    .line 28
    .line 29
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, v6, Let;->j:Ljava/lang/Object;

    .line 33
    .line 34
    move-object v5, v0

    .line 35
    check-cast v5, Ly02;

    .line 36
    .line 37
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lky1;->r()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    iget-object v0, v1, Ly02;->m:Lmt1;

    .line 49
    .line 50
    const-string v8, "google_analytics_adid_collection_enabled"

    .line 51
    .line 52
    invoke-virtual {v0, v8}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v12, 0x0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, v4, Lzy1;->w:Lso;

    .line 70
    .line 71
    const-string v1, "ADID collection is disabled from Manifest. Skipping"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto/16 :goto_11

    .line 77
    .line 78
    :cond_1
    :goto_0
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, v3, Let;->j:Ljava/lang/Object;

    .line 82
    .line 83
    move-object v8, v0

    .line 84
    check-cast v8, Ly02;

    .line 85
    .line 86
    invoke-virtual {v3}, Let;->l()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Lvz1;->s()Lu22;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v9, Lt22;->k:Lt22;

    .line 94
    .line 95
    invoke-virtual {v0, v9}, Lu22;->i(Lt22;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const-string v9, ""

    .line 100
    .line 101
    if-eqz v0, :cond_5

    .line 102
    .line 103
    iget-object v0, v8, Ly02;->t:Lmz;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 109
    .line 110
    .line 111
    move-result-wide v10

    .line 112
    iget-object v0, v3, Lvz1;->q:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v0, :cond_3

    .line 115
    .line 116
    iget-wide v13, v3, Lvz1;->s:J

    .line 117
    .line 118
    cmp-long v13, v10, v13

    .line 119
    .line 120
    if-ltz v13, :cond_2

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_2
    new-instance v8, Landroid/util/Pair;

    .line 124
    .line 125
    iget-boolean v9, v3, Lvz1;->r:Z

    .line 126
    .line 127
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    invoke-direct {v8, v0, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    goto :goto_5

    .line 135
    :cond_3
    :goto_1
    iget-object v0, v8, Ly02;->m:Lmt1;

    .line 136
    .line 137
    sget-object v13, Lxx1;->b:Lwx1;

    .line 138
    .line 139
    invoke-virtual {v0, v7, v13}, Lmt1;->t(Ljava/lang/String;Lwx1;)J

    .line 140
    .line 141
    .line 142
    move-result-wide v13

    .line 143
    add-long/2addr v13, v10

    .line 144
    iput-wide v13, v3, Lvz1;->s:J

    .line 145
    .line 146
    :try_start_0
    iget-object v0, v8, Ly02;->j:Landroid/content/Context;

    .line 147
    .line 148
    invoke-static {v0}, Lw3;->a(Landroid/content/Context;)Lv3;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v9, v3, Lvz1;->q:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v10, v0, Lv3;->b:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v10, :cond_4

    .line 157
    .line 158
    iput-object v10, v3, Lvz1;->q:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :catch_0
    move-exception v0

    .line 162
    goto :goto_3

    .line 163
    :cond_4
    :goto_2
    iget-boolean v0, v0, Lv3;->c:Z

    .line 164
    .line 165
    iput-boolean v0, v3, Lvz1;->r:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :goto_3
    iget-object v8, v8, Ly02;->o:Lzy1;

    .line 169
    .line 170
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 171
    .line 172
    .line 173
    iget-object v8, v8, Lzy1;->v:Lso;

    .line 174
    .line 175
    const-string v10, "Unable to get advertising id"

    .line 176
    .line 177
    invoke-virtual {v8, v0, v10}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iput-object v9, v3, Lvz1;->q:Ljava/lang/String;

    .line 181
    .line 182
    :goto_4
    new-instance v8, Landroid/util/Pair;

    .line 183
    .line 184
    iget-object v0, v3, Lvz1;->q:Ljava/lang/String;

    .line 185
    .line 186
    iget-boolean v9, v3, Lvz1;->r:Z

    .line 187
    .line 188
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    invoke-direct {v8, v0, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    goto :goto_5

    .line 196
    :cond_5
    new-instance v8, Landroid/util/Pair;

    .line 197
    .line 198
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 199
    .line 200
    invoke-direct {v8, v9, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    :goto_5
    iget-object v0, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast v0, Ljava/lang/Boolean;

    .line 206
    .line 207
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_16

    .line 212
    .line 213
    iget-object v0, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 214
    .line 215
    check-cast v0, Ljava/lang/CharSequence;

    .line 216
    .line 217
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_6

    .line 222
    .line 223
    goto/16 :goto_10

    .line 224
    .line 225
    :cond_6
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v6}, Lm22;->n()V

    .line 229
    .line 230
    .line 231
    iget-object v0, v5, Ly02;->j:Landroid/content/Context;

    .line 232
    .line 233
    const-string v9, "connectivity"

    .line 234
    .line 235
    invoke-virtual {v0, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 240
    .line 241
    const/4 v9, 0x0

    .line 242
    if-eqz v0, :cond_7

    .line 243
    .line 244
    :try_start_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 245
    .line 246
    .line 247
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 248
    goto :goto_6

    .line 249
    :catch_1
    :cond_7
    move-object v0, v9

    .line 250
    :goto_6
    if-eqz v0, :cond_15

    .line 251
    .line 252
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_15

    .line 257
    .line 258
    new-instance v10, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1}, Ly02;->n()Li82;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v0}, Lgx1;->l()V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Lay1;->m()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Li82;->s()Z

    .line 274
    .line 275
    .line 276
    move-result v11

    .line 277
    if-nez v11, :cond_8

    .line 278
    .line 279
    goto :goto_7

    .line 280
    :cond_8
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 281
    .line 282
    check-cast v0, Ly02;

    .line 283
    .line 284
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 285
    .line 286
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Lcb2;->W()I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    const v11, 0x392d8

    .line 294
    .line 295
    .line 296
    if-lt v0, v11, :cond_11

    .line 297
    .line 298
    :goto_7
    iget-object v0, v1, Ly02;->v:Lc52;

    .line 299
    .line 300
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 301
    .line 302
    .line 303
    iget-object v11, v0, Let;->j:Ljava/lang/Object;

    .line 304
    .line 305
    check-cast v11, Ly02;

    .line 306
    .line 307
    invoke-virtual {v0}, Lgx1;->l()V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v11}, Ly02;->n()Li82;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    iget-object v11, v0, Let;->j:Ljava/lang/Object;

    .line 315
    .line 316
    check-cast v11, Ly02;

    .line 317
    .line 318
    invoke-virtual {v0}, Lgx1;->l()V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0}, Lay1;->m()V

    .line 322
    .line 323
    .line 324
    iget-object v13, v0, Li82;->m:Lcy1;

    .line 325
    .line 326
    if-nez v13, :cond_9

    .line 327
    .line 328
    invoke-virtual {v0}, Li82;->r()V

    .line 329
    .line 330
    .line 331
    iget-object v0, v11, Ly02;->o:Lzy1;

    .line 332
    .line 333
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 334
    .line 335
    .line 336
    iget-object v0, v0, Lzy1;->v:Lso;

    .line 337
    .line 338
    const-string v11, "Failed to get consents; not connected to service yet."

    .line 339
    .line 340
    invoke-virtual {v0, v11}, Lso;->b(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    :goto_8
    move-object v13, v9

    .line 344
    goto :goto_9

    .line 345
    :cond_9
    invoke-virtual {v0, v12}, Li82;->B(Z)Lbc2;

    .line 346
    .line 347
    .line 348
    move-result-object v14

    .line 349
    :try_start_2
    invoke-interface {v13, v14}, Lcy1;->e(Lbc2;)Lrt1;

    .line 350
    .line 351
    .line 352
    move-result-object v13

    .line 353
    invoke-virtual {v0}, Li82;->y()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 354
    .line 355
    .line 356
    goto :goto_9

    .line 357
    :catch_2
    move-exception v0

    .line 358
    iget-object v11, v11, Ly02;->o:Lzy1;

    .line 359
    .line 360
    invoke-static {v11}, Ly02;->l(Lm22;)V

    .line 361
    .line 362
    .line 363
    iget-object v11, v11, Lzy1;->o:Lso;

    .line 364
    .line 365
    const-string v13, "Failed to get consents; remote exception"

    .line 366
    .line 367
    invoke-virtual {v11, v0, v13}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    goto :goto_8

    .line 371
    :goto_9
    if-eqz v13, :cond_a

    .line 372
    .line 373
    iget-object v0, v13, Lrt1;->j:Landroid/os/Bundle;

    .line 374
    .line 375
    goto :goto_a

    .line 376
    :cond_a
    move-object v0, v9

    .line 377
    :goto_a
    const/4 v11, 0x1

    .line 378
    if-nez v0, :cond_d

    .line 379
    .line 380
    iget v0, v1, Ly02;->K:I

    .line 381
    .line 382
    add-int/lit8 v3, v0, 0x1

    .line 383
    .line 384
    iput v3, v1, Ly02;->K:I

    .line 385
    .line 386
    const/16 v3, 0xa

    .line 387
    .line 388
    if-ge v0, v3, :cond_b

    .line 389
    .line 390
    move v12, v11

    .line 391
    :cond_b
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 392
    .line 393
    .line 394
    iget-object v4, v4, Lzy1;->v:Lso;

    .line 395
    .line 396
    new-instance v5, Ljava/lang/StringBuilder;

    .line 397
    .line 398
    const/16 v6, 0x45

    .line 399
    .line 400
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 401
    .line 402
    .line 403
    const-string v6, "Failed to retrieve DMA consent from the service, "

    .line 404
    .line 405
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    if-ge v0, v3, :cond_c

    .line 409
    .line 410
    const-string v0, "Retrying."

    .line 411
    .line 412
    goto :goto_b

    .line 413
    :cond_c
    const-string v0, "Skipping."

    .line 414
    .line 415
    :goto_b
    const-string v3, " retryCount"

    .line 416
    .line 417
    invoke-static {v5, v0, v3}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    iget v1, v1, Ly02;->K:I

    .line 422
    .line 423
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    invoke-virtual {v4, v1, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    goto/16 :goto_11

    .line 431
    .line 432
    :cond_d
    const/16 v13, 0x64

    .line 433
    .line 434
    invoke-static {v13, v0}, Lu22;->b(ILandroid/os/Bundle;)Lu22;

    .line 435
    .line 436
    .line 437
    move-result-object v14

    .line 438
    const-string v15, "&gcs="

    .line 439
    .line 440
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v14}, Lu22;->f()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v14

    .line 447
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    invoke-static {v13, v0}, Lnu1;->c(ILandroid/os/Bundle;)Lnu1;

    .line 451
    .line 452
    .line 453
    move-result-object v13

    .line 454
    iget-object v14, v13, Lnu1;->d:Ljava/lang/String;

    .line 455
    .line 456
    const-string v15, "&dma="

    .line 457
    .line 458
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    iget-object v13, v13, Lnu1;->c:Ljava/lang/Boolean;

    .line 462
    .line 463
    sget-object v15, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 464
    .line 465
    invoke-static {v13, v15}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v13

    .line 469
    xor-int/2addr v13, v11

    .line 470
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 474
    .line 475
    .line 476
    move-result v13

    .line 477
    if-nez v13, :cond_e

    .line 478
    .line 479
    const-string v13, "&dma_cps="

    .line 480
    .line 481
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    :cond_e
    const-string v13, "ad_personalization"

    .line 488
    .line 489
    invoke-virtual {v0, v13}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-static {v0}, Lu22;->d(Ljava/lang/String;)Lq22;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 498
    .line 499
    .line 500
    move-result v0

    .line 501
    const/4 v13, 0x2

    .line 502
    if-eq v0, v13, :cond_10

    .line 503
    .line 504
    const/4 v13, 0x3

    .line 505
    if-eq v0, v13, :cond_f

    .line 506
    .line 507
    move-object v15, v9

    .line 508
    goto :goto_c

    .line 509
    :cond_f
    sget-object v15, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 510
    .line 511
    :cond_10
    :goto_c
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 512
    .line 513
    invoke-static {v15, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 514
    .line 515
    .line 516
    move-result v0

    .line 517
    xor-int/2addr v0, v11

    .line 518
    const-string v11, "&npa="

    .line 519
    .line 520
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 527
    .line 528
    .line 529
    iget-object v0, v4, Lzy1;->w:Lso;

    .line 530
    .line 531
    const-string v4, "Consent query parameters to Bow"

    .line 532
    .line 533
    invoke-virtual {v0, v10, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 534
    .line 535
    .line 536
    :cond_11
    iget-object v0, v1, Ly02;->r:Lcb2;

    .line 537
    .line 538
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 539
    .line 540
    .line 541
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 542
    .line 543
    .line 544
    move-result-object v4

    .line 545
    iget-object v4, v4, Let;->j:Ljava/lang/Object;

    .line 546
    .line 547
    check-cast v4, Ly02;

    .line 548
    .line 549
    iget-object v4, v4, Ly02;->m:Lmt1;

    .line 550
    .line 551
    invoke-virtual {v4}, Lmt1;->r()V

    .line 552
    .line 553
    .line 554
    iget-object v4, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 555
    .line 556
    check-cast v4, Ljava/lang/String;

    .line 557
    .line 558
    iget-object v3, v3, Lvz1;->D:Lrz1;

    .line 559
    .line 560
    invoke-virtual {v3}, Lrz1;->a()J

    .line 561
    .line 562
    .line 563
    move-result-wide v13

    .line 564
    const-wide/16 v15, -0x1

    .line 565
    .line 566
    add-long/2addr v13, v15

    .line 567
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v3

    .line 571
    iget-object v8, v0, Let;->j:Ljava/lang/Object;

    .line 572
    .line 573
    check-cast v8, Ly02;

    .line 574
    .line 575
    const-string v10, "https://www.googleadservices.com/pagead/conversion/app/deeplink?id_type=adid&sdk_version="

    .line 576
    .line 577
    const-string v11, "v161000."

    .line 578
    .line 579
    :try_start_3
    invoke-static {v4}, Lbh;->e(Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    invoke-static {v7}, Lbh;->e(Ljava/lang/String;)V

    .line 583
    .line 584
    .line 585
    invoke-virtual {v0}, Lcb2;->W()I

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    new-instance v15, Ljava/lang/StringBuilder;

    .line 590
    .line 591
    invoke-direct {v15, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 592
    .line 593
    .line 594
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    new-instance v11, Ljava/lang/StringBuilder;

    .line 602
    .line 603
    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 604
    .line 605
    .line 606
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    const-string v0, "&rdid="

    .line 610
    .line 611
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    .line 613
    .line 614
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    .line 616
    .line 617
    const-string v0, "&bundleid="

    .line 618
    .line 619
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    .line 621
    .line 622
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 623
    .line 624
    .line 625
    const-string v0, "&retry="

    .line 626
    .line 627
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    .line 629
    .line 630
    invoke-virtual {v11, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 631
    .line 632
    .line 633
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v0

    .line 637
    iget-object v4, v8, Ly02;->m:Lmt1;

    .line 638
    .line 639
    const-string v10, "debug.deferred.deeplink"

    .line 640
    .line 641
    invoke-virtual {v4, v10}, Lmt1;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v4

    .line 645
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    move-result v4

    .line 649
    if-eqz v4, :cond_12

    .line 650
    .line 651
    const-string v4, "&ddl_test=1"

    .line 652
    .line 653
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    goto :goto_d

    .line 658
    :catch_3
    move-exception v0

    .line 659
    goto :goto_e

    .line 660
    :catch_4
    move-exception v0

    .line 661
    goto :goto_e

    .line 662
    :cond_12
    :goto_d
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 663
    .line 664
    .line 665
    move-result v4

    .line 666
    if-nez v4, :cond_14

    .line 667
    .line 668
    invoke-virtual {v3, v12}, Ljava/lang/String;->charAt(I)C

    .line 669
    .line 670
    .line 671
    move-result v4

    .line 672
    const/16 v10, 0x26

    .line 673
    .line 674
    if-eq v4, v10, :cond_13

    .line 675
    .line 676
    const-string v4, "&"

    .line 677
    .line 678
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 679
    .line 680
    .line 681
    move-result-object v0

    .line 682
    :cond_13
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    :cond_14
    new-instance v3, Ljava/net/URL;

    .line 687
    .line 688
    invoke-direct {v3, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    .line 689
    .line 690
    .line 691
    move-object v8, v3

    .line 692
    goto :goto_f

    .line 693
    :goto_e
    iget-object v3, v8, Ly02;->o:Lzy1;

    .line 694
    .line 695
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 696
    .line 697
    .line 698
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 699
    .line 700
    const-string v4, "Failed to create BOW URL for Deferred Deep Link. exception"

    .line 701
    .line 702
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 703
    .line 704
    .line 705
    move-result-object v0

    .line 706
    invoke-virtual {v3, v0, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 707
    .line 708
    .line 709
    move-object v8, v9

    .line 710
    :goto_f
    if-eqz v8, :cond_17

    .line 711
    .line 712
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 713
    .line 714
    .line 715
    new-instance v11, Lzz1;

    .line 716
    .line 717
    invoke-direct {v11, v1}, Lzz1;-><init>(Ly02;)V

    .line 718
    .line 719
    .line 720
    invoke-virtual {v6}, Lm22;->n()V

    .line 721
    .line 722
    .line 723
    iget-object v0, v5, Ly02;->p:Ls02;

    .line 724
    .line 725
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 726
    .line 727
    .line 728
    new-instance v5, Lh52;

    .line 729
    .line 730
    const/4 v9, 0x0

    .line 731
    const/4 v10, 0x0

    .line 732
    invoke-direct/range {v5 .. v11}, Lh52;-><init>(Li52;Ljava/lang/String;Ljava/net/URL;[BLjava/util/HashMap;Lf52;)V

    .line 733
    .line 734
    .line 735
    invoke-virtual {v0, v5}, Ls02;->x(Ljava/lang/Runnable;)V

    .line 736
    .line 737
    .line 738
    goto :goto_11

    .line 739
    :cond_15
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 740
    .line 741
    .line 742
    iget-object v0, v4, Lzy1;->r:Lso;

    .line 743
    .line 744
    const-string v1, "Network is not available for Deferred Deep Link request. Skipping"

    .line 745
    .line 746
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 747
    .line 748
    .line 749
    goto :goto_11

    .line 750
    :cond_16
    :goto_10
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 751
    .line 752
    .line 753
    iget-object v0, v4, Lzy1;->w:Lso;

    .line 754
    .line 755
    const-string v1, "ADID unavailable to retrieve Deferred Deep Link. Skipping"

    .line 756
    .line 757
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 758
    .line 759
    .line 760
    :cond_17
    :goto_11
    if-eqz v12, :cond_18

    .line 761
    .line 762
    iget-object v0, v2, Lc52;->B:Lc32;

    .line 763
    .line 764
    const-wide/16 v1, 0x7d0

    .line 765
    .line 766
    invoke-virtual {v0, v1, v2}, Lfu1;->b(J)V

    .line 767
    .line 768
    .line 769
    :cond_18
    return-void

    .line 770
    :pswitch_0
    invoke-virtual {v2}, Lc52;->r()V

    .line 771
    .line 772
    .line 773
    return-void

    .line 774
    :pswitch_1
    invoke-virtual {v2}, Lc52;->K()V

    .line 775
    .line 776
    .line 777
    return-void

    .line 778
    :pswitch_2
    new-instance v0, Ljava/lang/Thread;

    .line 779
    .line 780
    iget-object v1, v2, Let;->j:Ljava/lang/Object;

    .line 781
    .line 782
    check-cast v1, Ly02;

    .line 783
    .line 784
    iget-object v1, v1, Ly02;->v:Lc52;

    .line 785
    .line 786
    invoke-static {v1}, Ly02;->k(Lay1;)V

    .line 787
    .line 788
    .line 789
    new-instance v2, Lb32;

    .line 790
    .line 791
    invoke-direct {v2, v1}, Lb32;-><init>(Lc52;)V

    .line 792
    .line 793
    .line 794
    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 795
    .line 796
    .line 797
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 798
    .line 799
    .line 800
    return-void

    .line 801
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
