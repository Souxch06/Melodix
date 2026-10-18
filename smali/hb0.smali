.class public final Lhb0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public j:B

.field public final k:Lsx0;

.field public final l:Ljava/util/zip/Inflater;

.field public final m:Lge0;

.field public final n:Ljava/util/zip/CRC32;


# direct methods
.method public constructor <init>(Lp81;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lsx0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lsx0;-><init>(Lp81;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lhb0;->k:Lsx0;

    .line 13
    .line 14
    new-instance p1, Ljava/util/zip/Inflater;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {p1, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lhb0;->l:Ljava/util/zip/Inflater;

    .line 21
    .line 22
    new-instance v1, Lge0;

    .line 23
    .line 24
    invoke-direct {v1, v0, p1}, Lge0;-><init>(Lsx0;Ljava/util/zip/Inflater;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lhb0;->m:Lge0;

    .line 28
    .line 29
    new-instance p1, Ljava/util/zip/CRC32;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lhb0;->n:Ljava/util/zip/CRC32;

    .line 35
    .line 36
    return-void
.end method

.method public static a(IILjava/lang/String;)V
    .locals 1

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/io/IOException;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p2, p1, p0}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x3

    .line 19
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "%s: actual 0x%08x != expected 0x%08x"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw v0
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lhb0;->k:Lsx0;

    .line 2
    .line 3
    iget-object p0, p0, Lsx0;->j:Lp81;

    .line 4
    .line 5
    invoke-interface {p0}, Lp81;->b()Lnc1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p3

    .line 4
    .line 5
    iget-object v7, v0, Lhb0;->k:Lsx0;

    .line 6
    .line 7
    iget-object v1, v7, Lsx0;->k:Leh;

    .line 8
    .line 9
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-byte v2, v0, Lhb0;->j:B

    .line 13
    .line 14
    iget-object v8, v0, Lhb0;->n:Ljava/util/zip/CRC32;

    .line 15
    .line 16
    const/4 v9, 0x1

    .line 17
    if-nez v2, :cond_c

    .line 18
    .line 19
    const-wide/16 v2, 0xa

    .line 20
    .line 21
    invoke-virtual {v7, v2, v3}, Lsx0;->n(J)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v2, 0x3

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Leh;->h(J)B

    .line 27
    .line 28
    .line 29
    move-result v12

    .line 30
    shr-int/lit8 v2, v12, 0x1

    .line 31
    .line 32
    and-int/2addr v2, v9

    .line 33
    if-ne v2, v9, :cond_0

    .line 34
    .line 35
    move v13, v9

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v2, 0x0

    .line 38
    move v13, v2

    .line 39
    :goto_0
    if-eqz v13, :cond_1

    .line 40
    .line 41
    const-wide/16 v2, 0x0

    .line 42
    .line 43
    const-wide/16 v4, 0xa

    .line 44
    .line 45
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {v7}, Lsx0;->readShort()S

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const-string v2, "ID1ID2"

    .line 53
    .line 54
    const/16 v3, 0x1f8b

    .line 55
    .line 56
    invoke-static {v3, v0, v2}, Lhb0;->a(IILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v2, 0x8

    .line 60
    .line 61
    invoke-virtual {v7, v2, v3}, Lsx0;->skip(J)V

    .line 62
    .line 63
    .line 64
    shr-int/lit8 v0, v12, 0x2

    .line 65
    .line 66
    and-int/2addr v0, v9

    .line 67
    const v14, 0xff00

    .line 68
    .line 69
    .line 70
    const-wide/16 v2, 0x2

    .line 71
    .line 72
    if-ne v0, v9, :cond_4

    .line 73
    .line 74
    invoke-virtual {v7, v2, v3}, Lsx0;->n(J)V

    .line 75
    .line 76
    .line 77
    if-eqz v13, :cond_2

    .line 78
    .line 79
    move-wide v4, v2

    .line 80
    const-wide/16 v2, 0x0

    .line 81
    .line 82
    move-wide v15, v4

    .line 83
    const-wide/16 v4, 0x2

    .line 84
    .line 85
    const-wide/16 p1, -0x1

    .line 86
    .line 87
    move-object/from16 v0, p0

    .line 88
    .line 89
    move-wide v10, v15

    .line 90
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    move-wide v10, v2

    .line 95
    const-wide/16 p1, -0x1

    .line 96
    .line 97
    :goto_1
    invoke-virtual {v1}, Leh;->readShort()S

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    and-int v2, v0, v14

    .line 102
    .line 103
    ushr-int/lit8 v2, v2, 0x8

    .line 104
    .line 105
    and-int/lit16 v0, v0, 0xff

    .line 106
    .line 107
    shl-int/lit8 v0, v0, 0x8

    .line 108
    .line 109
    or-int/2addr v0, v2

    .line 110
    int-to-short v0, v0

    .line 111
    const v2, 0xffff

    .line 112
    .line 113
    .line 114
    and-int/2addr v0, v2

    .line 115
    int-to-long v4, v0

    .line 116
    invoke-virtual {v7, v4, v5}, Lsx0;->n(J)V

    .line 117
    .line 118
    .line 119
    if-eqz v13, :cond_3

    .line 120
    .line 121
    const-wide/16 v2, 0x0

    .line 122
    .line 123
    move-object/from16 v0, p0

    .line 124
    .line 125
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 126
    .line 127
    .line 128
    :cond_3
    move-object v15, v1

    .line 129
    invoke-virtual {v7, v4, v5}, Lsx0;->skip(J)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    move-object v15, v1

    .line 134
    move-wide v10, v2

    .line 135
    const-wide/16 p1, -0x1

    .line 136
    .line 137
    :goto_2
    shr-int/lit8 v0, v12, 0x3

    .line 138
    .line 139
    and-int/2addr v0, v9

    .line 140
    const-wide/16 v16, 0x1

    .line 141
    .line 142
    if-ne v0, v9, :cond_7

    .line 143
    .line 144
    const-wide/16 v2, 0x0

    .line 145
    .line 146
    const-wide v4, 0x7fffffffffffffffL

    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    const/4 v1, 0x0

    .line 152
    move-object v0, v7

    .line 153
    invoke-virtual/range {v0 .. v5}, Lsx0;->g(BJJ)J

    .line 154
    .line 155
    .line 156
    move-result-wide v18

    .line 157
    cmp-long v0, v18, p1

    .line 158
    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    if-eqz v13, :cond_5

    .line 162
    .line 163
    const-wide/16 v2, 0x0

    .line 164
    .line 165
    add-long v4, v18, v16

    .line 166
    .line 167
    move-object/from16 v0, p0

    .line 168
    .line 169
    move-object v1, v15

    .line 170
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 171
    .line 172
    .line 173
    :cond_5
    add-long v0, v18, v16

    .line 174
    .line 175
    invoke-virtual {v7, v0, v1}, Lsx0;->skip(J)V

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_6
    new-instance v0, Ljava/io/EOFException;

    .line 180
    .line 181
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 182
    .line 183
    .line 184
    throw v0

    .line 185
    :cond_7
    :goto_3
    shr-int/lit8 v0, v12, 0x4

    .line 186
    .line 187
    and-int/2addr v0, v9

    .line 188
    if-ne v0, v9, :cond_a

    .line 189
    .line 190
    const-wide/16 v2, 0x0

    .line 191
    .line 192
    const-wide v4, 0x7fffffffffffffffL

    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    const/4 v1, 0x0

    .line 198
    move-object v0, v7

    .line 199
    invoke-virtual/range {v0 .. v5}, Lsx0;->g(BJJ)J

    .line 200
    .line 201
    .line 202
    move-result-wide v18

    .line 203
    cmp-long v0, v18, p1

    .line 204
    .line 205
    if-eqz v0, :cond_9

    .line 206
    .line 207
    if-eqz v13, :cond_8

    .line 208
    .line 209
    const-wide/16 v2, 0x0

    .line 210
    .line 211
    add-long v4, v18, v16

    .line 212
    .line 213
    move-object/from16 v0, p0

    .line 214
    .line 215
    move-object v1, v15

    .line 216
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 217
    .line 218
    .line 219
    goto :goto_4

    .line 220
    :cond_8
    move-object/from16 v0, p0

    .line 221
    .line 222
    move-object v1, v15

    .line 223
    :goto_4
    add-long v2, v18, v16

    .line 224
    .line 225
    invoke-virtual {v7, v2, v3}, Lsx0;->skip(J)V

    .line 226
    .line 227
    .line 228
    goto :goto_5

    .line 229
    :cond_9
    new-instance v0, Ljava/io/EOFException;

    .line 230
    .line 231
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 232
    .line 233
    .line 234
    throw v0

    .line 235
    :cond_a
    move-object/from16 v0, p0

    .line 236
    .line 237
    move-object v1, v15

    .line 238
    :goto_5
    if-eqz v13, :cond_b

    .line 239
    .line 240
    invoke-virtual {v7, v10, v11}, Lsx0;->n(J)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v1}, Leh;->readShort()S

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    and-int v2, v1, v14

    .line 248
    .line 249
    ushr-int/lit8 v2, v2, 0x8

    .line 250
    .line 251
    and-int/lit16 v1, v1, 0xff

    .line 252
    .line 253
    shl-int/lit8 v1, v1, 0x8

    .line 254
    .line 255
    or-int/2addr v1, v2

    .line 256
    int-to-short v1, v1

    .line 257
    invoke-virtual {v8}, Ljava/util/zip/CRC32;->getValue()J

    .line 258
    .line 259
    .line 260
    move-result-wide v2

    .line 261
    long-to-int v2, v2

    .line 262
    int-to-short v2, v2

    .line 263
    const-string v3, "FHCRC"

    .line 264
    .line 265
    invoke-static {v1, v2, v3}, Lhb0;->a(IILjava/lang/String;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v8}, Ljava/util/zip/CRC32;->reset()V

    .line 269
    .line 270
    .line 271
    :cond_b
    iput-byte v9, v0, Lhb0;->j:B

    .line 272
    .line 273
    move v2, v9

    .line 274
    goto :goto_6

    .line 275
    :cond_c
    const-wide/16 p1, -0x1

    .line 276
    .line 277
    :goto_6
    const/4 v10, 0x2

    .line 278
    if-ne v2, v9, :cond_e

    .line 279
    .line 280
    iget-wide v2, v6, Leh;->k:J

    .line 281
    .line 282
    iget-object v1, v0, Lhb0;->m:Lge0;

    .line 283
    .line 284
    const-wide/16 v4, 0x2000

    .line 285
    .line 286
    invoke-virtual {v1, v4, v5, v6}, Lge0;->c(JLeh;)J

    .line 287
    .line 288
    .line 289
    move-result-wide v4

    .line 290
    cmp-long v1, v4, p1

    .line 291
    .line 292
    if-eqz v1, :cond_d

    .line 293
    .line 294
    move-object v1, v6

    .line 295
    invoke-virtual/range {v0 .. v5}, Lhb0;->g(Leh;JJ)V

    .line 296
    .line 297
    .line 298
    return-wide v4

    .line 299
    :cond_d
    iput-byte v10, v0, Lhb0;->j:B

    .line 300
    .line 301
    move v2, v10

    .line 302
    :cond_e
    if-ne v2, v10, :cond_10

    .line 303
    .line 304
    invoke-virtual {v7}, Lsx0;->h()I

    .line 305
    .line 306
    .line 307
    move-result v1

    .line 308
    invoke-virtual {v8}, Ljava/util/zip/CRC32;->getValue()J

    .line 309
    .line 310
    .line 311
    move-result-wide v2

    .line 312
    long-to-int v2, v2

    .line 313
    const-string v3, "CRC"

    .line 314
    .line 315
    invoke-static {v1, v2, v3}, Lhb0;->a(IILjava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v7}, Lsx0;->h()I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    iget-object v2, v0, Lhb0;->l:Ljava/util/zip/Inflater;

    .line 323
    .line 324
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getBytesWritten()J

    .line 325
    .line 326
    .line 327
    move-result-wide v2

    .line 328
    long-to-int v2, v2

    .line 329
    const-string v3, "ISIZE"

    .line 330
    .line 331
    invoke-static {v1, v2, v3}, Lhb0;->a(IILjava/lang/String;)V

    .line 332
    .line 333
    .line 334
    const/4 v1, 0x3

    .line 335
    iput-byte v1, v0, Lhb0;->j:B

    .line 336
    .line 337
    invoke-virtual {v7}, Lsx0;->a()Z

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    if-eqz v0, :cond_f

    .line 342
    .line 343
    goto :goto_7

    .line 344
    :cond_f
    const-string v0, "gzip finished without exhausting source"

    .line 345
    .line 346
    invoke-static {v0}, Lo40;->k(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    const-wide/16 v0, 0x0

    .line 350
    .line 351
    return-wide v0

    .line 352
    :cond_10
    :goto_7
    return-wide p1
.end method

.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lhb0;->m:Lge0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lge0;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Leh;JJ)V
    .locals 4

    .line 1
    iget-object p1, p1, Leh;->j:Lp31;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :goto_0
    iget v0, p1, Lp31;->c:I

    .line 7
    .line 8
    iget v1, p1, Lp31;->b:I

    .line 9
    .line 10
    sub-int/2addr v0, v1

    .line 11
    int-to-long v0, v0

    .line 12
    cmp-long v2, p2, v0

    .line 13
    .line 14
    if-ltz v2, :cond_0

    .line 15
    .line 16
    sub-long/2addr p2, v0

    .line 17
    iget-object p1, p1, Lp31;->f:Lp31;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    :goto_1
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    cmp-long v2, p4, v0

    .line 26
    .line 27
    if-lez v2, :cond_1

    .line 28
    .line 29
    iget v2, p1, Lp31;->b:I

    .line 30
    .line 31
    int-to-long v2, v2

    .line 32
    add-long/2addr v2, p2

    .line 33
    long-to-int p2, v2

    .line 34
    iget p3, p1, Lp31;->c:I

    .line 35
    .line 36
    sub-int/2addr p3, p2

    .line 37
    int-to-long v2, p3

    .line 38
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    long-to-int p3, v2

    .line 43
    iget-object v2, p0, Lhb0;->n:Ljava/util/zip/CRC32;

    .line 44
    .line 45
    iget-object v3, p1, Lp31;->a:[B

    .line 46
    .line 47
    invoke-virtual {v2, v3, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 48
    .line 49
    .line 50
    int-to-long p2, p3

    .line 51
    sub-long/2addr p4, p2

    .line 52
    iget-object p1, p1, Lp31;->f:Lp31;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-wide p2, v0

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    return-void
.end method
