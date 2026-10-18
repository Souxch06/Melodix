.class public final synthetic Lc22;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lk22;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lv92;

.field public final synthetic m:Liy1;


# direct methods
.method public synthetic constructor <init>(Lk22;Ljava/lang/String;Lv92;Liy1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc22;->j:Lk22;

    .line 5
    .line 6
    iput-object p2, p0, Lc22;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lc22;->l:Lv92;

    .line 9
    .line 10
    iput-object p4, p0, Lc22;->m:Liy1;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lc22;->m:Liy1;

    .line 4
    .line 5
    iget-object v2, v0, Lc22;->j:Lk22;

    .line 6
    .line 7
    iget-object v2, v2, Lk22;->b:Lsa2;

    .line 8
    .line 9
    invoke-virtual {v2}, Lsa2;->V()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2}, Lsa2;->c()Ls02;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Ls02;->l()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Lsa2;->l0()V

    .line 20
    .line 21
    .line 22
    iget-object v3, v2, Lsa2;->l:Ldu1;

    .line 23
    .line 24
    invoke-static {v3}, Lsa2;->T(Laa2;)V

    .line 25
    .line 26
    .line 27
    sget-object v4, Lxx1;->B:Lwx1;

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-virtual {v4, v5}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iget-object v6, v0, Lc22;->k:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, v0, Lc22;->l:Lv92;

    .line 43
    .line 44
    invoke-virtual {v3, v6, v0, v4}, Ldu1;->q(Ljava/lang/String;Lv92;I)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v3, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_7

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lua2;

    .line 68
    .line 69
    iget-object v7, v4, Lua2;->c:Ljava/lang/String;

    .line 70
    .line 71
    iget-wide v8, v4, Lua2;->h:J

    .line 72
    .line 73
    iget-wide v10, v4, Lua2;->a:J

    .line 74
    .line 75
    invoke-virtual {v2, v6, v7}, Lsa2;->s(Ljava/lang/String;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    if-nez v7, :cond_0

    .line 80
    .line 81
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    iget-object v7, v7, Lzy1;->w:Lso;

    .line 86
    .line 87
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    iget-object v4, v4, Lua2;->c:Ljava/lang/String;

    .line 92
    .line 93
    const-string v9, "[sgtm] batch skipped due to destination in backoff. appId, rowId, url"

    .line 94
    .line 95
    invoke-virtual {v7, v9, v6, v8, v4}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    iget v7, v4, Lua2;->i:I

    .line 100
    .line 101
    if-gtz v7, :cond_1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_1
    sget-object v12, Lxx1;->z:Lwx1;

    .line 105
    .line 106
    invoke-virtual {v12, v5}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    check-cast v12, Ljava/lang/Integer;

    .line 111
    .line 112
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    if-le v7, v12, :cond_2

    .line 117
    .line 118
    goto/16 :goto_4

    .line 119
    .line 120
    :cond_2
    sget-object v12, Lxx1;->x:Lwx1;

    .line 121
    .line 122
    invoke-virtual {v12, v5}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v12

    .line 126
    check-cast v12, Ljava/lang/Long;

    .line 127
    .line 128
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    .line 129
    .line 130
    .line 131
    move-result-wide v12

    .line 132
    add-int/lit8 v7, v7, -0x1

    .line 133
    .line 134
    const-wide/16 v14, 0x1

    .line 135
    .line 136
    shl-long/2addr v14, v7

    .line 137
    mul-long/2addr v12, v14

    .line 138
    sget-object v7, Lxx1;->y:Lwx1;

    .line 139
    .line 140
    invoke-virtual {v7, v5}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Ljava/lang/Long;

    .line 145
    .line 146
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 147
    .line 148
    .line 149
    move-result-wide v14

    .line 150
    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->min(JJ)J

    .line 151
    .line 152
    .line 153
    move-result-wide v12

    .line 154
    invoke-virtual {v2}, Lsa2;->f()Lmz;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 162
    .line 163
    .line 164
    move-result-wide v14

    .line 165
    add-long/2addr v12, v8

    .line 166
    cmp-long v7, v14, v12

    .line 167
    .line 168
    if-ltz v7, :cond_6

    .line 169
    .line 170
    :goto_1
    new-instance v7, Landroid/os/Bundle;

    .line 171
    .line 172
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v8, v4, Lua2;->d:Ljava/util/HashMap;

    .line 176
    .line 177
    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 178
    .line 179
    .line 180
    move-result-object v8

    .line 181
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 182
    .line 183
    .line 184
    move-result-object v8

    .line 185
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 186
    .line 187
    .line 188
    move-result v9

    .line 189
    if-eqz v9, :cond_3

    .line 190
    .line 191
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v9

    .line 195
    check-cast v9, Ljava/util/Map$Entry;

    .line 196
    .line 197
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v10

    .line 201
    check-cast v10, Ljava/lang/String;

    .line 202
    .line 203
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    check-cast v9, Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v7, v10, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_3
    iget-wide v13, v4, Lua2;->a:J

    .line 214
    .line 215
    iget-object v8, v4, Lua2;->b:Lx02;

    .line 216
    .line 217
    iget-object v9, v4, Lua2;->c:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v10, v4, Lua2;->e:Ll52;

    .line 220
    .line 221
    iget-wide v11, v4, Lua2;->g:J

    .line 222
    .line 223
    move-wide/from16 v19, v11

    .line 224
    .line 225
    new-instance v12, Lt92;

    .line 226
    .line 227
    invoke-virtual {v8}, Lqo1;->a()[B

    .line 228
    .line 229
    .line 230
    move-result-object v15

    .line 231
    iget v4, v10, Ll52;->j:I

    .line 232
    .line 233
    const-string v21, ""

    .line 234
    .line 235
    move/from16 v18, v4

    .line 236
    .line 237
    move-object/from16 v17, v7

    .line 238
    .line 239
    move-object/from16 v16, v9

    .line 240
    .line 241
    invoke-direct/range {v12 .. v21}, Lt92;-><init>(J[BLjava/lang/String;Landroid/os/Bundle;IJLjava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :try_start_0
    invoke-static {}, Lx02;->y()Lt02;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    iget-object v7, v12, Lt92;->k:[B

    .line 249
    .line 250
    invoke-static {v4, v7}, Lva2;->W(Llp1;[B)Llp1;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    check-cast v4, Lt02;

    .line 255
    .line 256
    const/4 v7, 0x0

    .line 257
    :goto_3
    iget-object v8, v4, Llp1;->k:Lnp1;

    .line 258
    .line 259
    check-cast v8, Lx02;

    .line 260
    .line 261
    invoke-virtual {v8}, Lx02;->s()I

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    if-ge v7, v8, :cond_4

    .line 266
    .line 267
    iget-object v8, v4, Llp1;->k:Lnp1;

    .line 268
    .line 269
    check-cast v8, Lx02;

    .line 270
    .line 271
    invoke-virtual {v8, v7}, Lx02;->t(I)Lb12;

    .line 272
    .line 273
    .line 274
    move-result-object v8

    .line 275
    invoke-virtual {v8}, Lnp1;->i()Llp1;

    .line 276
    .line 277
    .line 278
    move-result-object v8

    .line 279
    check-cast v8, Lz02;

    .line 280
    .line 281
    invoke-virtual {v2}, Lsa2;->f()Lmz;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 286
    .line 287
    .line 288
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 289
    .line 290
    .line 291
    move-result-wide v9

    .line 292
    invoke-virtual {v8}, Llp1;->c()V

    .line 293
    .line 294
    .line 295
    iget-object v11, v8, Llp1;->k:Lnp1;

    .line 296
    .line 297
    check-cast v11, Lb12;

    .line 298
    .line 299
    invoke-virtual {v11, v9, v10}, Lb12;->h0(J)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v4}, Llp1;->c()V

    .line 303
    .line 304
    .line 305
    iget-object v9, v4, Llp1;->k:Lnp1;

    .line 306
    .line 307
    check-cast v9, Lx02;

    .line 308
    .line 309
    invoke-virtual {v8}, Llp1;->e()Lnp1;

    .line 310
    .line 311
    .line 312
    move-result-object v8

    .line 313
    check-cast v8, Lb12;

    .line 314
    .line 315
    invoke-virtual {v9, v7, v8}, Lx02;->A(ILb12;)V

    .line 316
    .line 317
    .line 318
    add-int/lit8 v7, v7, 0x1

    .line 319
    .line 320
    goto :goto_3

    .line 321
    :cond_4
    invoke-virtual {v4}, Llp1;->e()Lnp1;

    .line 322
    .line 323
    .line 324
    move-result-object v7

    .line 325
    check-cast v7, Lx02;

    .line 326
    .line 327
    invoke-virtual {v7}, Lqo1;->a()[B

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    iput-object v7, v12, Lt92;->k:[B

    .line 332
    .line 333
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    invoke-virtual {v7}, Lzy1;->r()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v7

    .line 341
    const/4 v8, 0x2

    .line 342
    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 343
    .line 344
    .line 345
    move-result v7

    .line 346
    if-eqz v7, :cond_5

    .line 347
    .line 348
    iget-object v7, v2, Lsa2;->p:Lva2;

    .line 349
    .line 350
    invoke-static {v7}, Lsa2;->T(Laa2;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v4}, Llp1;->e()Lnp1;

    .line 354
    .line 355
    .line 356
    move-result-object v4

    .line 357
    check-cast v4, Lx02;

    .line 358
    .line 359
    invoke-virtual {v7, v4}, Lva2;->M(Lx02;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v4

    .line 363
    iput-object v4, v12, Lt92;->p:Ljava/lang/String;
    :try_end_0
    .catch Laq1; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    .line 365
    :cond_5
    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    goto/16 :goto_0

    .line 369
    .line 370
    :catch_0
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 371
    .line 372
    .line 373
    move-result-object v4

    .line 374
    iget-object v4, v4, Lzy1;->r:Lso;

    .line 375
    .line 376
    const-string v7, "Failed to parse queued batch. appId"

    .line 377
    .line 378
    invoke-virtual {v4, v6, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    goto/16 :goto_0

    .line 382
    .line 383
    :cond_6
    :goto_4
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    iget-object v4, v4, Lzy1;->w:Lso;

    .line 388
    .line 389
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 390
    .line 391
    .line 392
    move-result-object v7

    .line 393
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 394
    .line 395
    .line 396
    move-result-object v8

    .line 397
    const-string v9, "[sgtm] batch skipped waiting for next retry. appId, rowId, lastUploadMillis"

    .line 398
    .line 399
    invoke-virtual {v4, v9, v6, v7, v8}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :cond_7
    new-instance v0, Ly92;

    .line 405
    .line 406
    invoke-direct {v0, v3}, Ly92;-><init>(Ljava/util/ArrayList;)V

    .line 407
    .line 408
    .line 409
    :try_start_1
    invoke-interface {v1, v0}, Liy1;->w(Ly92;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 417
    .line 418
    const-string v1, "[sgtm] Sending queued upload batches to client. appId, count"

    .line 419
    .line 420
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 425
    .line 426
    .line 427
    move-result-object v3

    .line 428
    invoke-virtual {v0, v1, v6, v3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 429
    .line 430
    .line 431
    goto :goto_5

    .line 432
    :catch_1
    move-exception v0

    .line 433
    invoke-virtual {v2}, Lsa2;->b()Lzy1;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 438
    .line 439
    const-string v2, "[sgtm] Failed to return upload batches for app"

    .line 440
    .line 441
    invoke-virtual {v1, v2, v6, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    :goto_5
    return-void
.end method
