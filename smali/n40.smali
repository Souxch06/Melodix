.class public final Ln40;
.super Lzs0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final d:Lg5;


# instance fields
.field public final b:Lop0;

.field public final c:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ln40;->d:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lop0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ln40;->c:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p1, p0, Ln40;->b:Lop0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 9

    .line 1
    iget-object v0, p0, Ln40;->b:Lop0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lop0;->D()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    move v1, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    :goto_0
    const/4 v3, 0x0

    .line 21
    sget-object v4, Ln40;->d:Lg5;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    return v3

    .line 29
    :cond_1
    invoke-virtual {v0}, Lop0;->D()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v5, 0x0

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    :try_start_0
    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 38
    .line 39
    .line 40
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    goto :goto_2

    .line 42
    :catch_0
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception v1

    .line 45
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v6, "getResultUrl throws exception %s"

    .line 54
    .line 55
    invoke-virtual {v4, v6, v1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :goto_2
    if-nez v5, :cond_3

    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    return v3

    .line 64
    :cond_3
    iget-object p0, p0, Ln40;->c:Landroid/content/Context;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v6, "array"

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v7, "firebase_performance_whitelisted_domains"

    .line 77
    .line 78
    invoke-virtual {v1, v7, v6, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_4

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_4
    invoke-static {}, Lg5;->c()Lg5;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    sget-object v6, Lea1;->k:[Ljava/lang/String;

    .line 93
    .line 94
    if-nez v6, :cond_5

    .line 95
    .line 96
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sput-object p0, Lea1;->k:[Ljava/lang/String;

    .line 101
    .line 102
    :cond_5
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    if-nez p0, :cond_6

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_6
    sget-object v1, Lea1;->k:[Ljava/lang/String;

    .line 110
    .line 111
    array-length v6, v1

    .line 112
    move v7, v3

    .line 113
    :goto_3
    if-ge v7, v6, :cond_20

    .line 114
    .line 115
    aget-object v8, v1, v7

    .line 116
    .line 117
    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v8

    .line 121
    if-eqz v8, :cond_1f

    .line 122
    .line 123
    :goto_4
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    if-eqz p0, :cond_1e

    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_1e

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    const/16 v1, 0xff

    .line 144
    .line 145
    if-gt p0, v1, :cond_1e

    .line 146
    .line 147
    invoke-virtual {v5}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    if-nez p0, :cond_7

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :cond_7
    const-string v1, "http"

    .line 155
    .line 156
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_9

    .line 161
    .line 162
    const-string v1, "https"

    .line 163
    .line 164
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-eqz p0, :cond_8

    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_8
    :goto_5
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 172
    .line 173
    .line 174
    return v3

    .line 175
    :cond_9
    :goto_6
    invoke-virtual {v5}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    if-nez p0, :cond_1d

    .line 180
    .line 181
    invoke-virtual {v5}, Ljava/net/URI;->getPort()I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    const/4 v1, -0x1

    .line 186
    if-eq p0, v1, :cond_b

    .line 187
    .line 188
    if-lez p0, :cond_a

    .line 189
    .line 190
    goto :goto_7

    .line 191
    :cond_a
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    return v3

    .line 195
    :cond_b
    :goto_7
    invoke-virtual {v0}, Lop0;->F()Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_c

    .line 200
    .line 201
    invoke-virtual {v0}, Lop0;->v()I

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    goto :goto_8

    .line 206
    :cond_c
    move p0, v3

    .line 207
    :goto_8
    if-eqz p0, :cond_1c

    .line 208
    .line 209
    if-eq p0, v2, :cond_1c

    .line 210
    .line 211
    invoke-virtual {v0}, Lop0;->G()Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_e

    .line 216
    .line 217
    invoke-virtual {v0}, Lop0;->w()I

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-lez p0, :cond_d

    .line 222
    .line 223
    goto :goto_9

    .line 224
    :cond_d
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    .line 226
    .line 227
    return v3

    .line 228
    :cond_e
    :goto_9
    invoke-virtual {v0}, Lop0;->H()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    const-wide/16 v5, 0x0

    .line 233
    .line 234
    if-eqz p0, :cond_10

    .line 235
    .line 236
    invoke-virtual {v0}, Lop0;->y()J

    .line 237
    .line 238
    .line 239
    move-result-wide v7

    .line 240
    cmp-long p0, v7, v5

    .line 241
    .line 242
    if-ltz p0, :cond_f

    .line 243
    .line 244
    goto :goto_a

    .line 245
    :cond_f
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 246
    .line 247
    .line 248
    return v3

    .line 249
    :cond_10
    :goto_a
    invoke-virtual {v0}, Lop0;->I()Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    if-eqz p0, :cond_12

    .line 254
    .line 255
    invoke-virtual {v0}, Lop0;->z()J

    .line 256
    .line 257
    .line 258
    move-result-wide v7

    .line 259
    cmp-long p0, v7, v5

    .line 260
    .line 261
    if-ltz p0, :cond_11

    .line 262
    .line 263
    goto :goto_b

    .line 264
    :cond_11
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    return v3

    .line 268
    :cond_12
    :goto_b
    invoke-virtual {v0}, Lop0;->E()Z

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    if-eqz p0, :cond_1b

    .line 273
    .line 274
    invoke-virtual {v0}, Lop0;->t()J

    .line 275
    .line 276
    .line 277
    move-result-wide v7

    .line 278
    cmp-long p0, v7, v5

    .line 279
    .line 280
    if-gtz p0, :cond_13

    .line 281
    .line 282
    goto :goto_f

    .line 283
    :cond_13
    invoke-virtual {v0}, Lop0;->J()Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    if-eqz p0, :cond_15

    .line 288
    .line 289
    invoke-virtual {v0}, Lop0;->A()J

    .line 290
    .line 291
    .line 292
    move-result-wide v7

    .line 293
    cmp-long p0, v7, v5

    .line 294
    .line 295
    if-ltz p0, :cond_14

    .line 296
    .line 297
    goto :goto_c

    .line 298
    :cond_14
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 299
    .line 300
    .line 301
    return v3

    .line 302
    :cond_15
    :goto_c
    invoke-virtual {v0}, Lop0;->L()Z

    .line 303
    .line 304
    .line 305
    move-result p0

    .line 306
    if-eqz p0, :cond_17

    .line 307
    .line 308
    invoke-virtual {v0}, Lop0;->C()J

    .line 309
    .line 310
    .line 311
    move-result-wide v7

    .line 312
    cmp-long p0, v7, v5

    .line 313
    .line 314
    if-ltz p0, :cond_16

    .line 315
    .line 316
    goto :goto_d

    .line 317
    :cond_16
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 318
    .line 319
    .line 320
    return v3

    .line 321
    :cond_17
    :goto_d
    invoke-virtual {v0}, Lop0;->K()Z

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    if-eqz p0, :cond_1a

    .line 326
    .line 327
    invoke-virtual {v0}, Lop0;->B()J

    .line 328
    .line 329
    .line 330
    move-result-wide v7

    .line 331
    cmp-long p0, v7, v5

    .line 332
    .line 333
    if-gtz p0, :cond_18

    .line 334
    .line 335
    goto :goto_e

    .line 336
    :cond_18
    invoke-virtual {v0}, Lop0;->G()Z

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    if-nez p0, :cond_19

    .line 341
    .line 342
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 343
    .line 344
    .line 345
    return v3

    .line 346
    :cond_19
    return v2

    .line 347
    :cond_1a
    :goto_e
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 348
    .line 349
    .line 350
    return v3

    .line 351
    :cond_1b
    :goto_f
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 352
    .line 353
    .line 354
    return v3

    .line 355
    :cond_1c
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    .line 357
    .line 358
    return v3

    .line 359
    :cond_1d
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 360
    .line 361
    .line 362
    return v3

    .line 363
    :cond_1e
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 364
    .line 365
    .line 366
    return v3

    .line 367
    :cond_1f
    add-int/lit8 v7, v7, 0x1

    .line 368
    .line 369
    goto/16 :goto_3

    .line 370
    .line 371
    :cond_20
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 375
    .line 376
    .line 377
    return v3
.end method
