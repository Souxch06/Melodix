.class public final Loc2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzc2;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lrc2;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lnt;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Loc2;->c:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Lrc2;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Loc2;->b:Lrc2;

    .line 17
    .line 18
    iget-object p1, p1, Lnt;->k:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p1, p0, Loc2;->a:Landroid/content/Context;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;)Ltc2;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Loc2;->g(Landroid/net/Uri;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Loc2;->f(Landroid/net/Uri;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Les0;->p(Landroid/net/Uri;)Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ltc2;

    .line 16
    .line 17
    new-instance v0, Ljava/io/FileInputStream;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p1, v0, p0}, Ltc2;-><init>(Ljava/io/FileInputStream;Ljava/io/File;)V

    .line 23
    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_0
    new-instance p0, Lyk;

    .line 27
    .line 28
    const-string p1, "Android backend cannot perform remote operations without a remote backend"

    .line 29
    .line 30
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0
.end method

.method public final b(Landroid/net/Uri;)Ljava/io/OutputStream;
    .locals 1

    .line 1
    iget-object v0, p0, Loc2;->b:Lrc2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Loc2;->f(Landroid/net/Uri;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrc2;->b(Landroid/net/Uri;)Ljava/io/OutputStream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final c(Landroid/net/Uri;)V
    .locals 1

    .line 1
    iget-object v0, p0, Loc2;->b:Lrc2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Loc2;->f(Landroid/net/Uri;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrc2;->c(Landroid/net/Uri;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Loc2;->f(Landroid/net/Uri;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p2}, Loc2;->f(Landroid/net/Uri;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Loc2;->b:Lrc2;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lrc2;->d(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "android"

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 9

    .line 1
    invoke-virtual {p0, p1}, Loc2;->g(Landroid/net/Uri;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_c

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Loc2;->g(Landroid/net/Uri;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_a

    .line 14
    .line 15
    iget-object v0, p0, Loc2;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "android"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_9

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_8

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_7

    .line 48
    .line 49
    new-instance v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    const/4 v6, 0x1

    .line 69
    sparse-switch v5, :sswitch_data_0

    .line 70
    .line 71
    .line 72
    goto/16 :goto_6

    .line 73
    .line 74
    :sswitch_0
    const-string v1, "directboot-files"

    .line 75
    .line 76
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_6

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    goto/16 :goto_3

    .line 91
    .line 92
    :sswitch_1
    const-string v1, "directboot-cache"

    .line 93
    .line 94
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    invoke-virtual {v0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    goto/16 :goto_3

    .line 109
    .line 110
    :sswitch_2
    const-string v1, "managed"

    .line 111
    .line 112
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    invoke-static {v0}, Ldl1;->t(Landroid/content/Context;)Ljava/io/File;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string v1, "managed"

    .line 123
    .line 124
    new-instance v4, Ljava/io/File;

    .line 125
    .line 126
    invoke-direct {v4, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    const/4 v1, 0x3

    .line 134
    if-lt p1, v1, :cond_3

    .line 135
    .line 136
    const/4 p1, 0x2

    .line 137
    :try_start_0
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Ljava/lang/String;

    .line 142
    .line 143
    sget-object v1, Lnc2;->a:Landroid/accounts/Account;

    .line 144
    .line 145
    const-string v1, "shared"

    .line 146
    .line 147
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_0

    .line 152
    .line 153
    sget-object p1, Lnc2;->a:Landroid/accounts/Account;

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_0
    const/16 v1, 0x3a

    .line 157
    .line 158
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-ltz v1, :cond_1

    .line 163
    .line 164
    move v5, v6

    .line 165
    goto :goto_0

    .line 166
    :cond_1
    move v5, v2

    .line 167
    :goto_0
    const-string v7, "Malformed account"

    .line 168
    .line 169
    new-array v8, v2, [Ljava/lang/Object;

    .line 170
    .line 171
    invoke-static {v5, v7, v8}, Lrs0;->r(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    add-int/2addr v1, v6

    .line 179
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    new-instance v1, Landroid/accounts/Account;

    .line 184
    .line 185
    invoke-direct {v1, p1, v5}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    .line 187
    .line 188
    move-object p1, v1

    .line 189
    :goto_1
    sget-object v1, Lnc2;->a:Landroid/accounts/Account;

    .line 190
    .line 191
    invoke-virtual {v1, p1}, Landroid/accounts/Account;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_2

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_2
    new-instance p0, Lyk;

    .line 199
    .line 200
    const-string p1, "AccountManager cannot be null"

    .line 201
    .line 202
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p0

    .line 206
    :catch_0
    move-exception p0

    .line 207
    new-instance p1, Lyk;

    .line 208
    .line 209
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    throw p1

    .line 213
    :cond_3
    :goto_2
    move-object p1, v4

    .line 214
    goto :goto_3

    .line 215
    :sswitch_3
    const-string v1, "files"

    .line 216
    .line 217
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_6

    .line 222
    .line 223
    invoke-static {v0}, Ldl1;->t(Landroid/content/Context;)Ljava/io/File;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    goto :goto_3

    .line 228
    :sswitch_4
    const-string v1, "cache"

    .line 229
    .line 230
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-eqz v1, :cond_6

    .line 235
    .line 236
    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    goto :goto_3

    .line 241
    :sswitch_5
    const-string v5, "external"

    .line 242
    .line 243
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    if-eqz v4, :cond_6

    .line 248
    .line 249
    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    :goto_3
    new-instance v1, Ljava/io/File;

    .line 254
    .line 255
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    invoke-virtual {v3, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    invoke-static {v4, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    invoke-direct {v1, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-static {v0}, Lk42;->t(Landroid/content/Context;)Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    if-nez p1, :cond_b

    .line 277
    .line 278
    iget-object p1, p0, Loc2;->c:Ljava/lang/Object;

    .line 279
    .line 280
    monitor-enter p1

    .line 281
    :try_start_1
    iget-object v3, p0, Loc2;->d:Ljava/lang/String;

    .line 282
    .line 283
    if-nez v3, :cond_4

    .line 284
    .line 285
    invoke-virtual {v0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-static {v0}, Ldl1;->t(Landroid/content/Context;)Ljava/io/File;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    iput-object v3, p0, Loc2;->d:Ljava/lang/String;

    .line 302
    .line 303
    goto :goto_4

    .line 304
    :catchall_0
    move-exception p0

    .line 305
    goto :goto_5

    .line 306
    :cond_4
    :goto_4
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 312
    .line 313
    .line 314
    move-result p0

    .line 315
    if-eqz p0, :cond_5

    .line 316
    .line 317
    goto :goto_7

    .line 318
    :cond_5
    new-instance p0, Lyk;

    .line 319
    .line 320
    const-string p1, "Cannot access credential-protected data from direct boot"

    .line 321
    .line 322
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    throw p0

    .line 326
    :goto_5
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 327
    throw p0

    .line 328
    :cond_6
    :goto_6
    new-instance p0, Lyk;

    .line 329
    .line 330
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    const-string v0, "Path must start with a valid logical location: %s"

    .line 335
    .line 336
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    throw p0

    .line 344
    :cond_7
    new-instance p0, Lyk;

    .line 345
    .line 346
    const-string p1, "Did not expect uri to have query"

    .line 347
    .line 348
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    throw p0

    .line 352
    :cond_8
    new-instance p0, Lyk;

    .line 353
    .line 354
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    const-string v0, "Path must start with a valid logical location: %s"

    .line 359
    .line 360
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    throw p0

    .line 368
    :cond_9
    new-instance p0, Lyk;

    .line 369
    .line 370
    const-string p1, "Scheme must be \'android\'"

    .line 371
    .line 372
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    throw p0

    .line 376
    :cond_a
    const-string p0, "operation is not permitted in other authorities."

    .line 377
    .line 378
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    :cond_b
    :goto_7
    new-instance p0, Landroid/net/Uri$Builder;

    .line 382
    .line 383
    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    .line 384
    .line 385
    .line 386
    const-string p1, "file"

    .line 387
    .line 388
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    const-string p1, ""

    .line 393
    .line 394
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    const-string p1, "/"

    .line 399
    .line 400
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    sget-object p1, Lzd0;->k:Lwd0;

    .line 405
    .line 406
    const-string p1, "initialCapacity"

    .line 407
    .line 408
    const/4 v0, 0x4

    .line 409
    invoke-static {v0, p1}, Lkp1;->a(ILjava/lang/String;)V

    .line 410
    .line 411
    .line 412
    new-array p1, v0, [Ljava/lang/Object;

    .line 413
    .line 414
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 419
    .line 420
    .line 421
    invoke-static {v2, p1}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 422
    .line 423
    .line 424
    move-result-object p1

    .line 425
    invoke-static {p1}, Lxc2;->a(Lmz0;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->encodedFragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    return-object p0

    .line 438
    :cond_c
    new-instance p0, Lyk;

    .line 439
    .line 440
    const-string p1, "Operation across authorities is not allowed."

    .line 441
    .line 442
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    throw p0

    .line 446
    nop

    .line 447
    :sswitch_data_0
    .sparse-switch
        -0x6c869c35 -> :sswitch_5
        0x5a0af82 -> :sswitch_4
        0x5ceba77 -> :sswitch_3
        0x31c90f9f -> :sswitch_2
        0x3aec0d90 -> :sswitch_1
        0x3b1a1885 -> :sswitch_0
    .end sparse-switch
.end method

.method public final g(Landroid/net/Uri;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Loc2;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method
