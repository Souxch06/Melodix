.class public final Lhu1;
.super Lum1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Ljg;


# direct methods
.method public constructor <init>(Ljg;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lhu1;->a:Ljg;

    .line 2
    .line 3
    const/4 p1, 0x3

    .line 4
    invoke-direct {p0, p2, p1}, Lum1;-><init>(Landroid/os/Looper;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 1
    iget-object p0, p0, Lhu1;->a:Ljg;

    .line 2
    .line 3
    iget-object v0, p0, Ljg;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 10
    .line 11
    iget v2, p1, Landroid/os/Message;->what:I

    .line 12
    .line 13
    const/4 v3, 0x7

    .line 14
    const/4 v4, 0x2

    .line 15
    const/4 v5, 0x1

    .line 16
    const/4 v6, 0x0

    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    if-eq v2, v4, :cond_1

    .line 20
    .line 21
    if-eq v2, v5, :cond_1

    .line 22
    .line 23
    if-ne v2, v3, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Lwm1;

    .line 30
    .line 31
    if-eqz p0, :cond_1b

    .line 32
    .line 33
    monitor-enter p0

    .line 34
    :try_start_0
    iput-object v6, p0, Lwm1;->a:Ljava/lang/Boolean;

    .line 35
    .line 36
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 37
    iget-object p1, p0, Lwm1;->c:Ljg;

    .line 38
    .line 39
    iget-object v0, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 40
    .line 41
    monitor-enter v0

    .line 42
    :try_start_1
    iget-object p1, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw p0

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 54
    throw p1

    .line 55
    :cond_2
    const/4 v0, 0x4

    .line 56
    const/4 v1, 0x5

    .line 57
    if-eq v2, v5, :cond_4

    .line 58
    .line 59
    if-eq v2, v3, :cond_4

    .line 60
    .line 61
    if-ne v2, v0, :cond_3

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    if-ne v2, v1, :cond_5

    .line 65
    .line 66
    :cond_4
    :goto_1
    invoke-virtual {p0}, Ljg;->d()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_1a

    .line 71
    .line 72
    :cond_5
    iget v2, p1, Landroid/os/Message;->what:I

    .line 73
    .line 74
    const/16 v7, 0x8

    .line 75
    .line 76
    const/4 v8, 0x3

    .line 77
    if-ne v2, v0, :cond_b

    .line 78
    .line 79
    new-instance v0, Loo;

    .line 80
    .line 81
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 82
    .line 83
    invoke-direct {v0, p1, v6, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Ljg;->C:Loo;

    .line 87
    .line 88
    iget-boolean p1, p0, Ljg;->D:Z

    .line 89
    .line 90
    if-eqz p1, :cond_6

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    invoke-virtual {p0}, Ljg;->t()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_7

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_7
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_8

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_8
    :try_start_3
    invoke-virtual {p0}, Ljg;->t()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    .line 116
    .line 117
    .line 118
    iget-boolean p1, p0, Ljg;->D:Z

    .line 119
    .line 120
    if-eqz p1, :cond_9

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_9
    invoke-virtual {p0, v8, v6}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :catch_0
    :goto_2
    iget-object p1, p0, Ljg;->C:Loo;

    .line 128
    .line 129
    if-eqz p1, :cond_a

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_a
    new-instance p1, Loo;

    .line 133
    .line 134
    invoke-direct {p1, v7, v6, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :goto_3
    iget-object p0, p0, Ljg;->s:Lig;

    .line 138
    .line 139
    invoke-interface {p0, p1}, Lig;->b(Loo;)V

    .line 140
    .line 141
    .line 142
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_b
    if-ne v2, v1, :cond_d

    .line 147
    .line 148
    iget-object p1, p0, Ljg;->C:Loo;

    .line 149
    .line 150
    if-eqz p1, :cond_c

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_c
    new-instance p1, Loo;

    .line 154
    .line 155
    invoke-direct {p1, v7, v6, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :goto_4
    iget-object p0, p0, Ljg;->s:Lig;

    .line 159
    .line 160
    invoke-interface {p0, p1}, Lig;->b(Loo;)V

    .line 161
    .line 162
    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_d
    if-ne v2, v8, :cond_f

    .line 168
    .line 169
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 170
    .line 171
    instance-of v1, v0, Landroid/app/PendingIntent;

    .line 172
    .line 173
    if-eqz v1, :cond_e

    .line 174
    .line 175
    check-cast v0, Landroid/app/PendingIntent;

    .line 176
    .line 177
    goto :goto_5

    .line 178
    :cond_e
    move-object v0, v6

    .line 179
    :goto_5
    new-instance v1, Loo;

    .line 180
    .line 181
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 182
    .line 183
    invoke-direct {v1, p1, v0, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Ljg;->s:Lig;

    .line 187
    .line 188
    invoke-interface {p0, v1}, Lig;->b(Loo;)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_f
    const/4 v0, 0x6

    .line 196
    if-ne v2, v0, :cond_11

    .line 197
    .line 198
    invoke-virtual {p0, v1, v6}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Ljg;->x:Lgg;

    .line 202
    .line 203
    if-eqz v0, :cond_10

    .line 204
    .line 205
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 206
    .line 207
    invoke-interface {v0, p1}, Lgg;->a(I)V

    .line 208
    .line 209
    .line 210
    :cond_10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, v1, v5, v6}, Ljg;->w(IILandroid/os/IInterface;)Z

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_11
    if-ne v2, v4, :cond_13

    .line 218
    .line 219
    invoke-virtual {p0}, Ljg;->isConnected()Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-eqz p0, :cond_12

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_12
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast p0, Lwm1;

    .line 229
    .line 230
    if-eqz p0, :cond_1b

    .line 231
    .line 232
    monitor-enter p0

    .line 233
    :try_start_4
    iput-object v6, p0, Lwm1;->a:Ljava/lang/Boolean;

    .line 234
    .line 235
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 236
    iget-object p1, p0, Lwm1;->c:Ljg;

    .line 237
    .line 238
    iget-object v0, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 239
    .line 240
    monitor-enter v0

    .line 241
    :try_start_5
    iget-object p1, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 242
    .line 243
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    monitor-exit v0

    .line 247
    return-void

    .line 248
    :catchall_2
    move-exception p0

    .line 249
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 250
    throw p0

    .line 251
    :catchall_3
    move-exception p1

    .line 252
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 253
    throw p1

    .line 254
    :cond_13
    :goto_6
    iget p0, p1, Landroid/os/Message;->what:I

    .line 255
    .line 256
    if-eq p0, v4, :cond_15

    .line 257
    .line 258
    if-eq p0, v5, :cond_15

    .line 259
    .line 260
    if-ne p0, v3, :cond_14

    .line 261
    .line 262
    goto :goto_7

    .line 263
    :cond_14
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    add-int/lit8 p1, p1, 0x22

    .line 274
    .line 275
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 276
    .line 277
    .line 278
    const-string p1, "Don\'t know how to handle message: "

    .line 279
    .line 280
    invoke-static {v0, p1, p0}, Lx81;->j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    new-instance p1, Ljava/lang/Exception;

    .line 285
    .line 286
    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    .line 287
    .line 288
    .line 289
    const-string v0, "GmsClient"

    .line 290
    .line 291
    invoke-static {v0, p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_15
    :goto_7
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 296
    .line 297
    check-cast p0, Lwm1;

    .line 298
    .line 299
    monitor-enter p0

    .line 300
    :try_start_7
    iget-object p1, p0, Lwm1;->a:Ljava/lang/Boolean;

    .line 301
    .line 302
    iget-boolean v0, p0, Lwm1;->b:Z

    .line 303
    .line 304
    if-eqz v0, :cond_16

    .line 305
    .line 306
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    add-int/lit8 v0, v0, 0x2f

    .line 315
    .line 316
    new-instance v1, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 319
    .line 320
    .line 321
    goto :goto_8

    .line 322
    :catchall_4
    move-exception p1

    .line 323
    goto :goto_b

    .line 324
    :cond_16
    :goto_8
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 325
    if-eqz p1, :cond_19

    .line 326
    .line 327
    iget-object p1, p0, Lwm1;->f:Ljg;

    .line 328
    .line 329
    iget v0, p0, Lwm1;->d:I

    .line 330
    .line 331
    if-nez v0, :cond_17

    .line 332
    .line 333
    invoke-virtual {p0}, Lwm1;->a()Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    if-nez v0, :cond_19

    .line 338
    .line 339
    invoke-virtual {p1, v5, v6}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 340
    .line 341
    .line 342
    new-instance p1, Loo;

    .line 343
    .line 344
    invoke-direct {p1, v7, v6, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p0, p1}, Lwm1;->b(Loo;)V

    .line 348
    .line 349
    .line 350
    goto :goto_a

    .line 351
    :cond_17
    invoke-virtual {p1, v5, v6}, Ljg;->x(ILandroid/os/IInterface;)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p0, Lwm1;->e:Landroid/os/Bundle;

    .line 355
    .line 356
    if-eqz p1, :cond_18

    .line 357
    .line 358
    const-string v1, "pendingIntent"

    .line 359
    .line 360
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    check-cast p1, Landroid/app/PendingIntent;

    .line 365
    .line 366
    goto :goto_9

    .line 367
    :cond_18
    move-object p1, v6

    .line 368
    :goto_9
    new-instance v1, Loo;

    .line 369
    .line 370
    invoke-direct {v1, v0, p1, v6}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0, v1}, Lwm1;->b(Loo;)V

    .line 374
    .line 375
    .line 376
    :cond_19
    :goto_a
    monitor-enter p0

    .line 377
    :try_start_8
    iput-boolean v5, p0, Lwm1;->b:Z

    .line 378
    .line 379
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 380
    monitor-enter p0

    .line 381
    :try_start_9
    iput-object v6, p0, Lwm1;->a:Ljava/lang/Boolean;

    .line 382
    .line 383
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 384
    iget-object p1, p0, Lwm1;->c:Ljg;

    .line 385
    .line 386
    iget-object v0, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 387
    .line 388
    monitor-enter v0

    .line 389
    :try_start_a
    iget-object p1, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 390
    .line 391
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    monitor-exit v0

    .line 395
    return-void

    .line 396
    :catchall_5
    move-exception p0

    .line 397
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 398
    throw p0

    .line 399
    :catchall_6
    move-exception p1

    .line 400
    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 401
    throw p1

    .line 402
    :catchall_7
    move-exception p1

    .line 403
    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    .line 404
    throw p1

    .line 405
    :goto_b
    :try_start_d
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 406
    throw p1

    .line 407
    :cond_1a
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 408
    .line 409
    check-cast p0, Lwm1;

    .line 410
    .line 411
    if-eqz p0, :cond_1b

    .line 412
    .line 413
    monitor-enter p0

    .line 414
    :try_start_e
    iput-object v6, p0, Lwm1;->a:Ljava/lang/Boolean;

    .line 415
    .line 416
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 417
    iget-object p1, p0, Lwm1;->c:Ljg;

    .line 418
    .line 419
    iget-object v0, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 420
    .line 421
    monitor-enter v0

    .line 422
    :try_start_f
    iget-object p1, p1, Ljg;->u:Ljava/util/ArrayList;

    .line 423
    .line 424
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    monitor-exit v0

    .line 428
    return-void

    .line 429
    :catchall_8
    move-exception p0

    .line 430
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    .line 431
    throw p0

    .line 432
    :catchall_9
    move-exception p1

    .line 433
    :try_start_10
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    .line 434
    throw p1

    .line 435
    :cond_1b
    return-void
.end method
