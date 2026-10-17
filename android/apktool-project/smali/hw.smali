.class public final Lhw;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/ArrayList;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lhw;->d:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lhw;->e:Z

    .line 22
    .line 23
    iput-object p1, p0, Lhw;->a:Landroid/view/ViewGroup;

    .line 24
    .line 25
    return-void
.end method

.method public static f(Landroid/view/ViewGroup;Lt11;)Lhw;
    .locals 3

    .line 1
    const v0, 0x7f0901c4

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    instance-of v2, v1, Lhw;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    check-cast v1, Lhw;

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    new-instance p1, Lhw;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lhw;-><init>(Landroid/view/ViewGroup;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method


# virtual methods
.method public final a(IILandroidx/fragment/app/a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lxi;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v2, p3, Landroidx/fragment/app/a;->c:Lh70;

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Lhw;->d(Lh70;)Lw81;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2, p1, p2}, Lw81;->c(II)V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v2, Lw81;

    .line 25
    .line 26
    invoke-direct {v2, p1, p2, p3, v1}, Lw81;-><init>(IILandroidx/fragment/app/a;Lxi;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance p1, Lu81;

    .line 35
    .line 36
    invoke-direct {p1, p0, v2}, Lu81;-><init>(Lhw;Lw81;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, v2, Lw81;->d:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance p1, Lv81;

    .line 45
    .line 46
    invoke-direct {p1, p0, v2}, Lv81;-><init>(Lhw;Lw81;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v2, Lw81;->d:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0
.end method

.method public final b(Ljava/util/ArrayList;Z)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    move v7, v4

    .line 14
    move-object v6, v5

    .line 15
    :cond_0
    :goto_0
    const/4 v8, 0x3

    .line 16
    const/4 v9, 0x2

    .line 17
    const/4 v10, 0x1

    .line 18
    if-ge v7, v3, :cond_3

    .line 19
    .line 20
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v11

    .line 24
    add-int/lit8 v7, v7, 0x1

    .line 25
    .line 26
    check-cast v11, Lw81;

    .line 27
    .line 28
    iget-object v12, v11, Lw81;->c:Lh70;

    .line 29
    .line 30
    iget-object v12, v12, Lh70;->N:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v12}, Lx81;->c(Landroid/view/View;)I

    .line 33
    .line 34
    .line 35
    move-result v12

    .line 36
    iget v13, v11, Lw81;->a:I

    .line 37
    .line 38
    invoke-static {v13}, Loq;->t(I)I

    .line 39
    .line 40
    .line 41
    move-result v13

    .line 42
    if-eqz v13, :cond_2

    .line 43
    .line 44
    if-eq v13, v10, :cond_1

    .line 45
    .line 46
    if-eq v13, v9, :cond_2

    .line 47
    .line 48
    if-eq v13, v8, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    if-eq v12, v9, :cond_0

    .line 52
    .line 53
    move-object v6, v11

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    if-ne v12, v9, :cond_0

    .line 56
    .line 57
    if-nez v5, :cond_0

    .line 58
    .line 59
    move-object v5, v11

    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-static {v9}, Lz70;->F(I)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_4

    .line 66
    .line 67
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    :cond_4
    new-instance v3, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v7, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    new-instance v11, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v11, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 89
    .line 90
    .line 91
    move-result v12

    .line 92
    sub-int/2addr v12, v10

    .line 93
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    check-cast v12, Lw81;

    .line 98
    .line 99
    iget-object v12, v12, Lw81;->c:Lh70;

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    move v14, v4

    .line 106
    :goto_1
    if-ge v14, v13, :cond_5

    .line 107
    .line 108
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v15

    .line 112
    add-int/lit8 v14, v14, 0x1

    .line 113
    .line 114
    check-cast v15, Lw81;

    .line 115
    .line 116
    iget-object v15, v15, Lw81;->c:Lh70;

    .line 117
    .line 118
    iget-object v15, v15, Lh70;->Q:Lg70;

    .line 119
    .line 120
    iget-object v10, v12, Lh70;->Q:Lg70;

    .line 121
    .line 122
    iget v8, v10, Lg70;->b:I

    .line 123
    .line 124
    iput v8, v15, Lg70;->b:I

    .line 125
    .line 126
    iget v8, v10, Lg70;->c:I

    .line 127
    .line 128
    iput v8, v15, Lg70;->c:I

    .line 129
    .line 130
    iget v8, v10, Lg70;->d:I

    .line 131
    .line 132
    iput v8, v15, Lg70;->d:I

    .line 133
    .line 134
    iget v8, v10, Lg70;->e:I

    .line 135
    .line 136
    iput v8, v15, Lg70;->e:I

    .line 137
    .line 138
    const/4 v8, 0x3

    .line 139
    const/4 v10, 0x1

    .line 140
    goto :goto_1

    .line 141
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 142
    .line 143
    .line 144
    move-result v8

    .line 145
    move v10, v4

    .line 146
    :goto_2
    if-ge v10, v8, :cond_e

    .line 147
    .line 148
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v12

    .line 152
    add-int/lit8 v10, v10, 0x1

    .line 153
    .line 154
    check-cast v12, Lw81;

    .line 155
    .line 156
    new-instance v13, Lxi;

    .line 157
    .line 158
    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v12}, Lw81;->d()V

    .line 162
    .line 163
    .line 164
    iget-object v14, v12, Lw81;->e:Ljava/util/HashSet;

    .line 165
    .line 166
    invoke-virtual {v14, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    new-instance v15, Lfw;

    .line 170
    .line 171
    invoke-direct {v15, v12, v13}, Ld7;-><init>(Lw81;Lxi;)V

    .line 172
    .line 173
    .line 174
    iput-boolean v4, v15, Lfw;->d:Z

    .line 175
    .line 176
    iput-boolean v2, v15, Lfw;->c:Z

    .line 177
    .line 178
    invoke-virtual {v3, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    new-instance v13, Lxi;

    .line 182
    .line 183
    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v12}, Lw81;->d()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v14, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    new-instance v14, Lgw;

    .line 193
    .line 194
    if-eqz v2, :cond_7

    .line 195
    .line 196
    if-ne v12, v5, :cond_6

    .line 197
    .line 198
    :goto_3
    const/4 v15, 0x1

    .line 199
    goto :goto_4

    .line 200
    :cond_6
    move v15, v4

    .line 201
    goto :goto_4

    .line 202
    :cond_7
    if-ne v12, v6, :cond_6

    .line 203
    .line 204
    goto :goto_3

    .line 205
    :goto_4
    invoke-direct {v14, v12, v13}, Ld7;-><init>(Lw81;Lxi;)V

    .line 206
    .line 207
    .line 208
    iget v13, v12, Lw81;->a:I

    .line 209
    .line 210
    iget-object v4, v12, Lw81;->c:Lh70;

    .line 211
    .line 212
    if-ne v13, v9, :cond_a

    .line 213
    .line 214
    if-eqz v2, :cond_8

    .line 215
    .line 216
    iget-object v13, v4, Lh70;->Q:Lg70;

    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_8
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    .line 221
    .line 222
    :goto_5
    if-eqz v2, :cond_9

    .line 223
    .line 224
    iget-object v13, v4, Lh70;->Q:Lg70;

    .line 225
    .line 226
    goto :goto_6

    .line 227
    :cond_9
    iget-object v13, v4, Lh70;->Q:Lg70;

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_a
    if-eqz v2, :cond_b

    .line 231
    .line 232
    iget-object v13, v4, Lh70;->Q:Lg70;

    .line 233
    .line 234
    goto :goto_6

    .line 235
    :cond_b
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    .line 237
    .line 238
    :goto_6
    if-eqz v15, :cond_d

    .line 239
    .line 240
    if-eqz v2, :cond_c

    .line 241
    .line 242
    iget-object v4, v4, Lh70;->Q:Lg70;

    .line 243
    .line 244
    goto :goto_7

    .line 245
    :cond_c
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 246
    .line 247
    .line 248
    :cond_d
    :goto_7
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    new-instance v4, Lbw;

    .line 252
    .line 253
    invoke-direct {v4, v0, v11, v12}, Lbw;-><init>(Lhw;Ljava/util/ArrayList;Lw81;)V

    .line 254
    .line 255
    .line 256
    iget-object v12, v12, Lw81;->d:Ljava/util/ArrayList;

    .line 257
    .line 258
    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    const/4 v4, 0x0

    .line 262
    goto :goto_2

    .line 263
    :cond_e
    new-instance v1, Ljava/util/HashMap;

    .line 264
    .line 265
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    const/4 v4, 0x0

    .line 273
    :goto_8
    if-ge v4, v2, :cond_f

    .line 274
    .line 275
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v8

    .line 279
    add-int/lit8 v4, v4, 0x1

    .line 280
    .line 281
    check-cast v8, Lgw;

    .line 282
    .line 283
    iget-object v8, v8, Ld7;->a:Ljava/lang/Object;

    .line 284
    .line 285
    check-cast v8, Lw81;

    .line 286
    .line 287
    iget-object v10, v8, Lw81;->c:Lh70;

    .line 288
    .line 289
    iget-object v10, v10, Lh70;->N:Landroid/view/View;

    .line 290
    .line 291
    invoke-static {v10}, Lx81;->c(Landroid/view/View;)I

    .line 292
    .line 293
    .line 294
    move-result v10

    .line 295
    iget v8, v8, Lw81;->a:I

    .line 296
    .line 297
    goto :goto_8

    .line 298
    :cond_f
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    const/4 v4, 0x0

    .line 303
    :goto_9
    if-ge v4, v2, :cond_10

    .line 304
    .line 305
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v8

    .line 309
    add-int/lit8 v4, v4, 0x1

    .line 310
    .line 311
    check-cast v8, Lgw;

    .line 312
    .line 313
    iget-object v10, v8, Ld7;->a:Ljava/lang/Object;

    .line 314
    .line 315
    check-cast v10, Lw81;

    .line 316
    .line 317
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 318
    .line 319
    invoke-virtual {v1, v10, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v8}, Ld7;->d()V

    .line 323
    .line 324
    .line 325
    goto :goto_9

    .line 326
    :cond_10
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 327
    .line 328
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    iget-object v0, v0, Lhw;->a:Landroid/view/ViewGroup;

    .line 333
    .line 334
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    new-instance v7, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 344
    .line 345
    .line 346
    move-result v8

    .line 347
    const/4 v10, 0x0

    .line 348
    const/4 v12, 0x0

    .line 349
    :goto_a
    if-ge v12, v8, :cond_1a

    .line 350
    .line 351
    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v13

    .line 355
    add-int/lit8 v12, v12, 0x1

    .line 356
    .line 357
    check-cast v13, Lfw;

    .line 358
    .line 359
    iget-object v14, v13, Ld7;->a:Ljava/lang/Object;

    .line 360
    .line 361
    check-cast v14, Lw81;

    .line 362
    .line 363
    iget-object v15, v14, Lw81;->c:Lh70;

    .line 364
    .line 365
    iget-object v15, v15, Lh70;->N:Landroid/view/View;

    .line 366
    .line 367
    invoke-static {v15}, Lx81;->c(Landroid/view/View;)I

    .line 368
    .line 369
    .line 370
    move-result v15

    .line 371
    iget v14, v14, Lw81;->a:I

    .line 372
    .line 373
    if-eq v15, v14, :cond_11

    .line 374
    .line 375
    if-eq v15, v9, :cond_12

    .line 376
    .line 377
    if-eq v14, v9, :cond_12

    .line 378
    .line 379
    :cond_11
    move/from16 p1, v2

    .line 380
    .line 381
    move-object/from16 v24, v3

    .line 382
    .line 383
    move/from16 v23, v9

    .line 384
    .line 385
    const/4 v3, 0x3

    .line 386
    const/16 v16, 0x0

    .line 387
    .line 388
    move-object v9, v0

    .line 389
    goto/16 :goto_d

    .line 390
    .line 391
    :cond_12
    invoke-virtual {v13, v4}, Lfw;->j(Landroid/content/Context;)Ls7;

    .line 392
    .line 393
    .line 394
    move-result-object v14

    .line 395
    if-nez v14, :cond_13

    .line 396
    .line 397
    invoke-virtual {v13}, Ld7;->d()V

    .line 398
    .line 399
    .line 400
    :goto_b
    move/from16 p1, v2

    .line 401
    .line 402
    move-object/from16 v24, v3

    .line 403
    .line 404
    move/from16 v23, v9

    .line 405
    .line 406
    const/4 v3, 0x3

    .line 407
    const/16 v16, 0x0

    .line 408
    .line 409
    move-object v9, v0

    .line 410
    goto/16 :goto_e

    .line 411
    .line 412
    :cond_13
    iget-object v14, v14, Ls7;->l:Ljava/lang/Object;

    .line 413
    .line 414
    check-cast v14, Landroid/animation/Animator;

    .line 415
    .line 416
    if-nez v14, :cond_14

    .line 417
    .line 418
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    goto :goto_b

    .line 422
    :cond_14
    iget-object v15, v13, Ld7;->a:Ljava/lang/Object;

    .line 423
    .line 424
    check-cast v15, Lw81;

    .line 425
    .line 426
    move/from16 v23, v9

    .line 427
    .line 428
    iget-object v9, v15, Lw81;->c:Lh70;

    .line 429
    .line 430
    move/from16 p1, v2

    .line 431
    .line 432
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 433
    .line 434
    move-object/from16 v24, v3

    .line 435
    .line 436
    invoke-virtual {v1, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v3

    .line 440
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    move-result v2

    .line 444
    if-eqz v2, :cond_16

    .line 445
    .line 446
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    if-eqz v2, :cond_15

    .line 451
    .line 452
    invoke-static {v9}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    :cond_15
    invoke-virtual {v13}, Ld7;->d()V

    .line 456
    .line 457
    .line 458
    move-object v9, v0

    .line 459
    const/4 v3, 0x3

    .line 460
    const/16 v16, 0x0

    .line 461
    .line 462
    goto :goto_e

    .line 463
    :cond_16
    iget v2, v15, Lw81;->a:I

    .line 464
    .line 465
    const/4 v3, 0x3

    .line 466
    if-ne v2, v3, :cond_17

    .line 467
    .line 468
    const/16 v20, 0x1

    .line 469
    .line 470
    goto :goto_c

    .line 471
    :cond_17
    const/16 v20, 0x0

    .line 472
    .line 473
    :goto_c
    if-eqz v20, :cond_18

    .line 474
    .line 475
    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    :cond_18
    iget-object v2, v9, Lh70;->N:Landroid/view/View;

    .line 479
    .line 480
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 481
    .line 482
    .line 483
    new-instance v17, Lcw;

    .line 484
    .line 485
    move-object/from16 v18, v0

    .line 486
    .line 487
    move-object/from16 v19, v2

    .line 488
    .line 489
    move-object/from16 v22, v13

    .line 490
    .line 491
    move-object/from16 v21, v15

    .line 492
    .line 493
    invoke-direct/range {v17 .. v22}, Lcw;-><init>(Landroid/view/ViewGroup;Landroid/view/View;ZLw81;Lfw;)V

    .line 494
    .line 495
    .line 496
    move-object/from16 v2, v17

    .line 497
    .line 498
    move-object/from16 v9, v18

    .line 499
    .line 500
    move-object/from16 v0, v19

    .line 501
    .line 502
    invoke-virtual {v14, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v14, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 506
    .line 507
    .line 508
    invoke-virtual {v14}, Landroid/animation/Animator;->start()V

    .line 509
    .line 510
    .line 511
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 512
    .line 513
    .line 514
    move-result v0

    .line 515
    if-eqz v0, :cond_19

    .line 516
    .line 517
    invoke-virtual {v15}, Lw81;->toString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    :cond_19
    iget-object v0, v13, Ld7;->b:Ljava/lang/Object;

    .line 521
    .line 522
    check-cast v0, Lxi;

    .line 523
    .line 524
    new-instance v2, Ls7;

    .line 525
    .line 526
    const/16 v10, 0x10

    .line 527
    .line 528
    const/4 v13, 0x0

    .line 529
    invoke-direct {v2, v14, v15, v10, v13}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v0, v2}, Lxi;->a(Lwi;)V

    .line 533
    .line 534
    .line 535
    move/from16 v2, p1

    .line 536
    .line 537
    move-object v0, v9

    .line 538
    move/from16 v9, v23

    .line 539
    .line 540
    move-object/from16 v3, v24

    .line 541
    .line 542
    const/4 v10, 0x1

    .line 543
    goto/16 :goto_a

    .line 544
    .line 545
    :goto_d
    invoke-virtual {v13}, Ld7;->d()V

    .line 546
    .line 547
    .line 548
    :goto_e
    move/from16 v2, p1

    .line 549
    .line 550
    move-object v0, v9

    .line 551
    move/from16 v9, v23

    .line 552
    .line 553
    move-object/from16 v3, v24

    .line 554
    .line 555
    goto/16 :goto_a

    .line 556
    .line 557
    :cond_1a
    move/from16 p1, v2

    .line 558
    .line 559
    move/from16 v23, v9

    .line 560
    .line 561
    const/16 v16, 0x0

    .line 562
    .line 563
    move-object v9, v0

    .line 564
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 565
    .line 566
    .line 567
    move-result v0

    .line 568
    move/from16 v13, v16

    .line 569
    .line 570
    :goto_f
    if-ge v13, v0, :cond_21

    .line 571
    .line 572
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    add-int/lit8 v13, v13, 0x1

    .line 577
    .line 578
    check-cast v1, Lfw;

    .line 579
    .line 580
    iget-object v2, v1, Ld7;->a:Ljava/lang/Object;

    .line 581
    .line 582
    check-cast v2, Lw81;

    .line 583
    .line 584
    iget-object v3, v2, Lw81;->c:Lh70;

    .line 585
    .line 586
    if-eqz p1, :cond_1c

    .line 587
    .line 588
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 589
    .line 590
    .line 591
    move-result v2

    .line 592
    if-eqz v2, :cond_1b

    .line 593
    .line 594
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    :cond_1b
    invoke-virtual {v1}, Ld7;->d()V

    .line 598
    .line 599
    .line 600
    goto :goto_f

    .line 601
    :cond_1c
    if-eqz v10, :cond_1e

    .line 602
    .line 603
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 604
    .line 605
    .line 606
    move-result v2

    .line 607
    if-eqz v2, :cond_1d

    .line 608
    .line 609
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    :cond_1d
    invoke-virtual {v1}, Ld7;->d()V

    .line 613
    .line 614
    .line 615
    goto :goto_f

    .line 616
    :cond_1e
    iget-object v3, v3, Lh70;->N:Landroid/view/View;

    .line 617
    .line 618
    invoke-virtual {v1, v4}, Lfw;->j(Landroid/content/Context;)Ls7;

    .line 619
    .line 620
    .line 621
    move-result-object v8

    .line 622
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 623
    .line 624
    .line 625
    iget-object v8, v8, Ls7;->k:Ljava/lang/Object;

    .line 626
    .line 627
    check-cast v8, Landroid/view/animation/Animation;

    .line 628
    .line 629
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 630
    .line 631
    .line 632
    iget v12, v2, Lw81;->a:I

    .line 633
    .line 634
    const/4 v14, 0x1

    .line 635
    if-eq v12, v14, :cond_1f

    .line 636
    .line 637
    invoke-virtual {v3, v8}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 638
    .line 639
    .line 640
    invoke-virtual {v1}, Ld7;->d()V

    .line 641
    .line 642
    .line 643
    goto :goto_10

    .line 644
    :cond_1f
    invoke-virtual {v9, v3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 645
    .line 646
    .line 647
    new-instance v12, Lk70;

    .line 648
    .line 649
    invoke-direct {v12, v8, v9, v3}, Lk70;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 650
    .line 651
    .line 652
    new-instance v8, Lew;

    .line 653
    .line 654
    invoke-direct {v8, v2, v9, v3, v1}, Lew;-><init>(Lw81;Landroid/view/ViewGroup;Landroid/view/View;Lfw;)V

    .line 655
    .line 656
    .line 657
    invoke-virtual {v12, v8}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 658
    .line 659
    .line 660
    invoke-virtual {v3, v12}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 661
    .line 662
    .line 663
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 664
    .line 665
    .line 666
    move-result v8

    .line 667
    if-eqz v8, :cond_20

    .line 668
    .line 669
    invoke-virtual {v2}, Lw81;->toString()Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    :cond_20
    :goto_10
    iget-object v8, v1, Ld7;->b:Ljava/lang/Object;

    .line 673
    .line 674
    check-cast v8, Lxi;

    .line 675
    .line 676
    new-instance v17, Ler0;

    .line 677
    .line 678
    const/16 v22, 0x4

    .line 679
    .line 680
    move-object/from16 v20, v1

    .line 681
    .line 682
    move-object/from16 v21, v2

    .line 683
    .line 684
    move-object/from16 v18, v3

    .line 685
    .line 686
    move-object/from16 v19, v9

    .line 687
    .line 688
    invoke-direct/range {v17 .. v22}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 689
    .line 690
    .line 691
    move-object/from16 v1, v17

    .line 692
    .line 693
    move-object/from16 v18, v19

    .line 694
    .line 695
    invoke-virtual {v8, v1}, Lxi;->a(Lwi;)V

    .line 696
    .line 697
    .line 698
    move-object/from16 v9, v18

    .line 699
    .line 700
    goto/16 :goto_f

    .line 701
    .line 702
    :cond_21
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 703
    .line 704
    .line 705
    move-result v0

    .line 706
    move/from16 v4, v16

    .line 707
    .line 708
    :goto_11
    if-ge v4, v0, :cond_22

    .line 709
    .line 710
    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    add-int/lit8 v4, v4, 0x1

    .line 715
    .line 716
    check-cast v1, Lw81;

    .line 717
    .line 718
    iget-object v2, v1, Lw81;->c:Lh70;

    .line 719
    .line 720
    iget-object v2, v2, Lh70;->N:Landroid/view/View;

    .line 721
    .line 722
    iget v1, v1, Lw81;->a:I

    .line 723
    .line 724
    invoke-static {v2, v1}, Lx81;->a(Landroid/view/View;I)V

    .line 725
    .line 726
    .line 727
    goto :goto_11

    .line 728
    :cond_22
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 729
    .line 730
    .line 731
    invoke-static/range {v23 .. v23}, Lz70;->F(I)Z

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    if-eqz v0, :cond_23

    .line 736
    .line 737
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    :cond_23
    return-void
.end method

.method public final c()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lhw;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lhw;->a:Landroid/view/ViewGroup;

    .line 7
    .line 8
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lhw;->e()V

    .line 18
    .line 19
    .line 20
    iput-boolean v1, p0, Lhw;->d:Z

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    iget-object v2, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_6

    .line 33
    .line 34
    new-instance v2, Ljava/util/ArrayList;

    .line 35
    .line 36
    iget-object v3, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    move v4, v1

    .line 51
    :cond_2
    :goto_0
    if-ge v4, v3, :cond_4

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    check-cast v5, Lw81;

    .line 60
    .line 61
    const/4 v6, 0x2

    .line 62
    invoke-static {v6}, Lz70;->F(I)Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-eqz v6, :cond_3

    .line 67
    .line 68
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto :goto_3

    .line 74
    :cond_3
    :goto_1
    invoke-virtual {v5}, Lw81;->a()V

    .line 75
    .line 76
    .line 77
    iget-boolean v6, v5, Lw81;->g:Z

    .line 78
    .line 79
    if-nez v6, :cond_2

    .line 80
    .line 81
    iget-object v6, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    invoke-virtual {p0}, Lhw;->g()V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ljava/util/ArrayList;

    .line 91
    .line 92
    iget-object v3, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    move v4, v1

    .line 112
    :goto_2
    if-ge v4, v3, :cond_5

    .line 113
    .line 114
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    add-int/lit8 v4, v4, 0x1

    .line 119
    .line 120
    check-cast v5, Lw81;

    .line 121
    .line 122
    invoke-virtual {v5}, Lw81;->d()V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    iget-boolean v3, p0, Lhw;->d:Z

    .line 127
    .line 128
    invoke-virtual {p0, v2, v3}, Lhw;->b(Ljava/util/ArrayList;Z)V

    .line 129
    .line 130
    .line 131
    iput-boolean v1, p0, Lhw;->d:Z

    .line 132
    .line 133
    :cond_6
    monitor-exit v0

    .line 134
    return-void

    .line 135
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    throw p0
.end method

.method public final d(Lh70;)Lw81;
    .locals 4

    .line 1
    iget-object p0, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    if-ge v1, v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, Lw81;

    .line 17
    .line 18
    iget-object v3, v2, Lw81;->c:Lh70;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    if-eq v3, p1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-boolean v3, v2, Lw81;->f:Z

    .line 27
    .line 28
    if-nez v3, :cond_0

    .line 29
    .line 30
    return-object v2

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final e()V
    .locals 8

    .line 1
    iget-object v0, p0, Lhw;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    invoke-virtual {p0}, Lhw;->g()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v4, 0x0

    .line 22
    move v5, v4

    .line 23
    :goto_0
    if-ge v5, v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    add-int/lit8 v5, v5, 0x1

    .line 30
    .line 31
    check-cast v6, Lw81;

    .line 32
    .line 33
    invoke-virtual {v6}, Lw81;->d()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_5

    .line 39
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v3, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    move v5, v4

    .line 51
    :goto_1
    const/4 v6, 0x2

    .line 52
    if-ge v5, v3, :cond_3

    .line 53
    .line 54
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    add-int/lit8 v5, v5, 0x1

    .line 59
    .line 60
    check-cast v7, Lw81;

    .line 61
    .line 62
    invoke-static {v6}, Lz70;->F(I)Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-eqz v6, :cond_2

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_1
    iget-object v6, p0, Lhw;->a:Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    :goto_2
    invoke-static {v7}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-virtual {v7}, Lw81;->a()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 84
    .line 85
    iget-object v3, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    :goto_3
    if-ge v4, v3, :cond_6

    .line 95
    .line 96
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    add-int/lit8 v4, v4, 0x1

    .line 101
    .line 102
    check-cast v5, Lw81;

    .line 103
    .line 104
    invoke-static {v6}, Lz70;->F(I)Z

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    if-eqz v7, :cond_5

    .line 109
    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_4
    iget-object v7, p0, Lhw;->a:Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-static {v7}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    :goto_4
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    :cond_5
    invoke-virtual {v5}, Lw81;->a()V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_6
    monitor-exit v1

    .line 126
    return-void

    .line 127
    :goto_5
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    throw p0
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object p0, p0, Lhw;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, Lw81;

    .line 17
    .line 18
    iget v3, v2, Lw81;->b:I

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    if-ne v3, v4, :cond_0

    .line 22
    .line 23
    iget-object v3, v2, Lw81;->c:Lh70;

    .line 24
    .line 25
    invoke-virtual {v3}, Lh70;->I()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v3}, Lx81;->b(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-virtual {v2, v3, v4}, Lw81;->c(II)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method
