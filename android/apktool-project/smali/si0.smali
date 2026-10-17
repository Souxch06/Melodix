.class public final synthetic Lsi0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:Lcom/melodix/music/LinkHandler;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/LinkHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lsi0;->j:Lcom/melodix/music/LinkHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lsi0;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lsi0;->l:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "spotify:search:"

    .line 4
    .line 5
    iget-object v2, v0, Lsi0;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, v0, Lsi0;->l:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v2, v3}, Lcom/melodix/music/LinkHandler;->w(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, v0, Lsi0;->j:Lcom/melodix/music/LinkHandler;

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1b

    .line 19
    .line 20
    :cond_0
    :try_start_0
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    const/4 v3, 0x0

    .line 26
    :goto_0
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    :cond_1
    sget-object v3, Lu00;->j:Lu00;

    .line 35
    .line 36
    :cond_2
    const-string v6, "artist"

    .line 37
    .line 38
    invoke-interface {v3, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v7, 0x0

    .line 43
    if-nez v6, :cond_4

    .line 44
    .line 45
    const-string v6, "/artist/"

    .line 46
    .line 47
    invoke-static {v2, v6, v7}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-eqz v6, :cond_3

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_3
    move v6, v7

    .line 55
    goto :goto_2

    .line 56
    :cond_4
    :goto_1
    move v6, v5

    .line 57
    :goto_2
    invoke-static {v3}, Lbl;->y(Ljava/util/List;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v8

    .line 69
    const-string v9, "-"

    .line 70
    .line 71
    if-eqz v8, :cond_7

    .line 72
    .line 73
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    move-object v10, v8

    .line 78
    check-cast v10, Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v10, v9}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    if-nez v11, :cond_5

    .line 85
    .line 86
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move v11, v7

    .line 90
    :goto_3
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result v12

    .line 94
    if-ge v11, v12, :cond_5

    .line 95
    .line 96
    invoke-virtual {v10, v11}, Ljava/lang/String;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result v12

    .line 100
    invoke-static {v12}, Ljava/lang/Character;->isLetter(C)Z

    .line 101
    .line 102
    .line 103
    move-result v12

    .line 104
    if-eqz v12, :cond_6

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_6
    add-int/lit8 v11, v11, 0x1

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_7
    const/4 v8, 0x0

    .line 111
    :goto_4
    check-cast v8, Ljava/lang/String;

    .line 112
    .line 113
    const-string v3, "+"

    .line 114
    .line 115
    const-string v10, " "

    .line 116
    .line 117
    if-eqz v8, :cond_8

    .line 118
    .line 119
    invoke-static {v8, v9, v10}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    invoke-static {v8, v3, v10}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    invoke-static {v8}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v8

    .line 135
    goto :goto_5

    .line 136
    :cond_8
    const/4 v8, 0x0

    .line 137
    :goto_5
    :try_start_1
    new-instance v11, Ljava/net/URL;

    .line 138
    .line 139
    invoke-direct {v11, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 143
    .line 144
    .line 145
    move-result-object v11

    .line 146
    invoke-static {v11}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v11

    .line 150
    check-cast v11, Ljava/net/URLConnection;

    .line 151
    .line 152
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    check-cast v11, Ljava/net/HttpURLConnection;

    .line 156
    .line 157
    invoke-virtual {v11, v5}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 158
    .line 159
    .line 160
    const-string v12, "GET"

    .line 161
    .line 162
    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    const/16 v12, 0x1f40

    .line 166
    .line 167
    invoke-virtual {v11, v12}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v11, v12}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 171
    .line 172
    .line 173
    const-string v12, "User-Agent"

    .line 174
    .line 175
    const-string v13, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    .line 176
    .line 177
    invoke-virtual {v11, v12, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const-string v12, "Accept"

    .line 181
    .line 182
    const-string v13, "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"

    .line 183
    .line 184
    invoke-virtual {v11, v12, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    const-string v12, "Accept-Language"

    .line 188
    .line 189
    const-string v13, "en-US,en;q=0.9"

    .line 190
    .line 191
    invoke-virtual {v11, v12, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v11}, Ljava/net/URLConnection;->connect()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v11}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v12

    .line 201
    const-string v13, "gzip"

    .line 202
    .line 203
    invoke-virtual {v13, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result v12

    .line 207
    if-eqz v12, :cond_9

    .line 208
    .line 209
    new-instance v12, Ljava/util/zip/GZIPInputStream;

    .line 210
    .line 211
    invoke-virtual {v11}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 212
    .line 213
    .line 214
    move-result-object v13

    .line 215
    invoke-direct {v12, v13}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 216
    .line 217
    .line 218
    goto :goto_6

    .line 219
    :catch_1
    move-exception v0

    .line 220
    goto/16 :goto_18

    .line 221
    .line 222
    :cond_9
    invoke-virtual {v11}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 223
    .line 224
    .line 225
    move-result-object v12

    .line 226
    :goto_6
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 227
    .line 228
    .line 229
    sget-object v13, Lyj;->a:Ljava/nio/charset/Charset;

    .line 230
    .line 231
    new-instance v14, Ljava/io/InputStreamReader;

    .line 232
    .line 233
    invoke-direct {v14, v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 234
    .line 235
    .line 236
    new-instance v12, Ljava/io/BufferedReader;

    .line 237
    .line 238
    const/16 v13, 0x2000

    .line 239
    .line 240
    invoke-direct {v12, v14, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 241
    .line 242
    .line 243
    :try_start_2
    invoke-static {v12}, Las;->r(Ljava/io/Reader;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 247
    :try_start_3
    invoke-interface {v12}, Ljava/io/Closeable;->close()V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 251
    .line 252
    .line 253
    const-string v11, "<meta[^>]*property=[\"\']og:title[\"\'][^>]*content=[\"\']([^\"\']+)[\"\']"

    .line 254
    .line 255
    const/16 v12, 0x42

    .line 256
    .line 257
    invoke-static {v11, v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 258
    .line 259
    .line 260
    move-result-object v11

    .line 261
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v11, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 265
    .line 266
    .line 267
    move-result-object v11

    .line 268
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v11, v7}, Ljava/util/regex/Matcher;->find(I)Z

    .line 272
    .line 273
    .line 274
    move-result v14

    .line 275
    if-nez v14, :cond_a

    .line 276
    .line 277
    const/4 v14, 0x0

    .line 278
    goto :goto_7

    .line 279
    :cond_a
    new-instance v14, Ls7;

    .line 280
    .line 281
    invoke-direct {v14, v11, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    :goto_7
    if-nez v14, :cond_c

    .line 285
    .line 286
    const-string v11, "<meta[^>]*content=[\"\']([^\"\']+)[\"\'][^>]*property=[\"\']og:title[\"\']"

    .line 287
    .line 288
    invoke-static {v11, v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 289
    .line 290
    .line 291
    move-result-object v11

    .line 292
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v11, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 296
    .line 297
    .line 298
    move-result-object v11

    .line 299
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v11, v7}, Ljava/util/regex/Matcher;->find(I)Z

    .line 303
    .line 304
    .line 305
    move-result v14

    .line 306
    if-nez v14, :cond_b

    .line 307
    .line 308
    const/4 v14, 0x0

    .line 309
    goto :goto_8

    .line 310
    :cond_b
    new-instance v14, Ls7;

    .line 311
    .line 312
    invoke-direct {v14, v11, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    :cond_c
    :goto_8
    const-string v11, "<meta[^>]*property=[\"\']og:description[\"\'][^>]*content=[\"\']([^\"\']+)[\"\']"

    .line 316
    .line 317
    invoke-static {v11, v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 318
    .line 319
    .line 320
    move-result-object v11

    .line 321
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v11, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 325
    .line 326
    .line 327
    move-result-object v11

    .line 328
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v11, v7}, Ljava/util/regex/Matcher;->find(I)Z

    .line 332
    .line 333
    .line 334
    move-result v15

    .line 335
    if-nez v15, :cond_d

    .line 336
    .line 337
    const/4 v15, 0x0

    .line 338
    goto :goto_9

    .line 339
    :cond_d
    new-instance v15, Ls7;

    .line 340
    .line 341
    invoke-direct {v15, v11, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    :goto_9
    if-nez v15, :cond_f

    .line 345
    .line 346
    const-string v11, "<meta[^>]*content=[\"\']([^\"\']+)[\"\'][^>]*property=[\"\']og:description[\"\']"

    .line 347
    .line 348
    invoke-static {v11, v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 349
    .line 350
    .line 351
    move-result-object v11

    .line 352
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v11, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 356
    .line 357
    .line 358
    move-result-object v11

    .line 359
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v11, v7}, Ljava/util/regex/Matcher;->find(I)Z

    .line 363
    .line 364
    .line 365
    move-result v15

    .line 366
    if-nez v15, :cond_e

    .line 367
    .line 368
    const/4 v15, 0x0

    .line 369
    goto :goto_a

    .line 370
    :cond_e
    new-instance v15, Ls7;

    .line 371
    .line 372
    invoke-direct {v15, v11, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 373
    .line 374
    .line 375
    :cond_f
    :goto_a
    const-string v11, ""

    .line 376
    .line 377
    if-eqz v14, :cond_10

    .line 378
    .line 379
    :try_start_4
    invoke-virtual {v14}, Ls7;->v()Ljava/util/List;

    .line 380
    .line 381
    .line 382
    move-result-object v14

    .line 383
    check-cast v14, Ltl0;

    .line 384
    .line 385
    invoke-virtual {v14, v5}, Ltl0;->get(I)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v14

    .line 389
    check-cast v14, Ljava/lang/String;

    .line 390
    .line 391
    if-eqz v14, :cond_10

    .line 392
    .line 393
    invoke-static {v14}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 394
    .line 395
    .line 396
    move-result-object v14

    .line 397
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v14

    .line 401
    if-nez v14, :cond_11

    .line 402
    .line 403
    :cond_10
    move-object v14, v11

    .line 404
    :cond_11
    if-eqz v15, :cond_13

    .line 405
    .line 406
    invoke-virtual {v15}, Ls7;->v()Ljava/util/List;

    .line 407
    .line 408
    .line 409
    move-result-object v15

    .line 410
    check-cast v15, Ltl0;

    .line 411
    .line 412
    invoke-virtual {v15, v5}, Ltl0;->get(I)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v15

    .line 416
    check-cast v15, Ljava/lang/String;

    .line 417
    .line 418
    if-eqz v15, :cond_13

    .line 419
    .line 420
    invoke-static {v15}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 421
    .line 422
    .line 423
    move-result-object v15

    .line 424
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v15

    .line 428
    if-nez v15, :cond_12

    .line 429
    .line 430
    goto :goto_b

    .line 431
    :cond_12
    move-object v11, v15

    .line 432
    :cond_13
    :goto_b
    const-string v15, "<link[^>]*rel=[\"\']canonical[\"\'][^>]*href=[\"\']([^\"\']+)[\"\']"

    .line 433
    .line 434
    invoke-static {v15, v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 435
    .line 436
    .line 437
    move-result-object v15

    .line 438
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v15, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 442
    .line 443
    .line 444
    move-result-object v15

    .line 445
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v15, v7}, Ljava/util/regex/Matcher;->find(I)Z

    .line 449
    .line 450
    .line 451
    move-result v16

    .line 452
    if-nez v16, :cond_14

    .line 453
    .line 454
    const/4 v0, 0x0

    .line 455
    goto :goto_c

    .line 456
    :cond_14
    new-instance v0, Ls7;

    .line 457
    .line 458
    invoke-direct {v0, v15, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 459
    .line 460
    .line 461
    :goto_c
    if-eqz v0, :cond_15

    .line 462
    .line 463
    invoke-virtual {v0}, Ls7;->v()Ljava/util/List;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    check-cast v0, Ltl0;

    .line 468
    .line 469
    invoke-virtual {v0, v5}, Ltl0;->get(I)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    check-cast v0, Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 474
    .line 475
    goto :goto_d

    .line 476
    :cond_15
    const/4 v0, 0x0

    .line 477
    :goto_d
    if-eqz v0, :cond_19

    .line 478
    .line 479
    :try_start_5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 484
    .line 485
    .line 486
    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 487
    goto :goto_e

    .line 488
    :catch_2
    const/4 v0, 0x0

    .line 489
    :goto_e
    if-eqz v0, :cond_19

    .line 490
    .line 491
    :try_start_6
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 496
    .line 497
    .line 498
    move-result v15

    .line 499
    if-eqz v15, :cond_18

    .line 500
    .line 501
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object v15

    .line 505
    move-object v5, v15

    .line 506
    check-cast v5, Ljava/lang/String;

    .line 507
    .line 508
    invoke-static {v5, v9}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    move-result v17

    .line 512
    if-nez v17, :cond_17

    .line 513
    .line 514
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 515
    .line 516
    .line 517
    :goto_10
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 518
    .line 519
    .line 520
    move-result v12

    .line 521
    if-ge v7, v12, :cond_17

    .line 522
    .line 523
    invoke-virtual {v5, v7}, Ljava/lang/String;->charAt(I)C

    .line 524
    .line 525
    .line 526
    move-result v12

    .line 527
    invoke-static {v12}, Ljava/lang/Character;->isLetter(C)Z

    .line 528
    .line 529
    .line 530
    move-result v12

    .line 531
    if-eqz v12, :cond_16

    .line 532
    .line 533
    goto :goto_11

    .line 534
    :cond_16
    add-int/lit8 v7, v7, 0x1

    .line 535
    .line 536
    goto :goto_10

    .line 537
    :cond_17
    const/4 v5, 0x1

    .line 538
    const/4 v7, 0x0

    .line 539
    const/16 v12, 0x42

    .line 540
    .line 541
    goto :goto_f

    .line 542
    :cond_18
    const/4 v15, 0x0

    .line 543
    :goto_11
    check-cast v15, Ljava/lang/String;

    .line 544
    .line 545
    if-eqz v15, :cond_19

    .line 546
    .line 547
    invoke-static {v15, v9, v10}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    invoke-static {v0, v3, v10}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v0

    .line 555
    invoke-static {v0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 563
    goto :goto_12

    .line 564
    :cond_19
    const/4 v0, 0x0

    .line 565
    :goto_12
    const-string v3, "<title>([^<]+)</title>"

    .line 566
    .line 567
    if-eqz v6, :cond_20

    .line 568
    .line 569
    :try_start_7
    invoke-virtual {v4, v14}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v5

    .line 573
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 574
    .line 575
    .line 576
    move-result v6

    .line 577
    if-nez v6, :cond_1b

    .line 578
    .line 579
    const/16 v6, 0x42

    .line 580
    .line 581
    invoke-static {v3, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 582
    .line 583
    .line 584
    move-result-object v3

    .line 585
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 586
    .line 587
    .line 588
    invoke-virtual {v3, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 589
    .line 590
    .line 591
    move-result-object v3

    .line 592
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 593
    .line 594
    .line 595
    const/4 v6, 0x0

    .line 596
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->find(I)Z

    .line 597
    .line 598
    .line 599
    move-result v6

    .line 600
    if-nez v6, :cond_1a

    .line 601
    .line 602
    const/4 v6, 0x0

    .line 603
    goto :goto_13

    .line 604
    :cond_1a
    new-instance v6, Ls7;

    .line 605
    .line 606
    invoke-direct {v6, v3, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    :goto_13
    if-eqz v6, :cond_1b

    .line 610
    .line 611
    invoke-virtual {v6}, Ls7;->v()Ljava/util/List;

    .line 612
    .line 613
    .line 614
    move-result-object v3

    .line 615
    check-cast v3, Ltl0;

    .line 616
    .line 617
    const/4 v5, 0x1

    .line 618
    invoke-virtual {v3, v5}, Ltl0;->get(I)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v3

    .line 622
    check-cast v3, Ljava/lang/String;

    .line 623
    .line 624
    invoke-virtual {v4, v3}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v5

    .line 628
    :cond_1b
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 629
    .line 630
    .line 631
    move-result v3

    .line 632
    if-lez v3, :cond_1c

    .line 633
    .line 634
    new-instance v0, Ljava/lang/StringBuilder;

    .line 635
    .line 636
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 637
    .line 638
    .line 639
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    .line 641
    .line 642
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    .line 644
    .line 645
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v3

    .line 649
    goto/16 :goto_1b

    .line 650
    .line 651
    :cond_1c
    if-eqz v0, :cond_1e

    .line 652
    .line 653
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 654
    .line 655
    .line 656
    move-result v3

    .line 657
    if-nez v3, :cond_1d

    .line 658
    .line 659
    goto :goto_14

    .line 660
    :cond_1d
    new-instance v3, Ljava/lang/StringBuilder;

    .line 661
    .line 662
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 666
    .line 667
    .line 668
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    goto/16 :goto_1b

    .line 676
    .line 677
    :cond_1e
    :goto_14
    if-eqz v8, :cond_27

    .line 678
    .line 679
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 680
    .line 681
    .line 682
    move-result v0

    .line 683
    if-nez v0, :cond_1f

    .line 684
    .line 685
    goto/16 :goto_19

    .line 686
    .line 687
    :cond_1f
    new-instance v0, Ljava/lang/StringBuilder;

    .line 688
    .line 689
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 690
    .line 691
    .line 692
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v3

    .line 702
    goto/16 :goto_1b

    .line 703
    .line 704
    :cond_20
    const-string v0, "Listen to (.*?) by (.*?)(?:\\.|\\n|$)"

    .line 705
    .line 706
    const/16 v6, 0x42

    .line 707
    .line 708
    invoke-static {v0, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 709
    .line 710
    .line 711
    move-result-object v0

    .line 712
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 713
    .line 714
    .line 715
    invoke-virtual {v0, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 716
    .line 717
    .line 718
    move-result-object v0

    .line 719
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 720
    .line 721
    .line 722
    const/4 v6, 0x0

    .line 723
    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->find(I)Z

    .line 724
    .line 725
    .line 726
    move-result v5

    .line 727
    if-nez v5, :cond_21

    .line 728
    .line 729
    const/4 v5, 0x0

    .line 730
    goto :goto_15

    .line 731
    :cond_21
    new-instance v5, Ls7;

    .line 732
    .line 733
    invoke-direct {v5, v0, v11}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 734
    .line 735
    .line 736
    :goto_15
    if-eqz v5, :cond_22

    .line 737
    .line 738
    invoke-virtual {v5}, Ls7;->v()Ljava/util/List;

    .line 739
    .line 740
    .line 741
    move-result-object v0

    .line 742
    check-cast v0, Ltl0;

    .line 743
    .line 744
    const/4 v6, 0x1

    .line 745
    invoke-virtual {v0, v6}, Ltl0;->get(I)Ljava/lang/Object;

    .line 746
    .line 747
    .line 748
    move-result-object v0

    .line 749
    check-cast v0, Ljava/lang/String;

    .line 750
    .line 751
    invoke-virtual {v4, v0}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move-result-object v0

    .line 755
    invoke-virtual {v5}, Ls7;->v()Ljava/util/List;

    .line 756
    .line 757
    .line 758
    move-result-object v5

    .line 759
    check-cast v5, Ltl0;

    .line 760
    .line 761
    const/4 v6, 0x2

    .line 762
    invoke-virtual {v5, v6}, Ltl0;->get(I)Ljava/lang/Object;

    .line 763
    .line 764
    .line 765
    move-result-object v5

    .line 766
    check-cast v5, Ljava/lang/String;

    .line 767
    .line 768
    invoke-virtual {v4, v5}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 769
    .line 770
    .line 771
    move-result-object v5

    .line 772
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 773
    .line 774
    .line 775
    move-result v6

    .line 776
    if-lez v6, :cond_22

    .line 777
    .line 778
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 779
    .line 780
    .line 781
    move-result v6

    .line 782
    if-lez v6, :cond_22

    .line 783
    .line 784
    new-instance v3, Ljava/lang/StringBuilder;

    .line 785
    .line 786
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 787
    .line 788
    .line 789
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    .line 791
    .line 792
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    .line 794
    .line 795
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 796
    .line 797
    .line 798
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 799
    .line 800
    .line 801
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 802
    .line 803
    .line 804
    move-result-object v3

    .line 805
    goto/16 :goto_1b

    .line 806
    .line 807
    :cond_22
    invoke-virtual {v4, v14}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 808
    .line 809
    .line 810
    move-result-object v0

    .line 811
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 812
    .line 813
    .line 814
    move-result v5

    .line 815
    if-nez v5, :cond_24

    .line 816
    .line 817
    const/16 v6, 0x42

    .line 818
    .line 819
    invoke-static {v3, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 820
    .line 821
    .line 822
    move-result-object v3

    .line 823
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 824
    .line 825
    .line 826
    invoke-virtual {v3, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 827
    .line 828
    .line 829
    move-result-object v3

    .line 830
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 831
    .line 832
    .line 833
    const/4 v6, 0x0

    .line 834
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->find(I)Z

    .line 835
    .line 836
    .line 837
    move-result v5

    .line 838
    if-nez v5, :cond_23

    .line 839
    .line 840
    const/4 v5, 0x0

    .line 841
    goto :goto_16

    .line 842
    :cond_23
    new-instance v5, Ls7;

    .line 843
    .line 844
    invoke-direct {v5, v3, v13}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    :goto_16
    if-eqz v5, :cond_24

    .line 848
    .line 849
    invoke-virtual {v5}, Ls7;->v()Ljava/util/List;

    .line 850
    .line 851
    .line 852
    move-result-object v0

    .line 853
    check-cast v0, Ltl0;

    .line 854
    .line 855
    const/4 v5, 0x1

    .line 856
    invoke-virtual {v0, v5}, Ltl0;->get(I)Ljava/lang/Object;

    .line 857
    .line 858
    .line 859
    move-result-object v0

    .line 860
    check-cast v0, Ljava/lang/String;

    .line 861
    .line 862
    invoke-virtual {v4, v0}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 863
    .line 864
    .line 865
    move-result-object v0

    .line 866
    :cond_24
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 867
    .line 868
    .line 869
    move-result v3

    .line 870
    if-lez v3, :cond_27

    .line 871
    .line 872
    invoke-virtual {v4, v11}, Lcom/melodix/music/LinkHandler;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 873
    .line 874
    .line 875
    move-result-object v3

    .line 876
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 877
    .line 878
    .line 879
    move-result v5

    .line 880
    if-lez v5, :cond_25

    .line 881
    .line 882
    const/4 v5, 0x1

    .line 883
    invoke-static {v0, v3, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 884
    .line 885
    .line 886
    move-result v6

    .line 887
    if-nez v6, :cond_25

    .line 888
    .line 889
    new-instance v5, Ljava/lang/StringBuilder;

    .line 890
    .line 891
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 892
    .line 893
    .line 894
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 895
    .line 896
    .line 897
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 898
    .line 899
    .line 900
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 904
    .line 905
    .line 906
    move-result-object v0

    .line 907
    goto :goto_17

    .line 908
    :cond_25
    const-string v3, " - "

    .line 909
    .line 910
    invoke-static {v0, v3, v10}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 911
    .line 912
    .line 913
    move-result-object v0

    .line 914
    :goto_17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 915
    .line 916
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 917
    .line 918
    .line 919
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 920
    .line 921
    .line 922
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 923
    .line 924
    .line 925
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 926
    .line 927
    .line 928
    move-result-object v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 929
    goto :goto_1b

    .line 930
    :catchall_0
    move-exception v0

    .line 931
    move-object v3, v0

    .line 932
    :try_start_8
    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 933
    :catchall_1
    move-exception v0

    .line 934
    :try_start_9
    invoke-static {v12, v3}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 935
    .line 936
    .line 937
    throw v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 938
    :goto_18
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 939
    .line 940
    .line 941
    if-eqz v8, :cond_27

    .line 942
    .line 943
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 944
    .line 945
    .line 946
    move-result v0

    .line 947
    if-nez v0, :cond_26

    .line 948
    .line 949
    goto :goto_19

    .line 950
    :cond_26
    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 951
    .line 952
    .line 953
    move-result-object v3

    .line 954
    goto :goto_1b

    .line 955
    :cond_27
    :goto_19
    if-eqz v8, :cond_29

    .line 956
    .line 957
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 958
    .line 959
    .line 960
    move-result v0

    .line 961
    if-nez v0, :cond_28

    .line 962
    .line 963
    goto :goto_1a

    .line 964
    :cond_28
    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 965
    .line 966
    .line 967
    move-result-object v2

    .line 968
    :cond_29
    :goto_1a
    move-object v3, v2

    .line 969
    :goto_1b
    new-instance v0, Lti0;

    .line 970
    .line 971
    const/4 v5, 0x1

    .line 972
    invoke-direct {v0, v4, v3, v5}, Lti0;-><init>(Lcom/melodix/music/LinkHandler;Ljava/lang/String;I)V

    .line 973
    .line 974
    .line 975
    invoke-virtual {v4, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 976
    .line 977
    .line 978
    sget-object v0, Lwe1;->a:Lwe1;

    .line 979
    .line 980
    return-object v0
.end method
