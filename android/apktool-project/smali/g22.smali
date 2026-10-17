.class public final synthetic Lg22;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lk22;

.field public final synthetic k:Lbc2;

.field public final synthetic l:Ljq1;


# direct methods
.method public synthetic constructor <init>(Lk22;Lbc2;Ljq1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg22;->j:Lk22;

    .line 5
    .line 6
    iput-object p2, p0, Lg22;->k:Lbc2;

    .line 7
    .line 8
    iput-object p3, p0, Lg22;->l:Ljq1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 38

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lg22;->j:Lk22;

    .line 4
    .line 5
    iget-object v1, v1, Lk22;->b:Lsa2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lsa2;->V()V

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lg22;->k:Lbc2;

    .line 11
    .line 12
    iget-object v2, v2, Lbc2;->j:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v3, v1, Lsa2;->N:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v4}, Ls02;->l()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Lsa2;->l0()V

    .line 27
    .line 28
    .line 29
    iget-object v5, v1, Lsa2;->l:Ldu1;

    .line 30
    .line 31
    invoke-static {v5}, Lsa2;->T(Laa2;)V

    .line 32
    .line 33
    .line 34
    iget-object v4, v0, Lg22;->l:Ljq1;

    .line 35
    .line 36
    iget-wide v7, v4, Ljq1;->j:J

    .line 37
    .line 38
    iget-wide v9, v4, Ljq1;->l:J

    .line 39
    .line 40
    invoke-virtual {v5}, Let;->l()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Laa2;->m()V

    .line 44
    .line 45
    .line 46
    const/4 v6, 0x4

    .line 47
    const/4 v11, 0x3

    .line 48
    const/4 v12, 0x1

    .line 49
    const/16 v20, 0x0

    .line 50
    .line 51
    :try_start_0
    invoke-virtual {v5}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 52
    .line 53
    .line 54
    move-result-object v21

    .line 55
    const-string v22, "upload_queue"

    .line 56
    .line 57
    const-string v23, "rowId"

    .line 58
    .line 59
    const-string v24, "app_id"

    .line 60
    .line 61
    const-string v25, "measurement_batch"

    .line 62
    .line 63
    const-string v26, "upload_uri"

    .line 64
    .line 65
    const-string v27, "upload_headers"

    .line 66
    .line 67
    const-string v28, "upload_type"

    .line 68
    .line 69
    const-string v29, "retry_count"

    .line 70
    .line 71
    const-string v30, "creation_timestamp"

    .line 72
    .line 73
    const-string v31, "associated_row_id"

    .line 74
    .line 75
    const-string v32, "last_upload_timestamp"

    .line 76
    .line 77
    filled-new-array/range {v23 .. v32}, [Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v23

    .line 81
    const-string v24, "rowId=?"

    .line 82
    .line 83
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    filled-new-array {v0}, [Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v25

    .line 91
    const-string v29, "1"

    .line 92
    .line 93
    const/16 v26, 0x0

    .line 94
    .line 95
    const/16 v27, 0x0

    .line 96
    .line 97
    const/16 v28, 0x0

    .line 98
    .line 99
    invoke-virtual/range {v21 .. v29}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 100
    .line 101
    .line 102
    move-result-object v13
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 103
    :try_start_1
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_0

    .line 108
    .line 109
    move-object/from16 v25, v1

    .line 110
    .line 111
    move/from16 v24, v6

    .line 112
    .line 113
    move-wide/from16 v22, v9

    .line 114
    .line 115
    move v1, v12

    .line 116
    goto/16 :goto_5

    .line 117
    .line 118
    :cond_0
    invoke-interface {v13, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    const/4 v14, 0x2

    .line 126
    invoke-interface {v13, v14}, Landroid/database/Cursor;->getBlob(I)[B

    .line 127
    .line 128
    .line 129
    move-result-object v14
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 130
    move-wide v15, v9

    .line 131
    :try_start_2
    invoke-interface {v13, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    move v9, v11

    .line 136
    invoke-interface {v13, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v11
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 140
    const/4 v6, 0x5

    .line 141
    :try_start_3
    invoke-interface {v13, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    const/4 v9, 0x6

    .line 146
    invoke-interface {v13, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 147
    .line 148
    .line 149
    move-result v9
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 150
    const/4 v12, 0x7

    .line 151
    :try_start_4
    invoke-interface {v13, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 152
    .line 153
    .line 154
    move-result-wide v21

    .line 155
    const/16 v12, 0x8

    .line 156
    .line 157
    invoke-interface {v13, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 158
    .line 159
    .line 160
    move-result-wide v23

    .line 161
    const/16 v12, 0x9

    .line 162
    .line 163
    invoke-interface {v13, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 164
    .line 165
    .line 166
    move-result-wide v25
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 167
    move v12, v6

    .line 168
    move-wide/from16 v18, v25

    .line 169
    .line 170
    move-object v6, v0

    .line 171
    move-object/from16 v25, v1

    .line 172
    .line 173
    const/4 v1, 0x1

    .line 174
    move-object/from16 v33, v13

    .line 175
    .line 176
    move v13, v9

    .line 177
    move-object v9, v14

    .line 178
    move-wide/from16 v34, v21

    .line 179
    .line 180
    move-object/from16 v21, v33

    .line 181
    .line 182
    move-wide/from16 v36, v23

    .line 183
    .line 184
    const/16 v24, 0x4

    .line 185
    .line 186
    move-wide/from16 v22, v15

    .line 187
    .line 188
    move-wide/from16 v14, v34

    .line 189
    .line 190
    move-wide/from16 v16, v36

    .line 191
    .line 192
    :try_start_5
    invoke-virtual/range {v5 .. v19}, Ldu1;->O(Ljava/lang/String;J[BLjava/lang/String;Ljava/lang/String;IIJJJ)Lua2;

    .line 193
    .line 194
    .line 195
    move-result-object v20
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 196
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    .line 197
    .line 198
    .line 199
    :cond_1
    :goto_0
    move-object/from16 v0, v20

    .line 200
    .line 201
    goto/16 :goto_6

    .line 202
    .line 203
    :catchall_0
    move-exception v0

    .line 204
    goto :goto_2

    .line 205
    :catch_0
    move-exception v0

    .line 206
    goto :goto_3

    .line 207
    :catchall_1
    move-exception v0

    .line 208
    move-object/from16 v21, v13

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :catch_1
    move-exception v0

    .line 212
    move-object/from16 v25, v1

    .line 213
    .line 214
    move-object/from16 v21, v13

    .line 215
    .line 216
    move-wide/from16 v22, v15

    .line 217
    .line 218
    const/4 v1, 0x1

    .line 219
    :goto_1
    const/16 v24, 0x4

    .line 220
    .line 221
    goto :goto_3

    .line 222
    :catch_2
    move-exception v0

    .line 223
    move-object/from16 v25, v1

    .line 224
    .line 225
    move v1, v12

    .line 226
    move-object/from16 v21, v13

    .line 227
    .line 228
    move-wide/from16 v22, v15

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :catch_3
    move-exception v0

    .line 232
    move-object/from16 v25, v1

    .line 233
    .line 234
    move/from16 v24, v6

    .line 235
    .line 236
    move v1, v12

    .line 237
    move-object/from16 v21, v13

    .line 238
    .line 239
    move-wide/from16 v22, v15

    .line 240
    .line 241
    goto :goto_3

    .line 242
    :catch_4
    move-exception v0

    .line 243
    move-object/from16 v25, v1

    .line 244
    .line 245
    move/from16 v24, v6

    .line 246
    .line 247
    move-wide/from16 v22, v9

    .line 248
    .line 249
    move v1, v12

    .line 250
    move-object/from16 v21, v13

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :goto_2
    move-object/from16 v20, v21

    .line 254
    .line 255
    goto/16 :goto_b

    .line 256
    .line 257
    :goto_3
    move-object/from16 v13, v21

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :catchall_2
    move-exception v0

    .line 261
    goto/16 :goto_b

    .line 262
    .line 263
    :catch_5
    move-exception v0

    .line 264
    move-object/from16 v25, v1

    .line 265
    .line 266
    move/from16 v24, v6

    .line 267
    .line 268
    move-wide/from16 v22, v9

    .line 269
    .line 270
    move v1, v12

    .line 271
    move-object/from16 v13, v20

    .line 272
    .line 273
    :goto_4
    :try_start_6
    iget-object v5, v5, Let;->j:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast v5, Ly02;

    .line 276
    .line 277
    iget-object v5, v5, Ly02;->o:Lzy1;

    .line 278
    .line 279
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 280
    .line 281
    .line 282
    iget-object v5, v5, Lzy1;->o:Lso;

    .line 283
    .line 284
    const-string v6, "Error to querying MeasurementBatch from upload_queue. rowId"

    .line 285
    .line 286
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 287
    .line 288
    .line 289
    move-result-object v9

    .line 290
    invoke-virtual {v5, v6, v9, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 291
    .line 292
    .line 293
    :goto_5
    if-eqz v13, :cond_1

    .line 294
    .line 295
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 296
    .line 297
    .line 298
    goto :goto_0

    .line 299
    :goto_6
    if-nez v0, :cond_2

    .line 300
    .line 301
    invoke-virtual/range {v25 .. v25}, Lsa2;->b()Lzy1;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    iget-object v0, v0, Lzy1;->r:Lso;

    .line 306
    .line 307
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    const-string v3, "[sgtm] Queued batch doesn\'t exist. appId, rowId"

    .line 312
    .line 313
    invoke-virtual {v0, v3, v2, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    goto/16 :goto_a

    .line 317
    .line 318
    :cond_2
    iget-object v0, v0, Lua2;->c:Ljava/lang/String;

    .line 319
    .line 320
    iget v5, v4, Ljq1;->k:I

    .line 321
    .line 322
    if-ne v5, v1, :cond_5

    .line 323
    .line 324
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v4

    .line 328
    if-eqz v4, :cond_3

    .line 329
    .line 330
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    :cond_3
    move-object/from16 v6, v25

    .line 334
    .line 335
    iget-object v0, v6, Lsa2;->l:Ldu1;

    .line 336
    .line 337
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 338
    .line 339
    .line 340
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    invoke-virtual {v0, v3}, Ldu1;->s(Ljava/lang/Long;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v6}, Lsa2;->b()Lzy1;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 352
    .line 353
    const-string v4, "[sgtm] queued batch deleted after successful client upload. appId, rowId"

    .line 354
    .line 355
    invoke-virtual {v0, v4, v2, v3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 356
    .line 357
    .line 358
    const-wide/16 v3, 0x0

    .line 359
    .line 360
    cmp-long v0, v22, v3

    .line 361
    .line 362
    if-lez v0, :cond_8

    .line 363
    .line 364
    iget-object v0, v6, Lsa2;->l:Ldu1;

    .line 365
    .line 366
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 367
    .line 368
    .line 369
    iget-object v3, v0, Let;->j:Ljava/lang/Object;

    .line 370
    .line 371
    check-cast v3, Ly02;

    .line 372
    .line 373
    invoke-virtual {v0}, Let;->l()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0}, Laa2;->m()V

    .line 377
    .line 378
    .line 379
    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    new-instance v5, Landroid/content/ContentValues;

    .line 384
    .line 385
    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 386
    .line 387
    .line 388
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    const-string v7, "upload_type"

    .line 393
    .line 394
    invoke-virtual {v5, v7, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 395
    .line 396
    .line 397
    iget-object v1, v3, Ly02;->t:Lmz;

    .line 398
    .line 399
    iget-object v3, v3, Ly02;->o:Lzy1;

    .line 400
    .line 401
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 402
    .line 403
    .line 404
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 405
    .line 406
    .line 407
    move-result-wide v7

    .line 408
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    const-string v7, "creation_timestamp"

    .line 413
    .line 414
    invoke-virtual {v5, v7, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 415
    .line 416
    .line 417
    :try_start_7
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    const-string v1, "upload_queue"

    .line 422
    .line 423
    const-string v7, "rowid=? AND app_id=? AND upload_type=?"

    .line 424
    .line 425
    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v8

    .line 429
    invoke-static/range {v24 .. v24}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v9

    .line 433
    filled-new-array {v8, v2, v9}, [Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v8

    .line 437
    invoke-virtual {v0, v1, v5, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    int-to-long v0, v0

    .line 442
    const-wide/16 v7, 0x1

    .line 443
    .line 444
    cmp-long v0, v0, v7

    .line 445
    .line 446
    if-eqz v0, :cond_4

    .line 447
    .line 448
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 449
    .line 450
    .line 451
    iget-object v0, v3, Lzy1;->r:Lso;

    .line 452
    .line 453
    const-string v1, "Google Signal pending batch not updated. appId, rowId"

    .line 454
    .line 455
    invoke-virtual {v0, v1, v2, v4}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_6

    .line 456
    .line 457
    .line 458
    goto :goto_7

    .line 459
    :catch_6
    move-exception v0

    .line 460
    goto :goto_8

    .line 461
    :cond_4
    :goto_7
    invoke-virtual {v6}, Lsa2;->b()Lzy1;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 466
    .line 467
    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 468
    .line 469
    .line 470
    move-result-object v1

    .line 471
    const-string v3, "[sgtm] queued Google Signal batch updated. appId, signalRowId"

    .line 472
    .line 473
    invoke-virtual {v0, v3, v2, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v6, v2}, Lsa2;->t(Ljava/lang/String;)V

    .line 477
    .line 478
    .line 479
    goto :goto_a

    .line 480
    :goto_8
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 481
    .line 482
    .line 483
    iget-object v1, v3, Lzy1;->o:Lso;

    .line 484
    .line 485
    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    const-string v4, "Failed to update google Signal pending batch. appid, rowId"

    .line 490
    .line 491
    invoke-virtual {v1, v4, v2, v3, v0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 492
    .line 493
    .line 494
    throw v0

    .line 495
    :cond_5
    move-object/from16 v6, v25

    .line 496
    .line 497
    const/4 v9, 0x3

    .line 498
    if-ne v5, v9, :cond_7

    .line 499
    .line 500
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    move-result-object v5

    .line 504
    check-cast v5, Lra2;

    .line 505
    .line 506
    if-nez v5, :cond_6

    .line 507
    .line 508
    new-instance v5, Lra2;

    .line 509
    .line 510
    invoke-direct {v5, v6}, Lra2;-><init>(Lsa2;)V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v3, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    goto :goto_9

    .line 517
    :cond_6
    iget v3, v5, Lra2;->b:I

    .line 518
    .line 519
    add-int/2addr v3, v1

    .line 520
    iput v3, v5, Lra2;->b:I

    .line 521
    .line 522
    invoke-virtual {v5}, Lra2;->a()J

    .line 523
    .line 524
    .line 525
    move-result-wide v7

    .line 526
    iput-wide v7, v5, Lra2;->c:J

    .line 527
    .line 528
    :goto_9
    invoke-virtual {v6}, Lsa2;->f()Lmz;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 533
    .line 534
    .line 535
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 536
    .line 537
    .line 538
    move-result-wide v7

    .line 539
    iget-wide v9, v5, Lra2;->c:J

    .line 540
    .line 541
    sub-long/2addr v9, v7

    .line 542
    invoke-virtual {v6}, Lsa2;->b()Lzy1;

    .line 543
    .line 544
    .line 545
    move-result-object v1

    .line 546
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 547
    .line 548
    const-wide/16 v7, 0x3e8

    .line 549
    .line 550
    div-long/2addr v9, v7

    .line 551
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 552
    .line 553
    .line 554
    move-result-object v3

    .line 555
    const-string v5, "[sgtm] Putting sGTM server in backoff mode. appId, destination, nextRetryInSeconds"

    .line 556
    .line 557
    invoke-virtual {v1, v5, v2, v0, v3}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 558
    .line 559
    .line 560
    :cond_7
    iget-object v0, v6, Lsa2;->l:Ldu1;

    .line 561
    .line 562
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 563
    .line 564
    .line 565
    iget-wide v3, v4, Ljq1;->j:J

    .line 566
    .line 567
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    invoke-virtual {v0, v1}, Ldu1;->x(Ljava/lang/Long;)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {v6}, Lsa2;->b()Lzy1;

    .line 575
    .line 576
    .line 577
    move-result-object v0

    .line 578
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 579
    .line 580
    const-string v3, "[sgtm] increased batch retry count after failed client upload. appId, rowId"

    .line 581
    .line 582
    invoke-virtual {v0, v3, v2, v1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 583
    .line 584
    .line 585
    :cond_8
    :goto_a
    return-void

    .line 586
    :catchall_3
    move-exception v0

    .line 587
    move-object/from16 v20, v13

    .line 588
    .line 589
    :goto_b
    if-eqz v20, :cond_9

    .line 590
    .line 591
    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    .line 592
    .line 593
    .line 594
    :cond_9
    throw v0
.end method
