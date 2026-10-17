.class public final Ln70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/LayoutInflater$Factory2;


# instance fields
.field public final j:Lz70;


# direct methods
.method public constructor <init>(Lz70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln70;->j:Lz70;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 10

    .line 1
    const-class v0, Ll70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ln70;->j:Lz70;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ll70;

    .line 16
    .line 17
    invoke-direct {p0, p3, p4, v1}, Ll70;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lz70;)V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string v0, "fragment"

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v0, 0x0

    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    goto/16 :goto_7

    .line 31
    .line 32
    :cond_1
    const-string p2, "class"

    .line 33
    .line 34
    invoke-interface {p4, v0, p2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget-object v2, Lcx0;->a:[I

    .line 39
    .line 40
    invoke-virtual {p3, p4, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const/4 v3, 0x0

    .line 45
    if-nez p2, :cond_2

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    :cond_2
    const/4 v4, 0x1

    .line 52
    const/4 v5, -0x1

    .line 53
    invoke-virtual {v2, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    const/4 v7, 0x2

    .line 58
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    .line 64
    .line 65
    if-eqz p2, :cond_15

    .line 66
    .line 67
    invoke-virtual {p3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    :try_start_0
    invoke-static {v2, p2}, Lt70;->b(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-class v9, Lh70;

    .line 76
    .line 77
    invoke-virtual {v9, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 78
    .line 79
    .line 80
    move-result v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    goto :goto_0

    .line 82
    :catch_0
    move v2, v3

    .line 83
    :goto_0
    if-nez v2, :cond_3

    .line 84
    .line 85
    goto/16 :goto_7

    .line 86
    .line 87
    :cond_3
    if-eqz p1, :cond_4

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    :cond_4
    if-ne v3, v5, :cond_6

    .line 94
    .line 95
    if-ne v6, v5, :cond_6

    .line 96
    .line 97
    if-eqz v8, :cond_5

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 101
    .line 102
    invoke-interface {p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance p3, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string p1, ": Must specify unique android:id, android:tag, or have a parent with an id for "

    .line 115
    .line 116
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw p0

    .line 130
    :cond_6
    :goto_1
    if-eq v6, v5, :cond_7

    .line 131
    .line 132
    invoke-virtual {v1, v6}, Lz70;->A(I)Lh70;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    goto :goto_2

    .line 137
    :cond_7
    move-object v2, v0

    .line 138
    :goto_2
    if-nez v2, :cond_8

    .line 139
    .line 140
    if-eqz v8, :cond_8

    .line 141
    .line 142
    invoke-virtual {v1, v8}, Lz70;->B(Ljava/lang/String;)Lh70;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    :cond_8
    if-nez v2, :cond_9

    .line 147
    .line 148
    if-eq v3, v5, :cond_9

    .line 149
    .line 150
    invoke-virtual {v1, v3}, Lz70;->A(I)Lh70;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    :cond_9
    if-nez v2, :cond_d

    .line 155
    .line 156
    invoke-virtual {v1}, Lz70;->D()Lt70;

    .line 157
    .line 158
    .line 159
    move-result-object p4

    .line 160
    invoke-virtual {p3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p4, p2}, Lt70;->a(Ljava/lang/String;)Lh70;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    iput-boolean v4, v2, Lh70;->v:Z

    .line 168
    .line 169
    if-eqz v6, :cond_a

    .line 170
    .line 171
    move p3, v6

    .line 172
    goto :goto_3

    .line 173
    :cond_a
    move p3, v3

    .line 174
    :goto_3
    iput p3, v2, Lh70;->E:I

    .line 175
    .line 176
    iput v3, v2, Lh70;->F:I

    .line 177
    .line 178
    iput-object v8, v2, Lh70;->G:Ljava/lang/String;

    .line 179
    .line 180
    iput-boolean v4, v2, Lh70;->w:Z

    .line 181
    .line 182
    iput-object v1, v2, Lh70;->A:Lz70;

    .line 183
    .line 184
    iget-object p3, v1, Lz70;->t:Lj70;

    .line 185
    .line 186
    iput-object p3, v2, Lh70;->B:Lj70;

    .line 187
    .line 188
    iget-object p4, p3, Lj70;->y:Le6;

    .line 189
    .line 190
    iput-boolean v4, v2, Lh70;->L:Z

    .line 191
    .line 192
    if-nez p3, :cond_b

    .line 193
    .line 194
    move-object p3, v0

    .line 195
    goto :goto_4

    .line 196
    :cond_b
    iget-object p3, p3, Lj70;->x:Le6;

    .line 197
    .line 198
    :goto_4
    if-eqz p3, :cond_c

    .line 199
    .line 200
    iput-boolean v4, v2, Lh70;->L:Z

    .line 201
    .line 202
    :cond_c
    invoke-virtual {v1, v2}, Lz70;->a(Lh70;)Landroidx/fragment/app/a;

    .line 203
    .line 204
    .line 205
    move-result-object p3

    .line 206
    invoke-static {v7}, Lz70;->F(I)Z

    .line 207
    .line 208
    .line 209
    move-result p4

    .line 210
    if-eqz p4, :cond_10

    .line 211
    .line 212
    invoke-virtual {v2}, Lh70;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    goto :goto_6

    .line 219
    :cond_d
    iget-boolean p3, v2, Lh70;->w:Z

    .line 220
    .line 221
    if-nez p3, :cond_14

    .line 222
    .line 223
    iput-boolean v4, v2, Lh70;->w:Z

    .line 224
    .line 225
    iput-object v1, v2, Lh70;->A:Lz70;

    .line 226
    .line 227
    iget-object p3, v1, Lz70;->t:Lj70;

    .line 228
    .line 229
    iput-object p3, v2, Lh70;->B:Lj70;

    .line 230
    .line 231
    iget-object p4, p3, Lj70;->y:Le6;

    .line 232
    .line 233
    iput-boolean v4, v2, Lh70;->L:Z

    .line 234
    .line 235
    if-nez p3, :cond_e

    .line 236
    .line 237
    move-object p3, v0

    .line 238
    goto :goto_5

    .line 239
    :cond_e
    iget-object p3, p3, Lj70;->x:Le6;

    .line 240
    .line 241
    :goto_5
    if-eqz p3, :cond_f

    .line 242
    .line 243
    iput-boolean v4, v2, Lh70;->L:Z

    .line 244
    .line 245
    :cond_f
    invoke-virtual {v1, v2}, Lz70;->f(Lh70;)Landroidx/fragment/app/a;

    .line 246
    .line 247
    .line 248
    move-result-object p3

    .line 249
    invoke-static {v7}, Lz70;->F(I)Z

    .line 250
    .line 251
    .line 252
    move-result p4

    .line 253
    if-eqz p4, :cond_10

    .line 254
    .line 255
    invoke-virtual {v2}, Lh70;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    :cond_10
    :goto_6
    check-cast p1, Landroid/view/ViewGroup;

    .line 262
    .line 263
    sget-object p4, Lh80;->a:Lg80;

    .line 264
    .line 265
    new-instance p4, Ld80;

    .line 266
    .line 267
    new-instance v1, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v3, "Attempting to use <fragment> tag to add fragment "

    .line 270
    .line 271
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v3, " to container "

    .line 278
    .line 279
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    invoke-direct {p4, v2, v1}, Lti1;-><init>(Lh70;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-static {p4}, Lh80;->b(Lti1;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v2}, Lh80;->a(Lh70;)Lg80;

    .line 296
    .line 297
    .line 298
    move-result-object p4

    .line 299
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 300
    .line 301
    .line 302
    iput-object p1, v2, Lh70;->M:Landroid/view/ViewGroup;

    .line 303
    .line 304
    invoke-virtual {p3}, Landroidx/fragment/app/a;->k()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p3}, Landroidx/fragment/app/a;->j()V

    .line 308
    .line 309
    .line 310
    iget-object p1, v2, Lh70;->N:Landroid/view/View;

    .line 311
    .line 312
    if-eqz p1, :cond_13

    .line 313
    .line 314
    if-eqz v6, :cond_11

    .line 315
    .line 316
    invoke-virtual {p1, v6}, Landroid/view/View;->setId(I)V

    .line 317
    .line 318
    .line 319
    :cond_11
    iget-object p1, v2, Lh70;->N:Landroid/view/View;

    .line 320
    .line 321
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    if-nez p1, :cond_12

    .line 326
    .line 327
    iget-object p1, v2, Lh70;->N:Landroid/view/View;

    .line 328
    .line 329
    invoke-virtual {p1, v8}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    :cond_12
    iget-object p1, v2, Lh70;->N:Landroid/view/View;

    .line 333
    .line 334
    new-instance p2, Lm70;

    .line 335
    .line 336
    invoke-direct {p2, p0, p3}, Lm70;-><init>(Ln70;Landroidx/fragment/app/a;)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {p1, p2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 340
    .line 341
    .line 342
    iget-object p0, v2, Lh70;->N:Landroid/view/View;

    .line 343
    .line 344
    return-object p0

    .line 345
    :cond_13
    const-string p0, "Fragment "

    .line 346
    .line 347
    const-string p1, " did not create a view."

    .line 348
    .line 349
    invoke-static {p0, p2, p1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    return-object v0

    .line 357
    :cond_14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 358
    .line 359
    invoke-interface {p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p3

    .line 367
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p4

    .line 371
    new-instance v0, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    const-string p1, ": Duplicate id 0x"

    .line 380
    .line 381
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string p1, ", tag "

    .line 388
    .line 389
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    const-string p1, ", or parent id 0x"

    .line 396
    .line 397
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    const-string p1, " with another fragment for "

    .line 404
    .line 405
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    throw p0

    .line 419
    :cond_15
    :goto_7
    return-object v0
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 420
    invoke-virtual {p0, v0, p1, p2, p3}, Ln70;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
