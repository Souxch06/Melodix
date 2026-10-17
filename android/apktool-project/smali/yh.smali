.class public final Lyh;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;


# instance fields
.field public final a:Led0;

.field public final b:Lsb0;

.field public final c:Ljava/lang/String;

.field public final d:Liw0;

.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:Lsb0;

.field public final h:Lnb0;

.field public final i:J

.field public final j:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lgt0;->a:Lgt0;

    .line 2
    .line 3
    sget-object v0, Lgt0;->a:Lgt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "OkHttp-Sent-Millis"

    .line 9
    .line 10
    sput-object v0, Lyh;->k:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v0, Lgt0;->a:Lgt0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const-string v0, "OkHttp-Received-Millis"

    .line 18
    .line 19
    sput-object v0, Lyh;->l:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lf11;)V
    .locals 10

    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iget-object v0, p1, Lf11;->j:Lm01;

    .line 313
    iget-object v1, v0, Lm01;->a:Led0;

    .line 314
    iput-object v1, p0, Lyh;->a:Led0;

    .line 315
    iget-object v1, p1, Lf11;->q:Lf11;

    .line 316
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    iget-object v1, v1, Lf11;->j:Lm01;

    .line 318
    iget-object v1, v1, Lm01;->c:Lsb0;

    .line 319
    iget-object v2, p1, Lf11;->o:Lsb0;

    .line 320
    invoke-static {v2}, Lbe2;->w(Lsb0;)Ljava/util/Set;

    move-result-object v3

    .line 321
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v1, Ljg1;->b:Lsb0;

    goto :goto_1

    .line 322
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0x14

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 323
    invoke-virtual {v1}, Lsb0;->size()I

    move-result v5

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v5, :cond_2

    .line 324
    invoke-virtual {v1, v7}, Lsb0;->c(I)Ljava/lang/String;

    move-result-object v8

    .line 325
    invoke-interface {v3, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 326
    invoke-virtual {v1, v7}, Lsb0;->e(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 327
    invoke-static {v8}, Lml;->g(Ljava/lang/String;)V

    .line 328
    invoke-static {v9, v8}, Lml;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    invoke-static {v9}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 331
    :cond_2
    new-instance v1, Lsb0;

    .line 332
    new-array v3, v6, [Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 333
    invoke-direct {v1, v3}, Lsb0;-><init>([Ljava/lang/String;)V

    .line 334
    :goto_1
    iput-object v1, p0, Lyh;->b:Lsb0;

    .line 335
    iget-object v0, v0, Lm01;->b:Ljava/lang/String;

    .line 336
    iput-object v0, p0, Lyh;->c:Ljava/lang/String;

    .line 337
    iget-object v0, p1, Lf11;->k:Liw0;

    .line 338
    iput-object v0, p0, Lyh;->d:Liw0;

    .line 339
    iget v0, p1, Lf11;->m:I

    .line 340
    iput v0, p0, Lyh;->e:I

    .line 341
    iget-object v0, p1, Lf11;->l:Ljava/lang/String;

    .line 342
    iput-object v0, p0, Lyh;->f:Ljava/lang/String;

    .line 343
    iput-object v2, p0, Lyh;->g:Lsb0;

    .line 344
    iget-object v0, p1, Lf11;->n:Lnb0;

    .line 345
    iput-object v0, p0, Lyh;->h:Lnb0;

    .line 346
    iget-wide v0, p1, Lf11;->t:J

    .line 347
    iput-wide v0, p0, Lyh;->i:J

    .line 348
    iget-wide v0, p1, Lf11;->u:J

    .line 349
    iput-wide v0, p0, Lyh;->j:J

    return-void
.end method

.method public constructor <init>(Lp81;)V
    .locals 12

    .line 1
    const-string v0, "Cache corruption for "

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    new-instance v1, Lsx0;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Lsx0;-><init>(Lp81;)V

    .line 12
    .line 13
    .line 14
    const-wide v2, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    const/4 v5, 0x0

    .line 24
    :try_start_1
    new-instance v6, Ldd0;

    .line 25
    .line 26
    invoke-direct {v6}, Ldd0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v6, v5, v4}, Ldd0;->c(Led0;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v6}, Ldd0;->a()Led0;

    .line 33
    .line 34
    .line 35
    move-result-object v6
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-object v6, v5

    .line 38
    :goto_0
    if-eqz v6, :cond_7

    .line 39
    .line 40
    :try_start_2
    iput-object v6, p0, Lyh;->a:Led0;

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lyh;->c:Ljava/lang/String;

    .line 47
    .line 48
    new-instance v0, Lrb0;

    .line 49
    .line 50
    invoke-direct {v0}, Lrb0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Lbe2;->s(Lsx0;)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    const/4 v6, 0x0

    .line 58
    move v7, v6

    .line 59
    :goto_1
    if-ge v7, v4, :cond_0

    .line 60
    .line 61
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-virtual {v0, v8}, Lrb0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    add-int/lit8 v7, v7, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto/16 :goto_6

    .line 73
    .line 74
    :cond_0
    invoke-virtual {v0}, Lrb0;->c()Lsb0;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lyh;->b:Lsb0;

    .line 79
    .line 80
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Les0;->l(Ljava/lang/String;)Lo7;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v4, v0, Lo7;->c:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v4, Liw0;

    .line 91
    .line 92
    iput-object v4, p0, Lyh;->d:Liw0;

    .line 93
    .line 94
    iget v4, v0, Lo7;->b:I

    .line 95
    .line 96
    iput v4, p0, Lyh;->e:I

    .line 97
    .line 98
    iget-object v0, v0, Lo7;->d:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v0, Ljava/lang/String;

    .line 101
    .line 102
    iput-object v0, p0, Lyh;->f:Ljava/lang/String;

    .line 103
    .line 104
    new-instance v0, Lrb0;

    .line 105
    .line 106
    invoke-direct {v0}, Lrb0;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {v1}, Lbe2;->s(Lsx0;)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    move v7, v6

    .line 114
    :goto_2
    if-ge v7, v4, :cond_1

    .line 115
    .line 116
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-virtual {v0, v8}, Lrb0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    add-int/lit8 v7, v7, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_1
    sget-object v4, Lyh;->k:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, v4}, Lrb0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    sget-object v8, Lyh;->l:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0, v8}, Lrb0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v9

    .line 138
    invoke-virtual {v0, v4}, Lrb0;->e(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v8}, Lrb0;->e(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-wide/16 v10, 0x0

    .line 145
    .line 146
    if-eqz v7, :cond_2

    .line 147
    .line 148
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 149
    .line 150
    .line 151
    move-result-wide v7

    .line 152
    goto :goto_3

    .line 153
    :cond_2
    move-wide v7, v10

    .line 154
    :goto_3
    iput-wide v7, p0, Lyh;->i:J

    .line 155
    .line 156
    if-eqz v9, :cond_3

    .line 157
    .line 158
    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 159
    .line 160
    .line 161
    move-result-wide v10

    .line 162
    :cond_3
    iput-wide v10, p0, Lyh;->j:J

    .line 163
    .line 164
    invoke-virtual {v0}, Lrb0;->c()Lsb0;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lyh;->g:Lsb0;

    .line 169
    .line 170
    iget-object v0, p0, Lyh;->a:Led0;

    .line 171
    .line 172
    iget-object v0, v0, Led0;->a:Ljava/lang/String;

    .line 173
    .line 174
    const-string v4, "https"

    .line 175
    .line 176
    invoke-static {v0, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_6

    .line 181
    .line 182
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-gtz v4, :cond_5

    .line 191
    .line 192
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sget-object v4, Lek;->b:Lt11;

    .line 197
    .line 198
    invoke-virtual {v4, v0}, Lt11;->k(Ljava/lang/String;)Lek;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {v1}, Lyh;->a(Lsx0;)Ljava/util/List;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-static {v1}, Lyh;->a(Lsx0;)Ljava/util/List;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v1}, Lsx0;->a()Z

    .line 211
    .line 212
    .line 213
    move-result v7

    .line 214
    if-nez v7, :cond_4

    .line 215
    .line 216
    invoke-virtual {v1, v2, v3}, Lsx0;->k(J)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-static {v1}, Lbv;->h(Ljava/lang/String;)Lsc1;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    goto :goto_4

    .line 225
    :cond_4
    sget-object v1, Lsc1;->o:Lsc1;

    .line 226
    .line 227
    :goto_4
    invoke-static {v4}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    new-instance v3, Lnb0;

    .line 232
    .line 233
    invoke-static {v5}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    new-instance v5, Lmb0;

    .line 238
    .line 239
    invoke-direct {v5, v6, v2}, Lmb0;-><init>(ILjava/util/List;)V

    .line 240
    .line 241
    .line 242
    invoke-direct {v3, v1, v0, v4, v5}, Lnb0;-><init>(Lsc1;Lek;Ljava/util/List;Lp80;)V

    .line 243
    .line 244
    .line 245
    iput-object v3, p0, Lyh;->h:Lnb0;

    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_5
    new-instance p0, Ljava/io/IOException;

    .line 249
    .line 250
    new-instance v1, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 253
    .line 254
    .line 255
    const-string v2, "expected \"\" but was \""

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const/16 v0, 0x22

    .line 264
    .line 265
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    throw p0

    .line 276
    :cond_6
    iput-object v5, p0, Lyh;->h:Lnb0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 277
    .line 278
    :goto_5
    invoke-interface {p1}, Ljava/io/Closeable;->close()V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_7
    :try_start_3
    new-instance p0, Ljava/io/IOException;

    .line 283
    .line 284
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    sget-object v0, Lgt0;->a:Lgt0;

    .line 292
    .line 293
    sget-object v0, Lgt0;->a:Lgt0;

    .line 294
    .line 295
    const-string v1, "cache corruption"

    .line 296
    .line 297
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 298
    .line 299
    .line 300
    const/4 v0, 0x5

    .line 301
    invoke-static {v0, v1, p0}, Lgt0;->i(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 305
    :goto_6
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 306
    :catchall_1
    move-exception v0

    .line 307
    invoke-static {p1, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 308
    .line 309
    .line 310
    throw v0
.end method

.method public static a(Lsx0;)Ljava/util/List;
    .locals 8

    .line 1
    invoke-static {p0}, Lbe2;->s(Lsx0;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object p0, Lu00;->j:Lu00;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    :try_start_0
    const-string v1, "X.509"

    .line 12
    .line 13
    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 20
    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move v4, v3

    .line 24
    :goto_0
    if-ge v4, v0, :cond_2

    .line 25
    .line 26
    const-wide v5, 0x7fffffffffffffffL

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v5, v6}, Lsx0;->k(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    new-instance v6, Leh;

    .line 36
    .line 37
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v7, Lth;->m:Lth;

    .line 41
    .line 42
    invoke-static {v5}, Lmz;->f(Ljava/lang/String;)Lth;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    if-eqz v5, :cond_1

    .line 47
    .line 48
    invoke-virtual {v6, v5}, Leh;->x(Lth;)V

    .line 49
    .line 50
    .line 51
    new-instance v5, Ldh;

    .line 52
    .line 53
    invoke-direct {v5, v6, v3}, Ldh;-><init>(Ljava/io/Closeable;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v5}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    add-int/lit8 v4, v4, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    new-instance p0, Ljava/io/IOException;

    .line 67
    .line 68
    const-string v0, "Corrupt certificate in cache entry"

    .line 69
    .line 70
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :cond_2
    return-object v2

    .line 75
    :catch_0
    move-exception p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return-object p0
.end method

.method public static b(Lrx0;Ljava/util/List;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    invoke-virtual {p0, v0, v1}, Lrx0;->p(J)Lkh;

    .line 7
    .line 8
    .line 9
    const/16 v0, 0xa

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lrx0;->writeByte(I)Lkh;

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/security/cert/Certificate;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/security/cert/Certificate;->getEncoded()[B

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget-object v2, Lth;->m:Lth;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Lmz;->l([B)Lth;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lth;->a()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0, v1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lrx0;->writeByte(I)Lkh;
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-void

    .line 55
    :catch_0
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public final c(Lvx;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lyh;->a:Led0;

    .line 2
    .line 3
    iget-object v1, p0, Lyh;->h:Lnb0;

    .line 4
    .line 5
    iget-object v2, p0, Lyh;->g:Lsb0;

    .line 6
    .line 7
    iget-object v3, p0, Lyh;->b:Lsb0;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-virtual {p1, v4}, Lvx;->d(I)La81;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v5, Lrx0;

    .line 15
    .line 16
    invoke-direct {v5, p1}, Lrx0;-><init>(La81;)V

    .line 17
    .line 18
    .line 19
    :try_start_0
    iget-object p1, v0, Led0;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v5, p1}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 22
    .line 23
    .line 24
    const/16 p1, 0xa

    .line 25
    .line 26
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 27
    .line 28
    .line 29
    iget-object v6, p0, Lyh;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v5, v6}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Lsb0;->size()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    int-to-long v6, v6

    .line 42
    invoke-virtual {v5, v6, v7}, Lrx0;->p(J)Lkh;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Lsb0;->size()I

    .line 49
    .line 50
    .line 51
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    move v7, v4

    .line 53
    :goto_0
    const-string v8, ": "

    .line 54
    .line 55
    if-ge v7, v6, :cond_0

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {v3, v7}, Lsb0;->c(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    invoke-virtual {v5, v9}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v8}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v7}, Lsb0;->e(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    invoke-interface {v5, v8}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 72
    .line 73
    .line 74
    invoke-interface {v5, p1}, Lkh;->writeByte(I)Lkh;

    .line 75
    .line 76
    .line 77
    add-int/lit8 v7, v7, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    goto/16 :goto_3

    .line 82
    .line 83
    :cond_0
    iget-object v3, p0, Lyh;->d:Liw0;

    .line 84
    .line 85
    iget v6, p0, Lyh;->e:I

    .line 86
    .line 87
    iget-object v7, p0, Lyh;->f:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    new-instance v9, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    sget-object v10, Liw0;->k:Liw0;

    .line 101
    .line 102
    if-ne v3, v10, :cond_1

    .line 103
    .line 104
    const-string v3, "HTTP/1.0"

    .line 105
    .line 106
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_1
    const-string v3, "HTTP/1.1"

    .line 111
    .line 112
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    :goto_1
    const/16 v3, 0x20

    .line 116
    .line 117
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v5, v3}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Lsb0;->size()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    add-int/lit8 v3, v3, 0x2

    .line 144
    .line 145
    int-to-long v6, v3

    .line 146
    invoke-virtual {v5, v6, v7}, Lrx0;->p(J)Lkh;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Lsb0;->size()I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    :goto_2
    if-ge v4, v3, :cond_2

    .line 157
    .line 158
    invoke-virtual {v2, v4}, Lsb0;->c(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    invoke-virtual {v5, v6}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v5, v8}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2, v4}, Lsb0;->e(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-interface {v5, v6}, Lkh;->o(Ljava/lang/String;)Lkh;

    .line 173
    .line 174
    .line 175
    invoke-interface {v5, p1}, Lkh;->writeByte(I)Lkh;

    .line 176
    .line 177
    .line 178
    add-int/lit8 v4, v4, 0x1

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_2
    sget-object v2, Lyh;->k:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v5, v2}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v5, v8}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 187
    .line 188
    .line 189
    iget-wide v2, p0, Lyh;->i:J

    .line 190
    .line 191
    invoke-interface {v5, v2, v3}, Lkh;->p(J)Lkh;

    .line 192
    .line 193
    .line 194
    invoke-interface {v5, p1}, Lkh;->writeByte(I)Lkh;

    .line 195
    .line 196
    .line 197
    sget-object v2, Lyh;->l:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v5, v2}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v5, v8}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 203
    .line 204
    .line 205
    iget-wide v2, p0, Lyh;->j:J

    .line 206
    .line 207
    invoke-interface {v5, v2, v3}, Lkh;->p(J)Lkh;

    .line 208
    .line 209
    .line 210
    invoke-interface {v5, p1}, Lkh;->writeByte(I)Lkh;

    .line 211
    .line 212
    .line 213
    iget-object p0, v0, Led0;->a:Ljava/lang/String;

    .line 214
    .line 215
    const-string v0, "https"

    .line 216
    .line 217
    invoke-static {p0, v0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-eqz p0, :cond_3

    .line 222
    .line 223
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 227
    .line 228
    .line 229
    iget-object p0, v1, Lnb0;->b:Lek;

    .line 230
    .line 231
    iget-object p0, p0, Lek;->a:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v5, p0}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v1}, Lnb0;->a()Ljava/util/List;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {v5, p0}, Lyh;->b(Lrx0;Ljava/util/List;)V

    .line 244
    .line 245
    .line 246
    iget-object p0, v1, Lnb0;->c:Ljava/util/List;

    .line 247
    .line 248
    invoke-static {v5, p0}, Lyh;->b(Lrx0;Ljava/util/List;)V

    .line 249
    .line 250
    .line 251
    iget-object p0, v1, Lnb0;->a:Lsc1;

    .line 252
    .line 253
    iget-object p0, p0, Lsc1;->j:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v5, p0}, Lrx0;->o(Ljava/lang/String;)Lkh;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v5, p1}, Lrx0;->writeByte(I)Lkh;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 259
    .line 260
    .line 261
    :cond_3
    invoke-virtual {v5}, Lrx0;->close()V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :goto_3
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 266
    :catchall_1
    move-exception p1

    .line 267
    invoke-static {v5, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 268
    .line 269
    .line 270
    throw p1
.end method
