.class public final Lfz1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Ljava/net/URL;

.field public final k:[B

.field public final l:Lcz1;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/util/Map;

.field public final synthetic o:Lhz1;


# direct methods
.method public constructor <init>(Lhz1;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Lcz1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lfz1;->o:Lhz1;

    .line 8
    .line 9
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Lbh;->h(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iput-object p3, p0, Lfz1;->j:Ljava/net/URL;

    .line 16
    .line 17
    iput-object p4, p0, Lfz1;->k:[B

    .line 18
    .line 19
    iput-object p6, p0, Lfz1;->l:Lcz1;

    .line 20
    .line 21
    iput-object p2, p0, Lfz1;->m:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p5, p0, Lfz1;->n:Ljava/util/Map;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    .line 1
    iget-object v2, p0, Lfz1;->l:Lcz1;

    .line 2
    .line 3
    const-string v1, "Error closing HTTP compressed POST connection output stream. appId"

    .line 4
    .line 5
    iget-object v3, p0, Lfz1;->m:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Lfz1;->o:Lhz1;

    .line 8
    .line 9
    iget-object v4, v0, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v4, Ly02;

    .line 12
    .line 13
    iget-object v5, v0, Let;->j:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v5, Ly02;

    .line 16
    .line 17
    iget-object v4, v4, Ly02;->p:Ls02;

    .line 18
    .line 19
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v4}, Ls02;->p()V

    .line 23
    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v6, 0x0

    .line 27
    :try_start_0
    iget-object v7, p0, Lfz1;->j:Ljava/net/URL;

    .line 28
    .line 29
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    instance-of v8, v7, Ljava/net/HttpURLConnection;

    .line 34
    .line 35
    if-eqz v8, :cond_4

    .line 36
    .line 37
    check-cast v7, Ljava/net/HttpURLConnection;

    .line 38
    .line 39
    invoke-virtual {v7, v4}, Ljava/net/URLConnection;->setDefaultUseCaches(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v8, v5, Ly02;->m:Lmt1;

    .line 43
    .line 44
    const v8, 0xea60

    .line 45
    .line 46
    .line 47
    invoke-virtual {v7, v8}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 48
    .line 49
    .line 50
    const v8, 0xee48

    .line 51
    .line 52
    .line 53
    invoke-virtual {v7, v8}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v7, v4}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 57
    .line 58
    .line 59
    const/4 v8, 0x1

    .line 60
    invoke-virtual {v7, v8}, Ljava/net/URLConnection;->setDoInput(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 61
    .line 62
    .line 63
    :try_start_1
    iget-object v9, p0, Lfz1;->n:Ljava/util/Map;

    .line 64
    .line 65
    if-eqz v9, :cond_0

    .line 66
    .line 67
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    if-eqz v10, :cond_0

    .line 80
    .line 81
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    check-cast v10, Ljava/util/Map$Entry;

    .line 86
    .line 87
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    check-cast v11, Ljava/lang/String;

    .line 92
    .line 93
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    check-cast v10, Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v7, v11, v10}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :catchall_0
    move-exception v0

    .line 104
    move-object v8, v3

    .line 105
    :goto_1
    move-object v9, v6

    .line 106
    goto/16 :goto_e

    .line 107
    .line 108
    :catch_0
    move-exception v0

    .line 109
    move-object v8, v3

    .line 110
    :goto_2
    move-object v9, v6

    .line 111
    goto/16 :goto_f

    .line 112
    .line 113
    :cond_0
    iget-object v9, p0, Lfz1;->k:[B

    .line 114
    .line 115
    if-eqz v9, :cond_1

    .line 116
    .line 117
    iget-object v0, v0, Ls92;->k:Lsa2;

    .line 118
    .line 119
    iget-object v0, v0, Lsa2;->p:Lva2;

    .line 120
    .line 121
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v9}, Lva2;->V([B)[B

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v9, v5, Ly02;->o:Lzy1;

    .line 129
    .line 130
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 131
    .line 132
    .line 133
    iget-object v9, v9, Lzy1;->w:Lso;

    .line 134
    .line 135
    const-string v10, "Uploading data. size"

    .line 136
    .line 137
    array-length v11, v0

    .line 138
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v12

    .line 142
    invoke-virtual {v9, v12, v10}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v7, v8}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 146
    .line 147
    .line 148
    const-string v8, "Content-Encoding"

    .line 149
    .line 150
    const-string v9, "gzip"

    .line 151
    .line 152
    invoke-virtual {v7, v8, v9}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v7, v11}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v7}, Ljava/net/URLConnection;->connect()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v7}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 162
    .line 163
    .line 164
    move-result-object v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    :try_start_2
    invoke-virtual {v8, v0}, Ljava/io/OutputStream;->write([B)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 169
    .line 170
    .line 171
    :cond_1
    move-object v8, v3

    .line 172
    goto :goto_8

    .line 173
    :catchall_1
    move-exception v0

    .line 174
    goto :goto_3

    .line 175
    :catch_1
    move-exception v0

    .line 176
    goto :goto_6

    .line 177
    :goto_3
    move-object v9, v8

    .line 178
    move-object v8, v3

    .line 179
    move v3, v4

    .line 180
    :goto_4
    move-object v4, v6

    .line 181
    move-object v6, v9

    .line 182
    :goto_5
    move-object v9, v7

    .line 183
    move-object v7, v0

    .line 184
    goto/16 :goto_11

    .line 185
    .line 186
    :goto_6
    move-object v9, v6

    .line 187
    move-object v6, v8

    .line 188
    move-object v8, v3

    .line 189
    move v3, v4

    .line 190
    :goto_7
    move-object v4, v0

    .line 191
    goto/16 :goto_14

    .line 192
    .line 193
    :goto_8
    :try_start_3
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 194
    .line 195
    .line 196
    move-result v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    .line 197
    move-object v9, v6

    .line 198
    :try_start_4
    invoke-virtual {v7}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 199
    .line 200
    .line 201
    move-result-object v6
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 202
    :try_start_5
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 203
    .line 204
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v7}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 208
    .line 209
    .line 210
    move-result-object v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 211
    const/16 v11, 0x400

    .line 212
    .line 213
    :try_start_6
    new-array v11, v11, [B

    .line 214
    .line 215
    :goto_9
    invoke-virtual {v10, v11}, Ljava/io/InputStream;->read([B)I

    .line 216
    .line 217
    .line 218
    move-result v12

    .line 219
    if-lez v12, :cond_2

    .line 220
    .line 221
    invoke-virtual {v0, v11, v4, v12}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 222
    .line 223
    .line 224
    goto :goto_9

    .line 225
    :catchall_2
    move-exception v0

    .line 226
    goto :goto_b

    .line 227
    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 228
    .line 229
    .line 230
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 231
    :try_start_7
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 232
    .line 233
    .line 234
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 235
    .line 236
    .line 237
    iget-object v7, v5, Ly02;->p:Ls02;

    .line 238
    .line 239
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 240
    .line 241
    .line 242
    move-object v5, v0

    .line 243
    new-instance v0, Ldz1;

    .line 244
    .line 245
    const/4 v4, 0x0

    .line 246
    iget-object v1, p0, Lfz1;->m:Ljava/lang/String;

    .line 247
    .line 248
    invoke-direct/range {v0 .. v6}, Ldz1;-><init>(Ljava/lang/String;Lcz1;ILjava/io/IOException;[BLjava/util/Map;)V

    .line 249
    .line 250
    .line 251
    :goto_a
    invoke-virtual {v7, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :catchall_3
    move-exception v0

    .line 256
    goto :goto_4

    .line 257
    :catch_2
    move-exception v0

    .line 258
    goto :goto_c

    .line 259
    :catchall_4
    move-exception v0

    .line 260
    move-object v10, v9

    .line 261
    :goto_b
    if-eqz v10, :cond_3

    .line 262
    .line 263
    :try_start_8
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 264
    .line 265
    .line 266
    :cond_3
    throw v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 267
    :goto_c
    move-object v4, v9

    .line 268
    move-object v9, v6

    .line 269
    move-object v6, v4

    .line 270
    goto :goto_7

    .line 271
    :catchall_5
    move-exception v0

    .line 272
    :goto_d
    move-object v4, v9

    .line 273
    move-object v6, v4

    .line 274
    goto :goto_5

    .line 275
    :catch_3
    move-exception v0

    .line 276
    move-object v4, v0

    .line 277
    move-object v6, v9

    .line 278
    goto/16 :goto_14

    .line 279
    .line 280
    :catchall_6
    move-exception v0

    .line 281
    goto/16 :goto_1

    .line 282
    .line 283
    :catch_4
    move-exception v0

    .line 284
    goto/16 :goto_2

    .line 285
    .line 286
    :goto_e
    move v3, v4

    .line 287
    goto :goto_d

    .line 288
    :goto_f
    move v3, v4

    .line 289
    move-object v6, v9

    .line 290
    goto :goto_7

    .line 291
    :catchall_7
    move-exception v0

    .line 292
    move-object v8, v3

    .line 293
    move-object v9, v6

    .line 294
    goto :goto_10

    .line 295
    :catch_5
    move-exception v0

    .line 296
    move-object v8, v3

    .line 297
    move-object v9, v6

    .line 298
    goto :goto_13

    .line 299
    :cond_4
    move-object v8, v3

    .line 300
    move-object v9, v6

    .line 301
    :try_start_9
    new-instance v0, Ljava/io/IOException;

    .line 302
    .line 303
    const-string v3, "Failed to obtain HTTP connection"

    .line 304
    .line 305
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    throw v0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_8

    .line 309
    :catchall_8
    move-exception v0

    .line 310
    goto :goto_10

    .line 311
    :catch_6
    move-exception v0

    .line 312
    goto :goto_13

    .line 313
    :goto_10
    move-object v7, v0

    .line 314
    move v3, v4

    .line 315
    move-object v4, v9

    .line 316
    move-object v6, v4

    .line 317
    :goto_11
    if-eqz v6, :cond_5

    .line 318
    .line 319
    :try_start_a
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    .line 320
    .line 321
    .line 322
    goto :goto_12

    .line 323
    :catch_7
    move-exception v0

    .line 324
    iget-object v6, v5, Ly02;->o:Lzy1;

    .line 325
    .line 326
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 327
    .line 328
    .line 329
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 330
    .line 331
    invoke-static {v8}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 332
    .line 333
    .line 334
    move-result-object v8

    .line 335
    invoke-virtual {v6, v1, v8, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    :cond_5
    :goto_12
    if-eqz v9, :cond_6

    .line 339
    .line 340
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 341
    .line 342
    .line 343
    :cond_6
    iget-object v8, v5, Ly02;->p:Ls02;

    .line 344
    .line 345
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 346
    .line 347
    .line 348
    new-instance v0, Ldz1;

    .line 349
    .line 350
    move-object v6, v4

    .line 351
    const/4 v4, 0x0

    .line 352
    const/4 v5, 0x0

    .line 353
    iget-object v1, p0, Lfz1;->m:Ljava/lang/String;

    .line 354
    .line 355
    invoke-direct/range {v0 .. v6}, Ldz1;-><init>(Ljava/lang/String;Lcz1;ILjava/io/IOException;[BLjava/util/Map;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v8, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 359
    .line 360
    .line 361
    throw v7

    .line 362
    :goto_13
    move v3, v4

    .line 363
    move-object v6, v9

    .line 364
    move-object v7, v6

    .line 365
    goto/16 :goto_7

    .line 366
    .line 367
    :goto_14
    if-eqz v6, :cond_7

    .line 368
    .line 369
    :try_start_b
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8

    .line 370
    .line 371
    .line 372
    goto :goto_15

    .line 373
    :catch_8
    move-exception v0

    .line 374
    iget-object v6, v5, Ly02;->o:Lzy1;

    .line 375
    .line 376
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 377
    .line 378
    .line 379
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 380
    .line 381
    invoke-static {v8}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 382
    .line 383
    .line 384
    move-result-object v8

    .line 385
    invoke-virtual {v6, v1, v8, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    :cond_7
    :goto_15
    if-eqz v7, :cond_8

    .line 389
    .line 390
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 391
    .line 392
    .line 393
    :cond_8
    iget-object v7, v5, Ly02;->p:Ls02;

    .line 394
    .line 395
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 396
    .line 397
    .line 398
    new-instance v0, Ldz1;

    .line 399
    .line 400
    const/4 v5, 0x0

    .line 401
    iget-object v1, p0, Lfz1;->m:Ljava/lang/String;

    .line 402
    .line 403
    move-object v6, v9

    .line 404
    invoke-direct/range {v0 .. v6}, Ldz1;-><init>(Ljava/lang/String;Lcz1;ILjava/io/IOException;[BLjava/util/Map;)V

    .line 405
    .line 406
    .line 407
    goto/16 :goto_a
.end method
