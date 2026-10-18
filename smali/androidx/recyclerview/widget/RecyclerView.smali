.class public Landroidx/recyclerview/widget/RecyclerView;
.super Landroid/view/ViewGroup;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final C0:[I

.field public static final D0:[Ljava/lang/Class;

.field public static final E0:Ley0;


# instance fields
.field public A:Z

.field public final A0:Ldy0;

.field public B:Z

.field public final B0:Lfy0;

.field public C:I

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:I

.field public H:Z

.field public final I:Landroid/view/accessibility/AccessibilityManager;

.field public J:Z

.field public K:Z

.field public L:I

.field public M:I

.field public N:Lky0;

.field public O:Landroid/widget/EdgeEffect;

.field public P:Landroid/widget/EdgeEffect;

.field public Q:Landroid/widget/EdgeEffect;

.field public R:Landroid/widget/EdgeEffect;

.field public S:Lly0;

.field public T:I

.field public U:I

.field public V:Landroid/view/VelocityTracker;

.field public W:I

.field public a0:I

.field public b0:I

.field public c0:I

.field public d0:I

.field public final e0:I

.field public final f0:I

.field public final g0:F

.field public final h0:F

.field public i0:Z

.field public final j:Lxy0;

.field public final j0:Lbz0;

.field public final k:Lvy0;

.field public k0:Lu90;

.field public l:Lyy0;

.field public final l0:Lwk;

.field public final m:Ls3;

.field public final m0:Lzy0;

.field public final n:Lc9;

.field public n0:Lsy0;

.field public final o:Lxn0;

.field public o0:Ljava/util/ArrayList;

.field public p:Z

.field public p0:Z

.field public final q:Lcy0;

.field public q0:Z

.field public final r:Landroid/graphics/Rect;

.field public final r0:Lgy0;

.field public final s:Landroid/graphics/Rect;

.field public s0:Z

.field public final t:Landroid/graphics/RectF;

.field public t0:Ldz0;

.field public u:Lhy0;

.field public final u0:[I

.field public v:Lpy0;

.field public v0:Lgp0;

.field public final w:Ljava/util/ArrayList;

.field public final w0:[I

.field public final x:Ljava/util/ArrayList;

.field public final x0:[I

.field public y:Ls20;

.field public final y0:[I

.field public z:Z

.field public final z0:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const v0, 0x1010436

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Landroidx/recyclerview/widget/RecyclerView;->C0:[I

    .line 9
    .line 10
    const-class v0, Landroid/util/AttributeSet;

    .line 11
    .line 12
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 13
    .line 14
    const-class v2, Landroid/content/Context;

    .line 15
    .line 16
    filled-new-array {v2, v0, v1, v1}, [Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Landroidx/recyclerview/widget/RecyclerView;->D0:[Ljava/lang/Class;

    .line 21
    .line 22
    new-instance v0, Ley0;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Landroidx/recyclerview/widget/RecyclerView;->E0:Ley0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 885
    invoke-direct {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    move-object/from16 v10, p2

    .line 6
    .line 7
    const v11, 0x7f040390

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v9, v10, v11}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lxy0;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Lxy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->j:Lxy0;

    .line 19
    .line 20
    new-instance v0, Lvy0;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lvy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 26
    .line 27
    new-instance v0, Lxn0;

    .line 28
    .line 29
    const/16 v2, 0x11

    .line 30
    .line 31
    invoke-direct {v0, v2}, Lxn0;-><init>(I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->o:Lxn0;

    .line 35
    .line 36
    new-instance v0, Lcy0;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Lcy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->q:Lcy0;

    .line 42
    .line 43
    new-instance v0, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->r:Landroid/graphics/Rect;

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->s:Landroid/graphics/Rect;

    .line 56
    .line 57
    new-instance v0, Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->t:Landroid/graphics/RectF;

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 70
    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->x:Ljava/util/ArrayList;

    .line 77
    .line 78
    const/4 v12, 0x0

    .line 79
    iput v12, v1, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 80
    .line 81
    iput-boolean v12, v1, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 82
    .line 83
    iput-boolean v12, v1, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    .line 84
    .line 85
    iput v12, v1, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 86
    .line 87
    iput v12, v1, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 88
    .line 89
    new-instance v0, Lky0;

    .line 90
    .line 91
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 95
    .line 96
    new-instance v0, Luv;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 99
    .line 100
    .line 101
    const/4 v13, 0x0

    .line 102
    iput-object v13, v0, Lly0;->a:Lgy0;

    .line 103
    .line 104
    new-instance v2, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v2, v0, Lly0;->b:Ljava/util/ArrayList;

    .line 110
    .line 111
    const-wide/16 v2, 0x78

    .line 112
    .line 113
    iput-wide v2, v0, Lly0;->c:J

    .line 114
    .line 115
    iput-wide v2, v0, Lly0;->d:J

    .line 116
    .line 117
    const-wide/16 v2, 0xfa

    .line 118
    .line 119
    iput-wide v2, v0, Lly0;->e:J

    .line 120
    .line 121
    iput-wide v2, v0, Lly0;->f:J

    .line 122
    .line 123
    const/4 v14, 0x1

    .line 124
    iput-boolean v14, v0, Luv;->g:Z

    .line 125
    .line 126
    new-instance v2, Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v2, v0, Luv;->h:Ljava/util/ArrayList;

    .line 132
    .line 133
    new-instance v2, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object v2, v0, Luv;->i:Ljava/util/ArrayList;

    .line 139
    .line 140
    new-instance v2, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object v2, v0, Luv;->j:Ljava/util/ArrayList;

    .line 146
    .line 147
    new-instance v2, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v2, v0, Luv;->k:Ljava/util/ArrayList;

    .line 153
    .line 154
    new-instance v2, Ljava/util/ArrayList;

    .line 155
    .line 156
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .line 158
    .line 159
    iput-object v2, v0, Luv;->l:Ljava/util/ArrayList;

    .line 160
    .line 161
    new-instance v2, Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .line 165
    .line 166
    iput-object v2, v0, Luv;->m:Ljava/util/ArrayList;

    .line 167
    .line 168
    new-instance v2, Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .line 172
    .line 173
    iput-object v2, v0, Luv;->n:Ljava/util/ArrayList;

    .line 174
    .line 175
    new-instance v2, Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 178
    .line 179
    .line 180
    iput-object v2, v0, Luv;->o:Ljava/util/ArrayList;

    .line 181
    .line 182
    new-instance v2, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    iput-object v2, v0, Luv;->p:Ljava/util/ArrayList;

    .line 188
    .line 189
    new-instance v2, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v2, v0, Luv;->q:Ljava/util/ArrayList;

    .line 195
    .line 196
    new-instance v2, Ljava/util/ArrayList;

    .line 197
    .line 198
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 199
    .line 200
    .line 201
    iput-object v2, v0, Luv;->r:Ljava/util/ArrayList;

    .line 202
    .line 203
    iput-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 204
    .line 205
    iput v12, v1, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 206
    .line 207
    const/4 v0, -0x1

    .line 208
    iput v0, v1, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 209
    .line 210
    const/4 v2, 0x1

    .line 211
    iput v2, v1, Landroidx/recyclerview/widget/RecyclerView;->g0:F

    .line 212
    .line 213
    iput v2, v1, Landroidx/recyclerview/widget/RecyclerView;->h0:F

    .line 214
    .line 215
    iput-boolean v14, v1, Landroidx/recyclerview/widget/RecyclerView;->i0:Z

    .line 216
    .line 217
    new-instance v2, Lbz0;

    .line 218
    .line 219
    invoke-direct {v2, v1}, Lbz0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 220
    .line 221
    .line 222
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 223
    .line 224
    new-instance v2, Lwk;

    .line 225
    .line 226
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 227
    .line 228
    .line 229
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->l0:Lwk;

    .line 230
    .line 231
    new-instance v2, Lzy0;

    .line 232
    .line 233
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 234
    .line 235
    .line 236
    iput v12, v2, Lzy0;->a:I

    .line 237
    .line 238
    iput v12, v2, Lzy0;->b:I

    .line 239
    .line 240
    iput v14, v2, Lzy0;->c:I

    .line 241
    .line 242
    iput v12, v2, Lzy0;->d:I

    .line 243
    .line 244
    iput-boolean v12, v2, Lzy0;->e:Z

    .line 245
    .line 246
    iput-boolean v12, v2, Lzy0;->f:Z

    .line 247
    .line 248
    iput-boolean v12, v2, Lzy0;->g:Z

    .line 249
    .line 250
    iput-boolean v12, v2, Lzy0;->h:Z

    .line 251
    .line 252
    iput-boolean v12, v2, Lzy0;->i:Z

    .line 253
    .line 254
    iput-boolean v12, v2, Lzy0;->j:Z

    .line 255
    .line 256
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 257
    .line 258
    iput-boolean v12, v1, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 259
    .line 260
    iput-boolean v12, v1, Landroidx/recyclerview/widget/RecyclerView;->q0:Z

    .line 261
    .line 262
    new-instance v2, Lgy0;

    .line 263
    .line 264
    invoke-direct {v2, v1}, Lgy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 265
    .line 266
    .line 267
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->r0:Lgy0;

    .line 268
    .line 269
    iput-boolean v12, v1, Landroidx/recyclerview/widget/RecyclerView;->s0:Z

    .line 270
    .line 271
    const/4 v15, 0x2

    .line 272
    new-array v3, v15, [I

    .line 273
    .line 274
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->u0:[I

    .line 275
    .line 276
    new-array v3, v15, [I

    .line 277
    .line 278
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->w0:[I

    .line 279
    .line 280
    new-array v3, v15, [I

    .line 281
    .line 282
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->x0:[I

    .line 283
    .line 284
    new-array v3, v15, [I

    .line 285
    .line 286
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 287
    .line 288
    new-instance v3, Ljava/util/ArrayList;

    .line 289
    .line 290
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .line 292
    .line 293
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 294
    .line 295
    new-instance v3, Ldy0;

    .line 296
    .line 297
    invoke-direct {v3, v1}, Ldy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 298
    .line 299
    .line 300
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->A0:Ldy0;

    .line 301
    .line 302
    new-instance v3, Lfy0;

    .line 303
    .line 304
    invoke-direct {v3, v1}, Lfy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 305
    .line 306
    .line 307
    iput-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->B0:Lfy0;

    .line 308
    .line 309
    invoke-virtual {v1, v14}, Landroid/view/View;->setScrollContainer(Z)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1, v14}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 313
    .line 314
    .line 315
    invoke-static {v9}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 320
    .line 321
    .line 322
    move-result v4

    .line 323
    iput v4, v1, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 324
    .line 325
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 326
    .line 327
    const/16 v5, 0x1a

    .line 328
    .line 329
    if-lt v4, v5, :cond_0

    .line 330
    .line 331
    sget-object v6, Ldi1;->a:Ljava/lang/reflect/Method;

    .line 332
    .line 333
    invoke-static {v3}, Lai1;->a(Landroid/view/ViewConfiguration;)F

    .line 334
    .line 335
    .line 336
    move-result v6

    .line 337
    goto :goto_0

    .line 338
    :cond_0
    invoke-static {v3, v9}, Ldi1;->a(Landroid/view/ViewConfiguration;Landroid/content/Context;)F

    .line 339
    .line 340
    .line 341
    move-result v6

    .line 342
    :goto_0
    iput v6, v1, Landroidx/recyclerview/widget/RecyclerView;->g0:F

    .line 343
    .line 344
    if-lt v4, v5, :cond_1

    .line 345
    .line 346
    invoke-static {v3}, Lai1;->b(Landroid/view/ViewConfiguration;)F

    .line 347
    .line 348
    .line 349
    move-result v6

    .line 350
    goto :goto_1

    .line 351
    :cond_1
    invoke-static {v3, v9}, Ldi1;->a(Landroid/view/ViewConfiguration;Landroid/content/Context;)F

    .line 352
    .line 353
    .line 354
    move-result v6

    .line 355
    :goto_1
    iput v6, v1, Landroidx/recyclerview/widget/RecyclerView;->h0:F

    .line 356
    .line 357
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    iput v6, v1, Landroidx/recyclerview/widget/RecyclerView;->e0:I

    .line 362
    .line 363
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    iput v3, v1, Landroidx/recyclerview/widget/RecyclerView;->f0:I

    .line 368
    .line 369
    invoke-virtual {v1}, Landroid/view/View;->getOverScrollMode()I

    .line 370
    .line 371
    .line 372
    move-result v3

    .line 373
    if-ne v3, v15, :cond_2

    .line 374
    .line 375
    move v3, v14

    .line 376
    goto :goto_2

    .line 377
    :cond_2
    move v3, v12

    .line 378
    :goto_2
    invoke-virtual {v1, v3}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 379
    .line 380
    .line 381
    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 382
    .line 383
    iput-object v2, v3, Lly0;->a:Lgy0;

    .line 384
    .line 385
    new-instance v2, Ls3;

    .line 386
    .line 387
    new-instance v3, Lfy0;

    .line 388
    .line 389
    invoke-direct {v3, v1}, Lfy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 390
    .line 391
    .line 392
    invoke-direct {v2, v3}, Ls3;-><init>(Lfy0;)V

    .line 393
    .line 394
    .line 395
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 396
    .line 397
    new-instance v2, Lc9;

    .line 398
    .line 399
    new-instance v3, Lgy0;

    .line 400
    .line 401
    invoke-direct {v3, v1}, Lgy0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 402
    .line 403
    .line 404
    invoke-direct {v2, v3}, Lc9;-><init>(Lgy0;)V

    .line 405
    .line 406
    .line 407
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 408
    .line 409
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 410
    .line 411
    if-lt v4, v5, :cond_3

    .line 412
    .line 413
    invoke-static {v1}, Lqh1;->c(Landroid/view/View;)I

    .line 414
    .line 415
    .line 416
    move-result v2

    .line 417
    goto :goto_3

    .line 418
    :cond_3
    move v2, v12

    .line 419
    :goto_3
    const/16 v3, 0x8

    .line 420
    .line 421
    if-nez v2, :cond_4

    .line 422
    .line 423
    if-lt v4, v5, :cond_4

    .line 424
    .line 425
    invoke-static {v1, v3}, Lqh1;->m(Landroid/view/View;I)V

    .line 426
    .line 427
    .line 428
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getImportantForAccessibility()I

    .line 429
    .line 430
    .line 431
    move-result v2

    .line 432
    if-nez v2, :cond_5

    .line 433
    .line 434
    invoke-virtual {v1, v14}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 435
    .line 436
    .line 437
    :cond_5
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    const-string v5, "accessibility"

    .line 442
    .line 443
    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    check-cast v2, Landroid/view/accessibility/AccessibilityManager;

    .line 448
    .line 449
    iput-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->I:Landroid/view/accessibility/AccessibilityManager;

    .line 450
    .line 451
    new-instance v2, Ldz0;

    .line 452
    .line 453
    invoke-direct {v2, v1}, Ldz0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Ldz0;)V

    .line 457
    .line 458
    .line 459
    sget-object v2, Lex0;->a:[I

    .line 460
    .line 461
    invoke-virtual {v9, v10, v2, v11, v12}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 462
    .line 463
    .line 464
    move-result-object v5

    .line 465
    const/16 v6, 0x1d

    .line 466
    .line 467
    if-lt v4, v6, :cond_6

    .line 468
    .line 469
    invoke-static {v1, v9, v2, v10, v5}, Le1;->m(Landroidx/recyclerview/widget/RecyclerView;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;)V

    .line 470
    .line 471
    .line 472
    :cond_6
    invoke-virtual {v5, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v16

    .line 476
    invoke-virtual {v5, v15, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 477
    .line 478
    .line 479
    move-result v2

    .line 480
    if-ne v2, v0, :cond_7

    .line 481
    .line 482
    const/high16 v0, 0x40000

    .line 483
    .line 484
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 485
    .line 486
    .line 487
    :cond_7
    invoke-virtual {v5, v14, v14}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 488
    .line 489
    .line 490
    move-result v0

    .line 491
    iput-boolean v0, v1, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 492
    .line 493
    const/4 v0, 0x3

    .line 494
    invoke-virtual {v5, v0, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 495
    .line 496
    .line 497
    move-result v2

    .line 498
    const/4 v3, 0x4

    .line 499
    if-eqz v2, :cond_9

    .line 500
    .line 501
    const/4 v2, 0x6

    .line 502
    invoke-virtual {v5, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 503
    .line 504
    .line 505
    move-result-object v2

    .line 506
    check-cast v2, Landroid/graphics/drawable/StateListDrawable;

    .line 507
    .line 508
    const/4 v4, 0x7

    .line 509
    invoke-virtual {v5, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 510
    .line 511
    .line 512
    move-result-object v4

    .line 513
    invoke-virtual {v5, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 514
    .line 515
    .line 516
    move-result-object v7

    .line 517
    check-cast v7, Landroid/graphics/drawable/StateListDrawable;

    .line 518
    .line 519
    const/4 v8, 0x5

    .line 520
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 521
    .line 522
    .line 523
    move-result-object v8

    .line 524
    if-eqz v2, :cond_8

    .line 525
    .line 526
    if-eqz v4, :cond_8

    .line 527
    .line 528
    if-eqz v7, :cond_8

    .line 529
    .line 530
    if-eqz v8, :cond_8

    .line 531
    .line 532
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 533
    .line 534
    .line 535
    move-result-object v17

    .line 536
    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    new-instance v17, Ls20;

    .line 541
    .line 542
    const v3, 0x7f070090

    .line 543
    .line 544
    .line 545
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 546
    .line 547
    .line 548
    move-result v3

    .line 549
    const v6, 0x7f070092

    .line 550
    .line 551
    .line 552
    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 553
    .line 554
    .line 555
    move-result v6

    .line 556
    move/from16 v19, v15

    .line 557
    .line 558
    const v15, 0x7f070091

    .line 559
    .line 560
    .line 561
    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    move v15, v6

    .line 566
    move v6, v3

    .line 567
    move-object v3, v4

    .line 568
    move-object v4, v7

    .line 569
    move v7, v15

    .line 570
    move-object v15, v5

    .line 571
    move-object v5, v8

    .line 572
    const/16 v18, 0x3

    .line 573
    .line 574
    move v8, v0

    .line 575
    move-object/from16 v0, v17

    .line 576
    .line 577
    move/from16 v17, v11

    .line 578
    .line 579
    const/4 v11, 0x4

    .line 580
    invoke-direct/range {v0 .. v8}, Ls20;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;III)V

    .line 581
    .line 582
    .line 583
    goto :goto_4

    .line 584
    :cond_8
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    const-string v1, "Trying to set fast scroller without both required drawables."

    .line 589
    .line 590
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 595
    .line 596
    .line 597
    throw v13

    .line 598
    :cond_9
    move/from16 v18, v0

    .line 599
    .line 600
    move/from16 v17, v11

    .line 601
    .line 602
    move/from16 v19, v15

    .line 603
    .line 604
    move v11, v3

    .line 605
    move-object v15, v5

    .line 606
    :goto_4
    invoke-virtual {v15}, Landroid/content/res/TypedArray;->recycle()V

    .line 607
    .line 608
    .line 609
    const-string v2, ": Could not instantiate the LayoutManager: "

    .line 610
    .line 611
    if-eqz v16, :cond_d

    .line 612
    .line 613
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 614
    .line 615
    .line 616
    move-result-object v0

    .line 617
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    if-nez v3, :cond_d

    .line 622
    .line 623
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    .line 624
    .line 625
    .line 626
    move-result v3

    .line 627
    const/16 v4, 0x2e

    .line 628
    .line 629
    if-ne v3, v4, :cond_a

    .line 630
    .line 631
    new-instance v3, Ljava/lang/StringBuilder;

    .line 632
    .line 633
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 634
    .line 635
    .line 636
    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    .line 645
    .line 646
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    :goto_5
    move-object v3, v0

    .line 651
    goto :goto_6

    .line 652
    :cond_a
    const-string v3, "."

    .line 653
    .line 654
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 655
    .line 656
    .line 657
    move-result v3

    .line 658
    if-eqz v3, :cond_b

    .line 659
    .line 660
    goto :goto_5

    .line 661
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    .line 662
    .line 663
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 664
    .line 665
    .line 666
    const-class v5, Landroidx/recyclerview/widget/RecyclerView;

    .line 667
    .line 668
    invoke-virtual {v5}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    .line 669
    .line 670
    .line 671
    move-result-object v5

    .line 672
    invoke-virtual {v5}, Ljava/lang/Package;->getName()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v5

    .line 676
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 677
    .line 678
    .line 679
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 680
    .line 681
    .line 682
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 683
    .line 684
    .line 685
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 686
    .line 687
    .line 688
    move-result-object v0

    .line 689
    goto :goto_5

    .line 690
    :goto_6
    :try_start_0
    invoke-virtual {v1}, Landroid/view/View;->isInEditMode()Z

    .line 691
    .line 692
    .line 693
    move-result v0

    .line 694
    if-eqz v0, :cond_c

    .line 695
    .line 696
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 697
    .line 698
    .line 699
    move-result-object v0

    .line 700
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 701
    .line 702
    .line 703
    move-result-object v0

    .line 704
    goto :goto_7

    .line 705
    :catch_0
    move-exception v0

    .line 706
    goto :goto_9

    .line 707
    :catch_1
    move-exception v0

    .line 708
    goto :goto_a

    .line 709
    :catch_2
    move-exception v0

    .line 710
    goto/16 :goto_b

    .line 711
    .line 712
    :catch_3
    move-exception v0

    .line 713
    goto/16 :goto_c

    .line 714
    .line 715
    :catch_4
    move-exception v0

    .line 716
    goto/16 :goto_d

    .line 717
    .line 718
    :cond_c
    invoke-virtual {v9}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 719
    .line 720
    .line 721
    move-result-object v0

    .line 722
    :goto_7
    invoke-static {v3, v12, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 723
    .line 724
    .line 725
    move-result-object v0

    .line 726
    const-class v4, Lpy0;

    .line 727
    .line 728
    invoke-virtual {v0, v4}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 729
    .line 730
    .line 731
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 732
    :try_start_1
    sget-object v0, Landroidx/recyclerview/widget/RecyclerView;->D0:[Ljava/lang/Class;

    .line 733
    .line 734
    invoke-virtual {v4, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    new-array v5, v11, [Ljava/lang/Object;

    .line 739
    .line 740
    aput-object v9, v5, v12

    .line 741
    .line 742
    aput-object v10, v5, v14

    .line 743
    .line 744
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 745
    .line 746
    .line 747
    move-result-object v6

    .line 748
    aput-object v6, v5, v19

    .line 749
    .line 750
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 751
    .line 752
    .line 753
    move-result-object v6

    .line 754
    aput-object v6, v5, v18
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    .line 755
    .line 756
    goto :goto_8

    .line 757
    :catch_5
    move-exception v0

    .line 758
    move-object v5, v0

    .line 759
    :try_start_2
    invoke-virtual {v4, v13}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 760
    .line 761
    .line 762
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_2} :catch_0

    .line 763
    move-object v5, v13

    .line 764
    :goto_8
    :try_start_3
    invoke-virtual {v0, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 765
    .line 766
    .line 767
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 768
    .line 769
    .line 770
    move-result-object v0

    .line 771
    check-cast v0, Lpy0;

    .line 772
    .line 773
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Lpy0;)V

    .line 774
    .line 775
    .line 776
    goto :goto_e

    .line 777
    :catch_6
    move-exception v0

    .line 778
    invoke-virtual {v0, v5}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 779
    .line 780
    .line 781
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 782
    .line 783
    new-instance v4, Ljava/lang/StringBuilder;

    .line 784
    .line 785
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 786
    .line 787
    .line 788
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 789
    .line 790
    .line 791
    move-result-object v5

    .line 792
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    .line 794
    .line 795
    const-string v5, ": Error creating LayoutManager "

    .line 796
    .line 797
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 798
    .line 799
    .line 800
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object v4

    .line 807
    invoke-direct {v1, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 808
    .line 809
    .line 810
    throw v1
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_0

    .line 811
    :goto_9
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 812
    .line 813
    .line 814
    move-result-object v1

    .line 815
    const-string v2, ": Class is not a LayoutManager "

    .line 816
    .line 817
    invoke-static {v1, v2, v3, v0}, Lo40;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 818
    .line 819
    .line 820
    throw v13

    .line 821
    :goto_a
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 822
    .line 823
    .line 824
    move-result-object v1

    .line 825
    const-string v2, ": Cannot access non-public constructor "

    .line 826
    .line 827
    invoke-static {v1, v2, v3, v0}, Lo40;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 828
    .line 829
    .line 830
    throw v13

    .line 831
    :goto_b
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 832
    .line 833
    .line 834
    move-result-object v1

    .line 835
    invoke-static {v1, v2, v3, v0}, Lo40;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 836
    .line 837
    .line 838
    throw v13

    .line 839
    :goto_c
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 840
    .line 841
    .line 842
    move-result-object v1

    .line 843
    invoke-static {v1, v2, v3, v0}, Lo40;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 844
    .line 845
    .line 846
    throw v13

    .line 847
    :goto_d
    invoke-interface {v10}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v1

    .line 851
    const-string v2, ": Unable to find LayoutManager "

    .line 852
    .line 853
    invoke-static {v1, v2, v3, v0}, Lo40;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 854
    .line 855
    .line 856
    throw v13

    .line 857
    :cond_d
    :goto_e
    sget-object v0, Landroidx/recyclerview/widget/RecyclerView;->C0:[I

    .line 858
    .line 859
    move/from16 v2, v17

    .line 860
    .line 861
    invoke-virtual {v9, v10, v0, v2, v12}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 862
    .line 863
    .line 864
    move-result-object v2

    .line 865
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 866
    .line 867
    const/16 v4, 0x1d

    .line 868
    .line 869
    if-lt v3, v4, :cond_e

    .line 870
    .line 871
    invoke-static {v1, v9, v0, v10, v2}, Le1;->m(Landroidx/recyclerview/widget/RecyclerView;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;)V

    .line 872
    .line 873
    .line 874
    :cond_e
    invoke-virtual {v2, v12, v14}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 875
    .line 876
    .line 877
    move-result v0

    .line 878
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 879
    .line 880
    .line 881
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 882
    .line 883
    .line 884
    return-void
.end method

.method public static B(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 4

    .line 1
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    check-cast p0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v0, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3}, Landroidx/recyclerview/widget/RecyclerView;->B(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    return-object v3

    .line 34
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    return-object v1
.end method

.method public static G(Landroid/view/View;)Lmu0;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lqy0;

    .line 10
    .line 11
    iget-object p0, p0, Lqy0;->a:Lmu0;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/ViewGroup;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->detachViewFromParent(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroidx/recyclerview/widget/RecyclerView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->awakenScrollBars()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getScrollingChildHelper()Lgp0;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v0:Lgp0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lgp0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lgp0;-><init>(Landroid/view/ViewGroup;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v0:Lgp0;

    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public static h(Lmu0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lmu0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    :goto_0
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v2, p0, Lmu0;->a:Landroid/view/View;

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v2, v0, Landroid/view/View;

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    check-cast v0, Landroid/view/View;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    iput-object v1, p0, Lmu0;->b:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public final A([I)V
    .locals 8

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 2
    .line 3
    invoke-virtual {p0}, Lc9;->r()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    aput p0, p1, v2

    .line 13
    .line 14
    aput p0, p1, v1

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const v3, 0x7fffffff

    .line 18
    .line 19
    .line 20
    const/high16 v4, -0x80000000

    .line 21
    .line 22
    move v5, v2

    .line 23
    :goto_0
    if-ge v5, v0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0, v5}, Lc9;->q(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-static {v6}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v6}, Lmu0;->p()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-eqz v7, :cond_1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-virtual {v6}, Lmu0;->c()I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-ge v6, v3, :cond_2

    .line 45
    .line 46
    move v3, v6

    .line 47
    :cond_2
    if-le v6, v4, :cond_3

    .line 48
    .line 49
    move v4, v6

    .line 50
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_4
    aput v3, p1, v2

    .line 54
    .line 55
    aput v4, p1, v1

    .line 56
    .line 57
    return-void
.end method

.method public final C(I)Lmu0;
    .locals 6

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 8
    .line 9
    invoke-virtual {v0}, Lc9;->z()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    :goto_0
    if-ge v3, v2, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Lc9;->y(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_2

    .line 25
    .line 26
    invoke-virtual {v4}, Lmu0;->i()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-nez v5, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->D(Lmu0;)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ne v5, p1, :cond_2

    .line 37
    .line 38
    iget-object v1, v4, Lmu0;->a:Landroid/view/View;

    .line 39
    .line 40
    iget-object v5, v0, Lc9;->m:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v5, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    move-object v1, v4

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    return-object v4

    .line 53
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    return-object v1
.end method

.method public final D(Lmu0;)I
    .locals 6

    .line 1
    iget v0, p1, Lmu0;->j:I

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0x20c

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Lmu0;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    iget p1, p1, Lmu0;->c:I

    .line 17
    .line 18
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 19
    .line 20
    iget-object p0, p0, Ls3;->c:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v2, 0x0

    .line 29
    :goto_0
    if-ge v2, v0, :cond_9

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lr3;

    .line 36
    .line 37
    iget v4, v3, Lr3;->a:I

    .line 38
    .line 39
    const/4 v5, 0x1

    .line 40
    if-eq v4, v5, :cond_7

    .line 41
    .line 42
    const/4 v5, 0x2

    .line 43
    if-eq v4, v5, :cond_5

    .line 44
    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    if-eq v4, v5, :cond_2

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    iget v4, v3, Lr3;->b:I

    .line 51
    .line 52
    if-ne v4, p1, :cond_3

    .line 53
    .line 54
    iget p1, v3, Lr3;->d:I

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    if-ge v4, p1, :cond_4

    .line 58
    .line 59
    add-int/lit8 p1, p1, -0x1

    .line 60
    .line 61
    :cond_4
    iget v3, v3, Lr3;->d:I

    .line 62
    .line 63
    if-gt v3, p1, :cond_8

    .line 64
    .line 65
    add-int/lit8 p1, p1, 0x1

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_5
    iget v4, v3, Lr3;->b:I

    .line 69
    .line 70
    if-gt v4, p1, :cond_8

    .line 71
    .line 72
    iget v3, v3, Lr3;->d:I

    .line 73
    .line 74
    add-int/2addr v4, v3

    .line 75
    if-le v4, p1, :cond_6

    .line 76
    .line 77
    :goto_1
    return v1

    .line 78
    :cond_6
    sub-int/2addr p1, v3

    .line 79
    goto :goto_2

    .line 80
    :cond_7
    iget v4, v3, Lr3;->b:I

    .line 81
    .line 82
    if-gt v4, p1, :cond_8

    .line 83
    .line 84
    iget v3, v3, Lr3;->d:I

    .line 85
    .line 86
    add-int/2addr p1, v3

    .line 87
    :cond_8
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_9
    return p1
.end method

.method public final E(Lmu0;)J
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 2
    .line 3
    iget-boolean p0, p0, Lhy0;->b:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-wide p0, p1, Lmu0;->e:J

    .line 8
    .line 9
    return-wide p0

    .line 10
    :cond_0
    iget p0, p1, Lmu0;->c:I

    .line 11
    .line 12
    int-to-long p0, p0

    .line 13
    return-wide p0
.end method

.method public final F(Landroid/view/View;)Lmu0;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "View "

    .line 11
    .line 12
    const-string v1, " is not a direct child of "

    .line 13
    .line 14
    invoke-static {v0, p1, v1, p0}, Lo40;->m(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final H(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lqy0;

    .line 6
    .line 7
    iget-boolean v1, v0, Lqy0;->c:Z

    .line 8
    .line 9
    iget-object v2, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    iget-boolean v1, v1, Lzy0;->f:Z

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    iget-object v1, v0, Lqy0;->a:Lmu0;

    .line 21
    .line 22
    invoke-virtual {v1}, Lmu0;->l()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget-object v1, v0, Lqy0;->a:Lmu0;

    .line 29
    .line 30
    invoke-virtual {v1}, Lmu0;->g()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    :cond_1
    :goto_0
    return-object v2

    .line 37
    :cond_2
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    move v5, v1

    .line 48
    :goto_1
    if-ge v5, v4, :cond_3

    .line 49
    .line 50
    iget-object v6, p0, Landroidx/recyclerview/widget/RecyclerView;->r:Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-virtual {v6, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    check-cast v7, Lmy0;

    .line 60
    .line 61
    invoke-virtual {v7, v6, p1, p0}, Lmy0;->a(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 62
    .line 63
    .line 64
    iget v7, v2, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    iget v8, v6, Landroid/graphics/Rect;->left:I

    .line 67
    .line 68
    add-int/2addr v7, v8

    .line 69
    iput v7, v2, Landroid/graphics/Rect;->left:I

    .line 70
    .line 71
    iget v7, v2, Landroid/graphics/Rect;->top:I

    .line 72
    .line 73
    iget v8, v6, Landroid/graphics/Rect;->top:I

    .line 74
    .line 75
    add-int/2addr v7, v8

    .line 76
    iput v7, v2, Landroid/graphics/Rect;->top:I

    .line 77
    .line 78
    iget v7, v2, Landroid/graphics/Rect;->right:I

    .line 79
    .line 80
    iget v8, v6, Landroid/graphics/Rect;->right:I

    .line 81
    .line 82
    add-int/2addr v7, v8

    .line 83
    iput v7, v2, Landroid/graphics/Rect;->right:I

    .line 84
    .line 85
    iget v7, v2, Landroid/graphics/Rect;->bottom:I

    .line 86
    .line 87
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 88
    .line 89
    add-int/2addr v7, v6

    .line 90
    iput v7, v2, Landroid/graphics/Rect;->bottom:I

    .line 91
    .line 92
    add-int/lit8 v5, v5, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iput-boolean v1, v0, Lqy0;->c:Z

    .line 96
    .line 97
    return-object v2
.end method

.method public final I()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 10
    .line 11
    invoke-virtual {p0}, Ls3;->k()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final J()Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final K()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lc9;->z()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    const/4 v4, 0x1

    .line 10
    if-ge v3, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v3}, Lc9;->y(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    check-cast v5, Lqy0;

    .line 21
    .line 22
    iput-boolean v4, v5, Lqy0;->c:Z

    .line 23
    .line 24
    add-int/lit8 v3, v3, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 28
    .line 29
    iget-object p0, p0, Lvy0;->c:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    :goto_1
    if-ge v2, v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lmu0;

    .line 42
    .line 43
    iget-object v1, v1, Lmu0;->a:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lqy0;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iput-boolean v4, v1, Lqy0;->c:Z

    .line 54
    .line 55
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    return-void
.end method

.method public final L(ZII)V
    .locals 10

    .line 1
    add-int v0, p2, p3

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 4
    .line 5
    invoke-virtual {v1}, Lc9;->z()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    const/16 v4, 0x8

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    if-ge v3, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Lc9;->y(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    invoke-static {v6}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    if-eqz v6, :cond_1

    .line 24
    .line 25
    invoke-virtual {v6}, Lmu0;->p()Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    if-nez v7, :cond_1

    .line 30
    .line 31
    iget v7, v6, Lmu0;->c:I

    .line 32
    .line 33
    iget-object v8, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 34
    .line 35
    if-lt v7, v0, :cond_0

    .line 36
    .line 37
    neg-int v4, p3

    .line 38
    invoke-virtual {v6, v4, p1}, Lmu0;->m(IZ)V

    .line 39
    .line 40
    .line 41
    iput-boolean v5, v8, Lzy0;->e:Z

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    if-lt v7, p2, :cond_1

    .line 45
    .line 46
    add-int/lit8 v7, p2, -0x1

    .line 47
    .line 48
    neg-int v9, p3

    .line 49
    invoke-virtual {v6, v4}, Lmu0;->a(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v6, v9, p1}, Lmu0;->m(IZ)V

    .line 53
    .line 54
    .line 55
    iput v7, v6, Lmu0;->c:I

    .line 56
    .line 57
    iput-boolean v5, v8, Lzy0;->e:Z

    .line 58
    .line 59
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 63
    .line 64
    iget-object v2, v1, Lvy0;->c:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    sub-int/2addr v3, v5

    .line 71
    :goto_2
    if-ltz v3, :cond_5

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Lmu0;

    .line 78
    .line 79
    if-eqz v5, :cond_4

    .line 80
    .line 81
    iget v6, v5, Lmu0;->c:I

    .line 82
    .line 83
    if-lt v6, v0, :cond_3

    .line 84
    .line 85
    neg-int v6, p3

    .line 86
    invoke-virtual {v5, v6, p1}, Lmu0;->m(IZ)V

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_3
    if-lt v6, p2, :cond_4

    .line 91
    .line 92
    invoke-virtual {v5, v4}, Lmu0;->a(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v3}, Lvy0;->e(I)V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_3
    add-int/lit8 v3, v3, -0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 6
    .line 7
    return-void
.end method

.method public final N(Z)V
    .locals 6

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sub-int/2addr v0, v1

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 11
    .line 12
    if-eqz p1, :cond_4

    .line 13
    .line 14
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->G:I

    .line 15
    .line 16
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->G:I

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->I:Landroid/view/accessibility/AccessibilityManager;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v2, 0x800

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    sub-int/2addr v0, v1

    .line 52
    :goto_0
    if-ltz v0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lmu0;

    .line 59
    .line 60
    iget-object v2, v1, Lmu0;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    if-ne v2, p0, :cond_2

    .line 67
    .line 68
    invoke-virtual {v1}, Lmu0;->p()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    iget v2, v1, Lmu0;->q:I

    .line 76
    .line 77
    const/4 v3, -0x1

    .line 78
    if-eq v2, v3, :cond_2

    .line 79
    .line 80
    iget-object v4, v1, Lmu0;->a:Landroid/view/View;

    .line 81
    .line 82
    sget-object v5, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 83
    .line 84
    invoke-virtual {v4, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 85
    .line 86
    .line 87
    iput v3, v1, Lmu0;->q:I

    .line 88
    .line 89
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void
.end method

.method public final O(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 10
    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/high16 v2, 0x3f000000    # 0.5f

    .line 29
    .line 30
    add-float/2addr v1, v2

    .line 31
    float-to-int v1, v1

    .line 32
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 33
    .line 34
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    add-float/2addr p1, v2

    .line 41
    float-to-int p1, p1

    .line 42
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 43
    .line 44
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final P()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->s0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->A0:Ldy0;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->s0:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final Q()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v1, Ls3;->c:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v1, Ls3;->d:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    iput v2, v1, Ls3;->a:I

    .line 23
    .line 24
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 29
    .line 30
    invoke-virtual {v0}, Lpy0;->S()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 39
    .line 40
    invoke-virtual {v0}, Lpy0;->r0()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    move v0, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v0, v2

    .line 49
    :goto_0
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Ls3;->q()V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {v1}, Ls3;->d()V

    .line 56
    .line 57
    .line 58
    :goto_1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 59
    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->q0:Z

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move v0, v2

    .line 68
    goto :goto_3

    .line 69
    :cond_4
    :goto_2
    move v0, v3

    .line 70
    :goto_3
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 71
    .line 72
    if-eqz v1, :cond_7

    .line 73
    .line 74
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 75
    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 79
    .line 80
    if-nez v1, :cond_5

    .line 81
    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 85
    .line 86
    iget-boolean v4, v4, Lpy0;->e:Z

    .line 87
    .line 88
    if-eqz v4, :cond_7

    .line 89
    .line 90
    :cond_5
    if-eqz v1, :cond_6

    .line 91
    .line 92
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 93
    .line 94
    iget-boolean v1, v1, Lhy0;->b:Z

    .line 95
    .line 96
    if-eqz v1, :cond_7

    .line 97
    .line 98
    :cond_6
    move v1, v3

    .line 99
    goto :goto_4

    .line 100
    :cond_7
    move v1, v2

    .line 101
    :goto_4
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 102
    .line 103
    iput-boolean v1, v4, Lzy0;->i:Z

    .line 104
    .line 105
    if-eqz v1, :cond_8

    .line 106
    .line 107
    if-eqz v0, :cond_8

    .line 108
    .line 109
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 110
    .line 111
    if-nez v0, :cond_8

    .line 112
    .line 113
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 114
    .line 115
    if-eqz v0, :cond_8

    .line 116
    .line 117
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 118
    .line 119
    invoke-virtual {p0}, Lpy0;->r0()Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_8

    .line 124
    .line 125
    move v2, v3

    .line 126
    :cond_8
    iput-boolean v2, v4, Lzy0;->j:Z

    .line 127
    .line 128
    return-void
.end method

.method public final R(Z)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 8
    .line 9
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 10
    .line 11
    invoke-virtual {p1}, Lc9;->z()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    const/4 v3, 0x6

    .line 18
    if-ge v2, v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Lc9;->y(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v4}, Lmu0;->p()Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-nez v5, :cond_0

    .line 35
    .line 36
    invoke-virtual {v4, v3}, Lmu0;->a(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->K()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 46
    .line 47
    iget-object p1, p0, Lvy0;->c:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_1
    if-ge v1, v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lmu0;

    .line 60
    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Lmu0;->a(I)V

    .line 64
    .line 65
    .line 66
    const/16 v4, 0x400

    .line 67
    .line 68
    invoke-virtual {v2, v4}, Lmu0;->a(I)V

    .line 69
    .line 70
    .line 71
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    iget-object p1, p0, Lvy0;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 75
    .line 76
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 77
    .line 78
    if-eqz p1, :cond_5

    .line 79
    .line 80
    iget-boolean p1, p1, Lhy0;->b:Z

    .line 81
    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    return-void

    .line 86
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lvy0;->d()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final S(Lmu0;Ltw0;)V
    .locals 4

    .line 1
    iget v0, p1, Lmu0;->j:I

    .line 2
    .line 3
    and-int/lit16 v0, v0, -0x2001

    .line 4
    .line 5
    iput v0, p1, Lmu0;->j:I

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 8
    .line 9
    iget-boolean v0, v0, Lzy0;->g:Z

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->o:Lxn0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lmu0;->l()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lmu0;->i()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Lmu0;->p()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->E(Lmu0;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    iget-object p0, v1, Lxn0;->l:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Luk0;

    .line 40
    .line 41
    invoke-virtual {p0, v2, v3, p1}, Luk0;->d(JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p0, v1, Lxn0;->k:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p0, Lu71;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-virtual {p0, p1, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lei1;

    .line 54
    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    invoke-static {}, Lei1;->a()Lei1;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, p1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    :cond_1
    iput-object p2, v0, Lei1;->b:Ltw0;

    .line 65
    .line 66
    iget p0, v0, Lei1;->a:I

    .line 67
    .line 68
    or-int/lit8 p0, p0, 0x4

    .line 69
    .line 70
    iput p0, v0, Lei1;->a:I

    .line 71
    .line 72
    return-void
.end method

.method public final T(Landroid/view/View;Landroid/view/View;)V
    .locals 11

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    move-object v0, p2

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    move-object v0, p1

    .line 6
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->r:Landroid/graphics/Rect;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-virtual {v3, v4, v4, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v1, v0, Lqy0;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    check-cast v0, Lqy0;

    .line 29
    .line 30
    iget-boolean v1, v0, Lqy0;->c:Z

    .line 31
    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    iget-object v0, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 35
    .line 36
    iget v1, v3, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    sub-int/2addr v1, v2

    .line 41
    iput v1, v3, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    iget v1, v3, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 46
    .line 47
    add-int/2addr v1, v2

    .line 48
    iput v1, v3, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    iget v1, v3, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 53
    .line 54
    sub-int/2addr v1, v2

    .line 55
    iput v1, v3, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    iget v1, v3, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    add-int/2addr v1, v0

    .line 62
    iput v1, v3, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    :cond_1
    if-eqz p2, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, p2, v3}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1, v3}, Landroid/view/ViewGroup;->offsetRectIntoDescendantCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 73
    .line 74
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    xor-int/lit8 v9, v0, 0x1

    .line 78
    .line 79
    if-nez p2, :cond_3

    .line 80
    .line 81
    move v10, v1

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move v10, v4

    .line 84
    :goto_1
    iget-object v8, p0, Landroidx/recyclerview/widget/RecyclerView;->r:Landroid/graphics/Rect;

    .line 85
    .line 86
    move-object v6, p0

    .line 87
    move-object v7, p1

    .line 88
    invoke-virtual/range {v5 .. v10}, Lpy0;->f0(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final U()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->a0(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :cond_1
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    or-int/2addr v0, v1

    .line 39
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 40
    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    or-int/2addr v0, v1

    .line 53
    :cond_3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 54
    .line 55
    if-eqz v1, :cond_4

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    or-int/2addr v0, v1

    .line 67
    :cond_4
    if-eqz v0, :cond_5

    .line 68
    .line 69
    sget-object v0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 72
    .line 73
    .line 74
    :cond_5
    return-void
.end method

.method public final V(IILandroid/view/MotionEvent;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v8, p1

    .line 4
    .line 5
    move/from16 v9, p2

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->k()V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 11
    .line 12
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 13
    .line 14
    const/4 v10, 0x1

    .line 15
    const/4 v11, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    aput v11, v7, v11

    .line 19
    .line 20
    aput v11, v7, v10

    .line 21
    .line 22
    invoke-virtual {v0, v8, v9, v7}, Landroidx/recyclerview/widget/RecyclerView;->W(II[I)V

    .line 23
    .line 24
    .line 25
    aget v1, v7, v11

    .line 26
    .line 27
    aget v2, v7, v10

    .line 28
    .line 29
    sub-int v3, v8, v1

    .line 30
    .line 31
    sub-int v4, v9, v2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v1, v11

    .line 35
    move v2, v1

    .line 36
    move v3, v2

    .line 37
    move v4, v3

    .line 38
    :goto_0
    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-nez v5, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    :cond_1
    aput v11, v7, v11

    .line 50
    .line 51
    aput v11, v7, v10

    .line 52
    .line 53
    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView;->w0:[I

    .line 54
    .line 55
    const/4 v6, 0x0

    .line 56
    invoke-virtual/range {v0 .. v7}, Landroidx/recyclerview/widget/RecyclerView;->q(IIII[II[I)V

    .line 57
    .line 58
    .line 59
    aget v5, v7, v11

    .line 60
    .line 61
    sub-int/2addr v3, v5

    .line 62
    aget v6, v7, v10

    .line 63
    .line 64
    sub-int/2addr v4, v6

    .line 65
    if-nez v5, :cond_3

    .line 66
    .line 67
    if-eqz v6, :cond_2

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v5, v11

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    :goto_1
    move v5, v10

    .line 73
    :goto_2
    iget v6, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 74
    .line 75
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->w0:[I

    .line 76
    .line 77
    aget v12, v7, v11

    .line 78
    .line 79
    sub-int/2addr v6, v12

    .line 80
    iput v6, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 81
    .line 82
    iget v6, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 83
    .line 84
    aget v7, v7, v10

    .line 85
    .line 86
    sub-int/2addr v6, v7

    .line 87
    iput v6, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 88
    .line 89
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView;->x0:[I

    .line 90
    .line 91
    aget v13, v6, v11

    .line 92
    .line 93
    add-int/2addr v13, v12

    .line 94
    aput v13, v6, v11

    .line 95
    .line 96
    aget v12, v6, v10

    .line 97
    .line 98
    add-int/2addr v12, v7

    .line 99
    aput v12, v6, v10

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getOverScrollMode()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    const/4 v7, 0x2

    .line 106
    if-eq v6, v7, :cond_c

    .line 107
    .line 108
    if-eqz p3, :cond_4

    .line 109
    .line 110
    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getSource()I

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    const/16 v7, 0x2002

    .line 115
    .line 116
    and-int/2addr v6, v7

    .line 117
    if-ne v6, v7, :cond_5

    .line 118
    .line 119
    :cond_4
    move/from16 v16, v10

    .line 120
    .line 121
    goto/16 :goto_7

    .line 122
    .line 123
    :cond_5
    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getX()F

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    int-to-float v3, v3

    .line 128
    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getY()F

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    int-to-float v4, v4

    .line 133
    const/4 v12, 0x0

    .line 134
    cmpg-float v13, v3, v12

    .line 135
    .line 136
    const/high16 v14, 0x3f800000    # 1.0f

    .line 137
    .line 138
    if-gez v13, :cond_6

    .line 139
    .line 140
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->t()V

    .line 141
    .line 142
    .line 143
    iget-object v13, v0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 144
    .line 145
    neg-float v15, v3

    .line 146
    move/from16 v16, v10

    .line 147
    .line 148
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    int-to-float v10, v10

    .line 153
    div-float/2addr v15, v10

    .line 154
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 155
    .line 156
    .line 157
    move-result v10

    .line 158
    int-to-float v10, v10

    .line 159
    div-float/2addr v7, v10

    .line 160
    sub-float v7, v14, v7

    .line 161
    .line 162
    invoke-static {v13, v15, v7}, Lkz;->a(Landroid/widget/EdgeEffect;FF)V

    .line 163
    .line 164
    .line 165
    :goto_3
    move/from16 v7, v16

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_6
    move/from16 v16, v10

    .line 169
    .line 170
    cmpl-float v10, v3, v12

    .line 171
    .line 172
    if-lez v10, :cond_7

    .line 173
    .line 174
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->u()V

    .line 175
    .line 176
    .line 177
    iget-object v10, v0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 178
    .line 179
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 180
    .line 181
    .line 182
    move-result v13

    .line 183
    int-to-float v13, v13

    .line 184
    div-float v13, v3, v13

    .line 185
    .line 186
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 187
    .line 188
    .line 189
    move-result v15

    .line 190
    int-to-float v15, v15

    .line 191
    div-float/2addr v7, v15

    .line 192
    invoke-static {v10, v13, v7}, Lkz;->a(Landroid/widget/EdgeEffect;FF)V

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_7
    move v7, v11

    .line 197
    :goto_4
    cmpg-float v10, v4, v12

    .line 198
    .line 199
    if-gez v10, :cond_8

    .line 200
    .line 201
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->v()V

    .line 202
    .line 203
    .line 204
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 205
    .line 206
    neg-float v10, v4

    .line 207
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 208
    .line 209
    .line 210
    move-result v13

    .line 211
    int-to-float v13, v13

    .line 212
    div-float/2addr v10, v13

    .line 213
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 214
    .line 215
    .line 216
    move-result v13

    .line 217
    int-to-float v13, v13

    .line 218
    div-float/2addr v6, v13

    .line 219
    invoke-static {v7, v10, v6}, Lkz;->a(Landroid/widget/EdgeEffect;FF)V

    .line 220
    .line 221
    .line 222
    :goto_5
    move/from16 v7, v16

    .line 223
    .line 224
    goto :goto_6

    .line 225
    :cond_8
    cmpl-float v10, v4, v12

    .line 226
    .line 227
    if-lez v10, :cond_9

    .line 228
    .line 229
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->s()V

    .line 230
    .line 231
    .line 232
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 233
    .line 234
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 235
    .line 236
    .line 237
    move-result v10

    .line 238
    int-to-float v10, v10

    .line 239
    div-float v10, v4, v10

    .line 240
    .line 241
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 242
    .line 243
    .line 244
    move-result v13

    .line 245
    int-to-float v13, v13

    .line 246
    div-float/2addr v6, v13

    .line 247
    sub-float/2addr v14, v6

    .line 248
    invoke-static {v7, v10, v14}, Lkz;->a(Landroid/widget/EdgeEffect;FF)V

    .line 249
    .line 250
    .line 251
    goto :goto_5

    .line 252
    :cond_9
    :goto_6
    if-nez v7, :cond_a

    .line 253
    .line 254
    cmpl-float v3, v3, v12

    .line 255
    .line 256
    if-nez v3, :cond_a

    .line 257
    .line 258
    cmpl-float v3, v4, v12

    .line 259
    .line 260
    if-eqz v3, :cond_b

    .line 261
    .line 262
    :cond_a
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 263
    .line 264
    invoke-virtual {v0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 265
    .line 266
    .line 267
    :cond_b
    :goto_7
    invoke-virtual/range {p0 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->j(II)V

    .line 268
    .line 269
    .line 270
    goto :goto_8

    .line 271
    :cond_c
    move/from16 v16, v10

    .line 272
    .line 273
    :goto_8
    if-nez v1, :cond_d

    .line 274
    .line 275
    if-eqz v2, :cond_e

    .line 276
    .line 277
    :cond_d
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->r(II)V

    .line 278
    .line 279
    .line 280
    :cond_e
    invoke-virtual {v0}, Landroid/view/View;->awakenScrollBars()Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-nez v3, :cond_f

    .line 285
    .line 286
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 287
    .line 288
    .line 289
    :cond_f
    if-nez v5, :cond_11

    .line 290
    .line 291
    if-nez v1, :cond_11

    .line 292
    .line 293
    if-eqz v2, :cond_10

    .line 294
    .line 295
    goto :goto_9

    .line 296
    :cond_10
    return v11

    .line 297
    :cond_11
    :goto_9
    return v16
.end method

.method public final W(II[I)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 5
    .line 6
    .line 7
    sget v0, Lhd1;->a:I

    .line 8
    .line 9
    const-string v0, "RV Scroll"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x(Lzy0;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 25
    .line 26
    invoke-virtual {v3, p1, v1, v0}, Lpy0;->h0(ILvy0;Lzy0;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p1, v2

    .line 32
    :goto_0
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 35
    .line 36
    invoke-virtual {v3, p2, v1, v0}, Lpy0;->i0(ILvy0;Lzy0;)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move p2, v2

    .line 42
    :goto_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 46
    .line 47
    invoke-virtual {v0}, Lc9;->r()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    move v3, v2

    .line 52
    :goto_2
    if-ge v3, v1, :cond_4

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Lc9;->q(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->F(Landroid/view/View;)Lmu0;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    if-eqz v5, :cond_3

    .line 63
    .line 64
    iget-object v5, v5, Lmu0;->i:Lmu0;

    .line 65
    .line 66
    if-eqz v5, :cond_3

    .line 67
    .line 68
    iget-object v5, v5, Lmu0;->a:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-ne v6, v7, :cond_2

    .line 83
    .line 84
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-eq v4, v7, :cond_3

    .line 89
    .line 90
    :cond_2
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    add-int/2addr v7, v6

    .line 95
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    add-int/2addr v8, v4

    .line 100
    invoke-virtual {v5, v6, v4, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 101
    .line 102
    .line 103
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    const/4 v0, 0x1

    .line 107
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 111
    .line 112
    .line 113
    if-eqz p3, :cond_5

    .line 114
    .line 115
    aput p1, p3, v2

    .line 116
    .line 117
    aput p2, p3, v0

    .line 118
    .line 119
    :cond_5
    return-void
.end method

.method public final X(ZII)V
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_1
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    move v5, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_2
    move v5, p2

    .line 21
    :goto_0
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 22
    .line 23
    invoke-virtual {p2}, Lpy0;->d()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_3

    .line 28
    .line 29
    move v6, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_3
    move v6, p3

    .line 32
    :goto_1
    if-nez v5, :cond_5

    .line 33
    .line 34
    if-eqz v6, :cond_4

    .line 35
    .line 36
    goto :goto_3

    .line 37
    :cond_4
    :goto_2
    return-void

    .line 38
    :cond_5
    :goto_3
    const/4 p2, 0x1

    .line 39
    if-eqz p1, :cond_8

    .line 40
    .line 41
    if-eqz v5, :cond_6

    .line 42
    .line 43
    move p1, p2

    .line 44
    goto :goto_4

    .line 45
    :cond_6
    move p1, v1

    .line 46
    :goto_4
    if-eqz v6, :cond_7

    .line 47
    .line 48
    or-int/lit8 p1, p1, 0x2

    .line 49
    .line 50
    :cond_7
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p3, p1, p2}, Lgp0;->f(II)Z

    .line 55
    .line 56
    .line 57
    :cond_8
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 58
    .line 59
    iget-object p1, p0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-le p3, v0, :cond_9

    .line 70
    .line 71
    move v2, p2

    .line 72
    goto :goto_5

    .line 73
    :cond_9
    move v2, v1

    .line 74
    :goto_5
    const-wide/16 v3, 0x0

    .line 75
    .line 76
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v3

    .line 80
    double-to-int v3, v3

    .line 81
    mul-int v4, v5, v5

    .line 82
    .line 83
    mul-int v7, v6, v6

    .line 84
    .line 85
    add-int/2addr v7, v4

    .line 86
    int-to-double v7, v7

    .line 87
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 88
    .line 89
    .line 90
    move-result-wide v7

    .line 91
    double-to-int v4, v7

    .line 92
    if-eqz v2, :cond_a

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    goto :goto_6

    .line 99
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    :goto_6
    div-int/lit8 v8, v7, 0x2

    .line 104
    .line 105
    int-to-float v4, v4

    .line 106
    const/high16 v9, 0x3f800000    # 1.0f

    .line 107
    .line 108
    mul-float/2addr v4, v9

    .line 109
    int-to-float v7, v7

    .line 110
    div-float/2addr v4, v7

    .line 111
    invoke-static {v9, v4}, Ljava/lang/Math;->min(FF)F

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    int-to-float v8, v8

    .line 116
    const/high16 v10, 0x3f000000    # 0.5f

    .line 117
    .line 118
    sub-float/2addr v4, v10

    .line 119
    const v10, 0x3ef1463b

    .line 120
    .line 121
    .line 122
    mul-float/2addr v4, v10

    .line 123
    float-to-double v10, v4

    .line 124
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 125
    .line 126
    .line 127
    move-result-wide v10

    .line 128
    double-to-float v4, v10

    .line 129
    mul-float/2addr v4, v8

    .line 130
    add-float/2addr v4, v8

    .line 131
    if-lez v3, :cond_b

    .line 132
    .line 133
    int-to-float p3, v3

    .line 134
    div-float/2addr v4, p3

    .line 135
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 140
    .line 141
    mul-float/2addr p3, v0

    .line 142
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    mul-int/lit8 p3, p3, 0x4

    .line 147
    .line 148
    goto :goto_8

    .line 149
    :cond_b
    if-eqz v2, :cond_c

    .line 150
    .line 151
    goto :goto_7

    .line 152
    :cond_c
    move p3, v0

    .line 153
    :goto_7
    int-to-float p3, p3

    .line 154
    div-float/2addr p3, v7

    .line 155
    add-float/2addr p3, v9

    .line 156
    const/high16 v0, 0x43960000    # 300.0f

    .line 157
    .line 158
    mul-float/2addr p3, v0

    .line 159
    float-to-int p3, p3

    .line 160
    :goto_8
    const/16 v0, 0x7d0

    .line 161
    .line 162
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 163
    .line 164
    .line 165
    move-result v7

    .line 166
    iget-object p3, p0, Lbz0;->m:Landroid/view/animation/Interpolator;

    .line 167
    .line 168
    sget-object v0, Landroidx/recyclerview/widget/RecyclerView;->E0:Ley0;

    .line 169
    .line 170
    if-eq p3, v0, :cond_d

    .line 171
    .line 172
    iput-object v0, p0, Lbz0;->m:Landroid/view/animation/Interpolator;

    .line 173
    .line 174
    new-instance p3, Landroid/widget/OverScroller;

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-direct {p3, v2, v0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 181
    .line 182
    .line 183
    iput-object p3, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 184
    .line 185
    :cond_d
    iput v1, p0, Lbz0;->k:I

    .line 186
    .line 187
    iput v1, p0, Lbz0;->j:I

    .line 188
    .line 189
    const/4 p3, 0x2

    .line 190
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 191
    .line 192
    .line 193
    iget-object v2, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 194
    .line 195
    const/4 v3, 0x0

    .line 196
    const/4 v4, 0x0

    .line 197
    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 198
    .line 199
    .line 200
    iget-boolean p1, p0, Lbz0;->n:Z

    .line 201
    .line 202
    if-eqz p1, :cond_e

    .line 203
    .line 204
    iput-boolean p2, p0, Lbz0;->o:Z

    .line 205
    .line 206
    return-void

    .line 207
    :cond_e
    iget-object p1, p0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 208
    .line 209
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 210
    .line 211
    .line 212
    sget-object p2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 213
    .line 214
    invoke-virtual {p1, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public final Y()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final Z(Z)V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 7
    .line 8
    move v0, v1

    .line 9
    :cond_0
    const/4 v2, 0x0

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-boolean v3, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 13
    .line 14
    if-nez v3, :cond_1

    .line 15
    .line 16
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 17
    .line 18
    :cond_1
    if-ne v0, v1, :cond_3

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->m()V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 46
    .line 47
    :cond_3
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 48
    .line 49
    sub-int/2addr p1, v1

    .line 50
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 51
    .line 52
    return-void
.end method

.method public final a0(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lgp0;->g(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final addFocusables(Ljava/util/ArrayList;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lqy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 6
    .line 7
    check-cast p1, Lqy0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lpy0;->e(Lqy0;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final computeHorizontalScrollExtent()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->i(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final computeHorizontalScrollOffset()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->j(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final computeHorizontalScrollRange()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->k(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final computeVerticalScrollExtent()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->l(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final computeVerticalScrollOffset()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->m(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final computeVerticalScrollRange()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lpy0;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lpy0;->n(Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final dispatchNestedFling(FFZ)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean v0, p0, Lgp0;->d:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 17
    .line 18
    :try_start_0
    invoke-static {v0, p0, p1, p2, p3}, Lki1;->a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    return p0

    .line 23
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    :cond_0
    return v1
.end method

.method public final dispatchNestedPreFling(FF)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lgp0;->a(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final dispatchNestedPreScroll(II[I[I)Z
    .locals 6

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v5, 0x0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v4, p4

    .line 10
    invoke-virtual/range {v0 .. v5}, Lgp0;->b(II[I[II)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final dispatchNestedScroll(IIII[I)Z
    .locals 8

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v6, 0x0

    .line 6
    const/4 v7, 0x0

    .line 7
    move v1, p1

    .line 8
    move v2, p2

    .line 9
    move v3, p3

    .line 10
    move v4, p4

    .line 11
    move-object v5, p5

    .line 12
    invoke-virtual/range {v0 .. v7}, Lgp0;->c(IIII[II[I)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public final dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->dispatchThawSelfOnly(Landroid/util/SparseArray;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->dispatchFreezeSelfOnly(Landroid/util/SparseArray;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ge v3, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Lmy0;

    .line 19
    .line 20
    invoke-virtual {v4, p1, p0}, Lmy0;->b(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget-boolean v4, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 42
    .line 43
    if-eqz v4, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v4, v2

    .line 51
    :goto_1
    const/high16 v5, 0x43870000    # 270.0f

    .line 52
    .line 53
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    neg-int v5, v5

    .line 61
    add-int/2addr v5, v4

    .line 62
    int-to-float v4, v5

    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 68
    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    invoke-virtual {v4, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    move v4, v3

    .line 78
    goto :goto_2

    .line 79
    :cond_2
    move v4, v2

    .line 80
    :goto_2
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_3
    move v4, v2

    .line 85
    :goto_3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 86
    .line 87
    if-eqz v1, :cond_6

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-nez v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iget-boolean v5, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 100
    .line 101
    if-eqz v5, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    int-to-float v5, v5

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    int-to-float v6, v6

    .line 113
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 114
    .line 115
    .line 116
    :cond_4
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 117
    .line 118
    if-eqz v5, :cond_5

    .line 119
    .line 120
    invoke-virtual {v5, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-eqz v5, :cond_5

    .line 125
    .line 126
    move v5, v3

    .line 127
    goto :goto_4

    .line 128
    :cond_5
    move v5, v2

    .line 129
    :goto_4
    or-int/2addr v4, v5

    .line 130
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 131
    .line 132
    .line 133
    :cond_6
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 134
    .line 135
    if-eqz v1, :cond_9

    .line 136
    .line 137
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-nez v1, :cond_9

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    iget-boolean v6, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 152
    .line 153
    if-eqz v6, :cond_7

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    goto :goto_5

    .line 160
    :cond_7
    move v6, v2

    .line 161
    :goto_5
    const/high16 v7, 0x42b40000    # 90.0f

    .line 162
    .line 163
    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->rotate(F)V

    .line 164
    .line 165
    .line 166
    neg-int v6, v6

    .line 167
    int-to-float v6, v6

    .line 168
    neg-int v5, v5

    .line 169
    int-to-float v5, v5

    .line 170
    invoke-virtual {p1, v6, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 171
    .line 172
    .line 173
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 174
    .line 175
    if-eqz v5, :cond_8

    .line 176
    .line 177
    invoke-virtual {v5, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    if-eqz v5, :cond_8

    .line 182
    .line 183
    move v5, v3

    .line 184
    goto :goto_6

    .line 185
    :cond_8
    move v5, v2

    .line 186
    :goto_6
    or-int/2addr v4, v5

    .line 187
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 188
    .line 189
    .line 190
    :cond_9
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 191
    .line 192
    if-eqz v1, :cond_c

    .line 193
    .line 194
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-nez v1, :cond_c

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    const/high16 v5, 0x43340000    # 180.0f

    .line 205
    .line 206
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 207
    .line 208
    .line 209
    iget-boolean v5, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 210
    .line 211
    if-eqz v5, :cond_a

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    neg-int v5, v5

    .line 218
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 219
    .line 220
    .line 221
    move-result v6

    .line 222
    add-int/2addr v6, v5

    .line 223
    int-to-float v5, v6

    .line 224
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 225
    .line 226
    .line 227
    move-result v6

    .line 228
    neg-int v6, v6

    .line 229
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 230
    .line 231
    .line 232
    move-result v7

    .line 233
    add-int/2addr v7, v6

    .line 234
    int-to-float v6, v7

    .line 235
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 236
    .line 237
    .line 238
    goto :goto_7

    .line 239
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    neg-int v5, v5

    .line 244
    int-to-float v5, v5

    .line 245
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 246
    .line 247
    .line 248
    move-result v6

    .line 249
    neg-int v6, v6

    .line 250
    int-to-float v6, v6

    .line 251
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 252
    .line 253
    .line 254
    :goto_7
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 255
    .line 256
    if-eqz v5, :cond_b

    .line 257
    .line 258
    invoke-virtual {v5, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    if-eqz v5, :cond_b

    .line 263
    .line 264
    move v2, v3

    .line 265
    :cond_b
    or-int/2addr v4, v2

    .line 266
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 267
    .line 268
    .line 269
    :cond_c
    if-nez v4, :cond_d

    .line 270
    .line 271
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 272
    .line 273
    if-eqz p1, :cond_d

    .line 274
    .line 275
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-lez p1, :cond_d

    .line 280
    .line 281
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 282
    .line 283
    invoke-virtual {p1}, Lly0;->f()Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-eqz p1, :cond_d

    .line 288
    .line 289
    goto :goto_8

    .line 290
    :cond_d
    move v3, v4

    .line 291
    :goto_8
    if-eqz v3, :cond_e

    .line 292
    .line 293
    sget-object p1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 294
    .line 295
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 296
    .line 297
    .line 298
    :cond_e
    return-void
.end method

.method public final drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final e(Lmu0;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne v1, p0, :cond_0

    .line 9
    .line 10
    move v1, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    :goto_0
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->F(Landroid/view/View;)Lmu0;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v3, v4}, Lvy0;->j(Lmu0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lmu0;->k()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v3, -0x1

    .line 27
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, v0, v3, p1, v2}, Lc9;->f(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-nez v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, v0, v3, v2}, Lc9;->e(Landroid/view/View;IZ)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object p1, p0, Lc9;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Lgy0;

    .line 48
    .line 49
    iget-object p1, p1, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-ltz p1, :cond_3

    .line 56
    .line 57
    iget-object v1, p0, Lc9;->l:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v1, Ldk;

    .line 60
    .line 61
    invoke-virtual {v1, p1}, Ldk;->h(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lc9;->D(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    const-string p0, "view is not a child, cannot hide "

    .line 69
    .line 70
    invoke-static {v0, p0}, Lo40;->v(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final f(Lmy0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "Cannot add item decoration during a scroll  or layout"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lpy0;->b(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->K()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final focusSearch(Landroid/view/View;I)Landroid/view/View;
    .locals 17

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
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 8
    .line 9
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    const/4 v5, 0x0

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    iget-boolean v3, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 29
    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    move v3, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v3, v5

    .line 35
    :goto_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 40
    .line 41
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 42
    .line 43
    const/16 v9, 0x11

    .line 44
    .line 45
    const/16 v10, 0x42

    .line 46
    .line 47
    const/16 v11, 0x21

    .line 48
    .line 49
    const/4 v13, 0x0

    .line 50
    const/4 v14, 0x2

    .line 51
    if-eqz v3, :cond_b

    .line 52
    .line 53
    if-eq v2, v14, :cond_1

    .line 54
    .line 55
    if-ne v2, v4, :cond_b

    .line 56
    .line 57
    :cond_1
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 58
    .line 59
    invoke-virtual {v3}, Lpy0;->d()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    if-ne v2, v14, :cond_2

    .line 66
    .line 67
    const/16 v3, 0x82

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v3, v11

    .line 71
    :goto_1
    invoke-virtual {v6, v0, v1, v3}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-nez v3, :cond_3

    .line 76
    .line 77
    move v3, v4

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    move v3, v5

    .line 80
    :goto_2
    if-nez v3, :cond_8

    .line 81
    .line 82
    iget-object v15, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 83
    .line 84
    invoke-virtual {v15}, Lpy0;->c()Z

    .line 85
    .line 86
    .line 87
    move-result v15

    .line 88
    if-eqz v15, :cond_8

    .line 89
    .line 90
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 91
    .line 92
    invoke-virtual {v3}, Lpy0;->y()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-ne v3, v4, :cond_4

    .line 97
    .line 98
    move v3, v4

    .line 99
    goto :goto_3

    .line 100
    :cond_4
    move v3, v5

    .line 101
    :goto_3
    if-ne v2, v14, :cond_5

    .line 102
    .line 103
    move v15, v4

    .line 104
    goto :goto_4

    .line 105
    :cond_5
    move v15, v5

    .line 106
    :goto_4
    xor-int/2addr v3, v15

    .line 107
    if-eqz v3, :cond_6

    .line 108
    .line 109
    move v3, v10

    .line 110
    goto :goto_5

    .line 111
    :cond_6
    move v3, v9

    .line 112
    :goto_5
    invoke-virtual {v6, v0, v1, v3}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    if-nez v3, :cond_7

    .line 117
    .line 118
    move v3, v4

    .line 119
    goto :goto_6

    .line 120
    :cond_7
    move v3, v5

    .line 121
    :cond_8
    :goto_6
    if-eqz v3, :cond_a

    .line 122
    .line 123
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->k()V

    .line 124
    .line 125
    .line 126
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    if-nez v3, :cond_9

    .line 131
    .line 132
    goto :goto_7

    .line 133
    :cond_9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 134
    .line 135
    .line 136
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 137
    .line 138
    invoke-virtual {v3, v1, v2, v8, v7}, Lpy0;->N(Landroid/view/View;ILvy0;Lzy0;)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 142
    .line 143
    .line 144
    :cond_a
    invoke-virtual {v6, v0, v1, v2}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    goto :goto_8

    .line 149
    :cond_b
    invoke-virtual {v6, v0, v1, v2}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    if-nez v6, :cond_d

    .line 154
    .line 155
    if-eqz v3, :cond_d

    .line 156
    .line 157
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->k()V

    .line 158
    .line 159
    .line 160
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    if-nez v3, :cond_c

    .line 165
    .line 166
    :goto_7
    return-object v13

    .line 167
    :cond_c
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 168
    .line 169
    .line 170
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 171
    .line 172
    invoke-virtual {v3, v1, v2, v8, v7}, Lpy0;->N(Landroid/view/View;ILvy0;Lzy0;)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 177
    .line 178
    .line 179
    goto :goto_8

    .line 180
    :cond_d
    move-object v3, v6

    .line 181
    :goto_8
    if-eqz v3, :cond_f

    .line 182
    .line 183
    invoke-virtual {v3}, Landroid/view/View;->hasFocusable()Z

    .line 184
    .line 185
    .line 186
    move-result v6

    .line 187
    if-nez v6, :cond_f

    .line 188
    .line 189
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    if-nez v4, :cond_e

    .line 194
    .line 195
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    return-object v0

    .line 200
    :cond_e
    invoke-virtual {v0, v3, v13}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    return-object v1

    .line 204
    :cond_f
    if-eqz v3, :cond_24

    .line 205
    .line 206
    if-ne v3, v0, :cond_10

    .line 207
    .line 208
    goto/16 :goto_d

    .line 209
    .line 210
    :cond_10
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    if-nez v6, :cond_11

    .line 215
    .line 216
    goto/16 :goto_d

    .line 217
    .line 218
    :cond_11
    if-nez v1, :cond_12

    .line 219
    .line 220
    goto/16 :goto_c

    .line 221
    .line 222
    :cond_12
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v6

    .line 226
    if-nez v6, :cond_13

    .line 227
    .line 228
    goto/16 :goto_c

    .line 229
    .line 230
    :cond_13
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 231
    .line 232
    .line 233
    move-result v6

    .line 234
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 235
    .line 236
    .line 237
    move-result v7

    .line 238
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView;->r:Landroid/graphics/Rect;

    .line 239
    .line 240
    invoke-virtual {v8, v5, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 244
    .line 245
    .line 246
    move-result v6

    .line 247
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    iget-object v13, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroid/graphics/Rect;

    .line 252
    .line 253
    invoke-virtual {v13, v5, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, v1, v8}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0, v3, v13}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 260
    .line 261
    .line 262
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 263
    .line 264
    invoke-virtual {v6}, Lpy0;->y()I

    .line 265
    .line 266
    .line 267
    move-result v6

    .line 268
    if-ne v6, v4, :cond_14

    .line 269
    .line 270
    const/4 v6, -0x1

    .line 271
    goto :goto_9

    .line 272
    :cond_14
    move v6, v4

    .line 273
    :goto_9
    iget v15, v8, Landroid/graphics/Rect;->left:I

    .line 274
    .line 275
    iget v5, v13, Landroid/graphics/Rect;->left:I

    .line 276
    .line 277
    if-lt v15, v5, :cond_15

    .line 278
    .line 279
    iget v7, v8, Landroid/graphics/Rect;->right:I

    .line 280
    .line 281
    if-gt v7, v5, :cond_16

    .line 282
    .line 283
    :cond_15
    iget v7, v8, Landroid/graphics/Rect;->right:I

    .line 284
    .line 285
    iget v12, v13, Landroid/graphics/Rect;->right:I

    .line 286
    .line 287
    if-ge v7, v12, :cond_16

    .line 288
    .line 289
    move v5, v4

    .line 290
    goto :goto_a

    .line 291
    :cond_16
    iget v12, v13, Landroid/graphics/Rect;->right:I

    .line 292
    .line 293
    if-gt v7, v12, :cond_17

    .line 294
    .line 295
    if-lt v15, v12, :cond_18

    .line 296
    .line 297
    :cond_17
    if-le v15, v5, :cond_18

    .line 298
    .line 299
    const/4 v5, -0x1

    .line 300
    goto :goto_a

    .line 301
    :cond_18
    const/4 v5, 0x0

    .line 302
    :goto_a
    iget v7, v8, Landroid/graphics/Rect;->top:I

    .line 303
    .line 304
    iget v12, v13, Landroid/graphics/Rect;->top:I

    .line 305
    .line 306
    if-lt v7, v12, :cond_19

    .line 307
    .line 308
    iget v15, v8, Landroid/graphics/Rect;->bottom:I

    .line 309
    .line 310
    if-gt v15, v12, :cond_1a

    .line 311
    .line 312
    :cond_19
    iget v15, v8, Landroid/graphics/Rect;->bottom:I

    .line 313
    .line 314
    iget v8, v13, Landroid/graphics/Rect;->bottom:I

    .line 315
    .line 316
    if-ge v15, v8, :cond_1a

    .line 317
    .line 318
    move/from16 v16, v4

    .line 319
    .line 320
    goto :goto_b

    .line 321
    :cond_1a
    iget v8, v13, Landroid/graphics/Rect;->bottom:I

    .line 322
    .line 323
    if-gt v15, v8, :cond_1b

    .line 324
    .line 325
    if-lt v7, v8, :cond_1c

    .line 326
    .line 327
    :cond_1b
    if-le v7, v12, :cond_1c

    .line 328
    .line 329
    const/16 v16, -0x1

    .line 330
    .line 331
    goto :goto_b

    .line 332
    :cond_1c
    const/16 v16, 0x0

    .line 333
    .line 334
    :goto_b
    if-eq v2, v4, :cond_22

    .line 335
    .line 336
    if-eq v2, v14, :cond_21

    .line 337
    .line 338
    if-eq v2, v9, :cond_20

    .line 339
    .line 340
    if-eq v2, v11, :cond_1f

    .line 341
    .line 342
    if-eq v2, v10, :cond_1e

    .line 343
    .line 344
    const/16 v4, 0x82

    .line 345
    .line 346
    if-ne v2, v4, :cond_1d

    .line 347
    .line 348
    if-lez v16, :cond_24

    .line 349
    .line 350
    goto :goto_c

    .line 351
    :cond_1d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 352
    .line 353
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    new-instance v3, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    const-string v4, "Invalid direction: "

    .line 360
    .line 361
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    throw v1

    .line 378
    :cond_1e
    if-lez v5, :cond_24

    .line 379
    .line 380
    goto :goto_c

    .line 381
    :cond_1f
    if-gez v16, :cond_24

    .line 382
    .line 383
    goto :goto_c

    .line 384
    :cond_20
    if-gez v5, :cond_24

    .line 385
    .line 386
    goto :goto_c

    .line 387
    :cond_21
    if-gtz v16, :cond_23

    .line 388
    .line 389
    if-nez v16, :cond_24

    .line 390
    .line 391
    mul-int/2addr v5, v6

    .line 392
    if-ltz v5, :cond_24

    .line 393
    .line 394
    goto :goto_c

    .line 395
    :cond_22
    if-ltz v16, :cond_23

    .line 396
    .line 397
    if-nez v16, :cond_24

    .line 398
    .line 399
    mul-int/2addr v5, v6

    .line 400
    if-gtz v5, :cond_24

    .line 401
    .line 402
    :cond_23
    :goto_c
    return-object v3

    .line 403
    :cond_24
    :goto_d
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    return-object v0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "Cannot call this method while RecyclerView is computing a layout or scrolling"

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p1}, Lz0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 28
    .line 29
    if-lez p1, :cond_2

    .line 30
    .line 31
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lpy0;->q()Lqy0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "RecyclerView has no LayoutManager"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1}, Lpy0;->r(Landroid/content/Context;Landroid/util/AttributeSet;)Lqy0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "RecyclerView has no LayoutManager"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 29
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {v0, p1}, Lpy0;->s(Landroid/view/ViewGroup$LayoutParams;)Lqy0;

    move-result-object p0

    return-object p0

    .line 31
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    move-result-object p0

    const-string p1, "RecyclerView has no LayoutManager"

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "androidx.recyclerview.widget.RecyclerView"

    .line 2
    .line 3
    return-object p0
.end method

.method public getAdapter()Lhy0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBaseline()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/view/View;->getBaseline()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final getChildDrawingOrder(II)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->getChildDrawingOrder(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getClipToPadding()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public getCompatAccessibilityDelegate()Ldz0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->t0:Ldz0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEdgeEffectFactory()Lky0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getItemAnimator()Lly0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getItemDecorationCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLayoutManager()Lpy0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxFlingVelocity()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->f0:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinFlingVelocity()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->e0:I

    .line 2
    .line 3
    return p0
.end method

.method public getNanoTime()J
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getOnFlingListener()Lry0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getPreserveFocusAfterLayout()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/recyclerview/widget/RecyclerView;->i0:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRecycledViewPool()Luy0;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lvy0;->c()Luy0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getScrollState()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 2
    .line 3
    return p0
.end method

.method public final hasNestedScrollingParent()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lgp0;->e(I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final i()V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lc9;->z()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    const/4 v4, -0x1

    .line 10
    if-ge v3, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, v3}, Lc9;->y(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-static {v5}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v5}, Lmu0;->p()Z

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    if-nez v6, :cond_0

    .line 25
    .line 26
    iput v4, v5, Lmu0;->d:I

    .line 27
    .line 28
    iput v4, v5, Lmu0;->g:I

    .line 29
    .line 30
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 34
    .line 35
    iget-object v0, p0, Lvy0;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    iget-object v1, p0, Lvy0;->c:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    move v5, v2

    .line 44
    :goto_1
    if-ge v5, v3, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    check-cast v6, Lmu0;

    .line 51
    .line 52
    iput v4, v6, Lmu0;->d:I

    .line 53
    .line 54
    iput v4, v6, Lmu0;->g:I

    .line 55
    .line 56
    add-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    move v3, v2

    .line 64
    :goto_2
    if-ge v3, v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Lmu0;

    .line 71
    .line 72
    iput v4, v5, Lmu0;->d:I

    .line 73
    .line 74
    iput v4, v5, Lmu0;->g:I

    .line 75
    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_3
    iget-object v0, p0, Lvy0;->b:Ljava/util/ArrayList;

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    :goto_3
    if-ge v2, v0, :cond_4

    .line 88
    .line 89
    iget-object v1, p0, Lvy0;->b:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lmu0;

    .line 96
    .line 97
    iput v4, v1, Lmu0;->d:I

    .line 98
    .line 99
    iput v4, v1, Lmu0;->g:I

    .line 100
    .line 101
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    return-void
.end method

.method public final isAttachedToWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isLayoutSuppressed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isNestedScrollingEnabled()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lgp0;->d:Z

    .line 6
    .line 7
    return p0
.end method

.method public final j(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    if-gez p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    or-int/2addr v0, p1

    .line 50
    :cond_1
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    if-lez p2, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    or-int/2addr v0, p1

    .line 74
    :cond_2
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    if-gez p2, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    or-int/2addr v0, p1

    .line 98
    :cond_3
    if-eqz v0, :cond_4

    .line 99
    .line 100
    sget-object p1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 103
    .line 104
    .line 105
    :cond_4
    return-void
.end method

.method public final k()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 2
    .line 3
    const-string v1, "RV FullInvalidate"

    .line 4
    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_5

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 14
    .line 15
    invoke-virtual {v0}, Ls3;->k()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    goto :goto_4

    .line 22
    :cond_1
    iget v2, v0, Ls3;->a:I

    .line 23
    .line 24
    and-int/lit8 v3, v2, 0x4

    .line 25
    .line 26
    if-eqz v3, :cond_7

    .line 27
    .line 28
    and-int/lit8 v2, v2, 0xb

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_2
    sget v1, Lhd1;->a:I

    .line 34
    .line 35
    const-string v1, "RV PartialInvalidate"

    .line 36
    .line 37
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ls3;->q()V

    .line 47
    .line 48
    .line 49
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 50
    .line 51
    if-nez v1, :cond_6

    .line 52
    .line 53
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 54
    .line 55
    invoke-virtual {v1}, Lc9;->r()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const/4 v3, 0x0

    .line 60
    :goto_0
    if-ge v3, v2, :cond_5

    .line 61
    .line 62
    invoke-virtual {v1, v3}, Lc9;->q(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-eqz v4, :cond_4

    .line 71
    .line 72
    invoke-virtual {v4}, Lmu0;->p()Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_3

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {v4}, Lmu0;->l()Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_4

    .line 84
    .line 85
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->m()V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    invoke-virtual {v0}, Ls3;->c()V

    .line 93
    .line 94
    .line 95
    :cond_6
    :goto_2
    const/4 v0, 0x1

    .line 96
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_7
    :goto_3
    invoke-virtual {v0}, Ls3;->k()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_8

    .line 111
    .line 112
    sget v0, Lhd1;->a:I

    .line 113
    .line 114
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->m()V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 121
    .line 122
    .line 123
    :cond_8
    :goto_4
    return-void

    .line 124
    :cond_9
    :goto_5
    sget v0, Lhd1;->a:I

    .line 125
    .line 126
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->m()V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final l(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v1, v0

    .line 10
    sget-object v0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p1, v1, v0}, Lpy0;->f(III)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/2addr v1, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {p2, v1, v0}, Lpy0;->f(III)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final m()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    iput-boolean v2, v1, Lzy0;->h:Z

    .line 17
    .line 18
    iget v3, v1, Lzy0;->c:I

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    if-ne v3, v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->n()V

    .line 24
    .line 25
    .line 26
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Lpy0;->j0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->o()V

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 36
    .line 37
    iget-object v5, v3, Ls3;->d:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v5, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-nez v5, :cond_3

    .line 46
    .line 47
    iget-object v3, v3, Ls3;->c:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 59
    .line 60
    iget v3, v3, Lpy0;->m:I

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-ne v3, v5, :cond_5

    .line 67
    .line 68
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 69
    .line 70
    iget v3, v3, Lpy0;->n:I

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eq v3, v5, :cond_4

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 80
    .line 81
    invoke-virtual {v3, v0}, Lpy0;->j0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_5
    :goto_1
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 86
    .line 87
    invoke-virtual {v3, v0}, Lpy0;->j0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->o()V

    .line 91
    .line 92
    .line 93
    :goto_2
    const/4 v3, 0x4

    .line 94
    invoke-virtual {v1, v3}, Lzy0;->a(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 101
    .line 102
    .line 103
    iput v4, v1, Lzy0;->c:I

    .line 104
    .line 105
    iget-boolean v5, v1, Lzy0;->i:Z

    .line 106
    .line 107
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 108
    .line 109
    const/4 v7, 0x0

    .line 110
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 111
    .line 112
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView;->o:Lxn0;

    .line 113
    .line 114
    if-eqz v5, :cond_22

    .line 115
    .line 116
    invoke-virtual {v6}, Lc9;->r()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    sub-int/2addr v5, v4

    .line 121
    :goto_3
    if-ltz v5, :cond_14

    .line 122
    .line 123
    invoke-virtual {v6, v5}, Lc9;->q(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    invoke-static {v10}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 128
    .line 129
    .line 130
    move-result-object v10

    .line 131
    invoke-virtual {v10}, Lmu0;->p()Z

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    if-eqz v11, :cond_6

    .line 136
    .line 137
    move/from16 v17, v4

    .line 138
    .line 139
    goto/16 :goto_8

    .line 140
    .line 141
    :cond_6
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/RecyclerView;->E(Lmu0;)J

    .line 142
    .line 143
    .line 144
    move-result-wide v11

    .line 145
    iget-object v13, v0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 146
    .line 147
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    new-instance v13, Ltw0;

    .line 151
    .line 152
    const/4 v14, 0x2

    .line 153
    invoke-direct {v13, v14, v2}, Ltw0;-><init>(IB)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v13, v10}, Ltw0;->a(Lmu0;)V

    .line 157
    .line 158
    .line 159
    iget-object v14, v9, Lxn0;->l:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v14, Luk0;

    .line 162
    .line 163
    iget-object v15, v9, Lxn0;->k:Ljava/lang/Object;

    .line 164
    .line 165
    check-cast v15, Lu71;

    .line 166
    .line 167
    invoke-virtual {v14, v11, v12}, Luk0;->c(J)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v14

    .line 171
    check-cast v14, Lmu0;

    .line 172
    .line 173
    if-eqz v14, :cond_12

    .line 174
    .line 175
    invoke-virtual {v14}, Lmu0;->p()Z

    .line 176
    .line 177
    .line 178
    move-result v16

    .line 179
    if-nez v16, :cond_12

    .line 180
    .line 181
    invoke-virtual {v15, v14, v7}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v16

    .line 185
    move/from16 v17, v4

    .line 186
    .line 187
    move-object/from16 v4, v16

    .line 188
    .line 189
    check-cast v4, Lei1;

    .line 190
    .line 191
    if-eqz v4, :cond_7

    .line 192
    .line 193
    iget v4, v4, Lei1;->a:I

    .line 194
    .line 195
    and-int/lit8 v4, v4, 0x1

    .line 196
    .line 197
    if-eqz v4, :cond_7

    .line 198
    .line 199
    move/from16 v4, v17

    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_7
    move v4, v2

    .line 203
    :goto_4
    invoke-virtual {v15, v10, v7}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v15

    .line 207
    check-cast v15, Lei1;

    .line 208
    .line 209
    if-eqz v15, :cond_8

    .line 210
    .line 211
    iget v15, v15, Lei1;->a:I

    .line 212
    .line 213
    and-int/lit8 v15, v15, 0x1

    .line 214
    .line 215
    if-eqz v15, :cond_8

    .line 216
    .line 217
    move/from16 v15, v17

    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_8
    move v15, v2

    .line 221
    :goto_5
    if-eqz v4, :cond_9

    .line 222
    .line 223
    if-ne v14, v10, :cond_9

    .line 224
    .line 225
    invoke-virtual {v9, v10, v13}, Lxn0;->f(Lmu0;Ltw0;)V

    .line 226
    .line 227
    .line 228
    goto/16 :goto_8

    .line 229
    .line 230
    :cond_9
    invoke-virtual {v9, v14, v3}, Lxn0;->u(Lmu0;I)Ltw0;

    .line 231
    .line 232
    .line 233
    move-result-object v7

    .line 234
    invoke-virtual {v9, v10, v13}, Lxn0;->f(Lmu0;Ltw0;)V

    .line 235
    .line 236
    .line 237
    const/16 v13, 0x8

    .line 238
    .line 239
    invoke-virtual {v9, v10, v13}, Lxn0;->u(Lmu0;I)Ltw0;

    .line 240
    .line 241
    .line 242
    move-result-object v13

    .line 243
    if-nez v7, :cond_e

    .line 244
    .line 245
    invoke-virtual {v6}, Lc9;->r()I

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    move v7, v2

    .line 250
    :goto_6
    if-ge v7, v4, :cond_d

    .line 251
    .line 252
    invoke-virtual {v6, v7}, Lc9;->q(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v13

    .line 256
    invoke-static {v13}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 257
    .line 258
    .line 259
    move-result-object v13

    .line 260
    if-ne v13, v10, :cond_a

    .line 261
    .line 262
    goto :goto_7

    .line 263
    :cond_a
    invoke-virtual {v0, v13}, Landroidx/recyclerview/widget/RecyclerView;->E(Lmu0;)J

    .line 264
    .line 265
    .line 266
    move-result-wide v18

    .line 267
    cmp-long v15, v18, v11

    .line 268
    .line 269
    if-nez v15, :cond_c

    .line 270
    .line 271
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 272
    .line 273
    const-string v2, " \n View Holder 2:"

    .line 274
    .line 275
    if-eqz v1, :cond_b

    .line 276
    .line 277
    iget-boolean v1, v1, Lhy0;->b:Z

    .line 278
    .line 279
    if-eqz v1, :cond_b

    .line 280
    .line 281
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 282
    .line 283
    new-instance v3, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    const-string v4, "Two different ViewHolders have the same stable ID. Stable IDs in your adapter MUST BE unique and SHOULD NOT change.\n ViewHolder 1:"

    .line 286
    .line 287
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    throw v1

    .line 314
    :cond_b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 315
    .line 316
    new-instance v3, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    const-string v4, "Two different ViewHolders have the same change ID. This might happen due to inconsistent Adapter update events or if the LayoutManager lays out the same View multiple times.\n ViewHolder 1:"

    .line 319
    .line 320
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    throw v1

    .line 347
    :cond_c
    :goto_7
    add-int/lit8 v7, v7, 0x1

    .line 348
    .line 349
    goto :goto_6

    .line 350
    :cond_d
    invoke-static {v14}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    invoke-static {v10}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    goto :goto_8

    .line 360
    :cond_e
    invoke-virtual {v14, v2}, Lmu0;->o(Z)V

    .line 361
    .line 362
    .line 363
    if-eqz v4, :cond_f

    .line 364
    .line 365
    invoke-virtual {v0, v14}, Landroidx/recyclerview/widget/RecyclerView;->e(Lmu0;)V

    .line 366
    .line 367
    .line 368
    :cond_f
    if-eq v14, v10, :cond_11

    .line 369
    .line 370
    if-eqz v15, :cond_10

    .line 371
    .line 372
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/RecyclerView;->e(Lmu0;)V

    .line 373
    .line 374
    .line 375
    :cond_10
    iput-object v10, v14, Lmu0;->h:Lmu0;

    .line 376
    .line 377
    invoke-virtual {v0, v14}, Landroidx/recyclerview/widget/RecyclerView;->e(Lmu0;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {v8, v14}, Lvy0;->j(Lmu0;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v10, v2}, Lmu0;->o(Z)V

    .line 384
    .line 385
    .line 386
    iput-object v14, v10, Lmu0;->i:Lmu0;

    .line 387
    .line 388
    :cond_11
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 389
    .line 390
    invoke-virtual {v4, v14, v10, v7, v13}, Lly0;->a(Lmu0;Lmu0;Ltw0;Ltw0;)Z

    .line 391
    .line 392
    .line 393
    move-result v4

    .line 394
    if-eqz v4, :cond_13

    .line 395
    .line 396
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->P()V

    .line 397
    .line 398
    .line 399
    goto :goto_8

    .line 400
    :cond_12
    move/from16 v17, v4

    .line 401
    .line 402
    invoke-virtual {v9, v10, v13}, Lxn0;->f(Lmu0;Ltw0;)V

    .line 403
    .line 404
    .line 405
    :cond_13
    :goto_8
    add-int/lit8 v5, v5, -0x1

    .line 406
    .line 407
    move/from16 v4, v17

    .line 408
    .line 409
    const/4 v7, 0x0

    .line 410
    goto/16 :goto_3

    .line 411
    .line 412
    :cond_14
    move/from16 v17, v4

    .line 413
    .line 414
    iget-object v3, v9, Lxn0;->k:Ljava/lang/Object;

    .line 415
    .line 416
    check-cast v3, Lu71;

    .line 417
    .line 418
    iget v4, v3, Lu71;->l:I

    .line 419
    .line 420
    add-int/lit8 v4, v4, -0x1

    .line 421
    .line 422
    :goto_9
    if-ltz v4, :cond_21

    .line 423
    .line 424
    invoke-virtual {v3, v4}, Lu71;->g(I)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    move-object v11, v5

    .line 429
    check-cast v11, Lmu0;

    .line 430
    .line 431
    invoke-virtual {v3, v4}, Lu71;->h(I)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    check-cast v5, Lei1;

    .line 436
    .line 437
    iget v7, v5, Lei1;->a:I

    .line 438
    .line 439
    and-int/lit8 v10, v7, 0x3

    .line 440
    .line 441
    iget-object v12, v0, Landroidx/recyclerview/widget/RecyclerView;->B0:Lfy0;

    .line 442
    .line 443
    const/4 v13, 0x3

    .line 444
    if-ne v10, v13, :cond_15

    .line 445
    .line 446
    iget-object v7, v12, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 447
    .line 448
    iget-object v10, v7, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 449
    .line 450
    iget-object v11, v11, Lmu0;->a:Landroid/view/View;

    .line 451
    .line 452
    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 453
    .line 454
    invoke-virtual {v10, v11, v7}, Lpy0;->d0(Landroid/view/View;Lvy0;)V

    .line 455
    .line 456
    .line 457
    :goto_a
    move-object/from16 v19, v3

    .line 458
    .line 459
    :goto_b
    const/4 v3, 0x0

    .line 460
    goto/16 :goto_10

    .line 461
    .line 462
    :cond_15
    and-int/lit8 v10, v7, 0x1

    .line 463
    .line 464
    if-eqz v10, :cond_17

    .line 465
    .line 466
    iget-object v7, v5, Lei1;->b:Ltw0;

    .line 467
    .line 468
    if-nez v7, :cond_16

    .line 469
    .line 470
    iget-object v7, v12, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 471
    .line 472
    iget-object v10, v7, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 473
    .line 474
    iget-object v11, v11, Lmu0;->a:Landroid/view/View;

    .line 475
    .line 476
    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 477
    .line 478
    invoke-virtual {v10, v11, v7}, Lpy0;->d0(Landroid/view/View;Lvy0;)V

    .line 479
    .line 480
    .line 481
    goto :goto_a

    .line 482
    :cond_16
    iget-object v10, v5, Lei1;->c:Ltw0;

    .line 483
    .line 484
    invoke-virtual {v12, v11, v7, v10}, Lfy0;->g(Lmu0;Ltw0;Ltw0;)V

    .line 485
    .line 486
    .line 487
    goto :goto_a

    .line 488
    :cond_17
    and-int/lit8 v10, v7, 0xe

    .line 489
    .line 490
    const/16 v13, 0xe

    .line 491
    .line 492
    if-ne v10, v13, :cond_18

    .line 493
    .line 494
    iget-object v7, v5, Lei1;->b:Ltw0;

    .line 495
    .line 496
    iget-object v10, v5, Lei1;->c:Ltw0;

    .line 497
    .line 498
    invoke-virtual {v12, v11, v7, v10}, Lfy0;->f(Lmu0;Ltw0;Ltw0;)V

    .line 499
    .line 500
    .line 501
    goto :goto_a

    .line 502
    :cond_18
    and-int/lit8 v10, v7, 0xc

    .line 503
    .line 504
    const/16 v13, 0xc

    .line 505
    .line 506
    if-ne v10, v13, :cond_1e

    .line 507
    .line 508
    iget-object v7, v5, Lei1;->b:Ltw0;

    .line 509
    .line 510
    iget-object v10, v5, Lei1;->c:Ltw0;

    .line 511
    .line 512
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v11, v2}, Lmu0;->o(Z)V

    .line 516
    .line 517
    .line 518
    iget-object v12, v12, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 519
    .line 520
    iget-boolean v13, v12, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 521
    .line 522
    iget-object v14, v12, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 523
    .line 524
    if-eqz v13, :cond_1a

    .line 525
    .line 526
    invoke-virtual {v14, v11, v11, v7, v10}, Lly0;->a(Lmu0;Lmu0;Ltw0;Ltw0;)Z

    .line 527
    .line 528
    .line 529
    move-result v7

    .line 530
    if-eqz v7, :cond_19

    .line 531
    .line 532
    invoke-virtual {v12}, Landroidx/recyclerview/widget/RecyclerView;->P()V

    .line 533
    .line 534
    .line 535
    :cond_19
    move-object/from16 v19, v3

    .line 536
    .line 537
    goto :goto_e

    .line 538
    :cond_1a
    check-cast v14, Luv;

    .line 539
    .line 540
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 541
    .line 542
    .line 543
    move-object v13, v12

    .line 544
    iget v12, v7, Ltw0;->b:I

    .line 545
    .line 546
    iget v15, v10, Ltw0;->b:I

    .line 547
    .line 548
    if-ne v12, v15, :cond_1c

    .line 549
    .line 550
    iget v2, v7, Ltw0;->c:I

    .line 551
    .line 552
    move-object/from16 v19, v3

    .line 553
    .line 554
    iget v3, v10, Ltw0;->c:I

    .line 555
    .line 556
    if-eq v2, v3, :cond_1b

    .line 557
    .line 558
    goto :goto_c

    .line 559
    :cond_1b
    invoke-virtual {v14, v11}, Lly0;->c(Lmu0;)V

    .line 560
    .line 561
    .line 562
    move-object v2, v13

    .line 563
    const/4 v3, 0x0

    .line 564
    goto :goto_d

    .line 565
    :cond_1c
    move-object/from16 v19, v3

    .line 566
    .line 567
    :goto_c
    iget v2, v7, Ltw0;->c:I

    .line 568
    .line 569
    iget v3, v10, Ltw0;->c:I

    .line 570
    .line 571
    move-object v10, v13

    .line 572
    move v13, v2

    .line 573
    move-object v2, v10

    .line 574
    move-object v10, v14

    .line 575
    move v14, v15

    .line 576
    move v15, v3

    .line 577
    invoke-virtual/range {v10 .. v15}, Luv;->g(Lmu0;IIII)Z

    .line 578
    .line 579
    .line 580
    move-result v3

    .line 581
    :goto_d
    if-eqz v3, :cond_1d

    .line 582
    .line 583
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->P()V

    .line 584
    .line 585
    .line 586
    :cond_1d
    :goto_e
    const/4 v2, 0x0

    .line 587
    goto/16 :goto_b

    .line 588
    .line 589
    :cond_1e
    move-object/from16 v19, v3

    .line 590
    .line 591
    and-int/lit8 v2, v7, 0x4

    .line 592
    .line 593
    if-eqz v2, :cond_20

    .line 594
    .line 595
    iget-object v2, v5, Lei1;->b:Ltw0;

    .line 596
    .line 597
    const/4 v3, 0x0

    .line 598
    invoke-virtual {v12, v11, v2, v3}, Lfy0;->g(Lmu0;Ltw0;Ltw0;)V

    .line 599
    .line 600
    .line 601
    :cond_1f
    :goto_f
    const/4 v2, 0x0

    .line 602
    goto :goto_10

    .line 603
    :cond_20
    const/4 v3, 0x0

    .line 604
    and-int/lit8 v2, v7, 0x8

    .line 605
    .line 606
    if-eqz v2, :cond_1f

    .line 607
    .line 608
    iget-object v2, v5, Lei1;->b:Ltw0;

    .line 609
    .line 610
    iget-object v7, v5, Lei1;->c:Ltw0;

    .line 611
    .line 612
    invoke-virtual {v12, v11, v2, v7}, Lfy0;->f(Lmu0;Ltw0;Ltw0;)V

    .line 613
    .line 614
    .line 615
    goto :goto_f

    .line 616
    :goto_10
    iput v2, v5, Lei1;->a:I

    .line 617
    .line 618
    iput-object v3, v5, Lei1;->b:Ltw0;

    .line 619
    .line 620
    iput-object v3, v5, Lei1;->c:Ltw0;

    .line 621
    .line 622
    sget-object v2, Lei1;->d:Lnt0;

    .line 623
    .line 624
    invoke-virtual {v2, v5}, Lnt0;->c(Ljava/lang/Object;)V

    .line 625
    .line 626
    .line 627
    add-int/lit8 v4, v4, -0x1

    .line 628
    .line 629
    move-object/from16 v3, v19

    .line 630
    .line 631
    const/4 v2, 0x0

    .line 632
    goto/16 :goto_9

    .line 633
    .line 634
    :cond_21
    const/4 v3, 0x0

    .line 635
    goto :goto_11

    .line 636
    :cond_22
    move/from16 v17, v4

    .line 637
    .line 638
    move-object v3, v7

    .line 639
    :goto_11
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 640
    .line 641
    invoke-virtual {v2, v8}, Lpy0;->c0(Lvy0;)V

    .line 642
    .line 643
    .line 644
    iget v2, v1, Lzy0;->d:I

    .line 645
    .line 646
    iput v2, v1, Lzy0;->a:I

    .line 647
    .line 648
    const/4 v2, 0x0

    .line 649
    iput-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 650
    .line 651
    iput-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    .line 652
    .line 653
    iput-boolean v2, v1, Lzy0;->i:Z

    .line 654
    .line 655
    iput-boolean v2, v1, Lzy0;->j:Z

    .line 656
    .line 657
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 658
    .line 659
    iput-boolean v2, v4, Lpy0;->e:Z

    .line 660
    .line 661
    iget-object v4, v8, Lvy0;->b:Ljava/util/ArrayList;

    .line 662
    .line 663
    if-eqz v4, :cond_23

    .line 664
    .line 665
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 666
    .line 667
    .line 668
    :cond_23
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 669
    .line 670
    iget-boolean v5, v4, Lpy0;->j:Z

    .line 671
    .line 672
    if-eqz v5, :cond_24

    .line 673
    .line 674
    iput v2, v4, Lpy0;->i:I

    .line 675
    .line 676
    iput-boolean v2, v4, Lpy0;->j:Z

    .line 677
    .line 678
    invoke-virtual {v8}, Lvy0;->k()V

    .line 679
    .line 680
    .line 681
    :cond_24
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 682
    .line 683
    invoke-virtual {v4, v1}, Lpy0;->X(Lzy0;)V

    .line 684
    .line 685
    .line 686
    move/from16 v4, v17

    .line 687
    .line 688
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 689
    .line 690
    .line 691
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 692
    .line 693
    .line 694
    iget-object v5, v9, Lxn0;->k:Ljava/lang/Object;

    .line 695
    .line 696
    check-cast v5, Lu71;

    .line 697
    .line 698
    invoke-virtual {v5}, Lu71;->clear()V

    .line 699
    .line 700
    .line 701
    iget-object v5, v9, Lxn0;->l:Ljava/lang/Object;

    .line 702
    .line 703
    check-cast v5, Luk0;

    .line 704
    .line 705
    invoke-virtual {v5}, Luk0;->a()V

    .line 706
    .line 707
    .line 708
    iget-object v5, v0, Landroidx/recyclerview/widget/RecyclerView;->u0:[I

    .line 709
    .line 710
    aget v7, v5, v2

    .line 711
    .line 712
    aget v8, v5, v4

    .line 713
    .line 714
    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/RecyclerView;->A([I)V

    .line 715
    .line 716
    .line 717
    aget v9, v5, v2

    .line 718
    .line 719
    if-ne v9, v7, :cond_25

    .line 720
    .line 721
    aget v5, v5, v4

    .line 722
    .line 723
    if-eq v5, v8, :cond_26

    .line 724
    .line 725
    :cond_25
    invoke-virtual {v0, v2, v2}, Landroidx/recyclerview/widget/RecyclerView;->r(II)V

    .line 726
    .line 727
    .line 728
    :cond_26
    iget-boolean v4, v0, Landroidx/recyclerview/widget/RecyclerView;->i0:Z

    .line 729
    .line 730
    const-wide/16 v7, -0x1

    .line 731
    .line 732
    const/4 v5, -0x1

    .line 733
    if-eqz v4, :cond_38

    .line 734
    .line 735
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 736
    .line 737
    if-eqz v4, :cond_38

    .line 738
    .line 739
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 740
    .line 741
    .line 742
    move-result v4

    .line 743
    if-eqz v4, :cond_38

    .line 744
    .line 745
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 746
    .line 747
    .line 748
    move-result v4

    .line 749
    const/high16 v9, 0x60000

    .line 750
    .line 751
    if-eq v4, v9, :cond_38

    .line 752
    .line 753
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 754
    .line 755
    .line 756
    move-result v4

    .line 757
    const/high16 v9, 0x20000

    .line 758
    .line 759
    if-ne v4, v9, :cond_27

    .line 760
    .line 761
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 762
    .line 763
    .line 764
    move-result v4

    .line 765
    if-eqz v4, :cond_27

    .line 766
    .line 767
    goto/16 :goto_1c

    .line 768
    .line 769
    :cond_27
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 770
    .line 771
    .line 772
    move-result v4

    .line 773
    if-nez v4, :cond_28

    .line 774
    .line 775
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 776
    .line 777
    .line 778
    move-result-object v4

    .line 779
    iget-object v9, v6, Lc9;->m:Ljava/lang/Object;

    .line 780
    .line 781
    check-cast v9, Ljava/util/ArrayList;

    .line 782
    .line 783
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 784
    .line 785
    .line 786
    move-result v4

    .line 787
    if-nez v4, :cond_28

    .line 788
    .line 789
    goto/16 :goto_1c

    .line 790
    .line 791
    :cond_28
    iget-wide v9, v1, Lzy0;->l:J

    .line 792
    .line 793
    cmp-long v4, v9, v7

    .line 794
    .line 795
    if-eqz v4, :cond_2c

    .line 796
    .line 797
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 798
    .line 799
    iget-boolean v4, v4, Lhy0;->b:Z

    .line 800
    .line 801
    if-eqz v4, :cond_2c

    .line 802
    .line 803
    if-nez v4, :cond_29

    .line 804
    .line 805
    goto :goto_14

    .line 806
    :cond_29
    invoke-virtual {v6}, Lc9;->z()I

    .line 807
    .line 808
    .line 809
    move-result v4

    .line 810
    move v11, v2

    .line 811
    move-object v12, v3

    .line 812
    :goto_12
    if-ge v11, v4, :cond_2d

    .line 813
    .line 814
    invoke-virtual {v6, v11}, Lc9;->y(I)Landroid/view/View;

    .line 815
    .line 816
    .line 817
    move-result-object v13

    .line 818
    invoke-static {v13}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 819
    .line 820
    .line 821
    move-result-object v13

    .line 822
    if-eqz v13, :cond_2b

    .line 823
    .line 824
    invoke-virtual {v13}, Lmu0;->i()Z

    .line 825
    .line 826
    .line 827
    move-result v14

    .line 828
    if-nez v14, :cond_2b

    .line 829
    .line 830
    iget-wide v14, v13, Lmu0;->e:J

    .line 831
    .line 832
    cmp-long v14, v14, v9

    .line 833
    .line 834
    if-nez v14, :cond_2b

    .line 835
    .line 836
    iget-object v12, v13, Lmu0;->a:Landroid/view/View;

    .line 837
    .line 838
    iget-object v14, v6, Lc9;->m:Ljava/lang/Object;

    .line 839
    .line 840
    check-cast v14, Ljava/util/ArrayList;

    .line 841
    .line 842
    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 843
    .line 844
    .line 845
    move-result v12

    .line 846
    if-eqz v12, :cond_2a

    .line 847
    .line 848
    move-object v12, v13

    .line 849
    goto :goto_13

    .line 850
    :cond_2a
    move-object v12, v13

    .line 851
    goto :goto_15

    .line 852
    :cond_2b
    :goto_13
    add-int/lit8 v11, v11, 0x1

    .line 853
    .line 854
    goto :goto_12

    .line 855
    :cond_2c
    :goto_14
    move-object v12, v3

    .line 856
    :cond_2d
    :goto_15
    if-eqz v12, :cond_2f

    .line 857
    .line 858
    iget-object v4, v12, Lmu0;->a:Landroid/view/View;

    .line 859
    .line 860
    iget-object v9, v6, Lc9;->m:Ljava/lang/Object;

    .line 861
    .line 862
    check-cast v9, Ljava/util/ArrayList;

    .line 863
    .line 864
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 865
    .line 866
    .line 867
    move-result v9

    .line 868
    if-nez v9, :cond_2f

    .line 869
    .line 870
    invoke-virtual {v4}, Landroid/view/View;->hasFocusable()Z

    .line 871
    .line 872
    .line 873
    move-result v9

    .line 874
    if-nez v9, :cond_2e

    .line 875
    .line 876
    goto :goto_17

    .line 877
    :cond_2e
    :goto_16
    move-object v3, v4

    .line 878
    goto :goto_1b

    .line 879
    :cond_2f
    :goto_17
    invoke-virtual {v6}, Lc9;->r()I

    .line 880
    .line 881
    .line 882
    move-result v4

    .line 883
    if-lez v4, :cond_36

    .line 884
    .line 885
    iget v4, v1, Lzy0;->k:I

    .line 886
    .line 887
    if-eq v4, v5, :cond_30

    .line 888
    .line 889
    move v2, v4

    .line 890
    :cond_30
    invoke-virtual {v1}, Lzy0;->b()I

    .line 891
    .line 892
    .line 893
    move-result v4

    .line 894
    move v6, v2

    .line 895
    :goto_18
    if-ge v6, v4, :cond_33

    .line 896
    .line 897
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/RecyclerView;->C(I)Lmu0;

    .line 898
    .line 899
    .line 900
    move-result-object v9

    .line 901
    if-nez v9, :cond_31

    .line 902
    .line 903
    goto :goto_19

    .line 904
    :cond_31
    iget-object v9, v9, Lmu0;->a:Landroid/view/View;

    .line 905
    .line 906
    invoke-virtual {v9}, Landroid/view/View;->hasFocusable()Z

    .line 907
    .line 908
    .line 909
    move-result v10

    .line 910
    if-eqz v10, :cond_32

    .line 911
    .line 912
    move-object v3, v9

    .line 913
    goto :goto_1b

    .line 914
    :cond_32
    add-int/lit8 v6, v6, 0x1

    .line 915
    .line 916
    goto :goto_18

    .line 917
    :cond_33
    :goto_19
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 918
    .line 919
    .line 920
    move-result v2

    .line 921
    const/16 v17, 0x1

    .line 922
    .line 923
    add-int/lit8 v2, v2, -0x1

    .line 924
    .line 925
    :goto_1a
    if-ltz v2, :cond_36

    .line 926
    .line 927
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->C(I)Lmu0;

    .line 928
    .line 929
    .line 930
    move-result-object v4

    .line 931
    if-nez v4, :cond_34

    .line 932
    .line 933
    goto :goto_1b

    .line 934
    :cond_34
    iget-object v4, v4, Lmu0;->a:Landroid/view/View;

    .line 935
    .line 936
    invoke-virtual {v4}, Landroid/view/View;->hasFocusable()Z

    .line 937
    .line 938
    .line 939
    move-result v6

    .line 940
    if-eqz v6, :cond_35

    .line 941
    .line 942
    goto :goto_16

    .line 943
    :cond_35
    add-int/lit8 v2, v2, -0x1

    .line 944
    .line 945
    goto :goto_1a

    .line 946
    :cond_36
    :goto_1b
    if-eqz v3, :cond_38

    .line 947
    .line 948
    iget v0, v1, Lzy0;->m:I

    .line 949
    .line 950
    int-to-long v9, v0

    .line 951
    cmp-long v2, v9, v7

    .line 952
    .line 953
    if-eqz v2, :cond_37

    .line 954
    .line 955
    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 956
    .line 957
    .line 958
    move-result-object v0

    .line 959
    if-eqz v0, :cond_37

    .line 960
    .line 961
    invoke-virtual {v0}, Landroid/view/View;->isFocusable()Z

    .line 962
    .line 963
    .line 964
    move-result v2

    .line 965
    if-eqz v2, :cond_37

    .line 966
    .line 967
    move-object v3, v0

    .line 968
    :cond_37
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 969
    .line 970
    .line 971
    :cond_38
    :goto_1c
    iput-wide v7, v1, Lzy0;->l:J

    .line 972
    .line 973
    iput v5, v1, Lzy0;->k:I

    .line 974
    .line 975
    iput v5, v1, Lzy0;->m:I

    .line 976
    .line 977
    return-void
.end method

.method public final n()V
    .locals 14

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lzy0;->a(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x(Lzy0;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-boolean v2, v0, Lzy0;->h:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->o:Lxn0;

    .line 17
    .line 18
    iget-object v4, v3, Lxn0;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v4, Lu71;

    .line 21
    .line 22
    iget-object v5, v3, Lxn0;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v5, Lu71;

    .line 25
    .line 26
    invoke-virtual {v4}, Lu71;->clear()V

    .line 27
    .line 28
    .line 29
    iget-object v3, v3, Lxn0;->l:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v3, Luk0;

    .line 32
    .line 33
    invoke-virtual {v3}, Luk0;->a()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Q()V

    .line 40
    .line 41
    .line 42
    iget-boolean v4, p0, Landroidx/recyclerview/widget/RecyclerView;->i0:Z

    .line 43
    .line 44
    const/4 v6, 0x0

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_0

    .line 52
    .line 53
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 54
    .line 55
    if-eqz v4, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object v4, v6

    .line 63
    :goto_0
    if-nez v4, :cond_1

    .line 64
    .line 65
    :goto_1
    move-object v4, v6

    .line 66
    goto :goto_2

    .line 67
    :cond_1
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    if-nez v4, :cond_2

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->F(Landroid/view/View;)Lmu0;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    :goto_2
    const-wide/16 v7, -0x1

    .line 79
    .line 80
    const/4 v9, -0x1

    .line 81
    if-nez v4, :cond_3

    .line 82
    .line 83
    iput-wide v7, v0, Lzy0;->l:J

    .line 84
    .line 85
    iput v9, v0, Lzy0;->k:I

    .line 86
    .line 87
    iput v9, v0, Lzy0;->m:I

    .line 88
    .line 89
    goto :goto_6

    .line 90
    :cond_3
    iget-object v10, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 91
    .line 92
    iget-boolean v10, v10, Lhy0;->b:Z

    .line 93
    .line 94
    if-eqz v10, :cond_4

    .line 95
    .line 96
    iget-wide v7, v4, Lmu0;->e:J

    .line 97
    .line 98
    :cond_4
    iput-wide v7, v0, Lzy0;->l:J

    .line 99
    .line 100
    iget-boolean v7, p0, Landroidx/recyclerview/widget/RecyclerView;->J:Z

    .line 101
    .line 102
    if-eqz v7, :cond_5

    .line 103
    .line 104
    :goto_3
    move v7, v9

    .line 105
    goto :goto_4

    .line 106
    :cond_5
    invoke-virtual {v4}, Lmu0;->i()Z

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    if-eqz v7, :cond_6

    .line 111
    .line 112
    iget v7, v4, Lmu0;->d:I

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_6
    iget-object v7, v4, Lmu0;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 116
    .line 117
    if-nez v7, :cond_7

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_7
    invoke-virtual {v7, v4}, Landroidx/recyclerview/widget/RecyclerView;->D(Lmu0;)I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    :goto_4
    iput v7, v0, Lzy0;->k:I

    .line 125
    .line 126
    iget-object v4, v4, Lmu0;->a:Landroid/view/View;

    .line 127
    .line 128
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    :cond_8
    :goto_5
    invoke-virtual {v4}, Landroid/view/View;->isFocused()Z

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    if-nez v8, :cond_9

    .line 137
    .line 138
    instance-of v8, v4, Landroid/view/ViewGroup;

    .line 139
    .line 140
    if-eqz v8, :cond_9

    .line 141
    .line 142
    invoke-virtual {v4}, Landroid/view/View;->hasFocus()Z

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    if-eqz v8, :cond_9

    .line 147
    .line 148
    check-cast v4, Landroid/view/ViewGroup;

    .line 149
    .line 150
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 155
    .line 156
    .line 157
    move-result v8

    .line 158
    if-eq v8, v9, :cond_8

    .line 159
    .line 160
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    goto :goto_5

    .line 165
    :cond_9
    iput v7, v0, Lzy0;->m:I

    .line 166
    .line 167
    :goto_6
    iget-boolean v4, v0, Lzy0;->i:Z

    .line 168
    .line 169
    if-eqz v4, :cond_a

    .line 170
    .line 171
    iget-boolean v4, p0, Landroidx/recyclerview/widget/RecyclerView;->q0:Z

    .line 172
    .line 173
    if-eqz v4, :cond_a

    .line 174
    .line 175
    move v4, v1

    .line 176
    goto :goto_7

    .line 177
    :cond_a
    move v4, v2

    .line 178
    :goto_7
    iput-boolean v4, v0, Lzy0;->g:Z

    .line 179
    .line 180
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->q0:Z

    .line 181
    .line 182
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 183
    .line 184
    iget-boolean v4, v0, Lzy0;->j:Z

    .line 185
    .line 186
    iput-boolean v4, v0, Lzy0;->f:Z

    .line 187
    .line 188
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 189
    .line 190
    check-cast v4, Lhu0;

    .line 191
    .line 192
    iget-object v4, v4, Lhu0;->e:Ljava/util/ArrayList;

    .line 193
    .line 194
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    iput v4, v0, Lzy0;->d:I

    .line 199
    .line 200
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->u0:[I

    .line 201
    .line 202
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->A([I)V

    .line 203
    .line 204
    .line 205
    iget-boolean v4, v0, Lzy0;->i:Z

    .line 206
    .line 207
    iget-object v7, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 208
    .line 209
    const/4 v8, 0x2

    .line 210
    if-eqz v4, :cond_e

    .line 211
    .line 212
    invoke-virtual {v7}, Lc9;->r()I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    move v10, v2

    .line 217
    :goto_8
    if-ge v10, v4, :cond_e

    .line 218
    .line 219
    invoke-virtual {v7, v10}, Lc9;->q(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v11

    .line 223
    invoke-static {v11}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 224
    .line 225
    .line 226
    move-result-object v11

    .line 227
    invoke-virtual {v11}, Lmu0;->p()Z

    .line 228
    .line 229
    .line 230
    move-result v12

    .line 231
    if-nez v12, :cond_d

    .line 232
    .line 233
    invoke-virtual {v11}, Lmu0;->g()Z

    .line 234
    .line 235
    .line 236
    move-result v12

    .line 237
    if-eqz v12, :cond_b

    .line 238
    .line 239
    iget-object v12, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 240
    .line 241
    iget-boolean v12, v12, Lhy0;->b:Z

    .line 242
    .line 243
    if-nez v12, :cond_b

    .line 244
    .line 245
    goto :goto_9

    .line 246
    :cond_b
    iget-object v12, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 247
    .line 248
    invoke-static {v11}, Lly0;->b(Lmu0;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v11}, Lmu0;->d()Ljava/util/List;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    .line 256
    .line 257
    new-instance v12, Ltw0;

    .line 258
    .line 259
    invoke-direct {v12, v8, v2}, Ltw0;-><init>(IB)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v12, v11}, Ltw0;->a(Lmu0;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v5, v11, v6}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v13

    .line 269
    check-cast v13, Lei1;

    .line 270
    .line 271
    if-nez v13, :cond_c

    .line 272
    .line 273
    invoke-static {}, Lei1;->a()Lei1;

    .line 274
    .line 275
    .line 276
    move-result-object v13

    .line 277
    invoke-virtual {v5, v11, v13}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    :cond_c
    iput-object v12, v13, Lei1;->b:Ltw0;

    .line 281
    .line 282
    iget v12, v13, Lei1;->a:I

    .line 283
    .line 284
    or-int/lit8 v12, v12, 0x4

    .line 285
    .line 286
    iput v12, v13, Lei1;->a:I

    .line 287
    .line 288
    iget-boolean v12, v0, Lzy0;->g:Z

    .line 289
    .line 290
    if-eqz v12, :cond_d

    .line 291
    .line 292
    invoke-virtual {v11}, Lmu0;->l()Z

    .line 293
    .line 294
    .line 295
    move-result v12

    .line 296
    if-eqz v12, :cond_d

    .line 297
    .line 298
    invoke-virtual {v11}, Lmu0;->i()Z

    .line 299
    .line 300
    .line 301
    move-result v12

    .line 302
    if-nez v12, :cond_d

    .line 303
    .line 304
    invoke-virtual {v11}, Lmu0;->p()Z

    .line 305
    .line 306
    .line 307
    move-result v12

    .line 308
    if-nez v12, :cond_d

    .line 309
    .line 310
    invoke-virtual {v11}, Lmu0;->g()Z

    .line 311
    .line 312
    .line 313
    move-result v12

    .line 314
    if-nez v12, :cond_d

    .line 315
    .line 316
    invoke-virtual {p0, v11}, Landroidx/recyclerview/widget/RecyclerView;->E(Lmu0;)J

    .line 317
    .line 318
    .line 319
    move-result-wide v12

    .line 320
    invoke-virtual {v3, v12, v13, v11}, Luk0;->d(JLjava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    :cond_d
    :goto_9
    add-int/lit8 v10, v10, 0x1

    .line 324
    .line 325
    goto :goto_8

    .line 326
    :cond_e
    iget-boolean v3, v0, Lzy0;->j:Z

    .line 327
    .line 328
    if-eqz v3, :cond_17

    .line 329
    .line 330
    invoke-virtual {v7}, Lc9;->z()I

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    move v4, v2

    .line 335
    :goto_a
    if-ge v4, v3, :cond_10

    .line 336
    .line 337
    invoke-virtual {v7, v4}, Lc9;->y(I)Landroid/view/View;

    .line 338
    .line 339
    .line 340
    move-result-object v10

    .line 341
    invoke-static {v10}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 342
    .line 343
    .line 344
    move-result-object v10

    .line 345
    invoke-virtual {v10}, Lmu0;->p()Z

    .line 346
    .line 347
    .line 348
    move-result v11

    .line 349
    if-nez v11, :cond_f

    .line 350
    .line 351
    iget v11, v10, Lmu0;->d:I

    .line 352
    .line 353
    if-ne v11, v9, :cond_f

    .line 354
    .line 355
    iget v11, v10, Lmu0;->c:I

    .line 356
    .line 357
    iput v11, v10, Lmu0;->d:I

    .line 358
    .line 359
    :cond_f
    add-int/lit8 v4, v4, 0x1

    .line 360
    .line 361
    goto :goto_a

    .line 362
    :cond_10
    iget-boolean v3, v0, Lzy0;->e:Z

    .line 363
    .line 364
    iput-boolean v2, v0, Lzy0;->e:Z

    .line 365
    .line 366
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 367
    .line 368
    iget-object v9, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 369
    .line 370
    invoke-virtual {v4, v9, v0}, Lpy0;->W(Lvy0;Lzy0;)V

    .line 371
    .line 372
    .line 373
    iput-boolean v3, v0, Lzy0;->e:Z

    .line 374
    .line 375
    move v3, v2

    .line 376
    :goto_b
    invoke-virtual {v7}, Lc9;->r()I

    .line 377
    .line 378
    .line 379
    move-result v4

    .line 380
    if-ge v3, v4, :cond_16

    .line 381
    .line 382
    invoke-virtual {v7, v3}, Lc9;->q(I)Landroid/view/View;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    invoke-virtual {v4}, Lmu0;->p()Z

    .line 391
    .line 392
    .line 393
    move-result v9

    .line 394
    if-eqz v9, :cond_11

    .line 395
    .line 396
    goto :goto_d

    .line 397
    :cond_11
    invoke-virtual {v5, v4, v6}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v9

    .line 401
    check-cast v9, Lei1;

    .line 402
    .line 403
    if-eqz v9, :cond_12

    .line 404
    .line 405
    iget v9, v9, Lei1;->a:I

    .line 406
    .line 407
    and-int/lit8 v9, v9, 0x4

    .line 408
    .line 409
    if-eqz v9, :cond_12

    .line 410
    .line 411
    goto :goto_d

    .line 412
    :cond_12
    invoke-static {v4}, Lly0;->b(Lmu0;)V

    .line 413
    .line 414
    .line 415
    iget v9, v4, Lmu0;->j:I

    .line 416
    .line 417
    and-int/lit16 v9, v9, 0x2000

    .line 418
    .line 419
    if-eqz v9, :cond_13

    .line 420
    .line 421
    move v9, v1

    .line 422
    goto :goto_c

    .line 423
    :cond_13
    move v9, v2

    .line 424
    :goto_c
    iget-object v10, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 425
    .line 426
    invoke-virtual {v4}, Lmu0;->d()Ljava/util/List;

    .line 427
    .line 428
    .line 429
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 430
    .line 431
    .line 432
    new-instance v10, Ltw0;

    .line 433
    .line 434
    invoke-direct {v10, v8, v2}, Ltw0;-><init>(IB)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v10, v4}, Ltw0;->a(Lmu0;)V

    .line 438
    .line 439
    .line 440
    if-eqz v9, :cond_14

    .line 441
    .line 442
    invoke-virtual {p0, v4, v10}, Landroidx/recyclerview/widget/RecyclerView;->S(Lmu0;Ltw0;)V

    .line 443
    .line 444
    .line 445
    goto :goto_d

    .line 446
    :cond_14
    invoke-virtual {v5, v4, v6}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v9

    .line 450
    check-cast v9, Lei1;

    .line 451
    .line 452
    if-nez v9, :cond_15

    .line 453
    .line 454
    invoke-static {}, Lei1;->a()Lei1;

    .line 455
    .line 456
    .line 457
    move-result-object v9

    .line 458
    invoke-virtual {v5, v4, v9}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    :cond_15
    iget v4, v9, Lei1;->a:I

    .line 462
    .line 463
    or-int/2addr v4, v8

    .line 464
    iput v4, v9, Lei1;->a:I

    .line 465
    .line 466
    iput-object v10, v9, Lei1;->b:Ltw0;

    .line 467
    .line 468
    :goto_d
    add-int/lit8 v3, v3, 0x1

    .line 469
    .line 470
    goto :goto_b

    .line 471
    :cond_16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->i()V

    .line 472
    .line 473
    .line 474
    goto :goto_e

    .line 475
    :cond_17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->i()V

    .line 476
    .line 477
    .line 478
    :goto_e
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 479
    .line 480
    .line 481
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 482
    .line 483
    .line 484
    iput v8, v0, Lzy0;->c:I

    .line 485
    .line 486
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lzy0;->a(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 14
    .line 15
    invoke-virtual {v0}, Ls3;->d()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 19
    .line 20
    check-cast v0, Lhu0;

    .line 21
    .line 22
    iget-object v0, v0, Lhu0;->e:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, v1, Lzy0;->d:I

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput v0, v1, Lzy0;->b:I

    .line 32
    .line 33
    iput-boolean v0, v1, Lzy0;->f:Z

    .line 34
    .line 35
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 36
    .line 37
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 38
    .line 39
    invoke-virtual {v2, v3, v1}, Lpy0;->W(Lvy0;Lzy0;)V

    .line 40
    .line 41
    .line 42
    iput-boolean v0, v1, Lzy0;->e:Z

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lyy0;

    .line 46
    .line 47
    iget-boolean v2, v1, Lzy0;->i:Z

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 53
    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    move v2, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v2, v0

    .line 59
    :goto_0
    iput-boolean v2, v1, Lzy0;->i:Z

    .line 60
    .line 61
    const/4 v2, 0x4

    .line 62
    iput v2, v1, Lzy0;->c:I

    .line 63
    .line 64
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final onAttachedToWindow()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->L:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 9
    .line 10
    iget-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    move v2, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v2, v0

    .line 23
    :goto_0
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 24
    .line 25
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iput-boolean v1, v2, Lpy0;->f:Z

    .line 30
    .line 31
    :cond_1
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->s0:Z

    .line 32
    .line 33
    sget-object v0, Lu90;->n:Ljava/lang/ThreadLocal;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lu90;

    .line 40
    .line 41
    iput-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 42
    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    new-instance v1, Lu90;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v2, v1, Lu90;->j:Ljava/util/ArrayList;

    .line 56
    .line 57
    new-instance v2, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v2, v1, Lu90;->m:Ljava/util/ArrayList;

    .line 63
    .line 64
    iput-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 65
    .line 66
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_2

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/view/Display;->getRefreshRate()F

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/high16 v2, 0x41f00000    # 30.0f

    .line 85
    .line 86
    cmpl-float v2, v1, v2

    .line 87
    .line 88
    if-ltz v2, :cond_2

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    const/high16 v1, 0x42700000    # 60.0f

    .line 92
    .line 93
    :goto_1
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 94
    .line 95
    const v3, 0x4e6e6b28    # 1.0E9f

    .line 96
    .line 97
    .line 98
    div-float/2addr v3, v1

    .line 99
    float-to-long v3, v3

    .line 100
    iput-wide v3, v2, Lu90;->l:J

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    :cond_3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 106
    .line 107
    iget-object v0, v0, Lu90;->j:Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final onDetachedFromWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lly0;->e()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 16
    .line 17
    iget-object v2, v1, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    iget-object v1, v1, Lbz0;->l:Landroid/widget/OverScroller;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 25
    .line 26
    .line 27
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 28
    .line 29
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iput-boolean v0, v1, Lpy0;->f:Z

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lpy0;->M(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->A0:Ldy0;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->o:Lxn0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    :goto_0
    sget-object v0, Lei1;->d:Lnt0;

    .line 54
    .line 55
    invoke-virtual {v0}, Lnt0;->a()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-object v0, v0, Lu90;->j:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->w:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-ge v0, p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lmy0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public final onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto/16 :goto_3

    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    if-ne v0, v2, :cond_8

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    and-int/lit8 v0, v0, 0x2

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 32
    .line 33
    invoke-virtual {v0}, Lpy0;->d()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const/16 v0, 0x9

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    neg-float v0, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v0, v2

    .line 48
    :goto_0
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 49
    .line 50
    invoke-virtual {v3}, Lpy0;->c()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_3

    .line 55
    .line 56
    const/16 v3, 0xa

    .line 57
    .line 58
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    goto :goto_2

    .line 63
    :cond_3
    :goto_1
    move v3, v2

    .line 64
    goto :goto_2

    .line 65
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/high16 v3, 0x400000

    .line 70
    .line 71
    and-int/2addr v0, v3

    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/16 v0, 0x1a

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 81
    .line 82
    invoke-virtual {v3}, Lpy0;->d()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_5

    .line 87
    .line 88
    neg-float v0, v0

    .line 89
    goto :goto_1

    .line 90
    :cond_5
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 91
    .line 92
    invoke-virtual {v3}, Lpy0;->c()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_6

    .line 97
    .line 98
    move v3, v0

    .line 99
    move v0, v2

    .line 100
    goto :goto_2

    .line 101
    :cond_6
    move v0, v2

    .line 102
    move v3, v0

    .line 103
    :goto_2
    cmpl-float v4, v0, v2

    .line 104
    .line 105
    if-nez v4, :cond_7

    .line 106
    .line 107
    cmpl-float v2, v3, v2

    .line 108
    .line 109
    if-eqz v2, :cond_8

    .line 110
    .line 111
    :cond_7
    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView;->g0:F

    .line 112
    .line 113
    mul-float/2addr v3, v2

    .line 114
    float-to-int v2, v3

    .line 115
    iget v3, p0, Landroidx/recyclerview/widget/RecyclerView;->h0:F

    .line 116
    .line 117
    mul-float/2addr v0, v3

    .line 118
    float-to-int v0, v0

    .line 119
    invoke-virtual {p0, v2, v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->V(IILandroid/view/MotionEvent;)Z

    .line 120
    .line 121
    .line 122
    :cond_8
    :goto_3
    return v1
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    goto/16 :goto_2

    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->y:Ls20;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->z(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->U()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 22
    .line 23
    .line 24
    return v2

    .line 25
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    goto/16 :goto_2

    .line 30
    .line 31
    :cond_2
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 36
    .line 37
    invoke-virtual {v3}, Lpy0;->d()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 42
    .line 43
    if-nez v4, :cond_3

    .line 44
    .line 45
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iput-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 50
    .line 51
    :cond_3
    invoke-virtual {v4, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    const/4 v6, 0x2

    .line 63
    const/high16 v7, 0x3f000000    # 0.5f

    .line 64
    .line 65
    if-eqz v4, :cond_c

    .line 66
    .line 67
    if-eq v4, v2, :cond_b

    .line 68
    .line 69
    if-eq v4, v6, :cond_7

    .line 70
    .line 71
    const/4 v0, 0x3

    .line 72
    if-eq v4, v0, :cond_6

    .line 73
    .line 74
    const/4 v0, 0x5

    .line 75
    if-eq v4, v0, :cond_5

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    if-eq v4, v0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_1

    .line 81
    .line 82
    :cond_4
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->O(Landroid/view/MotionEvent;)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_1

    .line 86
    .line 87
    :cond_5
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 92
    .line 93
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-float/2addr v0, v7

    .line 98
    float-to-int v0, v0

    .line 99
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 100
    .line 101
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 102
    .line 103
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    add-float/2addr p1, v7

    .line 108
    float-to-int p1, p1

    .line 109
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 110
    .line 111
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 112
    .line 113
    goto/16 :goto_1

    .line 114
    .line 115
    :cond_6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->U()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_1

    .line 122
    .line 123
    :cond_7
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 124
    .line 125
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-gez v4, :cond_8

    .line 130
    .line 131
    goto/16 :goto_2

    .line 132
    .line 133
    :cond_8
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    add-float/2addr v5, v7

    .line 138
    float-to-int v5, v5

    .line 139
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    add-float/2addr p1, v7

    .line 144
    float-to-int p1, p1

    .line 145
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 146
    .line 147
    if-eq v4, v2, :cond_10

    .line 148
    .line 149
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 150
    .line 151
    sub-int v4, v5, v4

    .line 152
    .line 153
    iget v6, p0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 154
    .line 155
    sub-int v6, p1, v6

    .line 156
    .line 157
    if-eqz v0, :cond_9

    .line 158
    .line 159
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 164
    .line 165
    if-le v0, v4, :cond_9

    .line 166
    .line 167
    iput v5, p0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 168
    .line 169
    move v0, v2

    .line 170
    goto :goto_0

    .line 171
    :cond_9
    move v0, v1

    .line 172
    :goto_0
    if-eqz v3, :cond_a

    .line 173
    .line 174
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 179
    .line 180
    if-le v3, v4, :cond_a

    .line 181
    .line 182
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 183
    .line 184
    move v0, v2

    .line 185
    :cond_a
    if-eqz v0, :cond_10

    .line 186
    .line 187
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_b
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 192
    .line 193
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a0(I)V

    .line 197
    .line 198
    .line 199
    goto :goto_1

    .line 200
    :cond_c
    iget-boolean v4, p0, Landroidx/recyclerview/widget/RecyclerView;->F:Z

    .line 201
    .line 202
    if-eqz v4, :cond_d

    .line 203
    .line 204
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->F:Z

    .line 205
    .line 206
    :cond_d
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    iput v4, p0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 211
    .line 212
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    add-float/2addr v4, v7

    .line 217
    float-to-int v4, v4

    .line 218
    iput v4, p0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 219
    .line 220
    iput v4, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 221
    .line 222
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    add-float/2addr p1, v7

    .line 227
    float-to-int p1, p1

    .line 228
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 229
    .line 230
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 231
    .line 232
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 233
    .line 234
    if-ne p1, v6, :cond_e

    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->a0(I)V

    .line 247
    .line 248
    .line 249
    :cond_e
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->x0:[I

    .line 250
    .line 251
    aput v1, p1, v2

    .line 252
    .line 253
    aput v1, p1, v1

    .line 254
    .line 255
    if-eqz v3, :cond_f

    .line 256
    .line 257
    or-int/lit8 v0, v0, 0x2

    .line 258
    .line 259
    :cond_f
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-virtual {p1, v0, v1}, Lgp0;->f(II)Z

    .line 264
    .line 265
    .line 266
    :cond_10
    :goto_1
    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 267
    .line 268
    if-ne p0, v2, :cond_11

    .line 269
    .line 270
    return v2

    .line 271
    :cond_11
    :goto_2
    return v1
.end method

.method public final onLayout(ZIIII)V
    .locals 0

    .line 1
    sget p1, Lhd1;->a:I

    .line 2
    .line 3
    const-string p1, "RV OnLayout"

    .line 4
    .line 5
    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->m()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 16
    .line 17
    return-void
.end method

.method public final onMeasure(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->l(II)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {v0}, Lpy0;->H()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 15
    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 27
    .line 28
    iget-object v4, v4, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-virtual {v4, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->l(II)V

    .line 31
    .line 32
    .line 33
    const/high16 v4, 0x40000000    # 2.0f

    .line 34
    .line 35
    if-ne v0, v4, :cond_1

    .line 36
    .line 37
    if-ne v3, v4, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget v0, v2, Lzy0;->c:I

    .line 46
    .line 47
    if-ne v0, v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->n()V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 53
    .line 54
    invoke-virtual {v0, p1, p2}, Lpy0;->k0(II)V

    .line 55
    .line 56
    .line 57
    iput-boolean v1, v2, Lzy0;->h:Z

    .line 58
    .line 59
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->o()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 63
    .line 64
    invoke-virtual {v0, p1, p2}, Lpy0;->m0(II)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 68
    .line 69
    invoke-virtual {v0}, Lpy0;->p0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    invoke-static {v5, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-virtual {v0, v3, v4}, Lpy0;->k0(II)V

    .line 94
    .line 95
    .line 96
    iput-boolean v1, v2, Lzy0;->h:Z

    .line 97
    .line 98
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->o()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 102
    .line 103
    invoke-virtual {p0, p1, p2}, Lpy0;->m0(II)V

    .line 104
    .line 105
    .line 106
    :cond_4
    :goto_0
    return-void

    .line 107
    :cond_5
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->A:Z

    .line 108
    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 112
    .line 113
    iget-object p0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 114
    .line 115
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->l(II)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_6
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->H:Z

    .line 120
    .line 121
    const/4 v3, 0x0

    .line 122
    if-eqz v0, :cond_8

    .line 123
    .line 124
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->M()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Q()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->N(Z)V

    .line 134
    .line 135
    .line 136
    iget-boolean v0, v2, Lzy0;->j:Z

    .line 137
    .line 138
    if-eqz v0, :cond_7

    .line 139
    .line 140
    iput-boolean v1, v2, Lzy0;->f:Z

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_7
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 144
    .line 145
    invoke-virtual {v0}, Ls3;->d()V

    .line 146
    .line 147
    .line 148
    iput-boolean v3, v2, Lzy0;->f:Z

    .line 149
    .line 150
    :goto_1
    iput-boolean v3, p0, Landroidx/recyclerview/widget/RecyclerView;->H:Z

    .line 151
    .line 152
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_8
    iget-boolean v0, v2, Lzy0;->j:Z

    .line 157
    .line 158
    if-eqz v0, :cond_9

    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_9
    :goto_2
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 173
    .line 174
    if-eqz v0, :cond_a

    .line 175
    .line 176
    check-cast v0, Lhu0;

    .line 177
    .line 178
    iget-object v0, v0, Lhu0;->e:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    iput v0, v2, Lzy0;->d:I

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_a
    iput v3, v2, Lzy0;->d:I

    .line 188
    .line 189
    :goto_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 193
    .line 194
    iget-object v0, v0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 195
    .line 196
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->l(II)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 200
    .line 201
    .line 202
    iput-boolean v3, v2, Lzy0;->f:Z

    .line 203
    .line 204
    return-void
.end method

.method public final onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lyy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p1, Lyy0;

    .line 10
    .line 11
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lyy0;

    .line 12
    .line 13
    iget-object p1, p1, Lg;->j:Landroid/os/Parcelable;

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lyy0;

    .line 23
    .line 24
    iget-object p0, p0, Lyy0;->l:Landroid/os/Parcelable;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lpy0;->Y(Landroid/os/Parcelable;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    new-instance v0, Lyy0;

    .line 2
    .line 3
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lg;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lyy0;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object p0, v1, Lyy0;->l:Landroid/os/Parcelable;

    .line 15
    .line 16
    iput-object p0, v0, Lyy0;->l:Landroid/os/Parcelable;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lpy0;->Z()Landroid/os/Parcelable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iput-object p0, v0, Lyy0;->l:Landroid/os/Parcelable;

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    iput-object p0, v0, Lyy0;->l:Landroid/os/Parcelable;

    .line 32
    .line 33
    return-object v0
.end method

.method public final onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-ne p1, p3, :cond_1

    .line 5
    .line 6
    if-eq p2, p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    return-void

    .line 10
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 14
    .line 15
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 16
    .line 17
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 18
    .line 19
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    iget-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    if-nez v1, :cond_3a

    .line 9
    .line 10
    iget-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->F:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_12

    .line 15
    .line 16
    :cond_0
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->y:Ls20;

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    const/4 v3, 0x2

    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v8, 0x1

    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    move v1, v7

    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_1
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->z(Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :cond_2
    iget v5, v1, Ls20;->b:I

    .line 40
    .line 41
    iget v9, v1, Ls20;->v:I

    .line 42
    .line 43
    if-nez v9, :cond_3

    .line 44
    .line 45
    goto/16 :goto_2

    .line 46
    .line 47
    :cond_3
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 48
    .line 49
    .line 50
    move-result v9

    .line 51
    if-nez v9, :cond_7

    .line 52
    .line 53
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getX()F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    .line 58
    .line 59
    .line 60
    move-result v9

    .line 61
    invoke-virtual {v1, v5, v9}, Ls20;->d(FF)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    invoke-virtual {v1, v9, v10}, Ls20;->c(FF)Z

    .line 74
    .line 75
    .line 76
    move-result v9

    .line 77
    if-nez v5, :cond_4

    .line 78
    .line 79
    if-eqz v9, :cond_e

    .line 80
    .line 81
    :cond_4
    if-eqz v9, :cond_5

    .line 82
    .line 83
    iput v8, v1, Ls20;->w:I

    .line 84
    .line 85
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getX()F

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    float-to-int v5, v5

    .line 90
    int-to-float v5, v5

    .line 91
    iput v5, v1, Ls20;->p:F

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    if-eqz v5, :cond_6

    .line 95
    .line 96
    iput v3, v1, Ls20;->w:I

    .line 97
    .line 98
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    float-to-int v5, v5

    .line 103
    int-to-float v5, v5

    .line 104
    iput v5, v1, Ls20;->m:F

    .line 105
    .line 106
    :cond_6
    :goto_0
    invoke-virtual {v1, v3}, Ls20;->f(I)V

    .line 107
    .line 108
    .line 109
    goto/16 :goto_2

    .line 110
    .line 111
    :cond_7
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 112
    .line 113
    .line 114
    move-result v9

    .line 115
    if-ne v9, v8, :cond_8

    .line 116
    .line 117
    iget v9, v1, Ls20;->v:I

    .line 118
    .line 119
    if-ne v9, v3, :cond_8

    .line 120
    .line 121
    iput v4, v1, Ls20;->m:F

    .line 122
    .line 123
    iput v4, v1, Ls20;->p:F

    .line 124
    .line 125
    invoke-virtual {v1, v8}, Ls20;->f(I)V

    .line 126
    .line 127
    .line 128
    iput v7, v1, Ls20;->w:I

    .line 129
    .line 130
    goto/16 :goto_2

    .line 131
    .line 132
    :cond_8
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-ne v9, v3, :cond_e

    .line 137
    .line 138
    iget v9, v1, Ls20;->v:I

    .line 139
    .line 140
    if-ne v9, v3, :cond_e

    .line 141
    .line 142
    invoke-virtual {v1}, Ls20;->g()V

    .line 143
    .line 144
    .line 145
    iget v9, v1, Ls20;->w:I

    .line 146
    .line 147
    const/high16 v10, 0x40000000    # 2.0f

    .line 148
    .line 149
    if-ne v9, v8, :cond_b

    .line 150
    .line 151
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getX()F

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    iget-object v13, v1, Ls20;->y:[I

    .line 156
    .line 157
    aput v5, v13, v7

    .line 158
    .line 159
    iget v11, v1, Ls20;->q:I

    .line 160
    .line 161
    sub-int/2addr v11, v5

    .line 162
    aput v11, v13, v8

    .line 163
    .line 164
    int-to-float v12, v5

    .line 165
    int-to-float v11, v11

    .line 166
    invoke-static {v11, v9}, Ljava/lang/Math;->min(FF)F

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    invoke-static {v12, v9}, Ljava/lang/Math;->max(FF)F

    .line 171
    .line 172
    .line 173
    move-result v12

    .line 174
    iget v9, v1, Ls20;->o:I

    .line 175
    .line 176
    int-to-float v9, v9

    .line 177
    sub-float/2addr v9, v12

    .line 178
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 179
    .line 180
    .line 181
    move-result v9

    .line 182
    cmpg-float v9, v9, v10

    .line 183
    .line 184
    if-gez v9, :cond_9

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_9
    iget v11, v1, Ls20;->p:F

    .line 188
    .line 189
    iget-object v9, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 190
    .line 191
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    .line 192
    .line 193
    .line 194
    move-result v14

    .line 195
    iget-object v9, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 196
    .line 197
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    .line 198
    .line 199
    .line 200
    move-result v15

    .line 201
    iget v9, v1, Ls20;->q:I

    .line 202
    .line 203
    move/from16 v16, v9

    .line 204
    .line 205
    invoke-static/range {v11 .. v16}, Ls20;->e(FF[IIII)I

    .line 206
    .line 207
    .line 208
    move-result v9

    .line 209
    if-eqz v9, :cond_a

    .line 210
    .line 211
    iget-object v11, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 212
    .line 213
    invoke-virtual {v11, v9, v7}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 214
    .line 215
    .line 216
    :cond_a
    iput v12, v1, Ls20;->p:F

    .line 217
    .line 218
    :cond_b
    :goto_1
    iget v9, v1, Ls20;->w:I

    .line 219
    .line 220
    if-ne v9, v3, :cond_e

    .line 221
    .line 222
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    .line 223
    .line 224
    .line 225
    move-result v9

    .line 226
    iget-object v13, v1, Ls20;->x:[I

    .line 227
    .line 228
    aput v5, v13, v7

    .line 229
    .line 230
    iget v11, v1, Ls20;->r:I

    .line 231
    .line 232
    sub-int/2addr v11, v5

    .line 233
    aput v11, v13, v8

    .line 234
    .line 235
    int-to-float v5, v5

    .line 236
    int-to-float v11, v11

    .line 237
    invoke-static {v11, v9}, Ljava/lang/Math;->min(FF)F

    .line 238
    .line 239
    .line 240
    move-result v9

    .line 241
    invoke-static {v5, v9}, Ljava/lang/Math;->max(FF)F

    .line 242
    .line 243
    .line 244
    move-result v12

    .line 245
    iget v5, v1, Ls20;->l:I

    .line 246
    .line 247
    int-to-float v5, v5

    .line 248
    sub-float/2addr v5, v12

    .line 249
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 250
    .line 251
    .line 252
    move-result v5

    .line 253
    cmpg-float v5, v5, v10

    .line 254
    .line 255
    if-gez v5, :cond_c

    .line 256
    .line 257
    goto :goto_2

    .line 258
    :cond_c
    iget v11, v1, Ls20;->m:F

    .line 259
    .line 260
    iget-object v5, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 261
    .line 262
    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    .line 263
    .line 264
    .line 265
    move-result v14

    .line 266
    iget-object v5, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 267
    .line 268
    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 269
    .line 270
    .line 271
    move-result v15

    .line 272
    iget v5, v1, Ls20;->r:I

    .line 273
    .line 274
    move/from16 v16, v5

    .line 275
    .line 276
    invoke-static/range {v11 .. v16}, Ls20;->e(FF[IIII)I

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    if-eqz v5, :cond_d

    .line 281
    .line 282
    iget-object v9, v1, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 283
    .line 284
    invoke-virtual {v9, v7, v5}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 285
    .line 286
    .line 287
    :cond_d
    iput v12, v1, Ls20;->m:F

    .line 288
    .line 289
    :cond_e
    :goto_2
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eq v1, v2, :cond_f

    .line 294
    .line 295
    if-ne v1, v8, :cond_10

    .line 296
    .line 297
    :cond_f
    const/4 v1, 0x0

    .line 298
    iput-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->y:Ls20;

    .line 299
    .line 300
    :cond_10
    move v1, v8

    .line 301
    :goto_3
    if-eqz v1, :cond_11

    .line 302
    .line 303
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->U()V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 307
    .line 308
    .line 309
    return v8

    .line 310
    :cond_11
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 311
    .line 312
    if-nez v1, :cond_12

    .line 313
    .line 314
    goto/16 :goto_12

    .line 315
    .line 316
    :cond_12
    invoke-virtual {v1}, Lpy0;->c()Z

    .line 317
    .line 318
    .line 319
    move-result v9

    .line 320
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 321
    .line 322
    invoke-virtual {v1}, Lpy0;->d()Z

    .line 323
    .line 324
    .line 325
    move-result v10

    .line 326
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 327
    .line 328
    if-nez v1, :cond_13

    .line 329
    .line 330
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    iput-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 335
    .line 336
    :cond_13
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 341
    .line 342
    .line 343
    move-result v5

    .line 344
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView;->x0:[I

    .line 345
    .line 346
    if-nez v1, :cond_14

    .line 347
    .line 348
    aput v7, v11, v8

    .line 349
    .line 350
    aput v7, v11, v7

    .line 351
    .line 352
    :cond_14
    invoke-static {v6}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 353
    .line 354
    .line 355
    move-result-object v12

    .line 356
    aget v13, v11, v7

    .line 357
    .line 358
    int-to-float v13, v13

    .line 359
    aget v14, v11, v8

    .line 360
    .line 361
    int-to-float v14, v14

    .line 362
    invoke-virtual {v12, v13, v14}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 363
    .line 364
    .line 365
    const/high16 v13, 0x3f000000    # 0.5f

    .line 366
    .line 367
    if-eqz v1, :cond_37

    .line 368
    .line 369
    if-eq v1, v8, :cond_26

    .line 370
    .line 371
    if-eq v1, v3, :cond_18

    .line 372
    .line 373
    if-eq v1, v2, :cond_17

    .line 374
    .line 375
    const/4 v2, 0x5

    .line 376
    if-eq v1, v2, :cond_16

    .line 377
    .line 378
    const/4 v2, 0x6

    .line 379
    if-eq v1, v2, :cond_15

    .line 380
    .line 381
    goto/16 :goto_10

    .line 382
    .line 383
    :cond_15
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView;->O(Landroid/view/MotionEvent;)V

    .line 384
    .line 385
    .line 386
    goto/16 :goto_10

    .line 387
    .line 388
    :cond_16
    invoke-virtual {v6, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 389
    .line 390
    .line 391
    move-result v1

    .line 392
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 393
    .line 394
    invoke-virtual {v6, v5}, Landroid/view/MotionEvent;->getX(I)F

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    add-float/2addr v1, v13

    .line 399
    float-to-int v1, v1

    .line 400
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 401
    .line 402
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 403
    .line 404
    invoke-virtual {v6, v5}, Landroid/view/MotionEvent;->getY(I)F

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    add-float/2addr v1, v13

    .line 409
    float-to-int v1, v1

    .line 410
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 411
    .line 412
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 413
    .line 414
    goto/16 :goto_10

    .line 415
    .line 416
    :cond_17
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->U()V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 420
    .line 421
    .line 422
    goto/16 :goto_10

    .line 423
    .line 424
    :cond_18
    iget v1, v0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 425
    .line 426
    invoke-virtual {v6, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    if-gez v1, :cond_19

    .line 431
    .line 432
    goto/16 :goto_12

    .line 433
    .line 434
    :cond_19
    invoke-virtual {v6, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 435
    .line 436
    .line 437
    move-result v2

    .line 438
    add-float/2addr v2, v13

    .line 439
    float-to-int v14, v2

    .line 440
    invoke-virtual {v6, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    add-float/2addr v1, v13

    .line 445
    float-to-int v13, v1

    .line 446
    iget v1, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 447
    .line 448
    sub-int/2addr v1, v14

    .line 449
    iget v2, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 450
    .line 451
    sub-int/2addr v2, v13

    .line 452
    iget v3, v0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 453
    .line 454
    if-eq v3, v8, :cond_1e

    .line 455
    .line 456
    if-eqz v9, :cond_1b

    .line 457
    .line 458
    iget v3, v0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 459
    .line 460
    if-lez v1, :cond_1a

    .line 461
    .line 462
    sub-int/2addr v1, v3

    .line 463
    invoke-static {v7, v1}, Ljava/lang/Math;->max(II)I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    goto :goto_4

    .line 468
    :cond_1a
    add-int/2addr v1, v3

    .line 469
    invoke-static {v7, v1}, Ljava/lang/Math;->min(II)I

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    :goto_4
    if-eqz v1, :cond_1b

    .line 474
    .line 475
    move v3, v8

    .line 476
    goto :goto_5

    .line 477
    :cond_1b
    move v3, v7

    .line 478
    :goto_5
    if-eqz v10, :cond_1d

    .line 479
    .line 480
    iget v4, v0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 481
    .line 482
    if-lez v2, :cond_1c

    .line 483
    .line 484
    sub-int/2addr v2, v4

    .line 485
    invoke-static {v7, v2}, Ljava/lang/Math;->max(II)I

    .line 486
    .line 487
    .line 488
    move-result v2

    .line 489
    goto :goto_6

    .line 490
    :cond_1c
    add-int/2addr v2, v4

    .line 491
    invoke-static {v7, v2}, Ljava/lang/Math;->min(II)I

    .line 492
    .line 493
    .line 494
    move-result v2

    .line 495
    :goto_6
    if-eqz v2, :cond_1d

    .line 496
    .line 497
    move v3, v8

    .line 498
    :cond_1d
    if-eqz v3, :cond_1e

    .line 499
    .line 500
    invoke-virtual {v0, v8}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 501
    .line 502
    .line 503
    :cond_1e
    move v15, v1

    .line 504
    move/from16 v16, v2

    .line 505
    .line 506
    iget v1, v0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 507
    .line 508
    if-ne v1, v8, :cond_39

    .line 509
    .line 510
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->y0:[I

    .line 511
    .line 512
    aput v7, v3, v7

    .line 513
    .line 514
    aput v7, v3, v8

    .line 515
    .line 516
    if-eqz v9, :cond_1f

    .line 517
    .line 518
    move v1, v15

    .line 519
    goto :goto_7

    .line 520
    :cond_1f
    move v1, v7

    .line 521
    :goto_7
    if-eqz v10, :cond_20

    .line 522
    .line 523
    move/from16 v2, v16

    .line 524
    .line 525
    goto :goto_8

    .line 526
    :cond_20
    move v2, v7

    .line 527
    :goto_8
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->w0:[I

    .line 528
    .line 529
    const/4 v5, 0x0

    .line 530
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView;->p(II[I[II)Z

    .line 531
    .line 532
    .line 533
    move-result v1

    .line 534
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->w0:[I

    .line 535
    .line 536
    if-eqz v1, :cond_21

    .line 537
    .line 538
    aget v1, v3, v7

    .line 539
    .line 540
    sub-int/2addr v15, v1

    .line 541
    aget v1, v3, v8

    .line 542
    .line 543
    sub-int v16, v16, v1

    .line 544
    .line 545
    aget v1, v11, v7

    .line 546
    .line 547
    aget v3, v2, v7

    .line 548
    .line 549
    add-int/2addr v1, v3

    .line 550
    aput v1, v11, v7

    .line 551
    .line 552
    aget v1, v11, v8

    .line 553
    .line 554
    aget v3, v2, v8

    .line 555
    .line 556
    add-int/2addr v1, v3

    .line 557
    aput v1, v11, v8

    .line 558
    .line 559
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    invoke-interface {v1, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 564
    .line 565
    .line 566
    :cond_21
    move/from16 v1, v16

    .line 567
    .line 568
    aget v3, v2, v7

    .line 569
    .line 570
    sub-int/2addr v14, v3

    .line 571
    iput v14, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 572
    .line 573
    aget v2, v2, v8

    .line 574
    .line 575
    sub-int/2addr v13, v2

    .line 576
    iput v13, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 577
    .line 578
    if-eqz v9, :cond_22

    .line 579
    .line 580
    move v2, v15

    .line 581
    goto :goto_9

    .line 582
    :cond_22
    move v2, v7

    .line 583
    :goto_9
    if-eqz v10, :cond_23

    .line 584
    .line 585
    move v7, v1

    .line 586
    :cond_23
    invoke-virtual {v0, v2, v7, v6}, Landroidx/recyclerview/widget/RecyclerView;->V(IILandroid/view/MotionEvent;)Z

    .line 587
    .line 588
    .line 589
    move-result v2

    .line 590
    if-eqz v2, :cond_24

    .line 591
    .line 592
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 593
    .line 594
    .line 595
    move-result-object v2

    .line 596
    invoke-interface {v2, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 597
    .line 598
    .line 599
    :cond_24
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->k0:Lu90;

    .line 600
    .line 601
    if-eqz v2, :cond_39

    .line 602
    .line 603
    if-nez v15, :cond_25

    .line 604
    .line 605
    if-eqz v1, :cond_39

    .line 606
    .line 607
    :cond_25
    invoke-virtual {v2, v0, v15, v1}, Lu90;->a(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 608
    .line 609
    .line 610
    goto/16 :goto_10

    .line 611
    .line 612
    :cond_26
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 613
    .line 614
    invoke-virtual {v1, v12}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 615
    .line 616
    .line 617
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 618
    .line 619
    const/16 v2, 0x3e8

    .line 620
    .line 621
    iget v5, v0, Landroidx/recyclerview/widget/RecyclerView;->f0:I

    .line 622
    .line 623
    int-to-float v6, v5

    .line 624
    invoke-virtual {v1, v2, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 625
    .line 626
    .line 627
    if-eqz v9, :cond_27

    .line 628
    .line 629
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 630
    .line 631
    iget v2, v0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 632
    .line 633
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    neg-float v1, v1

    .line 638
    goto :goto_a

    .line 639
    :cond_27
    move v1, v4

    .line 640
    :goto_a
    if-eqz v10, :cond_28

    .line 641
    .line 642
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 643
    .line 644
    iget v6, v0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 645
    .line 646
    invoke-virtual {v2, v6}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 647
    .line 648
    .line 649
    move-result v2

    .line 650
    neg-float v2, v2

    .line 651
    goto :goto_b

    .line 652
    :cond_28
    move v2, v4

    .line 653
    :goto_b
    cmpl-float v6, v1, v4

    .line 654
    .line 655
    if-nez v6, :cond_29

    .line 656
    .line 657
    cmpl-float v4, v2, v4

    .line 658
    .line 659
    if-eqz v4, :cond_36

    .line 660
    .line 661
    :cond_29
    float-to-int v1, v1

    .line 662
    float-to-int v2, v2

    .line 663
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 664
    .line 665
    if-nez v4, :cond_2a

    .line 666
    .line 667
    goto/16 :goto_e

    .line 668
    .line 669
    :cond_2a
    iget-boolean v6, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 670
    .line 671
    if-eqz v6, :cond_2b

    .line 672
    .line 673
    goto/16 :goto_e

    .line 674
    .line 675
    :cond_2b
    invoke-virtual {v4}, Lpy0;->c()Z

    .line 676
    .line 677
    .line 678
    move-result v4

    .line 679
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 680
    .line 681
    invoke-virtual {v6}, Lpy0;->d()Z

    .line 682
    .line 683
    .line 684
    move-result v6

    .line 685
    iget v9, v0, Landroidx/recyclerview/widget/RecyclerView;->e0:I

    .line 686
    .line 687
    if-eqz v4, :cond_2c

    .line 688
    .line 689
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 690
    .line 691
    .line 692
    move-result v10

    .line 693
    if-ge v10, v9, :cond_2d

    .line 694
    .line 695
    :cond_2c
    move v1, v7

    .line 696
    :cond_2d
    if-eqz v6, :cond_2e

    .line 697
    .line 698
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 699
    .line 700
    .line 701
    move-result v10

    .line 702
    if-ge v10, v9, :cond_2f

    .line 703
    .line 704
    :cond_2e
    move v2, v7

    .line 705
    :cond_2f
    if-nez v1, :cond_30

    .line 706
    .line 707
    if-nez v2, :cond_30

    .line 708
    .line 709
    goto/16 :goto_e

    .line 710
    .line 711
    :cond_30
    int-to-float v9, v1

    .line 712
    int-to-float v10, v2

    .line 713
    invoke-virtual {v0, v9, v10}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedPreFling(FF)Z

    .line 714
    .line 715
    .line 716
    move-result v11

    .line 717
    if-nez v11, :cond_36

    .line 718
    .line 719
    if-nez v4, :cond_32

    .line 720
    .line 721
    if-eqz v6, :cond_31

    .line 722
    .line 723
    goto :goto_c

    .line 724
    :cond_31
    move v11, v7

    .line 725
    goto :goto_d

    .line 726
    :cond_32
    :goto_c
    move v11, v8

    .line 727
    :goto_d
    invoke-virtual {v0, v9, v10, v11}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedFling(FFZ)Z

    .line 728
    .line 729
    .line 730
    if-eqz v11, :cond_36

    .line 731
    .line 732
    if-eqz v6, :cond_33

    .line 733
    .line 734
    or-int/lit8 v4, v4, 0x2

    .line 735
    .line 736
    :cond_33
    invoke-direct {v0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 737
    .line 738
    .line 739
    move-result-object v6

    .line 740
    invoke-virtual {v6, v4, v8}, Lgp0;->f(II)Z

    .line 741
    .line 742
    .line 743
    neg-int v4, v5

    .line 744
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 745
    .line 746
    .line 747
    move-result v1

    .line 748
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    .line 749
    .line 750
    .line 751
    move-result v16

    .line 752
    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    .line 753
    .line 754
    .line 755
    move-result v1

    .line 756
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    .line 757
    .line 758
    .line 759
    move-result v17

    .line 760
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 761
    .line 762
    iget-object v2, v1, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 763
    .line 764
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 765
    .line 766
    .line 767
    iput v7, v1, Lbz0;->k:I

    .line 768
    .line 769
    iput v7, v1, Lbz0;->j:I

    .line 770
    .line 771
    iget-object v3, v1, Lbz0;->m:Landroid/view/animation/Interpolator;

    .line 772
    .line 773
    sget-object v4, Landroidx/recyclerview/widget/RecyclerView;->E0:Ley0;

    .line 774
    .line 775
    if-eq v3, v4, :cond_34

    .line 776
    .line 777
    iput-object v4, v1, Lbz0;->m:Landroid/view/animation/Interpolator;

    .line 778
    .line 779
    new-instance v3, Landroid/widget/OverScroller;

    .line 780
    .line 781
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 782
    .line 783
    .line 784
    move-result-object v2

    .line 785
    invoke-direct {v3, v2, v4}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 786
    .line 787
    .line 788
    iput-object v3, v1, Lbz0;->l:Landroid/widget/OverScroller;

    .line 789
    .line 790
    :cond_34
    iget-object v13, v1, Lbz0;->l:Landroid/widget/OverScroller;

    .line 791
    .line 792
    const/high16 v20, -0x80000000

    .line 793
    .line 794
    const v21, 0x7fffffff

    .line 795
    .line 796
    .line 797
    const/4 v14, 0x0

    .line 798
    const/4 v15, 0x0

    .line 799
    const/high16 v18, -0x80000000

    .line 800
    .line 801
    const v19, 0x7fffffff

    .line 802
    .line 803
    .line 804
    invoke-virtual/range {v13 .. v21}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    .line 805
    .line 806
    .line 807
    iget-boolean v2, v1, Lbz0;->n:Z

    .line 808
    .line 809
    if-eqz v2, :cond_35

    .line 810
    .line 811
    iput-boolean v8, v1, Lbz0;->o:Z

    .line 812
    .line 813
    goto :goto_f

    .line 814
    :cond_35
    iget-object v2, v1, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 815
    .line 816
    invoke-virtual {v2, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 817
    .line 818
    .line 819
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 820
    .line 821
    invoke-virtual {v2, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 822
    .line 823
    .line 824
    goto :goto_f

    .line 825
    :cond_36
    :goto_e
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 826
    .line 827
    .line 828
    :goto_f
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->U()V

    .line 829
    .line 830
    .line 831
    goto :goto_11

    .line 832
    :cond_37
    invoke-virtual {v6, v7}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 833
    .line 834
    .line 835
    move-result v1

    .line 836
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->U:I

    .line 837
    .line 838
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getX()F

    .line 839
    .line 840
    .line 841
    move-result v1

    .line 842
    add-float/2addr v1, v13

    .line 843
    float-to-int v1, v1

    .line 844
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:I

    .line 845
    .line 846
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    .line 847
    .line 848
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getY()F

    .line 849
    .line 850
    .line 851
    move-result v1

    .line 852
    add-float/2addr v1, v13

    .line 853
    float-to-int v1, v1

    .line 854
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->c0:I

    .line 855
    .line 856
    iput v1, v0, Landroidx/recyclerview/widget/RecyclerView;->a0:I

    .line 857
    .line 858
    if-eqz v10, :cond_38

    .line 859
    .line 860
    or-int/lit8 v9, v9, 0x2

    .line 861
    .line 862
    :cond_38
    invoke-direct {v0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 863
    .line 864
    .line 865
    move-result-object v1

    .line 866
    invoke-virtual {v1, v9, v7}, Lgp0;->f(II)Z

    .line 867
    .line 868
    .line 869
    :cond_39
    :goto_10
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->V:Landroid/view/VelocityTracker;

    .line 870
    .line 871
    invoke-virtual {v0, v12}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 872
    .line 873
    .line 874
    :goto_11
    invoke-virtual {v12}, Landroid/view/MotionEvent;->recycle()V

    .line 875
    .line 876
    .line 877
    return v8

    .line 878
    :cond_3a
    :goto_12
    return v7
.end method

.method public final p(II[I[II)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual/range {p0 .. p5}, Lgp0;->b(II[I[II)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final q(IIII[II[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual/range {p0 .. p7}, Lgp0;->c(IIII[II[I)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final r(II)V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int p1, v0, p1

    .line 16
    .line 17
    sub-int p2, v1, p2

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/view/View;->onScrollChanged(IIII)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->n0:Lsy0;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lsy0;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->o0:Ljava/util/ArrayList;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    add-int/lit8 p1, p1, -0x1

    .line 38
    .line 39
    :goto_0
    if-ltz p1, :cond_1

    .line 40
    .line 41
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView;->o0:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Lsy0;

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lsy0;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 p1, p1, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 56
    .line 57
    add-int/lit8 p1, p1, -0x1

    .line 58
    .line 59
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->M:I

    .line 60
    .line 61
    return-void
.end method

.method public final removeDetachedView(Landroid/view/View;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Lmu0;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget v1, v0, Lmu0;->j:I

    .line 14
    .line 15
    and-int/lit16 v1, v1, -0x101

    .line 16
    .line 17
    iput v1, v0, Lmu0;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Lmu0;->p()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 28
    .line 29
    new-instance p2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "Called removeDetachedView with a view which is not flagged as tmp detached."

    .line 32
    .line 33
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p1

    .line 54
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 62
    .line 63
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->removeDetachedView(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v1, p0

    .line 5
    move-object v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move v4, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Lpy0;->f0(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final requestDisallowInterceptTouchEvent(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->x:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    check-cast v3, Ls20;

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final requestLayout()V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->C:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 15
    .line 16
    return-void
.end method

.method public final s()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 21
    .line 22
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v1, v2

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v1, v2

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v2, v3

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    sub-int/2addr v2, p0

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, v1, p0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final scrollBy(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    invoke-virtual {v0}, Lpy0;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 16
    .line 17
    invoke-virtual {v1}, Lpy0;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    :goto_0
    return-void

    .line 27
    :cond_3
    :goto_1
    const/4 v2, 0x0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_4
    move p1, v2

    .line 32
    :goto_2
    if-eqz v1, :cond_5

    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_5
    move p2, v2

    .line 36
    :goto_3
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->V(IILandroid/view/MotionEvent;)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final scrollTo(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public final sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getContentChangeTypes()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move p1, v0

    .line 16
    :goto_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move v0, p1

    .line 20
    :goto_1
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView;->G:I

    .line 21
    .line 22
    or-int/2addr p1, v0

    .line 23
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->G:I

    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setAccessibilityDelegateCompat(Ldz0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->t0:Ldz0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lzh1;->i(Landroid/view/View;Lc1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAdapter(Lhy0;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutFrozen(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 6
    .line 7
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->j:Lxy0;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Lhy0;->a:Liy0;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/database/Observable;->unregisterObserver(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lly0;->e()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 29
    .line 30
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Lpy0;->b0(Lvy0;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 38
    .line 39
    invoke-virtual {v1, v3}, Lpy0;->c0(Lvy0;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object v1, v3, Lvy0;->a:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Lvy0;->d()V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Ls3;

    .line 51
    .line 52
    iget-object v4, v1, Ls3;->c:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v4, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 57
    .line 58
    .line 59
    iget-object v4, v1, Ls3;->d:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v4, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 64
    .line 65
    .line 66
    iput v0, v1, Ls3;->a:I

    .line 67
    .line 68
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 69
    .line 70
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 71
    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    iget-object p1, p1, Lhy0;->a:Liy0;

    .line 75
    .line 76
    invoke-virtual {p1, v2}, Landroid/database/Observable;->registerObserver(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 80
    .line 81
    iget-object v2, v3, Lvy0;->a:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3}, Lvy0;->d()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Lvy0;->c()Luy0;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const/4 v3, 0x1

    .line 94
    if-eqz v1, :cond_4

    .line 95
    .line 96
    iget v1, v2, Luy0;->b:I

    .line 97
    .line 98
    sub-int/2addr v1, v3

    .line 99
    iput v1, v2, Luy0;->b:I

    .line 100
    .line 101
    :cond_4
    iget v1, v2, Luy0;->b:I

    .line 102
    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    iget-object v1, v2, Luy0;->a:Landroid/util/SparseArray;

    .line 106
    .line 107
    move v4, v0

    .line 108
    :goto_0
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-ge v4, v5, :cond_5

    .line 113
    .line 114
    invoke-virtual {v1, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Lty0;

    .line 119
    .line 120
    iget-object v5, v5, Lty0;->a:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 123
    .line 124
    .line 125
    add-int/lit8 v4, v4, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    if-eqz p1, :cond_6

    .line 129
    .line 130
    iget p1, v2, Luy0;->b:I

    .line 131
    .line 132
    add-int/2addr p1, v3

    .line 133
    iput p1, v2, Luy0;->b:I

    .line 134
    .line 135
    :cond_6
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 136
    .line 137
    iput-boolean v3, p1, Lzy0;->e:Z

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->R(Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public setChildDrawingOrderCallback(Ljy0;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setClipToPadding(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 7
    .line 8
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 9
    .line 10
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 11
    .line 12
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 15
    .line 16
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->B:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public setEdgeEffectFactory(Lky0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->R:Landroid/widget/EdgeEffect;

    .line 8
    .line 9
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 10
    .line 11
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 14
    .line 15
    return-void
.end method

.method public setHasFixedSize(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->A:Z

    .line 2
    .line 3
    return-void
.end method

.method public setItemAnimator(Lly0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lly0;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-object v1, v0, Lly0;->a:Lgy0;

    .line 12
    .line 13
    :cond_0
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->r0:Lgy0;

    .line 18
    .line 19
    iput-object p0, p1, Lly0;->a:Lgy0;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public setItemViewCacheSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 2
    .line 3
    iput p1, p0, Lvy0;->e:I

    .line 4
    .line 5
    invoke-virtual {p0}, Lvy0;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setLayoutFrozen(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->suppressLayout(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setLayoutManager(Lpy0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 11
    .line 12
    iget-object v2, v1, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    iget-object v1, v1, Lbz0;->l:Landroid/widget/OverScroller;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 23
    .line 24
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 25
    .line 26
    if-eqz v1, :cond_3

    .line 27
    .line 28
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Lly0;->e()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lpy0;->b0(Lvy0;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lpy0;->c0(Lvy0;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v2, Lvy0;->a:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Lvy0;->d()V

    .line 51
    .line 52
    .line 53
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 58
    .line 59
    iput-boolean v0, v1, Lpy0;->f:Z

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Lpy0;->M(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-virtual {v1, v3}, Lpy0;->n0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 68
    .line 69
    .line 70
    iput-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    iget-object v1, v2, Lvy0;->a:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Lvy0;->d()V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 82
    .line 83
    iget-object v3, v1, Lc9;->l:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v3, Ldk;

    .line 86
    .line 87
    invoke-virtual {v3}, Ldk;->g()V

    .line 88
    .line 89
    .line 90
    iget-object v3, v1, Lc9;->m:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v3, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    const/4 v5, 0x1

    .line 99
    sub-int/2addr v4, v5

    .line 100
    :goto_1
    iget-object v6, v1, Lc9;->k:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v6, Lgy0;

    .line 103
    .line 104
    iget-object v6, v6, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 105
    .line 106
    if-ltz v4, :cond_6

    .line 107
    .line 108
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    check-cast v7, Landroid/view/View;

    .line 113
    .line 114
    invoke-static {v7}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    if-eqz v7, :cond_5

    .line 119
    .line 120
    iget v8, v7, Lmu0;->p:I

    .line 121
    .line 122
    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView;->J()Z

    .line 123
    .line 124
    .line 125
    move-result v9

    .line 126
    if-eqz v9, :cond_4

    .line 127
    .line 128
    iput v8, v7, Lmu0;->q:I

    .line 129
    .line 130
    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView;->z0:Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    iget-object v6, v7, Lmu0;->a:Landroid/view/View;

    .line 137
    .line 138
    sget-object v9, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 139
    .line 140
    invoke-virtual {v6, v8}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 141
    .line 142
    .line 143
    :goto_2
    iput v0, v7, Lmu0;->p:I

    .line 144
    .line 145
    :cond_5
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    add-int/lit8 v4, v4, -0x1

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_6
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    :goto_3
    if-ge v0, v1, :cond_7

    .line 156
    .line 157
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-static {v3}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    iget-object v7, v6, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 166
    .line 167
    invoke-virtual {v3}, Landroid/view/View;->clearAnimation()V

    .line 168
    .line 169
    .line 170
    add-int/lit8 v0, v0, 0x1

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_7
    invoke-virtual {v6}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 174
    .line 175
    .line 176
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 177
    .line 178
    if-eqz p1, :cond_9

    .line 179
    .line 180
    iget-object v0, p1, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 181
    .line 182
    if-nez v0, :cond_8

    .line 183
    .line 184
    invoke-virtual {p1, p0}, Lpy0;->n0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 185
    .line 186
    .line 187
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->z:Z

    .line 188
    .line 189
    if-eqz p1, :cond_9

    .line 190
    .line 191
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 192
    .line 193
    iput-boolean v5, p1, Lpy0;->f:Z

    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 197
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v1, "LayoutManager "

    .line 201
    .line 202
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object p1, p1, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 209
    .line 210
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->w()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    const-string v1, " is already attached to a RecyclerView:"

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    throw p0

    .line 230
    :cond_9
    :goto_4
    invoke-virtual {v2}, Lvy0;->k()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public setLayoutTransition(Landroid/animation/LayoutTransition;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "Providing a LayoutTransition into RecyclerView is not supported. Please use setItemAnimator() instead for animating changes to the items in this RecyclerView"

    .line 9
    .line 10
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean v0, p0, Lgp0;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 10
    .line 11
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 12
    .line 13
    invoke-static {v0}, Loh1;->z(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-boolean p1, p0, Lgp0;->d:Z

    .line 17
    .line 18
    return-void
.end method

.method public setOnFlingListener(Lry0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setOnScrollListener(Lsy0;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->n0:Lsy0;

    .line 2
    .line 3
    return-void
.end method

.method public setPreserveFocusAfterLayout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->i0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRecycledViewPool(Luy0;)V
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 2
    .line 3
    iget-object v0, p0, Lvy0;->g:Luy0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, v0, Luy0;->b:I

    .line 8
    .line 9
    add-int/lit8 v1, v1, -0x1

    .line 10
    .line 11
    iput v1, v0, Luy0;->b:I

    .line 12
    .line 13
    :cond_0
    iput-object p1, p0, Lvy0;->g:Luy0;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lvy0;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Lhy0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lvy0;->g:Luy0;

    .line 26
    .line 27
    iget p1, p0, Luy0;->b:I

    .line 28
    .line 29
    add-int/lit8 p1, p1, 0x1

    .line 30
    .line 31
    iput p1, p0, Luy0;->b:I

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public setRecyclerListener(Lwy0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setScrollState(I)V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->T:I

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 12
    .line 13
    iget-object v1, v0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, v0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lpy0;->a0(I)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->o0:Ljava/util/ArrayList;

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    add-int/lit8 p1, p1, -0x1

    .line 39
    .line 40
    :goto_0
    if-ltz p1, :cond_3

    .line 41
    .line 42
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->o0:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lsy0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    add-int/lit8 p1, p1, -0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method public setScrollingTouchSlop(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p1, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView;->d0:I

    .line 24
    .line 25
    return-void
.end method

.method public setViewCacheExtension(Laz0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final startNestedScroll(I)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lgp0;->f(II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final stopNestedScroll()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollingChildHelper()Lgp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lgp0;->g(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final suppressLayout(Z)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    const-string v0, "Do not suppressLayout in layout or scroll"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 14
    .line 15
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->D:Z

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    const/4 v7, 0x0

    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v5, 0x3

    .line 40
    const/4 v6, 0x0

    .line 41
    move-wide v3, v1

    .line 42
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 47
    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->E:Z

    .line 51
    .line 52
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView;->F:Z

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 58
    .line 59
    iget-object p1, p0, Lbz0;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->O:Landroid/widget/EdgeEffect;

    .line 21
    .line 22
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v1, v2

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v1, v2

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v2, v3

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    sub-int/2addr v2, p0

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, v1, p0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final u()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->Q:Landroid/widget/EdgeEffect;

    .line 21
    .line 22
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v1, v2

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v1, v2

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v2, v3

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    sub-int/2addr v2, p0

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, v1, p0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final v()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->N:Lky0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/widget/EdgeEffect;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->P:Landroid/widget/EdgeEffect;

    .line 21
    .line 22
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v1, v2

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v1, v2

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v2, v3

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    sub-int/2addr v2, p0

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, v1, p0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final w()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ", adapter:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->u:Lhy0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ", layout:"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", context:"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public final x(Lzy0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->j0:Lbz0;

    .line 9
    .line 10
    iget-object p0, p0, Lbz0;->l:Landroid/widget/OverScroller;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getFinalY()I

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getCurrY()I

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final y(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eq v0, p0, :cond_0

    .line 8
    .line 9
    instance-of v1, v0, Landroid/view/View;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    move-object p1, v0

    .line 14
    check-cast p1, Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    if-ne v0, p0, :cond_1

    .line 22
    .line 23
    return-object p1

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public final z(Landroid/view/MotionEvent;)Z
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->x:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-ge v4, v2, :cond_5

    .line 14
    .line 15
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    check-cast v5, Ls20;

    .line 20
    .line 21
    iget v6, v5, Ls20;->v:I

    .line 22
    .line 23
    const/4 v7, 0x1

    .line 24
    const/4 v8, 0x2

    .line 25
    if-ne v6, v7, :cond_3

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v9

    .line 35
    invoke-virtual {v5, v6, v9}, Ls20;->d(FF)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 40
    .line 41
    .line 42
    move-result v9

    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 44
    .line 45
    .line 46
    move-result v10

    .line 47
    invoke-virtual {v5, v9, v10}, Ls20;->c(FF)Z

    .line 48
    .line 49
    .line 50
    move-result v9

    .line 51
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 52
    .line 53
    .line 54
    move-result v10

    .line 55
    if-nez v10, :cond_4

    .line 56
    .line 57
    if-nez v6, :cond_0

    .line 58
    .line 59
    if-eqz v9, :cond_4

    .line 60
    .line 61
    :cond_0
    if-eqz v9, :cond_1

    .line 62
    .line 63
    iput v7, v5, Ls20;->w:I

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    float-to-int v6, v6

    .line 70
    int-to-float v6, v6

    .line 71
    iput v6, v5, Ls20;->p:F

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    if-eqz v6, :cond_2

    .line 75
    .line 76
    iput v8, v5, Ls20;->w:I

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    float-to-int v6, v6

    .line 83
    int-to-float v6, v6

    .line 84
    iput v6, v5, Ls20;->m:F

    .line 85
    .line 86
    :cond_2
    :goto_1
    invoke-virtual {v5, v8}, Ls20;->f(I)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    if-ne v6, v8, :cond_4

    .line 91
    .line 92
    :goto_2
    const/4 v6, 0x3

    .line 93
    if-eq v0, v6, :cond_4

    .line 94
    .line 95
    iput-object v5, p0, Landroidx/recyclerview/widget/RecyclerView;->y:Ls20;

    .line 96
    .line 97
    return v7

    .line 98
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_5
    return v3
.end method
