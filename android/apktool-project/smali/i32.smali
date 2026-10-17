.class public final Li32;
.super Lms1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic l:I

.field public final m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lc9;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Li32;->l:I

    .line 82
    const-string v0, "internal.eventLogger"

    invoke-direct {p0, v0}, Lms1;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Li32;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Le02;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Li32;->l:I

    .line 83
    const-string v0, "internal.appMetadata"

    invoke-direct {p0, v0}, Lms1;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Li32;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lka2;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Li32;->l:I

    .line 85
    const-string v0, "internal.registerCallback"

    invoke-direct {p0, v0}, Lms1;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Li32;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lny0;)V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Li32;->l:I

    .line 3
    .line 4
    const-string v1, "internal.logger"

    .line 5
    .line 6
    invoke-direct {p0, v1}, Lms1;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Li32;->m:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 12
    .line 13
    new-instance v1, Lpc2;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-direct {v1, p0, v2, v3}, Lpc2;-><init>(Li32;ZZ)V

    .line 18
    .line 19
    .line 20
    const-string v4, "log"

    .line 21
    .line 22
    invoke-virtual {p1, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 26
    .line 27
    new-instance v1, Lo72;

    .line 28
    .line 29
    const-string v5, "silent"

    .line 30
    .line 31
    invoke-direct {v1, v5, v3}, Lo72;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lms1;

    .line 44
    .line 45
    new-instance v1, Lpc2;

    .line 46
    .line 47
    invoke-direct {v1, p0, v3, v3}, Lpc2;-><init>(Li32;ZZ)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v4, v1}, Lms1;->b(Ljava/lang/String;Lst1;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 54
    .line 55
    new-instance v1, Lo72;

    .line 56
    .line 57
    const-string v3, "unmonitored"

    .line 58
    .line 59
    invoke-direct {v1, v3, v0}, Lo72;-><init>(Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lms1;->k:Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lms1;

    .line 72
    .line 73
    new-instance v0, Lpc2;

    .line 74
    .line 75
    invoke-direct {v0, p0, v2, v2}, Lpc2;-><init>(Li32;ZZ)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v4, v0}, Lms1;->b(Ljava/lang/String;Lst1;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public constructor <init>(Lo72;Lxn0;)V
    .locals 0

    const/4 p1, 0x1

    iput p1, p0, Li32;->l:I

    .line 84
    iput-object p2, p0, Li32;->m:Ljava/lang/Object;

    const-string p1, "getValue"

    invoke-direct {p0, p1}, Lms1;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a(Ler0;Ljava/util/List;)Lst1;
    .locals 9

    .line 1
    iget v0, p0, Li32;->l:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    iget-object v2, p0, Lms1;->j:Ljava/lang/String;

    .line 5
    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, 0x1

    .line 8
    const/4 v5, 0x0

    .line 9
    sget-object v6, Lst1;->b:Lzt1;

    .line 10
    .line 11
    iget-object p0, p0, Li32;->m:Ljava/lang/Object;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    invoke-static {v2, v1, p2}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lst1;

    .line 25
    .line 26
    iget-object v1, p1, Ler0;->l:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Lxn0;

    .line 29
    .line 30
    invoke-virtual {v1, p1, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lst1;->e()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lst1;

    .line 42
    .line 43
    iget-object v1, p1, Ler0;->l:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, Lxn0;

    .line 46
    .line 47
    invoke-virtual {v1, p1, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    instance-of v2, v0, Lqt1;

    .line 52
    .line 53
    if-eqz v2, :cond_6

    .line 54
    .line 55
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lst1;

    .line 60
    .line 61
    invoke-virtual {v1, p1, p2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    instance-of p2, p1, Lnt1;

    .line 66
    .line 67
    if-eqz p2, :cond_5

    .line 68
    .line 69
    check-cast p1, Lnt1;

    .line 70
    .line 71
    iget-object p2, p1, Lnt1;->j:Ljava/util/HashMap;

    .line 72
    .line 73
    const-string v1, "type"

    .line 74
    .line 75
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Lnt1;->h(Ljava/lang/String;)Lst1;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {v1}, Lst1;->e()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "priority"

    .line 90
    .line 91
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_0

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Lnt1;->h(Ljava/lang/String;)Lst1;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-interface {p1}, Lst1;->f()Ljava/lang/Double;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 106
    .line 107
    .line 108
    move-result-wide p1

    .line 109
    invoke-static {p1, p2}, Lbe2;->S(D)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    goto :goto_0

    .line 114
    :cond_0
    const/16 p1, 0x3e8

    .line 115
    .line 116
    :goto_0
    check-cast p0, Lka2;

    .line 117
    .line 118
    check-cast v0, Lqt1;

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    const-string p2, "create"

    .line 124
    .line 125
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_1

    .line 130
    .line 131
    iget-object p0, p0, Lka2;->b:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast p0, Ljava/util/TreeMap;

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    const-string p2, "edit"

    .line 137
    .line 138
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_3

    .line 143
    .line 144
    iget-object p0, p0, Lka2;->a:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast p0, Ljava/util/TreeMap;

    .line 147
    .line 148
    :goto_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p0, p2}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    if-eqz p2, :cond_2

    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/util/TreeMap;->lastKey()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Ljava/lang/Integer;

    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    add-int/2addr p1, v4

    .line 169
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p0, p1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_3
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    const-string p1, "Unknown callback type: "

    .line 182
    .line 183
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :goto_2
    move-object v6, v7

    .line 191
    goto :goto_3

    .line 192
    :cond_4
    const-string p0, "Undefined rule type"

    .line 193
    .line 194
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_5
    const-string p0, "Invalid callback params"

    .line 199
    .line 200
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_6
    const-string p0, "Invalid callback type"

    .line 205
    .line 206
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    goto :goto_2

    .line 210
    :goto_3
    return-object v6

    .line 211
    :pswitch_0
    :try_start_0
    check-cast p0, Le02;

    .line 212
    .line 213
    invoke-virtual {p0}, Le02;->call()Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {p0}, Lxg;->t(Ljava/lang/Object;)Lst1;

    .line 218
    .line 219
    .line 220
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :catch_0
    :pswitch_1
    return-object v6

    .line 222
    :pswitch_2
    const-string v0, "getValue"

    .line 223
    .line 224
    invoke-static {v0, v3, p2}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 225
    .line 226
    .line 227
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Lst1;

    .line 232
    .line 233
    iget-object v1, p1, Ler0;->l:Ljava/lang/Object;

    .line 234
    .line 235
    check-cast v1, Lxn0;

    .line 236
    .line 237
    invoke-virtual {v1, p1, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    check-cast p2, Lst1;

    .line 246
    .line 247
    iget-object v1, p1, Ler0;->l:Ljava/lang/Object;

    .line 248
    .line 249
    check-cast v1, Lxn0;

    .line 250
    .line 251
    invoke-virtual {v1, p1, p2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-interface {v0}, Lst1;->e()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    check-cast p0, Lxn0;

    .line 260
    .line 261
    iget-object v0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 262
    .line 263
    check-cast v0, Lk02;

    .line 264
    .line 265
    iget-object v0, v0, Lk02;->m:Lda;

    .line 266
    .line 267
    iget-object p0, p0, Lxn0;->k:Ljava/lang/Object;

    .line 268
    .line 269
    check-cast p0, Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v0, p0, v7}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    check-cast p0, Ljava/util/Map;

    .line 276
    .line 277
    if-eqz p0, :cond_8

    .line 278
    .line 279
    invoke-interface {p0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-nez v0, :cond_7

    .line 284
    .line 285
    goto :goto_4

    .line 286
    :cond_7
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    move-object v7, p0

    .line 291
    check-cast v7, Ljava/lang/String;

    .line 292
    .line 293
    :cond_8
    :goto_4
    if-eqz v7, :cond_9

    .line 294
    .line 295
    new-instance p1, Lxt1;

    .line 296
    .line 297
    invoke-direct {p1, v7}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    :cond_9
    return-object p1

    .line 301
    :pswitch_3
    invoke-static {v2, v1, p2}, Lbe2;->K(Ljava/lang/String;ILjava/util/List;)V

    .line 302
    .line 303
    .line 304
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    check-cast v0, Lst1;

    .line 309
    .line 310
    iget-object v1, p1, Ler0;->l:Ljava/lang/Object;

    .line 311
    .line 312
    check-cast v1, Lxn0;

    .line 313
    .line 314
    invoke-virtual {v1, p1, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-interface {v0}, Lst1;->e()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    check-cast v1, Lst1;

    .line 327
    .line 328
    iget-object v2, p1, Ler0;->l:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast v2, Lxn0;

    .line 331
    .line 332
    invoke-virtual {v2, p1, v1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-interface {v1}, Lst1;->f()Ljava/lang/Double;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 341
    .line 342
    .line 343
    move-result-wide v4

    .line 344
    invoke-static {v4, v5}, Lbe2;->T(D)D

    .line 345
    .line 346
    .line 347
    move-result-wide v4

    .line 348
    double-to-long v4, v4

    .line 349
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object p2

    .line 353
    check-cast p2, Lst1;

    .line 354
    .line 355
    invoke-virtual {v2, p1, p2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    instance-of p2, p1, Lnt1;

    .line 360
    .line 361
    if-eqz p2, :cond_a

    .line 362
    .line 363
    check-cast p1, Lnt1;

    .line 364
    .line 365
    invoke-static {p1}, Lbe2;->V(Lnt1;)Ljava/util/HashMap;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    goto :goto_5

    .line 370
    :cond_a
    new-instance p1, Ljava/util/HashMap;

    .line 371
    .line 372
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 373
    .line 374
    .line 375
    :goto_5
    check-cast p0, Lc9;

    .line 376
    .line 377
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 378
    .line 379
    .line 380
    new-instance p2, Ljava/util/HashMap;

    .line 381
    .line 382
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 383
    .line 384
    .line 385
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 394
    .line 395
    .line 396
    move-result v2

    .line 397
    if-eqz v2, :cond_c

    .line 398
    .line 399
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    check-cast v2, Ljava/lang/String;

    .line 404
    .line 405
    iget-object v3, p0, Lc9;->k:Ljava/lang/Object;

    .line 406
    .line 407
    check-cast v3, Lcn1;

    .line 408
    .line 409
    iget-object v3, v3, Lcn1;->c:Ljava/util/HashMap;

    .line 410
    .line 411
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v8

    .line 415
    if-eqz v8, :cond_b

    .line 416
    .line 417
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    move-result-object v3

    .line 421
    goto :goto_7

    .line 422
    :cond_b
    move-object v3, v7

    .line 423
    :goto_7
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v8

    .line 427
    invoke-static {v2, v3, v8}, Lcn1;->b(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    invoke-virtual {p2, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    goto :goto_6

    .line 435
    :cond_c
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 436
    .line 437
    check-cast p0, Ljava/util/ArrayList;

    .line 438
    .line 439
    new-instance p1, Lcn1;

    .line 440
    .line 441
    invoke-direct {p1, v0, v4, v5, p2}, Lcn1;-><init>(Ljava/lang/String;JLjava/util/HashMap;)V

    .line 442
    .line 443
    .line 444
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    return-object v6

    .line 448
    nop

    .line 449
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
