.class public final Ldd0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public final f:Ljava/util/ArrayList;

.field public g:Ljava/util/ArrayList;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ldd0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ldd0;->c:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    iput v1, p0, Ldd0;->e:I

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ldd0;->f:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a()Led0;
    .locals 15

    .line 1
    iget-object v1, p0, Ldd0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz v1, :cond_6

    .line 5
    .line 6
    iget-object v2, p0, Ldd0;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x7

    .line 10
    invoke-static {v3, v3, v4, v2}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v5, p0, Ldd0;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v3, v3, v4, v5}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    move v6, v4

    .line 21
    iget-object v4, p0, Ldd0;->d:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v4, :cond_5

    .line 24
    .line 25
    move v7, v3

    .line 26
    move-object v3, v5

    .line 27
    invoke-virtual {p0}, Ldd0;->b()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    move v8, v6

    .line 32
    new-instance v6, Ljava/util/ArrayList;

    .line 33
    .line 34
    iget-object v9, p0, Ldd0;->f:Ljava/util/ArrayList;

    .line 35
    .line 36
    const/16 v10, 0xa

    .line 37
    .line 38
    invoke-static {v9, v10}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 39
    .line 40
    .line 41
    move-result v11

    .line 42
    invoke-direct {v6, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v11

    .line 49
    move v12, v7

    .line 50
    :goto_0
    if-ge v12, v11, :cond_0

    .line 51
    .line 52
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v13

    .line 56
    add-int/lit8 v12, v12, 0x1

    .line 57
    .line 58
    check-cast v13, Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v7, v7, v8, v13}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v13

    .line 64
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    iget-object v9, p0, Ldd0;->g:Ljava/util/ArrayList;

    .line 69
    .line 70
    if-eqz v9, :cond_2

    .line 71
    .line 72
    new-instance v11, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-static {v9, v10}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 75
    .line 76
    .line 77
    move-result v10

    .line 78
    invoke-direct {v11, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v10

    .line 85
    move v12, v7

    .line 86
    :goto_1
    if-ge v12, v10, :cond_3

    .line 87
    .line 88
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v13

    .line 92
    add-int/lit8 v12, v12, 0x1

    .line 93
    .line 94
    check-cast v13, Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v13, :cond_1

    .line 97
    .line 98
    const/4 v14, 0x3

    .line 99
    invoke-static {v7, v7, v14, v13}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v13

    .line 103
    goto :goto_2

    .line 104
    :cond_1
    move-object v13, v0

    .line 105
    :goto_2
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    move-object v11, v0

    .line 110
    :cond_3
    iget-object v9, p0, Ldd0;->h:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz v9, :cond_4

    .line 113
    .line 114
    invoke-static {v7, v7, v8, v9}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :cond_4
    move-object v8, v0

    .line 119
    invoke-virtual {p0}, Ldd0;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v9

    .line 123
    new-instance v0, Led0;

    .line 124
    .line 125
    move-object v7, v11

    .line 126
    invoke-direct/range {v0 .. v9}, Led0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-object v0

    .line 130
    :cond_5
    const-string p0, "host == null"

    .line 131
    .line 132
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object v0

    .line 136
    :cond_6
    const-string p0, "scheme == null"

    .line 137
    .line 138
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-object v0
.end method

.method public final b()I
    .locals 2

    .line 1
    iget v0, p0, Ldd0;->e:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Ldd0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const-string v0, "http"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/16 v1, 0x50

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "https"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const/16 v1, 0x1bb

    .line 32
    .line 33
    :cond_2
    :goto_0
    return v1
.end method

.method public final c(Led0;Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v3, Ljg1;->a:[B

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    move v5, v4

    .line 21
    :goto_0
    const/16 v6, 0x20

    .line 22
    .line 23
    const/16 v7, 0xd

    .line 24
    .line 25
    const/16 v8, 0xc

    .line 26
    .line 27
    const/16 v9, 0xa

    .line 28
    .line 29
    const/16 v10, 0x9

    .line 30
    .line 31
    if-ge v5, v3, :cond_5

    .line 32
    .line 33
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    .line 34
    .line 35
    .line 36
    move-result v11

    .line 37
    if-ne v11, v10, :cond_0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    if-ne v11, v9, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    if-ne v11, v8, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    if-ne v11, v7, :cond_3

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    if-ne v11, v6, :cond_4

    .line 50
    .line 51
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    move v3, v5

    .line 55
    :cond_5
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    const/4 v11, 0x1

    .line 63
    sub-int/2addr v5, v11

    .line 64
    if-gt v3, v5, :cond_b

    .line 65
    .line 66
    :goto_2
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    .line 67
    .line 68
    .line 69
    move-result v12

    .line 70
    if-ne v12, v10, :cond_6

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_6
    if-ne v12, v9, :cond_7

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_7
    if-ne v12, v8, :cond_8

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_8
    if-ne v12, v7, :cond_9

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_9
    if-ne v12, v6, :cond_a

    .line 83
    .line 84
    :goto_3
    if-eq v5, v3, :cond_b

    .line 85
    .line 86
    add-int/lit8 v5, v5, -0x1

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_a
    add-int/2addr v5, v11

    .line 90
    goto :goto_4

    .line 91
    :cond_b
    move v5, v3

    .line 92
    :goto_4
    sub-int v6, v5, v3

    .line 93
    .line 94
    const/4 v7, -0x1

    .line 95
    const/16 v8, 0x5b

    .line 96
    .line 97
    const/16 v9, 0x3a

    .line 98
    .line 99
    const/4 v10, 0x2

    .line 100
    if-ge v6, v10, :cond_d

    .line 101
    .line 102
    :cond_c
    :goto_5
    move v6, v7

    .line 103
    goto :goto_8

    .line 104
    :cond_d
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    const/16 v12, 0x61

    .line 109
    .line 110
    invoke-static {v6, v12}, Ldl1;->e(II)I

    .line 111
    .line 112
    .line 113
    move-result v13

    .line 114
    const/16 v14, 0x41

    .line 115
    .line 116
    if-ltz v13, :cond_e

    .line 117
    .line 118
    const/16 v13, 0x7a

    .line 119
    .line 120
    invoke-static {v6, v13}, Ldl1;->e(II)I

    .line 121
    .line 122
    .line 123
    move-result v13

    .line 124
    if-lez v13, :cond_f

    .line 125
    .line 126
    :cond_e
    invoke-static {v6, v14}, Ldl1;->e(II)I

    .line 127
    .line 128
    .line 129
    move-result v13

    .line 130
    if-ltz v13, :cond_c

    .line 131
    .line 132
    const/16 v13, 0x5a

    .line 133
    .line 134
    invoke-static {v6, v13}, Ldl1;->e(II)I

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    if-lez v6, :cond_f

    .line 139
    .line 140
    goto :goto_5

    .line 141
    :cond_f
    add-int/lit8 v6, v3, 0x1

    .line 142
    .line 143
    :goto_6
    if-ge v6, v5, :cond_c

    .line 144
    .line 145
    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    .line 146
    .line 147
    .line 148
    move-result v13

    .line 149
    if-gt v12, v13, :cond_10

    .line 150
    .line 151
    const/16 v15, 0x7b

    .line 152
    .line 153
    if-ge v13, v15, :cond_10

    .line 154
    .line 155
    goto :goto_7

    .line 156
    :cond_10
    if-gt v14, v13, :cond_11

    .line 157
    .line 158
    if-ge v13, v8, :cond_11

    .line 159
    .line 160
    goto :goto_7

    .line 161
    :cond_11
    const/16 v15, 0x30

    .line 162
    .line 163
    if-gt v15, v13, :cond_12

    .line 164
    .line 165
    if-ge v13, v9, :cond_12

    .line 166
    .line 167
    goto :goto_7

    .line 168
    :cond_12
    const/16 v15, 0x2b

    .line 169
    .line 170
    if-ne v13, v15, :cond_13

    .line 171
    .line 172
    goto :goto_7

    .line 173
    :cond_13
    const/16 v15, 0x2d

    .line 174
    .line 175
    if-ne v13, v15, :cond_14

    .line 176
    .line 177
    goto :goto_7

    .line 178
    :cond_14
    const/16 v15, 0x2e

    .line 179
    .line 180
    if-ne v13, v15, :cond_15

    .line 181
    .line 182
    :goto_7
    add-int/lit8 v6, v6, 0x1

    .line 183
    .line 184
    goto :goto_6

    .line 185
    :cond_15
    if-ne v13, v9, :cond_c

    .line 186
    .line 187
    :goto_8
    const-string v12, "http"

    .line 188
    .line 189
    const-string v13, "https"

    .line 190
    .line 191
    if-eq v6, v7, :cond_18

    .line 192
    .line 193
    const-string v14, "https:"

    .line 194
    .line 195
    invoke-static {v3, v2, v14, v11}, Lla1;->w(ILjava/lang/String;Ljava/lang/String;Z)Z

    .line 196
    .line 197
    .line 198
    move-result v14

    .line 199
    if-eqz v14, :cond_16

    .line 200
    .line 201
    iput-object v13, v0, Ldd0;->a:Ljava/lang/String;

    .line 202
    .line 203
    add-int/lit8 v3, v3, 0x6

    .line 204
    .line 205
    goto :goto_9

    .line 206
    :cond_16
    const-string v14, "http:"

    .line 207
    .line 208
    invoke-static {v3, v2, v14, v11}, Lla1;->w(ILjava/lang/String;Ljava/lang/String;Z)Z

    .line 209
    .line 210
    .line 211
    move-result v14

    .line 212
    if-eqz v14, :cond_17

    .line 213
    .line 214
    iput-object v12, v0, Ldd0;->a:Ljava/lang/String;

    .line 215
    .line 216
    add-int/lit8 v3, v3, 0x5

    .line 217
    .line 218
    goto :goto_9

    .line 219
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 220
    .line 221
    invoke-virtual {v2, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    new-instance v2, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string v3, "Expected URL scheme \'http\' or \'https\' but was \'"

    .line 228
    .line 229
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const/16 v1, 0x27

    .line 236
    .line 237
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    throw v0

    .line 248
    :cond_18
    if-eqz v1, :cond_3f

    .line 249
    .line 250
    iget-object v6, v1, Led0;->a:Ljava/lang/String;

    .line 251
    .line 252
    iput-object v6, v0, Ldd0;->a:Ljava/lang/String;

    .line 253
    .line 254
    :goto_9
    move v6, v3

    .line 255
    move v14, v4

    .line 256
    :goto_a
    const/16 v15, 0x2f

    .line 257
    .line 258
    move/from16 v16, v11

    .line 259
    .line 260
    const/16 v11, 0x5c

    .line 261
    .line 262
    if-ge v6, v5, :cond_1a

    .line 263
    .line 264
    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    if-eq v8, v11, :cond_19

    .line 269
    .line 270
    if-ne v8, v15, :cond_1a

    .line 271
    .line 272
    :cond_19
    add-int/lit8 v14, v14, 0x1

    .line 273
    .line 274
    add-int/lit8 v6, v6, 0x1

    .line 275
    .line 276
    move/from16 v11, v16

    .line 277
    .line 278
    const/16 v8, 0x5b

    .line 279
    .line 280
    goto :goto_a

    .line 281
    :cond_1a
    const-string v6, " \"\'<>#"

    .line 282
    .line 283
    const-string v8, ""

    .line 284
    .line 285
    iget-object v9, v0, Ldd0;->f:Ljava/util/ArrayList;

    .line 286
    .line 287
    const/16 v11, 0x23

    .line 288
    .line 289
    if-ge v14, v10, :cond_1e

    .line 290
    .line 291
    if-eqz v1, :cond_1e

    .line 292
    .line 293
    iget-object v10, v1, Led0;->a:Ljava/lang/String;

    .line 294
    .line 295
    iget-object v15, v0, Ldd0;->a:Ljava/lang/String;

    .line 296
    .line 297
    invoke-static {v10, v15}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v10

    .line 301
    if-nez v10, :cond_1b

    .line 302
    .line 303
    goto :goto_c

    .line 304
    :cond_1b
    invoke-virtual {v1}, Led0;->e()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v7

    .line 308
    iput-object v7, v0, Ldd0;->b:Ljava/lang/String;

    .line 309
    .line 310
    invoke-virtual {v1}, Led0;->a()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v7

    .line 314
    iput-object v7, v0, Ldd0;->c:Ljava/lang/String;

    .line 315
    .line 316
    iget-object v7, v1, Led0;->d:Ljava/lang/String;

    .line 317
    .line 318
    iput-object v7, v0, Ldd0;->d:Ljava/lang/String;

    .line 319
    .line 320
    iget v7, v1, Led0;->e:I

    .line 321
    .line 322
    iput v7, v0, Ldd0;->e:I

    .line 323
    .line 324
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1}, Led0;->c()Ljava/util/ArrayList;

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 332
    .line 333
    .line 334
    if-eq v3, v5, :cond_1c

    .line 335
    .line 336
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    if-ne v7, v11, :cond_2f

    .line 341
    .line 342
    :cond_1c
    invoke-virtual {v1}, Led0;->d()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    if-eqz v1, :cond_1d

    .line 347
    .line 348
    const/16 v7, 0xd3

    .line 349
    .line 350
    invoke-static {v1, v4, v4, v6, v7}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-static {v1}, Lok0;->x(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    goto :goto_b

    .line 359
    :cond_1d
    const/4 v1, 0x0

    .line 360
    :goto_b
    iput-object v1, v0, Ldd0;->g:Ljava/util/ArrayList;

    .line 361
    .line 362
    goto/16 :goto_17

    .line 363
    .line 364
    :cond_1e
    :goto_c
    add-int/2addr v3, v14

    .line 365
    move v1, v4

    .line 366
    move v10, v1

    .line 367
    :goto_d
    const-string v14, "@/\\?#"

    .line 368
    .line 369
    invoke-static {v3, v5, v2, v14}, Ljg1;->d(IILjava/lang/String;Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    move-result v14

    .line 373
    if-eq v14, v5, :cond_1f

    .line 374
    .line 375
    invoke-virtual {v2, v14}, Ljava/lang/String;->charAt(I)C

    .line 376
    .line 377
    .line 378
    move-result v15

    .line 379
    goto :goto_e

    .line 380
    :cond_1f
    move v15, v7

    .line 381
    :goto_e
    if-eq v15, v7, :cond_24

    .line 382
    .line 383
    if-eq v15, v11, :cond_24

    .line 384
    .line 385
    const/16 v4, 0x2f

    .line 386
    .line 387
    if-eq v15, v4, :cond_24

    .line 388
    .line 389
    const/16 v4, 0x5c

    .line 390
    .line 391
    if-eq v15, v4, :cond_24

    .line 392
    .line 393
    const/16 v4, 0x3f

    .line 394
    .line 395
    if-eq v15, v4, :cond_24

    .line 396
    .line 397
    const/16 v4, 0x40

    .line 398
    .line 399
    if-eq v15, v4, :cond_20

    .line 400
    .line 401
    const/4 v4, 0x0

    .line 402
    goto :goto_d

    .line 403
    :cond_20
    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    .line 404
    .line 405
    const-string v15, "%40"

    .line 406
    .line 407
    if-nez v1, :cond_23

    .line 408
    .line 409
    const/16 v11, 0x3a

    .line 410
    .line 411
    invoke-static {v2, v11, v3, v14}, Ljg1;->e(Ljava/lang/String;CII)I

    .line 412
    .line 413
    .line 414
    move-result v7

    .line 415
    const/16 v11, 0xf0

    .line 416
    .line 417
    invoke-static {v2, v3, v7, v4, v11}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v3

    .line 421
    if-eqz v10, :cond_21

    .line 422
    .line 423
    new-instance v10, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    iget-object v11, v0, Ldd0;->b:Ljava/lang/String;

    .line 426
    .line 427
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    invoke-static {v10, v15, v3}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    :cond_21
    iput-object v3, v0, Ldd0;->b:Ljava/lang/String;

    .line 435
    .line 436
    if-eq v7, v14, :cond_22

    .line 437
    .line 438
    add-int/lit8 v7, v7, 0x1

    .line 439
    .line 440
    const/16 v11, 0xf0

    .line 441
    .line 442
    invoke-static {v2, v7, v14, v4, v11}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    iput-object v1, v0, Ldd0;->c:Ljava/lang/String;

    .line 447
    .line 448
    move/from16 v1, v16

    .line 449
    .line 450
    goto :goto_f

    .line 451
    :cond_22
    const/16 v11, 0xf0

    .line 452
    .line 453
    :goto_f
    move/from16 v10, v16

    .line 454
    .line 455
    goto :goto_10

    .line 456
    :cond_23
    const/16 v11, 0xf0

    .line 457
    .line 458
    new-instance v7, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    iget-object v11, v0, Ldd0;->c:Ljava/lang/String;

    .line 461
    .line 462
    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    const/16 v11, 0xf0

    .line 469
    .line 470
    invoke-static {v2, v3, v14, v4, v11}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v3

    .line 481
    iput-object v3, v0, Ldd0;->c:Ljava/lang/String;

    .line 482
    .line 483
    :goto_10
    add-int/lit8 v3, v14, 0x1

    .line 484
    .line 485
    const/4 v4, 0x0

    .line 486
    const/4 v7, -0x1

    .line 487
    const/16 v11, 0x23

    .line 488
    .line 489
    goto :goto_d

    .line 490
    :cond_24
    move v1, v3

    .line 491
    :goto_11
    if-ge v1, v14, :cond_29

    .line 492
    .line 493
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 494
    .line 495
    .line 496
    move-result v4

    .line 497
    const/16 v7, 0x5b

    .line 498
    .line 499
    if-ne v4, v7, :cond_27

    .line 500
    .line 501
    :cond_25
    add-int/lit8 v1, v1, 0x1

    .line 502
    .line 503
    if-ge v1, v14, :cond_26

    .line 504
    .line 505
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 506
    .line 507
    .line 508
    move-result v4

    .line 509
    const/16 v10, 0x5d

    .line 510
    .line 511
    if-ne v4, v10, :cond_25

    .line 512
    .line 513
    :cond_26
    const/16 v11, 0x3a

    .line 514
    .line 515
    goto :goto_12

    .line 516
    :cond_27
    const/16 v11, 0x3a

    .line 517
    .line 518
    if-ne v4, v11, :cond_28

    .line 519
    .line 520
    goto :goto_13

    .line 521
    :cond_28
    :goto_12
    add-int/lit8 v1, v1, 0x1

    .line 522
    .line 523
    goto :goto_11

    .line 524
    :cond_29
    move v1, v14

    .line 525
    :goto_13
    add-int/lit8 v4, v1, 0x1

    .line 526
    .line 527
    const/4 v7, 0x4

    .line 528
    if-ge v4, v14, :cond_2c

    .line 529
    .line 530
    invoke-static {v3, v1, v7, v2}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v7

    .line 534
    invoke-static {v7}, Lxg;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v7

    .line 538
    iput-object v7, v0, Ldd0;->d:Ljava/lang/String;

    .line 539
    .line 540
    const/16 v7, 0xf8

    .line 541
    .line 542
    :try_start_0
    invoke-static {v2, v4, v14, v8, v7}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v7

    .line 546
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 547
    .line 548
    .line 549
    move-result v7
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 550
    move/from16 v10, v16

    .line 551
    .line 552
    if-gt v10, v7, :cond_2a

    .line 553
    .line 554
    const/high16 v10, 0x10000

    .line 555
    .line 556
    if-ge v7, v10, :cond_2a

    .line 557
    .line 558
    goto :goto_14

    .line 559
    :catch_0
    :cond_2a
    const/4 v7, -0x1

    .line 560
    :goto_14
    iput v7, v0, Ldd0;->e:I

    .line 561
    .line 562
    const/4 v10, -0x1

    .line 563
    if-eq v7, v10, :cond_2b

    .line 564
    .line 565
    goto :goto_16

    .line 566
    :cond_2b
    const-string v0, "Invalid URL port: \""

    .line 567
    .line 568
    invoke-virtual {v2, v4, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v1

    .line 572
    invoke-static {v1, v0}, Lo40;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    return-void

    .line 576
    :cond_2c
    const/4 v10, -0x1

    .line 577
    invoke-static {v3, v1, v7, v2}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object v4

    .line 581
    invoke-static {v4}, Lxg;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object v4

    .line 585
    iput-object v4, v0, Ldd0;->d:Ljava/lang/String;

    .line 586
    .line 587
    iget-object v4, v0, Ldd0;->a:Ljava/lang/String;

    .line 588
    .line 589
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v4, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    move-result v7

    .line 596
    if-eqz v7, :cond_2d

    .line 597
    .line 598
    const/16 v7, 0x50

    .line 599
    .line 600
    goto :goto_15

    .line 601
    :cond_2d
    invoke-virtual {v4, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 602
    .line 603
    .line 604
    move-result v4

    .line 605
    if-eqz v4, :cond_2e

    .line 606
    .line 607
    const/16 v7, 0x1bb

    .line 608
    .line 609
    goto :goto_15

    .line 610
    :cond_2e
    move v7, v10

    .line 611
    :goto_15
    iput v7, v0, Ldd0;->e:I

    .line 612
    .line 613
    :goto_16
    iget-object v4, v0, Ldd0;->d:Ljava/lang/String;

    .line 614
    .line 615
    if-eqz v4, :cond_3e

    .line 616
    .line 617
    move v3, v14

    .line 618
    :cond_2f
    :goto_17
    const-string v1, "?#"

    .line 619
    .line 620
    invoke-static {v3, v5, v2, v1}, Ljg1;->d(IILjava/lang/String;Ljava/lang/String;)I

    .line 621
    .line 622
    .line 623
    move-result v1

    .line 624
    if-ne v3, v1, :cond_30

    .line 625
    .line 626
    goto/16 :goto_1e

    .line 627
    .line 628
    :cond_30
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 629
    .line 630
    .line 631
    move-result v4

    .line 632
    const/16 v7, 0x2f

    .line 633
    .line 634
    if-eq v4, v7, :cond_32

    .line 635
    .line 636
    const/16 v7, 0x5c

    .line 637
    .line 638
    if-ne v4, v7, :cond_31

    .line 639
    .line 640
    goto :goto_18

    .line 641
    :cond_31
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 642
    .line 643
    .line 644
    move-result v4

    .line 645
    const/16 v16, 0x1

    .line 646
    .line 647
    add-int/lit8 v4, v4, -0x1

    .line 648
    .line 649
    invoke-virtual {v9, v4, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    goto :goto_19

    .line 653
    :cond_32
    :goto_18
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 657
    .line 658
    .line 659
    add-int/lit8 v3, v3, 0x1

    .line 660
    .line 661
    :goto_19
    if-ge v3, v1, :cond_3b

    .line 662
    .line 663
    const-string v4, "/\\"

    .line 664
    .line 665
    invoke-static {v3, v1, v2, v4}, Ljg1;->d(IILjava/lang/String;Ljava/lang/String;)I

    .line 666
    .line 667
    .line 668
    move-result v4

    .line 669
    if-ge v4, v1, :cond_33

    .line 670
    .line 671
    const/4 v10, 0x1

    .line 672
    goto :goto_1a

    .line 673
    :cond_33
    const/4 v10, 0x0

    .line 674
    :goto_1a
    const-string v7, " \"<>^`{}|/\\?#"

    .line 675
    .line 676
    const/16 v11, 0xf0

    .line 677
    .line 678
    invoke-static {v2, v3, v4, v7, v11}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 679
    .line 680
    .line 681
    move-result-object v3

    .line 682
    const-string v7, "."

    .line 683
    .line 684
    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-result v7

    .line 688
    if-nez v7, :cond_39

    .line 689
    .line 690
    const-string v7, "%2e"

    .line 691
    .line 692
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 693
    .line 694
    .line 695
    move-result v7

    .line 696
    if-eqz v7, :cond_34

    .line 697
    .line 698
    goto/16 :goto_1d

    .line 699
    .line 700
    :cond_34
    const-string v7, ".."

    .line 701
    .line 702
    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 703
    .line 704
    .line 705
    move-result v7

    .line 706
    if-nez v7, :cond_37

    .line 707
    .line 708
    const-string v7, "%2e."

    .line 709
    .line 710
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 711
    .line 712
    .line 713
    move-result v7

    .line 714
    if-nez v7, :cond_37

    .line 715
    .line 716
    const-string v7, ".%2e"

    .line 717
    .line 718
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 719
    .line 720
    .line 721
    move-result v7

    .line 722
    if-nez v7, :cond_37

    .line 723
    .line 724
    const-string v7, "%2e%2e"

    .line 725
    .line 726
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 727
    .line 728
    .line 729
    move-result v7

    .line 730
    if-eqz v7, :cond_35

    .line 731
    .line 732
    goto :goto_1c

    .line 733
    :cond_35
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 734
    .line 735
    .line 736
    move-result v7

    .line 737
    const/16 v16, 0x1

    .line 738
    .line 739
    add-int/lit8 v7, v7, -0x1

    .line 740
    .line 741
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 742
    .line 743
    .line 744
    move-result-object v7

    .line 745
    check-cast v7, Ljava/lang/CharSequence;

    .line 746
    .line 747
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    .line 748
    .line 749
    .line 750
    move-result v7

    .line 751
    if-nez v7, :cond_36

    .line 752
    .line 753
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 754
    .line 755
    .line 756
    move-result v7

    .line 757
    add-int/lit8 v7, v7, -0x1

    .line 758
    .line 759
    invoke-virtual {v9, v7, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    goto :goto_1b

    .line 763
    :cond_36
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 764
    .line 765
    .line 766
    :goto_1b
    if-eqz v10, :cond_39

    .line 767
    .line 768
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 769
    .line 770
    .line 771
    goto :goto_1d

    .line 772
    :cond_37
    :goto_1c
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 773
    .line 774
    .line 775
    move-result v3

    .line 776
    const/16 v16, 0x1

    .line 777
    .line 778
    add-int/lit8 v3, v3, -0x1

    .line 779
    .line 780
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 781
    .line 782
    .line 783
    move-result-object v3

    .line 784
    check-cast v3, Ljava/lang/String;

    .line 785
    .line 786
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 787
    .line 788
    .line 789
    move-result v3

    .line 790
    if-nez v3, :cond_38

    .line 791
    .line 792
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    .line 793
    .line 794
    .line 795
    move-result v3

    .line 796
    if-nez v3, :cond_38

    .line 797
    .line 798
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 799
    .line 800
    .line 801
    move-result v3

    .line 802
    add-int/lit8 v3, v3, -0x1

    .line 803
    .line 804
    invoke-virtual {v9, v3, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 805
    .line 806
    .line 807
    goto :goto_1d

    .line 808
    :cond_38
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 809
    .line 810
    .line 811
    :cond_39
    :goto_1d
    if-eqz v10, :cond_3a

    .line 812
    .line 813
    add-int/lit8 v3, v4, 0x1

    .line 814
    .line 815
    goto/16 :goto_19

    .line 816
    .line 817
    :cond_3a
    move v3, v4

    .line 818
    goto/16 :goto_19

    .line 819
    .line 820
    :cond_3b
    :goto_1e
    if-ge v1, v5, :cond_3c

    .line 821
    .line 822
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 823
    .line 824
    .line 825
    move-result v3

    .line 826
    const/16 v4, 0x3f

    .line 827
    .line 828
    if-ne v3, v4, :cond_3c

    .line 829
    .line 830
    const/16 v3, 0x23

    .line 831
    .line 832
    invoke-static {v2, v3, v1, v5}, Ljg1;->e(Ljava/lang/String;CII)I

    .line 833
    .line 834
    .line 835
    move-result v4

    .line 836
    add-int/lit8 v1, v1, 0x1

    .line 837
    .line 838
    const/16 v3, 0xd0

    .line 839
    .line 840
    invoke-static {v2, v1, v4, v6, v3}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 841
    .line 842
    .line 843
    move-result-object v1

    .line 844
    invoke-static {v1}, Lok0;->x(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 845
    .line 846
    .line 847
    move-result-object v1

    .line 848
    iput-object v1, v0, Ldd0;->g:Ljava/util/ArrayList;

    .line 849
    .line 850
    move v1, v4

    .line 851
    :cond_3c
    if-ge v1, v5, :cond_3d

    .line 852
    .line 853
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 854
    .line 855
    .line 856
    move-result v3

    .line 857
    const/16 v4, 0x23

    .line 858
    .line 859
    if-ne v3, v4, :cond_3d

    .line 860
    .line 861
    const/16 v16, 0x1

    .line 862
    .line 863
    add-int/lit8 v1, v1, 0x1

    .line 864
    .line 865
    const/16 v3, 0xb0

    .line 866
    .line 867
    invoke-static {v2, v1, v5, v8, v3}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 868
    .line 869
    .line 870
    move-result-object v1

    .line 871
    iput-object v1, v0, Ldd0;->h:Ljava/lang/String;

    .line 872
    .line 873
    :cond_3d
    return-void

    .line 874
    :cond_3e
    const-string v0, "Invalid URL host: \""

    .line 875
    .line 876
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 877
    .line 878
    .line 879
    move-result-object v1

    .line 880
    invoke-static {v1, v0}, Lo40;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 881
    .line 882
    .line 883
    return-void

    .line 884
    :cond_3f
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 885
    .line 886
    .line 887
    move-result v0

    .line 888
    const/4 v1, 0x6

    .line 889
    if-le v0, v1, :cond_40

    .line 890
    .line 891
    invoke-static {v1, v2}, Lda1;->P(ILjava/lang/String;)Ljava/lang/String;

    .line 892
    .line 893
    .line 894
    move-result-object v0

    .line 895
    const-string v1, "..."

    .line 896
    .line 897
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 898
    .line 899
    .line 900
    move-result-object v0

    .line 901
    goto :goto_1f

    .line 902
    :cond_40
    move-object v0, v2

    .line 903
    :goto_1f
    const-string v1, "Expected URL scheme \'http\' or \'https\' but no scheme was found for "

    .line 904
    .line 905
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 906
    .line 907
    .line 908
    move-result-object v0

    .line 909
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 910
    .line 911
    .line 912
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ldd0;->a:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "://"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "//"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object v1, p0, Ldd0;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/16 v2, 0x3a

    .line 31
    .line 32
    if-lez v1, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object v1, p0, Ldd0;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lez v1, :cond_3

    .line 42
    .line 43
    :goto_1
    iget-object v1, p0, Ldd0;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ldd0;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-lez v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ldd0;->c:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :cond_2
    const/16 v1, 0x40

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object v1, p0, Ldd0;->d:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v1, :cond_5

    .line 72
    .line 73
    invoke-static {v1, v2}, Lda1;->z(Ljava/lang/CharSequence;C)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    const/16 v1, 0x5b

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ldd0;->d:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const/16 v1, 0x5d

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    iget-object v1, p0, Ldd0;->d:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    :cond_5
    :goto_2
    iget v1, p0, Ldd0;->e:I

    .line 101
    .line 102
    const/4 v3, -0x1

    .line 103
    if-ne v1, v3, :cond_6

    .line 104
    .line 105
    iget-object v1, p0, Ldd0;->a:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz v1, :cond_a

    .line 108
    .line 109
    :cond_6
    invoke-virtual {p0}, Ldd0;->b()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    iget-object v4, p0, Ldd0;->a:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v4, :cond_9

    .line 116
    .line 117
    const-string v5, "http"

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-eqz v5, :cond_7

    .line 124
    .line 125
    const/16 v3, 0x50

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_7
    const-string v5, "https"

    .line 129
    .line 130
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-eqz v4, :cond_8

    .line 135
    .line 136
    const/16 v3, 0x1bb

    .line 137
    .line 138
    :cond_8
    :goto_3
    if-eq v1, v3, :cond_a

    .line 139
    .line 140
    :cond_9
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    :cond_a
    iget-object v1, p0, Ldd0;->f:Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    const/4 v3, 0x0

    .line 153
    :goto_4
    if-ge v3, v2, :cond_b

    .line 154
    .line 155
    const/16 v4, 0x2f

    .line 156
    .line 157
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    add-int/lit8 v3, v3, 0x1

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_b
    iget-object v1, p0, Ldd0;->g:Ljava/util/ArrayList;

    .line 173
    .line 174
    if-eqz v1, :cond_c

    .line 175
    .line 176
    const/16 v1, 0x3f

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Ldd0;->g:Ljava/util/ArrayList;

    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    invoke-static {v1, v0}, Lok0;->y(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object v1, p0, Ldd0;->h:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v1, :cond_d

    .line 192
    .line 193
    const/16 v1, 0x23

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ldd0;->h:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    :cond_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0
.end method
