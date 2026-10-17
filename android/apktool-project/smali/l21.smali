.class public final synthetic Ll21;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Ll21;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Ll21;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    iget v0, p0, Ll21;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    iget-object p0, p0, Ll21;->k:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    check-cast v6, Ljava/lang/CharSequence;

    .line 15
    .line 16
    check-cast p2, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-ne p2, v2, :cond_4

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    if-ne p2, v2, :cond_2

    .line 38
    .line 39
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/String;

    .line 44
    .line 45
    const/4 p2, 0x4

    .line 46
    invoke-static {v6, p0, p1, v1, p2}, Lda1;->D(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-gez p1, :cond_1

    .line 51
    .line 52
    :cond_0
    move-object p2, v3

    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Lps0;

    .line 60
    .line 61
    invoke-direct {p2, p1, p0}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    goto/16 :goto_4

    .line 65
    .line 66
    :cond_2
    const-string p0, "List has more than one element."

    .line 67
    .line 68
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto/16 :goto_5

    .line 72
    .line 73
    :cond_3
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 74
    .line 75
    const-string p1, "List is empty."

    .line 76
    .line 77
    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p0

    .line 81
    :cond_4
    new-instance p2, Lcf0;

    .line 82
    .line 83
    if-gez p1, :cond_5

    .line 84
    .line 85
    move p1, v1

    .line 86
    :cond_5
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-direct {p2, p1, v0, v2}, Laf0;-><init>(III)V

    .line 91
    .line 92
    .line 93
    instance-of v0, v6, Ljava/lang/String;

    .line 94
    .line 95
    iget v2, p2, Laf0;->l:I

    .line 96
    .line 97
    iget p2, p2, Laf0;->k:I

    .line 98
    .line 99
    if-eqz v0, :cond_b

    .line 100
    .line 101
    if-lez v2, :cond_6

    .line 102
    .line 103
    if-le p1, p2, :cond_7

    .line 104
    .line 105
    :cond_6
    if-gez v2, :cond_0

    .line 106
    .line 107
    if-gt p2, p1, :cond_0

    .line 108
    .line 109
    :cond_7
    :goto_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-eqz v4, :cond_9

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    move-object v5, v4

    .line 124
    check-cast v5, Ljava/lang/String;

    .line 125
    .line 126
    move-object v7, v6

    .line 127
    check-cast v7, Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    invoke-virtual {v5, v1, v7, p1, v8}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_8

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_9
    move-object v4, v3

    .line 141
    :goto_1
    check-cast v4, Ljava/lang/String;

    .line 142
    .line 143
    if-eqz v4, :cond_a

    .line 144
    .line 145
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    new-instance p2, Lps0;

    .line 150
    .line 151
    invoke-direct {p2, p0, v4}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_a
    if-eq p1, p2, :cond_0

    .line 156
    .line 157
    add-int/2addr p1, v2

    .line 158
    goto :goto_0

    .line 159
    :cond_b
    if-lez v2, :cond_c

    .line 160
    .line 161
    if-le p1, p2, :cond_d

    .line 162
    .line 163
    :cond_c
    if-gez v2, :cond_0

    .line 164
    .line 165
    if-gt p2, p1, :cond_0

    .line 166
    .line 167
    :cond_d
    move v7, p1

    .line 168
    :goto_2
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    :cond_e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_f

    .line 177
    .line 178
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    move-object v4, v0

    .line 183
    check-cast v4, Ljava/lang/String;

    .line 184
    .line 185
    const/4 v5, 0x0

    .line 186
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    const/4 v9, 0x0

    .line 191
    invoke-static/range {v4 .. v9}, Lda1;->J(Ljava/lang/CharSequence;ILjava/lang/CharSequence;IIZ)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_e

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_f
    move-object v0, v3

    .line 199
    :goto_3
    check-cast v0, Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v0, :cond_10

    .line 202
    .line 203
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    new-instance p2, Lps0;

    .line 208
    .line 209
    invoke-direct {p2, p0, v0}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    goto :goto_4

    .line 213
    :cond_10
    if-eq v7, p2, :cond_0

    .line 214
    .line 215
    add-int/2addr v7, v2

    .line 216
    goto :goto_2

    .line 217
    :goto_4
    if-eqz p2, :cond_11

    .line 218
    .line 219
    iget-object p0, p2, Lps0;->j:Ljava/lang/Object;

    .line 220
    .line 221
    iget-object p1, p2, Lps0;->k:Ljava/lang/Object;

    .line 222
    .line 223
    check-cast p1, Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    new-instance v3, Lps0;

    .line 234
    .line 235
    invoke-direct {v3, p0, p1}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    :cond_11
    :goto_5
    return-object v3

    .line 239
    :pswitch_0
    check-cast p0, [C

    .line 240
    .line 241
    check-cast p1, Ljava/lang/CharSequence;

    .line 242
    .line 243
    check-cast p2, Ljava/lang/Integer;

    .line 244
    .line 245
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 250
    .line 251
    .line 252
    invoke-static {p1, p0, p2, v1}, Lda1;->E(Ljava/lang/CharSequence;[CIZ)I

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-gez p0, :cond_12

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_12
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    new-instance v3, Lps0;

    .line 268
    .line 269
    invoke-direct {v3, p0, p1}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    :goto_6
    return-object v3

    .line 273
    :pswitch_1
    check-cast p0, Ljava/util/ArrayList;

    .line 274
    .line 275
    check-cast p1, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 276
    .line 277
    check-cast p2, Ljava/lang/Boolean;

    .line 278
    .line 279
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 284
    .line 285
    .line 286
    const-string v0, "ActiveSettingsCategory"

    .line 287
    .line 288
    if-eqz p2, :cond_15

    .line 289
    .line 290
    sget p2, Lcom/melodix/music/AppSingleton;->j:I

    .line 291
    .line 292
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 293
    .line 294
    .line 295
    move-result-object p2

    .line 296
    iget-object v2, p1, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 297
    .line 298
    if-eqz v2, :cond_13

    .line 299
    .line 300
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    :cond_13
    invoke-interface {p2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 305
    .line 306
    .line 307
    move-result-object p2

    .line 308
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 312
    .line 313
    .line 314
    move-result p2

    .line 315
    move v0, v1

    .line 316
    :cond_14
    :goto_7
    if-ge v0, p2, :cond_19

    .line 317
    .line 318
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    add-int/lit8 v0, v0, 0x1

    .line 323
    .line 324
    check-cast v2, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 325
    .line 326
    invoke-static {v2, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v3

    .line 330
    if-nez v3, :cond_14

    .line 331
    .line 332
    invoke-virtual {v2, v1}, Lcom/melodix/music/ExpandablePreferenceCategory;->B(Z)V

    .line 333
    .line 334
    .line 335
    goto :goto_7

    .line 336
    :cond_15
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    if-eqz p1, :cond_16

    .line 341
    .line 342
    goto :goto_8

    .line 343
    :cond_16
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 344
    .line 345
    .line 346
    move-result p1

    .line 347
    :cond_17
    if-ge v1, p1, :cond_18

    .line 348
    .line 349
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object p2

    .line 353
    add-int/lit8 v1, v1, 0x1

    .line 354
    .line 355
    check-cast p2, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 356
    .line 357
    iget-boolean p2, p2, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 358
    .line 359
    if-eqz p2, :cond_17

    .line 360
    .line 361
    goto :goto_9

    .line 362
    :cond_18
    :goto_8
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 363
    .line 364
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 373
    .line 374
    .line 375
    :cond_19
    :goto_9
    sget-object p0, Lwe1;->a:Lwe1;

    .line 376
    .line 377
    return-object p0

    .line 378
    :pswitch_2
    check-cast p0, Li21;

    .line 379
    .line 380
    check-cast p1, Ljava/lang/Integer;

    .line 381
    .line 382
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 383
    .line 384
    .line 385
    move-result p1

    .line 386
    check-cast p2, Lqq;

    .line 387
    .line 388
    invoke-interface {p2}, Lqq;->getKey()Lrq;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    iget-object p0, p0, Li21;->n:Lsq;

    .line 393
    .line 394
    invoke-interface {p0, v0}, Lsq;->j(Lrq;)Lqq;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    sget-object v1, Ltb0;->n:Ltb0;

    .line 399
    .line 400
    if-eq v0, v1, :cond_1b

    .line 401
    .line 402
    if-eq p2, p0, :cond_1a

    .line 403
    .line 404
    const/high16 p1, -0x80000000

    .line 405
    .line 406
    goto :goto_d

    .line 407
    :cond_1a
    add-int/lit8 p1, p1, 0x1

    .line 408
    .line 409
    goto :goto_d

    .line 410
    :cond_1b
    check-cast p0, Lng0;

    .line 411
    .line 412
    check-cast p2, Lng0;

    .line 413
    .line 414
    :goto_a
    if-nez p2, :cond_1c

    .line 415
    .line 416
    goto :goto_c

    .line 417
    :cond_1c
    if-ne p2, p0, :cond_1d

    .line 418
    .line 419
    goto :goto_b

    .line 420
    :cond_1d
    instance-of v0, p2, Lh31;

    .line 421
    .line 422
    if-nez v0, :cond_1f

    .line 423
    .line 424
    :goto_b
    move-object v3, p2

    .line 425
    :goto_c
    if-ne v3, p0, :cond_1e

    .line 426
    .line 427
    if-nez p0, :cond_1a

    .line 428
    .line 429
    :goto_d
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    return-object p0

    .line 434
    :cond_1e
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 435
    .line 436
    new-instance p2, Ljava/lang/StringBuilder;

    .line 437
    .line 438
    const-string v0, "Flow invariant is violated:\n\t\tEmission from another coroutine is detected.\n\t\tChild of "

    .line 439
    .line 440
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    const-string v0, ", expected child of "

    .line 447
    .line 448
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    const-string p0, ".\n\t\tFlowCollector is not thread-safe and concurrent emissions are prohibited.\n\t\tTo mitigate this restriction please use \'channelFlow\' builder instead of \'flow\'"

    .line 455
    .line 456
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    .line 458
    .line 459
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object p0

    .line 463
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object p0

    .line 467
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    throw p1

    .line 471
    :cond_1f
    check-cast p2, Lh31;

    .line 472
    .line 473
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 474
    .line 475
    sget-wide v1, Lng0;->j:J

    .line 476
    .line 477
    invoke-virtual {v0, p2, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 478
    .line 479
    .line 480
    move-result-object p2

    .line 481
    check-cast p2, Lbk;

    .line 482
    .line 483
    if-eqz p2, :cond_20

    .line 484
    .line 485
    invoke-interface {p2}, Lbk;->getParent()Lng0;

    .line 486
    .line 487
    .line 488
    move-result-object p2

    .line 489
    goto :goto_a

    .line 490
    :cond_20
    move-object p2, v3

    .line 491
    goto :goto_a

    .line 492
    nop

    .line 493
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
