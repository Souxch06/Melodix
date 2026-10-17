.class public final Lka2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llc2;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmd1;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lka2;->b:Ljava/lang/Object;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lka2;->a:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lqo1;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lka2;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(Lkc2;)Ljava/lang/Object;
    .locals 12

    .line 1
    iget-object v0, p1, Lkc2;->d:Landroid/net/Uri;

    .line 2
    .line 3
    sget-object v1, Lyc2;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    sget-object v6, Lyc2;->a:Ljava/util/concurrent/atomic/AtomicLong;

    .line 22
    .line 23
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 24
    .line 25
    .line 26
    move-result-wide v6

    .line 27
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v8

    .line 35
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v9

    .line 43
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v10

    .line 51
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v11

    .line 55
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v11

    .line 59
    add-int/lit8 v8, v8, 0xf

    .line 60
    .line 61
    add-int/2addr v8, v9

    .line 62
    new-instance v9, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    add-int/lit8 v8, v8, 0x1

    .line 65
    .line 66
    add-int/2addr v8, v10

    .line 67
    add-int/lit8 v8, v8, 0x1

    .line 68
    .line 69
    add-int/2addr v8, v11

    .line 70
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 71
    .line 72
    .line 73
    const-string v8, ".mobstore_tmp-"

    .line 74
    .line 75
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, "-"

    .line 82
    .line 83
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v9, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v2, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iget-object v2, p1, Lkc2;->a:Lzc2;

    .line 130
    .line 131
    invoke-interface {v2, v1}, Lzc2;->b(Landroid/net/Uri;)Ljava/io/OutputStream;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    new-instance v4, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    iget-object v5, p1, Lkc2;->c:Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    const/4 v7, 0x0

    .line 150
    if-nez v6, :cond_2

    .line 151
    .line 152
    sget v6, Ljc2;->k:I

    .line 153
    .line 154
    new-instance v6, Ljava/util/ArrayList;

    .line 155
    .line 156
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    if-nez v8, :cond_1

    .line 168
    .line 169
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-nez v5, :cond_0

    .line 174
    .line 175
    new-instance v5, Ljc2;

    .line 176
    .line 177
    invoke-direct {v5, v3, v6}, Ljc2;-><init>(Ljava/io/OutputStream;Ljava/util/ArrayList;)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_0
    move-object v5, v7

    .line 182
    :goto_0
    if-eqz v5, :cond_2

    .line 183
    .line 184
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 193
    .line 194
    .line 195
    invoke-static {}, Lz0;->a()V

    .line 196
    .line 197
    .line 198
    :goto_1
    move-object v4, v7

    .line 199
    goto :goto_3

    .line 200
    :cond_2
    :goto_2
    iget-object p1, p1, Lkc2;->b:Lzd0;

    .line 201
    .line 202
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-nez v3, :cond_3

    .line 211
    .line 212
    invoke-static {v4}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 213
    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    if-eqz p1, :cond_b

    .line 221
    .line 222
    invoke-static {}, Lz0;->a()V

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :goto_3
    iget-object p1, p0, Lka2;->b:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast p1, [Lka2;

    .line 229
    .line 230
    const/4 v3, 0x0

    .line 231
    if-eqz p1, :cond_4

    .line 232
    .line 233
    aget-object p1, p1, v3

    .line 234
    .line 235
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    .line 237
    .line 238
    invoke-static {v4}, Ldl1;->i(Ljava/util/ArrayList;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    check-cast v5, Ljava/io/OutputStream;

    .line 243
    .line 244
    instance-of v6, v5, Luc2;

    .line 245
    .line 246
    if-eqz v6, :cond_4

    .line 247
    .line 248
    check-cast v5, Luc2;

    .line 249
    .line 250
    iput-object v5, p1, Lka2;->b:Ljava/lang/Object;

    .line 251
    .line 252
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    check-cast v5, Ljava/io/OutputStream;

    .line 257
    .line 258
    iput-object v5, p1, Lka2;->a:Ljava/lang/Object;

    .line 259
    .line 260
    :cond_4
    :try_start_0
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    check-cast p1, Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    .line 266
    :try_start_1
    iget-object v4, p0, Lka2;->a:Ljava/lang/Object;

    .line 267
    .line 268
    check-cast v4, Lqo1;

    .line 269
    .line 270
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 271
    .line 272
    .line 273
    check-cast v4, Lnp1;

    .line 274
    .line 275
    invoke-virtual {v4}, Lnp1;->k()I

    .line 276
    .line 277
    .line 278
    move-result v5

    .line 279
    sget-boolean v6, Lfp1;->b:Z

    .line 280
    .line 281
    const/16 v6, 0x1000

    .line 282
    .line 283
    if-le v5, v6, :cond_5

    .line 284
    .line 285
    move v5, v6

    .line 286
    :cond_5
    new-instance v6, Lcp1;

    .line 287
    .line 288
    invoke-direct {v6, p1, v5}, Lcp1;-><init>(Ljava/io/OutputStream;I)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v4, v6}, Lnp1;->d(Lfp1;)V

    .line 292
    .line 293
    .line 294
    iget v4, v6, Lcp1;->e:I

    .line 295
    .line 296
    if-lez v4, :cond_6

    .line 297
    .line 298
    invoke-virtual {v6}, Lcp1;->B()V

    .line 299
    .line 300
    .line 301
    :cond_6
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 302
    .line 303
    check-cast p0, [Lka2;

    .line 304
    .line 305
    if-eqz p0, :cond_8

    .line 306
    .line 307
    aget-object p0, p0, v3

    .line 308
    .line 309
    iget-object v3, p0, Lka2;->b:Ljava/lang/Object;

    .line 310
    .line 311
    check-cast v3, Luc2;

    .line 312
    .line 313
    if-eqz v3, :cond_7

    .line 314
    .line 315
    iget-object v3, p0, Lka2;->a:Ljava/lang/Object;

    .line 316
    .line 317
    check-cast v3, Ljava/io/OutputStream;

    .line 318
    .line 319
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 323
    .line 324
    check-cast p0, Luc2;

    .line 325
    .line 326
    iget-object p0, p0, Luc2;->j:Ljava/io/FileOutputStream;

    .line 327
    .line 328
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    invoke-virtual {p0}, Ljava/io/FileDescriptor;->sync()V

    .line 333
    .line 334
    .line 335
    goto :goto_4

    .line 336
    :cond_7
    new-instance p0, Lyk;

    .line 337
    .line 338
    const-string v0, "Cannot sync underlying stream"

    .line 339
    .line 340
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 344
    :catchall_0
    move-exception p0

    .line 345
    goto :goto_5

    .line 346
    :cond_8
    :goto_4
    :try_start_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 347
    .line 348
    .line 349
    invoke-interface {v2, v1, v0}, Lzc2;->d(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 350
    .line 351
    .line 352
    return-object v7

    .line 353
    :catch_0
    move-exception p0

    .line 354
    goto :goto_7

    .line 355
    :goto_5
    if-eqz p1, :cond_9

    .line 356
    .line 357
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 358
    .line 359
    .line 360
    goto :goto_6

    .line 361
    :catchall_1
    move-exception p1

    .line 362
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 363
    .line 364
    .line 365
    :cond_9
    :goto_6
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 366
    :goto_7
    :try_start_5
    invoke-interface {v2, v1}, Lzc2;->c(Landroid/net/Uri;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_1

    .line 367
    .line 368
    .line 369
    :catch_1
    instance-of p1, p0, Ljava/io/IOException;

    .line 370
    .line 371
    if-eqz p1, :cond_a

    .line 372
    .line 373
    check-cast p0, Ljava/io/IOException;

    .line 374
    .line 375
    throw p0

    .line 376
    :cond_a
    new-instance p1, Ljava/io/IOException;

    .line 377
    .line 378
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 379
    .line 380
    .line 381
    throw p1

    .line 382
    :cond_b
    invoke-static {v4}, Ldl1;->i(Ljava/util/ArrayList;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    check-cast p0, Ljava/io/OutputStream;

    .line 387
    .line 388
    throw v7
.end method

.method public b(ILjava/lang/String;Z)Lm92;
    .locals 2

    .line 1
    iget-object v0, p0, Lka2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lm92;

    .line 10
    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lmd1;

    .line 16
    .line 17
    invoke-virtual {p0, p2, p3}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    const/4 p2, 0x0

    .line 22
    invoke-virtual {v0, p1, p2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lm92;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    return-object v1
.end method

.method public c(IJLjava/lang/String;)Lm92;
    .locals 3

    .line 1
    iget-object v0, p0, Lka2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lm92;

    .line 10
    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lmd1;

    .line 16
    .line 17
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Lcb0;

    .line 20
    .line 21
    new-instance v2, Lg92;

    .line 22
    .line 23
    invoke-direct {v2, p4, p0, p2, p3}, Lg92;-><init>(Ljava/lang/String;Lcb0;J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v0, p1, p0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lm92;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_2
    return-object v1
.end method

.method public d(Ler0;Lc9;)V
    .locals 9

    .line 1
    new-instance v0, Ln42;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ln42;-><init>(Lc9;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lka2;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/util/TreeMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_3

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/Integer;

    .line 29
    .line 30
    iget-object v4, p2, Lc9;->l:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v4, Lcn1;

    .line 33
    .line 34
    invoke-virtual {v4}, Lcn1;->a()Lcn1;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v1, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lqt1;

    .line 43
    .line 44
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v3, p1, v5}, Lqt1;->a(Ler0;Ljava/util/List;)Lst1;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    instance-of v5, v3, Lrr1;

    .line 53
    .line 54
    const/4 v6, -0x1

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    check-cast v3, Lrr1;

    .line 58
    .line 59
    iget-object v3, v3, Lrr1;->j:Ljava/lang/Double;

    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 62
    .line 63
    .line 64
    move-result-wide v7

    .line 65
    invoke-static {v7, v8}, Lbe2;->S(D)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v3, v6

    .line 71
    :goto_1
    const/4 v5, 0x2

    .line 72
    if-eq v3, v5, :cond_2

    .line 73
    .line 74
    if-ne v3, v6, :cond_0

    .line 75
    .line 76
    :cond_2
    iput-object v4, p2, Lc9;->l:Ljava/lang/Object;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p0, Ljava/util/TreeMap;

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    :cond_4
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Ljava/lang/Integer;

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lqt1;

    .line 108
    .line 109
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v1, p1, v2}, Lqt1;->a(Ler0;Ljava/util/List;)Lst1;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    instance-of v2, v1, Lrr1;

    .line 118
    .line 119
    if-eqz v2, :cond_4

    .line 120
    .line 121
    check-cast v1, Lrr1;

    .line 122
    .line 123
    iget-object v1, v1, Lrr1;->j:Ljava/lang/Double;

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 126
    .line 127
    .line 128
    move-result-wide v1

    .line 129
    invoke-static {v1, v2}, Lbe2;->S(D)I

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_5
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;I)Lm92;
    .locals 3

    .line 1
    iget-object v0, p0, Lka2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 4
    .line 5
    invoke-virtual {v0, p3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lm92;

    .line 10
    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lmd1;

    .line 16
    .line 17
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Lcb0;

    .line 20
    .line 21
    new-instance v2, Lj92;

    .line 22
    .line 23
    invoke-direct {v2, p1, p0, p2}, Lj92;-><init>(Ljava/lang/String;Lcb0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v0, p3, p0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_1
    invoke-virtual {v0, p3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0, p3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lm92;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_2
    return-object v1
.end method
