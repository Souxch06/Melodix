.class public final Ln3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final d:Ljava/util/regex/Pattern;


# instance fields
.field public a:Ljava/util/regex/Pattern;

.field public final b:Ljava/util/concurrent/ConcurrentHashMap;

.field public final c:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\\s+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ln3;->d:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ln3;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ln3;->c:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    return-void
.end method

.method public static b(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    const-string v1, "?"

    .line 17
    .line 18
    invoke-static {v0, v1, p0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Ln3;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Ll3;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move-object v0, p0

    .line 46
    :cond_2
    :goto_0
    check-cast v0, Ll3;

    .line 47
    .line 48
    monitor-enter v0

    .line 49
    :try_start_0
    iget-object p0, v0, Ll3;->c:Ljava/util/ArrayList;

    .line 50
    .line 51
    if-nez p0, :cond_3

    .line 52
    .line 53
    new-instance p0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p0, v0, Ll3;->c:Ljava/util/ArrayList;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_3
    :goto_1
    const-string p1, "/"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    monitor-exit v0

    .line 69
    return-void

    .line 70
    :goto_2
    monitor-exit v0

    .line 71
    throw p0
.end method

.method public final c(Ljava/lang/String;Ljava/io/BufferedReader;)V
    .locals 10

    .line 1
    :goto_0
    if-eqz p1, :cond_12

    .line 2
    .line 3
    invoke-static {p1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_8

    .line 18
    .line 19
    :cond_0
    const-string v0, "!"

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {p1, v0, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_11

    .line 27
    .line 28
    const-string v0, "##"

    .line 29
    .line 30
    invoke-static {p1, v0, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_11

    .line 35
    .line 36
    const-string v0, "#@#"

    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_11

    .line 43
    .line 44
    const-string v0, "#?#"

    .line 45
    .line 46
    invoke-static {p1, v0, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_11

    .line 51
    .line 52
    const-string v0, "@@"

    .line 53
    .line 54
    invoke-static {p1, v0, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    goto/16 :goto_8

    .line 61
    .line 62
    :cond_1
    const-string v0, "||"

    .line 63
    .line 64
    invoke-static {p1, v0, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v2, 0x1

    .line 69
    if-eqz v0, :cond_e

    .line 70
    .line 71
    const/16 v0, 0x24

    .line 72
    .line 73
    const/4 v3, 0x6

    .line 74
    invoke-static {p1, v0, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v4, -0x1

    .line 79
    if-eq v0, v4, :cond_4

    .line 80
    .line 81
    const-string v5, "domain="

    .line 82
    .line 83
    add-int/lit8 v6, v0, 0x1

    .line 84
    .line 85
    const/4 v7, 0x4

    .line 86
    invoke-static {p1, v5, v6, v1, v7}, Lda1;->D(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eq v5, v4, :cond_4

    .line 91
    .line 92
    add-int/lit8 v5, v5, 0x7

    .line 93
    .line 94
    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    const-string v6, "|"

    .line 99
    .line 100
    filled-new-array {v6}, [Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-static {v5, v6}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-nez v6, :cond_2

    .line 113
    .line 114
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    check-cast v6, Ljava/lang/String;

    .line 119
    .line 120
    const-string v7, "~"

    .line 121
    .line 122
    invoke-static {v6, v7, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    if-eqz v6, :cond_2

    .line 127
    .line 128
    move v6, v2

    .line 129
    goto :goto_1

    .line 130
    :cond_2
    move v6, v1

    .line 131
    :goto_1
    new-instance v7, Ljava/util/HashSet;

    .line 132
    .line 133
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    invoke-direct {v7, v8}, Ljava/util/HashSet;-><init>(I)V

    .line 138
    .line 139
    .line 140
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result v8

    .line 148
    if-eqz v8, :cond_5

    .line 149
    .line 150
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    check-cast v8, Ljava/lang/String;

    .line 155
    .line 156
    const-string v9, "~"

    .line 157
    .line 158
    invoke-static {v8, v9, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    if-eqz v9, :cond_3

    .line 163
    .line 164
    invoke-virtual {v8, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    :cond_3
    invoke-virtual {v7, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_4
    const/4 v7, 0x0

    .line 173
    move v6, v1

    .line 174
    :cond_5
    const/4 v2, 0x2

    .line 175
    if-ne v0, v4, :cond_6

    .line 176
    .line 177
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    goto :goto_3

    .line 182
    :cond_6
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    :goto_3
    const/16 v0, 0x5e

    .line 187
    .line 188
    invoke-static {p1, v0, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-ne v0, v4, :cond_7

    .line 193
    .line 194
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    :cond_7
    const/16 v2, 0x2f

    .line 199
    .line 200
    invoke-static {p1, v2, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-ne v2, v4, :cond_8

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    :cond_8
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 219
    .line 220
    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    .line 226
    .line 227
    const-string v4, "*"

    .line 228
    .line 229
    invoke-static {v3, v4, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-nez v1, :cond_11

    .line 234
    .line 235
    iget-object v1, p0, Ln3;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 236
    .line 237
    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    if-nez v4, :cond_a

    .line 242
    .line 243
    new-instance v4, Ll3;

    .line 244
    .line 245
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    if-nez v1, :cond_9

    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_9
    move-object v4, v1

    .line 256
    :cond_a
    :goto_4
    check-cast v4, Ll3;

    .line 257
    .line 258
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    monitor-enter v4

    .line 267
    if-nez v7, :cond_c

    .line 268
    .line 269
    :try_start_0
    iget-object v0, v4, Ll3;->c:Ljava/util/ArrayList;

    .line 270
    .line 271
    if-nez v0, :cond_b

    .line 272
    .line 273
    new-instance v0, Ljava/util/ArrayList;

    .line 274
    .line 275
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .line 277
    .line 278
    iput-object v0, v4, Ll3;->c:Ljava/util/ArrayList;

    .line 279
    .line 280
    goto :goto_5

    .line 281
    :catchall_0
    move-exception p0

    .line 282
    goto :goto_7

    .line 283
    :cond_b
    :goto_5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    goto :goto_6

    .line 287
    :cond_c
    new-instance v0, Lm3;

    .line 288
    .line 289
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 290
    .line 291
    .line 292
    iput-object p1, v0, Lm3;->c:Ljava/lang/String;

    .line 293
    .line 294
    iput-object v7, v0, Lm3;->d:Ljava/util/HashSet;

    .line 295
    .line 296
    iput-boolean v6, v0, Lm3;->e:Z

    .line 297
    .line 298
    iget-object p1, v4, Ll3;->d:Ljava/util/ArrayList;

    .line 299
    .line 300
    if-nez p1, :cond_d

    .line 301
    .line 302
    new-instance p1, Ljava/util/ArrayList;

    .line 303
    .line 304
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 305
    .line 306
    .line 307
    iput-object p1, v4, Ll3;->d:Ljava/util/ArrayList;

    .line 308
    .line 309
    :cond_d
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    .line 311
    .line 312
    :goto_6
    monitor-exit v4

    .line 313
    goto :goto_8

    .line 314
    :goto_7
    monitor-exit v4

    .line 315
    throw p0

    .line 316
    :cond_e
    const-string v0, "$"

    .line 317
    .line 318
    invoke-static {p1, v0, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    if-nez v0, :cond_11

    .line 323
    .line 324
    const-string v0, "|"

    .line 325
    .line 326
    invoke-static {p1, v0, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    if-eqz v0, :cond_f

    .line 331
    .line 332
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    move v1, v2

    .line 337
    :cond_f
    invoke-static {p1}, Lbv;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    if-eqz v1, :cond_10

    .line 342
    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    const-string v1, "^"

    .line 346
    .line 347
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    :cond_10
    iget-object v0, p0, Ln3;->c:Ljava/lang/StringBuilder;

    .line 358
    .line 359
    monitor-enter v0

    .line 360
    :try_start_1
    iget-object v1, p0, Ln3;->c:Ljava/lang/StringBuilder;

    .line 361
    .line 362
    const/16 v2, 0x7c

    .line 363
    .line 364
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    iget-object v1, p0, Ln3;->c:Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 370
    .line 371
    .line 372
    monitor-exit v0

    .line 373
    goto :goto_8

    .line 374
    :catchall_1
    move-exception p0

    .line 375
    monitor-exit v0

    .line 376
    throw p0

    .line 377
    :cond_11
    :goto_8
    invoke-virtual {p2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    goto/16 :goto_0

    .line 382
    .line 383
    :cond_12
    return-void
.end method

.method public final d(Ljava/io/File;)V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    .line 2
    .line 3
    new-instance v1, Ljava/io/FileReader;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    if-nez v1, :cond_1

    .line 27
    .line 28
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_3
    const-string v2, "["

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Ln3;->c(Ljava/lang/String;Ljava/io/BufferedReader;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-virtual {p0, v1, v0}, Ln3;->e(Ljava/lang/String;Ljava/io/BufferedReader;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    .line 47
    .line 48
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_2
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 53
    :catchall_1
    move-exception v1

    .line 54
    :try_start_6
    invoke-static {v0, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    throw v1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 58
    :catch_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/io/BufferedReader;)V
    .locals 3

    .line 1
    :goto_0
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-static {p1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "#"

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p1, v0, v1}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Ln3;->d:Ljava/util/regex/Pattern;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    array-length v0, p1

    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne v0, v2, :cond_0

    .line 35
    .line 36
    aget-object p1, p1, v1

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ln3;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_0
    array-length v0, p1

    .line 46
    :goto_1
    if-ge v2, v0, :cond_1

    .line 47
    .line 48
    aget-object v1, p1, v2

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ln3;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_2
    invoke-virtual {p2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void
.end method

.method public final f(Ljava/io/InputStream;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    .line 2
    .line 3
    new-instance v1, Ljava/io/InputStreamReader;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 18
    .line 19
    .line 20
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_3
    const-string v1, "["

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {p1, v1, v2}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Ln3;->c(Ljava/lang/String;Ljava/io/BufferedReader;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-virtual {p0, p1, v0}, Ln3;->e(Ljava/lang/String;Ljava/io/BufferedReader;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    .line 47
    .line 48
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_2
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 53
    :catchall_1
    move-exception p1

    .line 54
    :try_start_6
    invoke-static {v0, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    throw p1
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 58
    :catch_0
    return-void
.end method

.method public final g(Landroid/net/Uri;Ljava/lang/String;)Z
    .locals 17

    .line 1
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1b

    .line 7
    .line 8
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    :goto_0
    const/16 v2, 0x2e

    .line 18
    .line 19
    const/4 v3, 0x6

    .line 20
    invoke-static {v0, v2, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/4 v5, -0x1

    .line 25
    if-eq v4, v5, :cond_1b

    .line 26
    .line 27
    move-object/from16 v6, p0

    .line 28
    .line 29
    iget-object v7, v6, Ln3;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 30
    .line 31
    invoke-virtual {v7, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    check-cast v7, Ll3;

    .line 36
    .line 37
    if-eqz v7, :cond_19

    .line 38
    .line 39
    const-string v8, "^"

    .line 40
    .line 41
    iget-boolean v9, v7, Ll3;->a:Z

    .line 42
    .line 43
    const/4 v10, 0x1

    .line 44
    const/4 v11, 0x0

    .line 45
    if-eqz v9, :cond_0

    .line 46
    .line 47
    :goto_1
    move v8, v10

    .line 48
    goto/16 :goto_8

    .line 49
    .line 50
    :cond_0
    iget-object v9, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 51
    .line 52
    if-nez v9, :cond_1

    .line 53
    .line 54
    iget-object v9, v7, Ll3;->c:Ljava/util/ArrayList;

    .line 55
    .line 56
    if-nez v9, :cond_1

    .line 57
    .line 58
    :goto_2
    move v8, v1

    .line 59
    goto/16 :goto_8

    .line 60
    .line 61
    :cond_1
    iget-object v9, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 62
    .line 63
    if-nez v9, :cond_7

    .line 64
    .line 65
    monitor-enter v7

    .line 66
    :try_start_0
    iget-object v9, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 67
    .line 68
    if-nez v9, :cond_6

    .line 69
    .line 70
    iget-object v9, v7, Ll3;->c:Ljava/util/ArrayList;

    .line 71
    .line 72
    if-eqz v9, :cond_6

    .line 73
    .line 74
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v12

    .line 78
    if-nez v12, :cond_6

    .line 79
    .line 80
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    if-ne v12, v10, :cond_4

    .line 85
    .line 86
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    check-cast v9, Ljava/lang/String;

    .line 94
    .line 95
    const-string v12, "/"

    .line 96
    .line 97
    invoke-virtual {v9, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v12

    .line 101
    if-nez v12, :cond_3

    .line 102
    .line 103
    const-string v12, "^"

    .line 104
    .line 105
    invoke-virtual {v9, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    if-eqz v12, :cond_2

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_2
    invoke-static {v9}, Lbv;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    iput-object v8, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :catchall_0
    move-exception v0

    .line 128
    goto :goto_6

    .line 129
    :cond_3
    :goto_3
    iput-object v11, v7, Ll3;->c:Ljava/util/ArrayList;

    .line 130
    .line 131
    iput-boolean v10, v7, Ll3;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .line 133
    monitor-exit v7

    .line 134
    goto :goto_1

    .line 135
    :cond_4
    :try_start_1
    new-instance v8, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v12, "^(?:"

    .line 138
    .line 139
    invoke-direct {v8, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v12

    .line 146
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    check-cast v12, Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v12}, Lbv;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v12

    .line 155
    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 159
    .line 160
    .line 161
    move-result v12

    .line 162
    move v13, v10

    .line 163
    :goto_4
    if-ge v13, v12, :cond_5

    .line 164
    .line 165
    const/16 v14, 0x7c

    .line 166
    .line 167
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v14

    .line 174
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    check-cast v14, Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v14}, Lbv;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v14

    .line 183
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    add-int/lit8 v13, v13, 0x1

    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_5
    const/16 v9, 0x29

    .line 190
    .line 191
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    iput-object v8, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 203
    .line 204
    :goto_5
    iput-object v11, v7, Ll3;->c:Ljava/util/ArrayList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    .line 206
    :cond_6
    monitor-exit v7

    .line 207
    goto :goto_7

    .line 208
    :goto_6
    monitor-exit v7

    .line 209
    throw v0

    .line 210
    :cond_7
    :goto_7
    iget-object v8, v7, Ll3;->b:Ljava/util/regex/Pattern;

    .line 211
    .line 212
    if-nez v8, :cond_8

    .line 213
    .line 214
    goto/16 :goto_2

    .line 215
    .line 216
    :cond_8
    invoke-static/range {p1 .. p1}, Ln3;->b(Landroid/net/Uri;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v9

    .line 220
    invoke-virtual {v8, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    .line 225
    .line 226
    .line 227
    move-result v8

    .line 228
    :goto_8
    if-nez v8, :cond_18

    .line 229
    .line 230
    iget-object v7, v7, Ll3;->d:Ljava/util/ArrayList;

    .line 231
    .line 232
    if-nez v7, :cond_a

    .line 233
    .line 234
    :cond_9
    :goto_9
    move/from16 v16, v1

    .line 235
    .line 236
    goto/16 :goto_14

    .line 237
    .line 238
    :cond_a
    if-eqz p2, :cond_b

    .line 239
    .line 240
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    .line 241
    .line 242
    .line 243
    move-result v8

    .line 244
    if-nez v8, :cond_c

    .line 245
    .line 246
    :cond_b
    move/from16 v16, v1

    .line 247
    .line 248
    goto/16 :goto_13

    .line 249
    .line 250
    :cond_c
    :try_start_2
    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 251
    .line 252
    .line 253
    move-result-object v8

    .line 254
    invoke-virtual {v8}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 258
    goto :goto_a

    .line 259
    :catch_0
    move-object v8, v11

    .line 260
    :goto_a
    if-nez v8, :cond_d

    .line 261
    .line 262
    goto :goto_9

    .line 263
    :cond_d
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 268
    .line 269
    .line 270
    move-object v9, v11

    .line 271
    :cond_e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 272
    .line 273
    .line 274
    move-result v12

    .line 275
    if-eqz v12, :cond_9

    .line 276
    .line 277
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v12

    .line 281
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 282
    .line 283
    .line 284
    check-cast v12, Lm3;

    .line 285
    .line 286
    move-object v13, v8

    .line 287
    :goto_b
    invoke-static {v13, v2, v1, v3}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 288
    .line 289
    .line 290
    move-result v14

    .line 291
    if-eq v14, v5, :cond_e

    .line 292
    .line 293
    iget-object v15, v12, Lm3;->d:Ljava/util/HashSet;

    .line 294
    .line 295
    if-eqz v15, :cond_f

    .line 296
    .line 297
    invoke-virtual {v15, v13}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v15

    .line 301
    if-ne v15, v10, :cond_f

    .line 302
    .line 303
    move/from16 v16, v1

    .line 304
    .line 305
    move v15, v10

    .line 306
    goto :goto_c

    .line 307
    :cond_f
    move v15, v1

    .line 308
    move/from16 v16, v15

    .line 309
    .line 310
    :goto_c
    iget-boolean v1, v12, Lm3;->e:Z

    .line 311
    .line 312
    if-eq v15, v1, :cond_17

    .line 313
    .line 314
    iget-boolean v15, v12, Lm3;->a:Z

    .line 315
    .line 316
    if-eqz v15, :cond_10

    .line 317
    .line 318
    goto/16 :goto_14

    .line 319
    .line 320
    :cond_10
    iget-object v1, v12, Lm3;->b:Ljava/util/regex/Pattern;

    .line 321
    .line 322
    if-nez v1, :cond_15

    .line 323
    .line 324
    monitor-enter v12

    .line 325
    :try_start_3
    iget-object v1, v12, Lm3;->b:Ljava/util/regex/Pattern;

    .line 326
    .line 327
    if-nez v1, :cond_14

    .line 328
    .line 329
    iget-object v1, v12, Lm3;->c:Ljava/lang/String;

    .line 330
    .line 331
    if-nez v1, :cond_11

    .line 332
    .line 333
    const-string v1, "/"

    .line 334
    .line 335
    goto :goto_d

    .line 336
    :catchall_1
    move-exception v0

    .line 337
    goto :goto_11

    .line 338
    :cond_11
    :goto_d
    const-string v15, "/"

    .line 339
    .line 340
    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result v15

    .line 344
    if-nez v15, :cond_13

    .line 345
    .line 346
    const-string v15, "^"

    .line 347
    .line 348
    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result v15

    .line 352
    if-eqz v15, :cond_12

    .line 353
    .line 354
    goto :goto_e

    .line 355
    :cond_12
    invoke-static {v1}, Lbv;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    new-instance v15, Ljava/lang/StringBuilder;

    .line 360
    .line 361
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 362
    .line 363
    .line 364
    const-string v2, "^"

    .line 365
    .line 366
    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    iput-object v1, v12, Lm3;->b:Ljava/util/regex/Pattern;

    .line 381
    .line 382
    goto :goto_10

    .line 383
    :cond_13
    :goto_e
    iput-object v11, v12, Lm3;->c:Ljava/lang/String;

    .line 384
    .line 385
    iput-boolean v10, v12, Lm3;->a:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 386
    .line 387
    monitor-exit v12

    .line 388
    :goto_f
    move v1, v10

    .line 389
    goto :goto_14

    .line 390
    :cond_14
    :goto_10
    monitor-exit v12

    .line 391
    goto :goto_12

    .line 392
    :goto_11
    monitor-exit v12

    .line 393
    throw v0

    .line 394
    :cond_15
    :goto_12
    if-nez v9, :cond_16

    .line 395
    .line 396
    invoke-static/range {p1 .. p1}, Ln3;->b(Landroid/net/Uri;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v9

    .line 400
    :cond_16
    iget-object v1, v12, Lm3;->b:Ljava/util/regex/Pattern;

    .line 401
    .line 402
    if-eqz v1, :cond_17

    .line 403
    .line 404
    invoke-virtual {v1, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    if-eqz v1, :cond_17

    .line 413
    .line 414
    goto :goto_f

    .line 415
    :cond_17
    add-int/lit8 v14, v14, 0x1

    .line 416
    .line 417
    invoke-virtual {v13, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v13

    .line 421
    move/from16 v1, v16

    .line 422
    .line 423
    const/16 v2, 0x2e

    .line 424
    .line 425
    goto/16 :goto_b

    .line 426
    .line 427
    :goto_13
    move/from16 v1, v16

    .line 428
    .line 429
    :goto_14
    if-eqz v1, :cond_1a

    .line 430
    .line 431
    :cond_18
    return v10

    .line 432
    :cond_19
    move/from16 v16, v1

    .line 433
    .line 434
    :cond_1a
    add-int/lit8 v4, v4, 0x1

    .line 435
    .line 436
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    move/from16 v1, v16

    .line 441
    .line 442
    goto/16 :goto_0

    .line 443
    .line 444
    :cond_1b
    move/from16 v16, v1

    .line 445
    .line 446
    return v16
.end method
