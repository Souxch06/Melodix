.class public final Lmc2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lmc2;->a:Ljava/util/HashMap;

    .line 12
    .line 13
    new-instance v1, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lmc2;->b:Ljava/util/HashMap;

    .line 19
    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lmc2;->c:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lzc2;

    .line 42
    .line 43
    invoke-interface {v1}, Lzc2;->e()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v2, p0, Lmc2;->a:Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-interface {v1}, Lzc2;->e()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lzc2;

    .line 65
    .line 66
    if-nez v2, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    add-int/lit8 v1, v1, 0x1e

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    add-int/2addr v1, v2

    .line 106
    new-instance v2, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 109
    .line 110
    .line 111
    const-string v1, "Cannot override Backend "

    .line 112
    .line 113
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string p1, " with "

    .line 120
    .line 121
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw p0

    .line 135
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_3

    .line 144
    .line 145
    iget-object p0, p0, Lmc2;->c:Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    invoke-static {}, Lz0;->a()V

    .line 159
    .line 160
    .line 161
    const/4 p0, 0x0

    .line 162
    throw p0
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Llc2;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lmc2;->b(Landroid/net/Uri;)Lkc2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p2, p0}, Llc2;->a(Lkc2;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final b(Landroid/net/Uri;)Lkc2;
    .locals 12

    .line 1
    sget-object v0, Lzd0;->k:Lwd0;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    const-string v1, "initialCapacity"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lkp1;->a(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-array v2, v0, [Ljava/lang/Object;

    .line 10
    .line 11
    invoke-static {v0, v1}, Lkp1;->a(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-array v1, v0, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedFragment()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/4 v5, 0x1

    .line 25
    const/4 v6, 0x0

    .line 26
    if-nez v4, :cond_5

    .line 27
    .line 28
    const-string v4, "transform="

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    const/16 v4, 0xa

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "+"

    .line 44
    .line 45
    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    new-instance v7, Lwj;

    .line 50
    .line 51
    invoke-direct {v7, v4}, Lwj;-><init>(C)V

    .line 52
    .line 53
    .line 54
    new-instance v4, Lpa0;

    .line 55
    .line 56
    const/16 v8, 0x1b

    .line 57
    .line 58
    invoke-direct {v4, v8, v7}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance v7, La91;

    .line 62
    .line 63
    invoke-direct {v7, v4, v5}, La91;-><init>(Lpa0;Z)V

    .line 64
    .line 65
    .line 66
    new-instance v4, Lz81;

    .line 67
    .line 68
    invoke-direct {v4, v7, v3}, Lz81;-><init>(La91;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    instance-of v3, v4, Ljava/util/Collection;

    .line 72
    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    check-cast v4, Ljava/util/Collection;

    .line 76
    .line 77
    invoke-static {v4}, Lzd0;->o(Ljava/util/Collection;)Lzd0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_2

    .line 82
    :cond_1
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-nez v4, :cond_2

    .line 91
    .line 92
    sget-object v0, Lmz0;->n:Lmz0;

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-nez v7, :cond_3

    .line 104
    .line 105
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v5, v0}, Lea1;->c(I[Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v5, v0}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    goto :goto_2

    .line 117
    :cond_3
    new-instance v7, Lvd0;

    .line 118
    .line 119
    invoke-direct {v7, v0}, Lvd0;-><init>(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v7, v4}, Lvd0;->a(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v7, v0}, Lvd0;->a(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_4
    invoke-virtual {v7}, Lvd0;->b()Lmz0;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    goto :goto_2

    .line 144
    :cond_5
    :goto_1
    sget-object v0, Lmz0;->n:Lmz0;

    .line 145
    .line 146
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    move v4, v6

    .line 151
    move v7, v4

    .line 152
    :goto_3
    const/4 v8, 0x0

    .line 153
    if-ge v4, v3, :cond_8

    .line 154
    .line 155
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    check-cast v9, Ljava/lang/String;

    .line 160
    .line 161
    sget-object v10, Lxc2;->a:Ljava/util/regex/Pattern;

    .line 162
    .line 163
    invoke-virtual {v10, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 164
    .line 165
    .line 166
    move-result-object v10

    .line 167
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    .line 168
    .line 169
    .line 170
    move-result v11

    .line 171
    if-eqz v11, :cond_7

    .line 172
    .line 173
    invoke-virtual {v10, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    .line 179
    .line 180
    add-int/lit8 v9, v7, 0x1

    .line 181
    .line 182
    array-length v10, v1

    .line 183
    if-ge v10, v9, :cond_6

    .line 184
    .line 185
    array-length v10, v1

    .line 186
    invoke-static {v10, v9}, Lvd0;->d(II)I

    .line 187
    .line 188
    .line 189
    move-result v9

    .line 190
    invoke-static {v1, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    :cond_6
    add-int/lit8 v9, v7, 0x1

    .line 195
    .line 196
    aput-object v8, v1, v7

    .line 197
    .line 198
    add-int/lit8 v4, v4, 0x1

    .line 199
    .line 200
    move v7, v9

    .line 201
    goto :goto_3

    .line 202
    :cond_7
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const-string p1, "Invalid fragment spec: "

    .line 207
    .line 208
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return-object v8

    .line 216
    :cond_8
    invoke-static {v7, v1}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iget v1, v0, Lmz0;->m:I

    .line 221
    .line 222
    if-gtz v1, :cond_d

    .line 223
    .line 224
    invoke-static {v6, v2}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Lzd0;->q()Lzd0;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    new-instance v1, Lkc2;

    .line 233
    .line 234
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    iget-object v3, p0, Lmc2;->a:Ljava/util/HashMap;

    .line 242
    .line 243
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    check-cast v3, Lzc2;

    .line 248
    .line 249
    if-eqz v3, :cond_c

    .line 250
    .line 251
    iput-object v3, v1, Lkc2;->a:Lzc2;

    .line 252
    .line 253
    iget-object p0, p0, Lmc2;->c:Ljava/util/ArrayList;

    .line 254
    .line 255
    iput-object p0, v1, Lkc2;->c:Ljava/util/ArrayList;

    .line 256
    .line 257
    iput-object v0, v1, Lkc2;->b:Lzd0;

    .line 258
    .line 259
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result p0

    .line 263
    if-nez p0, :cond_b

    .line 264
    .line 265
    new-instance p0, Ljava/util/ArrayList;

    .line 266
    .line 267
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    invoke-direct {p0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    if-nez v2, :cond_b

    .line 279
    .line 280
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    const-string v3, "/"

    .line 285
    .line 286
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    if-nez v2, :cond_b

    .line 291
    .line 292
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    add-int/lit8 v2, v2, -0x1

    .line 297
    .line 298
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    check-cast v2, Ljava/lang/String;

    .line 303
    .line 304
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    invoke-interface {v0, v4}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    :goto_4
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 313
    .line 314
    .line 315
    move-result v4

    .line 316
    if-eqz v4, :cond_a

    .line 317
    .line 318
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    if-nez v4, :cond_9

    .line 323
    .line 324
    goto :goto_4

    .line 325
    :cond_9
    invoke-static {}, Lz0;->a()V

    .line 326
    .line 327
    .line 328
    return-object v8

    .line 329
    :cond_a
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    add-int/lit8 v0, v0, -0x1

    .line 334
    .line 335
    invoke-virtual {p0, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    invoke-static {v3, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-virtual {p1, p0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    invoke-virtual {p0, v8}, Landroid/net/Uri$Builder;->encodedFragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    :cond_b
    iput-object p1, v1, Lkc2;->d:Landroid/net/Uri;

    .line 359
    .line 360
    new-instance p0, Lkc2;

    .line 361
    .line 362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 363
    .line 364
    .line 365
    iget-object p1, v1, Lkc2;->a:Lzc2;

    .line 366
    .line 367
    iput-object p1, p0, Lkc2;->a:Lzc2;

    .line 368
    .line 369
    iget-object p1, v1, Lkc2;->b:Lzd0;

    .line 370
    .line 371
    iput-object p1, p0, Lkc2;->b:Lzd0;

    .line 372
    .line 373
    iget-object p1, v1, Lkc2;->c:Ljava/util/ArrayList;

    .line 374
    .line 375
    iput-object p1, p0, Lkc2;->c:Ljava/util/ArrayList;

    .line 376
    .line 377
    iget-object p1, v1, Lkc2;->d:Landroid/net/Uri;

    .line 378
    .line 379
    iput-object p1, p0, Lkc2;->d:Landroid/net/Uri;

    .line 380
    .line 381
    return-object p0

    .line 382
    :cond_c
    new-instance p0, Lyk;

    .line 383
    .line 384
    const-string p1, "Requested backend isn\'t registered: "

    .line 385
    .line 386
    invoke-static {p1, v2}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p1

    .line 390
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    throw p0

    .line 394
    :cond_d
    invoke-virtual {v0, v6}, Lmz0;->get(I)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    check-cast v0, Ljava/lang/String;

    .line 399
    .line 400
    iget-object p0, p0, Lmc2;->b:Ljava/util/HashMap;

    .line 401
    .line 402
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    if-eqz p0, :cond_e

    .line 407
    .line 408
    invoke-static {}, Lz0;->a()V

    .line 409
    .line 410
    .line 411
    return-object v8

    .line 412
    :cond_e
    new-instance p0, Lyk;

    .line 413
    .line 414
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    add-int/lit8 v1, v1, 0x28

    .line 423
    .line 424
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 425
    .line 426
    .line 427
    move-result v2

    .line 428
    add-int/2addr v1, v2

    .line 429
    new-instance v2, Ljava/lang/StringBuilder;

    .line 430
    .line 431
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 432
    .line 433
    .line 434
    const-string v1, "Requested transform isn\'t registered: "

    .line 435
    .line 436
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    const-string v0, ": "

    .line 443
    .line 444
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object p1

    .line 454
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    throw p0
.end method
