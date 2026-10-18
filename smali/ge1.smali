.class public abstract Lge1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lrs0;

.field public static final b:Lvk0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Lle1;

    .line 8
    .line 9
    invoke-direct {v0}, Lrs0;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lge1;->a:Lrs0;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/16 v1, 0x1c

    .line 16
    .line 17
    if-lt v0, v1, :cond_1

    .line 18
    .line 19
    new-instance v0, Lke1;

    .line 20
    .line 21
    invoke-direct {v0}, Lje1;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lge1;->a:Lrs0;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/16 v1, 0x1a

    .line 28
    .line 29
    if-lt v0, v1, :cond_2

    .line 30
    .line 31
    new-instance v0, Lje1;

    .line 32
    .line 33
    invoke-direct {v0}, Lje1;-><init>()V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lge1;->a:Lrs0;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    sget-object v0, Lie1;->h:Ljava/lang/reflect/Method;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    new-instance v0, Lie1;

    .line 44
    .line 45
    invoke-direct {v0}, Lrs0;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lge1;->a:Lrs0;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    new-instance v0, Lhe1;

    .line 52
    .line 53
    invoke-direct {v0}, Lrs0;-><init>()V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lge1;->a:Lrs0;

    .line 57
    .line 58
    :goto_0
    new-instance v0, Lvk0;

    .line 59
    .line 60
    const/16 v1, 0x10

    .line 61
    .line 62
    invoke-direct {v0, v1}, Lvk0;-><init>(I)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lge1;->b:Lvk0;

    .line 66
    .line 67
    return-void
.end method

.method public static a(Landroid/content/Context;Ls60;Landroid/content/res/Resources;ILjava/lang/String;IILk8;)Landroid/graphics/Typeface;
    .locals 10

    .line 1
    move/from16 v4, p6

    .line 2
    .line 3
    move-object/from16 v0, p7

    .line 4
    .line 5
    instance-of v1, p1, Lv60;

    .line 6
    .line 7
    const/16 v2, 0xf

    .line 8
    .line 9
    if-eqz v1, :cond_a

    .line 10
    .line 11
    check-cast p1, Lv60;

    .line 12
    .line 13
    iget-object v1, p1, Lv60;->d:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {v1, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 31
    .line 32
    invoke-static {v5, v3}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1, v5}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-nez v5, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    move-object v1, v6

    .line 46
    :goto_1
    if-eqz v1, :cond_2

    .line 47
    .line 48
    new-instance p0, Landroid/os/Handler;

    .line 49
    .line 50
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 55
    .line 56
    .line 57
    new-instance p1, Lo6;

    .line 58
    .line 59
    invoke-direct {p1, v0, v2, v1}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_2
    iget v1, p1, Lv60;->c:I

    .line 67
    .line 68
    const/4 v7, 0x1

    .line 69
    if-nez v1, :cond_3

    .line 70
    .line 71
    move v1, v7

    .line 72
    goto :goto_2

    .line 73
    :cond_3
    move v1, v3

    .line 74
    :goto_2
    iget v8, p1, Lv60;->b:I

    .line 75
    .line 76
    new-instance v2, Landroid/os/Handler;

    .line 77
    .line 78
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-direct {v2, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 83
    .line 84
    .line 85
    new-instance v5, Lny0;

    .line 86
    .line 87
    const/16 v9, 0xa

    .line 88
    .line 89
    invoke-direct {v5, v9}, Lny0;-><init>(I)V

    .line 90
    .line 91
    .line 92
    iput-object v0, v5, Lny0;->k:Ljava/lang/Object;

    .line 93
    .line 94
    iget-object p1, p1, Lv60;->a:Law;

    .line 95
    .line 96
    new-instance v9, Ls7;

    .line 97
    .line 98
    const/16 v0, 0x8

    .line 99
    .line 100
    invoke-direct {v9, v5, v2, v0, v3}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 101
    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    sget-object v0, Lq60;->a:Lvk0;

    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    iget-object v1, p1, Law;->o:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast v1, Ljava/lang/String;

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const-string v1, "-"

    .line 117
    .line 118
    invoke-static {v0, v1, v4}, Lx81;->j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    sget-object v0, Lq60;->a:Lvk0;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Lvk0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Landroid/graphics/Typeface;

    .line 129
    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    new-instance p0, Loi;

    .line 133
    .line 134
    invoke-direct {p0, v5, v0}, Loi;-><init>(Lny0;Landroid/graphics/Typeface;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 138
    .line 139
    .line 140
    :goto_3
    move-object v6, v0

    .line 141
    goto/16 :goto_8

    .line 142
    .line 143
    :cond_4
    const/4 v0, -0x1

    .line 144
    if-ne v8, v0, :cond_5

    .line 145
    .line 146
    invoke-static {v1, p0, p1, v4}, Lq60;->a(Ljava/lang/String;Landroid/content/Context;Law;I)Lp60;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {v9, p0}, Ls7;->E(Lp60;)V

    .line 151
    .line 152
    .line 153
    iget-object v6, p0, Lp60;->a:Landroid/graphics/Typeface;

    .line 154
    .line 155
    goto/16 :goto_8

    .line 156
    .line 157
    :cond_5
    new-instance v0, Ln60;

    .line 158
    .line 159
    const/4 v5, 0x0

    .line 160
    move-object v2, p0

    .line 161
    move-object v3, p1

    .line 162
    invoke-direct/range {v0 .. v5}, Ln60;-><init>(Ljava/lang/String;Landroid/content/Context;Law;II)V

    .line 163
    .line 164
    .line 165
    :try_start_0
    sget-object p0, Lq60;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 166
    .line 167
    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 168
    .line 169
    .line 170
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3

    .line 171
    int-to-long v0, v8

    .line 172
    :try_start_1
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 173
    .line 174
    invoke-interface {p0, v0, v1, p1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p0
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_2

    .line 178
    :try_start_2
    check-cast p0, Lp60;

    .line 179
    .line 180
    invoke-virtual {v9, p0}, Ls7;->E(Lp60;)V

    .line 181
    .line 182
    .line 183
    iget-object v6, p0, Lp60;->a:Landroid/graphics/Typeface;

    .line 184
    .line 185
    goto/16 :goto_8

    .line 186
    .line 187
    :catch_0
    move-exception v0

    .line 188
    move-object p0, v0

    .line 189
    goto :goto_4

    .line 190
    :catch_1
    move-exception v0

    .line 191
    move-object p0, v0

    .line 192
    goto :goto_5

    .line 193
    :catch_2
    new-instance p0, Ljava/lang/InterruptedException;

    .line 194
    .line 195
    const-string p1, "timeout"

    .line 196
    .line 197
    invoke-direct {p0, p1}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    throw p0

    .line 201
    :goto_4
    throw p0

    .line 202
    :goto_5
    new-instance p1, Ljava/lang/RuntimeException;

    .line 203
    .line 204
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    throw p1
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_3

    .line 208
    :catch_3
    iget-object p0, v9, Ls7;->l:Ljava/lang/Object;

    .line 209
    .line 210
    check-cast p0, Landroid/os/Handler;

    .line 211
    .line 212
    iget-object p1, v9, Ls7;->k:Ljava/lang/Object;

    .line 213
    .line 214
    check-cast p1, Lny0;

    .line 215
    .line 216
    new-instance v0, Lpi;

    .line 217
    .line 218
    const/4 v1, -0x3

    .line 219
    invoke-direct {v0, p1, v1}, Lpi;-><init>(Lny0;I)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 223
    .line 224
    .line 225
    goto/16 :goto_8

    .line 226
    .line 227
    :cond_6
    sget-object v0, Lq60;->a:Lvk0;

    .line 228
    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    iget-object v1, p1, Law;->o:Ljava/lang/Object;

    .line 232
    .line 233
    check-cast v1, Ljava/lang/String;

    .line 234
    .line 235
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    const-string v1, "-"

    .line 239
    .line 240
    invoke-static {v0, v1, v4}, Lx81;->j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    sget-object v0, Lq60;->a:Lvk0;

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Lvk0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Landroid/graphics/Typeface;

    .line 251
    .line 252
    if-eqz v0, :cond_7

    .line 253
    .line 254
    new-instance p0, Loi;

    .line 255
    .line 256
    invoke-direct {p0, v5, v0}, Loi;-><init>(Lny0;Landroid/graphics/Typeface;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 260
    .line 261
    .line 262
    goto :goto_3

    .line 263
    :cond_7
    new-instance v0, Lo60;

    .line 264
    .line 265
    invoke-direct {v0, v3, v9}, Lo60;-><init>(ILjava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    sget-object v3, Lq60;->c:Ljava/lang/Object;

    .line 269
    .line 270
    monitor-enter v3

    .line 271
    :try_start_3
    sget-object v2, Lq60;->d:Lu71;

    .line 272
    .line 273
    invoke-virtual {v2, v1, v6}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    check-cast v5, Ljava/util/ArrayList;

    .line 278
    .line 279
    if-eqz v5, :cond_8

    .line 280
    .line 281
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    monitor-exit v3

    .line 285
    goto :goto_8

    .line 286
    :catchall_0
    move-exception v0

    .line 287
    move-object p0, v0

    .line 288
    goto :goto_7

    .line 289
    :cond_8
    new-instance v5, Ljava/util/ArrayList;

    .line 290
    .line 291
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2, v1, v5}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 301
    new-instance v0, Ln60;

    .line 302
    .line 303
    const/4 v5, 0x1

    .line 304
    move-object v2, p0

    .line 305
    move-object v3, p1

    .line 306
    invoke-direct/range {v0 .. v5}, Ln60;-><init>(Ljava/lang/String;Landroid/content/Context;Law;II)V

    .line 307
    .line 308
    .line 309
    sget-object p0, Lq60;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 310
    .line 311
    new-instance p1, Lo60;

    .line 312
    .line 313
    invoke-direct {p1, v7, v1}, Lo60;-><init>(ILjava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    if-nez v1, :cond_9

    .line 321
    .line 322
    new-instance v1, Landroid/os/Handler;

    .line 323
    .line 324
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 329
    .line 330
    .line 331
    goto :goto_6

    .line 332
    :cond_9
    new-instance v1, Landroid/os/Handler;

    .line 333
    .line 334
    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 335
    .line 336
    .line 337
    :goto_6
    new-instance v2, Lq01;

    .line 338
    .line 339
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 340
    .line 341
    .line 342
    iput-object v0, v2, Lq01;->j:Ln60;

    .line 343
    .line 344
    iput-object p1, v2, Lq01;->k:Lo60;

    .line 345
    .line 346
    iput-object v1, v2, Lq01;->l:Landroid/os/Handler;

    .line 347
    .line 348
    invoke-virtual {p0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 349
    .line 350
    .line 351
    goto :goto_8

    .line 352
    :goto_7
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 353
    throw p0

    .line 354
    :cond_a
    sget-object v3, Lge1;->a:Lrs0;

    .line 355
    .line 356
    check-cast p1, Lt60;

    .line 357
    .line 358
    invoke-virtual {v3, p0, p1, p2, v4}, Lrs0;->c(Landroid/content/Context;Lt60;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    if-eqz v6, :cond_b

    .line 363
    .line 364
    new-instance p0, Landroid/os/Handler;

    .line 365
    .line 366
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 371
    .line 372
    .line 373
    new-instance p1, Lo6;

    .line 374
    .line 375
    invoke-direct {p1, v0, v2, v6}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 379
    .line 380
    .line 381
    goto :goto_8

    .line 382
    :cond_b
    invoke-virtual {v0}, Lk8;->a()V

    .line 383
    .line 384
    .line 385
    :goto_8
    if-eqz v6, :cond_c

    .line 386
    .line 387
    sget-object p0, Lge1;->b:Lvk0;

    .line 388
    .line 389
    invoke-static/range {p2 .. p6}, Lge1;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p0, p1, v6}, Lvk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    :cond_c
    return-object v6
.end method

.method public static b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x2d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method
