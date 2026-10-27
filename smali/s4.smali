.class public final synthetic Ls4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0

    .line 10
    iput p2, p0, Ls4;->j:I

    iput-object p1, p0, Ls4;->k:Lcom/melodix/music/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;Z)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    iput p2, p0, Ls4;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ls4;->k:Lcom/melodix/music/MainActivity;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    iget v0, p0, Ls4;->j:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    const/16 v3, 0x8

    .line 6
    .line 7
    const v4, 0x7f110115

    .line 8
    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    iget-object v6, p0, Ls4;->k:Lcom/melodix/music/MainActivity;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    iget-object v8, p0, Ls4;->k:Lcom/melodix/music/MainActivity;

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 22
    .line 23
    const-string v3, "https://api.github.com/repos/Souxch06/Melodix/releases/latest"

    .line 24
    .line 25
    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/net/URLConnection;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-object v3, v0

    .line 42
    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 43
    .line 44
    :try_start_1
    const-string v0, "GET"

    .line 45
    .line 46
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v5}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 50
    .line 51
    .line 52
    const-string v0, "Cache-Control"

    .line 53
    .line 54
    const-string v4, "no-cache"

    .line 55
    .line 56
    invoke-virtual {v3, v0, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "User-Agent"

    .line 60
    .line 61
    const-string v4, "Melodix-Updater"

    .line 62
    .line 63
    invoke-virtual {v3, v0, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const/16 v0, 0x1f40

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/net/URLConnection;->connect()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/16 v4, 0xc8

    .line 82
    .line 83
    if-ne v0, v4, :cond_9

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    sget-object v4, Lyj;->a:Ljava/nio/charset/Charset;

    .line 93
    .line 94
    new-instance v6, Ljava/io/InputStreamReader;

    .line 95
    .line 96
    invoke-direct {v6, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 97
    .line 98
    .line 99
    new-instance v4, Ljava/io/BufferedReader;

    .line 100
    .line 101
    const/16 v0, 0x2000

    .line 102
    .line 103
    invoke-direct {v4, v6, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    .line 105
    .line 106
    :try_start_2
    invoke-static {v4}, Las;->r(Ljava/io/Reader;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 110
    :try_start_3
    invoke-interface {v4}, Ljava/io/Closeable;->close()V

    .line 111
    .line 112
    .line 113
    new-instance v4, Lorg/json/JSONObject;

    .line 114
    .line 115
    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const-string v0, "assets"

    .line 119
    .line 120
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v9, Lhz0;

    .line 125
    .line 126
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object p0, v9, Lhz0;->j:Ljava/lang/Object;

    .line 130
    .line 131
    new-instance v11, Lhz0;

    .line 132
    .line 133
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object p0, v11, Lhz0;->j:Ljava/lang/Object;

    .line 137
    .line 138
    new-instance v12, Lgz0;

    .line 139
    .line 140
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 141
    .line 142
    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    move v6, v5

    .line 150
    :goto_0
    if-ge v6, v4, :cond_2

    .line 151
    .line 152
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    const-string v10, "name"

    .line 157
    .line 158
    invoke-virtual {v7, v10, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v10

    .line 162
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 163
    .line 164
    .line 165
    const-string v13, ".apk"

    .line 166
    .line 167
    invoke-virtual {v10, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v13

    .line 171
    if-eqz v13, :cond_1

    .line 172
    .line 173
    const-string v0, "browser_download_url"

    .line 174
    .line 175
    invoke-virtual {v7, v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    iput-object v0, v9, Lhz0;->j:Ljava/lang/Object;

    .line 183
    .line 184
    iput-object v10, v11, Lhz0;->j:Ljava/lang/Object;

    .line 185
    .line 186
    const-string v0, "size"

    .line 187
    .line 188
    const-wide/16 v13, 0x0

    .line 189
    .line 190
    invoke-virtual {v7, v0, v13, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 191
    .line 192
    .line 193
    move-result-wide v6

    .line 194
    iput-wide v6, v12, Lgz0;->j:J

    .line 195
    .line 196
    const-string v0, "Melodix-v([\\d\\.]+)-([a-f0-9]+)\\.apk"

    .line 197
    .line 198
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->find(I)Z

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    if-nez v4, :cond_0

    .line 217
    .line 218
    goto :goto_1

    .line 219
    :cond_0
    new-instance v1, Ls7;

    .line 220
    .line 221
    invoke-direct {v1, v0, v10}, Ls7;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :goto_1
    if-eqz v1, :cond_2

    .line 225
    .line 226
    invoke-virtual {v1}, Ls7;->v()Ljava/util/List;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    check-cast v0, Ltl0;

    .line 231
    .line 232
    invoke-virtual {v0, v2}, Ltl0;->get(I)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v1}, Ls7;->v()Ljava/util/List;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, Ltl0;

    .line 243
    .line 244
    const/4 v4, 0x2

    .line 245
    invoke-virtual {v1, v4}, Ltl0;->get(I)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    check-cast v1, Ljava/lang/String;

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :catchall_0
    move-exception v0

    .line 253
    move-object p0, v0

    .line 254
    move-object v1, v3

    .line 255
    goto/16 :goto_8

    .line 256
    .line 257
    :catch_0
    move-object v1, v3

    .line 258
    goto/16 :goto_9

    .line 259
    .line 260
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_2
    move-object v0, p0

    .line 264
    move-object v1, v0

    .line 265
    :goto_2
    const-string v4, "0.0.0"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 266
    .line 267
    :try_start_4
    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 268
    .line 269
    .line 270
    move-result-object v6

    .line 271
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v7

    .line 275
    invoke-virtual {v6, v7, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 276
    .line 277
    .line 278
    move-result-object v6

    .line 279
    iget-object v6, v6, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 280
    .line 281
    if-nez v6, :cond_3

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_3
    move-object v4, v6

    .line 285
    :catch_1
    :goto_3
    :try_start_5
    invoke-virtual {v8}, Le6;->getResources()Landroid/content/res/Resources;

    .line 286
    .line 287
    .line 288
    move-result-object v6

    .line 289
    const-string v7, "git_commit_hash"

    .line 290
    .line 291
    const-string v10, "string"

    .line 292
    .line 293
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v13

    .line 297
    invoke-virtual {v6, v7, v10, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    move-result v6
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 301
    const-string v7, "unknown"

    .line 302
    .line 303
    if-eqz v6, :cond_4

    .line 304
    .line 305
    :try_start_6
    invoke-virtual {v8, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v6

    .line 309
    goto :goto_4

    .line 310
    :cond_4
    move-object v6, v7

    .line 311
    :goto_4
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 312
    .line 313
    .line 314
    iget-object v10, v9, Lhz0;->j:Ljava/lang/Object;

    .line 315
    .line 316
    invoke-static {v10}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 320
    .line 321
    .line 322
    move-result v10

    .line 323
    if-lez v10, :cond_9

    .line 324
    .line 325
    iget-object v10, v9, Lhz0;->j:Ljava/lang/Object;

    .line 326
    .line 327
    check-cast v10, Ljava/lang/CharSequence;

    .line 328
    .line 329
    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    .line 330
    .line 331
    .line 332
    move-result v10

    .line 333
    if-lez v10, :cond_9

    .line 334
    .line 335
    iget-object v10, v11, Lhz0;->j:Ljava/lang/Object;

    .line 336
    .line 337
    check-cast v10, Ljava/lang/CharSequence;

    .line 338
    .line 339
    invoke-interface {v10}, Ljava/lang/CharSequence;->length()I

    .line 340
    .line 341
    .line 342
    move-result v10

    .line 343
    if-lez v10, :cond_9

    .line 344
    .line 345
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 346
    .line 347
    .line 348
    move-result v10

    .line 349
    if-lez v10, :cond_5

    .line 350
    .line 351
    new-instance v10, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v13, " ("

    .line 360
    .line 361
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v13, ")"

    .line 368
    .line 369
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v10

    .line 376
    goto :goto_5

    .line 377
    :cond_5
    move-object v10, v0

    .line 378
    :goto_5
    const-string v13, "MelodixPrefs"

    .line 379
    .line 380
    invoke-virtual {v8, v13, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 381
    .line 382
    .line 383
    move-result-object v13

    .line 384
    const-string v14, "skipped_version"

    .line 385
    .line 386
    invoke-interface {v13, v14, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-virtual {v10, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 391
    .line 392
    .line 393
    move-result v13

    .line 394
    if-nez v13, :cond_9

    .line 395
    .line 396
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    if-eqz p0, :cond_6

    .line 401
    .line 402
    goto :goto_7

    .line 403
    :cond_6
    invoke-static {v4, v0}, Lju1;->o(Ljava/lang/String;Ljava/lang/String;)Z

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v0

    .line 411
    if-eqz v0, :cond_7

    .line 412
    .line 413
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-lez v0, :cond_7

    .line 418
    .line 419
    invoke-virtual {v1, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-nez v0, :cond_7

    .line 424
    .line 425
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-nez v0, :cond_7

    .line 430
    .line 431
    invoke-virtual {v1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v0

    .line 435
    if-nez v0, :cond_7

    .line 436
    .line 437
    goto :goto_6

    .line 438
    :cond_7
    move v2, v5

    .line 439
    :goto_6
    if-nez p0, :cond_8

    .line 440
    .line 441
    if-eqz v2, :cond_9

    .line 442
    .line 443
    :cond_8
    new-instance v7, Lsf1;

    .line 444
    .line 445
    invoke-direct/range {v7 .. v12}, Lsf1;-><init>(Lcom/melodix/music/MainActivity;Lhz0;Ljava/lang/String;Lhz0;Lgz0;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v8, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 449
    .line 450
    .line 451
    :cond_9
    :goto_7
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 452
    .line 453
    .line 454
    goto :goto_a

    .line 455
    :catchall_1
    move-exception v0

    .line 456
    move-object p0, v0

    .line 457
    :try_start_7
    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 458
    :catchall_2
    move-exception v0

    .line 459
    :try_start_8
    invoke-static {v4, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 460
    .line 461
    .line 462
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 463
    :catchall_3
    move-exception v0

    .line 464
    move-object p0, v0

    .line 465
    :goto_8
    if-eqz v1, :cond_a

    .line 466
    .line 467
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 468
    .line 469
    .line 470
    :cond_a
    throw p0

    .line 471
    :catch_2
    :goto_9
    if-eqz v1, :cond_b

    .line 472
    .line 473
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 474
    .line 475
    .line 476
    :cond_b
    :goto_a
    return-void

    .line 477
    :pswitch_0
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 478
    .line 479
    invoke-virtual {v6, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object p0

    .line 483
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 484
    .line 485
    .line 486
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    return-void

    .line 490
    :pswitch_1
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 491
    .line 492
    invoke-virtual {v6, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object p0

    .line 496
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 497
    .line 498
    .line 499
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    return-void

    .line 503
    :pswitch_2
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 504
    .line 505
    invoke-virtual {v6, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 510
    .line 511
    .line 512
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    return-void

    .line 516
    :pswitch_3
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 517
    .line 518
    invoke-virtual {v6, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 523
    .line 524
    .line 525
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    return-void

    .line 529
    :pswitch_4
    sget p0, Lcom/melodix/music/SettingsActivity;->G:I

    .line 530
    .line 531
    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 532
    .line 533
    .line 534
    move-result-object p0

    .line 535
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 536
    .line 537
    .line 538
    move-result-object p0

    .line 539
    new-instance v0, Ls4;

    .line 540
    .line 541
    const/16 v1, 0x9

    .line 542
    .line 543
    invoke-direct {v0, v6, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 544
    .line 545
    .line 546
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 547
    .line 548
    .line 549
    return-void

    .line 550
    :pswitch_5
    sget p0, Lcom/melodix/music/SettingsActivity;->G:I

    .line 551
    .line 552
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->C()V

    .line 553
    .line 554
    .line 555
    return-void

    .line 556
    :pswitch_6
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->G()V

    .line 557
    .line 558
    .line 559
    return-void

    .line 560
    :pswitch_7
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 561
    .line 562
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->A()V

    .line 563
    .line 564
    .line 565
    return-void

    .line 566
    :pswitch_8
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 567
    .line 568
    if-eqz p0, :cond_c

    .line 569
    .line 570
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 571
    .line 572
    .line 573
    :cond_c
    return-void

    .line 574
    :pswitch_9
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 575
    .line 576
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->s()V

    .line 577
    .line 578
    .line 579
    return-void

    .line 580
    :pswitch_a
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 581
    .line 582
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->H()V

    .line 583
    .line 584
    .line 585
    return-void

    .line 586
    :pswitch_b
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 587
    .line 588
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->J:Z

    .line 589
    .line 590
    const/16 v0, 0x80

    .line 591
    .line 592
    if-eqz p0, :cond_d

    .line 593
    .line 594
    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 595
    .line 596
    .line 597
    move-result-object p0

    .line 598
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 599
    .line 600
    .line 601
    goto :goto_b

    .line 602
    :cond_d
    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 603
    .line 604
    .line 605
    move-result-object p0

    .line 606
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 607
    .line 608
    .line 609
    :goto_b
    return-void

    .line 610
    :pswitch_c
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 611
    .line 612
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 613
    .line 614
    invoke-static {}, Lm9;->i()Z

    .line 615
    .line 616
    .line 617
    move-result p0

    .line 618
    if-nez p0, :cond_e

    .line 619
    .line 620
    invoke-virtual {v6, v2}, Lcom/melodix/music/MainActivity;->D(Z)V

    .line 621
    .line 622
    .line 623
    goto :goto_d

    .line 624
    :cond_e
    new-instance p0, Landroid/content/Intent;

    .line 625
    .line 626
    const-class v0, Lcom/melodix/music/WebService;

    .line 627
    .line 628
    invoke-direct {p0, v6, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 629
    .line 630
    .line 631
    :try_start_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 632
    .line 633
    const/16 v1, 0x1a

    .line 634
    .line 635
    if-lt v0, v1, :cond_f

    .line 636
    .line 637
    invoke-static {v6, p0}, Li1;->u(Lcom/melodix/music/MainActivity;Landroid/content/Intent;)V

    .line 638
    .line 639
    .line 640
    goto :goto_c

    .line 641
    :cond_f
    invoke-virtual {v6, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    .line 642
    .line 643
    .line 644
    :catch_3
    :goto_c
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->C()V

    .line 645
    .line 646
    .line 647
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->G()V

    .line 648
    .line 649
    .line 650
    sput-boolean v5, Lcom/melodix/music/MainActivity;->l0:Z

    .line 651
    .line 652
    :goto_d
    return-void

    .line 653
    :pswitch_d
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 654
    .line 655
    if-eqz p0, :cond_10

    .line 656
    .line 657
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 658
    .line 659
    .line 660
    move-result-object p0

    .line 661
    if-eqz p0, :cond_10

    .line 662
    .line 663
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 664
    .line 665
    .line 666
    :cond_10
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 667
    .line 668
    if-eqz p0, :cond_11

    .line 669
    .line 670
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 671
    .line 672
    .line 673
    :cond_11
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 674
    .line 675
    const/high16 v0, 0x3f800000    # 1.0f

    .line 676
    .line 677
    if-eqz p0, :cond_12

    .line 678
    .line 679
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 680
    .line 681
    .line 682
    :cond_12
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 683
    .line 684
    if-eqz p0, :cond_13

    .line 685
    .line 686
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 687
    .line 688
    .line 689
    :cond_13
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 690
    .line 691
    if-eqz p0, :cond_14

    .line 692
    .line 693
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 694
    .line 695
    .line 696
    move-result-object p0

    .line 697
    if-eqz p0, :cond_14

    .line 698
    .line 699
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 700
    .line 701
    .line 702
    :cond_14
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 703
    .line 704
    if-eqz p0, :cond_15

    .line 705
    .line 706
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 707
    .line 708
    .line 709
    :cond_15
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 710
    .line 711
    if-eqz p0, :cond_16

    .line 712
    .line 713
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 714
    .line 715
    .line 716
    move-result-object p0

    .line 717
    if-eqz p0, :cond_16

    .line 718
    .line 719
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 720
    .line 721
    .line 722
    :cond_16
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 723
    .line 724
    if-eqz p0, :cond_17

    .line 725
    .line 726
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 727
    .line 728
    .line 729
    :cond_17
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 730
    .line 731
    if-eqz p0, :cond_18

    .line 732
    .line 733
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 734
    .line 735
    .line 736
    move-result-object p0

    .line 737
    if-eqz p0, :cond_18

    .line 738
    .line 739
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 740
    .line 741
    .line 742
    :cond_18
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 743
    .line 744
    if-eqz p0, :cond_19

    .line 745
    .line 746
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 747
    .line 748
    .line 749
    :cond_19
    return-void

    .line 750
    :pswitch_e
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 751
    .line 752
    sget-boolean p0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 753
    .line 754
    if-eqz p0, :cond_1a

    .line 755
    .line 756
    sget-boolean p0, Lju1;->w:Z

    .line 757
    .line 758
    if-nez p0, :cond_1a

    .line 759
    .line 760
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 761
    .line 762
    if-eqz p0, :cond_1a

    .line 763
    .line 764
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 765
    .line 766
    .line 767
    :cond_1a
    iget-object p0, v6, Lcom/melodix/music/MainActivity;->Q:Landroid/widget/TextView;

    .line 768
    .line 769
    if-eqz p0, :cond_1b

    .line 770
    .line 771
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 772
    .line 773
    .line 774
    :cond_1b
    return-void

    .line 775
    :pswitch_f
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 776
    .line 777
    const p0, 0x7f11009e

    .line 778
    .line 779
    .line 780
    invoke-virtual {v6, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 781
    .line 782
    .line 783
    move-result-object p0

    .line 784
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 785
    .line 786
    .line 787
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 788
    .line 789
    .line 790
    return-void

    .line 791
    :pswitch_10
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 792
    .line 793
    const p0, 0x7f11009d

    .line 794
    .line 795
    .line 796
    invoke-virtual {v6, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object p0

    .line 800
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 801
    .line 802
    .line 803
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    return-void

    .line 807
    :pswitch_11
    invoke-virtual {v6}, Lcom/melodix/music/MainActivity;->s()V

    .line 808
    .line 809
    .line 810
    return-void

    .line 811
    :pswitch_12
    sget p0, Lcom/melodix/music/MainActivity;->h0:I

    .line 812
    .line 813
    invoke-virtual {v6, v5}, Lcom/melodix/music/MainActivity;->v(Z)V

    .line 814
    .line 815
    .line 816
    return-void

    .line 817
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
