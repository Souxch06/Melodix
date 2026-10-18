.class public final Lh52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Ljava/net/URL;

.field public final k:[B

.field public final l:Lf52;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/util/Map;

.field public final synthetic o:Li52;


# direct methods
.method public constructor <init>(Li52;Ljava/lang/String;Ljava/net/URL;[BLjava/util/HashMap;Lf52;)V
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
    iput-object p1, p0, Lh52;->o:Li52;

    .line 8
    .line 9
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p3, p0, Lh52;->j:Ljava/net/URL;

    .line 13
    .line 14
    iput-object p4, p0, Lh52;->k:[B

    .line 15
    .line 16
    iput-object p6, p0, Lh52;->l:Lf52;

    .line 17
    .line 18
    iput-object p2, p0, Lh52;->m:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p5, p0, Lh52;->n:Ljava/util/Map;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(ILjava/io/IOException;[BLjava/util/Map;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lh52;->o:Li52;

    .line 2
    .line 3
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 8
    .line 9
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lg52;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move v3, p1

    .line 16
    move-object v4, p2

    .line 17
    move-object v5, p3

    .line 18
    move-object v6, p4

    .line 19
    invoke-direct/range {v1 .. v6}, Lg52;-><init>(Lh52;ILjava/lang/Exception;[BLjava/util/Map;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final run()V
    .locals 12

    .line 1
    const-string v0, "Error closing HTTP compressed POST connection output stream. appId"

    .line 2
    .line 3
    iget-object v1, p0, Lh52;->m:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lh52;->o:Li52;

    .line 6
    .line 7
    iget-object v3, v2, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Ly02;

    .line 10
    .line 11
    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ly02;

    .line 14
    .line 15
    iget-object v3, v3, Ly02;->p:Ls02;

    .line 16
    .line 17
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ls02;->p()V

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    :try_start_0
    iget-object v5, p0, Lh52;->j:Ljava/net/URL;

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    instance-of v6, v5, Ljava/net/HttpURLConnection;

    .line 32
    .line 33
    if-eqz v6, :cond_4

    .line 34
    .line 35
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 36
    .line 37
    invoke-virtual {v5, v3}, Ljava/net/URLConnection;->setDefaultUseCaches(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v6, v2, Ly02;->m:Lmt1;

    .line 41
    .line 42
    const v6, 0xea60

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 46
    .line 47
    .line 48
    const v6, 0xee48

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 55
    .line 56
    .line 57
    const/4 v6, 0x1

    .line 58
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setDoInput(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    .line 59
    .line 60
    .line 61
    :try_start_1
    iget-object v7, p0, Lh52;->n:Ljava/util/Map;

    .line 62
    .line 63
    if-eqz v7, :cond_0

    .line 64
    .line 65
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v8

    .line 77
    if-eqz v8, :cond_0

    .line 78
    .line 79
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    check-cast v8, Ljava/util/Map$Entry;

    .line 84
    .line 85
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    check-cast v9, Ljava/lang/String;

    .line 90
    .line 91
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    check-cast v8, Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v5, v9, v8}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception v6

    .line 102
    goto/16 :goto_a

    .line 103
    .line 104
    :catch_0
    move-exception v6

    .line 105
    goto/16 :goto_b

    .line 106
    .line 107
    :cond_0
    iget-object v7, p0, Lh52;->k:[B
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .line 109
    if-eqz v7, :cond_1

    .line 110
    .line 111
    :try_start_2
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    .line 112
    .line 113
    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 114
    .line 115
    .line 116
    new-instance v9, Ljava/util/zip/GZIPOutputStream;

    .line 117
    .line 118
    invoke-direct {v9, v8}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v9, v7}, Ljava/io/OutputStream;->write([B)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 131
    .line 132
    .line 133
    move-result-object v7
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 134
    :try_start_3
    iget-object v8, v2, Ly02;->o:Lzy1;

    .line 135
    .line 136
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 137
    .line 138
    .line 139
    iget-object v8, v8, Lzy1;->w:Lso;

    .line 140
    .line 141
    const-string v9, "Uploading data. size"

    .line 142
    .line 143
    array-length v10, v7

    .line 144
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    invoke-virtual {v8, v11, v9}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 152
    .line 153
    .line 154
    const-string v6, "Content-Encoding"

    .line 155
    .line 156
    const-string v8, "gzip"

    .line 157
    .line 158
    invoke-virtual {v5, v6, v8}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v5, v10}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v5}, Ljava/net/URLConnection;->connect()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v5}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 168
    .line 169
    .line 170
    move-result-object v6
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 171
    :try_start_4
    invoke-virtual {v6, v7}, Ljava/io/OutputStream;->write([B)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :catchall_1
    move-exception v7

    .line 179
    goto :goto_1

    .line 180
    :catch_1
    move-exception v7

    .line 181
    goto :goto_2

    .line 182
    :goto_1
    move-object v8, v4

    .line 183
    goto/16 :goto_d

    .line 184
    .line 185
    :goto_2
    move-object v8, v4

    .line 186
    goto/16 :goto_10

    .line 187
    .line 188
    :catch_2
    move-exception v6

    .line 189
    :try_start_5
    iget-object v7, v2, Ly02;->o:Lzy1;

    .line 190
    .line 191
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 192
    .line 193
    .line 194
    iget-object v7, v7, Lzy1;->o:Lso;

    .line 195
    .line 196
    const-string v8, "Failed to gzip post request content"

    .line 197
    .line 198
    invoke-virtual {v7, v6, v8}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    throw v6

    .line 202
    :cond_1
    :goto_3
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 203
    .line 204
    .line 205
    move-result v6
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 206
    :try_start_6
    invoke-virtual {v5}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 207
    .line 208
    .line 209
    move-result-object v7
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 210
    :try_start_7
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    .line 211
    .line 212
    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 216
    .line 217
    .line 218
    move-result-object v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 219
    const/16 v10, 0x400

    .line 220
    .line 221
    :try_start_8
    new-array v10, v10, [B

    .line 222
    .line 223
    :goto_4
    invoke-virtual {v9, v10}, Ljava/io/InputStream;->read([B)I

    .line 224
    .line 225
    .line 226
    move-result v11

    .line 227
    if-lez v11, :cond_2

    .line 228
    .line 229
    invoke-virtual {v8, v10, v3, v11}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 230
    .line 231
    .line 232
    goto :goto_4

    .line 233
    :catchall_2
    move-exception v3

    .line 234
    goto :goto_5

    .line 235
    :cond_2
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 236
    .line 237
    .line 238
    move-result-object v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 239
    :try_start_9
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 240
    .line 241
    .line 242
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0, v6, v4, v3, v7}, Lh52;->a(ILjava/io/IOException;[BLjava/util/Map;)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :catchall_3
    move-exception v3

    .line 250
    goto :goto_6

    .line 251
    :catch_3
    move-exception v3

    .line 252
    goto :goto_7

    .line 253
    :catchall_4
    move-exception v3

    .line 254
    move-object v9, v4

    .line 255
    :goto_5
    if-eqz v9, :cond_3

    .line 256
    .line 257
    :try_start_a
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 258
    .line 259
    .line 260
    :cond_3
    throw v3
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 261
    :goto_6
    move-object v8, v7

    .line 262
    move-object v7, v3

    .line 263
    move v3, v6

    .line 264
    move-object v6, v4

    .line 265
    goto :goto_d

    .line 266
    :goto_7
    move-object v8, v7

    .line 267
    move-object v7, v3

    .line 268
    move v3, v6

    .line 269
    move-object v6, v4

    .line 270
    goto :goto_10

    .line 271
    :catchall_5
    move-exception v7

    .line 272
    move-object v8, v4

    .line 273
    move v3, v6

    .line 274
    :goto_8
    move-object v6, v8

    .line 275
    goto :goto_d

    .line 276
    :catch_4
    move-exception v7

    .line 277
    move-object v8, v4

    .line 278
    move v3, v6

    .line 279
    :goto_9
    move-object v6, v8

    .line 280
    goto :goto_10

    .line 281
    :goto_a
    move-object v8, v4

    .line 282
    move-object v7, v6

    .line 283
    goto :goto_8

    .line 284
    :goto_b
    move-object v8, v4

    .line 285
    move-object v7, v6

    .line 286
    goto :goto_9

    .line 287
    :catchall_6
    move-exception v5

    .line 288
    move-object v7, v5

    .line 289
    goto :goto_c

    .line 290
    :catch_5
    move-exception v5

    .line 291
    move-object v7, v5

    .line 292
    goto :goto_f

    .line 293
    :cond_4
    :try_start_b
    new-instance v5, Ljava/io/IOException;

    .line 294
    .line 295
    const-string v6, "Failed to obtain HTTP connection"

    .line 296
    .line 297
    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    throw v5
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 301
    :goto_c
    move-object v5, v4

    .line 302
    move-object v6, v5

    .line 303
    move-object v8, v6

    .line 304
    :goto_d
    if-eqz v6, :cond_5

    .line 305
    .line 306
    :try_start_c
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    .line 307
    .line 308
    .line 309
    goto :goto_e

    .line 310
    :catch_6
    move-exception v6

    .line 311
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 312
    .line 313
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 314
    .line 315
    .line 316
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 317
    .line 318
    invoke-static {v1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v2, v0, v1, v6}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    :cond_5
    :goto_e
    if-eqz v5, :cond_6

    .line 326
    .line 327
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 328
    .line 329
    .line 330
    :cond_6
    invoke-virtual {p0, v3, v4, v4, v8}, Lh52;->a(ILjava/io/IOException;[BLjava/util/Map;)V

    .line 331
    .line 332
    .line 333
    throw v7

    .line 334
    :goto_f
    move-object v5, v4

    .line 335
    move-object v6, v5

    .line 336
    move-object v8, v6

    .line 337
    :goto_10
    if-eqz v6, :cond_7

    .line 338
    .line 339
    :try_start_d
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_7

    .line 340
    .line 341
    .line 342
    goto :goto_11

    .line 343
    :catch_7
    move-exception v6

    .line 344
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 345
    .line 346
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 347
    .line 348
    .line 349
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 350
    .line 351
    invoke-static {v1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-virtual {v2, v0, v1, v6}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 356
    .line 357
    .line 358
    :cond_7
    :goto_11
    if-eqz v5, :cond_8

    .line 359
    .line 360
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 361
    .line 362
    .line 363
    :cond_8
    invoke-virtual {p0, v3, v7, v4, v8}, Lh52;->a(ILjava/io/IOException;[BLjava/util/Map;)V

    .line 364
    .line 365
    .line 366
    return-void
.end method
