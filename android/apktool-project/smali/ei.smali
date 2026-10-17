.class public final Lei;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lff0;


# instance fields
.field public final synthetic a:I

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lbi;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lei;->a:I

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lei;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmr0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lei;->a:I

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lei;->b:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method

.method public static d(Lf11;I)I
    .locals 1

    .line 1
    const-string v0, "Retry-After"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return p1

    .line 10
    :cond_0
    const-string p1, "\\d+"

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_1
    const p0, 0x7fffffff

    .line 42
    .line 43
    .line 44
    return p0
.end method


# virtual methods
.method public final a(Lay0;)Lf11;
    .locals 43

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    iget v0, v1, Lei;->a:I

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    iget-object v0, v2, Lay0;->e:Lm01;

    .line 12
    .line 13
    iget-object v7, v2, Lay0;->a:Lwx0;

    .line 14
    .line 15
    sget-object v8, Lu00;->j:Lu00;

    .line 16
    .line 17
    move-object v10, v5

    .line 18
    move-object v9, v8

    .line 19
    const/4 v11, 0x0

    .line 20
    move-object v8, v0

    .line 21
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    iget-object v12, v7, Lwx0;->r:Lai;

    .line 23
    .line 24
    if-nez v12, :cond_f

    .line 25
    .line 26
    monitor-enter v7

    .line 27
    :try_start_0
    iget-boolean v12, v7, Lwx0;->t:Z

    .line 28
    .line 29
    if-nez v12, :cond_e

    .line 30
    .line 31
    iget-boolean v12, v7, Lwx0;->s:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    .line 33
    if-nez v12, :cond_d

    .line 34
    .line 35
    monitor-exit v7

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    new-instance v0, Lp10;

    .line 39
    .line 40
    iget-object v12, v7, Lwx0;->l:Lxe0;

    .line 41
    .line 42
    iget-object v13, v8, Lm01;->a:Led0;

    .line 43
    .line 44
    iget-object v14, v7, Lwx0;->j:Lmr0;

    .line 45
    .line 46
    iget-boolean v15, v13, Led0;->i:Z

    .line 47
    .line 48
    if-eqz v15, :cond_1

    .line 49
    .line 50
    iget-object v15, v14, Lmr0;->q:Ljavax/net/ssl/SSLSocketFactory;

    .line 51
    .line 52
    if-eqz v15, :cond_0

    .line 53
    .line 54
    sget-object v16, Llr0;->a:Llr0;

    .line 55
    .line 56
    iget-object v4, v14, Lmr0;->t:Lij;

    .line 57
    .line 58
    move-object/from16 v23, v4

    .line 59
    .line 60
    move-object/from16 v21, v15

    .line 61
    .line 62
    move-object/from16 v22, v16

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_0
    const-string v0, "CLEARTEXT-only client"

    .line 66
    .line 67
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto/16 :goto_9

    .line 71
    .line 72
    :cond_1
    move-object/from16 v21, v5

    .line 73
    .line 74
    move-object/from16 v22, v21

    .line 75
    .line 76
    move-object/from16 v23, v22

    .line 77
    .line 78
    :goto_2
    new-instance v17, Lt3;

    .line 79
    .line 80
    iget-object v4, v13, Led0;->d:Ljava/lang/String;

    .line 81
    .line 82
    iget v13, v13, Led0;->e:I

    .line 83
    .line 84
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    iget-object v15, v14, Lmr0;->p:Ljavax/net/SocketFactory;

    .line 88
    .line 89
    iget-object v3, v14, Lmr0;->s:Ljava/util/List;

    .line 90
    .line 91
    iget-object v6, v14, Lmr0;->r:Ljava/util/List;

    .line 92
    .line 93
    iget-object v14, v14, Lmr0;->o:Ljava/net/ProxySelector;

    .line 94
    .line 95
    move-object/from16 v24, v3

    .line 96
    .line 97
    move-object/from16 v18, v4

    .line 98
    .line 99
    move-object/from16 v25, v6

    .line 100
    .line 101
    move/from16 v19, v13

    .line 102
    .line 103
    move-object/from16 v26, v14

    .line 104
    .line 105
    move-object/from16 v20, v15

    .line 106
    .line 107
    invoke-direct/range {v17 .. v26}, Lt3;-><init>(Ljava/lang/String;ILjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lij;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    .line 108
    .line 109
    .line 110
    move-object/from16 v3, v17

    .line 111
    .line 112
    invoke-direct {v0, v12, v3, v7}, Lp10;-><init>(Lxe0;Lt3;Lwx0;)V

    .line 113
    .line 114
    .line 115
    iput-object v0, v7, Lwx0;->p:Lp10;

    .line 116
    .line 117
    :cond_2
    :try_start_1
    iget-boolean v0, v7, Lwx0;->v:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    .line 119
    if-nez v0, :cond_c

    .line 120
    .line 121
    :try_start_2
    invoke-virtual {v2, v8}, Lay0;->b(Lm01;)Lf11;

    .line 122
    .line 123
    .line 124
    move-result-object v0
    :try_end_2
    .catch Lz11; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    if-eqz v10, :cond_3

    .line 126
    .line 127
    :try_start_3
    invoke-virtual {v0}, Lf11;->h()Le11;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v10}, Lf11;->h()Le11;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    iput-object v5, v3, Le11;->g:Lh11;

    .line 136
    .line 137
    invoke-virtual {v3}, Le11;->a()Lf11;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    iget-object v4, v3, Lf11;->p:Lh11;

    .line 142
    .line 143
    if-nez v4, :cond_4

    .line 144
    .line 145
    iput-object v3, v0, Le11;->j:Lf11;

    .line 146
    .line 147
    invoke-virtual {v0}, Le11;->a()Lf11;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    :cond_3
    move-object v10, v0

    .line 152
    goto :goto_3

    .line 153
    :catchall_0
    move-exception v0

    .line 154
    const/4 v3, 0x1

    .line 155
    goto/16 :goto_7

    .line 156
    .line 157
    :cond_4
    const-string v0, "priorResponse.body != null"

    .line 158
    .line 159
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 160
    .line 161
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw v1

    .line 165
    :goto_3
    iget-object v0, v7, Lwx0;->r:Lai;

    .line 166
    .line 167
    invoke-virtual {v1, v10, v0}, Lei;->b(Lf11;Lai;)Lm01;

    .line 168
    .line 169
    .line 170
    move-result-object v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 171
    if-nez v8, :cond_5

    .line 172
    .line 173
    const/4 v3, 0x0

    .line 174
    invoke-virtual {v7, v3}, Lwx0;->e(Z)V

    .line 175
    .line 176
    .line 177
    move-object v5, v10

    .line 178
    goto/16 :goto_9

    .line 179
    .line 180
    :cond_5
    :try_start_4
    iget-object v0, v10, Lf11;->p:Lh11;

    .line 181
    .line 182
    if-eqz v0, :cond_6

    .line 183
    .line 184
    invoke-static {v0}, Ljg1;->b(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 185
    .line 186
    .line 187
    :cond_6
    add-int/lit8 v11, v11, 0x1

    .line 188
    .line 189
    const/16 v3, 0x14

    .line 190
    .line 191
    if-gt v11, v3, :cond_7

    .line 192
    .line 193
    const/4 v3, 0x1

    .line 194
    invoke-virtual {v7, v3}, Lwx0;->e(Z)V

    .line 195
    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :cond_7
    :try_start_5
    new-instance v0, Ljava/net/ProtocolException;

    .line 200
    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    const-string v2, "Too many follow-up requests: "

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    throw v0

    .line 222
    :catch_0
    move-exception v0

    .line 223
    instance-of v3, v0, Lpo;

    .line 224
    .line 225
    const/4 v4, 0x1

    .line 226
    xor-int/2addr v3, v4

    .line 227
    invoke-virtual {v1, v0, v7, v8, v3}, Lei;->c(Ljava/io/IOException;Lwx0;Lm01;Z)Z

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    if-eqz v3, :cond_8

    .line 232
    .line 233
    new-instance v3, Ljava/util/ArrayList;

    .line 234
    .line 235
    invoke-interface {v9}, Ljava/util/Collection;->size()I

    .line 236
    .line 237
    .line 238
    move-result v6

    .line 239
    add-int/2addr v6, v4

    .line 240
    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 244
    .line 245
    .line 246
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 247
    .line 248
    .line 249
    invoke-virtual {v7, v4}, Lwx0;->e(Z)V

    .line 250
    .line 251
    .line 252
    :goto_4
    move-object v9, v3

    .line 253
    const/4 v0, 0x0

    .line 254
    goto/16 :goto_1

    .line 255
    .line 256
    :cond_8
    :try_start_6
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    if-eqz v2, :cond_9

    .line 265
    .line 266
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    check-cast v2, Ljava/lang/Exception;

    .line 271
    .line 272
    invoke-static {v0, v2}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 273
    .line 274
    .line 275
    goto :goto_5

    .line 276
    :cond_9
    throw v0

    .line 277
    :catch_1
    move-exception v0

    .line 278
    iget-object v3, v0, Lz11;->k:Ljava/io/IOException;

    .line 279
    .line 280
    const/4 v4, 0x0

    .line 281
    invoke-virtual {v1, v3, v7, v8, v4}, Lei;->c(Ljava/io/IOException;Lwx0;Lm01;Z)Z

    .line 282
    .line 283
    .line 284
    move-result v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 285
    iget-object v0, v0, Lz11;->j:Ljava/io/IOException;

    .line 286
    .line 287
    if-eqz v3, :cond_a

    .line 288
    .line 289
    :try_start_7
    new-instance v3, Ljava/util/ArrayList;

    .line 290
    .line 291
    invoke-interface {v9}, Ljava/util/Collection;->size()I

    .line 292
    .line 293
    .line 294
    move-result v4

    .line 295
    const/4 v6, 0x1

    .line 296
    add-int/2addr v4, v6

    .line 297
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 301
    .line 302
    .line 303
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 304
    .line 305
    .line 306
    invoke-virtual {v7, v6}, Lwx0;->e(Z)V

    .line 307
    .line 308
    .line 309
    goto :goto_4

    .line 310
    :cond_a
    :try_start_8
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    if-eqz v2, :cond_b

    .line 319
    .line 320
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    check-cast v2, Ljava/lang/Exception;

    .line 325
    .line 326
    invoke-static {v0, v2}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 327
    .line 328
    .line 329
    goto :goto_6

    .line 330
    :cond_b
    throw v0

    .line 331
    :cond_c
    new-instance v0, Ljava/io/IOException;

    .line 332
    .line 333
    const-string v1, "Canceled"

    .line 334
    .line 335
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 339
    :goto_7
    invoke-virtual {v7, v3}, Lwx0;->e(Z)V

    .line 340
    .line 341
    .line 342
    throw v0

    .line 343
    :cond_d
    :try_start_9
    const-string v0, "Check failed."

    .line 344
    .line 345
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 346
    .line 347
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    throw v1

    .line 351
    :catchall_1
    move-exception v0

    .line 352
    goto :goto_8

    .line 353
    :cond_e
    const-string v0, "cannot make a new request because the previous response is still open: please call response.close()"

    .line 354
    .line 355
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 356
    .line 357
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 361
    :goto_8
    monitor-exit v7

    .line 362
    throw v0

    .line 363
    :cond_f
    const-string v0, "Check failed."

    .line 364
    .line 365
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    :goto_9
    return-object v5

    .line 369
    :pswitch_0
    iget-object v0, v1, Lei;->b:Ljava/lang/Object;

    .line 370
    .line 371
    check-cast v0, Lbi;

    .line 372
    .line 373
    if-eqz v0, :cond_17

    .line 374
    .line 375
    iget-object v3, v2, Lay0;->e:Lm01;

    .line 376
    .line 377
    iget-object v4, v3, Lm01;->a:Led0;

    .line 378
    .line 379
    invoke-static {v4}, Lbe2;->r(Led0;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v6

    .line 383
    :try_start_a
    iget-object v0, v0, Lbi;->j:Lay;

    .line 384
    .line 385
    invoke-virtual {v0, v6}, Lay;->j(Ljava/lang/String;)Lyx;

    .line 386
    .line 387
    .line 388
    move-result-object v0
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2

    .line 389
    if-nez v0, :cond_10

    .line 390
    .line 391
    move-object v0, v5

    .line 392
    goto/16 :goto_b

    .line 393
    .line 394
    :cond_10
    :try_start_b
    new-instance v6, Lyh;

    .line 395
    .line 396
    iget-object v7, v0, Lyx;->l:Ljava/util/ArrayList;

    .line 397
    .line 398
    const/4 v8, 0x0

    .line 399
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v7

    .line 403
    check-cast v7, Lp81;

    .line 404
    .line 405
    invoke-direct {v6, v7}, Lyh;-><init>(Lp81;)V

    .line 406
    .line 407
    .line 408
    iget-object v7, v6, Lyh;->b:Lsb0;

    .line 409
    .line 410
    iget-object v8, v6, Lyh;->c:Ljava/lang/String;

    .line 411
    .line 412
    iget-object v9, v6, Lyh;->a:Led0;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    .line 413
    .line 414
    iget-object v10, v6, Lyh;->g:Lsb0;

    .line 415
    .line 416
    const-string v11, "Content-Type"

    .line 417
    .line 418
    invoke-virtual {v10, v11}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v11

    .line 422
    const-string v12, "Content-Length"

    .line 423
    .line 424
    invoke-virtual {v10, v12}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v12

    .line 428
    new-instance v13, Ler0;

    .line 429
    .line 430
    const/16 v14, 0xa

    .line 431
    .line 432
    invoke-direct {v13, v14}, Ler0;-><init>(I)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 436
    .line 437
    .line 438
    iput-object v9, v13, Ler0;->k:Ljava/lang/Object;

    .line 439
    .line 440
    invoke-virtual {v13, v8, v5}, Ler0;->o(Ljava/lang/String;Lkp1;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v7}, Lsb0;->d()Lrb0;

    .line 447
    .line 448
    .line 449
    move-result-object v14

    .line 450
    iput-object v14, v13, Ler0;->m:Ljava/lang/Object;

    .line 451
    .line 452
    invoke-virtual {v13}, Ler0;->c()Lm01;

    .line 453
    .line 454
    .line 455
    move-result-object v28

    .line 456
    new-instance v13, Ljava/util/ArrayList;

    .line 457
    .line 458
    const/16 v14, 0x14

    .line 459
    .line 460
    invoke-direct {v13, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 461
    .line 462
    .line 463
    iget-object v13, v6, Lyh;->d:Liw0;

    .line 464
    .line 465
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 466
    .line 467
    .line 468
    iget v14, v6, Lyh;->e:I

    .line 469
    .line 470
    iget-object v15, v6, Lyh;->f:Ljava/lang/String;

    .line 471
    .line 472
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v10}, Lsb0;->d()Lrb0;

    .line 476
    .line 477
    .line 478
    move-result-object v10

    .line 479
    new-instance v5, Lxh;

    .line 480
    .line 481
    invoke-direct {v5, v0, v11, v12}, Lxh;-><init>(Lyx;Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    iget-object v0, v6, Lyh;->h:Lnb0;

    .line 485
    .line 486
    iget-wide v11, v6, Lyh;->i:J

    .line 487
    .line 488
    move-object/from16 v34, v5

    .line 489
    .line 490
    iget-wide v5, v6, Lyh;->j:J

    .line 491
    .line 492
    if-ltz v14, :cond_15

    .line 493
    .line 494
    invoke-virtual {v10}, Lrb0;->c()Lsb0;

    .line 495
    .line 496
    .line 497
    move-result-object v33

    .line 498
    new-instance v27, Lf11;

    .line 499
    .line 500
    const/16 v35, 0x0

    .line 501
    .line 502
    const/16 v36, 0x0

    .line 503
    .line 504
    const/16 v37, 0x0

    .line 505
    .line 506
    const/16 v42, 0x0

    .line 507
    .line 508
    move-object/from16 v32, v0

    .line 509
    .line 510
    move-wide/from16 v40, v5

    .line 511
    .line 512
    move-wide/from16 v38, v11

    .line 513
    .line 514
    move-object/from16 v29, v13

    .line 515
    .line 516
    move/from16 v31, v14

    .line 517
    .line 518
    move-object/from16 v30, v15

    .line 519
    .line 520
    invoke-direct/range {v27 .. v42}, Lf11;-><init>(Lm01;Liw0;Ljava/lang/String;ILnb0;Lsb0;Lh11;Lf11;Lf11;Lf11;JJLai;)V

    .line 521
    .line 522
    .line 523
    move-object/from16 v0, v27

    .line 524
    .line 525
    invoke-virtual {v9, v4}, Led0;->equals(Ljava/lang/Object;)Z

    .line 526
    .line 527
    .line 528
    move-result v4

    .line 529
    if-eqz v4, :cond_13

    .line 530
    .line 531
    iget-object v4, v3, Lm01;->b:Ljava/lang/String;

    .line 532
    .line 533
    invoke-virtual {v8, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    move-result v4

    .line 537
    if-eqz v4, :cond_13

    .line 538
    .line 539
    invoke-static/range {v33 .. v33}, Lbe2;->w(Lsb0;)Ljava/util/Set;

    .line 540
    .line 541
    .line 542
    move-result-object v4

    .line 543
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 544
    .line 545
    .line 546
    move-result v5

    .line 547
    if-eqz v5, :cond_11

    .line 548
    .line 549
    goto :goto_b

    .line 550
    :cond_11
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 551
    .line 552
    .line 553
    move-result-object v4

    .line 554
    :cond_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 555
    .line 556
    .line 557
    move-result v5

    .line 558
    if-eqz v5, :cond_16

    .line 559
    .line 560
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object v5

    .line 564
    check-cast v5, Ljava/lang/String;

    .line 565
    .line 566
    invoke-virtual {v7, v5}, Lsb0;->f(Ljava/lang/String;)Ljava/util/List;

    .line 567
    .line 568
    .line 569
    move-result-object v6

    .line 570
    iget-object v8, v3, Lm01;->c:Lsb0;

    .line 571
    .line 572
    invoke-virtual {v8, v5}, Lsb0;->f(Ljava/lang/String;)Ljava/util/List;

    .line 573
    .line 574
    .line 575
    move-result-object v5

    .line 576
    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 577
    .line 578
    .line 579
    move-result v5

    .line 580
    if-nez v5, :cond_12

    .line 581
    .line 582
    :cond_13
    iget-object v0, v0, Lf11;->p:Lh11;

    .line 583
    .line 584
    if-eqz v0, :cond_14

    .line 585
    .line 586
    invoke-static {v0}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 587
    .line 588
    .line 589
    :catch_2
    :cond_14
    :goto_a
    const/4 v0, 0x0

    .line 590
    goto :goto_b

    .line 591
    :cond_15
    move v0, v14

    .line 592
    const-string v1, "code < 0: "

    .line 593
    .line 594
    invoke-static {v0, v1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v0

    .line 598
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 599
    .line 600
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    throw v1

    .line 608
    :catch_3
    invoke-static {v0}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 609
    .line 610
    .line 611
    goto :goto_a

    .line 612
    :cond_16
    :goto_b
    move-object v3, v0

    .line 613
    goto :goto_c

    .line 614
    :cond_17
    const/4 v3, 0x0

    .line 615
    :goto_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 616
    .line 617
    .line 618
    move-result-wide v4

    .line 619
    iget-object v0, v2, Lay0;->e:Lm01;

    .line 620
    .line 621
    if-eqz v3, :cond_1e

    .line 622
    .line 623
    iget-wide v9, v3, Lf11;->t:J

    .line 624
    .line 625
    iget-wide v11, v3, Lf11;->u:J

    .line 626
    .line 627
    iget-object v13, v3, Lf11;->o:Lsb0;

    .line 628
    .line 629
    invoke-virtual {v13}, Lsb0;->size()I

    .line 630
    .line 631
    .line 632
    move-result v14

    .line 633
    const/4 v7, 0x0

    .line 634
    const/4 v8, -0x1

    .line 635
    const/4 v15, 0x0

    .line 636
    const/16 v18, 0x0

    .line 637
    .line 638
    const/16 v19, 0x0

    .line 639
    .line 640
    const/16 v20, 0x0

    .line 641
    .line 642
    const/16 v21, 0x0

    .line 643
    .line 644
    const/16 v22, 0x0

    .line 645
    .line 646
    :goto_d
    if-ge v7, v14, :cond_1d

    .line 647
    .line 648
    invoke-virtual {v13, v7}, Lsb0;->c(I)Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v6

    .line 652
    move-wide/from16 v27, v4

    .line 653
    .line 654
    invoke-virtual {v13, v7}, Lsb0;->e(I)Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v4

    .line 658
    const-string v5, "Date"

    .line 659
    .line 660
    invoke-static {v6, v5}, Lla1;->t(Ljava/lang/String;Ljava/lang/String;)Z

    .line 661
    .line 662
    .line 663
    move-result v5

    .line 664
    if-eqz v5, :cond_18

    .line 665
    .line 666
    invoke-static {v4}, Lzu;->a(Ljava/lang/String;)Ljava/util/Date;

    .line 667
    .line 668
    .line 669
    move-result-object v5

    .line 670
    move-object/from16 v22, v4

    .line 671
    .line 672
    move-object/from16 v19, v5

    .line 673
    .line 674
    goto :goto_e

    .line 675
    :cond_18
    const-string v5, "Expires"

    .line 676
    .line 677
    invoke-static {v6, v5}, Lla1;->t(Ljava/lang/String;Ljava/lang/String;)Z

    .line 678
    .line 679
    .line 680
    move-result v5

    .line 681
    if-eqz v5, :cond_19

    .line 682
    .line 683
    invoke-static {v4}, Lzu;->a(Ljava/lang/String;)Ljava/util/Date;

    .line 684
    .line 685
    .line 686
    move-result-object v4

    .line 687
    move-object v15, v4

    .line 688
    goto :goto_e

    .line 689
    :cond_19
    const-string v5, "Last-Modified"

    .line 690
    .line 691
    invoke-static {v6, v5}, Lla1;->t(Ljava/lang/String;Ljava/lang/String;)Z

    .line 692
    .line 693
    .line 694
    move-result v5

    .line 695
    if-eqz v5, :cond_1a

    .line 696
    .line 697
    invoke-static {v4}, Lzu;->a(Ljava/lang/String;)Ljava/util/Date;

    .line 698
    .line 699
    .line 700
    move-result-object v5

    .line 701
    move-object/from16 v21, v4

    .line 702
    .line 703
    move-object/from16 v18, v5

    .line 704
    .line 705
    goto :goto_e

    .line 706
    :cond_1a
    const-string v5, "ETag"

    .line 707
    .line 708
    invoke-static {v6, v5}, Lla1;->t(Ljava/lang/String;Ljava/lang/String;)Z

    .line 709
    .line 710
    .line 711
    move-result v5

    .line 712
    if-eqz v5, :cond_1b

    .line 713
    .line 714
    move-object/from16 v20, v4

    .line 715
    .line 716
    goto :goto_e

    .line 717
    :cond_1b
    const-string v5, "Age"

    .line 718
    .line 719
    invoke-static {v6, v5}, Lla1;->t(Ljava/lang/String;Ljava/lang/String;)Z

    .line 720
    .line 721
    .line 722
    move-result v5

    .line 723
    if-eqz v5, :cond_1c

    .line 724
    .line 725
    const/4 v5, -0x1

    .line 726
    invoke-static {v5, v4}, Ljg1;->r(ILjava/lang/String;)I

    .line 727
    .line 728
    .line 729
    move-result v8

    .line 730
    :cond_1c
    :goto_e
    add-int/lit8 v7, v7, 0x1

    .line 731
    .line 732
    move-wide/from16 v4, v27

    .line 733
    .line 734
    goto :goto_d

    .line 735
    :cond_1d
    :goto_f
    move-wide/from16 v27, v4

    .line 736
    .line 737
    goto :goto_10

    .line 738
    :cond_1e
    const/4 v8, -0x1

    .line 739
    const-wide/16 v9, 0x0

    .line 740
    .line 741
    const-wide/16 v11, 0x0

    .line 742
    .line 743
    const/4 v15, 0x0

    .line 744
    const/16 v18, 0x0

    .line 745
    .line 746
    const/16 v19, 0x0

    .line 747
    .line 748
    const/16 v20, 0x0

    .line 749
    .line 750
    const/16 v21, 0x0

    .line 751
    .line 752
    const/16 v22, 0x0

    .line 753
    .line 754
    goto :goto_f

    .line 755
    :goto_10
    const-string v4, "If-None-Match"

    .line 756
    .line 757
    const-string v5, "If-Modified-Since"

    .line 758
    .line 759
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 760
    .line 761
    const/4 v7, 0x7

    .line 762
    if-nez v3, :cond_1f

    .line 763
    .line 764
    new-instance v4, Ls7;

    .line 765
    .line 766
    const/4 v13, 0x0

    .line 767
    const/4 v14, 0x0

    .line 768
    invoke-direct {v4, v0, v13, v7, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 769
    .line 770
    .line 771
    goto/16 :goto_1b

    .line 772
    .line 773
    :cond_1f
    const/4 v13, 0x0

    .line 774
    const/4 v14, 0x0

    .line 775
    iget-object v7, v0, Lm01;->a:Led0;

    .line 776
    .line 777
    iget-object v13, v0, Lm01;->c:Lsb0;

    .line 778
    .line 779
    iget-boolean v7, v7, Led0;->i:Z

    .line 780
    .line 781
    if-eqz v7, :cond_20

    .line 782
    .line 783
    iget-object v7, v3, Lf11;->n:Lnb0;

    .line 784
    .line 785
    if-nez v7, :cond_20

    .line 786
    .line 787
    new-instance v4, Ls7;

    .line 788
    .line 789
    const/4 v5, 0x7

    .line 790
    const/4 v7, 0x0

    .line 791
    invoke-direct {v4, v0, v7, v5, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 792
    .line 793
    .line 794
    goto/16 :goto_1b

    .line 795
    .line 796
    :cond_20
    move-wide/from16 v29, v9

    .line 797
    .line 798
    const/4 v7, 0x0

    .line 799
    const/4 v9, 0x7

    .line 800
    invoke-static {v3, v0}, Lbh;->u(Lf11;Lm01;)Z

    .line 801
    .line 802
    .line 803
    move-result v10

    .line 804
    if-nez v10, :cond_21

    .line 805
    .line 806
    new-instance v4, Ls7;

    .line 807
    .line 808
    invoke-direct {v4, v0, v7, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 809
    .line 810
    .line 811
    goto/16 :goto_1b

    .line 812
    .line 813
    :cond_21
    iget-object v7, v0, Lm01;->e:Lci;

    .line 814
    .line 815
    if-nez v7, :cond_22

    .line 816
    .line 817
    sget-object v7, Lci;->n:Lci;

    .line 818
    .line 819
    iget-object v7, v0, Lm01;->c:Lsb0;

    .line 820
    .line 821
    invoke-static {v7}, Lml;->x(Lsb0;)Lci;

    .line 822
    .line 823
    .line 824
    move-result-object v7

    .line 825
    iput-object v7, v0, Lm01;->e:Lci;

    .line 826
    .line 827
    :cond_22
    iget-boolean v9, v7, Lci;->a:Z

    .line 828
    .line 829
    if-nez v9, :cond_37

    .line 830
    .line 831
    invoke-virtual {v13, v5}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 832
    .line 833
    .line 834
    move-result-object v9

    .line 835
    if-nez v9, :cond_37

    .line 836
    .line 837
    invoke-virtual {v13, v4}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 838
    .line 839
    .line 840
    move-result-object v9

    .line 841
    if-eqz v9, :cond_23

    .line 842
    .line 843
    goto/16 :goto_1a

    .line 844
    .line 845
    :cond_23
    invoke-virtual {v3}, Lf11;->a()Lci;

    .line 846
    .line 847
    .line 848
    move-result-object v9

    .line 849
    if-eqz v19, :cond_24

    .line 850
    .line 851
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    .line 852
    .line 853
    .line 854
    move-result-wide v31

    .line 855
    move-object v10, v4

    .line 856
    move-object v14, v5

    .line 857
    sub-long v4, v11, v31

    .line 858
    .line 859
    move-wide/from16 v31, v11

    .line 860
    .line 861
    move-object v12, v10

    .line 862
    const-wide/16 v10, 0x0

    .line 863
    .line 864
    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 865
    .line 866
    .line 867
    move-result-wide v4

    .line 868
    :goto_11
    const/4 v10, -0x1

    .line 869
    goto :goto_12

    .line 870
    :cond_24
    move-object v14, v5

    .line 871
    move-wide/from16 v31, v11

    .line 872
    .line 873
    move-object v12, v4

    .line 874
    const-wide/16 v4, 0x0

    .line 875
    .line 876
    goto :goto_11

    .line 877
    :goto_12
    if-eq v8, v10, :cond_25

    .line 878
    .line 879
    int-to-long v10, v8

    .line 880
    invoke-virtual {v6, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 881
    .line 882
    .line 883
    move-result-wide v10

    .line 884
    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    .line 885
    .line 886
    .line 887
    move-result-wide v4

    .line 888
    :cond_25
    sub-long v10, v31, v29

    .line 889
    .line 890
    sub-long v27, v27, v31

    .line 891
    .line 892
    add-long/2addr v4, v10

    .line 893
    add-long v4, v4, v27

    .line 894
    .line 895
    invoke-virtual {v3}, Lf11;->a()Lci;

    .line 896
    .line 897
    .line 898
    move-result-object v8

    .line 899
    iget v8, v8, Lci;->c:I

    .line 900
    .line 901
    const/4 v10, -0x1

    .line 902
    if-eq v8, v10, :cond_26

    .line 903
    .line 904
    int-to-long v10, v8

    .line 905
    invoke-virtual {v6, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 906
    .line 907
    .line 908
    move-result-wide v10

    .line 909
    :goto_13
    const-wide/16 v23, 0x0

    .line 910
    .line 911
    goto :goto_16

    .line 912
    :cond_26
    if-eqz v15, :cond_29

    .line 913
    .line 914
    if-eqz v19, :cond_27

    .line 915
    .line 916
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    .line 917
    .line 918
    .line 919
    move-result-wide v10

    .line 920
    move-wide/from16 v31, v10

    .line 921
    .line 922
    :cond_27
    invoke-virtual {v15}, Ljava/util/Date;->getTime()J

    .line 923
    .line 924
    .line 925
    move-result-wide v10

    .line 926
    sub-long v10, v10, v31

    .line 927
    .line 928
    const-wide/16 v23, 0x0

    .line 929
    .line 930
    cmp-long v8, v10, v23

    .line 931
    .line 932
    if-lez v8, :cond_28

    .line 933
    .line 934
    goto :goto_13

    .line 935
    :cond_28
    const-wide/16 v10, 0x0

    .line 936
    .line 937
    goto :goto_13

    .line 938
    :cond_29
    if-eqz v18, :cond_2d

    .line 939
    .line 940
    iget-object v8, v3, Lf11;->j:Lm01;

    .line 941
    .line 942
    iget-object v8, v8, Lm01;->a:Led0;

    .line 943
    .line 944
    iget-object v8, v8, Led0;->f:Ljava/util/List;

    .line 945
    .line 946
    if-nez v8, :cond_2a

    .line 947
    .line 948
    const/4 v8, 0x0

    .line 949
    goto :goto_14

    .line 950
    :cond_2a
    new-instance v10, Ljava/lang/StringBuilder;

    .line 951
    .line 952
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 953
    .line 954
    .line 955
    invoke-static {v8, v10}, Lok0;->y(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 956
    .line 957
    .line 958
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 959
    .line 960
    .line 961
    move-result-object v8

    .line 962
    :goto_14
    if-nez v8, :cond_2d

    .line 963
    .line 964
    if-eqz v19, :cond_2b

    .line 965
    .line 966
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    .line 967
    .line 968
    .line 969
    move-result-wide v10

    .line 970
    move-wide/from16 v29, v10

    .line 971
    .line 972
    :cond_2b
    invoke-virtual/range {v18 .. v18}, Ljava/util/Date;->getTime()J

    .line 973
    .line 974
    .line 975
    move-result-wide v10

    .line 976
    sub-long v29, v29, v10

    .line 977
    .line 978
    const-wide/16 v23, 0x0

    .line 979
    .line 980
    cmp-long v8, v29, v23

    .line 981
    .line 982
    if-lez v8, :cond_2c

    .line 983
    .line 984
    const-wide/16 v10, 0xa

    .line 985
    .line 986
    div-long v10, v29, v10

    .line 987
    .line 988
    goto :goto_16

    .line 989
    :cond_2c
    :goto_15
    move-wide/from16 v10, v23

    .line 990
    .line 991
    goto :goto_16

    .line 992
    :cond_2d
    const-wide/16 v23, 0x0

    .line 993
    .line 994
    goto :goto_15

    .line 995
    :goto_16
    iget v8, v7, Lci;->c:I

    .line 996
    .line 997
    move-wide/from16 v27, v4

    .line 998
    .line 999
    const/4 v4, -0x1

    .line 1000
    if-eq v8, v4, :cond_2e

    .line 1001
    .line 1002
    int-to-long v4, v8

    .line 1003
    invoke-virtual {v6, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 1004
    .line 1005
    .line 1006
    move-result-wide v4

    .line 1007
    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 1008
    .line 1009
    .line 1010
    move-result-wide v10

    .line 1011
    :cond_2e
    iget v4, v7, Lci;->i:I

    .line 1012
    .line 1013
    const/4 v5, -0x1

    .line 1014
    move-wide/from16 v29, v10

    .line 1015
    .line 1016
    if-eq v4, v5, :cond_2f

    .line 1017
    .line 1018
    int-to-long v10, v4

    .line 1019
    invoke-virtual {v6, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 1020
    .line 1021
    .line 1022
    move-result-wide v10

    .line 1023
    goto :goto_17

    .line 1024
    :cond_2f
    move-wide/from16 v10, v23

    .line 1025
    .line 1026
    :goto_17
    iget-boolean v4, v9, Lci;->g:Z

    .line 1027
    .line 1028
    if-nez v4, :cond_30

    .line 1029
    .line 1030
    iget v4, v7, Lci;->h:I

    .line 1031
    .line 1032
    if-eq v4, v5, :cond_30

    .line 1033
    .line 1034
    int-to-long v4, v4

    .line 1035
    invoke-virtual {v6, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 1036
    .line 1037
    .line 1038
    move-result-wide v7

    .line 1039
    goto :goto_18

    .line 1040
    :cond_30
    move-wide/from16 v7, v23

    .line 1041
    .line 1042
    :goto_18
    iget-boolean v4, v9, Lci;->a:Z

    .line 1043
    .line 1044
    if-nez v4, :cond_33

    .line 1045
    .line 1046
    add-long v4, v27, v10

    .line 1047
    .line 1048
    add-long v10, v29, v7

    .line 1049
    .line 1050
    cmp-long v6, v4, v10

    .line 1051
    .line 1052
    if-gez v6, :cond_33

    .line 1053
    .line 1054
    invoke-virtual {v3}, Lf11;->h()Le11;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v6

    .line 1058
    cmp-long v4, v4, v29

    .line 1059
    .line 1060
    if-ltz v4, :cond_31

    .line 1061
    .line 1062
    const-string v4, "110 HttpURLConnection \"Response is stale\""

    .line 1063
    .line 1064
    const-string v5, "Warning"

    .line 1065
    .line 1066
    iget-object v7, v6, Le11;->f:Lrb0;

    .line 1067
    .line 1068
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1069
    .line 1070
    .line 1071
    invoke-static {v5}, Lml;->g(Ljava/lang/String;)V

    .line 1072
    .line 1073
    .line 1074
    invoke-static {v4, v5}, Lml;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    invoke-virtual {v7, v5, v4}, Lrb0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 1078
    .line 1079
    .line 1080
    :cond_31
    const-wide/32 v4, 0x5265c00

    .line 1081
    .line 1082
    .line 1083
    cmp-long v4, v27, v4

    .line 1084
    .line 1085
    if-lez v4, :cond_32

    .line 1086
    .line 1087
    invoke-virtual {v3}, Lf11;->a()Lci;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v4

    .line 1091
    iget v4, v4, Lci;->c:I

    .line 1092
    .line 1093
    const/4 v5, -0x1

    .line 1094
    if-ne v4, v5, :cond_32

    .line 1095
    .line 1096
    if-nez v15, :cond_32

    .line 1097
    .line 1098
    const-string v4, "113 HttpURLConnection \"Heuristic expiration\""

    .line 1099
    .line 1100
    const-string v5, "Warning"

    .line 1101
    .line 1102
    iget-object v7, v6, Le11;->f:Lrb0;

    .line 1103
    .line 1104
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1105
    .line 1106
    .line 1107
    invoke-static {v5}, Lml;->g(Ljava/lang/String;)V

    .line 1108
    .line 1109
    .line 1110
    invoke-static {v4, v5}, Lml;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 1111
    .line 1112
    .line 1113
    invoke-virtual {v7, v5, v4}, Lrb0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 1114
    .line 1115
    .line 1116
    :cond_32
    new-instance v4, Ls7;

    .line 1117
    .line 1118
    invoke-virtual {v6}, Le11;->a()Lf11;

    .line 1119
    .line 1120
    .line 1121
    move-result-object v5

    .line 1122
    const/4 v7, 0x0

    .line 1123
    const/4 v9, 0x7

    .line 1124
    const/4 v14, 0x0

    .line 1125
    invoke-direct {v4, v7, v5, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 1126
    .line 1127
    .line 1128
    goto :goto_1b

    .line 1129
    :cond_33
    if-eqz v20, :cond_34

    .line 1130
    .line 1131
    move-object v4, v12

    .line 1132
    move-object/from16 v5, v20

    .line 1133
    .line 1134
    goto :goto_19

    .line 1135
    :cond_34
    if-eqz v18, :cond_35

    .line 1136
    .line 1137
    move-object v4, v14

    .line 1138
    move-object/from16 v5, v21

    .line 1139
    .line 1140
    goto :goto_19

    .line 1141
    :cond_35
    if-eqz v19, :cond_36

    .line 1142
    .line 1143
    move-object v4, v14

    .line 1144
    move-object/from16 v5, v22

    .line 1145
    .line 1146
    :goto_19
    invoke-virtual {v13}, Lsb0;->d()Lrb0;

    .line 1147
    .line 1148
    .line 1149
    move-result-object v6

    .line 1150
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1151
    .line 1152
    .line 1153
    invoke-virtual {v6, v4, v5}, Lrb0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 1154
    .line 1155
    .line 1156
    invoke-virtual {v0}, Lm01;->a()Ler0;

    .line 1157
    .line 1158
    .line 1159
    move-result-object v4

    .line 1160
    invoke-virtual {v6}, Lrb0;->c()Lsb0;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v5

    .line 1164
    invoke-virtual {v5}, Lsb0;->d()Lrb0;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v5

    .line 1168
    iput-object v5, v4, Ler0;->m:Ljava/lang/Object;

    .line 1169
    .line 1170
    invoke-virtual {v4}, Ler0;->c()Lm01;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v4

    .line 1174
    new-instance v5, Ls7;

    .line 1175
    .line 1176
    const/4 v9, 0x7

    .line 1177
    const/4 v14, 0x0

    .line 1178
    invoke-direct {v5, v4, v3, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 1179
    .line 1180
    .line 1181
    move-object v4, v5

    .line 1182
    goto :goto_1b

    .line 1183
    :cond_36
    const/4 v9, 0x7

    .line 1184
    const/4 v14, 0x0

    .line 1185
    new-instance v4, Ls7;

    .line 1186
    .line 1187
    const/4 v7, 0x0

    .line 1188
    invoke-direct {v4, v0, v7, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 1189
    .line 1190
    .line 1191
    goto :goto_1b

    .line 1192
    :cond_37
    :goto_1a
    const/4 v7, 0x0

    .line 1193
    const/4 v9, 0x7

    .line 1194
    const/4 v14, 0x0

    .line 1195
    new-instance v4, Ls7;

    .line 1196
    .line 1197
    invoke-direct {v4, v0, v7, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 1198
    .line 1199
    .line 1200
    :goto_1b
    iget-object v5, v4, Ls7;->k:Ljava/lang/Object;

    .line 1201
    .line 1202
    check-cast v5, Lm01;

    .line 1203
    .line 1204
    if-eqz v5, :cond_39

    .line 1205
    .line 1206
    iget-object v5, v0, Lm01;->e:Lci;

    .line 1207
    .line 1208
    if-nez v5, :cond_38

    .line 1209
    .line 1210
    sget-object v5, Lci;->n:Lci;

    .line 1211
    .line 1212
    iget-object v5, v0, Lm01;->c:Lsb0;

    .line 1213
    .line 1214
    invoke-static {v5}, Lml;->x(Lsb0;)Lci;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v5

    .line 1218
    iput-object v5, v0, Lm01;->e:Lci;

    .line 1219
    .line 1220
    :cond_38
    iget-boolean v0, v5, Lci;->j:Z

    .line 1221
    .line 1222
    if-eqz v0, :cond_39

    .line 1223
    .line 1224
    new-instance v4, Ls7;

    .line 1225
    .line 1226
    const/4 v7, 0x0

    .line 1227
    const/4 v9, 0x7

    .line 1228
    const/4 v14, 0x0

    .line 1229
    invoke-direct {v4, v7, v7, v9, v14}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 1230
    .line 1231
    .line 1232
    goto :goto_1c

    .line 1233
    :cond_39
    const/4 v7, 0x0

    .line 1234
    :goto_1c
    iget-object v0, v4, Ls7;->k:Ljava/lang/Object;

    .line 1235
    .line 1236
    check-cast v0, Lm01;

    .line 1237
    .line 1238
    iget-object v4, v4, Ls7;->l:Ljava/lang/Object;

    .line 1239
    .line 1240
    check-cast v4, Lf11;

    .line 1241
    .line 1242
    iget-object v5, v1, Lei;->b:Ljava/lang/Object;

    .line 1243
    .line 1244
    check-cast v5, Lbi;

    .line 1245
    .line 1246
    if-eqz v5, :cond_3a

    .line 1247
    .line 1248
    monitor-enter v5

    .line 1249
    monitor-exit v5

    .line 1250
    :cond_3a
    if-eqz v3, :cond_3b

    .line 1251
    .line 1252
    if-nez v4, :cond_3b

    .line 1253
    .line 1254
    iget-object v5, v3, Lf11;->p:Lh11;

    .line 1255
    .line 1256
    if-eqz v5, :cond_3b

    .line 1257
    .line 1258
    invoke-static {v5}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 1259
    .line 1260
    .line 1261
    :cond_3b
    if-nez v0, :cond_3c

    .line 1262
    .line 1263
    if-nez v4, :cond_3c

    .line 1264
    .line 1265
    new-instance v0, Ljava/util/ArrayList;

    .line 1266
    .line 1267
    const/16 v14, 0x14

    .line 1268
    .line 1269
    invoke-direct {v0, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 1270
    .line 1271
    .line 1272
    iget-object v1, v2, Lay0;->e:Lm01;

    .line 1273
    .line 1274
    sget-object v29, Liw0;->l:Liw0;

    .line 1275
    .line 1276
    const-string v30, "Unsatisfiable Request (only-if-cached)"

    .line 1277
    .line 1278
    sget-object v34, Ljg1;->c:Lg11;

    .line 1279
    .line 1280
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1281
    .line 1282
    .line 1283
    move-result-wide v40

    .line 1284
    new-instance v2, Lsb0;

    .line 1285
    .line 1286
    const/4 v14, 0x0

    .line 1287
    new-array v3, v14, [Ljava/lang/String;

    .line 1288
    .line 1289
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1290
    .line 1291
    .line 1292
    move-result-object v0

    .line 1293
    check-cast v0, [Ljava/lang/String;

    .line 1294
    .line 1295
    invoke-direct {v2, v0}, Lsb0;-><init>([Ljava/lang/String;)V

    .line 1296
    .line 1297
    .line 1298
    new-instance v27, Lf11;

    .line 1299
    .line 1300
    const/16 v31, 0x1f8

    .line 1301
    .line 1302
    const/16 v32, 0x0

    .line 1303
    .line 1304
    const/16 v35, 0x0

    .line 1305
    .line 1306
    const/16 v36, 0x0

    .line 1307
    .line 1308
    const/16 v37, 0x0

    .line 1309
    .line 1310
    const-wide/16 v38, -0x1

    .line 1311
    .line 1312
    const/16 v42, 0x0

    .line 1313
    .line 1314
    move-object/from16 v28, v1

    .line 1315
    .line 1316
    move-object/from16 v33, v2

    .line 1317
    .line 1318
    invoke-direct/range {v27 .. v42}, Lf11;-><init>(Lm01;Liw0;Ljava/lang/String;ILnb0;Lsb0;Lh11;Lf11;Lf11;Lf11;JJLai;)V

    .line 1319
    .line 1320
    .line 1321
    goto/16 :goto_27

    .line 1322
    .line 1323
    :cond_3c
    if-nez v0, :cond_3d

    .line 1324
    .line 1325
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1326
    .line 1327
    .line 1328
    invoke-virtual {v4}, Lf11;->h()Le11;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v0

    .line 1332
    invoke-static {v4}, Lxg;->q(Lf11;)Lf11;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v1

    .line 1336
    const-string v2, "cacheResponse"

    .line 1337
    .line 1338
    invoke-static {v1, v2}, Le11;->b(Lf11;Ljava/lang/String;)V

    .line 1339
    .line 1340
    .line 1341
    iput-object v1, v0, Le11;->i:Lf11;

    .line 1342
    .line 1343
    invoke-virtual {v0}, Le11;->a()Lf11;

    .line 1344
    .line 1345
    .line 1346
    move-result-object v27

    .line 1347
    goto/16 :goto_27

    .line 1348
    .line 1349
    :cond_3d
    :try_start_c
    invoke-virtual {v2, v0}, Lay0;->b(Lm01;)Lf11;

    .line 1350
    .line 1351
    .line 1352
    move-result-object v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 1353
    if-eqz v4, :cond_49

    .line 1354
    .line 1355
    iget v3, v2, Lf11;->m:I

    .line 1356
    .line 1357
    const/16 v5, 0x130

    .line 1358
    .line 1359
    if-ne v3, v5, :cond_48

    .line 1360
    .line 1361
    invoke-virtual {v4}, Lf11;->h()Le11;

    .line 1362
    .line 1363
    .line 1364
    move-result-object v0

    .line 1365
    iget-object v3, v4, Lf11;->o:Lsb0;

    .line 1366
    .line 1367
    iget-object v5, v2, Lf11;->o:Lsb0;

    .line 1368
    .line 1369
    new-instance v6, Ljava/util/ArrayList;

    .line 1370
    .line 1371
    const/16 v14, 0x14

    .line 1372
    .line 1373
    invoke-direct {v6, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 1374
    .line 1375
    .line 1376
    invoke-virtual {v3}, Lsb0;->size()I

    .line 1377
    .line 1378
    .line 1379
    move-result v8

    .line 1380
    const/4 v9, 0x0

    .line 1381
    :goto_1d
    if-ge v9, v8, :cond_42

    .line 1382
    .line 1383
    invoke-virtual {v3, v9}, Lsb0;->c(I)Ljava/lang/String;

    .line 1384
    .line 1385
    .line 1386
    move-result-object v10

    .line 1387
    invoke-virtual {v3, v9}, Lsb0;->e(I)Ljava/lang/String;

    .line 1388
    .line 1389
    .line 1390
    move-result-object v11

    .line 1391
    const-string v12, "Warning"

    .line 1392
    .line 1393
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1394
    .line 1395
    .line 1396
    move-result v12

    .line 1397
    if-eqz v12, :cond_3e

    .line 1398
    .line 1399
    const-string v12, "1"

    .line 1400
    .line 1401
    const/4 v14, 0x0

    .line 1402
    invoke-static {v11, v12, v14}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 1403
    .line 1404
    .line 1405
    move-result v12

    .line 1406
    if-eqz v12, :cond_3e

    .line 1407
    .line 1408
    goto :goto_1f

    .line 1409
    :cond_3e
    const-string v12, "Content-Length"

    .line 1410
    .line 1411
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1412
    .line 1413
    .line 1414
    move-result v12

    .line 1415
    if-nez v12, :cond_40

    .line 1416
    .line 1417
    const-string v12, "Content-Encoding"

    .line 1418
    .line 1419
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1420
    .line 1421
    .line 1422
    move-result v12

    .line 1423
    if-nez v12, :cond_40

    .line 1424
    .line 1425
    const-string v12, "Content-Type"

    .line 1426
    .line 1427
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1428
    .line 1429
    .line 1430
    move-result v12

    .line 1431
    if-eqz v12, :cond_3f

    .line 1432
    .line 1433
    goto :goto_1e

    .line 1434
    :cond_3f
    invoke-static {v10}, Lxg;->m(Ljava/lang/String;)Z

    .line 1435
    .line 1436
    .line 1437
    move-result v12

    .line 1438
    if-eqz v12, :cond_40

    .line 1439
    .line 1440
    invoke-virtual {v5, v10}, Lsb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 1441
    .line 1442
    .line 1443
    move-result-object v12

    .line 1444
    if-nez v12, :cond_41

    .line 1445
    .line 1446
    :cond_40
    :goto_1e
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1447
    .line 1448
    .line 1449
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1450
    .line 1451
    .line 1452
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1453
    .line 1454
    .line 1455
    invoke-static {v11}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 1456
    .line 1457
    .line 1458
    move-result-object v10

    .line 1459
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 1460
    .line 1461
    .line 1462
    move-result-object v10

    .line 1463
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1464
    .line 1465
    .line 1466
    :cond_41
    :goto_1f
    add-int/lit8 v9, v9, 0x1

    .line 1467
    .line 1468
    goto :goto_1d

    .line 1469
    :cond_42
    invoke-virtual {v5}, Lsb0;->size()I

    .line 1470
    .line 1471
    .line 1472
    move-result v3

    .line 1473
    const/4 v8, 0x0

    .line 1474
    :goto_20
    if-ge v8, v3, :cond_45

    .line 1475
    .line 1476
    invoke-virtual {v5, v8}, Lsb0;->c(I)Ljava/lang/String;

    .line 1477
    .line 1478
    .line 1479
    move-result-object v9

    .line 1480
    const-string v10, "Content-Length"

    .line 1481
    .line 1482
    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1483
    .line 1484
    .line 1485
    move-result v10

    .line 1486
    if-nez v10, :cond_44

    .line 1487
    .line 1488
    const-string v10, "Content-Encoding"

    .line 1489
    .line 1490
    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1491
    .line 1492
    .line 1493
    move-result v10

    .line 1494
    if-nez v10, :cond_44

    .line 1495
    .line 1496
    const-string v10, "Content-Type"

    .line 1497
    .line 1498
    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1499
    .line 1500
    .line 1501
    move-result v10

    .line 1502
    if-eqz v10, :cond_43

    .line 1503
    .line 1504
    goto :goto_21

    .line 1505
    :cond_43
    invoke-static {v9}, Lxg;->m(Ljava/lang/String;)Z

    .line 1506
    .line 1507
    .line 1508
    move-result v10

    .line 1509
    if-eqz v10, :cond_44

    .line 1510
    .line 1511
    invoke-virtual {v5, v8}, Lsb0;->e(I)Ljava/lang/String;

    .line 1512
    .line 1513
    .line 1514
    move-result-object v10

    .line 1515
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1516
    .line 1517
    .line 1518
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1519
    .line 1520
    .line 1521
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1522
    .line 1523
    .line 1524
    invoke-static {v10}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 1525
    .line 1526
    .line 1527
    move-result-object v9

    .line 1528
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 1529
    .line 1530
    .line 1531
    move-result-object v9

    .line 1532
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1533
    .line 1534
    .line 1535
    :cond_44
    :goto_21
    add-int/lit8 v8, v8, 0x1

    .line 1536
    .line 1537
    goto :goto_20

    .line 1538
    :cond_45
    const/4 v14, 0x0

    .line 1539
    new-array v3, v14, [Ljava/lang/String;

    .line 1540
    .line 1541
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1542
    .line 1543
    .line 1544
    move-result-object v3

    .line 1545
    check-cast v3, [Ljava/lang/String;

    .line 1546
    .line 1547
    new-instance v5, Lrb0;

    .line 1548
    .line 1549
    invoke-direct {v5}, Lrb0;-><init>()V

    .line 1550
    .line 1551
    .line 1552
    iget-object v6, v5, Lrb0;->j:Ljava/util/ArrayList;

    .line 1553
    .line 1554
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1555
    .line 1556
    .line 1557
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 1558
    .line 1559
    .line 1560
    move-result-object v3

    .line 1561
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1562
    .line 1563
    .line 1564
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1565
    .line 1566
    .line 1567
    iput-object v5, v0, Le11;->f:Lrb0;

    .line 1568
    .line 1569
    iget-wide v5, v2, Lf11;->t:J

    .line 1570
    .line 1571
    iput-wide v5, v0, Le11;->k:J

    .line 1572
    .line 1573
    iget-wide v5, v2, Lf11;->u:J

    .line 1574
    .line 1575
    iput-wide v5, v0, Le11;->l:J

    .line 1576
    .line 1577
    invoke-static {v4}, Lxg;->q(Lf11;)Lf11;

    .line 1578
    .line 1579
    .line 1580
    move-result-object v3

    .line 1581
    const-string v5, "cacheResponse"

    .line 1582
    .line 1583
    invoke-static {v3, v5}, Le11;->b(Lf11;Ljava/lang/String;)V

    .line 1584
    .line 1585
    .line 1586
    iput-object v3, v0, Le11;->i:Lf11;

    .line 1587
    .line 1588
    invoke-static {v2}, Lxg;->q(Lf11;)Lf11;

    .line 1589
    .line 1590
    .line 1591
    move-result-object v3

    .line 1592
    const-string v5, "networkResponse"

    .line 1593
    .line 1594
    invoke-static {v3, v5}, Le11;->b(Lf11;Ljava/lang/String;)V

    .line 1595
    .line 1596
    .line 1597
    iput-object v3, v0, Le11;->h:Lf11;

    .line 1598
    .line 1599
    invoke-virtual {v0}, Le11;->a()Lf11;

    .line 1600
    .line 1601
    .line 1602
    move-result-object v0

    .line 1603
    iget-object v2, v2, Lf11;->p:Lh11;

    .line 1604
    .line 1605
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1606
    .line 1607
    .line 1608
    invoke-virtual {v2}, Lh11;->close()V

    .line 1609
    .line 1610
    .line 1611
    iget-object v2, v1, Lei;->b:Ljava/lang/Object;

    .line 1612
    .line 1613
    check-cast v2, Lbi;

    .line 1614
    .line 1615
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1616
    .line 1617
    .line 1618
    monitor-enter v2

    .line 1619
    monitor-exit v2

    .line 1620
    iget-object v1, v1, Lei;->b:Ljava/lang/Object;

    .line 1621
    .line 1622
    check-cast v1, Lbi;

    .line 1623
    .line 1624
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1625
    .line 1626
    .line 1627
    new-instance v1, Lyh;

    .line 1628
    .line 1629
    invoke-direct {v1, v0}, Lyh;-><init>(Lf11;)V

    .line 1630
    .line 1631
    .line 1632
    iget-object v2, v4, Lf11;->p:Lh11;

    .line 1633
    .line 1634
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1635
    .line 1636
    .line 1637
    check-cast v2, Lxh;

    .line 1638
    .line 1639
    iget-object v2, v2, Lxh;->j:Lyx;

    .line 1640
    .line 1641
    :try_start_d
    iget-object v3, v2, Lyx;->m:Lay;

    .line 1642
    .line 1643
    iget-object v4, v2, Lyx;->j:Ljava/lang/String;

    .line 1644
    .line 1645
    iget-wide v5, v2, Lyx;->k:J

    .line 1646
    .line 1647
    invoke-virtual {v3, v4, v5, v6}, Lay;->h(Ljava/lang/String;J)Lvx;

    .line 1648
    .line 1649
    .line 1650
    move-result-object v5
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_4

    .line 1651
    if-nez v5, :cond_46

    .line 1652
    .line 1653
    goto :goto_22

    .line 1654
    :cond_46
    :try_start_e
    invoke-virtual {v1, v5}, Lyh;->c(Lvx;)V

    .line 1655
    .line 1656
    .line 1657
    invoke-virtual {v5}, Lvx;->b()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_5

    .line 1658
    .line 1659
    .line 1660
    goto :goto_22

    .line 1661
    :catch_4
    move-object v5, v7

    .line 1662
    :catch_5
    if-eqz v5, :cond_47

    .line 1663
    .line 1664
    :try_start_f
    invoke-virtual {v5}, Lvx;->a()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_6

    .line 1665
    .line 1666
    .line 1667
    :catch_6
    :cond_47
    :goto_22
    move-object/from16 v27, v0

    .line 1668
    .line 1669
    goto/16 :goto_27

    .line 1670
    .line 1671
    :cond_48
    iget-object v3, v4, Lf11;->p:Lh11;

    .line 1672
    .line 1673
    if-eqz v3, :cond_49

    .line 1674
    .line 1675
    invoke-static {v3}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 1676
    .line 1677
    .line 1678
    :cond_49
    invoke-virtual {v2}, Lf11;->h()Le11;

    .line 1679
    .line 1680
    .line 1681
    move-result-object v3

    .line 1682
    invoke-static {v4}, Lxg;->q(Lf11;)Lf11;

    .line 1683
    .line 1684
    .line 1685
    move-result-object v4

    .line 1686
    const-string v5, "cacheResponse"

    .line 1687
    .line 1688
    invoke-static {v4, v5}, Le11;->b(Lf11;Ljava/lang/String;)V

    .line 1689
    .line 1690
    .line 1691
    iput-object v4, v3, Le11;->i:Lf11;

    .line 1692
    .line 1693
    invoke-static {v2}, Lxg;->q(Lf11;)Lf11;

    .line 1694
    .line 1695
    .line 1696
    move-result-object v2

    .line 1697
    const-string v4, "networkResponse"

    .line 1698
    .line 1699
    invoke-static {v2, v4}, Le11;->b(Lf11;Ljava/lang/String;)V

    .line 1700
    .line 1701
    .line 1702
    iput-object v2, v3, Le11;->h:Lf11;

    .line 1703
    .line 1704
    invoke-virtual {v3}, Le11;->a()Lf11;

    .line 1705
    .line 1706
    .line 1707
    move-result-object v2

    .line 1708
    iget-object v3, v1, Lei;->b:Ljava/lang/Object;

    .line 1709
    .line 1710
    check-cast v3, Lbi;

    .line 1711
    .line 1712
    if-eqz v3, :cond_53

    .line 1713
    .line 1714
    invoke-static {v2}, Lcd0;->a(Lf11;)Z

    .line 1715
    .line 1716
    .line 1717
    move-result v3

    .line 1718
    if-eqz v3, :cond_51

    .line 1719
    .line 1720
    invoke-static {v2, v0}, Lbh;->u(Lf11;Lm01;)Z

    .line 1721
    .line 1722
    .line 1723
    move-result v3

    .line 1724
    if-eqz v3, :cond_51

    .line 1725
    .line 1726
    iget-object v0, v1, Lei;->b:Ljava/lang/Object;

    .line 1727
    .line 1728
    check-cast v0, Lbi;

    .line 1729
    .line 1730
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1731
    .line 1732
    .line 1733
    iget-object v1, v2, Lf11;->j:Lm01;

    .line 1734
    .line 1735
    iget-object v3, v1, Lm01;->b:Ljava/lang/String;

    .line 1736
    .line 1737
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1738
    .line 1739
    .line 1740
    const-string v4, "POST"

    .line 1741
    .line 1742
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1743
    .line 1744
    .line 1745
    move-result v4

    .line 1746
    if-nez v4, :cond_4f

    .line 1747
    .line 1748
    const-string v4, "PATCH"

    .line 1749
    .line 1750
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1751
    .line 1752
    .line 1753
    move-result v4

    .line 1754
    if-nez v4, :cond_4f

    .line 1755
    .line 1756
    const-string v4, "PUT"

    .line 1757
    .line 1758
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1759
    .line 1760
    .line 1761
    move-result v4

    .line 1762
    if-nez v4, :cond_4f

    .line 1763
    .line 1764
    const-string v4, "DELETE"

    .line 1765
    .line 1766
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1767
    .line 1768
    .line 1769
    move-result v4

    .line 1770
    if-nez v4, :cond_4f

    .line 1771
    .line 1772
    const-string v4, "MOVE"

    .line 1773
    .line 1774
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1775
    .line 1776
    .line 1777
    move-result v4

    .line 1778
    if-eqz v4, :cond_4a

    .line 1779
    .line 1780
    goto :goto_24

    .line 1781
    :cond_4a
    const-string v4, "GET"

    .line 1782
    .line 1783
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1784
    .line 1785
    .line 1786
    move-result v3

    .line 1787
    if-nez v3, :cond_4c

    .line 1788
    .line 1789
    :catch_7
    :cond_4b
    :goto_23
    move-object v5, v7

    .line 1790
    goto :goto_25

    .line 1791
    :cond_4c
    iget-object v3, v2, Lf11;->o:Lsb0;

    .line 1792
    .line 1793
    invoke-static {v3}, Lbe2;->w(Lsb0;)Ljava/util/Set;

    .line 1794
    .line 1795
    .line 1796
    move-result-object v3

    .line 1797
    const-string v4, "*"

    .line 1798
    .line 1799
    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 1800
    .line 1801
    .line 1802
    move-result v3

    .line 1803
    if-eqz v3, :cond_4d

    .line 1804
    .line 1805
    goto :goto_23

    .line 1806
    :cond_4d
    new-instance v3, Lyh;

    .line 1807
    .line 1808
    invoke-direct {v3, v2}, Lyh;-><init>(Lf11;)V

    .line 1809
    .line 1810
    .line 1811
    :try_start_10
    iget-object v4, v0, Lbi;->j:Lay;

    .line 1812
    .line 1813
    iget-object v1, v1, Lm01;->a:Led0;

    .line 1814
    .line 1815
    invoke-static {v1}, Lbe2;->r(Led0;)Ljava/lang/String;

    .line 1816
    .line 1817
    .line 1818
    move-result-object v1

    .line 1819
    sget-object v5, Lay;->B:Lkz0;

    .line 1820
    .line 1821
    const-wide/16 v5, -0x1

    .line 1822
    .line 1823
    invoke-virtual {v4, v1, v5, v6}, Lay;->h(Ljava/lang/String;J)Lvx;

    .line 1824
    .line 1825
    .line 1826
    move-result-object v13
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_8

    .line 1827
    if-nez v13, :cond_4e

    .line 1828
    .line 1829
    goto :goto_23

    .line 1830
    :cond_4e
    :try_start_11
    invoke-virtual {v3, v13}, Lyh;->c(Lvx;)V

    .line 1831
    .line 1832
    .line 1833
    new-instance v1, Lai;

    .line 1834
    .line 1835
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 1836
    .line 1837
    .line 1838
    iput-object v0, v1, Lai;->e:Ljava/lang/Object;

    .line 1839
    .line 1840
    iput-object v13, v1, Lai;->b:Ljava/lang/Object;

    .line 1841
    .line 1842
    const/4 v3, 0x1

    .line 1843
    invoke-virtual {v13, v3}, Lvx;->d(I)La81;

    .line 1844
    .line 1845
    .line 1846
    move-result-object v3

    .line 1847
    iput-object v3, v1, Lai;->c:Ljava/lang/Object;

    .line 1848
    .line 1849
    new-instance v4, Lzh;

    .line 1850
    .line 1851
    invoke-direct {v4, v0, v1, v3}, Lzh;-><init>(Lbi;Lai;La81;)V

    .line 1852
    .line 1853
    .line 1854
    iput-object v4, v1, Lai;->d:Ljava/lang/Object;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_9

    .line 1855
    .line 1856
    move-object v5, v1

    .line 1857
    goto :goto_25

    .line 1858
    :catch_8
    move-object v13, v7

    .line 1859
    :catch_9
    if-eqz v13, :cond_4b

    .line 1860
    .line 1861
    :try_start_12
    invoke-virtual {v13}, Lvx;->a()V

    .line 1862
    .line 1863
    .line 1864
    goto :goto_23

    .line 1865
    :cond_4f
    :goto_24
    invoke-virtual {v0, v1}, Lbi;->a(Lm01;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_7

    .line 1866
    .line 1867
    .line 1868
    goto :goto_23

    .line 1869
    :goto_25
    if-nez v5, :cond_50

    .line 1870
    .line 1871
    goto :goto_26

    .line 1872
    :cond_50
    iget-object v0, v5, Lai;->d:Ljava/lang/Object;

    .line 1873
    .line 1874
    check-cast v0, Lzh;

    .line 1875
    .line 1876
    iget-object v1, v2, Lf11;->p:Lh11;

    .line 1877
    .line 1878
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1879
    .line 1880
    .line 1881
    invoke-virtual {v1}, Lh11;->h()Llh;

    .line 1882
    .line 1883
    .line 1884
    move-result-object v1

    .line 1885
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1886
    .line 1887
    .line 1888
    new-instance v3, Lrx0;

    .line 1889
    .line 1890
    invoke-direct {v3, v0}, Lrx0;-><init>(La81;)V

    .line 1891
    .line 1892
    .line 1893
    new-instance v0, Ldi;

    .line 1894
    .line 1895
    invoke-direct {v0, v1, v5, v3}, Ldi;-><init>(Llh;Lai;Lrx0;)V

    .line 1896
    .line 1897
    .line 1898
    const-string v1, "Content-Type"

    .line 1899
    .line 1900
    invoke-static {v2, v1}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 1901
    .line 1902
    .line 1903
    move-result-object v1

    .line 1904
    iget-object v3, v2, Lf11;->p:Lh11;

    .line 1905
    .line 1906
    invoke-virtual {v3}, Lh11;->a()J

    .line 1907
    .line 1908
    .line 1909
    move-result-wide v3

    .line 1910
    invoke-virtual {v2}, Lf11;->h()Le11;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v2

    .line 1914
    new-instance v5, Lby0;

    .line 1915
    .line 1916
    new-instance v6, Lsx0;

    .line 1917
    .line 1918
    invoke-direct {v6, v0}, Lsx0;-><init>(Lp81;)V

    .line 1919
    .line 1920
    .line 1921
    invoke-direct {v5, v1, v3, v4, v6}, Lby0;-><init>(Ljava/lang/String;JLsx0;)V

    .line 1922
    .line 1923
    .line 1924
    iput-object v5, v2, Le11;->g:Lh11;

    .line 1925
    .line 1926
    invoke-virtual {v2}, Le11;->a()Lf11;

    .line 1927
    .line 1928
    .line 1929
    move-result-object v0

    .line 1930
    goto/16 :goto_22

    .line 1931
    .line 1932
    :cond_51
    iget-object v3, v0, Lm01;->b:Ljava/lang/String;

    .line 1933
    .line 1934
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1935
    .line 1936
    .line 1937
    const-string v4, "POST"

    .line 1938
    .line 1939
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1940
    .line 1941
    .line 1942
    move-result v4

    .line 1943
    if-nez v4, :cond_52

    .line 1944
    .line 1945
    const-string v4, "PATCH"

    .line 1946
    .line 1947
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1948
    .line 1949
    .line 1950
    move-result v4

    .line 1951
    if-nez v4, :cond_52

    .line 1952
    .line 1953
    const-string v4, "PUT"

    .line 1954
    .line 1955
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1956
    .line 1957
    .line 1958
    move-result v4

    .line 1959
    if-nez v4, :cond_52

    .line 1960
    .line 1961
    const-string v4, "DELETE"

    .line 1962
    .line 1963
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1964
    .line 1965
    .line 1966
    move-result v4

    .line 1967
    if-nez v4, :cond_52

    .line 1968
    .line 1969
    const-string v4, "MOVE"

    .line 1970
    .line 1971
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1972
    .line 1973
    .line 1974
    move-result v3

    .line 1975
    if-eqz v3, :cond_53

    .line 1976
    .line 1977
    :cond_52
    :try_start_13
    iget-object v1, v1, Lei;->b:Ljava/lang/Object;

    .line 1978
    .line 1979
    check-cast v1, Lbi;

    .line 1980
    .line 1981
    invoke-virtual {v1, v0}, Lbi;->a(Lm01;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_a

    .line 1982
    .line 1983
    .line 1984
    :catch_a
    :cond_53
    :goto_26
    move-object/from16 v27, v2

    .line 1985
    .line 1986
    :goto_27
    return-object v27

    .line 1987
    :catchall_2
    move-exception v0

    .line 1988
    if-eqz v3, :cond_54

    .line 1989
    .line 1990
    iget-object v1, v3, Lf11;->p:Lh11;

    .line 1991
    .line 1992
    if-eqz v1, :cond_54

    .line 1993
    .line 1994
    invoke-static {v1}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 1995
    .line 1996
    .line 1997
    :cond_54
    throw v0

    .line 1998
    nop

    .line 1999
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public b(Lf11;Lai;)Lm01;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    iget-object v1, p2, Lai;->e:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Lzx0;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, v1, Lzx0;->b:Ly11;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v1, v0

    .line 14
    :goto_0
    iget v2, p1, Lf11;->m:I

    .line 15
    .line 16
    iget-object v3, p1, Lf11;->j:Lm01;

    .line 17
    .line 18
    iget-object v3, v3, Lm01;->b:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v5, 0x1

    .line 22
    const/16 v6, 0x134

    .line 23
    .line 24
    const/16 v7, 0x133

    .line 25
    .line 26
    if-eq v2, v7, :cond_b

    .line 27
    .line 28
    if-eq v2, v6, :cond_b

    .line 29
    .line 30
    const/16 v8, 0x191

    .line 31
    .line 32
    if-eq v2, v8, :cond_a

    .line 33
    .line 34
    const/16 v8, 0x1a5

    .line 35
    .line 36
    if-eq v2, v8, :cond_8

    .line 37
    .line 38
    const/16 p2, 0x1f7

    .line 39
    .line 40
    if-eq v2, p2, :cond_6

    .line 41
    .line 42
    const/16 p2, 0x197

    .line 43
    .line 44
    if-eq v2, p2, :cond_4

    .line 45
    .line 46
    const/16 p2, 0x198

    .line 47
    .line 48
    if-eq v2, p2, :cond_1

    .line 49
    .line 50
    packed-switch v2, :pswitch_data_0

    .line 51
    .line 52
    .line 53
    goto/16 :goto_3

    .line 54
    .line 55
    :cond_1
    iget-object p0, p0, Lei;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p0, Lmr0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Lf11;->s:Lf11;

    .line 63
    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    iget p0, p0, Lf11;->m:I

    .line 67
    .line 68
    if-ne p0, p2, :cond_2

    .line 69
    .line 70
    goto/16 :goto_3

    .line 71
    .line 72
    :cond_2
    invoke-static {p1, v4}, Lei;->d(Lf11;I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-lez p0, :cond_3

    .line 77
    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :cond_3
    iget-object p0, p1, Lf11;->j:Lm01;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    iget-object p1, v1, Ly11;->b:Ljava/net/Proxy;

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget-object p2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 93
    .line 94
    if-ne p1, p2, :cond_5

    .line 95
    .line 96
    iget-object p0, p0, Lei;->b:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast p0, Lmr0;

    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_5
    new-instance p0, Ljava/net/ProtocolException;

    .line 105
    .line 106
    const-string p1, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    .line 107
    .line 108
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p0

    .line 112
    :cond_6
    iget-object p0, p1, Lf11;->s:Lf11;

    .line 113
    .line 114
    if-eqz p0, :cond_7

    .line 115
    .line 116
    iget p0, p0, Lf11;->m:I

    .line 117
    .line 118
    if-ne p0, p2, :cond_7

    .line 119
    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_7
    const p0, 0x7fffffff

    .line 123
    .line 124
    .line 125
    invoke-static {p1, p0}, Lei;->d(Lf11;I)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_e

    .line 130
    .line 131
    iget-object p0, p1, Lf11;->j:Lm01;

    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_8
    if-eqz p2, :cond_e

    .line 135
    .line 136
    iget-object p0, p2, Lai;->c:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast p0, Lp10;

    .line 139
    .line 140
    iget-object p0, p0, Lp10;->b:Lt3;

    .line 141
    .line 142
    iget-object p0, p0, Lt3;->f:Led0;

    .line 143
    .line 144
    iget-object p0, p0, Led0;->d:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v1, p2, Lai;->e:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v1, Lzx0;

    .line 149
    .line 150
    iget-object v1, v1, Lzx0;->b:Ly11;

    .line 151
    .line 152
    iget-object v1, v1, Ly11;->a:Lt3;

    .line 153
    .line 154
    iget-object v1, v1, Lt3;->f:Led0;

    .line 155
    .line 156
    iget-object v1, v1, Led0;->d:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {p0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_9

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_9
    iget-object p0, p2, Lai;->e:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast p0, Lzx0;

    .line 168
    .line 169
    monitor-enter p0

    .line 170
    :try_start_0
    iput-boolean v5, p0, Lzx0;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    .line 172
    monitor-exit p0

    .line 173
    iget-object p0, p1, Lf11;->j:Lm01;

    .line 174
    .line 175
    return-object p0

    .line 176
    :catchall_0
    move-exception p1

    .line 177
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    throw p1

    .line 179
    :cond_a
    iget-object p0, p0, Lei;->b:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast p0, Lmr0;

    .line 182
    .line 183
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    return-object v0

    .line 187
    :cond_b
    :pswitch_0
    const-string p2, "PROPFIND"

    .line 188
    .line 189
    iget-object p0, p0, Lei;->b:Ljava/lang/Object;

    .line 190
    .line 191
    check-cast p0, Lmr0;

    .line 192
    .line 193
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    .line 195
    .line 196
    const-string p0, "Location"

    .line 197
    .line 198
    invoke-static {p1, p0}, Lf11;->g(Lf11;Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    iget-object v1, p1, Lf11;->j:Lm01;

    .line 203
    .line 204
    if-nez p0, :cond_c

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_c
    iget-object v2, v1, Lm01;->a:Led0;

    .line 208
    .line 209
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    .line 211
    .line 212
    :try_start_2
    new-instance v8, Ldd0;

    .line 213
    .line 214
    invoke-direct {v8}, Ldd0;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v8, v2, p0}, Ldd0;->c(Led0;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :catch_0
    move-object v8, v0

    .line 222
    :goto_1
    if-eqz v8, :cond_d

    .line 223
    .line 224
    invoke-virtual {v8}, Ldd0;->a()Led0;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    goto :goto_2

    .line 229
    :cond_d
    move-object p0, v0

    .line 230
    :goto_2
    if-nez p0, :cond_f

    .line 231
    .line 232
    :cond_e
    :goto_3
    return-object v0

    .line 233
    :cond_f
    iget-object v2, p0, Led0;->a:Ljava/lang/String;

    .line 234
    .line 235
    iget-object v8, v1, Lm01;->a:Led0;

    .line 236
    .line 237
    iget-object v8, v8, Led0;->a:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {v2, v8}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Lm01;->a()Ler0;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-static {v3}, Las;->q(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v8

    .line 250
    if-eqz v8, :cond_13

    .line 251
    .line 252
    iget p1, p1, Lf11;->m:I

    .line 253
    .line 254
    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v8

    .line 258
    if-nez v8, :cond_10

    .line 259
    .line 260
    if-eq p1, v6, :cond_10

    .line 261
    .line 262
    if-ne p1, v7, :cond_11

    .line 263
    .line 264
    :cond_10
    move v4, v5

    .line 265
    :cond_11
    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result p2

    .line 269
    if-nez p2, :cond_12

    .line 270
    .line 271
    if-eq p1, v6, :cond_12

    .line 272
    .line 273
    if-eq p1, v7, :cond_12

    .line 274
    .line 275
    const-string p1, "GET"

    .line 276
    .line 277
    invoke-virtual {v2, p1, v0}, Ler0;->o(Ljava/lang/String;Lkp1;)V

    .line 278
    .line 279
    .line 280
    goto :goto_4

    .line 281
    :cond_12
    invoke-virtual {v2, v3, v0}, Ler0;->o(Ljava/lang/String;Lkp1;)V

    .line 282
    .line 283
    .line 284
    :goto_4
    if-nez v4, :cond_13

    .line 285
    .line 286
    const-string p1, "Transfer-Encoding"

    .line 287
    .line 288
    iget-object p2, v2, Ler0;->m:Ljava/lang/Object;

    .line 289
    .line 290
    check-cast p2, Lrb0;

    .line 291
    .line 292
    invoke-virtual {p2, p1}, Lrb0;->e(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    const-string p1, "Content-Length"

    .line 296
    .line 297
    iget-object p2, v2, Ler0;->m:Ljava/lang/Object;

    .line 298
    .line 299
    check-cast p2, Lrb0;

    .line 300
    .line 301
    invoke-virtual {p2, p1}, Lrb0;->e(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    const-string p1, "Content-Type"

    .line 305
    .line 306
    iget-object p2, v2, Ler0;->m:Ljava/lang/Object;

    .line 307
    .line 308
    check-cast p2, Lrb0;

    .line 309
    .line 310
    invoke-virtual {p2, p1}, Lrb0;->e(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    :cond_13
    iget-object p1, v1, Lm01;->a:Led0;

    .line 314
    .line 315
    invoke-static {p1, p0}, Ljg1;->a(Led0;Led0;)Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-nez p1, :cond_14

    .line 320
    .line 321
    const-string p1, "Authorization"

    .line 322
    .line 323
    iget-object p2, v2, Ler0;->m:Ljava/lang/Object;

    .line 324
    .line 325
    check-cast p2, Lrb0;

    .line 326
    .line 327
    invoke-virtual {p2, p1}, Lrb0;->e(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :cond_14
    iput-object p0, v2, Ler0;->k:Ljava/lang/Object;

    .line 331
    .line 332
    invoke-virtual {v2}, Ler0;->c()Lm01;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    return-object p0

    .line 337
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ljava/io/IOException;Lwx0;Lm01;Z)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lei;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lmr0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    instance-of p3, p1, Ljava/io/FileNotFoundException;

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    goto/16 :goto_5

    .line 16
    .line 17
    :cond_0
    instance-of p3, p1, Ljava/net/ProtocolException;

    .line 18
    .line 19
    if-eqz p3, :cond_1

    .line 20
    .line 21
    goto/16 :goto_5

    .line 22
    .line 23
    :cond_1
    instance-of p3, p1, Ljava/io/InterruptedIOException;

    .line 24
    .line 25
    if-eqz p3, :cond_2

    .line 26
    .line 27
    instance-of p1, p1, Ljava/net/SocketTimeoutException;

    .line 28
    .line 29
    if-eqz p1, :cond_f

    .line 30
    .line 31
    if-nez p4, :cond_f

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    instance-of p3, p1, Ljavax/net/ssl/SSLHandshakeException;

    .line 35
    .line 36
    if-eqz p3, :cond_3

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    instance-of p3, p3, Ljava/security/cert/CertificateException;

    .line 43
    .line 44
    if-eqz p3, :cond_3

    .line 45
    .line 46
    goto/16 :goto_5

    .line 47
    .line 48
    :cond_3
    instance-of p1, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    goto/16 :goto_5

    .line 53
    .line 54
    :cond_4
    :goto_0
    iget-object p1, p2, Lwx0;->p:Lp10;

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    iget p2, p1, Lp10;->f:I

    .line 60
    .line 61
    const/4 p3, 0x1

    .line 62
    if-nez p2, :cond_5

    .line 63
    .line 64
    iget p4, p1, Lp10;->g:I

    .line 65
    .line 66
    if-nez p4, :cond_5

    .line 67
    .line 68
    iget p4, p1, Lp10;->h:I

    .line 69
    .line 70
    if-nez p4, :cond_5

    .line 71
    .line 72
    move p1, p0

    .line 73
    goto :goto_4

    .line 74
    :cond_5
    iget-object p4, p1, Lp10;->i:Ly11;

    .line 75
    .line 76
    if-eqz p4, :cond_6

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_6
    const/4 p4, 0x0

    .line 80
    if-gt p2, p3, :cond_b

    .line 81
    .line 82
    iget p2, p1, Lp10;->g:I

    .line 83
    .line 84
    if-gt p2, p3, :cond_b

    .line 85
    .line 86
    iget p2, p1, Lp10;->h:I

    .line 87
    .line 88
    if-lez p2, :cond_7

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_7
    iget-object p2, p1, Lp10;->c:Lwx0;

    .line 92
    .line 93
    iget-object p2, p2, Lwx0;->q:Lzx0;

    .line 94
    .line 95
    if-nez p2, :cond_8

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_8
    monitor-enter p2

    .line 99
    :try_start_0
    iget v0, p2, Lzx0;->l:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    .line 101
    if-eqz v0, :cond_9

    .line 102
    .line 103
    monitor-exit p2

    .line 104
    goto :goto_1

    .line 105
    :cond_9
    :try_start_1
    iget-object v0, p2, Lzx0;->b:Ly11;

    .line 106
    .line 107
    iget-object v0, v0, Ly11;->a:Lt3;

    .line 108
    .line 109
    iget-object v0, v0, Lt3;->f:Led0;

    .line 110
    .line 111
    iget-object v1, p1, Lp10;->b:Lt3;

    .line 112
    .line 113
    iget-object v1, v1, Lt3;->f:Led0;

    .line 114
    .line 115
    invoke-static {v0, v1}, Ljg1;->a(Led0;Led0;)Z

    .line 116
    .line 117
    .line 118
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    if-nez v0, :cond_a

    .line 120
    .line 121
    monitor-exit p2

    .line 122
    goto :goto_1

    .line 123
    :cond_a
    :try_start_2
    iget-object p4, p2, Lzx0;->b:Ly11;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    .line 125
    monitor-exit p2

    .line 126
    goto :goto_1

    .line 127
    :catchall_0
    move-exception p0

    .line 128
    monitor-exit p2

    .line 129
    throw p0

    .line 130
    :cond_b
    :goto_1
    if-eqz p4, :cond_c

    .line 131
    .line 132
    iput-object p4, p1, Lp10;->i:Ly11;

    .line 133
    .line 134
    :goto_2
    move p1, p3

    .line 135
    goto :goto_4

    .line 136
    :cond_c
    iget-object p2, p1, Lp10;->d:Lf4;

    .line 137
    .line 138
    if-eqz p2, :cond_d

    .line 139
    .line 140
    invoke-virtual {p2}, Lf4;->c()Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-ne p2, p3, :cond_d

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_d
    iget-object p1, p1, Lp10;->e:Ls3;

    .line 148
    .line 149
    if-nez p1, :cond_e

    .line 150
    .line 151
    :goto_3
    goto :goto_2

    .line 152
    :cond_e
    invoke-virtual {p1}, Ls3;->j()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    :goto_4
    if-nez p1, :cond_10

    .line 157
    .line 158
    :cond_f
    :goto_5
    return p0

    .line 159
    :cond_10
    return p3
.end method
