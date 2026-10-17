.class public final Lyg1;
.super Lpg1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final s:Landroid/graphics/PorterDuff$Mode;


# instance fields
.field public k:Lwg1;

.field public l:Landroid/graphics/PorterDuffColorFilter;

.field public m:Landroid/graphics/ColorFilter;

.field public n:Z

.field public o:Z

.field public final p:[F

.field public final q:Landroid/graphics/Matrix;

.field public final r:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lyg1;->s:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lyg1;->o:Z

    .line 6
    .line 7
    const/16 v0, 0x9

    .line 8
    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Lyg1;->p:[F

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Matrix;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lyg1;->q:Landroid/graphics/Matrix;

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lyg1;->r:Landroid/graphics/Rect;

    .line 26
    .line 27
    new-instance v0, Lwg1;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iput-object v1, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 34
    .line 35
    sget-object v1, Lyg1;->s:Landroid/graphics/PorterDuff$Mode;

    .line 36
    .line 37
    iput-object v1, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 38
    .line 39
    new-instance v1, Lvg1;

    .line 40
    .line 41
    invoke-direct {v1}, Lvg1;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, v0, Lwg1;->b:Lvg1;

    .line 45
    .line 46
    iput-object v0, p0, Lyg1;->k:Lwg1;

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Lwg1;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lyg1;->o:Z

    const/16 v0, 0x9

    .line 51
    new-array v0, v0, [F

    iput-object v0, p0, Lyg1;->p:[F

    .line 52
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lyg1;->q:Landroid/graphics/Matrix;

    .line 53
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lyg1;->r:Landroid/graphics/Rect;

    .line 54
    iput-object p1, p0, Lyg1;->k:Lwg1;

    .line 55
    iget-object v0, p1, Lwg1;->c:Landroid/content/res/ColorStateList;

    iget-object p1, p1, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v0, p1}, Lyg1;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lpg1;->getState()[I

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, p0, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    .line 16
    .line 17
    invoke-direct {p1, p0, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public final canApplyTheme()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Loy;->b(Landroid/graphics/drawable/Drawable;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v2, v0, Lyg1;->r:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-lez v3, :cond_d

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-gtz v3, :cond_1

    .line 29
    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_1
    iget-object v3, v0, Lyg1;->m:Landroid/graphics/ColorFilter;

    .line 33
    .line 34
    if-nez v3, :cond_2

    .line 35
    .line 36
    iget-object v3, v0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    .line 37
    .line 38
    :cond_2
    iget-object v4, v0, Lyg1;->q:Landroid/graphics/Matrix;

    .line 39
    .line 40
    invoke-virtual {v1, v4}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 41
    .line 42
    .line 43
    iget-object v5, v0, Lyg1;->p:[F

    .line 44
    .line 45
    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->getValues([F)V

    .line 46
    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    aget v6, v5, v4

    .line 50
    .line 51
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    const/4 v7, 0x4

    .line 56
    aget v7, v5, v7

    .line 57
    .line 58
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    const/4 v8, 0x1

    .line 63
    aget v9, v5, v8

    .line 64
    .line 65
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    const/4 v10, 0x3

    .line 70
    aget v5, v5, v10

    .line 71
    .line 72
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    const/4 v10, 0x0

    .line 77
    cmpl-float v9, v9, v10

    .line 78
    .line 79
    const/high16 v11, 0x3f800000    # 1.0f

    .line 80
    .line 81
    if-nez v9, :cond_3

    .line 82
    .line 83
    cmpl-float v5, v5, v10

    .line 84
    .line 85
    if-eqz v5, :cond_4

    .line 86
    .line 87
    :cond_3
    move v6, v11

    .line 88
    move v7, v6

    .line 89
    :cond_4
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    int-to-float v5, v5

    .line 94
    mul-float/2addr v5, v6

    .line 95
    float-to-int v5, v5

    .line 96
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    int-to-float v6, v6

    .line 101
    mul-float/2addr v6, v7

    .line 102
    float-to-int v6, v6

    .line 103
    const/16 v7, 0x800

    .line 104
    .line 105
    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    invoke-static {v7, v6}, Ljava/lang/Math;->min(II)I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    if-lez v5, :cond_d

    .line 114
    .line 115
    if-gtz v6, :cond_5

    .line 116
    .line 117
    goto/16 :goto_4

    .line 118
    .line 119
    :cond_5
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    iget v9, v2, Landroid/graphics/Rect;->left:I

    .line 124
    .line 125
    int-to-float v9, v9

    .line 126
    iget v12, v2, Landroid/graphics/Rect;->top:I

    .line 127
    .line 128
    int-to-float v12, v12

    .line 129
    invoke-virtual {v1, v9, v12}, Landroid/graphics/Canvas;->translate(FF)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Lyg1;->isAutoMirrored()Z

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-eqz v9, :cond_6

    .line 137
    .line 138
    invoke-static {v0}, Lpy;->a(Landroid/graphics/drawable/Drawable;)I

    .line 139
    .line 140
    .line 141
    move-result v9

    .line 142
    if-ne v9, v8, :cond_6

    .line 143
    .line 144
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 145
    .line 146
    .line 147
    move-result v9

    .line 148
    int-to-float v9, v9

    .line 149
    invoke-virtual {v1, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 150
    .line 151
    .line 152
    const/high16 v9, -0x40800000    # -1.0f

    .line 153
    .line 154
    invoke-virtual {v1, v9, v11}, Landroid/graphics/Canvas;->scale(FF)V

    .line 155
    .line 156
    .line 157
    :cond_6
    invoke-virtual {v2, v4, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 158
    .line 159
    .line 160
    iget-object v9, v0, Lyg1;->k:Lwg1;

    .line 161
    .line 162
    iget-object v10, v9, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 163
    .line 164
    if-eqz v10, :cond_7

    .line 165
    .line 166
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    .line 167
    .line 168
    .line 169
    move-result v10

    .line 170
    if-ne v5, v10, :cond_7

    .line 171
    .line 172
    iget-object v10, v9, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 173
    .line 174
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    .line 175
    .line 176
    .line 177
    move-result v10

    .line 178
    if-ne v6, v10, :cond_7

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_7
    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 182
    .line 183
    invoke-static {v5, v6, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 184
    .line 185
    .line 186
    move-result-object v10

    .line 187
    iput-object v10, v9, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 188
    .line 189
    iput-boolean v8, v9, Lwg1;->k:Z

    .line 190
    .line 191
    :goto_0
    iget-boolean v9, v0, Lyg1;->o:Z

    .line 192
    .line 193
    iget-object v10, v0, Lyg1;->k:Lwg1;

    .line 194
    .line 195
    if-nez v9, :cond_8

    .line 196
    .line 197
    iget-object v9, v10, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 198
    .line 199
    invoke-virtual {v9, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 200
    .line 201
    .line 202
    new-instance v15, Landroid/graphics/Canvas;

    .line 203
    .line 204
    iget-object v4, v10, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 205
    .line 206
    invoke-direct {v15, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 207
    .line 208
    .line 209
    iget-object v12, v10, Lwg1;->b:Lvg1;

    .line 210
    .line 211
    iget-object v13, v12, Lvg1;->g:Lsg1;

    .line 212
    .line 213
    sget-object v14, Lvg1;->p:Landroid/graphics/Matrix;

    .line 214
    .line 215
    move/from16 v16, v5

    .line 216
    .line 217
    move/from16 v17, v6

    .line 218
    .line 219
    invoke-virtual/range {v12 .. v17}, Lvg1;->a(Lsg1;Landroid/graphics/Matrix;Landroid/graphics/Canvas;II)V

    .line 220
    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_8
    move/from16 v16, v5

    .line 224
    .line 225
    move/from16 v17, v6

    .line 226
    .line 227
    iget-boolean v5, v10, Lwg1;->k:Z

    .line 228
    .line 229
    if-nez v5, :cond_9

    .line 230
    .line 231
    iget-object v5, v10, Lwg1;->g:Landroid/content/res/ColorStateList;

    .line 232
    .line 233
    iget-object v6, v10, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 234
    .line 235
    if-ne v5, v6, :cond_9

    .line 236
    .line 237
    iget-object v5, v10, Lwg1;->h:Landroid/graphics/PorterDuff$Mode;

    .line 238
    .line 239
    iget-object v6, v10, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 240
    .line 241
    if-ne v5, v6, :cond_9

    .line 242
    .line 243
    iget-boolean v5, v10, Lwg1;->j:Z

    .line 244
    .line 245
    iget-boolean v6, v10, Lwg1;->e:Z

    .line 246
    .line 247
    if-ne v5, v6, :cond_9

    .line 248
    .line 249
    iget v5, v10, Lwg1;->i:I

    .line 250
    .line 251
    iget-object v6, v10, Lwg1;->b:Lvg1;

    .line 252
    .line 253
    invoke-virtual {v6}, Lvg1;->getRootAlpha()I

    .line 254
    .line 255
    .line 256
    move-result v6

    .line 257
    if-ne v5, v6, :cond_9

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_9
    iget-object v5, v0, Lyg1;->k:Lwg1;

    .line 261
    .line 262
    iget-object v6, v5, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 263
    .line 264
    invoke-virtual {v6, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 265
    .line 266
    .line 267
    new-instance v15, Landroid/graphics/Canvas;

    .line 268
    .line 269
    iget-object v6, v5, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 270
    .line 271
    invoke-direct {v15, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 272
    .line 273
    .line 274
    iget-object v12, v5, Lwg1;->b:Lvg1;

    .line 275
    .line 276
    iget-object v13, v12, Lvg1;->g:Lsg1;

    .line 277
    .line 278
    sget-object v14, Lvg1;->p:Landroid/graphics/Matrix;

    .line 279
    .line 280
    invoke-virtual/range {v12 .. v17}, Lvg1;->a(Lsg1;Landroid/graphics/Matrix;Landroid/graphics/Canvas;II)V

    .line 281
    .line 282
    .line 283
    iget-object v5, v0, Lyg1;->k:Lwg1;

    .line 284
    .line 285
    iget-object v6, v5, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 286
    .line 287
    iput-object v6, v5, Lwg1;->g:Landroid/content/res/ColorStateList;

    .line 288
    .line 289
    iget-object v6, v5, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 290
    .line 291
    iput-object v6, v5, Lwg1;->h:Landroid/graphics/PorterDuff$Mode;

    .line 292
    .line 293
    iget-object v6, v5, Lwg1;->b:Lvg1;

    .line 294
    .line 295
    invoke-virtual {v6}, Lvg1;->getRootAlpha()I

    .line 296
    .line 297
    .line 298
    move-result v6

    .line 299
    iput v6, v5, Lwg1;->i:I

    .line 300
    .line 301
    iget-boolean v6, v5, Lwg1;->e:Z

    .line 302
    .line 303
    iput-boolean v6, v5, Lwg1;->j:Z

    .line 304
    .line 305
    iput-boolean v4, v5, Lwg1;->k:Z

    .line 306
    .line 307
    :goto_1
    iget-object v0, v0, Lyg1;->k:Lwg1;

    .line 308
    .line 309
    iget-object v4, v0, Lwg1;->b:Lvg1;

    .line 310
    .line 311
    invoke-virtual {v4}, Lvg1;->getRootAlpha()I

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    const/16 v5, 0xff

    .line 316
    .line 317
    const/4 v6, 0x0

    .line 318
    if-ge v4, v5, :cond_a

    .line 319
    .line 320
    goto :goto_2

    .line 321
    :cond_a
    if-nez v3, :cond_b

    .line 322
    .line 323
    move-object v3, v6

    .line 324
    goto :goto_3

    .line 325
    :cond_b
    :goto_2
    iget-object v4, v0, Lwg1;->l:Landroid/graphics/Paint;

    .line 326
    .line 327
    if-nez v4, :cond_c

    .line 328
    .line 329
    new-instance v4, Landroid/graphics/Paint;

    .line 330
    .line 331
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 332
    .line 333
    .line 334
    iput-object v4, v0, Lwg1;->l:Landroid/graphics/Paint;

    .line 335
    .line 336
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 337
    .line 338
    .line 339
    :cond_c
    iget-object v4, v0, Lwg1;->l:Landroid/graphics/Paint;

    .line 340
    .line 341
    iget-object v5, v0, Lwg1;->b:Lvg1;

    .line 342
    .line 343
    invoke-virtual {v5}, Lvg1;->getRootAlpha()I

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 348
    .line 349
    .line 350
    iget-object v4, v0, Lwg1;->l:Landroid/graphics/Paint;

    .line 351
    .line 352
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 353
    .line 354
    .line 355
    iget-object v3, v0, Lwg1;->l:Landroid/graphics/Paint;

    .line 356
    .line 357
    :goto_3
    iget-object v0, v0, Lwg1;->f:Landroid/graphics/Bitmap;

    .line 358
    .line 359
    invoke-virtual {v1, v0, v6, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 363
    .line 364
    .line 365
    :cond_d
    :goto_4
    return-void
.end method

.method public final getAlpha()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 11
    .line 12
    iget-object p0, p0, Lwg1;->b:Lvg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lvg1;->getRootAlpha()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final getChangingConfigurations()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 15
    .line 16
    invoke-virtual {p0}, Lwg1;->getChangingConfigurations()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    or-int/2addr p0, v0

    .line 21
    return p0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Loy;->c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lyg1;->m:Landroid/graphics/ColorFilter;

    .line 11
    .line 12
    return-object p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lxg1;

    .line 6
    .line 7
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Lxg1;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 18
    .line 19
    invoke-virtual {p0}, Lyg1;->getChangingConfigurations()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lwg1;->a:I

    .line 24
    .line 25
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 26
    .line 27
    return-object p0
.end method

.method public final getIntrinsicHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 11
    .line 12
    iget-object p0, p0, Lwg1;->b:Lvg1;

    .line 13
    .line 14
    iget p0, p0, Lvg1;->i:F

    .line 15
    .line 16
    float-to-int p0, p0

    .line 17
    return p0
.end method

.method public final getIntrinsicWidth()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 11
    .line 12
    iget-object p0, p0, Lwg1;->b:Lvg1;

    .line 13
    .line 14
    iget p0, p0, Lvg1;->h:F

    .line 15
    .line 16
    float-to-int p0, p0

    .line 17
    return p0
.end method

.method public final getOpacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x3

    .line 11
    return p0
.end method

.method public final inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1177
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 1178
    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 1179
    invoke-virtual {p0, p1, p2, p3, v0}, Lyg1;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public final inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    iget-object v5, v0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    if-eqz v5, :cond_0

    .line 14
    .line 15
    invoke-static {v5, v1, v2, v3, v4}, Loy;->d(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v5, v0, Lyg1;->k:Lwg1;

    .line 20
    .line 21
    new-instance v6, Lvg1;

    .line 22
    .line 23
    invoke-direct {v6}, Lvg1;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v6, v5, Lwg1;->b:Lvg1;

    .line 27
    .line 28
    sget-object v6, Lxg;->a:[I

    .line 29
    .line 30
    invoke-static {v1, v4, v3, v6}, Les0;->j(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    iget-object v7, v0, Lyg1;->k:Lwg1;

    .line 35
    .line 36
    iget-object v8, v7, Lwg1;->b:Lvg1;

    .line 37
    .line 38
    const-string v9, "tintMode"

    .line 39
    .line 40
    invoke-static {v2, v9}, Les0;->i(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v9

    .line 44
    const/4 v10, -0x1

    .line 45
    const/4 v11, 0x6

    .line 46
    if-nez v9, :cond_1

    .line 47
    .line 48
    move v9, v10

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v6, v11, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    :goto_0
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 55
    .line 56
    const/16 v13, 0x9

    .line 57
    .line 58
    const/4 v14, 0x3

    .line 59
    const/4 v15, 0x5

    .line 60
    if-eq v9, v14, :cond_3

    .line 61
    .line 62
    if-eq v9, v15, :cond_4

    .line 63
    .line 64
    if-eq v9, v13, :cond_2

    .line 65
    .line 66
    packed-switch v9, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :pswitch_0
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :pswitch_1
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :pswitch_2
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    .line 83
    .line 84
    :cond_4
    :goto_1
    iput-object v12, v7, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 85
    .line 86
    const-string v9, "tint"

    .line 87
    .line 88
    const-string v12, "http://schemas.android.com/apk/res/android"

    .line 89
    .line 90
    invoke-interface {v2, v12, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    const/16 v16, 0x0

    .line 95
    .line 96
    const/4 v11, 0x2

    .line 97
    const/4 v13, 0x0

    .line 98
    const/4 v10, 0x1

    .line 99
    if-eqz v9, :cond_5

    .line 100
    .line 101
    new-instance v9, Landroid/util/TypedValue;

    .line 102
    .line 103
    invoke-direct {v9}, Landroid/util/TypedValue;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v6, v10, v9}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 107
    .line 108
    .line 109
    iget v14, v9, Landroid/util/TypedValue;->type:I

    .line 110
    .line 111
    if-eq v14, v11, :cond_7

    .line 112
    .line 113
    const/16 v11, 0x1c

    .line 114
    .line 115
    if-lt v14, v11, :cond_6

    .line 116
    .line 117
    const/16 v11, 0x1f

    .line 118
    .line 119
    if-gt v14, v11, :cond_6

    .line 120
    .line 121
    iget v9, v9, Landroid/util/TypedValue;->data:I

    .line 122
    .line 123
    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 124
    .line 125
    .line 126
    move-result-object v16

    .line 127
    :catch_0
    :cond_5
    :goto_2
    move-object/from16 v9, v16

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_6
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    invoke-virtual {v6, v10, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 135
    .line 136
    .line 137
    move-result v11

    .line 138
    sget-object v14, Lil;->a:Ljava/lang/ThreadLocal;

    .line 139
    .line 140
    :try_start_0
    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 141
    .line 142
    .line 143
    move-result-object v11

    .line 144
    invoke-static {v9, v11, v4}, Lil;->a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 145
    .line 146
    .line 147
    move-result-object v16
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    goto :goto_2

    .line 149
    :cond_7
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 150
    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v2, "Failed to resolve attribute at index 1: "

    .line 154
    .line 155
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :goto_3
    if-eqz v9, :cond_8

    .line 170
    .line 171
    iput-object v9, v7, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 172
    .line 173
    :cond_8
    iget-boolean v9, v7, Lwg1;->e:Z

    .line 174
    .line 175
    const-string v11, "autoMirrored"

    .line 176
    .line 177
    invoke-interface {v2, v12, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v11

    .line 181
    if-eqz v11, :cond_9

    .line 182
    .line 183
    invoke-virtual {v6, v15, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 184
    .line 185
    .line 186
    move-result v9

    .line 187
    :cond_9
    iput-boolean v9, v7, Lwg1;->e:Z

    .line 188
    .line 189
    iget v7, v8, Lvg1;->j:F

    .line 190
    .line 191
    const-string v9, "viewportWidth"

    .line 192
    .line 193
    invoke-interface {v2, v12, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v9

    .line 197
    const/4 v11, 0x7

    .line 198
    if-eqz v9, :cond_a

    .line 199
    .line 200
    invoke-virtual {v6, v11, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    :cond_a
    iput v7, v8, Lvg1;->j:F

    .line 205
    .line 206
    iget v7, v8, Lvg1;->k:F

    .line 207
    .line 208
    const-string v9, "viewportHeight"

    .line 209
    .line 210
    invoke-interface {v2, v12, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v9

    .line 214
    const/16 v14, 0x8

    .line 215
    .line 216
    if-eqz v9, :cond_b

    .line 217
    .line 218
    invoke-virtual {v6, v14, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    :cond_b
    iput v7, v8, Lvg1;->k:F

    .line 223
    .line 224
    iget v9, v8, Lvg1;->j:F

    .line 225
    .line 226
    const/4 v15, 0x0

    .line 227
    cmpg-float v9, v9, v15

    .line 228
    .line 229
    if-lez v9, :cond_39

    .line 230
    .line 231
    cmpg-float v7, v7, v15

    .line 232
    .line 233
    if-lez v7, :cond_38

    .line 234
    .line 235
    iget v7, v8, Lvg1;->h:F

    .line 236
    .line 237
    const/4 v9, 0x3

    .line 238
    invoke-virtual {v6, v9, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 239
    .line 240
    .line 241
    move-result v7

    .line 242
    iput v7, v8, Lvg1;->h:F

    .line 243
    .line 244
    iget v7, v8, Lvg1;->i:F

    .line 245
    .line 246
    const/4 v9, 0x2

    .line 247
    invoke-virtual {v6, v9, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    iput v7, v8, Lvg1;->i:F

    .line 252
    .line 253
    iget v9, v8, Lvg1;->h:F

    .line 254
    .line 255
    cmpg-float v9, v9, v15

    .line 256
    .line 257
    if-lez v9, :cond_37

    .line 258
    .line 259
    cmpg-float v7, v7, v15

    .line 260
    .line 261
    if-lez v7, :cond_36

    .line 262
    .line 263
    invoke-virtual {v8}, Lvg1;->getAlpha()F

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    const-string v9, "alpha"

    .line 268
    .line 269
    invoke-interface {v2, v12, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    const/4 v11, 0x4

    .line 274
    if-eqz v9, :cond_c

    .line 275
    .line 276
    invoke-virtual {v6, v11, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    :cond_c
    invoke-virtual {v8, v7}, Lvg1;->setAlpha(F)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v6, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v7

    .line 287
    if-eqz v7, :cond_d

    .line 288
    .line 289
    iput-object v7, v8, Lvg1;->m:Ljava/lang/String;

    .line 290
    .line 291
    iget-object v9, v8, Lvg1;->o:Lda;

    .line 292
    .line 293
    invoke-virtual {v9, v7, v8}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    :cond_d
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0}, Lyg1;->getChangingConfigurations()I

    .line 300
    .line 301
    .line 302
    move-result v6

    .line 303
    iput v6, v5, Lwg1;->a:I

    .line 304
    .line 305
    iput-boolean v10, v5, Lwg1;->k:Z

    .line 306
    .line 307
    iget-object v6, v0, Lyg1;->k:Lwg1;

    .line 308
    .line 309
    iget-object v7, v6, Lwg1;->b:Lvg1;

    .line 310
    .line 311
    new-instance v8, Ljava/util/ArrayDeque;

    .line 312
    .line 313
    invoke-direct {v8}, Ljava/util/ArrayDeque;-><init>()V

    .line 314
    .line 315
    .line 316
    iget-object v9, v7, Lvg1;->g:Lsg1;

    .line 317
    .line 318
    iget-object v7, v7, Lvg1;->o:Lda;

    .line 319
    .line 320
    invoke-virtual {v8, v9}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 324
    .line 325
    .line 326
    move-result v9

    .line 327
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 328
    .line 329
    .line 330
    move-result v21

    .line 331
    add-int/lit8 v11, v21, 0x1

    .line 332
    .line 333
    move/from16 v21, v10

    .line 334
    .line 335
    :goto_4
    if-eq v9, v10, :cond_34

    .line 336
    .line 337
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 338
    .line 339
    .line 340
    move-result v14

    .line 341
    if-ge v14, v11, :cond_e

    .line 342
    .line 343
    const/4 v14, 0x3

    .line 344
    if-eq v9, v14, :cond_34

    .line 345
    .line 346
    :cond_e
    const-string v14, "group"

    .line 347
    .line 348
    const/4 v10, 0x2

    .line 349
    if-ne v9, v10, :cond_32

    .line 350
    .line 351
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v9

    .line 355
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v10

    .line 359
    check-cast v10, Lsg1;

    .line 360
    .line 361
    const-string v13, "path"

    .line 362
    .line 363
    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v13

    .line 367
    const-string v15, "fillType"

    .line 368
    .line 369
    move/from16 v25, v11

    .line 370
    .line 371
    const-string v11, "pathData"

    .line 372
    .line 373
    if-eqz v13, :cond_23

    .line 374
    .line 375
    new-instance v9, Lrg1;

    .line 376
    .line 377
    invoke-direct {v9}, Lug1;-><init>()V

    .line 378
    .line 379
    .line 380
    const/4 v13, 0x0

    .line 381
    iput v13, v9, Lrg1;->e:F

    .line 382
    .line 383
    const/high16 v14, 0x3f800000    # 1.0f

    .line 384
    .line 385
    iput v14, v9, Lrg1;->g:F

    .line 386
    .line 387
    iput v14, v9, Lrg1;->h:F

    .line 388
    .line 389
    iput v13, v9, Lrg1;->i:F

    .line 390
    .line 391
    iput v14, v9, Lrg1;->j:F

    .line 392
    .line 393
    iput v13, v9, Lrg1;->k:F

    .line 394
    .line 395
    sget-object v14, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    .line 396
    .line 397
    iput-object v14, v9, Lrg1;->l:Landroid/graphics/Paint$Cap;

    .line 398
    .line 399
    sget-object v13, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    .line 400
    .line 401
    iput-object v13, v9, Lrg1;->m:Landroid/graphics/Paint$Join;

    .line 402
    .line 403
    move-object/from16 v21, v13

    .line 404
    .line 405
    const/high16 v13, 0x40800000    # 4.0f

    .line 406
    .line 407
    iput v13, v9, Lrg1;->n:F

    .line 408
    .line 409
    sget-object v13, Lxg;->c:[I

    .line 410
    .line 411
    invoke-static {v1, v4, v3, v13}, Les0;->j(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 412
    .line 413
    .line 414
    move-result-object v13

    .line 415
    invoke-interface {v2, v12, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v11

    .line 419
    if-eqz v11, :cond_21

    .line 420
    .line 421
    move-object/from16 v26, v14

    .line 422
    .line 423
    const/4 v11, 0x0

    .line 424
    invoke-virtual {v13, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v14

    .line 428
    if-eqz v14, :cond_f

    .line 429
    .line 430
    iput-object v14, v9, Lug1;->b:Ljava/lang/String;

    .line 431
    .line 432
    :cond_f
    const/4 v11, 0x2

    .line 433
    invoke-virtual {v13, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v14

    .line 437
    if-eqz v14, :cond_10

    .line 438
    .line 439
    invoke-static {v14}, Lk42;->d(Ljava/lang/String;)[Lus0;

    .line 440
    .line 441
    .line 442
    move-result-object v11

    .line 443
    iput-object v11, v9, Lug1;->a:[Lus0;

    .line 444
    .line 445
    :cond_10
    const-string v11, "fillColor"

    .line 446
    .line 447
    const/4 v14, 0x1

    .line 448
    invoke-static {v13, v2, v4, v11, v14}, Les0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)Lo7;

    .line 449
    .line 450
    .line 451
    move-result-object v11

    .line 452
    iput-object v11, v9, Lrg1;->f:Lo7;

    .line 453
    .line 454
    iget v11, v9, Lrg1;->h:F

    .line 455
    .line 456
    const-string v14, "fillAlpha"

    .line 457
    .line 458
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v14

    .line 462
    if-eqz v14, :cond_11

    .line 463
    .line 464
    const/16 v14, 0xc

    .line 465
    .line 466
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 467
    .line 468
    .line 469
    move-result v11

    .line 470
    :cond_11
    iput v11, v9, Lrg1;->h:F

    .line 471
    .line 472
    const-string v11, "strokeLineCap"

    .line 473
    .line 474
    invoke-interface {v2, v12, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v11

    .line 478
    if-eqz v11, :cond_12

    .line 479
    .line 480
    const/16 v11, 0x8

    .line 481
    .line 482
    const/4 v14, -0x1

    .line 483
    invoke-virtual {v13, v11, v14}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 484
    .line 485
    .line 486
    move-result v23

    .line 487
    move/from16 v14, v23

    .line 488
    .line 489
    goto :goto_5

    .line 490
    :cond_12
    const/4 v14, -0x1

    .line 491
    :goto_5
    iget-object v11, v9, Lrg1;->l:Landroid/graphics/Paint$Cap;

    .line 492
    .line 493
    if-eqz v14, :cond_15

    .line 494
    .line 495
    move-object/from16 v27, v11

    .line 496
    .line 497
    const/4 v11, 0x1

    .line 498
    if-eq v14, v11, :cond_14

    .line 499
    .line 500
    const/4 v11, 0x2

    .line 501
    if-eq v14, v11, :cond_13

    .line 502
    .line 503
    move-object/from16 v14, v27

    .line 504
    .line 505
    goto :goto_6

    .line 506
    :cond_13
    sget-object v14, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    .line 507
    .line 508
    goto :goto_6

    .line 509
    :cond_14
    sget-object v14, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 510
    .line 511
    goto :goto_6

    .line 512
    :cond_15
    move-object/from16 v14, v26

    .line 513
    .line 514
    :goto_6
    iput-object v14, v9, Lrg1;->l:Landroid/graphics/Paint$Cap;

    .line 515
    .line 516
    const-string v11, "strokeLineJoin"

    .line 517
    .line 518
    invoke-interface {v2, v12, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v11

    .line 522
    if-eqz v11, :cond_16

    .line 523
    .line 524
    const/4 v11, -0x1

    .line 525
    const/16 v14, 0x9

    .line 526
    .line 527
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 528
    .line 529
    .line 530
    move-result v18

    .line 531
    move/from16 v11, v18

    .line 532
    .line 533
    goto :goto_7

    .line 534
    :cond_16
    const/4 v11, -0x1

    .line 535
    :goto_7
    iget-object v14, v9, Lrg1;->m:Landroid/graphics/Paint$Join;

    .line 536
    .line 537
    if-eqz v11, :cond_19

    .line 538
    .line 539
    move-object/from16 v26, v14

    .line 540
    .line 541
    const/4 v14, 0x1

    .line 542
    if-eq v11, v14, :cond_18

    .line 543
    .line 544
    const/4 v14, 0x2

    .line 545
    if-eq v11, v14, :cond_17

    .line 546
    .line 547
    move-object/from16 v11, v26

    .line 548
    .line 549
    goto :goto_8

    .line 550
    :cond_17
    sget-object v11, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    .line 551
    .line 552
    goto :goto_8

    .line 553
    :cond_18
    sget-object v11, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 554
    .line 555
    goto :goto_8

    .line 556
    :cond_19
    move-object/from16 v11, v21

    .line 557
    .line 558
    :goto_8
    iput-object v11, v9, Lrg1;->m:Landroid/graphics/Paint$Join;

    .line 559
    .line 560
    iget v11, v9, Lrg1;->n:F

    .line 561
    .line 562
    const-string v14, "strokeMiterLimit"

    .line 563
    .line 564
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v14

    .line 568
    if-eqz v14, :cond_1a

    .line 569
    .line 570
    const/16 v14, 0xa

    .line 571
    .line 572
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 573
    .line 574
    .line 575
    move-result v11

    .line 576
    :cond_1a
    iput v11, v9, Lrg1;->n:F

    .line 577
    .line 578
    const-string v11, "strokeColor"

    .line 579
    .line 580
    const/4 v14, 0x3

    .line 581
    invoke-static {v13, v2, v4, v11, v14}, Les0;->f(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)Lo7;

    .line 582
    .line 583
    .line 584
    move-result-object v11

    .line 585
    iput-object v11, v9, Lrg1;->d:Lo7;

    .line 586
    .line 587
    iget v11, v9, Lrg1;->g:F

    .line 588
    .line 589
    const-string v14, "strokeAlpha"

    .line 590
    .line 591
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 592
    .line 593
    .line 594
    move-result-object v14

    .line 595
    if-eqz v14, :cond_1b

    .line 596
    .line 597
    const/16 v14, 0xb

    .line 598
    .line 599
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 600
    .line 601
    .line 602
    move-result v11

    .line 603
    :cond_1b
    iput v11, v9, Lrg1;->g:F

    .line 604
    .line 605
    iget v11, v9, Lrg1;->e:F

    .line 606
    .line 607
    const-string v14, "strokeWidth"

    .line 608
    .line 609
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v14

    .line 613
    if-eqz v14, :cond_1c

    .line 614
    .line 615
    const/4 v14, 0x4

    .line 616
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 617
    .line 618
    .line 619
    move-result v11

    .line 620
    :cond_1c
    iput v11, v9, Lrg1;->e:F

    .line 621
    .line 622
    iget v11, v9, Lrg1;->j:F

    .line 623
    .line 624
    const-string v14, "trimPathEnd"

    .line 625
    .line 626
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v14

    .line 630
    if-eqz v14, :cond_1d

    .line 631
    .line 632
    const/4 v14, 0x6

    .line 633
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 634
    .line 635
    .line 636
    move-result v11

    .line 637
    :cond_1d
    iput v11, v9, Lrg1;->j:F

    .line 638
    .line 639
    iget v11, v9, Lrg1;->k:F

    .line 640
    .line 641
    const-string v14, "trimPathOffset"

    .line 642
    .line 643
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 644
    .line 645
    .line 646
    move-result-object v14

    .line 647
    if-eqz v14, :cond_1e

    .line 648
    .line 649
    const/4 v14, 0x7

    .line 650
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 651
    .line 652
    .line 653
    move-result v11

    .line 654
    :cond_1e
    iput v11, v9, Lrg1;->k:F

    .line 655
    .line 656
    iget v11, v9, Lrg1;->i:F

    .line 657
    .line 658
    const-string v14, "trimPathStart"

    .line 659
    .line 660
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v14

    .line 664
    if-eqz v14, :cond_1f

    .line 665
    .line 666
    const/4 v14, 0x5

    .line 667
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 668
    .line 669
    .line 670
    move-result v11

    .line 671
    :cond_1f
    iput v11, v9, Lrg1;->i:F

    .line 672
    .line 673
    iget v11, v9, Lug1;->c:I

    .line 674
    .line 675
    invoke-interface {v2, v12, v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 676
    .line 677
    .line 678
    move-result-object v14

    .line 679
    if-eqz v14, :cond_20

    .line 680
    .line 681
    const/16 v14, 0xd

    .line 682
    .line 683
    invoke-virtual {v13, v14, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 684
    .line 685
    .line 686
    move-result v11

    .line 687
    :cond_20
    iput v11, v9, Lug1;->c:I

    .line 688
    .line 689
    :cond_21
    invoke-virtual {v13}, Landroid/content/res/TypedArray;->recycle()V

    .line 690
    .line 691
    .line 692
    iget-object v10, v10, Lsg1;->b:Ljava/util/ArrayList;

    .line 693
    .line 694
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 695
    .line 696
    .line 697
    invoke-virtual {v9}, Lug1;->getPathName()Ljava/lang/String;

    .line 698
    .line 699
    .line 700
    move-result-object v10

    .line 701
    if-eqz v10, :cond_22

    .line 702
    .line 703
    invoke-virtual {v9}, Lug1;->getPathName()Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v10

    .line 707
    invoke-virtual {v7, v10, v9}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    .line 709
    .line 710
    :cond_22
    iget v9, v6, Lwg1;->a:I

    .line 711
    .line 712
    iput v9, v6, Lwg1;->a:I

    .line 713
    .line 714
    const/4 v13, 0x0

    .line 715
    const/4 v15, 0x2

    .line 716
    const/16 v18, 0x9

    .line 717
    .line 718
    const/16 v19, -0x1

    .line 719
    .line 720
    const/16 v21, 0x0

    .line 721
    .line 722
    const/16 v23, 0x8

    .line 723
    .line 724
    goto/16 :goto_e

    .line 725
    .line 726
    :cond_23
    const/16 v18, 0x9

    .line 727
    .line 728
    const/16 v19, -0x1

    .line 729
    .line 730
    const/16 v23, 0x8

    .line 731
    .line 732
    const-string v13, "clip-path"

    .line 733
    .line 734
    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 735
    .line 736
    .line 737
    move-result v13

    .line 738
    if-eqz v13, :cond_2a

    .line 739
    .line 740
    new-instance v9, Lqg1;

    .line 741
    .line 742
    invoke-direct {v9}, Lug1;-><init>()V

    .line 743
    .line 744
    .line 745
    invoke-interface {v2, v12, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 746
    .line 747
    .line 748
    move-result-object v11

    .line 749
    if-eqz v11, :cond_27

    .line 750
    .line 751
    sget-object v11, Lxg;->d:[I

    .line 752
    .line 753
    invoke-static {v1, v4, v3, v11}, Les0;->j(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 754
    .line 755
    .line 756
    move-result-object v11

    .line 757
    const/4 v13, 0x0

    .line 758
    invoke-virtual {v11, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 759
    .line 760
    .line 761
    move-result-object v14

    .line 762
    if-eqz v14, :cond_24

    .line 763
    .line 764
    iput-object v14, v9, Lug1;->b:Ljava/lang/String;

    .line 765
    .line 766
    :cond_24
    const/4 v14, 0x1

    .line 767
    invoke-virtual {v11, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 768
    .line 769
    .line 770
    move-result-object v13

    .line 771
    if-eqz v13, :cond_25

    .line 772
    .line 773
    invoke-static {v13}, Lk42;->d(Ljava/lang/String;)[Lus0;

    .line 774
    .line 775
    .line 776
    move-result-object v13

    .line 777
    iput-object v13, v9, Lug1;->a:[Lus0;

    .line 778
    .line 779
    :cond_25
    invoke-static {v2, v15}, Les0;->i(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 780
    .line 781
    .line 782
    move-result v13

    .line 783
    if-nez v13, :cond_26

    .line 784
    .line 785
    const/4 v15, 0x0

    .line 786
    goto :goto_9

    .line 787
    :cond_26
    const/4 v13, 0x0

    .line 788
    const/4 v14, 0x2

    .line 789
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 790
    .line 791
    .line 792
    move-result v15

    .line 793
    :goto_9
    iput v15, v9, Lug1;->c:I

    .line 794
    .line 795
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 796
    .line 797
    .line 798
    :cond_27
    iget-object v10, v10, Lsg1;->b:Ljava/util/ArrayList;

    .line 799
    .line 800
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 801
    .line 802
    .line 803
    invoke-virtual {v9}, Lug1;->getPathName()Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object v10

    .line 807
    if-eqz v10, :cond_28

    .line 808
    .line 809
    invoke-virtual {v9}, Lug1;->getPathName()Ljava/lang/String;

    .line 810
    .line 811
    .line 812
    move-result-object v10

    .line 813
    invoke-virtual {v7, v10, v9}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    .line 815
    .line 816
    :cond_28
    iget v9, v6, Lwg1;->a:I

    .line 817
    .line 818
    iput v9, v6, Lwg1;->a:I

    .line 819
    .line 820
    :cond_29
    const/4 v13, 0x0

    .line 821
    const/4 v15, 0x2

    .line 822
    goto/16 :goto_e

    .line 823
    .line 824
    :cond_2a
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 825
    .line 826
    .line 827
    move-result v9

    .line 828
    if-eqz v9, :cond_29

    .line 829
    .line 830
    new-instance v9, Lsg1;

    .line 831
    .line 832
    invoke-direct {v9}, Lsg1;-><init>()V

    .line 833
    .line 834
    .line 835
    sget-object v11, Lxg;->b:[I

    .line 836
    .line 837
    invoke-static {v1, v4, v3, v11}, Les0;->j(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 838
    .line 839
    .line 840
    move-result-object v11

    .line 841
    iget v13, v9, Lsg1;->c:F

    .line 842
    .line 843
    const-string v14, "rotation"

    .line 844
    .line 845
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 846
    .line 847
    .line 848
    move-result-object v14

    .line 849
    if-eqz v14, :cond_2b

    .line 850
    .line 851
    const/4 v15, 0x5

    .line 852
    invoke-virtual {v11, v15, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 853
    .line 854
    .line 855
    move-result v13

    .line 856
    goto :goto_a

    .line 857
    :cond_2b
    const/4 v15, 0x5

    .line 858
    :goto_a
    iput v13, v9, Lsg1;->c:F

    .line 859
    .line 860
    iget v13, v9, Lsg1;->d:F

    .line 861
    .line 862
    const/4 v14, 0x1

    .line 863
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 864
    .line 865
    .line 866
    move-result v13

    .line 867
    iput v13, v9, Lsg1;->d:F

    .line 868
    .line 869
    iget v13, v9, Lsg1;->e:F

    .line 870
    .line 871
    const/4 v15, 0x2

    .line 872
    invoke-virtual {v11, v15, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 873
    .line 874
    .line 875
    move-result v13

    .line 876
    iput v13, v9, Lsg1;->e:F

    .line 877
    .line 878
    iget v13, v9, Lsg1;->f:F

    .line 879
    .line 880
    const-string v14, "scaleX"

    .line 881
    .line 882
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 883
    .line 884
    .line 885
    move-result-object v14

    .line 886
    if-eqz v14, :cond_2c

    .line 887
    .line 888
    const/4 v14, 0x3

    .line 889
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 890
    .line 891
    .line 892
    move-result v13

    .line 893
    :cond_2c
    iput v13, v9, Lsg1;->f:F

    .line 894
    .line 895
    iget v13, v9, Lsg1;->g:F

    .line 896
    .line 897
    const-string v14, "scaleY"

    .line 898
    .line 899
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 900
    .line 901
    .line 902
    move-result-object v14

    .line 903
    if-eqz v14, :cond_2d

    .line 904
    .line 905
    const/4 v14, 0x4

    .line 906
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 907
    .line 908
    .line 909
    move-result v13

    .line 910
    goto :goto_b

    .line 911
    :cond_2d
    const/4 v14, 0x4

    .line 912
    :goto_b
    iput v13, v9, Lsg1;->g:F

    .line 913
    .line 914
    iget v13, v9, Lsg1;->h:F

    .line 915
    .line 916
    const-string v14, "translateX"

    .line 917
    .line 918
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 919
    .line 920
    .line 921
    move-result-object v14

    .line 922
    if-eqz v14, :cond_2e

    .line 923
    .line 924
    const/4 v14, 0x6

    .line 925
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 926
    .line 927
    .line 928
    move-result v13

    .line 929
    goto :goto_c

    .line 930
    :cond_2e
    const/4 v14, 0x6

    .line 931
    :goto_c
    iput v13, v9, Lsg1;->h:F

    .line 932
    .line 933
    iget v13, v9, Lsg1;->i:F

    .line 934
    .line 935
    const-string v14, "translateY"

    .line 936
    .line 937
    invoke-interface {v2, v12, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 938
    .line 939
    .line 940
    move-result-object v14

    .line 941
    if-eqz v14, :cond_2f

    .line 942
    .line 943
    const/4 v14, 0x7

    .line 944
    invoke-virtual {v11, v14, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 945
    .line 946
    .line 947
    move-result v13

    .line 948
    goto :goto_d

    .line 949
    :cond_2f
    const/4 v14, 0x7

    .line 950
    :goto_d
    iput v13, v9, Lsg1;->i:F

    .line 951
    .line 952
    const/4 v13, 0x0

    .line 953
    invoke-virtual {v11, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 954
    .line 955
    .line 956
    move-result-object v14

    .line 957
    if-eqz v14, :cond_30

    .line 958
    .line 959
    iput-object v14, v9, Lsg1;->k:Ljava/lang/String;

    .line 960
    .line 961
    :cond_30
    invoke-virtual {v9}, Lsg1;->c()V

    .line 962
    .line 963
    .line 964
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 965
    .line 966
    .line 967
    iget-object v10, v10, Lsg1;->b:Ljava/util/ArrayList;

    .line 968
    .line 969
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 970
    .line 971
    .line 972
    invoke-virtual {v8, v9}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 973
    .line 974
    .line 975
    invoke-virtual {v9}, Lsg1;->getGroupName()Ljava/lang/String;

    .line 976
    .line 977
    .line 978
    move-result-object v10

    .line 979
    if-eqz v10, :cond_31

    .line 980
    .line 981
    invoke-virtual {v9}, Lsg1;->getGroupName()Ljava/lang/String;

    .line 982
    .line 983
    .line 984
    move-result-object v10

    .line 985
    invoke-virtual {v7, v10, v9}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 986
    .line 987
    .line 988
    :cond_31
    iget v9, v6, Lwg1;->a:I

    .line 989
    .line 990
    iput v9, v6, Lwg1;->a:I

    .line 991
    .line 992
    :goto_e
    const/4 v10, 0x3

    .line 993
    const/16 v17, 0x6

    .line 994
    .line 995
    const/16 v20, 0x7

    .line 996
    .line 997
    const/16 v22, 0x4

    .line 998
    .line 999
    const/16 v24, 0x1

    .line 1000
    .line 1001
    goto :goto_f

    .line 1002
    :cond_32
    move v15, v10

    .line 1003
    move/from16 v25, v11

    .line 1004
    .line 1005
    const/4 v10, 0x3

    .line 1006
    const/16 v17, 0x6

    .line 1007
    .line 1008
    const/16 v18, 0x9

    .line 1009
    .line 1010
    const/16 v19, -0x1

    .line 1011
    .line 1012
    const/16 v20, 0x7

    .line 1013
    .line 1014
    const/16 v22, 0x4

    .line 1015
    .line 1016
    const/16 v23, 0x8

    .line 1017
    .line 1018
    const/16 v24, 0x1

    .line 1019
    .line 1020
    if-ne v9, v10, :cond_33

    .line 1021
    .line 1022
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v9

    .line 1026
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1027
    .line 1028
    .line 1029
    move-result v9

    .line 1030
    if-eqz v9, :cond_33

    .line 1031
    .line 1032
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 1033
    .line 1034
    .line 1035
    :cond_33
    :goto_f
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 1036
    .line 1037
    .line 1038
    move-result v9

    .line 1039
    move/from16 v14, v23

    .line 1040
    .line 1041
    move/from16 v10, v24

    .line 1042
    .line 1043
    move/from16 v11, v25

    .line 1044
    .line 1045
    const/4 v15, 0x0

    .line 1046
    goto/16 :goto_4

    .line 1047
    .line 1048
    :cond_34
    if-nez v21, :cond_35

    .line 1049
    .line 1050
    iget-object v1, v5, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 1051
    .line 1052
    iget-object v2, v5, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 1053
    .line 1054
    invoke-virtual {v0, v1, v2}, Lyg1;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v1

    .line 1058
    iput-object v1, v0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    .line 1059
    .line 1060
    return-void

    .line 1061
    :cond_35
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 1062
    .line 1063
    const-string v1, "no path defined"

    .line 1064
    .line 1065
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    throw v0

    .line 1069
    :cond_36
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 1070
    .line 1071
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    .line 1072
    .line 1073
    .line 1074
    move-result-object v1

    .line 1075
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1076
    .line 1077
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1078
    .line 1079
    .line 1080
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1081
    .line 1082
    .line 1083
    const-string v1, "<vector> tag requires height > 0"

    .line 1084
    .line 1085
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1086
    .line 1087
    .line 1088
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v1

    .line 1092
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 1093
    .line 1094
    .line 1095
    throw v0

    .line 1096
    :cond_37
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 1097
    .line 1098
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v1

    .line 1102
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1103
    .line 1104
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1105
    .line 1106
    .line 1107
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1108
    .line 1109
    .line 1110
    const-string v1, "<vector> tag requires width > 0"

    .line 1111
    .line 1112
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1113
    .line 1114
    .line 1115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1116
    .line 1117
    .line 1118
    move-result-object v1

    .line 1119
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 1120
    .line 1121
    .line 1122
    throw v0

    .line 1123
    :cond_38
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 1124
    .line 1125
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v1

    .line 1129
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1130
    .line 1131
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1132
    .line 1133
    .line 1134
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1135
    .line 1136
    .line 1137
    const-string v1, "<vector> tag requires viewportHeight > 0"

    .line 1138
    .line 1139
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1140
    .line 1141
    .line 1142
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v1

    .line 1146
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 1147
    .line 1148
    .line 1149
    throw v0

    .line 1150
    :cond_39
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 1151
    .line 1152
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v1

    .line 1156
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1157
    .line 1158
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1159
    .line 1160
    .line 1161
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1162
    .line 1163
    .line 1164
    const-string v1, "<vector> tag requires viewportWidth > 0"

    .line 1165
    .line 1166
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1167
    .line 1168
    .line 1169
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1170
    .line 1171
    .line 1172
    move-result-object v1

    .line 1173
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 1174
    .line 1175
    .line 1176
    throw v0

    .line 1177
    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final invalidateSelf()V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final isAutoMirrored()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 11
    .line 12
    iget-boolean p0, p0, Lwg1;->e:Z

    .line 13
    .line 14
    return p0
.end method

.method public final isStateful()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, v0, Lwg1;->b:Lvg1;

    .line 21
    .line 22
    iget-object v1, v0, Lvg1;->n:Ljava/lang/Boolean;

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v1, v0, Lvg1;->g:Lsg1;

    .line 27
    .line 28
    invoke-virtual {v1}, Lsg1;->a()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Lvg1;->n:Ljava/lang/Boolean;

    .line 37
    .line 38
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 45
    .line 46
    iget-object p0, p0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 p0, 0x0

    .line 58
    return p0

    .line 59
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 60
    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Lyg1;->n:Z

    .line 10
    .line 11
    if-nez v0, :cond_4

    .line 12
    .line 13
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-ne v0, p0, :cond_4

    .line 18
    .line 19
    new-instance v0, Lwg1;

    .line 20
    .line 21
    iget-object v1, p0, Lyg1;->k:Lwg1;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    iput-object v2, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    sget-object v2, Lyg1;->s:Landroid/graphics/PorterDuff$Mode;

    .line 30
    .line 31
    iput-object v2, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    iget v2, v1, Lwg1;->a:I

    .line 36
    .line 37
    iput v2, v0, Lwg1;->a:I

    .line 38
    .line 39
    new-instance v2, Lvg1;

    .line 40
    .line 41
    iget-object v3, v1, Lwg1;->b:Lvg1;

    .line 42
    .line 43
    invoke-direct {v2, v3}, Lvg1;-><init>(Lvg1;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, v0, Lwg1;->b:Lvg1;

    .line 47
    .line 48
    iget-object v3, v1, Lwg1;->b:Lvg1;

    .line 49
    .line 50
    iget-object v3, v3, Lvg1;->e:Landroid/graphics/Paint;

    .line 51
    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    new-instance v3, Landroid/graphics/Paint;

    .line 55
    .line 56
    iget-object v4, v1, Lwg1;->b:Lvg1;

    .line 57
    .line 58
    iget-object v4, v4, Lvg1;->e:Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    iput-object v3, v2, Lvg1;->e:Landroid/graphics/Paint;

    .line 64
    .line 65
    :cond_1
    iget-object v2, v1, Lwg1;->b:Lvg1;

    .line 66
    .line 67
    iget-object v2, v2, Lvg1;->d:Landroid/graphics/Paint;

    .line 68
    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    iget-object v2, v0, Lwg1;->b:Lvg1;

    .line 72
    .line 73
    new-instance v3, Landroid/graphics/Paint;

    .line 74
    .line 75
    iget-object v4, v1, Lwg1;->b:Lvg1;

    .line 76
    .line 77
    iget-object v4, v4, Lvg1;->d:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    iput-object v3, v2, Lvg1;->d:Landroid/graphics/Paint;

    .line 83
    .line 84
    :cond_2
    iget-object v2, v1, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 85
    .line 86
    iput-object v2, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 87
    .line 88
    iget-object v2, v1, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 89
    .line 90
    iput-object v2, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 91
    .line 92
    iget-boolean v1, v1, Lwg1;->e:Z

    .line 93
    .line 94
    iput-boolean v1, v0, Lwg1;->e:Z

    .line 95
    .line 96
    :cond_3
    iput-object v0, p0, Lyg1;->k:Lwg1;

    .line 97
    .line 98
    const/4 v0, 0x1

    .line 99
    iput-boolean v0, p0, Lyg1;->n:Z

    .line 100
    .line 101
    :cond_4
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final onStateChange([I)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 11
    .line 12
    iget-object v1, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v3, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 18
    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v1, v3}, Lyg1;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, p0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    .line 26
    .line 27
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 28
    .line 29
    .line 30
    move v1, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v1, 0x0

    .line 33
    :goto_0
    iget-object v3, v0, Lwg1;->b:Lvg1;

    .line 34
    .line 35
    iget-object v4, v3, Lvg1;->n:Ljava/lang/Boolean;

    .line 36
    .line 37
    if-nez v4, :cond_2

    .line 38
    .line 39
    iget-object v4, v3, Lvg1;->g:Lsg1;

    .line 40
    .line 41
    invoke-virtual {v4}, Lsg1;->a()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iput-object v4, v3, Lvg1;->n:Ljava/lang/Boolean;

    .line 50
    .line 51
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_3

    .line 56
    .line 57
    iget-object v3, v0, Lwg1;->b:Lvg1;

    .line 58
    .line 59
    iget-object v3, v3, Lvg1;->g:Lsg1;

    .line 60
    .line 61
    invoke-virtual {v3, p1}, Lsg1;->b([I)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-boolean v3, v0, Lwg1;->k:Z

    .line 66
    .line 67
    or-int/2addr v3, p1

    .line 68
    iput-boolean v3, v0, Lwg1;->k:Z

    .line 69
    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 73
    .line 74
    .line 75
    return v2

    .line 76
    :cond_3
    return v1
.end method

.method public final scheduleSelf(Ljava/lang/Runnable;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 10
    .line 11
    iget-object v0, v0, Lwg1;->b:Lvg1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lvg1;->getRootAlpha()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eq v0, p1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 20
    .line 21
    iget-object v0, v0, Lwg1;->b:Lvg1;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lvg1;->setRootAlpha(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final setAutoMirrored(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lyg1;->k:Lwg1;

    .line 10
    .line 11
    iput-boolean p1, p0, Lwg1;->e:Z

    .line 12
    .line 13
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Lyg1;->m:Landroid/graphics/ColorFilter;

    .line 10
    .line 11
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final setTint(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->g(Landroid/graphics/drawable/Drawable;I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->h(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 10
    .line 11
    iget-object v1, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 12
    .line 13
    if-eq v1, p1, :cond_1

    .line 14
    .line 15
    iput-object p1, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    iget-object v0, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Lyg1;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    .line 24
    .line 25
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lyg1;->k:Lwg1;

    .line 10
    .line 11
    iget-object v1, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 12
    .line 13
    if-eq v1, p1, :cond_1

    .line 14
    .line 15
    iput-object p1, v0, Lwg1;->d:Landroid/graphics/PorterDuff$Mode;

    .line 16
    .line 17
    iget-object v0, v0, Lwg1;->c:Landroid/content/res/ColorStateList;

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lyg1;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lyg1;->l:Landroid/graphics/PorterDuffColorFilter;

    .line 24
    .line 25
    invoke-virtual {p0}, Lyg1;->invalidateSelf()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final setVisible(ZZ)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final unscheduleSelf(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
