.class public final Lor;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final r:Ly1;

.field public static final s:Ljava/nio/charset/Charset;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lqt;

.field public final c:Ls7;

.field public final d:Lnm;

.field public final e:Lc9;

.field public final f:Lpd0;

.field public final g:Lm30;

.field public final h:Ldn;

.field public final i:Ls7;

.field public final j:Ltr;

.field public final k:Ll4;

.field public final l:Llr;

.field public final m:Li7;

.field public n:Lys;

.field public final o:Llb1;

.field public final p:Llb1;

.field public final q:Llb1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ly1;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ly1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lor;->r:Ly1;

    .line 8
    .line 9
    const-string v0, "UTF-8"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lor;->s:Ljava/nio/charset/Charset;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpd0;Lqt;Lm30;Ls7;Ldn;Lnm;Ls7;Li7;Ltr;Ll4;Llr;Lc9;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Llb1;

    .line 5
    .line 6
    invoke-direct {v0}, Llb1;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lor;->o:Llb1;

    .line 10
    .line 11
    new-instance v0, Llb1;

    .line 12
    .line 13
    invoke-direct {v0}, Llb1;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lor;->p:Llb1;

    .line 17
    .line 18
    new-instance v0, Llb1;

    .line 19
    .line 20
    invoke-direct {v0}, Llb1;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lor;->q:Llb1;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lor;->a:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p2, p0, Lor;->f:Lpd0;

    .line 34
    .line 35
    iput-object p3, p0, Lor;->b:Lqt;

    .line 36
    .line 37
    iput-object p4, p0, Lor;->g:Lm30;

    .line 38
    .line 39
    iput-object p5, p0, Lor;->c:Ls7;

    .line 40
    .line 41
    iput-object p6, p0, Lor;->h:Ldn;

    .line 42
    .line 43
    iput-object p7, p0, Lor;->d:Lnm;

    .line 44
    .line 45
    iput-object p8, p0, Lor;->i:Ls7;

    .line 46
    .line 47
    iput-object p10, p0, Lor;->j:Ltr;

    .line 48
    .line 49
    iput-object p11, p0, Lor;->k:Ll4;

    .line 50
    .line 51
    iput-object p12, p0, Lor;->l:Llr;

    .line 52
    .line 53
    iput-object p9, p0, Lor;->m:Li7;

    .line 54
    .line 55
    iput-object p13, p0, Lor;->e:Lc9;

    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final a(ZLdn;Z)V
    .locals 30

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    iget-object v3, v1, Lor;->j:Ltr;

    .line 6
    .line 7
    invoke-static {}, Lc9;->h()V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v5, v1, Lor;->m:Li7;

    .line 13
    .line 14
    iget-object v0, v5, Li7;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lxs;

    .line 17
    .line 18
    invoke-virtual {v0}, Lxs;->c()Ljava/util/NavigableSet;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-gt v0, v2, :cond_0

    .line 30
    .line 31
    goto/16 :goto_1b

    .line 32
    .line 33
    :cond_0
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    move-object v6, v0

    .line 38
    check-cast v6, Ljava/lang/String;

    .line 39
    .line 40
    const/4 v9, 0x1

    .line 41
    const/4 v10, 0x0

    .line 42
    if-eqz p3, :cond_12

    .line 43
    .line 44
    invoke-virtual/range {p2 .. p2}, Ldn;->f()Lp51;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lp51;->b:Ln51;

    .line 49
    .line 50
    iget-boolean v0, v0, Ln51;->b:Z

    .line 51
    .line 52
    if-eqz v0, :cond_12

    .line 53
    .line 54
    iget-object v0, v1, Lor;->g:Lm30;

    .line 55
    .line 56
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const/16 v13, 0x1e

    .line 59
    .line 60
    if-lt v12, v13, :cond_12

    .line 61
    .line 62
    iget-object v12, v1, Lor;->a:Landroid/content/Context;

    .line 63
    .line 64
    const-string v13, "activity"

    .line 65
    .line 66
    invoke-virtual {v12, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v12

    .line 70
    check-cast v12, Landroid/app/ActivityManager;

    .line 71
    .line 72
    invoke-static {v12}, Lf1;->l(Landroid/app/ActivityManager;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v12

    .line 76
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v13

    .line 80
    if-eqz v13, :cond_12

    .line 81
    .line 82
    new-instance v13, Ls7;

    .line 83
    .line 84
    invoke-direct {v13, v0}, Ls7;-><init>(Lm30;)V

    .line 85
    .line 86
    .line 87
    sget-object v14, Ls7;->n:Lok0;

    .line 88
    .line 89
    iput-object v14, v13, Ls7;->l:Ljava/lang/Object;

    .line 90
    .line 91
    if-nez v6, :cond_1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    const-string v14, "userlog"

    .line 95
    .line 96
    invoke-virtual {v0, v6, v14}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 97
    .line 98
    .line 99
    move-result-object v14

    .line 100
    new-instance v15, Lxw0;

    .line 101
    .line 102
    invoke-direct {v15, v14}, Lxw0;-><init>(Ljava/io/File;)V

    .line 103
    .line 104
    .line 105
    iput-object v15, v13, Ls7;->l:Ljava/lang/Object;

    .line 106
    .line 107
    :goto_0
    iget-object v14, v1, Lor;->e:Lc9;

    .line 108
    .line 109
    new-instance v15, Lwn0;

    .line 110
    .line 111
    invoke-direct {v15, v0}, Lwn0;-><init>(Lm30;)V

    .line 112
    .line 113
    .line 114
    const/16 v16, 0x4

    .line 115
    .line 116
    new-instance v8, Lnm;

    .line 117
    .line 118
    invoke-direct {v8, v6, v0, v14}, Lnm;-><init>(Ljava/lang/String;Lm30;Lc9;)V

    .line 119
    .line 120
    .line 121
    iget-object v14, v8, Lnm;->m:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast v14, Lvx;

    .line 124
    .line 125
    iget-object v14, v14, Lvx;->b:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v14, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 128
    .line 129
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v14

    .line 133
    check-cast v14, Lgh0;

    .line 134
    .line 135
    const/16 v17, 0x8

    .line 136
    .line 137
    invoke-virtual {v15, v6, v10}, Lwn0;->c(Ljava/lang/String;Z)Ljava/util/Map;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    invoke-virtual {v14, v7}, Lgh0;->c(Ljava/util/Map;)V

    .line 142
    .line 143
    .line 144
    iget-object v7, v8, Lnm;->n:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v7, Lvx;

    .line 147
    .line 148
    iget-object v7, v7, Lvx;->b:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast v7, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 151
    .line 152
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    check-cast v7, Lgh0;

    .line 157
    .line 158
    invoke-virtual {v15, v6, v9}, Lwn0;->c(Ljava/lang/String;Z)Ljava/util/Map;

    .line 159
    .line 160
    .line 161
    move-result-object v14

    .line 162
    invoke-virtual {v7, v14}, Lgh0;->c(Ljava/util/Map;)V

    .line 163
    .line 164
    .line 165
    iget-object v7, v8, Lnm;->p:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v7, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 168
    .line 169
    invoke-virtual {v15, v6}, Lwn0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v14

    .line 173
    invoke-virtual {v7, v14, v10}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->set(Ljava/lang/Object;Z)V

    .line 174
    .line 175
    .line 176
    iget-object v7, v8, Lnm;->o:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v7, Lny0;

    .line 179
    .line 180
    const-string v14, "rollouts-state"

    .line 181
    .line 182
    invoke-virtual {v0, v6, v14}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 187
    .line 188
    .line 189
    move-result v14

    .line 190
    if-eqz v14, :cond_3

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 193
    .line 194
    .line 195
    move-result-wide v14

    .line 196
    const-wide/16 v18, 0x0

    .line 197
    .line 198
    cmp-long v14, v14, v18

    .line 199
    .line 200
    if-nez v14, :cond_2

    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_2
    :try_start_0
    new-instance v14, Ljava/io/FileInputStream;

    .line 204
    .line 205
    invoke-direct {v14, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 206
    .line 207
    .line 208
    :try_start_1
    invoke-static {v14}, Lml;->C(Ljava/io/FileInputStream;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v15

    .line 212
    invoke-static {v15}, Lwn0;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 213
    .line 214
    .line 215
    move-result-object v15

    .line 216
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 217
    .line 218
    .line 219
    invoke-static {v14}, Lml;->i(Ljava/io/Closeable;)V

    .line 220
    .line 221
    .line 222
    goto :goto_3

    .line 223
    :catchall_0
    move-exception v0

    .line 224
    move-object v11, v14

    .line 225
    goto :goto_1

    .line 226
    :catchall_1
    move-exception v0

    .line 227
    const/4 v11, 0x0

    .line 228
    goto :goto_1

    .line 229
    :catch_0
    const/4 v14, 0x0

    .line 230
    :catch_1
    :try_start_2
    invoke-static {v0}, Lwn0;->f(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 231
    .line 232
    .line 233
    invoke-static {v14}, Lml;->i(Ljava/io/Closeable;)V

    .line 234
    .line 235
    .line 236
    sget-object v15, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 237
    .line 238
    goto :goto_3

    .line 239
    :goto_1
    invoke-static {v11}, Lml;->i(Ljava/io/Closeable;)V

    .line 240
    .line 241
    .line 242
    throw v0

    .line 243
    :cond_3
    :goto_2
    new-instance v14, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    const-string v15, "The file has a length of zero for session: "

    .line 246
    .line 247
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v14

    .line 257
    invoke-static {v0, v14}, Lwn0;->g(Ljava/io/File;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    sget-object v15, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 261
    .line 262
    :goto_3
    invoke-virtual {v7, v15}, Lny0;->u(Ljava/util/List;)Z

    .line 263
    .line 264
    .line 265
    iget-object v0, v5, Li7;->k:Ljava/lang/Object;

    .line 266
    .line 267
    move-object v7, v0

    .line 268
    check-cast v7, Lxs;

    .line 269
    .line 270
    iget-object v0, v7, Lxs;->b:Lm30;

    .line 271
    .line 272
    const-string v14, "start-time"

    .line 273
    .line 274
    invoke-virtual {v0, v6, v14}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    .line 279
    .line 280
    .line 281
    move-result-wide v14

    .line 282
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 287
    .line 288
    .line 289
    move-result v12

    .line 290
    if-eqz v12, :cond_4

    .line 291
    .line 292
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v12

    .line 296
    invoke-static {v12}, Lf1;->d(Ljava/lang/Object;)Landroid/app/ApplicationExitInfo;

    .line 297
    .line 298
    .line 299
    move-result-object v12

    .line 300
    invoke-static {v12}, Lf1;->s(Landroid/app/ApplicationExitInfo;)J

    .line 301
    .line 302
    .line 303
    move-result-wide v18

    .line 304
    cmp-long v18, v18, v14

    .line 305
    .line 306
    if-gez v18, :cond_5

    .line 307
    .line 308
    :cond_4
    move/from16 v19, v9

    .line 309
    .line 310
    const/4 v12, 0x0

    .line 311
    goto :goto_5

    .line 312
    :cond_5
    invoke-static {v12}, Lf1;->b(Landroid/app/ApplicationExitInfo;)I

    .line 313
    .line 314
    .line 315
    move-result v11

    .line 316
    move/from16 v19, v9

    .line 317
    .line 318
    const/4 v9, 0x6

    .line 319
    if-eq v11, v9, :cond_6

    .line 320
    .line 321
    move/from16 v9, v19

    .line 322
    .line 323
    goto :goto_4

    .line 324
    :cond_6
    :goto_5
    if-nez v12, :cond_7

    .line 325
    .line 326
    move-object/from16 v28, v3

    .line 327
    .line 328
    move-object/from16 v29, v5

    .line 329
    .line 330
    move/from16 v5, v19

    .line 331
    .line 332
    goto/16 :goto_a

    .line 333
    .line 334
    :cond_7
    iget-object v0, v5, Li7;->j:Ljava/lang/Object;

    .line 335
    .line 336
    move-object v9, v0

    .line 337
    check-cast v9, Lvs;

    .line 338
    .line 339
    :try_start_3
    invoke-static {v12}, Lf1;->i(Landroid/app/ApplicationExitInfo;)Ljava/io/InputStream;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    if-eqz v0, :cond_8

    .line 344
    .line 345
    invoke-static {v0}, Li7;->k(Ljava/io/InputStream;)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 349
    goto :goto_6

    .line 350
    :catch_2
    move-exception v0

    .line 351
    invoke-static {v12}, Lf1;->m(Landroid/app/ApplicationExitInfo;)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    :cond_8
    const/4 v0, 0x0

    .line 358
    :goto_6
    new-instance v11, Lad;

    .line 359
    .line 360
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 361
    .line 362
    .line 363
    invoke-static {v12}, Lf1;->r(Landroid/app/ApplicationExitInfo;)I

    .line 364
    .line 365
    .line 366
    move-result v14

    .line 367
    iput v14, v11, Lad;->d:I

    .line 368
    .line 369
    iget-byte v14, v11, Lad;->j:B

    .line 370
    .line 371
    or-int/lit8 v14, v14, 0x4

    .line 372
    .line 373
    int-to-byte v14, v14

    .line 374
    iput-byte v14, v11, Lad;->j:B

    .line 375
    .line 376
    invoke-static {v12}, Lf1;->j(Landroid/app/ApplicationExitInfo;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v14

    .line 380
    if-eqz v14, :cond_11

    .line 381
    .line 382
    iput-object v14, v11, Lad;->b:Ljava/lang/String;

    .line 383
    .line 384
    invoke-static {v12}, Lf1;->b(Landroid/app/ApplicationExitInfo;)I

    .line 385
    .line 386
    .line 387
    move-result v14

    .line 388
    iput v14, v11, Lad;->c:I

    .line 389
    .line 390
    iget-byte v14, v11, Lad;->j:B

    .line 391
    .line 392
    or-int/lit8 v14, v14, 0x2

    .line 393
    .line 394
    int-to-byte v14, v14

    .line 395
    iput-byte v14, v11, Lad;->j:B

    .line 396
    .line 397
    invoke-static {v12}, Lf1;->y(Landroid/app/ApplicationExitInfo;)J

    .line 398
    .line 399
    .line 400
    move-result-wide v14

    .line 401
    iput-wide v14, v11, Lad;->g:J

    .line 402
    .line 403
    iget-byte v14, v11, Lad;->j:B

    .line 404
    .line 405
    or-int/lit8 v14, v14, 0x20

    .line 406
    .line 407
    int-to-byte v14, v14

    .line 408
    iput-byte v14, v11, Lad;->j:B

    .line 409
    .line 410
    invoke-static {v12}, Lf1;->x(Landroid/app/ApplicationExitInfo;)I

    .line 411
    .line 412
    .line 413
    move-result v14

    .line 414
    iput v14, v11, Lad;->a:I

    .line 415
    .line 416
    iget-byte v14, v11, Lad;->j:B

    .line 417
    .line 418
    or-int/lit8 v14, v14, 0x1

    .line 419
    .line 420
    int-to-byte v14, v14

    .line 421
    iput-byte v14, v11, Lad;->j:B

    .line 422
    .line 423
    invoke-static {v12}, Lf1;->A(Landroid/app/ApplicationExitInfo;)J

    .line 424
    .line 425
    .line 426
    move-result-wide v14

    .line 427
    iput-wide v14, v11, Lad;->e:J

    .line 428
    .line 429
    iget-byte v14, v11, Lad;->j:B

    .line 430
    .line 431
    or-int/lit8 v14, v14, 0x8

    .line 432
    .line 433
    int-to-byte v14, v14

    .line 434
    iput-byte v14, v11, Lad;->j:B

    .line 435
    .line 436
    invoke-static {v12}, Lf1;->c(Landroid/app/ApplicationExitInfo;)J

    .line 437
    .line 438
    .line 439
    move-result-wide v14

    .line 440
    iput-wide v14, v11, Lad;->f:J

    .line 441
    .line 442
    iget-byte v12, v11, Lad;->j:B

    .line 443
    .line 444
    or-int/lit8 v12, v12, 0x10

    .line 445
    .line 446
    int-to-byte v12, v12

    .line 447
    iput-byte v12, v11, Lad;->j:B

    .line 448
    .line 449
    iput-object v0, v11, Lad;->h:Ljava/lang/String;

    .line 450
    .line 451
    invoke-virtual {v11}, Lad;->a()Lbd;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    iget-object v11, v9, Lvs;->a:Landroid/content/Context;

    .line 456
    .line 457
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 458
    .line 459
    .line 460
    move-result-object v11

    .line 461
    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 462
    .line 463
    .line 464
    move-result-object v11

    .line 465
    iget v11, v11, Landroid/content/res/Configuration;->orientation:I

    .line 466
    .line 467
    new-instance v12, Lmd;

    .line 468
    .line 469
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 470
    .line 471
    .line 472
    const-string v14, "anr"

    .line 473
    .line 474
    iput-object v14, v12, Lmd;->b:Ljava/lang/String;

    .line 475
    .line 476
    iget-wide v14, v0, Lbd;->g:J

    .line 477
    .line 478
    iput-wide v14, v12, Lmd;->a:J

    .line 479
    .line 480
    iget-byte v10, v12, Lmd;->g:B

    .line 481
    .line 482
    or-int/lit8 v10, v10, 0x1

    .line 483
    .line 484
    int-to-byte v10, v10

    .line 485
    iput-byte v10, v12, Lmd;->g:B

    .line 486
    .line 487
    iget-object v10, v9, Lvs;->c:Ldn;

    .line 488
    .line 489
    iget-object v2, v9, Lvs;->e:Ldn;

    .line 490
    .line 491
    invoke-virtual {v2}, Ldn;->f()Lp51;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    iget-object v2, v2, Lp51;->b:Ln51;

    .line 496
    .line 497
    iget-boolean v2, v2, Ln51;->c:Z

    .line 498
    .line 499
    if-eqz v2, :cond_d

    .line 500
    .line 501
    iget-object v2, v10, Ldn;->c:Ljava/lang/Object;

    .line 502
    .line 503
    check-cast v2, Ljava/util/ArrayList;

    .line 504
    .line 505
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    if-lez v2, :cond_d

    .line 510
    .line 511
    new-instance v2, Ljava/util/ArrayList;

    .line 512
    .line 513
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 514
    .line 515
    .line 516
    iget-object v10, v10, Ldn;->c:Ljava/lang/Object;

    .line 517
    .line 518
    check-cast v10, Ljava/util/ArrayList;

    .line 519
    .line 520
    move-object/from16 v28, v3

    .line 521
    .line 522
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 523
    .line 524
    .line 525
    move-result v3

    .line 526
    move/from16 v27, v11

    .line 527
    .line 528
    const/4 v11, 0x0

    .line 529
    :goto_7
    if-ge v11, v3, :cond_c

    .line 530
    .line 531
    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object v20

    .line 535
    add-int/lit8 v11, v11, 0x1

    .line 536
    .line 537
    move/from16 p2, v3

    .line 538
    .line 539
    move-object/from16 v3, v20

    .line 540
    .line 541
    check-cast v3, Lmh;

    .line 542
    .line 543
    move-object/from16 v20, v10

    .line 544
    .line 545
    iget-object v10, v3, Lmh;->a:Ljava/lang/String;

    .line 546
    .line 547
    if-eqz v10, :cond_b

    .line 548
    .line 549
    move/from16 v21, v11

    .line 550
    .line 551
    iget-object v11, v3, Lmh;->b:Ljava/lang/String;

    .line 552
    .line 553
    if-eqz v11, :cond_a

    .line 554
    .line 555
    iget-object v3, v3, Lmh;->c:Ljava/lang/String;

    .line 556
    .line 557
    if-eqz v3, :cond_9

    .line 558
    .line 559
    move-object/from16 v29, v5

    .line 560
    .line 561
    new-instance v5, Lcd;

    .line 562
    .line 563
    invoke-direct {v5, v11, v10, v3}, Lcd;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 567
    .line 568
    .line 569
    move/from16 v3, p2

    .line 570
    .line 571
    move-object/from16 v10, v20

    .line 572
    .line 573
    move/from16 v11, v21

    .line 574
    .line 575
    move-object/from16 v5, v29

    .line 576
    .line 577
    goto :goto_7

    .line 578
    :cond_9
    const-string v0, "Null buildId"

    .line 579
    .line 580
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    return-void

    .line 584
    :cond_a
    const-string v0, "Null arch"

    .line 585
    .line 586
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 587
    .line 588
    .line 589
    return-void

    .line 590
    :cond_b
    const-string v0, "Null libraryName"

    .line 591
    .line 592
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 593
    .line 594
    .line 595
    return-void

    .line 596
    :cond_c
    move-object/from16 v29, v5

    .line 597
    .line 598
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 599
    .line 600
    .line 601
    move-result-object v2

    .line 602
    goto :goto_8

    .line 603
    :cond_d
    move-object/from16 v28, v3

    .line 604
    .line 605
    move-object/from16 v29, v5

    .line 606
    .line 607
    move/from16 v27, v11

    .line 608
    .line 609
    const/4 v2, 0x0

    .line 610
    :goto_8
    new-instance v3, Lad;

    .line 611
    .line 612
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 613
    .line 614
    .line 615
    iget v5, v0, Lbd;->d:I

    .line 616
    .line 617
    iput v5, v3, Lad;->d:I

    .line 618
    .line 619
    iget-byte v5, v3, Lad;->j:B

    .line 620
    .line 621
    or-int/lit8 v5, v5, 0x4

    .line 622
    .line 623
    int-to-byte v5, v5

    .line 624
    iput-byte v5, v3, Lad;->j:B

    .line 625
    .line 626
    iget-object v10, v0, Lbd;->b:Ljava/lang/String;

    .line 627
    .line 628
    if-eqz v10, :cond_10

    .line 629
    .line 630
    iput-object v10, v3, Lad;->b:Ljava/lang/String;

    .line 631
    .line 632
    iget v10, v0, Lbd;->c:I

    .line 633
    .line 634
    iput v10, v3, Lad;->c:I

    .line 635
    .line 636
    or-int/lit8 v5, v5, 0x2

    .line 637
    .line 638
    int-to-byte v5, v5

    .line 639
    iput-wide v14, v3, Lad;->g:J

    .line 640
    .line 641
    or-int/lit8 v5, v5, 0x20

    .line 642
    .line 643
    int-to-byte v5, v5

    .line 644
    iget v10, v0, Lbd;->a:I

    .line 645
    .line 646
    iput v10, v3, Lad;->a:I

    .line 647
    .line 648
    or-int/lit8 v5, v5, 0x1

    .line 649
    .line 650
    int-to-byte v5, v5

    .line 651
    iget-wide v10, v0, Lbd;->e:J

    .line 652
    .line 653
    iput-wide v10, v3, Lad;->e:J

    .line 654
    .line 655
    or-int/lit8 v5, v5, 0x8

    .line 656
    .line 657
    int-to-byte v5, v5

    .line 658
    iget-wide v10, v0, Lbd;->f:J

    .line 659
    .line 660
    iput-wide v10, v3, Lad;->f:J

    .line 661
    .line 662
    or-int/lit8 v5, v5, 0x10

    .line 663
    .line 664
    int-to-byte v5, v5

    .line 665
    iput-byte v5, v3, Lad;->j:B

    .line 666
    .line 667
    iget-object v0, v0, Lbd;->h:Ljava/lang/String;

    .line 668
    .line 669
    iput-object v0, v3, Lad;->h:Ljava/lang/String;

    .line 670
    .line 671
    iput-object v2, v3, Lad;->i:Ljava/util/List;

    .line 672
    .line 673
    invoke-virtual {v3}, Lad;->a()Lbd;

    .line 674
    .line 675
    .line 676
    move-result-object v0

    .line 677
    iget v2, v0, Lbd;->d:I

    .line 678
    .line 679
    const/16 v3, 0x64

    .line 680
    .line 681
    if-eq v2, v3, :cond_e

    .line 682
    .line 683
    move/from16 v3, v19

    .line 684
    .line 685
    goto :goto_9

    .line 686
    :cond_e
    const/4 v3, 0x0

    .line 687
    :goto_9
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 688
    .line 689
    .line 690
    move-result-object v3

    .line 691
    iget-object v5, v0, Lbd;->b:Ljava/lang/String;

    .line 692
    .line 693
    iget v10, v0, Lbd;->a:I

    .line 694
    .line 695
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 696
    .line 697
    .line 698
    new-instance v11, Lwd;

    .line 699
    .line 700
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 701
    .line 702
    .line 703
    iput-object v5, v11, Lwd;->a:Ljava/lang/String;

    .line 704
    .line 705
    iput v10, v11, Lwd;->b:I

    .line 706
    .line 707
    iget-byte v5, v11, Lwd;->e:B

    .line 708
    .line 709
    or-int/lit8 v5, v5, 0x1

    .line 710
    .line 711
    int-to-byte v5, v5

    .line 712
    iput v2, v11, Lwd;->c:I

    .line 713
    .line 714
    or-int/lit8 v2, v5, 0x2

    .line 715
    .line 716
    int-to-byte v2, v2

    .line 717
    const/4 v5, 0x0

    .line 718
    iput-boolean v5, v11, Lwd;->d:Z

    .line 719
    .line 720
    or-int/lit8 v2, v2, 0x4

    .line 721
    .line 722
    int-to-byte v2, v2

    .line 723
    iput-byte v2, v11, Lwd;->e:B

    .line 724
    .line 725
    invoke-virtual {v11}, Lwd;->a()Lxd;

    .line 726
    .line 727
    .line 728
    move-result-object v2

    .line 729
    invoke-static {}, Lvs;->e()Lsd;

    .line 730
    .line 731
    .line 732
    move-result-object v24

    .line 733
    invoke-virtual {v9}, Lvs;->a()Ljava/util/List;

    .line 734
    .line 735
    .line 736
    move-result-object v25

    .line 737
    if-eqz v25, :cond_f

    .line 738
    .line 739
    new-instance v20, Lpd;

    .line 740
    .line 741
    const/16 v21, 0x0

    .line 742
    .line 743
    const/16 v22, 0x0

    .line 744
    .line 745
    move-object/from16 v23, v0

    .line 746
    .line 747
    invoke-direct/range {v20 .. v25}, Lpd;-><init>(Ljava/util/List;Lrd;Lwr;Lsd;Ljava/util/List;)V

    .line 748
    .line 749
    .line 750
    new-instance v0, Lod;

    .line 751
    .line 752
    const/16 v23, 0x0

    .line 753
    .line 754
    const/16 v26, 0x0

    .line 755
    .line 756
    move-object/from16 v25, v2

    .line 757
    .line 758
    move-object/from16 v24, v3

    .line 759
    .line 760
    move-object/from16 v21, v20

    .line 761
    .line 762
    move-object/from16 v20, v0

    .line 763
    .line 764
    invoke-direct/range {v20 .. v27}, Lod;-><init>(Lpd;Ljava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljs;Ljava/util/List;I)V

    .line 765
    .line 766
    .line 767
    move-object/from16 v2, v20

    .line 768
    .line 769
    move/from16 v0, v27

    .line 770
    .line 771
    iput-object v2, v12, Lmd;->c:Lks;

    .line 772
    .line 773
    invoke-virtual {v9, v0}, Lvs;->b(I)Lzd;

    .line 774
    .line 775
    .line 776
    move-result-object v0

    .line 777
    iput-object v0, v12, Lmd;->d:Lls;

    .line 778
    .line 779
    invoke-virtual {v12}, Lmd;->a()Lnd;

    .line 780
    .line 781
    .line 782
    move-result-object v0

    .line 783
    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 784
    .line 785
    invoke-static {v0, v13, v8, v2}, Li7;->h(Lnd;Ls7;Lnm;Ljava/util/Map;)Lnd;

    .line 786
    .line 787
    .line 788
    move-result-object v0

    .line 789
    invoke-static {v0, v8}, Li7;->i(Lnd;Lnm;)Lqs;

    .line 790
    .line 791
    .line 792
    move-result-object v0

    .line 793
    move/from16 v5, v19

    .line 794
    .line 795
    invoke-virtual {v7, v0, v6, v5}, Lxs;->d(Lqs;Ljava/lang/String;Z)V

    .line 796
    .line 797
    .line 798
    goto :goto_a

    .line 799
    :cond_f
    const-string v0, "Null binaries"

    .line 800
    .line 801
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 802
    .line 803
    .line 804
    return-void

    .line 805
    :cond_10
    const-string v0, "Null processName"

    .line 806
    .line 807
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 808
    .line 809
    .line 810
    return-void

    .line 811
    :cond_11
    const-string v0, "Null processName"

    .line 812
    .line 813
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 814
    .line 815
    .line 816
    return-void

    .line 817
    :cond_12
    move-object/from16 v28, v3

    .line 818
    .line 819
    move-object/from16 v29, v5

    .line 820
    .line 821
    move v5, v9

    .line 822
    const/16 v16, 0x4

    .line 823
    .line 824
    const/16 v17, 0x8

    .line 825
    .line 826
    :goto_a
    if-eqz p3, :cond_13

    .line 827
    .line 828
    invoke-virtual/range {v28 .. v28}, Ltr;->c()Z

    .line 829
    .line 830
    .line 831
    move-result v0

    .line 832
    if-eqz v0, :cond_13

    .line 833
    .line 834
    invoke-virtual/range {v28 .. v28}, Ltr;->a()Lt11;

    .line 835
    .line 836
    .line 837
    move-result-object v0

    .line 838
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 839
    .line 840
    .line 841
    :cond_13
    if-eqz p1, :cond_14

    .line 842
    .line 843
    const/4 v2, 0x0

    .line 844
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 845
    .line 846
    .line 847
    move-result-object v0

    .line 848
    check-cast v0, Ljava/lang/String;

    .line 849
    .line 850
    const/4 v1, 0x0

    .line 851
    goto :goto_b

    .line 852
    :cond_14
    const/4 v2, 0x0

    .line 853
    iget-object v0, v1, Lor;->l:Llr;

    .line 854
    .line 855
    const/4 v1, 0x0

    .line 856
    invoke-virtual {v0, v1}, Llr;->a(Ljava/lang/String;)V

    .line 857
    .line 858
    .line 859
    move-object v0, v1

    .line 860
    :goto_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 861
    .line 862
    .line 863
    move-result-wide v3

    .line 864
    const-wide/16 v6, 0x3e8

    .line 865
    .line 866
    div-long/2addr v3, v6

    .line 867
    move-object/from16 v6, v29

    .line 868
    .line 869
    iget-object v6, v6, Li7;->k:Ljava/lang/Object;

    .line 870
    .line 871
    check-cast v6, Lxs;

    .line 872
    .line 873
    iget-object v7, v6, Lxs;->b:Lm30;

    .line 874
    .line 875
    const-string v8, ".com.google.firebase.crashlytics"

    .line 876
    .line 877
    invoke-virtual {v7, v8}, Lm30;->a(Ljava/lang/String;)V

    .line 878
    .line 879
    .line 880
    const-string v8, ".com.google.firebase.crashlytics-ndk"

    .line 881
    .line 882
    invoke-virtual {v7, v8}, Lm30;->a(Ljava/lang/String;)V

    .line 883
    .line 884
    .line 885
    iget-object v8, v7, Lm30;->j:Ljava/lang/Object;

    .line 886
    .line 887
    check-cast v8, Ljava/lang/String;

    .line 888
    .line 889
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    .line 890
    .line 891
    .line 892
    move-result v8

    .line 893
    if-nez v8, :cond_15

    .line 894
    .line 895
    const-string v8, ".com.google.firebase.crashlytics.files.v1"

    .line 896
    .line 897
    invoke-virtual {v7, v8}, Lm30;->a(Ljava/lang/String;)V

    .line 898
    .line 899
    .line 900
    new-instance v8, Ljava/lang/StringBuilder;

    .line 901
    .line 902
    const-string v9, ".com.google.firebase.crashlytics.files.v2"

    .line 903
    .line 904
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    sget-object v9, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    .line 908
    .line 909
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 910
    .line 911
    .line 912
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 913
    .line 914
    .line 915
    move-result-object v8

    .line 916
    iget-object v9, v7, Lm30;->k:Ljava/lang/Object;

    .line 917
    .line 918
    check-cast v9, Ljava/io/File;

    .line 919
    .line 920
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 921
    .line 922
    .line 923
    move-result v10

    .line 924
    if-eqz v10, :cond_15

    .line 925
    .line 926
    new-instance v10, Ll30;

    .line 927
    .line 928
    invoke-direct {v10, v8}, Ll30;-><init>(Ljava/lang/String;)V

    .line 929
    .line 930
    .line 931
    invoke-virtual {v9, v10}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    .line 932
    .line 933
    .line 934
    move-result-object v8

    .line 935
    if-eqz v8, :cond_15

    .line 936
    .line 937
    array-length v9, v8

    .line 938
    move v10, v2

    .line 939
    :goto_c
    if-ge v10, v9, :cond_15

    .line 940
    .line 941
    aget-object v11, v8, v10

    .line 942
    .line 943
    invoke-virtual {v7, v11}, Lm30;->a(Ljava/lang/String;)V

    .line 944
    .line 945
    .line 946
    add-int/lit8 v10, v10, 0x1

    .line 947
    .line 948
    goto :goto_c

    .line 949
    :cond_15
    invoke-virtual {v6}, Lxs;->c()Ljava/util/NavigableSet;

    .line 950
    .line 951
    .line 952
    move-result-object v8

    .line 953
    if-eqz v0, :cond_16

    .line 954
    .line 955
    invoke-interface {v8, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 956
    .line 957
    .line 958
    :cond_16
    invoke-interface {v8}, Ljava/util/Set;->size()I

    .line 959
    .line 960
    .line 961
    move-result v0

    .line 962
    move/from16 v9, v17

    .line 963
    .line 964
    if-gt v0, v9, :cond_17

    .line 965
    .line 966
    goto :goto_e

    .line 967
    :cond_17
    :goto_d
    invoke-interface {v8}, Ljava/util/Set;->size()I

    .line 968
    .line 969
    .line 970
    move-result v0

    .line 971
    if-le v0, v9, :cond_18

    .line 972
    .line 973
    invoke-interface {v8}, Ljava/util/SortedSet;->last()Ljava/lang/Object;

    .line 974
    .line 975
    .line 976
    move-result-object v0

    .line 977
    check-cast v0, Ljava/lang/String;

    .line 978
    .line 979
    new-instance v10, Ljava/io/File;

    .line 980
    .line 981
    iget-object v11, v7, Lm30;->m:Ljava/lang/Object;

    .line 982
    .line 983
    check-cast v11, Ljava/io/File;

    .line 984
    .line 985
    invoke-direct {v10, v11, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 986
    .line 987
    .line 988
    invoke-static {v10}, Lm30;->d(Ljava/io/File;)Z

    .line 989
    .line 990
    .line 991
    invoke-interface {v8, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 992
    .line 993
    .line 994
    goto :goto_d

    .line 995
    :cond_18
    :goto_e
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 996
    .line 997
    .line 998
    move-result-object v8

    .line 999
    :goto_f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 1000
    .line 1001
    .line 1002
    move-result v0

    .line 1003
    if-eqz v0, :cond_26

    .line 1004
    .line 1005
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v0

    .line 1009
    move-object v9, v0

    .line 1010
    check-cast v9, Ljava/lang/String;

    .line 1011
    .line 1012
    sget-object v10, Lxs;->g:Lws;

    .line 1013
    .line 1014
    sget-object v0, Lxs;->i:Ly1;

    .line 1015
    .line 1016
    new-instance v11, Ljava/io/File;

    .line 1017
    .line 1018
    iget-object v12, v7, Lm30;->m:Ljava/lang/Object;

    .line 1019
    .line 1020
    check-cast v12, Ljava/io/File;

    .line 1021
    .line 1022
    invoke-direct {v11, v12, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1023
    .line 1024
    .line 1025
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 1026
    .line 1027
    .line 1028
    invoke-virtual {v11, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v0

    .line 1032
    invoke-static {v0}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v0

    .line 1036
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 1037
    .line 1038
    .line 1039
    move-result v11

    .line 1040
    if-eqz v11, :cond_19

    .line 1041
    .line 1042
    goto/16 :goto_19

    .line 1043
    .line 1044
    :cond_19
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1045
    .line 1046
    .line 1047
    new-instance v11, Ljava/util/ArrayList;

    .line 1048
    .line 1049
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1050
    .line 1051
    .line 1052
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1053
    .line 1054
    .line 1055
    move-result-object v12

    .line 1056
    move v13, v2

    .line 1057
    :goto_10
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 1058
    .line 1059
    .line 1060
    move-result v0

    .line 1061
    if-eqz v0, :cond_1c

    .line 1062
    .line 1063
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1064
    .line 1065
    .line 1066
    move-result-object v0

    .line 1067
    move-object v14, v0

    .line 1068
    check-cast v14, Ljava/io/File;

    .line 1069
    .line 1070
    :try_start_4
    invoke-static {v14}, Lxs;->e(Ljava/io/File;)Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v0

    .line 1074
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 1075
    .line 1076
    .line 1077
    :try_start_5
    new-instance v15, Landroid/util/JsonReader;

    .line 1078
    .line 1079
    new-instance v1, Ljava/io/StringReader;

    .line 1080
    .line 1081
    invoke-direct {v1, v0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 1082
    .line 1083
    .line 1084
    invoke-direct {v15, v1}, Landroid/util/JsonReader;-><init>(Ljava/io/Reader;)V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 1085
    .line 1086
    .line 1087
    :try_start_6
    invoke-static {v15}, Lws;->d(Landroid/util/JsonReader;)Lnd;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1091
    :try_start_7
    invoke-virtual {v15}, Landroid/util/JsonReader;->close()V
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 1092
    .line 1093
    .line 1094
    :try_start_8
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1095
    .line 1096
    .line 1097
    if-nez v13, :cond_1b

    .line 1098
    .line 1099
    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v0

    .line 1103
    const-string v1, "event"

    .line 1104
    .line 1105
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 1106
    .line 1107
    .line 1108
    move-result v1

    .line 1109
    if-eqz v1, :cond_1a

    .line 1110
    .line 1111
    const-string v1, "_"

    .line 1112
    .line 1113
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 1114
    .line 1115
    .line 1116
    move-result v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 1117
    if-eqz v0, :cond_1a

    .line 1118
    .line 1119
    goto :goto_11

    .line 1120
    :cond_1a
    move v0, v2

    .line 1121
    goto :goto_12

    .line 1122
    :cond_1b
    :goto_11
    move v0, v5

    .line 1123
    :goto_12
    move v13, v0

    .line 1124
    goto :goto_15

    .line 1125
    :catch_3
    move-exception v0

    .line 1126
    goto :goto_14

    .line 1127
    :catchall_2
    move-exception v0

    .line 1128
    move-object v1, v0

    .line 1129
    :try_start_9
    invoke-virtual {v15}, Landroid/util/JsonReader;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 1130
    .line 1131
    .line 1132
    goto :goto_13

    .line 1133
    :catchall_3
    move-exception v0

    .line 1134
    :try_start_a
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 1135
    .line 1136
    .line 1137
    :goto_13
    throw v1
    :try_end_a
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 1138
    :goto_14
    :try_start_b
    new-instance v1, Ljava/io/IOException;

    .line 1139
    .line 1140
    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 1141
    .line 1142
    .line 1143
    throw v1
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    .line 1144
    :catch_4
    invoke-static {v14}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 1145
    .line 1146
    .line 1147
    :goto_15
    const/4 v1, 0x0

    .line 1148
    goto :goto_10

    .line 1149
    :cond_1c
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1150
    .line 1151
    .line 1152
    move-result v0

    .line 1153
    if-eqz v0, :cond_1d

    .line 1154
    .line 1155
    goto/16 :goto_19

    .line 1156
    .line 1157
    :cond_1d
    new-instance v0, Lwn0;

    .line 1158
    .line 1159
    invoke-direct {v0, v7}, Lwn0;-><init>(Lm30;)V

    .line 1160
    .line 1161
    .line 1162
    invoke-virtual {v0, v9}, Lwn0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v0

    .line 1166
    iget-object v1, v6, Lxs;->d:Llr;

    .line 1167
    .line 1168
    iget-object v1, v1, Llr;->b:Lc9;

    .line 1169
    .line 1170
    monitor-enter v1

    .line 1171
    :try_start_c
    iget-object v12, v1, Lc9;->l:Ljava/lang/Object;

    .line 1172
    .line 1173
    check-cast v12, Ljava/lang/String;

    .line 1174
    .line 1175
    invoke-static {v12, v9}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 1176
    .line 1177
    .line 1178
    move-result v12

    .line 1179
    if-eqz v12, :cond_1e

    .line 1180
    .line 1181
    iget-object v12, v1, Lc9;->m:Ljava/lang/Object;

    .line 1182
    .line 1183
    check-cast v12, Ljava/lang/String;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 1184
    .line 1185
    monitor-exit v1

    .line 1186
    goto :goto_17

    .line 1187
    :cond_1e
    :try_start_d
    iget-object v12, v1, Lc9;->k:Ljava/lang/Object;

    .line 1188
    .line 1189
    check-cast v12, Lm30;

    .line 1190
    .line 1191
    sget-object v14, Lc9;->p:Ly1;

    .line 1192
    .line 1193
    new-instance v15, Ljava/io/File;

    .line 1194
    .line 1195
    iget-object v12, v12, Lm30;->m:Ljava/lang/Object;

    .line 1196
    .line 1197
    check-cast v12, Ljava/io/File;

    .line 1198
    .line 1199
    invoke-direct {v15, v12, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1200
    .line 1201
    .line 1202
    invoke-virtual {v15}, Ljava/io/File;->mkdirs()Z

    .line 1203
    .line 1204
    .line 1205
    invoke-virtual {v15, v14}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v12

    .line 1209
    invoke-static {v12}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v12

    .line 1213
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    .line 1214
    .line 1215
    .line 1216
    move-result v14

    .line 1217
    if-eqz v14, :cond_1f

    .line 1218
    .line 1219
    const/4 v12, 0x0

    .line 1220
    goto :goto_16

    .line 1221
    :cond_1f
    sget-object v14, Lc9;->q:Lkr;

    .line 1222
    .line 1223
    invoke-static {v12, v14}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v12

    .line 1227
    check-cast v12, Ljava/io/File;

    .line 1228
    .line 1229
    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 1230
    .line 1231
    .line 1232
    move-result-object v12

    .line 1233
    move/from16 v14, v16

    .line 1234
    .line 1235
    invoke-virtual {v12, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 1236
    .line 1237
    .line 1238
    move-result-object v12
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 1239
    :goto_16
    monitor-exit v1

    .line 1240
    :goto_17
    const-string v1, "report"

    .line 1241
    .line 1242
    invoke-virtual {v7, v9, v1}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 1243
    .line 1244
    .line 1245
    move-result-object v1

    .line 1246
    :try_start_e
    invoke-static {v1}, Lxs;->e(Ljava/io/File;)Ljava/lang/String;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v14

    .line 1250
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1251
    .line 1252
    .line 1253
    invoke-static {v14}, Lws;->i(Ljava/lang/String;)Lyc;

    .line 1254
    .line 1255
    .line 1256
    move-result-object v10

    .line 1257
    invoke-virtual {v10}, Lyc;->a()Lxc;

    .line 1258
    .line 1259
    .line 1260
    move-result-object v14

    .line 1261
    iget-object v10, v10, Lyc;->k:Lts;

    .line 1262
    .line 1263
    if-eqz v10, :cond_21

    .line 1264
    .line 1265
    invoke-virtual {v10}, Lts;->a()Lgd;

    .line 1266
    .line 1267
    .line 1268
    move-result-object v10

    .line 1269
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v15

    .line 1273
    iput-object v15, v10, Lgd;->e:Ljava/lang/Long;

    .line 1274
    .line 1275
    iput-boolean v13, v10, Lgd;->f:Z

    .line 1276
    .line 1277
    iget-byte v15, v10, Lgd;->m:B

    .line 1278
    .line 1279
    or-int/lit8 v15, v15, 0x2

    .line 1280
    .line 1281
    int-to-byte v15, v15

    .line 1282
    iput-byte v15, v10, Lgd;->m:B

    .line 1283
    .line 1284
    if-eqz v0, :cond_20

    .line 1285
    .line 1286
    new-instance v15, Lhe;

    .line 1287
    .line 1288
    invoke-direct {v15, v0}, Lhe;-><init>(Ljava/lang/String;)V

    .line 1289
    .line 1290
    .line 1291
    iput-object v15, v10, Lgd;->h:Lss;

    .line 1292
    .line 1293
    :cond_20
    invoke-virtual {v10}, Lgd;->a()Lhd;

    .line 1294
    .line 1295
    .line 1296
    move-result-object v0

    .line 1297
    iput-object v0, v14, Lxc;->j:Lts;

    .line 1298
    .line 1299
    :cond_21
    invoke-virtual {v14}, Lxc;->a()Lyc;

    .line 1300
    .line 1301
    .line 1302
    move-result-object v0

    .line 1303
    invoke-virtual {v0}, Lyc;->a()Lxc;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v10

    .line 1307
    iput-object v12, v10, Lxc;->g:Ljava/lang/String;

    .line 1308
    .line 1309
    iget-object v0, v0, Lyc;->k:Lts;

    .line 1310
    .line 1311
    if-eqz v0, :cond_22

    .line 1312
    .line 1313
    invoke-virtual {v0}, Lts;->a()Lgd;

    .line 1314
    .line 1315
    .line 1316
    move-result-object v0

    .line 1317
    iput-object v12, v0, Lgd;->c:Ljava/lang/String;

    .line 1318
    .line 1319
    invoke-virtual {v0}, Lgd;->a()Lhd;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v0

    .line 1323
    iput-object v0, v10, Lxc;->j:Lts;

    .line 1324
    .line 1325
    :cond_22
    invoke-virtual {v10}, Lxc;->a()Lyc;

    .line 1326
    .line 1327
    .line 1328
    move-result-object v0

    .line 1329
    iget-object v10, v0, Lyc;->k:Lts;

    .line 1330
    .line 1331
    if-eqz v10, :cond_25

    .line 1332
    .line 1333
    invoke-virtual {v0}, Lyc;->a()Lxc;

    .line 1334
    .line 1335
    .line 1336
    move-result-object v0

    .line 1337
    invoke-virtual {v10}, Lts;->a()Lgd;

    .line 1338
    .line 1339
    .line 1340
    move-result-object v10

    .line 1341
    iput-object v11, v10, Lgd;->k:Ljava/util/List;

    .line 1342
    .line 1343
    invoke-virtual {v10}, Lgd;->a()Lhd;

    .line 1344
    .line 1345
    .line 1346
    move-result-object v10

    .line 1347
    iput-object v10, v0, Lxc;->j:Lts;

    .line 1348
    .line 1349
    invoke-virtual {v0}, Lxc;->a()Lyc;

    .line 1350
    .line 1351
    .line 1352
    move-result-object v0

    .line 1353
    iget-object v10, v0, Lyc;->k:Lts;

    .line 1354
    .line 1355
    if-nez v10, :cond_23

    .line 1356
    .line 1357
    goto :goto_19

    .line 1358
    :cond_23
    if-eqz v13, :cond_24

    .line 1359
    .line 1360
    check-cast v10, Lhd;

    .line 1361
    .line 1362
    iget-object v10, v10, Lhd;->b:Ljava/lang/String;

    .line 1363
    .line 1364
    new-instance v11, Ljava/io/File;

    .line 1365
    .line 1366
    iget-object v12, v7, Lm30;->o:Ljava/lang/Object;

    .line 1367
    .line 1368
    check-cast v12, Ljava/io/File;

    .line 1369
    .line 1370
    invoke-direct {v11, v12, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1371
    .line 1372
    .line 1373
    goto :goto_18

    .line 1374
    :cond_24
    check-cast v10, Lhd;

    .line 1375
    .line 1376
    iget-object v10, v10, Lhd;->b:Ljava/lang/String;

    .line 1377
    .line 1378
    new-instance v11, Ljava/io/File;

    .line 1379
    .line 1380
    iget-object v12, v7, Lm30;->n:Ljava/lang/Object;

    .line 1381
    .line 1382
    check-cast v12, Ljava/io/File;

    .line 1383
    .line 1384
    invoke-direct {v11, v12, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1385
    .line 1386
    .line 1387
    :goto_18
    sget-object v10, Lws;->a:Lpa0;

    .line 1388
    .line 1389
    invoke-virtual {v10, v0}, Lpa0;->r(Ljava/lang/Object;)Ljava/lang/String;

    .line 1390
    .line 1391
    .line 1392
    move-result-object v0

    .line 1393
    invoke-static {v11, v0}, Lxs;->f(Ljava/io/File;Ljava/lang/String;)V

    .line 1394
    .line 1395
    .line 1396
    goto :goto_19

    .line 1397
    :cond_25
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1398
    .line 1399
    const-string v10, "Reports without sessions cannot have events added to them."

    .line 1400
    .line 1401
    invoke-direct {v0, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1402
    .line 1403
    .line 1404
    throw v0
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_5

    .line 1405
    :catch_5
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 1406
    .line 1407
    .line 1408
    :goto_19
    new-instance v0, Ljava/io/File;

    .line 1409
    .line 1410
    iget-object v1, v7, Lm30;->m:Ljava/lang/Object;

    .line 1411
    .line 1412
    check-cast v1, Ljava/io/File;

    .line 1413
    .line 1414
    invoke-direct {v0, v1, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1415
    .line 1416
    .line 1417
    invoke-static {v0}, Lm30;->d(Ljava/io/File;)Z

    .line 1418
    .line 1419
    .line 1420
    const/4 v1, 0x0

    .line 1421
    const/16 v16, 0x4

    .line 1422
    .line 1423
    goto/16 :goto_f

    .line 1424
    .line 1425
    :catchall_4
    move-exception v0

    .line 1426
    :try_start_f
    monitor-exit v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 1427
    throw v0

    .line 1428
    :cond_26
    iget-object v0, v6, Lxs;->c:Ldn;

    .line 1429
    .line 1430
    invoke-virtual {v0}, Ldn;->f()Lp51;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v0

    .line 1434
    iget-object v0, v0, Lp51;->a:Lz40;

    .line 1435
    .line 1436
    invoke-virtual {v6}, Lxs;->b()Ljava/util/ArrayList;

    .line 1437
    .line 1438
    .line 1439
    move-result-object v0

    .line 1440
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 1441
    .line 1442
    .line 1443
    move-result v1

    .line 1444
    const/4 v14, 0x4

    .line 1445
    if-gt v1, v14, :cond_27

    .line 1446
    .line 1447
    goto :goto_1b

    .line 1448
    :cond_27
    invoke-virtual {v0, v14, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 1449
    .line 1450
    .line 1451
    move-result-object v0

    .line 1452
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v0

    .line 1456
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1457
    .line 1458
    .line 1459
    move-result v1

    .line 1460
    if-eqz v1, :cond_28

    .line 1461
    .line 1462
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1463
    .line 1464
    .line 1465
    move-result-object v1

    .line 1466
    check-cast v1, Ljava/io/File;

    .line 1467
    .line 1468
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1469
    .line 1470
    .line 1471
    goto :goto_1a

    .line 1472
    :cond_28
    :goto_1b
    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v3, p1

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v7, 0x3e8

    .line 10
    .line 11
    div-long v9, v1, v7

    .line 12
    .line 13
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 14
    .line 15
    iget-object v1, v0, Lor;->f:Lpd0;

    .line 16
    .line 17
    iget-object v2, v0, Lor;->h:Ldn;

    .line 18
    .line 19
    iget-object v13, v1, Lpd0;->c:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, v2, Ldn;->f:Ljava/lang/Object;

    .line 22
    .line 23
    move-object v14, v4

    .line 24
    check-cast v14, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v4, v2, Ldn;->g:Ljava/lang/Object;

    .line 27
    .line 28
    move-object v15, v4

    .line 29
    check-cast v15, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1}, Lpd0;->c()Lre;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Lre;->a:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v4, v2, Ldn;->d:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v4, Ljava/lang/String;

    .line 40
    .line 41
    const/16 v19, 0x1

    .line 42
    .line 43
    if-eqz v4, :cond_0

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move/from16 v4, v19

    .line 48
    .line 49
    :goto_0
    invoke-static {v4}, Loq;->b(I)I

    .line 50
    .line 51
    .line 52
    move-result v17

    .line 53
    iget-object v2, v2, Ldn;->h:Ljava/lang/Object;

    .line 54
    .line 55
    move-object/from16 v18, v2

    .line 56
    .line 57
    check-cast v18, Ls7;

    .line 58
    .line 59
    new-instance v12, Lmf;

    .line 60
    .line 61
    move-object/from16 v16, v1

    .line 62
    .line 63
    invoke-direct/range {v12 .. v18}, Lmf;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILs7;)V

    .line 64
    .line 65
    .line 66
    sget-object v13, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 67
    .line 68
    sget-object v14, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {}, Lml;->u()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    new-instance v2, Lof;

    .line 75
    .line 76
    invoke-direct {v2, v1}, Lof;-><init>(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v1, v0, Lor;->a:Landroid/content/Context;

    .line 80
    .line 81
    new-instance v4, Landroid/os/StatFs;

    .line 82
    .line 83
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-direct {v4, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    int-to-long v5, v6

    .line 99
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    move-wide/from16 v16, v7

    .line 104
    .line 105
    int-to-long v7, v4

    .line 106
    mul-long v25, v5, v7

    .line 107
    .line 108
    sget-object v4, Lll;->j:Lll;

    .line 109
    .line 110
    sget-object v7, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    if-eqz v5, :cond_1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_1
    invoke-virtual {v7, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    sget-object v6, Lll;->k:Ljava/util/HashMap;

    .line 124
    .line 125
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    check-cast v5, Lll;

    .line 130
    .line 131
    if-nez v5, :cond_2

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    move-object v4, v5

    .line 135
    :goto_1
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 136
    .line 137
    .line 138
    move-result v21

    .line 139
    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v4}, Ljava/lang/Runtime;->availableProcessors()I

    .line 146
    .line 147
    .line 148
    move-result v22

    .line 149
    invoke-static {v1}, Lml;->c(Landroid/content/Context;)J

    .line 150
    .line 151
    .line 152
    move-result-wide v23

    .line 153
    invoke-static {}, Lml;->t()Z

    .line 154
    .line 155
    .line 156
    move-result v27

    .line 157
    invoke-static {}, Lml;->n()I

    .line 158
    .line 159
    .line 160
    move-result v28

    .line 161
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 162
    .line 163
    sget-object v4, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 164
    .line 165
    new-instance v20, Lnf;

    .line 166
    .line 167
    invoke-direct/range {v20 .. v28}, Lnf;-><init>(IIJJZI)V

    .line 168
    .line 169
    .line 170
    move-object/from16 v5, v20

    .line 171
    .line 172
    iget-object v6, v0, Lor;->j:Ltr;

    .line 173
    .line 174
    new-instance v15, Llf;

    .line 175
    .line 176
    invoke-direct {v15, v12, v2, v5}, Llf;-><init>(Lmf;Lof;Lnf;)V

    .line 177
    .line 178
    .line 179
    iget-object v2, v6, Ltr;->a:Lis0;

    .line 180
    .line 181
    new-instance v5, Lan;

    .line 182
    .line 183
    invoke-direct {v5, v3, v9, v10, v15}, Lan;-><init>(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v2, v5}, Lis0;->a(Llw;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-eqz v2, :cond_3

    .line 194
    .line 195
    if-eqz v3, :cond_3

    .line 196
    .line 197
    iget-object v2, v0, Lor;->d:Lnm;

    .line 198
    .line 199
    iget-object v5, v2, Lnm;->l:Ljava/lang/Object;

    .line 200
    .line 201
    move-object v12, v5

    .line 202
    check-cast v12, Ljava/lang/String;

    .line 203
    .line 204
    monitor-enter v12

    .line 205
    :try_start_0
    iput-object v3, v2, Lnm;->l:Ljava/lang/Object;

    .line 206
    .line 207
    iget-object v5, v2, Lnm;->m:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v5, Lvx;

    .line 210
    .line 211
    iget-object v5, v5, Lvx;->b:Ljava/lang/Object;

    .line 212
    .line 213
    check-cast v5, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    check-cast v5, Lgh0;

    .line 220
    .line 221
    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    :try_start_1
    new-instance v6, Ljava/util/HashMap;

    .line 223
    .line 224
    iget-object v15, v5, Lgh0;->a:Ljava/util/HashMap;

    .line 225
    .line 226
    invoke-direct {v6, v15}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 230
    .line 231
    .line 232
    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 233
    :try_start_2
    monitor-exit v5

    .line 234
    iget-object v5, v2, Lnm;->o:Ljava/lang/Object;

    .line 235
    .line 236
    check-cast v5, Lny0;

    .line 237
    .line 238
    invoke-virtual {v5}, Lny0;->r()Ljava/util/List;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    iget-object v15, v2, Lnm;->k:Ljava/lang/Object;

    .line 243
    .line 244
    check-cast v15, Lc9;

    .line 245
    .line 246
    iget-object v15, v15, Lc9;->l:Ljava/lang/Object;

    .line 247
    .line 248
    check-cast v15, Lzs;

    .line 249
    .line 250
    move-object/from16 v20, v1

    .line 251
    .line 252
    new-instance v1, Lxv;

    .line 253
    .line 254
    move-object/from16 v21, v4

    .line 255
    .line 256
    move-object v4, v6

    .line 257
    const/4 v6, 0x2

    .line 258
    move-object/from16 v18, v8

    .line 259
    .line 260
    move-object/from16 v29, v20

    .line 261
    .line 262
    move-object/from16 v30, v21

    .line 263
    .line 264
    const/4 v8, 0x4

    .line 265
    invoke-direct/range {v1 .. v6}, Lxv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v15, v1}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;

    .line 269
    .line 270
    .line 271
    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 272
    goto :goto_3

    .line 273
    :catchall_0
    move-exception v0

    .line 274
    goto :goto_2

    .line 275
    :catchall_1
    move-exception v0

    .line 276
    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 277
    :try_start_4
    throw v0

    .line 278
    :goto_2
    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 279
    throw v0

    .line 280
    :cond_3
    move-object/from16 v29, v1

    .line 281
    .line 282
    move-object/from16 v30, v4

    .line 283
    .line 284
    move-object/from16 v18, v8

    .line 285
    .line 286
    const/4 v8, 0x4

    .line 287
    :goto_3
    iget-object v1, v0, Lor;->i:Ls7;

    .line 288
    .line 289
    iget-object v2, v1, Ls7;->l:Ljava/lang/Object;

    .line 290
    .line 291
    check-cast v2, La30;

    .line 292
    .line 293
    invoke-interface {v2}, La30;->c()V

    .line 294
    .line 295
    .line 296
    sget-object v2, Ls7;->n:Lok0;

    .line 297
    .line 298
    iput-object v2, v1, Ls7;->l:Ljava/lang/Object;

    .line 299
    .line 300
    if-nez v3, :cond_4

    .line 301
    .line 302
    goto :goto_4

    .line 303
    :cond_4
    iget-object v2, v1, Ls7;->k:Ljava/lang/Object;

    .line 304
    .line 305
    check-cast v2, Lm30;

    .line 306
    .line 307
    const-string v4, "userlog"

    .line 308
    .line 309
    invoke-virtual {v2, v3, v4}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    new-instance v4, Lxw0;

    .line 314
    .line 315
    invoke-direct {v4, v2}, Lxw0;-><init>(Ljava/io/File;)V

    .line 316
    .line 317
    .line 318
    iput-object v4, v1, Ls7;->l:Ljava/lang/Object;

    .line 319
    .line 320
    :goto_4
    iget-object v1, v0, Lor;->l:Llr;

    .line 321
    .line 322
    invoke-virtual {v1, v3}, Llr;->a(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    iget-object v0, v0, Lor;->m:Li7;

    .line 326
    .line 327
    iget-object v1, v0, Li7;->j:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast v1, Lvs;

    .line 330
    .line 331
    sget-object v2, Lus;->a:Ljava/nio/charset/Charset;

    .line 332
    .line 333
    new-instance v2, Lxc;

    .line 334
    .line 335
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 336
    .line 337
    .line 338
    const-string v4, "20.0.5"

    .line 339
    .line 340
    iput-object v4, v2, Lxc;->a:Ljava/lang/String;

    .line 341
    .line 342
    iget-object v4, v1, Lvs;->c:Ldn;

    .line 343
    .line 344
    iget-object v5, v4, Ldn;->a:Ljava/lang/Object;

    .line 345
    .line 346
    check-cast v5, Ljava/lang/String;

    .line 347
    .line 348
    if-eqz v5, :cond_15

    .line 349
    .line 350
    iput-object v5, v2, Lxc;->b:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v5, v1, Lvs;->b:Lpd0;

    .line 353
    .line 354
    invoke-virtual {v5}, Lpd0;->c()Lre;

    .line 355
    .line 356
    .line 357
    move-result-object v6

    .line 358
    iget-object v6, v6, Lre;->a:Ljava/lang/String;

    .line 359
    .line 360
    if-eqz v6, :cond_14

    .line 361
    .line 362
    iput-object v6, v2, Lxc;->d:Ljava/lang/String;

    .line 363
    .line 364
    invoke-virtual {v5}, Lpd0;->c()Lre;

    .line 365
    .line 366
    .line 367
    move-result-object v6

    .line 368
    iget-object v6, v6, Lre;->b:Ljava/lang/String;

    .line 369
    .line 370
    iput-object v6, v2, Lxc;->e:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v5}, Lpd0;->c()Lre;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    iget-object v6, v6, Lre;->c:Ljava/lang/String;

    .line 377
    .line 378
    iput-object v6, v2, Lxc;->f:Ljava/lang/String;

    .line 379
    .line 380
    iget-object v6, v4, Ldn;->f:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v6, Ljava/lang/String;

    .line 383
    .line 384
    if-eqz v6, :cond_13

    .line 385
    .line 386
    iput-object v6, v2, Lxc;->h:Ljava/lang/String;

    .line 387
    .line 388
    iget-object v12, v4, Ldn;->g:Ljava/lang/Object;

    .line 389
    .line 390
    check-cast v12, Ljava/lang/String;

    .line 391
    .line 392
    if-eqz v12, :cond_12

    .line 393
    .line 394
    iput-object v12, v2, Lxc;->i:Ljava/lang/String;

    .line 395
    .line 396
    iput v8, v2, Lxc;->c:I

    .line 397
    .line 398
    iget-byte v15, v2, Lxc;->m:B

    .line 399
    .line 400
    or-int/lit8 v15, v15, 0x1

    .line 401
    .line 402
    int-to-byte v15, v15

    .line 403
    iput-byte v15, v2, Lxc;->m:B

    .line 404
    .line 405
    new-instance v15, Lgd;

    .line 406
    .line 407
    invoke-direct {v15}, Ljava/lang/Object;-><init>()V

    .line 408
    .line 409
    .line 410
    move/from16 v27, v8

    .line 411
    .line 412
    const/4 v8, 0x0

    .line 413
    iput-boolean v8, v15, Lgd;->f:Z

    .line 414
    .line 415
    iget-byte v8, v15, Lgd;->m:B

    .line 416
    .line 417
    or-int/lit8 v8, v8, 0x2

    .line 418
    .line 419
    int-to-byte v8, v8

    .line 420
    iput-wide v9, v15, Lgd;->d:J

    .line 421
    .line 422
    or-int/lit8 v8, v8, 0x1

    .line 423
    .line 424
    int-to-byte v8, v8

    .line 425
    iput-byte v8, v15, Lgd;->m:B

    .line 426
    .line 427
    if-eqz v3, :cond_11

    .line 428
    .line 429
    iput-object v3, v15, Lgd;->b:Ljava/lang/String;

    .line 430
    .line 431
    sget-object v3, Lvs;->g:Ljava/lang/String;

    .line 432
    .line 433
    if-eqz v3, :cond_10

    .line 434
    .line 435
    iput-object v3, v15, Lgd;->a:Ljava/lang/String;

    .line 436
    .line 437
    iget-object v3, v5, Lpd0;->c:Ljava/lang/String;

    .line 438
    .line 439
    if-eqz v3, :cond_f

    .line 440
    .line 441
    iget-object v4, v4, Ldn;->h:Ljava/lang/Object;

    .line 442
    .line 443
    check-cast v4, Ls7;

    .line 444
    .line 445
    invoke-virtual {v5}, Lpd0;->c()Lre;

    .line 446
    .line 447
    .line 448
    move-result-object v5

    .line 449
    iget-object v5, v5, Lre;->a:Ljava/lang/String;

    .line 450
    .line 451
    iget-object v8, v4, Ls7;->l:Ljava/lang/Object;

    .line 452
    .line 453
    check-cast v8, Ls7;

    .line 454
    .line 455
    if-nez v8, :cond_5

    .line 456
    .line 457
    new-instance v8, Ls7;

    .line 458
    .line 459
    invoke-direct {v8, v4}, Ls7;-><init>(Ls7;)V

    .line 460
    .line 461
    .line 462
    iput-object v8, v4, Ls7;->l:Ljava/lang/Object;

    .line 463
    .line 464
    :cond_5
    move-object v9, v8

    .line 465
    iget-object v8, v8, Ls7;->k:Ljava/lang/Object;

    .line 466
    .line 467
    move-object/from16 v25, v8

    .line 468
    .line 469
    check-cast v25, Ljava/lang/String;

    .line 470
    .line 471
    if-nez v9, :cond_6

    .line 472
    .line 473
    new-instance v9, Ls7;

    .line 474
    .line 475
    invoke-direct {v9, v4}, Ls7;-><init>(Ls7;)V

    .line 476
    .line 477
    .line 478
    iput-object v9, v4, Ls7;->l:Ljava/lang/Object;

    .line 479
    .line 480
    :cond_6
    iget-object v4, v9, Ls7;->l:Ljava/lang/Object;

    .line 481
    .line 482
    move-object/from16 v26, v4

    .line 483
    .line 484
    check-cast v26, Ljava/lang/String;

    .line 485
    .line 486
    new-instance v20, Lid;

    .line 487
    .line 488
    move-object/from16 v21, v3

    .line 489
    .line 490
    move-object/from16 v24, v5

    .line 491
    .line 492
    move-object/from16 v22, v6

    .line 493
    .line 494
    move-object/from16 v23, v12

    .line 495
    .line 496
    invoke-direct/range {v20 .. v26}, Lid;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    move-object/from16 v3, v20

    .line 500
    .line 501
    iput-object v3, v15, Lgd;->g:Lbs;

    .line 502
    .line 503
    new-instance v3, Lfe;

    .line 504
    .line 505
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 506
    .line 507
    .line 508
    const/4 v4, 0x3

    .line 509
    iput v4, v3, Lfe;->a:I

    .line 510
    .line 511
    iget-byte v5, v3, Lfe;->e:B

    .line 512
    .line 513
    or-int/lit8 v5, v5, 0x1

    .line 514
    .line 515
    int-to-byte v5, v5

    .line 516
    iput-byte v5, v3, Lfe;->e:B

    .line 517
    .line 518
    if-eqz v13, :cond_e

    .line 519
    .line 520
    iput-object v13, v3, Lfe;->b:Ljava/lang/String;

    .line 521
    .line 522
    if-eqz v14, :cond_d

    .line 523
    .line 524
    iput-object v14, v3, Lfe;->c:Ljava/lang/String;

    .line 525
    .line 526
    invoke-static {}, Lml;->u()Z

    .line 527
    .line 528
    .line 529
    move-result v5

    .line 530
    iput-boolean v5, v3, Lfe;->d:Z

    .line 531
    .line 532
    iget-byte v5, v3, Lfe;->e:B

    .line 533
    .line 534
    or-int/lit8 v5, v5, 0x2

    .line 535
    .line 536
    int-to-byte v5, v5

    .line 537
    iput-byte v5, v3, Lfe;->e:B

    .line 538
    .line 539
    invoke-virtual {v3}, Lfe;->a()Lge;

    .line 540
    .line 541
    .line 542
    move-result-object v3

    .line 543
    iput-object v3, v15, Lgd;->i:Lrs;

    .line 544
    .line 545
    new-instance v3, Landroid/os/StatFs;

    .line 546
    .line 547
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 548
    .line 549
    .line 550
    move-result-object v5

    .line 551
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v5

    .line 555
    invoke-direct {v3, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 556
    .line 557
    .line 558
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 559
    .line 560
    .line 561
    move-result v5

    .line 562
    const/4 v6, 0x7

    .line 563
    if-eqz v5, :cond_7

    .line 564
    .line 565
    goto :goto_5

    .line 566
    :cond_7
    sget-object v5, Lvs;->f:Ljava/util/HashMap;

    .line 567
    .line 568
    invoke-virtual {v7, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v7

    .line 572
    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v5

    .line 576
    check-cast v5, Ljava/lang/Integer;

    .line 577
    .line 578
    if-nez v5, :cond_8

    .line 579
    .line 580
    goto :goto_5

    .line 581
    :cond_8
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 582
    .line 583
    .line 584
    move-result v6

    .line 585
    :goto_5
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 586
    .line 587
    .line 588
    move-result-object v5

    .line 589
    invoke-virtual {v5}, Ljava/lang/Runtime;->availableProcessors()I

    .line 590
    .line 591
    .line 592
    move-result v5

    .line 593
    iget-object v1, v1, Lvs;->a:Landroid/content/Context;

    .line 594
    .line 595
    invoke-static {v1}, Lml;->c(Landroid/content/Context;)J

    .line 596
    .line 597
    .line 598
    move-result-wide v7

    .line 599
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockCount()I

    .line 600
    .line 601
    .line 602
    move-result v1

    .line 603
    int-to-long v9, v1

    .line 604
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockSize()I

    .line 605
    .line 606
    .line 607
    move-result v1

    .line 608
    int-to-long v11, v1

    .line 609
    mul-long/2addr v9, v11

    .line 610
    invoke-static {}, Lml;->t()Z

    .line 611
    .line 612
    .line 613
    move-result v1

    .line 614
    invoke-static {}, Lml;->n()I

    .line 615
    .line 616
    .line 617
    move-result v3

    .line 618
    new-instance v11, Lkd;

    .line 619
    .line 620
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 621
    .line 622
    .line 623
    iput v6, v11, Lkd;->a:I

    .line 624
    .line 625
    iget-byte v6, v11, Lkd;->j:B

    .line 626
    .line 627
    or-int/lit8 v6, v6, 0x1

    .line 628
    .line 629
    int-to-byte v6, v6

    .line 630
    iput-byte v6, v11, Lkd;->j:B

    .line 631
    .line 632
    if-eqz v18, :cond_c

    .line 633
    .line 634
    move-object/from16 v12, v18

    .line 635
    .line 636
    iput-object v12, v11, Lkd;->b:Ljava/lang/String;

    .line 637
    .line 638
    iput v5, v11, Lkd;->c:I

    .line 639
    .line 640
    or-int/lit8 v5, v6, 0x2

    .line 641
    .line 642
    int-to-byte v5, v5

    .line 643
    iput-wide v7, v11, Lkd;->d:J

    .line 644
    .line 645
    or-int/lit8 v5, v5, 0x4

    .line 646
    .line 647
    int-to-byte v5, v5

    .line 648
    iput-wide v9, v11, Lkd;->e:J

    .line 649
    .line 650
    or-int/lit8 v5, v5, 0x8

    .line 651
    .line 652
    int-to-byte v5, v5

    .line 653
    iput-boolean v1, v11, Lkd;->f:Z

    .line 654
    .line 655
    or-int/lit8 v1, v5, 0x10

    .line 656
    .line 657
    int-to-byte v1, v1

    .line 658
    iput v3, v11, Lkd;->g:I

    .line 659
    .line 660
    or-int/lit8 v1, v1, 0x20

    .line 661
    .line 662
    int-to-byte v1, v1

    .line 663
    iput-byte v1, v11, Lkd;->j:B

    .line 664
    .line 665
    move-object/from16 v1, v29

    .line 666
    .line 667
    if-eqz v1, :cond_b

    .line 668
    .line 669
    iput-object v1, v11, Lkd;->h:Ljava/lang/String;

    .line 670
    .line 671
    move-object/from16 v1, v30

    .line 672
    .line 673
    if-eqz v1, :cond_a

    .line 674
    .line 675
    iput-object v1, v11, Lkd;->i:Ljava/lang/String;

    .line 676
    .line 677
    invoke-virtual {v11}, Lkd;->a()Lld;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    iput-object v1, v15, Lgd;->j:Lcs;

    .line 682
    .line 683
    iput v4, v15, Lgd;->l:I

    .line 684
    .line 685
    iget-byte v1, v15, Lgd;->m:B

    .line 686
    .line 687
    or-int/lit8 v1, v1, 0x4

    .line 688
    .line 689
    int-to-byte v1, v1

    .line 690
    iput-byte v1, v15, Lgd;->m:B

    .line 691
    .line 692
    invoke-virtual {v15}, Lgd;->a()Lhd;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    iput-object v1, v2, Lxc;->j:Lts;

    .line 697
    .line 698
    invoke-virtual {v2}, Lxc;->a()Lyc;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    iget-object v0, v0, Li7;->k:Ljava/lang/Object;

    .line 703
    .line 704
    check-cast v0, Lxs;

    .line 705
    .line 706
    iget-object v0, v0, Lxs;->b:Lm30;

    .line 707
    .line 708
    iget-object v2, v1, Lyc;->k:Lts;

    .line 709
    .line 710
    if-nez v2, :cond_9

    .line 711
    .line 712
    goto :goto_7

    .line 713
    :cond_9
    move-object v3, v2

    .line 714
    check-cast v3, Lhd;

    .line 715
    .line 716
    iget-object v3, v3, Lhd;->b:Ljava/lang/String;

    .line 717
    .line 718
    :try_start_5
    sget-object v4, Lxs;->g:Lws;

    .line 719
    .line 720
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 721
    .line 722
    .line 723
    sget-object v4, Lws;->a:Lpa0;

    .line 724
    .line 725
    invoke-virtual {v4, v1}, Lpa0;->r(Ljava/lang/Object;)Ljava/lang/String;

    .line 726
    .line 727
    .line 728
    move-result-object v1

    .line 729
    const-string v4, "report"

    .line 730
    .line 731
    invoke-virtual {v0, v3, v4}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 732
    .line 733
    .line 734
    move-result-object v4

    .line 735
    invoke-static {v4, v1}, Lxs;->f(Ljava/io/File;Ljava/lang/String;)V

    .line 736
    .line 737
    .line 738
    const-string v1, "start-time"

    .line 739
    .line 740
    invoke-virtual {v0, v3, v1}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    const-string v1, ""

    .line 745
    .line 746
    check-cast v2, Lhd;

    .line 747
    .line 748
    iget-wide v2, v2, Lhd;->d:J

    .line 749
    .line 750
    new-instance v4, Ljava/io/OutputStreamWriter;

    .line 751
    .line 752
    new-instance v5, Ljava/io/FileOutputStream;

    .line 753
    .line 754
    invoke-direct {v5, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 755
    .line 756
    .line 757
    sget-object v6, Lxs;->e:Ljava/nio/charset/Charset;

    .line 758
    .line 759
    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 760
    .line 761
    .line 762
    :try_start_6
    invoke-virtual {v4, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 763
    .line 764
    .line 765
    mul-long v2, v2, v16

    .line 766
    .line 767
    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 768
    .line 769
    .line 770
    :try_start_7
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 771
    .line 772
    .line 773
    return-void

    .line 774
    :catchall_2
    move-exception v0

    .line 775
    move-object v1, v0

    .line 776
    :try_start_8
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 777
    .line 778
    .line 779
    goto :goto_6

    .line 780
    :catchall_3
    move-exception v0

    .line 781
    :try_start_9
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 782
    .line 783
    .line 784
    :goto_6
    throw v1
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .line 785
    :catch_0
    :goto_7
    return-void

    .line 786
    :cond_a
    const-string v0, "Null modelClass"

    .line 787
    .line 788
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 789
    .line 790
    .line 791
    return-void

    .line 792
    :cond_b
    const-string v0, "Null manufacturer"

    .line 793
    .line 794
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 795
    .line 796
    .line 797
    return-void

    .line 798
    :cond_c
    const-string v0, "Null model"

    .line 799
    .line 800
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 801
    .line 802
    .line 803
    return-void

    .line 804
    :cond_d
    const-string v0, "Null buildVersion"

    .line 805
    .line 806
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 807
    .line 808
    .line 809
    return-void

    .line 810
    :cond_e
    const-string v0, "Null version"

    .line 811
    .line 812
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 813
    .line 814
    .line 815
    return-void

    .line 816
    :cond_f
    const-string v0, "Null identifier"

    .line 817
    .line 818
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 819
    .line 820
    .line 821
    return-void

    .line 822
    :cond_10
    const-string v0, "Null generator"

    .line 823
    .line 824
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 825
    .line 826
    .line 827
    return-void

    .line 828
    :cond_11
    const-string v0, "Null identifier"

    .line 829
    .line 830
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 831
    .line 832
    .line 833
    return-void

    .line 834
    :cond_12
    const-string v0, "Null displayVersion"

    .line 835
    .line 836
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 837
    .line 838
    .line 839
    return-void

    .line 840
    :cond_13
    const-string v0, "Null buildVersion"

    .line 841
    .line 842
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 843
    .line 844
    .line 845
    return-void

    .line 846
    :cond_14
    const-string v0, "Null installationUuid"

    .line 847
    .line 848
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 849
    .line 850
    .line 851
    return-void

    .line 852
    :cond_15
    const-string v0, "Null gmpAppId"

    .line 853
    .line 854
    invoke-static {v0}, Lwd1;->d(Ljava/lang/String;)V

    .line 855
    .line 856
    .line 857
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "com.google.firebase.crashlytics.version_control_info"

    .line 2
    .line 3
    const-string v1, "string"

    .line 4
    .line 5
    iget-object p0, p0, Lor;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0, v0, v1}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move-object p0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    const/4 v0, 0x0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    sget-object v1, Lor;->s:Ljava/nio/charset/Charset;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    const-class p0, Lor;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    move-object p0, v1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const-string v2, "META-INF/version-control-info.textproto"

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_1
    if-eqz p0, :cond_4

    .line 55
    .line 56
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 57
    .line 58
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 59
    .line 60
    .line 61
    const/16 v2, 0x400

    .line 62
    .line 63
    :try_start_1
    new-array v2, v2, [B

    .line 64
    .line 65
    :goto_2
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    const/4 v4, -0x1

    .line 70
    if-eq v3, v4, :cond_3

    .line 71
    .line 72
    invoke-virtual {v1, v2, v0, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    goto :goto_3

    .line 78
    :cond_3
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 79
    .line 80
    .line 81
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    :try_start_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 83
    .line 84
    .line 85
    invoke-static {v2, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 89
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :catchall_1
    move-exception v0

    .line 94
    goto :goto_5

    .line 95
    :goto_3
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 96
    .line 97
    .line 98
    goto :goto_4

    .line 99
    :catchall_2
    move-exception v1

    .line 100
    :try_start_4
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    :goto_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 104
    :goto_5
    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 105
    .line 106
    .line 107
    goto :goto_6

    .line 108
    :catchall_3
    move-exception p0

    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    :goto_6
    throw v0

    .line 113
    :cond_4
    if-eqz p0, :cond_5

    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 116
    .line 117
    .line 118
    :cond_5
    return-object v1
.end method

.method public final d()Ljd2;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lor;->g:Lm30;

    .line 7
    .line 8
    iget-object v1, v1, Lm30;->l:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ljava/io/File;

    .line 11
    .line 12
    sget-object v2, Lor;->r:Ly1;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/io/File;

    .line 37
    .line 38
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x3

    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 51
    :try_start_1
    const-string v5, "com.google.firebase.crash.FirebaseCrash"

    .line 52
    .line 53
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    :try_start_2
    invoke-static {v3}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    goto :goto_1

    .line 62
    :catch_0
    new-instance v5, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 63
    .line 64
    const/4 v6, 0x1

    .line 65
    invoke-direct {v5, v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    .line 66
    .line 67
    .line 68
    new-instance v6, Lnr;

    .line 69
    .line 70
    invoke-direct {v6, p0, v3, v4}, Lnr;-><init>(Lor;J)V

    .line 71
    .line 72
    .line 73
    invoke-static {v5, v6}, Lbe2;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Ljd2;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    :goto_1
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :catch_1
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    :goto_2
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    invoke-static {v0}, Lbe2;->x(Ljava/util/List;)Ljd2;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public final e()V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lor;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    :try_start_1
    iget-object v1, p0, Lor;->d:Lnm;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lnm;->l(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    :try_start_2
    iget-object p0, p0, Lor;->a:Landroid/content/Context;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 23
    .line 24
    and-int/lit8 p0, p0, 0x2

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 30
    :catch_1
    :cond_1
    :goto_0
    return-void
.end method

.method public final f(Ljd2;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lor;->o:Llb1;

    .line 2
    .line 3
    iget-object v1, p0, Lor;->m:Li7;

    .line 4
    .line 5
    iget-object v1, v1, Li7;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lxs;

    .line 8
    .line 9
    iget-object v1, v1, Lxs;->b:Lm30;

    .line 10
    .line 11
    iget-object v2, v1, Lm30;->n:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/io/File;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-object v2, v1, Lm30;->o:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v2, Ljava/io/File;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    iget-object v1, v1, Lm30;->p:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v1, Ljava/io/File;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Llb1;->b(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    :goto_0
    iget-object v1, p0, Lor;->b:Lqt;

    .line 73
    .line 74
    invoke-virtual {v1}, Lqt;->l()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Llb1;->b(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Llb1;->b(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, v1, Lqt;->d:Ljava/lang/Object;

    .line 98
    .line 99
    monitor-enter v0

    .line 100
    :try_start_0
    iget-object v1, v1, Lqt;->e:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v1, Llb1;

    .line 103
    .line 104
    iget-object v1, v1, Llb1;->a:Ljd2;

    .line 105
    .line 106
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    new-instance v0, Lok0;

    .line 108
    .line 109
    const/16 v2, 0xb

    .line 110
    .line 111
    invoke-direct {v0, v2}, Lok0;-><init>(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    sget-object v2, Lmb1;->a:Lq10;

    .line 118
    .line 119
    new-instance v3, Ljd2;

    .line 120
    .line 121
    invoke-direct {v3}, Ljd2;-><init>()V

    .line 122
    .line 123
    .line 124
    new-instance v4, Lkz1;

    .line 125
    .line 126
    invoke-direct {v4, v2, v0, v3}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lpa1;Ljd2;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, v1, Ljd2;->b:Lo80;

    .line 130
    .line 131
    invoke-virtual {v0, v4}, Lo80;->f(Llb2;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljd2;->q()V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lor;->p:Llb1;

    .line 138
    .line 139
    iget-object v0, v0, Llb1;->a:Ljd2;

    .line 140
    .line 141
    invoke-static {v3, v0}, Les0;->m(Ljd2;Ljd2;)Ljd2;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    :goto_1
    iget-object v1, p0, Lor;->e:Lc9;

    .line 146
    .line 147
    iget-object v1, v1, Lc9;->k:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v1, Lzs;

    .line 150
    .line 151
    new-instance v2, Ls7;

    .line 152
    .line 153
    const/16 v3, 0xd

    .line 154
    .line 155
    invoke-direct {v2, p0, v3, p1}, Ls7;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v1, v2}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :catchall_0
    move-exception p0

    .line 163
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    throw p0
.end method
