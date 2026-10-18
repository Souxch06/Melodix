.class public Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
.super Las;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Las;"
    }
.end annotation


# instance fields
.field public final j:Z

.field public k:I

.field public l:Z

.field public final m:Lfm0;

.field public final n:Landroid/content/res/ColorStateList;

.field public final o:Z

.field public final p:Lr61;

.field public q:Z

.field public final r:Landroid/animation/ValueAnimator;

.field public final s:I

.field public final t:Z

.field public u:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x6

    .line 427
    invoke-direct {p0, v0}, Las;-><init>(I)V

    const/4 v0, 0x1

    .line 428
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Z

    .line 429
    new-instance v0, Lbv1;

    .line 430
    invoke-direct {v0, p0}, Lbv1;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    const/4 v0, 0x4

    .line 431
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 432
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 433
    new-instance p0, Landroid/util/SparseIntArray;

    invoke-direct {p0}, Landroid/util/SparseIntArray;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-direct {p0, v0}, Las;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Z

    .line 7
    .line 8
    new-instance v2, Lbv1;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Lbv1;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 15
    .line 16
    new-instance v3, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v3, Landroid/util/SparseIntArray;

    .line 22
    .line 23
    invoke-direct {v3}, Landroid/util/SparseIntArray;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const v4, 0x7f0702bb

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    sget-object v3, Lfx0;->a:[I

    .line 37
    .line 38
    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x3

    .line 43
    invoke-virtual {v3, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_0

    .line 48
    .line 49
    invoke-static {p1, v3, v4}, Lbv;->i(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    iput-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Landroid/content/res/ColorStateList;

    .line 54
    .line 55
    :cond_0
    const/16 v5, 0x15

    .line 56
    .line 57
    invoke-virtual {v3, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_1

    .line 62
    .line 63
    const v5, 0x7f04007d

    .line 64
    .line 65
    .line 66
    const v6, 0x7f120359

    .line 67
    .line 68
    .line 69
    invoke-static {p1, p2, v5, v6}, Lr61;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lq61;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Lq61;->a()Lr61;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iput-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Lr61;

    .line 78
    .line 79
    :cond_1
    iget-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Lr61;

    .line 80
    .line 81
    if-nez p2, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    new-instance v5, Lfm0;

    .line 85
    .line 86
    invoke-direct {v5, p2}, Lfm0;-><init>(Lr61;)V

    .line 87
    .line 88
    .line 89
    iput-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Lfm0;

    .line 90
    .line 91
    iget-object p2, v5, Lfm0;->j:Lem0;

    .line 92
    .line 93
    new-instance v6, Ltz;

    .line 94
    .line 95
    invoke-direct {v6, p1}, Ltz;-><init>(Landroid/content/Context;)V

    .line 96
    .line 97
    .line 98
    iput-object v6, p2, Lem0;->b:Ltz;

    .line 99
    .line 100
    invoke-virtual {v5}, Lfm0;->h()V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Landroid/content/res/ColorStateList;

    .line 104
    .line 105
    if-eqz p2, :cond_3

    .line 106
    .line 107
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Lfm0;

    .line 108
    .line 109
    iget-object v6, v5, Lfm0;->j:Lem0;

    .line 110
    .line 111
    iget-object v7, v6, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 112
    .line 113
    if-eq v7, p2, :cond_4

    .line 114
    .line 115
    iput-object p2, v6, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 116
    .line 117
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {v5, p2}, Lfm0;->onStateChange([I)Z

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_3
    new-instance p2, Landroid/util/TypedValue;

    .line 126
    .line 127
    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    const v6, 0x1010031

    .line 135
    .line 136
    .line 137
    invoke-virtual {v5, v6, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 138
    .line 139
    .line 140
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Lfm0;

    .line 141
    .line 142
    iget p2, p2, Landroid/util/TypedValue;->data:I

    .line 143
    .line 144
    invoke-virtual {v5, p2}, Lfm0;->setTint(I)V

    .line 145
    .line 146
    .line 147
    :cond_4
    :goto_0
    const/4 p2, 0x2

    .line 148
    new-array v5, p2, [F

    .line 149
    .line 150
    fill-array-data v5, :array_0

    .line 151
    .line 152
    .line 153
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    iput-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:Landroid/animation/ValueAnimator;

    .line 158
    .line 159
    const-wide/16 v6, 0x1f4

    .line 160
    .line 161
    invoke-virtual {v5, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    new-instance v6, Lvg;

    .line 167
    .line 168
    const/4 v7, 0x0

    .line 169
    invoke-direct {v6, v7, p0}, Lvg;-><init>(ILjava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 173
    .line 174
    .line 175
    const/high16 v5, -0x40800000    # -1.0f

    .line 176
    .line 177
    invoke-virtual {v3, p2, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    const/4 v5, -0x1

    .line 185
    if-eqz p2, :cond_5

    .line 186
    .line 187
    invoke-virtual {v3, v7, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 188
    .line 189
    .line 190
    :cond_5
    invoke-virtual {v3, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-eqz p2, :cond_6

    .line 195
    .line 196
    invoke-virtual {v3, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 197
    .line 198
    .line 199
    :cond_6
    const/16 p2, 0x9

    .line 200
    .line 201
    invoke-virtual {v3, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    if-eqz v6, :cond_7

    .line 206
    .line 207
    iget v6, v6, Landroid/util/TypedValue;->data:I

    .line 208
    .line 209
    if-ne v6, v5, :cond_7

    .line 210
    .line 211
    invoke-virtual {p0, v6}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A(I)V

    .line 212
    .line 213
    .line 214
    goto :goto_1

    .line 215
    :cond_7
    invoke-virtual {v3, p2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A(I)V

    .line 220
    .line 221
    .line 222
    :goto_1
    const/16 p2, 0x8

    .line 223
    .line 224
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    iget-boolean v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->t:Z

    .line 229
    .line 230
    const/4 v6, 0x5

    .line 231
    if-eq v5, p2, :cond_9

    .line 232
    .line 233
    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->t:Z

    .line 234
    .line 235
    if-nez p2, :cond_9

    .line 236
    .line 237
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 238
    .line 239
    if-ne p2, v6, :cond_9

    .line 240
    .line 241
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 242
    .line 243
    if-ne p2, v2, :cond_8

    .line 244
    .line 245
    goto :goto_2

    .line 246
    :cond_8
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 247
    .line 248
    :cond_9
    :goto_2
    const/16 p2, 0xd

    .line 249
    .line 250
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 251
    .line 252
    .line 253
    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 254
    .line 255
    .line 256
    move-result p2

    .line 257
    iget-boolean v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Z

    .line 258
    .line 259
    if-ne v5, p2, :cond_a

    .line 260
    .line 261
    goto :goto_5

    .line 262
    :cond_a
    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Z

    .line 263
    .line 264
    if-eqz p2, :cond_b

    .line 265
    .line 266
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 267
    .line 268
    if-ne p2, v0, :cond_b

    .line 269
    .line 270
    goto :goto_3

    .line 271
    :cond_b
    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 272
    .line 273
    move p2, v4

    .line 274
    :goto_3
    if-ne p2, v4, :cond_c

    .line 275
    .line 276
    goto :goto_4

    .line 277
    :cond_c
    iput v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 278
    .line 279
    move p2, v4

    .line 280
    :goto_4
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B(I)V

    .line 281
    .line 282
    .line 283
    :goto_5
    const/16 p2, 0xc

    .line 284
    .line 285
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 286
    .line 287
    .line 288
    invoke-virtual {v3, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 289
    .line 290
    .line 291
    const/16 p2, 0xa

    .line 292
    .line 293
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 294
    .line 295
    .line 296
    const/4 p2, 0x7

    .line 297
    const/high16 v0, 0x3f000000    # 0.5f

    .line 298
    .line 299
    invoke-virtual {v3, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 300
    .line 301
    .line 302
    move-result p2

    .line 303
    const/4 v0, 0x0

    .line 304
    cmpg-float v0, p2, v0

    .line 305
    .line 306
    const/4 v2, 0x0

    .line 307
    if-lez v0, :cond_10

    .line 308
    .line 309
    const/high16 v0, 0x3f800000    # 1.0f

    .line 310
    .line 311
    cmpl-float p2, p2, v0

    .line 312
    .line 313
    if-gez p2, :cond_10

    .line 314
    .line 315
    invoke-virtual {v3, v6}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 316
    .line 317
    .line 318
    move-result-object p2

    .line 319
    const/16 v0, 0x10

    .line 320
    .line 321
    const-string v4, "offset must be greater than or equal to 0"

    .line 322
    .line 323
    if-eqz p2, :cond_e

    .line 324
    .line 325
    iget v5, p2, Landroid/util/TypedValue;->type:I

    .line 326
    .line 327
    if-ne v5, v0, :cond_e

    .line 328
    .line 329
    iget p2, p2, Landroid/util/TypedValue;->data:I

    .line 330
    .line 331
    if-ltz p2, :cond_d

    .line 332
    .line 333
    iput p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->s:I

    .line 334
    .line 335
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 336
    .line 337
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B(I)V

    .line 338
    .line 339
    .line 340
    goto :goto_6

    .line 341
    :cond_d
    invoke-static {v4}, Lz0;->d(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    throw v2

    .line 345
    :cond_e
    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 346
    .line 347
    .line 348
    move-result p2

    .line 349
    if-ltz p2, :cond_f

    .line 350
    .line 351
    iput p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->s:I

    .line 352
    .line 353
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 354
    .line 355
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B(I)V

    .line 356
    .line 357
    .line 358
    :goto_6
    const/16 p2, 0xb

    .line 359
    .line 360
    const/16 v2, 0x1f4

    .line 361
    .line 362
    invoke-virtual {v3, p2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 363
    .line 364
    .line 365
    const/16 p2, 0x11

    .line 366
    .line 367
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 368
    .line 369
    .line 370
    const/16 p2, 0x12

    .line 371
    .line 372
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 373
    .line 374
    .line 375
    const/16 p2, 0x13

    .line 376
    .line 377
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 378
    .line 379
    .line 380
    const/16 p2, 0x14

    .line 381
    .line 382
    invoke-virtual {v3, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 383
    .line 384
    .line 385
    const/16 p2, 0xe

    .line 386
    .line 387
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 388
    .line 389
    .line 390
    const/16 p2, 0xf

    .line 391
    .line 392
    invoke-virtual {v3, p2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 393
    .line 394
    .line 395
    invoke-virtual {v3, v0, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 396
    .line 397
    .line 398
    const/16 p2, 0x17

    .line 399
    .line 400
    invoke-virtual {v3, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 401
    .line 402
    .line 403
    move-result p2

    .line 404
    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->o:Z

    .line 405
    .line 406
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 407
    .line 408
    .line 409
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :cond_f
    invoke-static {v4}, Lz0;->d(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    throw v2

    .line 421
    :cond_10
    const-string p0, "ratio must be a float value between 0 and 1"

    .line 422
    .line 423
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    throw v2

    .line 427
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final A(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->l:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->l:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    .line 15
    .line 16
    if-eq v0, p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    :goto_0
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->l:Z

    .line 22
    .line 23
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    .line 28
    .line 29
    return-void
.end method

.method public final B(I)V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    goto :goto_2

    .line 5
    :cond_0
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne p1, v1, :cond_2

    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->o:Z

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move p1, v3

    .line 18
    goto :goto_1

    .line 19
    :cond_2
    :goto_0
    move p1, v2

    .line 20
    :goto_1
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    .line 21
    .line 22
    if-eq v1, p1, :cond_9

    .line 23
    .line 24
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Lfm0;

    .line 25
    .line 26
    if-nez v1, :cond_3

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_3
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    .line 30
    .line 31
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    const/high16 v5, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    if-eqz v4, :cond_6

    .line 37
    .line 38
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_4

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->reverse()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_4
    iget-object p0, v1, Lfm0;->j:Lem0;

    .line 49
    .line 50
    iget p0, p0, Lem0;->i:F

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    move v5, v6

    .line 55
    :cond_5
    new-array p1, v0, [F

    .line 56
    .line 57
    aput p0, p1, v2

    .line 58
    .line 59
    aput v5, p1, v3

    .line 60
    .line 61
    invoke-virtual {v4, p1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_6
    if-eqz v4, :cond_7

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_7

    .line 75
    .line 76
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 77
    .line 78
    .line 79
    :cond_7
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    .line 80
    .line 81
    if-eqz p0, :cond_8

    .line 82
    .line 83
    move v5, v6

    .line 84
    :cond_8
    iget-object p0, v1, Lfm0;->j:Lem0;

    .line 85
    .line 86
    iget p1, p0, Lem0;->i:F

    .line 87
    .line 88
    cmpl-float p1, p1, v5

    .line 89
    .line 90
    if-eqz p1, :cond_9

    .line 91
    .line 92
    iput v5, p0, Lem0;->i:F

    .line 93
    .line 94
    iput-boolean v3, v1, Lfm0;->n:Z

    .line 95
    .line 96
    invoke-virtual {v1}, Lfm0;->invalidateSelf()V

    .line 97
    .line 98
    .line 99
    :cond_9
    :goto_2
    return-void
.end method
