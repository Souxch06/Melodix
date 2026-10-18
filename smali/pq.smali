.class public final Lpq;
.super Lih0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lpq;->k:I

    .line 2
    .line 3
    iput-object p1, p0, Lpq;->l:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lpq;->m:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-direct {p0, p1}, Lih0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lpq;->k:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    packed-switch v1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget-object v1, Lwe1;->a:Lwe1;

    .line 11
    .line 12
    move-object/from16 v4, p1

    .line 13
    .line 14
    check-cast v4, Ljava/lang/Throwable;

    .line 15
    .line 16
    iget-object v5, v0, Lpq;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v5, Ltu;

    .line 19
    .line 20
    invoke-virtual {v5, v4}, Ltu;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, v0, Lpq;->m:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ler0;

    .line 26
    .line 27
    iget-object v0, v0, Ler0;->m:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v5, v0

    .line 30
    check-cast v5, Lhh;

    .line 31
    .line 32
    const/4 v11, 0x0

    .line 33
    invoke-virtual {v5, v4, v11}, Lhh;->c(Ljava/lang/Throwable;Z)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    sget-object v0, Lsj;->b:Lrj;

    .line 40
    .line 41
    sget-object v6, Lja;->a:Lsun/misc/Unsafe;

    .line 42
    .line 43
    sget-wide v7, Lhh;->v:J

    .line 44
    .line 45
    invoke-virtual {v6, v5, v7, v8}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v7

    .line 49
    sget-wide v9, Lhh;->x:J

    .line 50
    .line 51
    invoke-virtual {v6, v5, v9, v10}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 52
    .line 53
    .line 54
    move-result-wide v9

    .line 55
    invoke-virtual {v5, v2, v9, v10}, Lhh;->s(ZJ)Z

    .line 56
    .line 57
    .line 58
    move-result v12

    .line 59
    if-eqz v12, :cond_1

    .line 60
    .line 61
    invoke-virtual {v5}, Lhh;->l()Ljava/lang/Throwable;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v6, Lqj;

    .line 66
    .line 67
    invoke-direct {v6, v0}, Lqj;-><init>(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    move-object v0, v6

    .line 71
    goto/16 :goto_3

    .line 72
    .line 73
    :cond_1
    const-wide v12, 0xfffffffffffffffL

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    and-long/2addr v9, v12

    .line 79
    cmp-long v7, v7, v9

    .line 80
    .line 81
    if-ltz v7, :cond_2

    .line 82
    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_2
    sget-object v10, Ljh;->k:Log0;

    .line 86
    .line 87
    sget-wide v7, Lhh;->u:J

    .line 88
    .line 89
    invoke-virtual {v6, v5, v7, v8}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    check-cast v6, Ltj;

    .line 94
    .line 95
    :cond_3
    :goto_1
    invoke-virtual {v5}, Lhh;->t()Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-eqz v7, :cond_4

    .line 100
    .line 101
    invoke-virtual {v5}, Lhh;->l()Ljava/lang/Throwable;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v6, Lqj;

    .line 106
    .line 107
    invoke-direct {v6, v0}, Lqj;-><init>(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    sget-object v7, Lhh;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 112
    .line 113
    invoke-virtual {v7, v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 114
    .line 115
    .line 116
    move-result-wide v8

    .line 117
    sget v7, Ljh;->b:I

    .line 118
    .line 119
    int-to-long v12, v7

    .line 120
    div-long v14, v8, v12

    .line 121
    .line 122
    rem-long v12, v8, v12

    .line 123
    .line 124
    long-to-int v7, v12

    .line 125
    iget-wide v12, v6, Lq31;->d:J

    .line 126
    .line 127
    cmp-long v12, v12, v14

    .line 128
    .line 129
    if-eqz v12, :cond_6

    .line 130
    .line 131
    invoke-virtual {v5, v14, v15, v6}, Lhh;->i(JLtj;)Ltj;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    if-nez v12, :cond_5

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_5
    move-object v6, v12

    .line 139
    :cond_6
    invoke-virtual/range {v5 .. v10}, Lhh;->D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v12

    .line 143
    sget-object v13, Ljh;->m:Log0;

    .line 144
    .line 145
    if-ne v12, v13, :cond_9

    .line 146
    .line 147
    instance-of v12, v10, Lui1;

    .line 148
    .line 149
    if-eqz v12, :cond_7

    .line 150
    .line 151
    check-cast v10, Lui1;

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_7
    move-object v10, v3

    .line 155
    :goto_2
    if-eqz v10, :cond_8

    .line 156
    .line 157
    invoke-interface {v10, v6, v7}, Lui1;->a(Lq31;I)V

    .line 158
    .line 159
    .line 160
    :cond_8
    invoke-virtual {v5, v8, v9}, Lhh;->G(J)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v6}, Lq31;->h()V

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    sget-object v7, Ljh;->o:Log0;

    .line 168
    .line 169
    if-ne v12, v7, :cond_a

    .line 170
    .line 171
    invoke-virtual {v5}, Lhh;->p()J

    .line 172
    .line 173
    .line 174
    move-result-wide v12

    .line 175
    cmp-long v7, v8, v12

    .line 176
    .line 177
    if-gez v7, :cond_3

    .line 178
    .line 179
    invoke-virtual {v6}, Lsm;->a()V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_a
    sget-object v0, Ljh;->n:Log0;

    .line 184
    .line 185
    if-eq v12, v0, :cond_b

    .line 186
    .line 187
    invoke-virtual {v6}, Lsm;->a()V

    .line 188
    .line 189
    .line 190
    move-object v0, v12

    .line 191
    goto :goto_3

    .line 192
    :cond_b
    const-string v0, "unexpected"

    .line 193
    .line 194
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    move-object v0, v3

    .line 198
    :goto_3
    instance-of v6, v0, Lrj;

    .line 199
    .line 200
    if-nez v6, :cond_c

    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_c
    move-object v0, v3

    .line 204
    :goto_4
    if-eqz v0, :cond_e

    .line 205
    .line 206
    check-cast v0, Lmn0;

    .line 207
    .line 208
    iget-object v0, v0, Lmn0;->b:Lnl;

    .line 209
    .line 210
    if-nez v4, :cond_d

    .line 211
    .line 212
    new-instance v6, Ljava/util/concurrent/CancellationException;

    .line 213
    .line 214
    const-string v7, "DataStore scope was cancelled before updateData could complete"

    .line 215
    .line 216
    invoke-direct {v6, v7}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_d
    move-object v6, v4

    .line 221
    :goto_5
    new-instance v7, Lql;

    .line 222
    .line 223
    invoke-direct {v7, v6, v11}, Lql;-><init>(Ljava/lang/Throwable;Z)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0, v7}, Lng0;->H(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-object v0, v1

    .line 230
    goto :goto_6

    .line 231
    :cond_e
    move-object v0, v3

    .line 232
    :goto_6
    if-nez v0, :cond_0

    .line 233
    .line 234
    return-object v1

    .line 235
    :pswitch_0
    sget-object v1, Lwe1;->a:Lwe1;

    .line 236
    .line 237
    move-object/from16 v2, p1

    .line 238
    .line 239
    check-cast v2, Ljava/lang/String;

    .line 240
    .line 241
    iget-object v4, v0, Lpq;->l:Ljava/lang/Object;

    .line 242
    .line 243
    check-cast v4, Ljava/io/File;

    .line 244
    .line 245
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v4

    .line 249
    invoke-static {v2, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_10

    .line 254
    .line 255
    iget-object v0, v0, Lpq;->m:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast v0, Lpv0;

    .line 258
    .line 259
    invoke-virtual {v0, v1}, Lpv0;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    instance-of v4, v2, Lrj;

    .line 264
    .line 265
    if-nez v4, :cond_f

    .line 266
    .line 267
    check-cast v2, Lwe1;

    .line 268
    .line 269
    goto :goto_7

    .line 270
    :cond_f
    new-instance v2, Loj;

    .line 271
    .line 272
    const/4 v4, 0x2

    .line 273
    invoke-direct {v2, v0, v3, v4}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 274
    .line 275
    .line 276
    invoke-static {v2}, Lkp1;->f(Lf90;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    check-cast v0, Lsj;

    .line 281
    .line 282
    iget-object v0, v0, Lsj;->a:Ljava/lang/Object;

    .line 283
    .line 284
    :cond_10
    :goto_7
    return-object v1

    .line 285
    :pswitch_1
    move-object/from16 v1, p1

    .line 286
    .line 287
    check-cast v1, Ljava/io/IOException;

    .line 288
    .line 289
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 290
    .line 291
    .line 292
    iget-object v1, v0, Lpq;->l:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v1, Lay;

    .line 295
    .line 296
    iget-object v0, v0, Lpq;->m:Ljava/lang/Object;

    .line 297
    .line 298
    check-cast v0, Lvx;

    .line 299
    .line 300
    monitor-enter v1

    .line 301
    :try_start_0
    invoke-virtual {v0}, Lvx;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    .line 303
    .line 304
    monitor-exit v1

    .line 305
    sget-object v0, Lwe1;->a:Lwe1;

    .line 306
    .line 307
    return-object v0

    .line 308
    :catchall_0
    move-exception v0

    .line 309
    monitor-exit v1

    .line 310
    throw v0

    .line 311
    :pswitch_2
    move-object/from16 v1, p1

    .line 312
    .line 313
    check-cast v1, Ljava/lang/Throwable;

    .line 314
    .line 315
    iget-object v4, v0, Lpq;->l:Ljava/lang/Object;

    .line 316
    .line 317
    check-cast v4, Lli;

    .line 318
    .line 319
    if-eqz v1, :cond_12

    .line 320
    .line 321
    instance-of v0, v1, Ljava/util/concurrent/CancellationException;

    .line 322
    .line 323
    if-eqz v0, :cond_11

    .line 324
    .line 325
    iput-boolean v2, v4, Lli;->d:Z

    .line 326
    .line 327
    iget-object v0, v4, Lli;->b:Lni;

    .line 328
    .line 329
    if-eqz v0, :cond_13

    .line 330
    .line 331
    iget-object v0, v0, Lni;->k:Lmi;

    .line 332
    .line 333
    invoke-virtual {v0, v2}, Lr0;->cancel(Z)Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    if-eqz v0, :cond_13

    .line 338
    .line 339
    iput-object v3, v4, Lli;->a:Ljava/lang/Object;

    .line 340
    .line 341
    iput-object v3, v4, Lli;->b:Lni;

    .line 342
    .line 343
    iput-object v3, v4, Lli;->c:Lu01;

    .line 344
    .line 345
    goto :goto_8

    .line 346
    :cond_11
    iput-boolean v2, v4, Lli;->d:Z

    .line 347
    .line 348
    iget-object v0, v4, Lli;->b:Lni;

    .line 349
    .line 350
    if-eqz v0, :cond_13

    .line 351
    .line 352
    iget-object v0, v0, Lni;->k:Lmi;

    .line 353
    .line 354
    invoke-virtual {v0, v1}, Lr0;->k(Ljava/lang/Throwable;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_13

    .line 359
    .line 360
    iput-object v3, v4, Lli;->a:Ljava/lang/Object;

    .line 361
    .line 362
    iput-object v3, v4, Lli;->b:Lni;

    .line 363
    .line 364
    iput-object v3, v4, Lli;->c:Lu01;

    .line 365
    .line 366
    goto :goto_8

    .line 367
    :cond_12
    iget-object v0, v0, Lpq;->m:Ljava/lang/Object;

    .line 368
    .line 369
    check-cast v0, Lmw;

    .line 370
    .line 371
    invoke-virtual {v0}, Lng0;->A()Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    instance-of v1, v0, Lee0;

    .line 376
    .line 377
    if-nez v1, :cond_15

    .line 378
    .line 379
    instance-of v1, v0, Lql;

    .line 380
    .line 381
    if-nez v1, :cond_14

    .line 382
    .line 383
    invoke-static {v0}, Lxg;->s(Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    iput-boolean v2, v4, Lli;->d:Z

    .line 388
    .line 389
    iget-object v1, v4, Lli;->b:Lni;

    .line 390
    .line 391
    if-eqz v1, :cond_13

    .line 392
    .line 393
    iget-object v1, v1, Lni;->k:Lmi;

    .line 394
    .line 395
    invoke-virtual {v1, v0}, Lr0;->j(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-eqz v0, :cond_13

    .line 400
    .line 401
    iput-object v3, v4, Lli;->a:Ljava/lang/Object;

    .line 402
    .line 403
    iput-object v3, v4, Lli;->b:Lni;

    .line 404
    .line 405
    iput-object v3, v4, Lli;->c:Lu01;

    .line 406
    .line 407
    :cond_13
    :goto_8
    sget-object v3, Lwe1;->a:Lwe1;

    .line 408
    .line 409
    goto :goto_9

    .line 410
    :cond_14
    check-cast v0, Lql;

    .line 411
    .line 412
    iget-object v0, v0, Lql;->a:Ljava/lang/Throwable;

    .line 413
    .line 414
    throw v0

    .line 415
    :cond_15
    const-string v0, "This job has not completed yet"

    .line 416
    .line 417
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    :goto_9
    return-object v3

    .line 421
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
