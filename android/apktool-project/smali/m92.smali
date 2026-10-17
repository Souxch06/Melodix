.class public abstract Lm92;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsa1;


# instance fields
.field public final j:Ljava/lang/String;

.field public final k:Lcb0;

.field public volatile l:I

.field public m:Lmd1;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm92;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lm92;->k:Lcb0;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lm92;->l:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public abstract a()Ljava/lang/Object;
.end method

.method public abstract b(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract c(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract d()Ljava/lang/Object;
.end method

.method public abstract e(Ljava/lang/Object;)V
.end method

.method public final get()Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lrs0;->e:Lab0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Le52;->j:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Lab0;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Lab0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lrs0;->e:Lab0;

    .line 14
    .line 15
    :cond_0
    sget-object v0, Le52;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/content/Context;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_11

    .line 25
    .line 26
    sget-object v3, Le52;->l:Le52;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :try_start_0
    const-string v3, "Given application context does not implement GeneratedComponentManager: "

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    new-instance v5, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    add-int/lit8 v6, v6, 0x48

    .line 62
    .line 63
    new-instance v7, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-direct {v5, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw v5
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :catch_0
    sget-object v3, Le52;->j:Ljava/lang/Object;

    .line 84
    .line 85
    monitor-enter v3

    .line 86
    :try_start_1
    sget-object v4, Le52;->l:Le52;

    .line 87
    .line 88
    if-eqz v4, :cond_2

    .line 89
    .line 90
    sget-object v0, Le52;->l:Le52;

    .line 91
    .line 92
    monitor-exit v3

    .line 93
    :goto_0
    move-object v3, v0

    .line 94
    goto :goto_1

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    goto/16 :goto_b

    .line 97
    .line 98
    :cond_2
    new-instance v4, Lnt;

    .line 99
    .line 100
    invoke-direct {v4, v0, v1}, Lnt;-><init>(Landroid/content/Context;I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4}, Lnt;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Le52;

    .line 108
    .line 109
    sput-object v0, Le52;->l:Le52;

    .line 110
    .line 111
    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    .line 112
    .line 113
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    const-string v6, "Application doesn\'t implement PhenotypeApplication interface, falling back to globally set context. See go/phenotype-flag#process-stable-init for more info."

    .line 118
    .line 119
    const/4 v7, 0x0

    .line 120
    new-array v7, v7, [Ljava/lang/Object;

    .line 121
    .line 122
    invoke-static {v4, v5, v2, v6, v7}, Lbv;->r(Ljava/util/logging/Level;Ljava/util/concurrent/Executor;Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    goto :goto_0

    .line 127
    :goto_1
    iget v0, p0, Lm92;->l:I

    .line 128
    .line 129
    const/4 v4, -0x1

    .line 130
    if-eq v0, v4, :cond_3

    .line 131
    .line 132
    iget-object v5, p0, Lm92;->m:Lmd1;

    .line 133
    .line 134
    iget-object v5, v5, Lmd1;->k:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 137
    .line 138
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-ge v0, v5, :cond_10

    .line 143
    .line 144
    :cond_3
    monitor-enter p0

    .line 145
    :try_start_2
    iget v0, p0, Lm92;->l:I

    .line 146
    .line 147
    if-ne v0, v4, :cond_4

    .line 148
    .line 149
    invoke-static {}, Le52;->b()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    iget-object v4, p0, Lm92;->k:Lcb0;

    .line 156
    .line 157
    invoke-virtual {v4, v3}, Lcb0;->c(Le52;)Lta2;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    iget-object v5, v4, Lta2;->f:Lmd1;

    .line 162
    .line 163
    iput-object v5, p0, Lm92;->m:Lmd1;

    .line 164
    .line 165
    goto :goto_2

    .line 166
    :catchall_1
    move-exception v0

    .line 167
    goto/16 :goto_a

    .line 168
    .line 169
    :cond_4
    move-object v4, v2

    .line 170
    :goto_2
    iget-object v5, p0, Lm92;->m:Lmd1;

    .line 171
    .line 172
    iget-object v5, v5, Lmd1;->k:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v5, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 175
    .line 176
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-ge v0, v5, :cond_f

    .line 181
    .line 182
    invoke-static {}, Le52;->b()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    .line 187
    .line 188
    iget-object v0, v3, Le52;->b:Landroid/content/Context;

    .line 189
    .line 190
    invoke-static {v0}, Lcg1;->D(Landroid/content/Context;)Lhs0;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lhs0;->b()Z

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    if-eqz v6, :cond_7

    .line 199
    .line 200
    invoke-virtual {v0}, Lhs0;->a()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    check-cast v6, Lw42;

    .line 205
    .line 206
    invoke-static {}, Lz42;->a()Landroid/net/Uri;

    .line 207
    .line 208
    .line 209
    move-result-object v7

    .line 210
    iget-object v8, p0, Lm92;->j:Ljava/lang/String;

    .line 211
    .line 212
    if-eqz v7, :cond_5

    .line 213
    .line 214
    iget-object v6, v6, Lw42;->a:Lu71;

    .line 215
    .line 216
    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    invoke-virtual {v6, v7, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v6

    .line 224
    check-cast v6, Lu71;

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_5
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 228
    .line 229
    .line 230
    move-object v6, v2

    .line 231
    :goto_3
    if-nez v6, :cond_6

    .line 232
    .line 233
    move-object v6, v2

    .line 234
    goto :goto_4

    .line 235
    :cond_6
    invoke-virtual {v6, v8, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v6

    .line 239
    check-cast v6, Ljava/lang/String;

    .line 240
    .line 241
    :goto_4
    if-nez v6, :cond_8

    .line 242
    .line 243
    :cond_7
    :goto_5
    move-object v6, v2

    .line 244
    goto :goto_6

    .line 245
    :cond_8
    const-string v7, "Invalid Phenotype flag value for flag "
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 246
    .line 247
    :try_start_3
    invoke-virtual {p0, v6}, Lm92;->b(Ljava/lang/String;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v6
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 251
    goto :goto_6

    .line 252
    :catch_1
    :try_start_4
    iget-object v6, p0, Lm92;->j:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    goto :goto_5

    .line 258
    :goto_6
    if-nez v4, :cond_9

    .line 259
    .line 260
    iget-object v4, p0, Lm92;->k:Lcb0;

    .line 261
    .line 262
    invoke-virtual {v4, v3}, Lcb0;->c(Le52;)Lta2;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    :cond_9
    iget-object v7, v4, Lta2;->c:Ljava/lang/String;

    .line 267
    .line 268
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 269
    .line 270
    const/16 v9, 0x1a

    .line 271
    .line 272
    if-lt v8, v9, :cond_a

    .line 273
    .line 274
    iget-object v8, v3, Le52;->b:Landroid/content/Context;

    .line 275
    .line 276
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v8

    .line 280
    const-string v9, "com.android.vending"

    .line 281
    .line 282
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v8

    .line 286
    if-nez v8, :cond_a

    .line 287
    .line 288
    const-string v8, "com.google.android.gms.measurement#"

    .line 289
    .line 290
    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 291
    .line 292
    .line 293
    move-result v8

    .line 294
    if-nez v8, :cond_a

    .line 295
    .line 296
    invoke-virtual {v3}, Le52;->a()Lho0;

    .line 297
    .line 298
    .line 299
    move-result-object v8

    .line 300
    new-instance v9, Lab2;

    .line 301
    .line 302
    invoke-direct {v9, v3, v7}, Lab2;-><init>(Le52;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v8, v9}, Lho0;->a(Lab2;)Lqj0;

    .line 306
    .line 307
    .line 308
    move-result-object v3

    .line 309
    new-instance v7, Lgb2;

    .line 310
    .line 311
    invoke-direct {v7, v3}, Lgb2;-><init>(Lqj0;)V

    .line 312
    .line 313
    .line 314
    sget-object v8, Ltx;->j:Ltx;

    .line 315
    .line 316
    invoke-interface {v3, v7, v8}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 317
    .line 318
    .line 319
    :cond_a
    const-string v3, "Invalid Phenotype flag value for flag "

    .line 320
    .line 321
    iget-object v7, p0, Lm92;->j:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v4}, Lta2;->a()Lai;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    iget-object v4, v4, Lai;->d:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast v4, Lrz0;

    .line 330
    .line 331
    invoke-virtual {v4, v7}, Lrz0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 335
    if-nez v4, :cond_b

    .line 336
    .line 337
    goto :goto_7

    .line 338
    :cond_b
    :try_start_5
    invoke-virtual {p0, v4}, Lm92;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v2
    :try_end_5
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 342
    goto :goto_7

    .line 343
    :catch_2
    :try_start_6
    iget-object v4, p0, Lm92;->j:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    :goto_7
    invoke-virtual {v0}, Lhs0;->b()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-ne v1, v0, :cond_c

    .line 353
    .line 354
    goto :goto_8

    .line 355
    :cond_c
    move-object v6, v2

    .line 356
    :goto_8
    if-nez v6, :cond_d

    .line 357
    .line 358
    invoke-virtual {p0}, Lm92;->a()Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    :cond_d
    if-eqz v6, :cond_e

    .line 363
    .line 364
    invoke-virtual {p0, v6}, Lm92;->e(Ljava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    iput v5, p0, Lm92;->l:I

    .line 368
    .line 369
    :cond_e
    monitor-exit p0

    .line 370
    goto :goto_9

    .line 371
    :cond_f
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 372
    :cond_10
    invoke-virtual {p0}, Lm92;->d()Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    :goto_9
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 377
    .line 378
    .line 379
    return-object v6

    .line 380
    :goto_a
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 381
    throw v0

    .line 382
    :goto_b
    :try_start_8
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 383
    throw p0

    .line 384
    :cond_11
    sget-object p0, Lrs0;->c:Ljava/lang/Object;

    .line 385
    .line 386
    monitor-enter p0

    .line 387
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 388
    const-string p0, "Must call PhenotypeContext.setContext() first"

    .line 389
    .line 390
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    return-object v2

    .line 394
    :catchall_2
    move-exception v0

    .line 395
    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 396
    throw v0
.end method
