.class public final Lb1;
.super Landroid/view/View$AccessibilityDelegate;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lc1;


# direct methods
.method public constructor <init>(Lc1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb1;->a:Lc1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final dispatchPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lc1;->a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final getAccessibilityNodeProvider(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lc1;->b(Landroid/view/View;)Lpa0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeProvider;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lc1;->c(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 13

    .line 1
    new-instance v0, Lo1;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Lo1;-><init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 7
    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/16 v3, 0x1c

    .line 12
    .line 13
    const-class v4, Ljava/lang/Boolean;

    .line 14
    .line 15
    if-lt v1, v3, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Lsh1;->d(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const v1, 0x7f0901e7

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v4, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move-object v1, v2

    .line 41
    :goto_0
    check-cast v1, Ljava/lang/Boolean;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    move v1, v6

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move v1, v5

    .line 56
    :goto_1
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const-string v8, "androidx.view.accessibility.AccessibilityNodeInfoCompat.BOOLEAN_PROPERTY_KEY"

    .line 59
    .line 60
    if-lt v7, v3, :cond_3

    .line 61
    .line 62
    invoke-static {p2, v1}, Ld1;->v(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    if-eqz v9, :cond_4

    .line 71
    .line 72
    invoke-virtual {v9, v8, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    and-int/lit8 v10, v10, -0x2

    .line 77
    .line 78
    or-int/2addr v1, v10

    .line 79
    invoke-virtual {v9, v8, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    :cond_4
    :goto_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 83
    .line 84
    if-lt v1, v3, :cond_5

    .line 85
    .line 86
    invoke-static {p1}, Lsh1;->c(Landroid/view/View;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    goto :goto_3

    .line 95
    :cond_5
    const v1, 0x7f0901e2

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v4, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_6

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_6
    move-object v1, v2

    .line 110
    :goto_3
    check-cast v1, Ljava/lang/Boolean;

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_7
    move v6, v5

    .line 122
    :goto_4
    if-lt v7, v3, :cond_8

    .line 123
    .line 124
    invoke-static {p2, v6}, Ld1;->C(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    .line 125
    .line 126
    .line 127
    goto :goto_6

    .line 128
    :cond_8
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    if-eqz v1, :cond_a

    .line 133
    .line 134
    invoke-virtual {v1, v8, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    and-int/lit8 v4, v4, -0x3

    .line 139
    .line 140
    if-eqz v6, :cond_9

    .line 141
    .line 142
    const/4 v6, 0x2

    .line 143
    goto :goto_5

    .line 144
    :cond_9
    move v6, v5

    .line 145
    :goto_5
    or-int/2addr v4, v6

    .line 146
    invoke-virtual {v1, v8, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    :cond_a
    :goto_6
    const-class v1, Ljava/lang/CharSequence;

    .line 150
    .line 151
    if-lt v7, v3, :cond_b

    .line 152
    .line 153
    invoke-static {p1}, Lsh1;->b(Landroid/view/View;)Ljava/lang/CharSequence;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    goto :goto_7

    .line 158
    :cond_b
    const v4, 0x7f0901e3

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-virtual {v1, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-eqz v6, :cond_c

    .line 170
    .line 171
    goto :goto_7

    .line 172
    :cond_c
    move-object v4, v2

    .line 173
    :goto_7
    check-cast v4, Ljava/lang/CharSequence;

    .line 174
    .line 175
    if-lt v7, v3, :cond_d

    .line 176
    .line 177
    invoke-static {p2, v4}, Ld1;->u(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    goto :goto_8

    .line 181
    :cond_d
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    const-string v6, "androidx.view.accessibility.AccessibilityNodeInfoCompat.PANE_TITLE_KEY"

    .line 186
    .line 187
    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    :goto_8
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 191
    .line 192
    const/16 v4, 0x1e

    .line 193
    .line 194
    if-lt v3, v4, :cond_e

    .line 195
    .line 196
    invoke-static {p1}, Luh1;->b(Landroid/view/View;)Ljava/lang/CharSequence;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    goto :goto_9

    .line 201
    :cond_e
    const v3, 0x7f0901e8

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-eqz v1, :cond_f

    .line 213
    .line 214
    move-object v1, v3

    .line 215
    goto :goto_9

    .line 216
    :cond_f
    move-object v1, v2

    .line 217
    :goto_9
    check-cast v1, Ljava/lang/CharSequence;

    .line 218
    .line 219
    if-lt v7, v4, :cond_10

    .line 220
    .line 221
    invoke-static {p2, v1}, Lk1;->c(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V

    .line 222
    .line 223
    .line 224
    goto :goto_a

    .line 225
    :cond_10
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    const-string v4, "androidx.view.accessibility.AccessibilityNodeInfoCompat.STATE_DESCRIPTION_KEY"

    .line 230
    .line 231
    invoke-virtual {v3, v4, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    :goto_a
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 235
    .line 236
    invoke-virtual {p0, p1, v0}, Lc1;->d(Landroid/view/View;Lo1;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    const/16 v1, 0x1a

    .line 244
    .line 245
    if-ge v7, v1, :cond_18

    .line 246
    .line 247
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    const-string v3, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY"

    .line 252
    .line 253
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    const-string v4, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_END_KEY"

    .line 261
    .line 262
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    const-string v6, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_FLAGS_KEY"

    .line 270
    .line 271
    invoke-virtual {v1, v6}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    const-string v7, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ID_KEY"

    .line 279
    .line 280
    invoke-virtual {v1, v7}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    const v1, 0x7f0901e1

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v8

    .line 290
    check-cast v8, Landroid/util/SparseArray;

    .line 291
    .line 292
    if-eqz v8, :cond_13

    .line 293
    .line 294
    new-instance v9, Ljava/util/ArrayList;

    .line 295
    .line 296
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .line 298
    .line 299
    move v10, v5

    .line 300
    :goto_b
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    .line 301
    .line 302
    .line 303
    move-result v11

    .line 304
    if-ge v10, v11, :cond_12

    .line 305
    .line 306
    invoke-virtual {v8, v10}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v11

    .line 310
    check-cast v11, Ljava/lang/ref/WeakReference;

    .line 311
    .line 312
    invoke-virtual {v11}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    if-nez v11, :cond_11

    .line 317
    .line 318
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 319
    .line 320
    .line 321
    move-result-object v11

    .line 322
    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    :cond_11
    add-int/lit8 v10, v10, 0x1

    .line 326
    .line 327
    goto :goto_b

    .line 328
    :cond_12
    move v10, v5

    .line 329
    :goto_c
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 330
    .line 331
    .line 332
    move-result v11

    .line 333
    if-ge v10, v11, :cond_13

    .line 334
    .line 335
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v11

    .line 339
    check-cast v11, Ljava/lang/Integer;

    .line 340
    .line 341
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 342
    .line 343
    .line 344
    move-result v11

    .line 345
    invoke-virtual {v8, v11}, Landroid/util/SparseArray;->remove(I)V

    .line 346
    .line 347
    .line 348
    add-int/lit8 v10, v10, 0x1

    .line 349
    .line 350
    goto :goto_c

    .line 351
    :cond_13
    instance-of v8, p0, Landroid/text/Spanned;

    .line 352
    .line 353
    if-eqz v8, :cond_14

    .line 354
    .line 355
    move-object v2, p0

    .line 356
    check-cast v2, Landroid/text/Spanned;

    .line 357
    .line 358
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 359
    .line 360
    .line 361
    move-result v8

    .line 362
    const-class v9, Landroid/text/style/ClickableSpan;

    .line 363
    .line 364
    invoke-interface {v2, v5, v8, v9}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    check-cast v2, [Landroid/text/style/ClickableSpan;

    .line 369
    .line 370
    :cond_14
    if-eqz v2, :cond_18

    .line 371
    .line 372
    array-length v8, v2

    .line 373
    if-lez v8, :cond_18

    .line 374
    .line 375
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 376
    .line 377
    .line 378
    move-result-object p2

    .line 379
    const-string v8, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ACTION_ID_KEY"

    .line 380
    .line 381
    const v9, 0x7f09000f

    .line 382
    .line 383
    .line 384
    invoke-virtual {p2, v8, v9}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object p2

    .line 391
    check-cast p2, Landroid/util/SparseArray;

    .line 392
    .line 393
    if-nez p2, :cond_15

    .line 394
    .line 395
    new-instance p2, Landroid/util/SparseArray;

    .line 396
    .line 397
    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    .line 398
    .line 399
    .line 400
    invoke-virtual {p1, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 401
    .line 402
    .line 403
    :cond_15
    move v1, v5

    .line 404
    :goto_d
    array-length v8, v2

    .line 405
    if-ge v1, v8, :cond_18

    .line 406
    .line 407
    aget-object v8, v2, v1

    .line 408
    .line 409
    move v9, v5

    .line 410
    :goto_e
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 411
    .line 412
    .line 413
    move-result v10

    .line 414
    if-ge v9, v10, :cond_17

    .line 415
    .line 416
    invoke-virtual {p2, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v10

    .line 420
    check-cast v10, Ljava/lang/ref/WeakReference;

    .line 421
    .line 422
    invoke-virtual {v10}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v10

    .line 426
    check-cast v10, Landroid/text/style/ClickableSpan;

    .line 427
    .line 428
    invoke-virtual {v8, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 429
    .line 430
    .line 431
    move-result v10

    .line 432
    if-eqz v10, :cond_16

    .line 433
    .line 434
    invoke-virtual {p2, v9}, Landroid/util/SparseArray;->keyAt(I)I

    .line 435
    .line 436
    .line 437
    move-result v8

    .line 438
    goto :goto_f

    .line 439
    :cond_16
    add-int/lit8 v9, v9, 0x1

    .line 440
    .line 441
    goto :goto_e

    .line 442
    :cond_17
    sget v8, Lo1;->b:I

    .line 443
    .line 444
    add-int/lit8 v9, v8, 0x1

    .line 445
    .line 446
    sput v9, Lo1;->b:I

    .line 447
    .line 448
    :goto_f
    new-instance v9, Ljava/lang/ref/WeakReference;

    .line 449
    .line 450
    aget-object v10, v2, v1

    .line 451
    .line 452
    invoke-direct {v9, v10}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {p2, v8, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 456
    .line 457
    .line 458
    aget-object v9, v2, v1

    .line 459
    .line 460
    move-object v10, p0

    .line 461
    check-cast v10, Landroid/text/Spanned;

    .line 462
    .line 463
    invoke-virtual {v0, v3}, Lo1;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 464
    .line 465
    .line 466
    move-result-object v11

    .line 467
    invoke-interface {v10, v9}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 468
    .line 469
    .line 470
    move-result v12

    .line 471
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 472
    .line 473
    .line 474
    move-result-object v12

    .line 475
    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    invoke-virtual {v0, v4}, Lo1;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 479
    .line 480
    .line 481
    move-result-object v11

    .line 482
    invoke-interface {v10, v9}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 483
    .line 484
    .line 485
    move-result v12

    .line 486
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 487
    .line 488
    .line 489
    move-result-object v12

    .line 490
    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    invoke-virtual {v0, v6}, Lo1;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 494
    .line 495
    .line 496
    move-result-object v11

    .line 497
    invoke-interface {v10, v9}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    .line 498
    .line 499
    .line 500
    move-result v9

    .line 501
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 502
    .line 503
    .line 504
    move-result-object v9

    .line 505
    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    invoke-virtual {v0, v7}, Lo1;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 509
    .line 510
    .line 511
    move-result-object v9

    .line 512
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 513
    .line 514
    .line 515
    move-result-object v8

    .line 516
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 517
    .line 518
    .line 519
    add-int/lit8 v1, v1, 0x1

    .line 520
    .line 521
    goto :goto_d

    .line 522
    :cond_18
    const p0, 0x7f0901e0

    .line 523
    .line 524
    .line 525
    invoke-virtual {p1, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object p0

    .line 529
    check-cast p0, Ljava/util/List;

    .line 530
    .line 531
    if-nez p0, :cond_19

    .line 532
    .line 533
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 534
    .line 535
    :cond_19
    :goto_10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 536
    .line 537
    .line 538
    move-result p1

    .line 539
    if-ge v5, p1, :cond_1a

    .line 540
    .line 541
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 542
    .line 543
    .line 544
    move-result-object p1

    .line 545
    check-cast p1, Lj1;

    .line 546
    .line 547
    iget-object p1, p1, Lj1;->a:Ljava/lang/Object;

    .line 548
    .line 549
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 550
    .line 551
    iget-object p2, v0, Lo1;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 552
    .line 553
    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 554
    .line 555
    .line 556
    add-int/lit8 v5, v5, 0x1

    .line 557
    .line 558
    goto :goto_10

    .line 559
    :cond_1a
    return-void
.end method

.method public final onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lc1;->e(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lc1;->f(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lc1;->g(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final sendAccessibilityEvent(Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lc1;->h(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final sendAccessibilityEventUnchecked(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lb1;->a:Lc1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lc1;->i(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
