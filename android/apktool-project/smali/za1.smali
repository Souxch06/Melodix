.class public final Lza1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A:Ljava/lang/CharSequence;

.field public B:Ljava/lang/CharSequence;

.field public C:Landroid/content/res/ColorStateList;

.field public D:Landroid/graphics/PorterDuff$Mode;

.field public final synthetic E:Lab1;

.field public final a:Landroid/view/Menu;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Ljava/lang/CharSequence;

.field public l:Ljava/lang/CharSequence;

.field public m:I

.field public n:C

.field public o:I

.field public p:C

.field public q:I

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Lwm0;


# direct methods
.method public constructor <init>(Lab1;Landroid/view/Menu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lza1;->E:Lab1;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lza1;->C:Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    iput-object p1, p0, Lza1;->D:Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    iput-object p2, p0, Lza1;->a:Landroid/view/Menu;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lza1;->b:I

    .line 15
    .line 16
    iput p1, p0, Lza1;->c:I

    .line 17
    .line 18
    iput p1, p0, Lza1;->d:I

    .line 19
    .line 20
    iput p1, p0, Lza1;->e:I

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lza1;->f:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Lza1;->g:Z

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lza1;->E:Lab1;

    .line 2
    .line 3
    iget-object p0, p0, Lab1;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return-object p0

    .line 27
    :catch_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final b(Landroid/view/MenuItem;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lza1;->E:Lab1;

    .line 2
    .line 3
    iget-object v1, v0, Lab1;->c:Landroid/content/Context;

    .line 4
    .line 5
    iget-boolean v2, p0, Lza1;->s:Z

    .line 6
    .line 7
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-boolean v3, p0, Lza1;->t:Z

    .line 12
    .line 13
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-boolean v3, p0, Lza1;->u:Z

    .line 18
    .line 19
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget v3, p0, Lza1;->r:I

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x1

    .line 27
    if-lt v3, v5, :cond_0

    .line 28
    .line 29
    move v3, v5

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v3, v4

    .line 32
    :goto_0
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lza1;->l:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget v3, p0, Lza1;->m:I

    .line 43
    .line 44
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 45
    .line 46
    .line 47
    iget v2, p0, Lza1;->v:I

    .line 48
    .line 49
    if-ltz v2, :cond_1

    .line 50
    .line 51
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object v2, p0, Lza1;->y:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v2, :cond_4

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/content/Context;->isRestricted()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_3

    .line 63
    .line 64
    new-instance v2, Lya1;

    .line 65
    .line 66
    iget-object v3, v0, Lab1;->d:Ljava/lang/Object;

    .line 67
    .line 68
    if-nez v3, :cond_2

    .line 69
    .line 70
    invoke-static {v1}, Lab1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iput-object v3, v0, Lab1;->d:Ljava/lang/Object;

    .line 75
    .line 76
    :cond_2
    iget-object v1, p0, Lza1;->y:Ljava/lang/String;

    .line 77
    .line 78
    invoke-direct {v2}, Lya1;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v3, v2, Lya1;->k:Ljava/lang/Object;

    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    :try_start_0
    sget-object v6, Lya1;->m:[Ljava/lang/Class;

    .line 88
    .line 89
    invoke-virtual {v3, v1, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    iput-object v6, v2, Lya1;->l:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .line 95
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :catch_0
    move-exception p0

    .line 100
    new-instance p1, Landroid/view/InflateException;

    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string v2, "Couldn\'t resolve menu item onClick handler "

    .line 105
    .line 106
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, " in class "

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-direct {p1, v0}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 132
    .line 133
    .line 134
    throw p1

    .line 135
    :cond_3
    const-string p0, "The android:onClick attribute cannot be used within a restricted context"

    .line 136
    .line 137
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    :goto_1
    iget v1, p0, Lza1;->r:I

    .line 142
    .line 143
    const/4 v2, 0x2

    .line 144
    if-lt v1, v2, :cond_7

    .line 145
    .line 146
    instance-of v1, p1, Lvm0;

    .line 147
    .line 148
    if-eqz v1, :cond_5

    .line 149
    .line 150
    move-object v1, p1

    .line 151
    check-cast v1, Lvm0;

    .line 152
    .line 153
    iget v2, v1, Lvm0;->x:I

    .line 154
    .line 155
    and-int/lit8 v2, v2, -0x5

    .line 156
    .line 157
    or-int/lit8 v2, v2, 0x4

    .line 158
    .line 159
    iput v2, v1, Lvm0;->x:I

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_5
    instance-of v1, p1, Lzm0;

    .line 163
    .line 164
    if-eqz v1, :cond_7

    .line 165
    .line 166
    move-object v1, p1

    .line 167
    check-cast v1, Lzm0;

    .line 168
    .line 169
    iget-object v2, v1, Lzm0;->c:Lbb1;

    .line 170
    .line 171
    :try_start_1
    iget-object v3, v1, Lzm0;->d:Ljava/lang/reflect/Method;

    .line 172
    .line 173
    if-nez v3, :cond_6

    .line 174
    .line 175
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    const-string v6, "setExclusiveCheckable"

    .line 180
    .line 181
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 182
    .line 183
    filled-new-array {v7}, [Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    invoke-virtual {v3, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    iput-object v3, v1, Lzm0;->d:Ljava/lang/reflect/Method;

    .line 192
    .line 193
    :cond_6
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 194
    .line 195
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v3, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 200
    .line 201
    .line 202
    :catch_1
    :cond_7
    :goto_2
    iget-object v1, p0, Lza1;->x:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v1, :cond_8

    .line 205
    .line 206
    sget-object v2, Lab1;->e:[Ljava/lang/Class;

    .line 207
    .line 208
    iget-object v0, v0, Lab1;->a:[Ljava/lang/Object;

    .line 209
    .line 210
    invoke-virtual {p0, v1, v2, v0}, Lza1;->a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Landroid/view/View;

    .line 215
    .line 216
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 217
    .line 218
    .line 219
    move v4, v5

    .line 220
    :cond_8
    iget v0, p0, Lza1;->w:I

    .line 221
    .line 222
    if-lez v0, :cond_9

    .line 223
    .line 224
    if-nez v4, :cond_9

    .line 225
    .line 226
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 227
    .line 228
    .line 229
    :cond_9
    iget-object v0, p0, Lza1;->z:Lwm0;

    .line 230
    .line 231
    if-eqz v0, :cond_a

    .line 232
    .line 233
    instance-of v1, p1, Lbb1;

    .line 234
    .line 235
    if-eqz v1, :cond_a

    .line 236
    .line 237
    move-object v1, p1

    .line 238
    check-cast v1, Lbb1;

    .line 239
    .line 240
    invoke-interface {v1, v0}, Lbb1;->a(Lwm0;)Lbb1;

    .line 241
    .line 242
    .line 243
    :cond_a
    iget-object v0, p0, Lza1;->A:Ljava/lang/CharSequence;

    .line 244
    .line 245
    instance-of v1, p1, Lbb1;

    .line 246
    .line 247
    const/16 v2, 0x1a

    .line 248
    .line 249
    if-eqz v1, :cond_b

    .line 250
    .line 251
    move-object v3, p1

    .line 252
    check-cast v3, Lbb1;

    .line 253
    .line 254
    invoke-interface {v3, v0}, Lbb1;->setContentDescription(Ljava/lang/CharSequence;)Lbb1;

    .line 255
    .line 256
    .line 257
    goto :goto_3

    .line 258
    :cond_b
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 259
    .line 260
    if-lt v3, v2, :cond_c

    .line 261
    .line 262
    invoke-static {p1, v0}, Ltm0;->h(Landroid/view/MenuItem;Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 263
    .line 264
    .line 265
    :cond_c
    :goto_3
    iget-object v0, p0, Lza1;->B:Ljava/lang/CharSequence;

    .line 266
    .line 267
    if-eqz v1, :cond_d

    .line 268
    .line 269
    move-object v3, p1

    .line 270
    check-cast v3, Lbb1;

    .line 271
    .line 272
    invoke-interface {v3, v0}, Lbb1;->setTooltipText(Ljava/lang/CharSequence;)Lbb1;

    .line 273
    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_d
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 277
    .line 278
    if-lt v3, v2, :cond_e

    .line 279
    .line 280
    invoke-static {p1, v0}, Ltm0;->m(Landroid/view/MenuItem;Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 281
    .line 282
    .line 283
    :cond_e
    :goto_4
    iget-char v0, p0, Lza1;->n:C

    .line 284
    .line 285
    iget v3, p0, Lza1;->o:I

    .line 286
    .line 287
    if-eqz v1, :cond_f

    .line 288
    .line 289
    move-object v4, p1

    .line 290
    check-cast v4, Lbb1;

    .line 291
    .line 292
    invoke-interface {v4, v0, v3}, Lbb1;->setAlphabeticShortcut(CI)Landroid/view/MenuItem;

    .line 293
    .line 294
    .line 295
    goto :goto_5

    .line 296
    :cond_f
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 297
    .line 298
    if-lt v4, v2, :cond_10

    .line 299
    .line 300
    invoke-static {p1, v0, v3}, Ltm0;->g(Landroid/view/MenuItem;CI)Landroid/view/MenuItem;

    .line 301
    .line 302
    .line 303
    :cond_10
    :goto_5
    iget-char v0, p0, Lza1;->p:C

    .line 304
    .line 305
    iget v3, p0, Lza1;->q:I

    .line 306
    .line 307
    if-eqz v1, :cond_11

    .line 308
    .line 309
    move-object v4, p1

    .line 310
    check-cast v4, Lbb1;

    .line 311
    .line 312
    invoke-interface {v4, v0, v3}, Lbb1;->setNumericShortcut(CI)Landroid/view/MenuItem;

    .line 313
    .line 314
    .line 315
    goto :goto_6

    .line 316
    :cond_11
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 317
    .line 318
    if-lt v4, v2, :cond_12

    .line 319
    .line 320
    invoke-static {p1, v0, v3}, Ltm0;->k(Landroid/view/MenuItem;CI)Landroid/view/MenuItem;

    .line 321
    .line 322
    .line 323
    :cond_12
    :goto_6
    iget-object v0, p0, Lza1;->D:Landroid/graphics/PorterDuff$Mode;

    .line 324
    .line 325
    if-eqz v0, :cond_14

    .line 326
    .line 327
    if-eqz v1, :cond_13

    .line 328
    .line 329
    move-object v3, p1

    .line 330
    check-cast v3, Lbb1;

    .line 331
    .line 332
    invoke-interface {v3, v0}, Lbb1;->setIconTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;

    .line 333
    .line 334
    .line 335
    goto :goto_7

    .line 336
    :cond_13
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 337
    .line 338
    if-lt v3, v2, :cond_14

    .line 339
    .line 340
    invoke-static {p1, v0}, Ltm0;->j(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;

    .line 341
    .line 342
    .line 343
    :cond_14
    :goto_7
    iget-object p0, p0, Lza1;->C:Landroid/content/res/ColorStateList;

    .line 344
    .line 345
    if-eqz p0, :cond_16

    .line 346
    .line 347
    if-eqz v1, :cond_15

    .line 348
    .line 349
    check-cast p1, Lbb1;

    .line 350
    .line 351
    invoke-interface {p1, p0}, Lbb1;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    .line 352
    .line 353
    .line 354
    goto :goto_8

    .line 355
    :cond_15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 356
    .line 357
    if-lt v0, v2, :cond_16

    .line 358
    .line 359
    invoke-static {p1, p0}, Ltm0;->i(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    .line 360
    .line 361
    .line 362
    :cond_16
    :goto_8
    return-void
.end method
