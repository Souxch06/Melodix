.class public Landroidx/preference/Preference;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Landroidx/preference/Preference;",
        ">;"
    }
.end annotation


# instance fields
.field public final A:Ljava/lang/String;

.field public final B:Ljava/lang/Object;

.field public C:Z

.field public D:Z

.field public E:Z

.field public final F:Z

.field public final G:Z

.field public final H:Z

.field public final I:Z

.field public final J:Z

.field public final K:Z

.field public final L:Z

.field public M:I

.field public final N:I

.field public O:Lhu0;

.field public P:Ljava/util/ArrayList;

.field public Q:Landroidx/preference/PreferenceGroup;

.field public R:Z

.field public S:Lut0;

.field public T:Lmz;

.field public final U:Lg2;

.field public final j:Landroid/content/Context;

.field public k:Lju0;

.field public l:J

.field public m:Z

.field public n:Ltt0;

.field public o:I

.field public p:Ljava/lang/CharSequence;

.field public q:Ljava/lang/CharSequence;

.field public r:I

.field public s:Landroid/graphics/drawable/Drawable;

.field public final t:Ljava/lang/String;

.field public u:Landroid/content/Intent;

.field public final v:Ljava/lang/String;

.field public w:Landroid/os/Bundle;

.field public final x:Z

.field public y:Z

.field public final z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const v0, 0x7f04037e

    const v1, 0x101008e

    .line 354
    invoke-static {p1, v0, v1}, Les0;->d(Landroid/content/Context;II)I

    move-result v0

    .line 355
    invoke-direct {p0, p1, p2, v0}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Landroidx/preference/Preference;->o:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Landroidx/preference/Preference;->x:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Landroidx/preference/Preference;->y:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Landroidx/preference/Preference;->z:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Landroidx/preference/Preference;->C:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Landroidx/preference/Preference;->D:Z

    .line 19
    .line 20
    iput-boolean v1, p0, Landroidx/preference/Preference;->E:Z

    .line 21
    .line 22
    iput-boolean v1, p0, Landroidx/preference/Preference;->F:Z

    .line 23
    .line 24
    iput-boolean v1, p0, Landroidx/preference/Preference;->G:Z

    .line 25
    .line 26
    iput-boolean v1, p0, Landroidx/preference/Preference;->I:Z

    .line 27
    .line 28
    iput-boolean v1, p0, Landroidx/preference/Preference;->L:Z

    .line 29
    .line 30
    const v2, 0x7f0c007c

    .line 31
    .line 32
    .line 33
    iput v2, p0, Landroidx/preference/Preference;->M:I

    .line 34
    .line 35
    new-instance v3, Lg2;

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v3, v4, p0}, Lg2;-><init>(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object v3, p0, Landroidx/preference/Preference;->U:Lg2;

    .line 42
    .line 43
    iput-object p1, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    .line 44
    .line 45
    sget-object v3, Ldx0;->g:[I

    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    invoke-virtual {p1, p2, v3, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const/16 p2, 0x17

    .line 53
    .line 54
    invoke-virtual {p1, v5, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput p2, p0, Landroidx/preference/Preference;->r:I

    .line 63
    .line 64
    const/16 p2, 0x1a

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-nez p2, :cond_0

    .line 71
    .line 72
    const/4 p2, 0x6

    .line 73
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    :cond_0
    iput-object p2, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 78
    .line 79
    const/16 p2, 0x22

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    if-nez p2, :cond_1

    .line 86
    .line 87
    const/4 p2, 0x4

    .line 88
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    :cond_1
    iput-object p2, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 93
    .line 94
    const/16 p2, 0x21

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    if-nez p2, :cond_2

    .line 101
    .line 102
    const/4 p2, 0x7

    .line 103
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    :cond_2
    iput-object p2, p0, Landroidx/preference/Preference;->q:Ljava/lang/CharSequence;

    .line 108
    .line 109
    const/16 p2, 0x8

    .line 110
    .line 111
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    const/16 p3, 0x1c

    .line 116
    .line 117
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    iput p2, p0, Landroidx/preference/Preference;->o:I

    .line 122
    .line 123
    const/16 p2, 0x16

    .line 124
    .line 125
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    if-nez p2, :cond_3

    .line 130
    .line 131
    const/16 p2, 0xd

    .line 132
    .line 133
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    :cond_3
    iput-object p2, p0, Landroidx/preference/Preference;->v:Ljava/lang/String;

    .line 138
    .line 139
    const/4 p2, 0x3

    .line 140
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    const/16 p3, 0x1b

    .line 145
    .line 146
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iput p2, p0, Landroidx/preference/Preference;->M:I

    .line 151
    .line 152
    const/16 p2, 0x9

    .line 153
    .line 154
    invoke-virtual {p1, p2, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    const/16 p3, 0x23

    .line 159
    .line 160
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    iput p2, p0, Landroidx/preference/Preference;->N:I

    .line 165
    .line 166
    const/16 p2, 0x15

    .line 167
    .line 168
    invoke-virtual {p1, v4, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 169
    .line 170
    .line 171
    move-result p3

    .line 172
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    iput-boolean p2, p0, Landroidx/preference/Preference;->x:Z

    .line 177
    .line 178
    const/4 p2, 0x5

    .line 179
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    const/16 p3, 0x1e

    .line 184
    .line 185
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    iput-boolean p2, p0, Landroidx/preference/Preference;->y:Z

    .line 190
    .line 191
    const/16 p2, 0x1d

    .line 192
    .line 193
    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 198
    .line 199
    .line 200
    move-result p2

    .line 201
    iput-boolean p2, p0, Landroidx/preference/Preference;->z:Z

    .line 202
    .line 203
    const/16 p2, 0x13

    .line 204
    .line 205
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p2

    .line 209
    if-nez p2, :cond_4

    .line 210
    .line 211
    const/16 p2, 0xa

    .line 212
    .line 213
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    :cond_4
    iput-object p2, p0, Landroidx/preference/Preference;->A:Ljava/lang/String;

    .line 218
    .line 219
    iget-boolean p2, p0, Landroidx/preference/Preference;->y:Z

    .line 220
    .line 221
    const/16 p3, 0x10

    .line 222
    .line 223
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    iput-boolean p2, p0, Landroidx/preference/Preference;->F:Z

    .line 232
    .line 233
    iget-boolean p2, p0, Landroidx/preference/Preference;->y:Z

    .line 234
    .line 235
    const/16 p3, 0x11

    .line 236
    .line 237
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 242
    .line 243
    .line 244
    move-result p2

    .line 245
    iput-boolean p2, p0, Landroidx/preference/Preference;->G:Z

    .line 246
    .line 247
    const/16 p2, 0x12

    .line 248
    .line 249
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 250
    .line 251
    .line 252
    move-result p3

    .line 253
    if-eqz p3, :cond_5

    .line 254
    .line 255
    invoke-virtual {p0, p1, p2}, Landroidx/preference/Preference;->n(Landroid/content/res/TypedArray;I)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    iput-object p2, p0, Landroidx/preference/Preference;->B:Ljava/lang/Object;

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_5
    const/16 p2, 0xb

    .line 263
    .line 264
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 265
    .line 266
    .line 267
    move-result p3

    .line 268
    if-eqz p3, :cond_6

    .line 269
    .line 270
    invoke-virtual {p0, p1, p2}, Landroidx/preference/Preference;->n(Landroid/content/res/TypedArray;I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object p2

    .line 274
    iput-object p2, p0, Landroidx/preference/Preference;->B:Ljava/lang/Object;

    .line 275
    .line 276
    :cond_6
    :goto_0
    const/16 p2, 0xc

    .line 277
    .line 278
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 279
    .line 280
    .line 281
    move-result p2

    .line 282
    const/16 p3, 0x1f

    .line 283
    .line 284
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 285
    .line 286
    .line 287
    move-result p2

    .line 288
    iput-boolean p2, p0, Landroidx/preference/Preference;->L:Z

    .line 289
    .line 290
    const/16 p2, 0x20

    .line 291
    .line 292
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 293
    .line 294
    .line 295
    move-result p3

    .line 296
    iput-boolean p3, p0, Landroidx/preference/Preference;->H:Z

    .line 297
    .line 298
    if-eqz p3, :cond_7

    .line 299
    .line 300
    const/16 p3, 0xe

    .line 301
    .line 302
    invoke-virtual {p1, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 303
    .line 304
    .line 305
    move-result p3

    .line 306
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 307
    .line 308
    .line 309
    move-result p2

    .line 310
    iput-boolean p2, p0, Landroidx/preference/Preference;->I:Z

    .line 311
    .line 312
    :cond_7
    const/16 p2, 0xf

    .line 313
    .line 314
    invoke-virtual {p1, p2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 315
    .line 316
    .line 317
    move-result p2

    .line 318
    const/16 p3, 0x18

    .line 319
    .line 320
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    iput-boolean p2, p0, Landroidx/preference/Preference;->J:Z

    .line 325
    .line 326
    const/16 p2, 0x19

    .line 327
    .line 328
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 329
    .line 330
    .line 331
    move-result p3

    .line 332
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 333
    .line 334
    .line 335
    move-result p2

    .line 336
    iput-boolean p2, p0, Landroidx/preference/Preference;->E:Z

    .line 337
    .line 338
    const/16 p2, 0x14

    .line 339
    .line 340
    invoke-virtual {p1, p2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 341
    .line 342
    .line 343
    move-result p3

    .line 344
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 345
    .line 346
    .line 347
    move-result p2

    .line 348
    iput-boolean p2, p0, Landroidx/preference/Preference;->K:Z

    .line 349
    .line 350
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 351
    .line 352
    .line 353
    return-void
.end method

.method public static t(Landroid/view/View;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    :goto_0
    if-ltz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1, p1}, Landroidx/preference/Preference;->t(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Landroidx/preference/Preference;->R:Z

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->o(Landroid/os/Parcelable;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p0, p0, Landroidx/preference/Preference;->R:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p0, "Derived class did not call super.onRestoreInstanceState()"

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public b(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Landroidx/preference/Preference;->R:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/preference/Preference;->p()Landroid/os/Parcelable;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-boolean p0, p0, Landroidx/preference/Preference;->R:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "Derived class did not call super.onSaveInstanceState()"

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Landroidx/preference/Preference;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Landroidx/preference/Preference;

    .line 2
    .line 3
    iget v0, p0, Landroidx/preference/Preference;->o:I

    .line 4
    .line 5
    iget v1, p1, Landroidx/preference/Preference;->o:I

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    return v0

    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iget-object v0, p1, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    if-nez p0, :cond_2

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    if-nez v0, :cond_3

    .line 24
    .line 25
    const/4 p0, -0x1

    .line 26
    return p0

    .line 27
    :cond_3
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p1, p1, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public final d(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 9
    .line 10
    invoke-virtual {v0}, Lju0;->c()Landroid/content/SharedPreferences;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public e()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->T:Lmz;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lmz;->m(Landroidx/preference/Preference;)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Landroidx/preference/Preference;->q:Ljava/lang/CharSequence;

    .line 11
    .line 12
    return-object p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/preference/Preference;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Landroidx/preference/Preference;->C:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Landroidx/preference/Preference;->D:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->O:Lhu0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lhu0;->e:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, -0x1

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lhy0;->a:Liy0;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v0, v1, v2, p0}, Liy0;->c(IILandroidx/preference/Preference;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public h(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Landroidx/preference/Preference;->P:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroidx/preference/Preference;

    .line 18
    .line 19
    iget-boolean v3, v2, Landroidx/preference/Preference;->C:Z

    .line 20
    .line 21
    if-ne v3, p1, :cond_1

    .line 22
    .line 23
    xor-int/lit8 v3, p1, 0x1

    .line 24
    .line 25
    iput-boolean v3, v2, Landroidx/preference/Preference;->C:Z

    .line 26
    .line 27
    invoke-virtual {v2}, Landroidx/preference/Preference;->v()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Landroidx/preference/Preference;->h(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Landroidx/preference/Preference;->g()V

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    return-void
.end method

.method public i()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->A:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object v1, v1, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 17
    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_2
    invoke-virtual {v1, v0}, Landroidx/preference/PreferenceGroup;->z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    :goto_0
    if-eqz v2, :cond_5

    .line 26
    .line 27
    iget-object v0, v2, Landroidx/preference/Preference;->P:Ljava/util/ArrayList;

    .line 28
    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, v2, Landroidx/preference/Preference;->P:Ljava/util/ArrayList;

    .line 37
    .line 38
    :cond_3
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Landroidx/preference/Preference;->v()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-boolean v1, p0, Landroidx/preference/Preference;->C:Z

    .line 46
    .line 47
    if-ne v1, v0, :cond_4

    .line 48
    .line 49
    xor-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    iput-boolean v0, p0, Landroidx/preference/Preference;->C:Z

    .line 52
    .line 53
    invoke-virtual {p0}, Landroidx/preference/Preference;->v()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->h(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 61
    .line 62
    .line 63
    :cond_4
    :goto_1
    return-void

    .line 64
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 65
    .line 66
    iget-object v2, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 67
    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v4, "Dependency \""

    .line 71
    .line 72
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, "\" not found for preference \""

    .line 79
    .line 80
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p0, "\" (title: \""

    .line 89
    .line 90
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p0, "\""

    .line 97
    .line 98
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw v1
.end method

.method public final j(Lju0;)V
    .locals 4

    .line 1
    iput-object p1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 2
    .line 3
    iget-boolean v0, p0, Landroidx/preference/Preference;->m:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-wide v0, p1, Lju0;->b:J

    .line 9
    .line 10
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    add-long/2addr v2, v0

    .line 13
    iput-wide v2, p1, Lju0;->b:J

    .line 14
    .line 15
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    iput-wide v0, p0, Landroidx/preference/Preference;->l:J

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0

    .line 22
    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_3

    .line 27
    .line 28
    iget-object p1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Lju0;->c()Landroid/content/SharedPreferences;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-object p1, v0

    .line 39
    :goto_1
    iget-object v1, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p1, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->q(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    :goto_2
    iget-object p1, p0, Landroidx/preference/Preference;->B:Ljava/lang/Object;

    .line 53
    .line 54
    if-eqz p1, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->q(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    return-void
.end method

.method public k(Lmu0;)V
    .locals 9

    .line 1
    iget-object v0, p1, Lmu0;->a:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/preference/Preference;->U:Lg2;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 10
    .line 11
    .line 12
    const v2, 0x1020010

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v2}, Lmu0;->b(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/widget/TextView;

    .line 20
    .line 21
    const/16 v3, 0x8

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/preference/Preference;->e()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-nez v6, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    :cond_1
    move-object v2, v4

    .line 55
    :goto_0
    const v5, 0x1020016

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v5}, Lmu0;->b(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Landroid/widget/TextView;

    .line 63
    .line 64
    if-eqz v5, :cond_4

    .line 65
    .line 66
    iget-object v6, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 67
    .line 68
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    if-nez v7, :cond_3

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    iget-boolean v6, p0, Landroidx/preference/Preference;->H:Z

    .line 81
    .line 82
    if-eqz v6, :cond_2

    .line 83
    .line 84
    iget-boolean v6, p0, Landroidx/preference/Preference;->I:Z

    .line 85
    .line 86
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-boolean v6, p0, Landroidx/preference/Preference;->y:Z

    .line 90
    .line 91
    if-nez v6, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Landroidx/preference/Preference;->f()Z

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-eqz v6, :cond_4

    .line 98
    .line 99
    if-eqz v2, :cond_4

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    :cond_4
    :goto_1
    const v2, 0x1020006

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v2}, Lmu0;->b(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Landroid/widget/ImageView;

    .line 120
    .line 121
    const/4 v5, 0x4

    .line 122
    iget-boolean v6, p0, Landroidx/preference/Preference;->J:Z

    .line 123
    .line 124
    if-eqz v2, :cond_a

    .line 125
    .line 126
    iget v7, p0, Landroidx/preference/Preference;->r:I

    .line 127
    .line 128
    if-nez v7, :cond_5

    .line 129
    .line 130
    iget-object v8, p0, Landroidx/preference/Preference;->s:Landroid/graphics/drawable/Drawable;

    .line 131
    .line 132
    if-eqz v8, :cond_7

    .line 133
    .line 134
    :cond_5
    iget-object v8, p0, Landroidx/preference/Preference;->s:Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    if-nez v8, :cond_6

    .line 137
    .line 138
    iget-object v8, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    .line 139
    .line 140
    invoke-static {v8, v7}, Lrs0;->g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    iput-object v8, p0, Landroidx/preference/Preference;->s:Landroid/graphics/drawable/Drawable;

    .line 145
    .line 146
    :cond_6
    if-eqz v8, :cond_7

    .line 147
    .line 148
    invoke-virtual {v2, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 149
    .line 150
    .line 151
    :cond_7
    iget-object v7, p0, Landroidx/preference/Preference;->s:Landroid/graphics/drawable/Drawable;

    .line 152
    .line 153
    if-eqz v7, :cond_8

    .line 154
    .line 155
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_8
    if-eqz v6, :cond_9

    .line 160
    .line 161
    move v7, v5

    .line 162
    goto :goto_2

    .line 163
    :cond_9
    move v7, v3

    .line 164
    :goto_2
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    :cond_a
    :goto_3
    const v2, 0x7f0900f2

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, v2}, Lmu0;->b(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    if-nez v2, :cond_b

    .line 175
    .line 176
    const v2, 0x102003e

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v2}, Lmu0;->b(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    :cond_b
    if-eqz v2, :cond_e

    .line 184
    .line 185
    iget-object v7, p0, Landroidx/preference/Preference;->s:Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    if-eqz v7, :cond_c

    .line 188
    .line 189
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_c
    if-eqz v6, :cond_d

    .line 194
    .line 195
    move v3, v5

    .line 196
    :cond_d
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 197
    .line 198
    .line 199
    :cond_e
    :goto_4
    iget-boolean v1, p0, Landroidx/preference/Preference;->L:Z

    .line 200
    .line 201
    if-eqz v1, :cond_f

    .line 202
    .line 203
    invoke-virtual {p0}, Landroidx/preference/Preference;->f()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    invoke-static {v0, v1}, Landroidx/preference/Preference;->t(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    goto :goto_5

    .line 211
    :cond_f
    const/4 v1, 0x1

    .line 212
    invoke-static {v0, v1}, Landroidx/preference/Preference;->t(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    :goto_5
    iget-boolean v1, p0, Landroidx/preference/Preference;->y:Z

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 221
    .line 222
    .line 223
    iget-boolean v2, p0, Landroidx/preference/Preference;->F:Z

    .line 224
    .line 225
    iput-boolean v2, p1, Lmu0;->v:Z

    .line 226
    .line 227
    iget-boolean v2, p0, Landroidx/preference/Preference;->G:Z

    .line 228
    .line 229
    iput-boolean v2, p1, Lmu0;->w:Z

    .line 230
    .line 231
    iget-boolean p1, p0, Landroidx/preference/Preference;->K:Z

    .line 232
    .line 233
    if-eqz p1, :cond_10

    .line 234
    .line 235
    iget-object v2, p0, Landroidx/preference/Preference;->S:Lut0;

    .line 236
    .line 237
    if-nez v2, :cond_10

    .line 238
    .line 239
    new-instance v2, Lut0;

    .line 240
    .line 241
    invoke-direct {v2, p0}, Lut0;-><init>(Landroidx/preference/Preference;)V

    .line 242
    .line 243
    .line 244
    iput-object v2, p0, Landroidx/preference/Preference;->S:Lut0;

    .line 245
    .line 246
    :cond_10
    if-eqz p1, :cond_11

    .line 247
    .line 248
    iget-object p0, p0, Landroidx/preference/Preference;->S:Lut0;

    .line 249
    .line 250
    goto :goto_6

    .line 251
    :cond_11
    move-object p0, v4

    .line 252
    :goto_6
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, p1}, Landroid/view/View;->setLongClickable(Z)V

    .line 256
    .line 257
    .line 258
    if-eqz p1, :cond_12

    .line 259
    .line 260
    if-nez v1, :cond_12

    .line 261
    .line 262
    sget-object p0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 263
    .line 264
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 265
    .line 266
    .line 267
    :cond_12
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public o(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/preference/Preference;->R:Z

    .line 3
    .line 4
    sget-object p0, Landroid/view/AbsSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    .line 5
    .line 6
    if-eq p1, p0, :cond_1

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "Wrong state class -- expecting Preference State"

    .line 12
    .line 13
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public p()Landroid/os/Parcelable;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/preference/Preference;->R:Z

    .line 3
    .line 4
    sget-object p0, Landroid/view/AbsSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    .line 5
    .line 6
    return-object p0
.end method

.method public q(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_7

    .line 6
    .line 7
    iget-boolean p1, p0, Landroidx/preference/Preference;->y:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->l()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Landroidx/preference/Preference;->n:Ltt0;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ltt0;->b(Landroidx/preference/Preference;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 25
    .line 26
    if-eqz p1, :cond_6

    .line 27
    .line 28
    iget-object p1, p1, Lju0;->h:Lcu0;

    .line 29
    .line 30
    if-eqz p1, :cond_6

    .line 31
    .line 32
    iget-object v0, p0, Landroidx/preference/Preference;->v:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_6

    .line 35
    .line 36
    move-object v1, p1

    .line 37
    :goto_0
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, v1, Lh70;->D:Lh70;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {p1}, Lh70;->k()Lz70;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, p0, Landroidx/preference/Preference;->w:Landroid/os/Bundle;

    .line 47
    .line 48
    if-nez v2, :cond_3

    .line 49
    .line 50
    new-instance v2, Landroid/os/Bundle;

    .line 51
    .line 52
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Landroidx/preference/Preference;->w:Landroid/os/Bundle;

    .line 56
    .line 57
    :cond_3
    invoke-virtual {v1}, Lz70;->D()Lt70;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1}, Lh70;->G()Le6;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lt70;->a(Ljava/lang/String;)Lh70;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, v2}, Lh70;->K(Landroid/os/Bundle;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lh70;->L(Lh70;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ltf;

    .line 79
    .line 80
    invoke-direct {v0, v1}, Ltf;-><init>(Lz70;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Lh70;->I()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_5

    .line 98
    .line 99
    const/4 v1, 0x2

    .line 100
    const/4 v2, 0x0

    .line 101
    invoke-virtual {v0, p1, p0, v2, v1}, Ltf;->e(ILh70;Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    iget-boolean p0, v0, Ltf;->h:Z

    .line 105
    .line 106
    if-eqz p0, :cond_4

    .line 107
    .line 108
    const/4 p0, 0x1

    .line 109
    iput-boolean p0, v0, Ltf;->g:Z

    .line 110
    .line 111
    iput-object v2, v0, Ltf;->i:Ljava/lang/String;

    .line 112
    .line 113
    const/4 p0, 0x0

    .line 114
    invoke-virtual {v0, p0}, Ltf;->d(Z)I

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    const-string p0, "This FragmentTransaction is not allowed to be added to the back stack."

    .line 119
    .line 120
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    const-string p0, "Must use non-zero containerViewId"

    .line 125
    .line 126
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_6
    iget-object p1, p0, Landroidx/preference/Preference;->u:Landroid/content/Intent;

    .line 131
    .line 132
    if-eqz p1, :cond_7

    .line 133
    .line 134
    iget-object p0, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    :cond_7
    :goto_1
    return-void
.end method

.method public final s(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 21
    .line 22
    invoke-virtual {v0}, Lju0;->b()Landroid/content/SharedPreferences$Editor;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 32
    .line 33
    iget-boolean p0, p0, Lju0;->e:Z

    .line 34
    .line 35
    if-nez p0, :cond_2

    .line 36
    .line 37
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/16 v3, 0x20

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->e()Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-lez p0, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    add-int/lit8 p0, p0, -0x1

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 51
    .line 52
    .line 53
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public u(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->T:Lmz;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/preference/Preference;->q:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Landroidx/preference/Preference;->q:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/preference/Preference;->g()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    const-string p0, "Preference already has a SummaryProvider set."

    .line 20
    .line 21
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/preference/Preference;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public final w()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Landroidx/preference/Preference;->z:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/preference/Preference;->A:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/preference/Preference;->k:Lju0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, v1, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-virtual {v1, v0}, Landroidx/preference/PreferenceGroup;->z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    :goto_0
    if-eqz v2, :cond_2

    .line 21
    .line 22
    iget-object v0, v2, Landroidx/preference/Preference;->P:Ljava/util/ArrayList;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method
