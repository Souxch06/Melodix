.class public final Lky1;
.super Lay1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:I

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:J

.field public final r:J

.field public final s:J

.field public t:Ljava/util/List;

.field public u:Ljava/lang/String;

.field public final v:Ljava/lang/String;

.field public w:I

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:J


# direct methods
.method public constructor <init>(Ly02;JJLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lay1;-><init>(Ly02;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lky1;->z:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lky1;->A:Ljava/lang/String;

    .line 10
    .line 11
    iput-wide p2, p0, Lky1;->r:J

    .line 12
    .line 13
    iput-wide p4, p0, Lky1;->s:J

    .line 14
    .line 15
    iput-object p6, p0, Lky1;->v:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final o()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final p(Ljava/lang/String;)Lbc2;
    .locals 48

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    new-instance v2, Lbc2;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    invoke-virtual {v1}, Lky1;->r()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    move-object v4, v3

    .line 14
    invoke-virtual {v1}, Lky1;->s()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v1}, Lay1;->m()V

    .line 19
    .line 20
    .line 21
    move-object v5, v4

    .line 22
    iget-object v4, v1, Lky1;->m:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1}, Lay1;->m()V

    .line 25
    .line 26
    .line 27
    iget v0, v1, Lky1;->n:I

    .line 28
    .line 29
    int-to-long v6, v0

    .line 30
    invoke-virtual {v1}, Lay1;->m()V

    .line 31
    .line 32
    .line 33
    iget-object v0, v1, Lky1;->o:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    move-object v8, v5

    .line 39
    move-wide v5, v6

    .line 40
    iget-object v7, v1, Lky1;->o:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 43
    .line 44
    move-object v9, v0

    .line 45
    check-cast v9, Ly02;

    .line 46
    .line 47
    iget-object v0, v9, Ly02;->m:Lmt1;

    .line 48
    .line 49
    iget-object v10, v9, Ly02;->o:Lzy1;

    .line 50
    .line 51
    iget-object v11, v9, Ly02;->m:Lmt1;

    .line 52
    .line 53
    iget-object v12, v9, Ly02;->j:Landroid/content/Context;

    .line 54
    .line 55
    iget-object v13, v9, Ly02;->r:Lcb2;

    .line 56
    .line 57
    iget-object v14, v9, Ly02;->n:Lvz1;

    .line 58
    .line 59
    invoke-virtual {v0}, Lmt1;->r()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Lay1;->m()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Lgx1;->l()V

    .line 66
    .line 67
    .line 68
    move-object v15, v2

    .line 69
    move-object/from16 v16, v3

    .line 70
    .line 71
    iget-wide v2, v1, Lky1;->q:J

    .line 72
    .line 73
    const-wide/16 v17, 0x0

    .line 74
    .line 75
    cmp-long v0, v2, v17

    .line 76
    .line 77
    move-wide/from16 v19, v2

    .line 78
    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    invoke-static {v13}, Ly02;->j(Let;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, v13, Let;->j:Ljava/lang/Object;

    .line 85
    .line 86
    move-object v3, v0

    .line 87
    check-cast v3, Ly02;

    .line 88
    .line 89
    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v13}, Let;->l()V

    .line 94
    .line 95
    .line 96
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 100
    .line 101
    .line 102
    move-result-object v19

    .line 103
    const/16 v21, 0x0

    .line 104
    .line 105
    invoke-static {}, Lcb2;->E()Ljava/security/MessageDigest;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const-wide/16 v22, -0x1

    .line 110
    .line 111
    if-nez v2, :cond_0

    .line 112
    .line 113
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 114
    .line 115
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 119
    .line 120
    const-string v2, "Could not get MD5 instance"

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Lso;->b(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    move-object/from16 v24, v4

    .line 126
    .line 127
    move-wide/from16 v25, v5

    .line 128
    .line 129
    :goto_0
    move-wide/from16 v2, v22

    .line 130
    .line 131
    goto/16 :goto_4

    .line 132
    .line 133
    :cond_0
    if-eqz v19, :cond_3

    .line 134
    .line 135
    :try_start_0
    invoke-virtual {v13, v12, v0}, Lcb2;->T(Landroid/content/Context;Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_2

    .line 140
    .line 141
    invoke-static {v12}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 142
    .line 143
    .line 144
    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 145
    move-object/from16 v24, v4

    .line 146
    .line 147
    :try_start_1
    iget-object v4, v3, Ly02;->j:Landroid/content/Context;

    .line 148
    .line 149
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 153
    move-wide/from16 v25, v5

    .line 154
    .line 155
    const/16 v5, 0x40

    .line 156
    .line 157
    :try_start_2
    invoke-virtual {v0, v5, v4}, Lb00;->b(ILjava/lang/String;)Landroid/content/pm/PackageInfo;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 162
    .line 163
    if-eqz v0, :cond_1

    .line 164
    .line 165
    array-length v4, v0

    .line 166
    if-lez v4, :cond_1

    .line 167
    .line 168
    aget-object v0, v0, v21

    .line 169
    .line 170
    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v2, v0}, Ljava/security/MessageDigest;->digest([B)[B

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Lcb2;->F([B)J

    .line 179
    .line 180
    .line 181
    move-result-wide v22

    .line 182
    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    .line 184
    goto :goto_2

    .line 185
    :cond_1
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 186
    .line 187
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, v0, Lzy1;->r:Lso;

    .line 191
    .line 192
    const-string v2, "Could not get signatures"

    .line 193
    .line 194
    invoke-virtual {v0, v2}, Lso;->b(Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :catch_1
    move-exception v0

    .line 199
    :goto_1
    move-wide/from16 v25, v5

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :catch_2
    move-exception v0

    .line 203
    move-object/from16 v24, v4

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_2
    move-object/from16 v24, v4

    .line 207
    .line 208
    move-wide/from16 v25, v5

    .line 209
    .line 210
    move-wide/from16 v22, v17

    .line 211
    .line 212
    goto :goto_0

    .line 213
    :goto_2
    iget-object v2, v3, Ly02;->o:Lzy1;

    .line 214
    .line 215
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 216
    .line 217
    .line 218
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 219
    .line 220
    const-string v3, "Package name not found"

    .line 221
    .line 222
    invoke-virtual {v2, v0, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    :goto_3
    move-wide/from16 v2, v17

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_3
    move-object/from16 v24, v4

    .line 229
    .line 230
    move-wide/from16 v25, v5

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :goto_4
    iput-wide v2, v1, Lky1;->q:J

    .line 234
    .line 235
    goto :goto_5

    .line 236
    :cond_4
    move-object/from16 v24, v4

    .line 237
    .line 238
    move-wide/from16 v25, v5

    .line 239
    .line 240
    const/16 v21, 0x0

    .line 241
    .line 242
    move-wide/from16 v2, v19

    .line 243
    .line 244
    :goto_5
    invoke-virtual {v9}, Ly02;->e()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 249
    .line 250
    .line 251
    iget-boolean v4, v14, Lvz1;->A:Z

    .line 252
    .line 253
    const/4 v5, 0x1

    .line 254
    xor-int/2addr v4, v5

    .line 255
    invoke-virtual {v1}, Lgx1;->l()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v9}, Ly02;->e()Z

    .line 259
    .line 260
    .line 261
    move-result v6

    .line 262
    const/4 v5, 0x0

    .line 263
    if-nez v6, :cond_5

    .line 264
    .line 265
    :goto_6
    move/from16 v23, v0

    .line 266
    .line 267
    move-object v12, v5

    .line 268
    goto/16 :goto_8

    .line 269
    .line 270
    :cond_5
    sget-object v6, Lgt1;->k:Lgt1;

    .line 271
    .line 272
    iget-object v6, v6, Lgt1;->j:Lva1;

    .line 273
    .line 274
    iget-object v6, v6, Lva1;->j:Ljava/lang/Object;

    .line 275
    .line 276
    check-cast v6, Lht1;

    .line 277
    .line 278
    sget-object v6, Lxx1;->H0:Lwx1;

    .line 279
    .line 280
    invoke-virtual {v11, v5, v6}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 281
    .line 282
    .line 283
    move-result v6

    .line 284
    if-eqz v6, :cond_6

    .line 285
    .line 286
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 287
    .line 288
    .line 289
    iget-object v6, v10, Lzy1;->w:Lso;

    .line 290
    .line 291
    const-string v10, "Disabled IID for tests."

    .line 292
    .line 293
    invoke-virtual {v6, v10}, Lso;->b(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    goto :goto_6

    .line 297
    :cond_6
    :try_start_3
    invoke-virtual {v12}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 298
    .line 299
    .line 300
    move-result-object v6

    .line 301
    const-string v5, "com.google.firebase.analytics.FirebaseAnalytics"

    .line 302
    .line 303
    invoke-virtual {v6, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 304
    .line 305
    .line 306
    move-result-object v5
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    .line 307
    if-nez v5, :cond_7

    .line 308
    .line 309
    :catch_3
    move/from16 v23, v0

    .line 310
    .line 311
    :goto_7
    const/4 v12, 0x0

    .line 312
    goto :goto_8

    .line 313
    :cond_7
    :try_start_4
    const-string v6, "getInstance"

    .line 314
    .line 315
    const-class v22, Landroid/content/Context;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 316
    .line 317
    move/from16 v23, v0

    .line 318
    .line 319
    :try_start_5
    filled-new-array/range {v22 .. v22}, [Ljava/lang/Class;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {v5, v6, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    filled-new-array {v12}, [Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    const/4 v12, 0x0

    .line 332
    invoke-virtual {v0, v12, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    .line 336
    if-nez v0, :cond_8

    .line 337
    .line 338
    goto :goto_8

    .line 339
    :cond_8
    :try_start_6
    const-string v6, "getFirebaseInstanceId"

    .line 340
    .line 341
    invoke-virtual {v5, v6, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 342
    .line 343
    .line 344
    move-result-object v5

    .line 345
    invoke-virtual {v5, v0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    check-cast v0, Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 350
    .line 351
    move-object v12, v0

    .line 352
    goto :goto_8

    .line 353
    :catch_4
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 354
    .line 355
    .line 356
    iget-object v0, v10, Lzy1;->t:Lso;

    .line 357
    .line 358
    const-string v5, "Failed to retrieve Firebase Instance Id"

    .line 359
    .line 360
    invoke-virtual {v0, v5}, Lso;->b(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    goto :goto_7

    .line 364
    :catch_5
    move/from16 v23, v0

    .line 365
    .line 366
    :catch_6
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 367
    .line 368
    .line 369
    iget-object v0, v10, Lzy1;->s:Lso;

    .line 370
    .line 371
    const-string v5, "Failed to obtain Firebase Analytics instance"

    .line 372
    .line 373
    invoke-virtual {v0, v5}, Lso;->b(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    goto :goto_7

    .line 377
    :goto_8
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 378
    .line 379
    .line 380
    iget-object v0, v14, Lvz1;->o:Lrz1;

    .line 381
    .line 382
    invoke-virtual {v0}, Lrz1;->a()J

    .line 383
    .line 384
    .line 385
    move-result-wide v5

    .line 386
    cmp-long v0, v5, v17

    .line 387
    .line 388
    move-wide/from16 v27, v2

    .line 389
    .line 390
    iget-wide v2, v9, Ly02;->M:J

    .line 391
    .line 392
    if-nez v0, :cond_9

    .line 393
    .line 394
    goto :goto_9

    .line 395
    :cond_9
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 396
    .line 397
    .line 398
    move-result-wide v2

    .line 399
    :goto_9
    invoke-virtual {v1}, Lay1;->m()V

    .line 400
    .line 401
    .line 402
    iget v0, v1, Lky1;->w:I

    .line 403
    .line 404
    const-string v5, "google_analytics_adid_collection_enabled"

    .line 405
    .line 406
    invoke-virtual {v11, v5}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 407
    .line 408
    .line 409
    move-result-object v5

    .line 410
    if-eqz v5, :cond_b

    .line 411
    .line 412
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 413
    .line 414
    .line 415
    move-result v5

    .line 416
    if-eqz v5, :cond_a

    .line 417
    .line 418
    goto :goto_a

    .line 419
    :cond_a
    move/from16 v5, v21

    .line 420
    .line 421
    goto :goto_b

    .line 422
    :cond_b
    :goto_a
    const/4 v5, 0x1

    .line 423
    :goto_b
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v14}, Let;->l()V

    .line 427
    .line 428
    .line 429
    invoke-virtual {v14}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 430
    .line 431
    .line 432
    move-result-object v6

    .line 433
    const-string v10, "deferred_analytics_collection"

    .line 434
    .line 435
    move-wide/from16 v29, v2

    .line 436
    .line 437
    move/from16 v2, v21

    .line 438
    .line 439
    invoke-interface {v6, v10, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 440
    .line 441
    .line 442
    move-result v3

    .line 443
    const-string v2, "google_analytics_default_allow_ad_personalization_signals"

    .line 444
    .line 445
    const/4 v6, 0x1

    .line 446
    invoke-virtual {v11, v2, v6}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    .line 447
    .line 448
    .line 449
    move-result-object v10

    .line 450
    sget-object v6, Lq22;->n:Lq22;

    .line 451
    .line 452
    if-eq v10, v6, :cond_c

    .line 453
    .line 454
    const/4 v6, 0x1

    .line 455
    goto :goto_c

    .line 456
    :cond_c
    const/4 v6, 0x0

    .line 457
    :goto_c
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 458
    .line 459
    .line 460
    move-result-object v6

    .line 461
    iget-object v10, v1, Lky1;->t:Ljava/util/List;

    .line 462
    .line 463
    invoke-virtual {v14}, Lvz1;->s()Lu22;

    .line 464
    .line 465
    .line 466
    move-result-object v22

    .line 467
    invoke-virtual/range {v22 .. v22}, Lu22;->g()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v22

    .line 471
    move/from16 v31, v0

    .line 472
    .line 473
    iget-object v0, v1, Lky1;->u:Ljava/lang/String;

    .line 474
    .line 475
    if-nez v0, :cond_d

    .line 476
    .line 477
    invoke-static {v13}, Ly02;->j(Let;)V

    .line 478
    .line 479
    .line 480
    invoke-virtual {v13}, Lcb2;->i0()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    iput-object v0, v1, Lky1;->u:Ljava/lang/String;

    .line 485
    .line 486
    :cond_d
    move-object/from16 v32, v0

    .line 487
    .line 488
    invoke-virtual {v14}, Lvz1;->s()Lu22;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    move/from16 v33, v3

    .line 493
    .line 494
    sget-object v3, Lt22;->l:Lt22;

    .line 495
    .line 496
    invoke-virtual {v0, v3}, Lu22;->i(Lt22;)Z

    .line 497
    .line 498
    .line 499
    move-result v0

    .line 500
    if-nez v0, :cond_e

    .line 501
    .line 502
    move/from16 v34, v4

    .line 503
    .line 504
    const/4 v0, 0x0

    .line 505
    goto :goto_e

    .line 506
    :cond_e
    invoke-virtual {v1}, Lgx1;->l()V

    .line 507
    .line 508
    .line 509
    move v0, v4

    .line 510
    iget-wide v3, v1, Lky1;->z:J

    .line 511
    .line 512
    cmp-long v3, v3, v17

    .line 513
    .line 514
    if-nez v3, :cond_f

    .line 515
    .line 516
    move/from16 v34, v0

    .line 517
    .line 518
    goto :goto_d

    .line 519
    :cond_f
    iget-object v3, v9, Ly02;->t:Lmz;

    .line 520
    .line 521
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 522
    .line 523
    .line 524
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 525
    .line 526
    .line 527
    move-result-wide v3

    .line 528
    move-wide/from16 v34, v3

    .line 529
    .line 530
    iget-wide v3, v1, Lky1;->z:J

    .line 531
    .line 532
    sub-long v3, v34, v3

    .line 533
    .line 534
    move/from16 v34, v0

    .line 535
    .line 536
    iget-object v0, v1, Lky1;->y:Ljava/lang/String;

    .line 537
    .line 538
    if-eqz v0, :cond_10

    .line 539
    .line 540
    const-wide/32 v35, 0x5265c00

    .line 541
    .line 542
    .line 543
    cmp-long v0, v3, v35

    .line 544
    .line 545
    if-lez v0, :cond_10

    .line 546
    .line 547
    iget-object v0, v1, Lky1;->A:Ljava/lang/String;

    .line 548
    .line 549
    if-nez v0, :cond_10

    .line 550
    .line 551
    invoke-virtual {v1}, Lky1;->q()V

    .line 552
    .line 553
    .line 554
    :cond_10
    :goto_d
    iget-object v0, v1, Lky1;->y:Ljava/lang/String;

    .line 555
    .line 556
    if-nez v0, :cond_11

    .line 557
    .line 558
    invoke-virtual {v1}, Lky1;->q()V

    .line 559
    .line 560
    .line 561
    :cond_11
    iget-object v0, v1, Lky1;->y:Ljava/lang/String;

    .line 562
    .line 563
    :goto_e
    const-string v3, "google_analytics_sgtm_upload_enabled"

    .line 564
    .line 565
    invoke-virtual {v11, v3}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 566
    .line 567
    .line 568
    move-result-object v3

    .line 569
    if-nez v3, :cond_12

    .line 570
    .line 571
    const/4 v3, 0x0

    .line 572
    goto :goto_f

    .line 573
    :cond_12
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 574
    .line 575
    .line 576
    move-result v3

    .line 577
    :goto_f
    invoke-static {v13}, Ly02;->j(Let;)V

    .line 578
    .line 579
    .line 580
    iget-object v4, v13, Let;->j:Ljava/lang/Object;

    .line 581
    .line 582
    check-cast v4, Ly02;

    .line 583
    .line 584
    move-object/from16 v35, v0

    .line 585
    .line 586
    invoke-virtual {v1}, Lky1;->r()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    move/from16 v36, v3

    .line 591
    .line 592
    iget-object v3, v4, Ly02;->j:Landroid/content/Context;

    .line 593
    .line 594
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 595
    .line 596
    .line 597
    move-result-object v3

    .line 598
    if-nez v3, :cond_13

    .line 599
    .line 600
    move/from16 v37, v5

    .line 601
    .line 602
    move-wide/from16 v3, v17

    .line 603
    .line 604
    const/4 v5, 0x0

    .line 605
    goto :goto_12

    .line 606
    :cond_13
    :try_start_7
    iget-object v3, v4, Ly02;->j:Landroid/content/Context;

    .line 607
    .line 608
    invoke-static {v3}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 609
    .line 610
    .line 611
    move-result-object v3

    .line 612
    iget-object v3, v3, Lb00;->a:Landroid/content/Context;

    .line 613
    .line 614
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 615
    .line 616
    .line 617
    move-result-object v3
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_7

    .line 618
    move/from16 v37, v5

    .line 619
    .line 620
    const/4 v5, 0x0

    .line 621
    :try_start_8
    invoke-virtual {v3, v0, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 622
    .line 623
    .line 624
    move-result-object v3

    .line 625
    if-eqz v3, :cond_14

    .line 626
    .line 627
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_8

    .line 628
    .line 629
    goto :goto_11

    .line 630
    :cond_14
    :goto_10
    move v0, v5

    .line 631
    goto :goto_11

    .line 632
    :catch_7
    move/from16 v37, v5

    .line 633
    .line 634
    const/4 v5, 0x0

    .line 635
    :catch_8
    iget-object v3, v4, Ly02;->o:Lzy1;

    .line 636
    .line 637
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 638
    .line 639
    .line 640
    iget-object v3, v3, Lzy1;->u:Lso;

    .line 641
    .line 642
    const-string v4, "PackageManager failed to find running app: app_id"

    .line 643
    .line 644
    invoke-virtual {v3, v0, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    goto :goto_10

    .line 648
    :goto_11
    int-to-long v3, v0

    .line 649
    :goto_12
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v14}, Lvz1;->s()Lu22;

    .line 653
    .line 654
    .line 655
    move-result-object v0

    .line 656
    iget v0, v0, Lu22;->b:I

    .line 657
    .line 658
    invoke-static {v14}, Ly02;->j(Let;)V

    .line 659
    .line 660
    .line 661
    invoke-virtual {v14}, Let;->l()V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v14}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 665
    .line 666
    .line 667
    move-result-object v14

    .line 668
    const-string v5, "dma_consent_settings"

    .line 669
    .line 670
    move/from16 v38, v0

    .line 671
    .line 672
    const/4 v0, 0x0

    .line 673
    invoke-interface {v14, v5, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 674
    .line 675
    .line 676
    move-result-object v5

    .line 677
    invoke-static {v5}, Lnu1;->b(Ljava/lang/String;)Lnu1;

    .line 678
    .line 679
    .line 680
    move-result-object v5

    .line 681
    iget-object v5, v5, Lnu1;->b:Ljava/lang/String;

    .line 682
    .line 683
    invoke-static {}, Lqs1;->a()V

    .line 684
    .line 685
    .line 686
    sget-object v14, Lxx1;->P0:Lwx1;

    .line 687
    .line 688
    invoke-virtual {v11, v0, v14}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 689
    .line 690
    .line 691
    move-result v39

    .line 692
    if-eqz v39, :cond_15

    .line 693
    .line 694
    invoke-static {v13}, Ly02;->j(Let;)V

    .line 695
    .line 696
    .line 697
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 698
    .line 699
    move-wide/from16 v39, v3

    .line 700
    .line 701
    const/16 v3, 0x1e

    .line 702
    .line 703
    if-lt v0, v3, :cond_16

    .line 704
    .line 705
    invoke-static {}, Lik1;->k()I

    .line 706
    .line 707
    .line 708
    move-result v0

    .line 709
    const/4 v3, 0x3

    .line 710
    if-le v0, v3, :cond_16

    .line 711
    .line 712
    invoke-static {}, Lf1;->q()I

    .line 713
    .line 714
    .line 715
    move-result v0

    .line 716
    goto :goto_13

    .line 717
    :cond_15
    move-wide/from16 v39, v3

    .line 718
    .line 719
    :cond_16
    const/4 v0, 0x0

    .line 720
    :goto_13
    invoke-static {}, Lqs1;->a()V

    .line 721
    .line 722
    .line 723
    const/4 v3, 0x0

    .line 724
    invoke-virtual {v11, v3, v14}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 725
    .line 726
    .line 727
    move-result v4

    .line 728
    if-eqz v4, :cond_17

    .line 729
    .line 730
    invoke-static {v13}, Ly02;->j(Let;)V

    .line 731
    .line 732
    .line 733
    invoke-virtual {v13}, Lcb2;->I()J

    .line 734
    .line 735
    .line 736
    move-result-wide v3

    .line 737
    goto :goto_14

    .line 738
    :cond_17
    move-wide/from16 v3, v17

    .line 739
    .line 740
    :goto_14
    iget-object v13, v11, Lmt1;->l:Ljava/lang/String;

    .line 741
    .line 742
    const/4 v14, 0x1

    .line 743
    invoke-virtual {v11, v2, v14}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    .line 744
    .line 745
    .line 746
    move-result-object v2

    .line 747
    invoke-static {v2}, Lu22;->h(Lq22;)C

    .line 748
    .line 749
    .line 750
    move-result v2

    .line 751
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move-result-object v2

    .line 755
    move-wide/from16 v41, v3

    .line 756
    .line 757
    move-object v4, v2

    .line 758
    iget-wide v2, v9, Ly02;->M:J

    .line 759
    .line 760
    iget-object v14, v9, Ly02;->D:Lj52;

    .line 761
    .line 762
    invoke-static {v14}, Ly02;->i(Lgx1;)V

    .line 763
    .line 764
    .line 765
    iget-object v14, v9, Ly02;->D:Lj52;

    .line 766
    .line 767
    invoke-virtual {v14}, Lj52;->q()I

    .line 768
    .line 769
    .line 770
    move-result v14

    .line 771
    invoke-static {v14}, Lx81;->g(I)I

    .line 772
    .line 773
    .line 774
    move-result v14

    .line 775
    move/from16 v19, v0

    .line 776
    .line 777
    sget-object v0, Lxx1;->e1:Lwx1;

    .line 778
    .line 779
    move-wide/from16 v43, v2

    .line 780
    .line 781
    const/4 v2, 0x0

    .line 782
    invoke-virtual {v11, v2, v0}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 783
    .line 784
    .line 785
    move-result v0

    .line 786
    if-eqz v0, :cond_18

    .line 787
    .line 788
    iget-wide v2, v9, Ly02;->N:J

    .line 789
    .line 790
    move-wide/from16 v17, v2

    .line 791
    .line 792
    :cond_18
    move-object v3, v8

    .line 793
    const-wide/32 v8, 0x274e8

    .line 794
    .line 795
    .line 796
    iget-wide v0, v1, Lky1;->r:J

    .line 797
    .line 798
    move-object/from16 v21, v6

    .line 799
    .line 800
    move-object v2, v15

    .line 801
    move/from16 v20, v33

    .line 802
    .line 803
    move-object v15, v12

    .line 804
    move/from16 v33, v19

    .line 805
    .line 806
    move/from16 v19, v37

    .line 807
    .line 808
    move-object/from16 v12, p1

    .line 809
    .line 810
    move-object/from16 v37, v4

    .line 811
    .line 812
    move-object/from16 v4, v24

    .line 813
    .line 814
    move-object/from16 v24, v10

    .line 815
    .line 816
    move-wide/from16 v10, v27

    .line 817
    .line 818
    move-object/from16 v27, v35

    .line 819
    .line 820
    move/from16 v28, v36

    .line 821
    .line 822
    move-object/from16 v36, v13

    .line 823
    .line 824
    move/from16 v13, v23

    .line 825
    .line 826
    move-wide/from16 v45, v0

    .line 827
    .line 828
    move-object v1, v3

    .line 829
    move-object/from16 v3, v16

    .line 830
    .line 831
    move-object/from16 v47, v32

    .line 832
    .line 833
    move-object/from16 v32, v5

    .line 834
    .line 835
    move-wide/from16 v5, v25

    .line 836
    .line 837
    move-object/from16 v26, v47

    .line 838
    .line 839
    move-object/from16 v25, v22

    .line 840
    .line 841
    move-wide/from16 v22, v45

    .line 842
    .line 843
    move-wide/from16 v45, v39

    .line 844
    .line 845
    move/from16 v40, v14

    .line 846
    .line 847
    move/from16 v14, v34

    .line 848
    .line 849
    move-wide/from16 v34, v41

    .line 850
    .line 851
    move-wide/from16 v41, v17

    .line 852
    .line 853
    move-wide/from16 v16, v29

    .line 854
    .line 855
    move/from16 v18, v31

    .line 856
    .line 857
    move/from16 v31, v38

    .line 858
    .line 859
    move-wide/from16 v29, v45

    .line 860
    .line 861
    move-wide/from16 v38, v43

    .line 862
    .line 863
    invoke-direct/range {v1 .. v42}, Lbc2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZZLjava/lang/String;JIZZLjava/lang/Boolean;JLjava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJILjava/lang/String;IJLjava/lang/String;Ljava/lang/String;JIJ)V

    .line 864
    .line 865
    .line 866
    move-object v3, v1

    .line 867
    return-object v3
.end method

.method public final q()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ly02;

    .line 7
    .line 8
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 9
    .line 10
    iget-object v2, v0, Ly02;->o:Lzy1;

    .line 11
    .line 12
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Lvz1;->s()Lu22;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v3, Lt22;->l:Lt22;

    .line 20
    .line 21
    invoke-virtual {v1, v3}, Lu22;->i(Lt22;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, v2, Lzy1;->v:Lso;

    .line 31
    .line 32
    const-string v3, "Analytics Storage consent is not granted"

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Lso;->b(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/16 v1, 0x10

    .line 40
    .line 41
    new-array v1, v1, [B

    .line 42
    .line 43
    iget-object v3, v0, Ly02;->r:Lcb2;

    .line 44
    .line 45
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Lcb2;->k0()Ljava/security/SecureRandom;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 53
    .line 54
    .line 55
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 56
    .line 57
    new-instance v4, Ljava/math/BigInteger;

    .line 58
    .line 59
    const/4 v5, 0x1

    .line 60
    invoke-direct {v4, v5, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 61
    .line 62
    .line 63
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v4, "%032x"

    .line 68
    .line 69
    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    :goto_0
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 74
    .line 75
    .line 76
    iget-object v2, v2, Lzy1;->v:Lso;

    .line 77
    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    const-string v3, "null"

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    const-string v3, "not null"

    .line 84
    .line 85
    :goto_1
    const-string v4, "Resetting session stitching token to "

    .line 86
    .line 87
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v2, v3}, Lso;->b(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iput-object v1, p0, Lky1;->y:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    iput-wide v0, p0, Lky1;->z:J

    .line 106
    .line 107
    return-void
.end method

.method public final r()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lay1;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lky1;->l:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lky1;->l:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final s()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lgx1;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lay1;->m()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lky1;->x:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lky1;->x:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method
