.class public final Lbz0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public j:I

.field public k:I

.field public l:Landroid/widget/OverScroller;

.field public m:Landroid/view/animation/Interpolator;

.field public n:Z

.field public o:Z

.field public final synthetic p:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    sget-object v0, Landroidx/recyclerview/widget/RecyclerView;->E0:Ley0;

    .line 7
    .line 8
    iput-object v0, p0, Lbz0;->m:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lbz0;->n:Z

    .line 12
    .line 13
    iput-boolean v1, p0, Lbz0;->o:Z

    .line 14
    .line 15
    new-instance v1, Landroid/widget/OverScroller;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v1, p1, v0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .line 1
    iget-object v0, p0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 4
    .line 5
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v9, 0x0

    .line 19
    iput-boolean v9, p0, Lbz0;->o:Z

    .line 20
    .line 21
    const/4 v10, 0x1

    .line 22
    iput-boolean v10, p0, Lbz0;->n:Z

    .line 23
    .line 24
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->k()V

    .line 25
    .line 26
    .line 27
    iget-object v11, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 28
    .line 29
    invoke-virtual {v11}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1a

    .line 34
    .line 35
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getCurrX()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getCurrY()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iget v3, p0, Lbz0;->j:I

    .line 44
    .line 45
    sub-int v3, v1, v3

    .line 46
    .line 47
    iget v4, p0, Lbz0;->k:I

    .line 48
    .line 49
    sub-int v4, v2, v4

    .line 50
    .line 51
    iput v1, p0, Lbz0;->j:I

    .line 52
    .line 53
    iput v2, p0, Lbz0;->k:I

    .line 54
    .line 55
    move v1, v3

    .line 56
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 57
    .line 58
    aput v9, v3, v9

    .line 59
    .line 60
    aput v9, v3, v10

    .line 61
    .line 62
    move v2, v4

    .line 63
    const/4 v4, 0x0

    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView;->p(II[I[II)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    aget v3, v8, v9

    .line 72
    .line 73
    sub-int v3, v1, v3

    .line 74
    .line 75
    aget v1, v8, v10

    .line 76
    .line 77
    sub-int v4, v2, v1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move v3, v1

    .line 81
    move v4, v2

    .line 82
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getOverScrollMode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    const/4 v12, 0x2

    .line 87
    if-eq v1, v12, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0, v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->j(II)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 93
    .line 94
    if-eqz v1, :cond_3

    .line 95
    .line 96
    aput v9, v8, v9

    .line 97
    .line 98
    aput v9, v8, v10

    .line 99
    .line 100
    invoke-virtual {v0, v3, v4, v8}, Landroidx/recyclerview/widget/RecyclerView;->W(II[I)V

    .line 101
    .line 102
    .line 103
    aget v1, v8, v9

    .line 104
    .line 105
    aget v2, v8, v10

    .line 106
    .line 107
    sub-int/2addr v3, v1

    .line 108
    sub-int/2addr v4, v2

    .line 109
    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 110
    .line 111
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_3
    move v1, v9

    .line 116
    move v2, v1

    .line 117
    :goto_1
    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_4

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 126
    .line 127
    .line 128
    :cond_4
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 129
    .line 130
    aput v9, v7, v9

    .line 131
    .line 132
    aput v9, v7, v10

    .line 133
    .line 134
    const/4 v5, 0x0

    .line 135
    const/4 v6, 0x1

    .line 136
    invoke-virtual/range {v0 .. v7}, Landroidx/recyclerview/widget/RecyclerView;->q(IIII[II[I)V

    .line 137
    .line 138
    .line 139
    aget v5, v8, v9

    .line 140
    .line 141
    sub-int/2addr v3, v5

    .line 142
    aget v5, v8, v10

    .line 143
    .line 144
    sub-int/2addr v4, v5

    .line 145
    if-nez v1, :cond_5

    .line 146
    .line 147
    if-eqz v2, :cond_6

    .line 148
    .line 149
    :cond_5
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->r(II)V

    .line 150
    .line 151
    .line 152
    :cond_6
    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->c(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-nez v5, :cond_7

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 159
    .line 160
    .line 161
    :cond_7
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getCurrX()I

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getFinalX()I

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-ne v5, v6, :cond_8

    .line 170
    .line 171
    move v5, v10

    .line 172
    goto :goto_2

    .line 173
    :cond_8
    move v5, v9

    .line 174
    :goto_2
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getCurrY()I

    .line 175
    .line 176
    .line 177
    move-result v6

    .line 178
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getFinalY()I

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    if-ne v6, v7, :cond_9

    .line 183
    .line 184
    move v6, v10

    .line 185
    goto :goto_3

    .line 186
    :cond_9
    move v6, v9

    .line 187
    :goto_3
    invoke-virtual {v11}, Landroid/widget/OverScroller;->isFinished()Z

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    if-nez v7, :cond_c

    .line 192
    .line 193
    if-nez v5, :cond_a

    .line 194
    .line 195
    if-eqz v3, :cond_b

    .line 196
    .line 197
    :cond_a
    if-nez v6, :cond_c

    .line 198
    .line 199
    if-eqz v4, :cond_b

    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_b
    move v5, v9

    .line 203
    goto :goto_5

    .line 204
    :cond_c
    :goto_4
    move v5, v10

    .line 205
    :goto_5
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 206
    .line 207
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    .line 209
    .line 210
    if-eqz v5, :cond_18

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/view/View;->getOverScrollMode()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-eq v1, v12, :cond_16

    .line 217
    .line 218
    invoke-virtual {v11}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    float-to-int v1, v1

    .line 223
    if-gez v3, :cond_d

    .line 224
    .line 225
    neg-int v2, v1

    .line 226
    goto :goto_6

    .line 227
    :cond_d
    if-lez v3, :cond_e

    .line 228
    .line 229
    move v2, v1

    .line 230
    goto :goto_6

    .line 231
    :cond_e
    move v2, v9

    .line 232
    :goto_6
    if-gez v4, :cond_f

    .line 233
    .line 234
    neg-int v1, v1

    .line 235
    goto :goto_7

    .line 236
    :cond_f
    if-lez v4, :cond_10

    .line 237
    .line 238
    goto :goto_7

    .line 239
    :cond_10
    move v1, v9

    .line 240
    :goto_7
    if-gez v2, :cond_11

    .line 241
    .line 242
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->t()V

    .line 243
    .line 244
    .line 245
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 246
    .line 247
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-eqz v3, :cond_12

    .line 252
    .line 253
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 254
    .line 255
    neg-int v4, v2

    .line 256
    invoke-virtual {v3, v4}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 257
    .line 258
    .line 259
    goto :goto_8

    .line 260
    :cond_11
    if-lez v2, :cond_12

    .line 261
    .line 262
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->u()V

    .line 263
    .line 264
    .line 265
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 266
    .line 267
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    if-eqz v3, :cond_12

    .line 272
    .line 273
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 274
    .line 275
    invoke-virtual {v3, v2}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 276
    .line 277
    .line 278
    :cond_12
    :goto_8
    if-gez v1, :cond_13

    .line 279
    .line 280
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->v()V

    .line 281
    .line 282
    .line 283
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 284
    .line 285
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 286
    .line 287
    .line 288
    move-result v3

    .line 289
    if-eqz v3, :cond_14

    .line 290
    .line 291
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 292
    .line 293
    neg-int v4, v1

    .line 294
    invoke-virtual {v3, v4}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 295
    .line 296
    .line 297
    goto :goto_9

    .line 298
    :cond_13
    if-lez v1, :cond_14

    .line 299
    .line 300
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->s()V

    .line 301
    .line 302
    .line 303
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 304
    .line 305
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    if-eqz v3, :cond_14

    .line 310
    .line 311
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 312
    .line 313
    invoke-virtual {v3, v1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 314
    .line 315
    .line 316
    :cond_14
    :goto_9
    if-nez v2, :cond_15

    .line 317
    .line 318
    if-eqz v1, :cond_16

    .line 319
    .line 320
    :cond_15
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 321
    .line 322
    invoke-virtual {v0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 323
    .line 324
    .line 325
    :cond_16
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->l0:Lwk;

    .line 326
    .line 327
    iget-object v2, v1, Lwk;->d:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast v2, [I

    .line 330
    .line 331
    if-eqz v2, :cond_17

    .line 332
    .line 333
    const/4 v3, -0x1

    .line 334
    invoke-static {v2, v3}, Ljava/util/Arrays;->fill([II)V

    .line 335
    .line 336
    .line 337
    :cond_17
    iput v9, v1, Lwk;->c:I

    .line 338
    .line 339
    goto :goto_b

    .line 340
    :cond_18
    iget-boolean v3, p0, Lbz0;->n:Z

    .line 341
    .line 342
    if-eqz v3, :cond_19

    .line 343
    .line 344
    iput-boolean v10, p0, Lbz0;->o:Z

    .line 345
    .line 346
    goto :goto_a

    .line 347
    :cond_19
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 348
    .line 349
    .line 350
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 351
    .line 352
    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 353
    .line 354
    .line 355
    :goto_a
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 356
    .line 357
    if-eqz v3, :cond_1a

    .line 358
    .line 359
    invoke-virtual {v3, v0, v1, v2}, Lu90;->a(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 360
    .line 361
    .line 362
    :cond_1a
    :goto_b
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 363
    .line 364
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 365
    .line 366
    .line 367
    iput-boolean v9, p0, Lbz0;->n:Z

    .line 368
    .line 369
    iget-boolean v1, p0, Lbz0;->o:Z

    .line 370
    .line 371
    if-eqz v1, :cond_1b

    .line 372
    .line 373
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 374
    .line 375
    .line 376
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 377
    .line 378
    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    :cond_1b
    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/RecyclerView;->a0(I)V

    .line 386
    .line 387
    .line 388
    return-void
.end method
