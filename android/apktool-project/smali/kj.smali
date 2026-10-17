.class public final Lkj;
.super Loj1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final k:Ljava/util/ArrayList;

.field public l:I


# direct methods
.method public constructor <init>(Lpp;I)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Loj1;-><init>(Lpp;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput p2, p0, Loj1;->f:I

    .line 12
    .line 13
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Lpp;->i(I)Lpp;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :goto_0
    move-object v4, v0

    .line 20
    move-object v0, p2

    .line 21
    move-object p2, v4

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget p2, p0, Loj1;->f:I

    .line 25
    .line 26
    invoke-virtual {v0, p2}, Lpp;->i(I)Lpp;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iput-object p2, p0, Loj1;->b:Lpp;

    .line 32
    .line 33
    iget v0, p0, Loj1;->f:I

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x1

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p2, Lpp;->d:Lbc0;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    if-ne v0, v2, :cond_2

    .line 43
    .line 44
    iget-object v0, p2, Lpp;->e:Lgh1;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object v0, v1

    .line 48
    :goto_1
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    iget v0, p0, Loj1;->f:I

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Lpp;->h(I)Lpp;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    :goto_2
    if-eqz p2, :cond_5

    .line 58
    .line 59
    iget v0, p0, Loj1;->f:I

    .line 60
    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p2, Lpp;->d:Lbc0;

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_3
    if-ne v0, v2, :cond_4

    .line 67
    .line 68
    iget-object v0, p2, Lpp;->e:Lgh1;

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_4
    move-object v0, v1

    .line 72
    :goto_3
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget v0, p0, Loj1;->f:I

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Lpp;->h(I)Lpp;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    goto :goto_2

    .line 82
    :cond_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    const/4 v0, 0x0

    .line 87
    :cond_6
    :goto_4
    if-ge v0, p2, :cond_8

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    check-cast v1, Loj1;

    .line 96
    .line 97
    iget v3, p0, Loj1;->f:I

    .line 98
    .line 99
    if-nez v3, :cond_7

    .line 100
    .line 101
    iget-object v1, v1, Loj1;->b:Lpp;

    .line 102
    .line 103
    iput-object p0, v1, Lpp;->b:Lkj;

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_7
    if-ne v3, v2, :cond_6

    .line 107
    .line 108
    iget-object v1, v1, Loj1;->b:Lpp;

    .line 109
    .line 110
    iput-object p0, v1, Lpp;->c:Lkj;

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_8
    iget p2, p0, Loj1;->f:I

    .line 114
    .line 115
    if-nez p2, :cond_9

    .line 116
    .line 117
    iget-object p2, p0, Loj1;->b:Lpp;

    .line 118
    .line 119
    iget-object p2, p2, Lpp;->I:Lqp;

    .line 120
    .line 121
    iget-boolean p2, p2, Lqp;->h0:Z

    .line 122
    .line 123
    if-eqz p2, :cond_9

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-le p2, v2, :cond_9

    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    sub-int/2addr p2, v2

    .line 136
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Loj1;

    .line 141
    .line 142
    iget-object p1, p1, Loj1;->b:Lpp;

    .line 143
    .line 144
    iput-object p1, p0, Loj1;->b:Lpp;

    .line 145
    .line 146
    :cond_9
    iget p1, p0, Loj1;->f:I

    .line 147
    .line 148
    iget-object p2, p0, Loj1;->b:Lpp;

    .line 149
    .line 150
    if-nez p1, :cond_a

    .line 151
    .line 152
    iget p1, p2, Lpp;->X:I

    .line 153
    .line 154
    goto :goto_5

    .line 155
    :cond_a
    iget p1, p2, Lpp;->Y:I

    .line 156
    .line 157
    :goto_5
    iput p1, p0, Lkj;->l:I

    .line 158
    .line 159
    return-void
.end method


# virtual methods
.method public final a(Lcx;)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Loj1;->h:Lfx;

    .line 4
    .line 5
    iget-boolean v2, v1, Lfx;->j:Z

    .line 6
    .line 7
    if-eqz v2, :cond_58

    .line 8
    .line 9
    iget-object v2, v0, Loj1;->i:Lfx;

    .line 10
    .line 11
    iget-boolean v3, v2, Lfx;->j:Z

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    goto/16 :goto_33

    .line 16
    .line 17
    :cond_0
    iget-object v3, v0, Loj1;->b:Lpp;

    .line 18
    .line 19
    iget-object v3, v3, Lpp;->I:Lqp;

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    iget-boolean v3, v3, Lqp;->h0:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v3, 0x0

    .line 27
    :goto_0
    iget v5, v2, Lfx;->g:I

    .line 28
    .line 29
    iget v6, v1, Lfx;->g:I

    .line 30
    .line 31
    sub-int/2addr v5, v6

    .line 32
    iget-object v6, v0, Lkj;->k:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    const/4 v8, 0x0

    .line 39
    :goto_1
    const/4 v9, -0x1

    .line 40
    const/16 v10, 0x8

    .line 41
    .line 42
    if-ge v8, v7, :cond_2

    .line 43
    .line 44
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    check-cast v11, Loj1;

    .line 49
    .line 50
    iget-object v11, v11, Loj1;->b:Lpp;

    .line 51
    .line 52
    iget v11, v11, Lpp;->V:I

    .line 53
    .line 54
    if-ne v11, v10, :cond_3

    .line 55
    .line 56
    add-int/lit8 v8, v8, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    move v8, v9

    .line 60
    :cond_3
    add-int/lit8 v11, v7, -0x1

    .line 61
    .line 62
    move v12, v11

    .line 63
    :goto_2
    if-ltz v12, :cond_5

    .line 64
    .line 65
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v13

    .line 69
    check-cast v13, Loj1;

    .line 70
    .line 71
    iget-object v13, v13, Loj1;->b:Lpp;

    .line 72
    .line 73
    iget v13, v13, Lpp;->V:I

    .line 74
    .line 75
    if-ne v13, v10, :cond_4

    .line 76
    .line 77
    add-int/lit8 v12, v12, -0x1

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    move v9, v12

    .line 81
    :cond_5
    const/4 v12, 0x0

    .line 82
    :goto_3
    const/4 v15, 0x2

    .line 83
    const/16 p1, 0x0

    .line 84
    .line 85
    if-ge v12, v15, :cond_14

    .line 86
    .line 87
    move/from16 v19, p1

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    const/4 v15, 0x0

    .line 91
    const/16 v17, 0x0

    .line 92
    .line 93
    const/16 v18, 0x0

    .line 94
    .line 95
    :goto_4
    if-ge v4, v7, :cond_11

    .line 96
    .line 97
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v20

    .line 101
    move-object/from16 v13, v20

    .line 102
    .line 103
    check-cast v13, Loj1;

    .line 104
    .line 105
    iget-object v14, v13, Loj1;->b:Lpp;

    .line 106
    .line 107
    move/from16 v22, v3

    .line 108
    .line 109
    iget v3, v14, Lpp;->V:I

    .line 110
    .line 111
    if-ne v3, v10, :cond_6

    .line 112
    .line 113
    move/from16 v24, v12

    .line 114
    .line 115
    goto/16 :goto_a

    .line 116
    .line 117
    :cond_6
    add-int/lit8 v18, v18, 0x1

    .line 118
    .line 119
    if-lez v4, :cond_7

    .line 120
    .line 121
    if-lt v4, v8, :cond_7

    .line 122
    .line 123
    iget-object v3, v13, Loj1;->h:Lfx;

    .line 124
    .line 125
    iget v3, v3, Lfx;->f:I

    .line 126
    .line 127
    add-int/2addr v15, v3

    .line 128
    :cond_7
    iget-object v3, v13, Loj1;->e:Lrx;

    .line 129
    .line 130
    iget v10, v3, Lfx;->g:I

    .line 131
    .line 132
    move/from16 v23, v10

    .line 133
    .line 134
    iget v10, v13, Loj1;->d:I

    .line 135
    .line 136
    move/from16 v24, v12

    .line 137
    .line 138
    const/4 v12, 0x3

    .line 139
    if-eq v10, v12, :cond_8

    .line 140
    .line 141
    const/4 v10, 0x1

    .line 142
    goto :goto_5

    .line 143
    :cond_8
    const/4 v10, 0x0

    .line 144
    :goto_5
    if-eqz v10, :cond_b

    .line 145
    .line 146
    iget v3, v0, Loj1;->f:I

    .line 147
    .line 148
    if-nez v3, :cond_9

    .line 149
    .line 150
    iget-object v12, v14, Lpp;->d:Lbc0;

    .line 151
    .line 152
    iget-object v12, v12, Loj1;->e:Lrx;

    .line 153
    .line 154
    iget-boolean v12, v12, Lfx;->j:Z

    .line 155
    .line 156
    if-nez v12, :cond_9

    .line 157
    .line 158
    goto/16 :goto_33

    .line 159
    .line 160
    :cond_9
    const/4 v12, 0x1

    .line 161
    if-ne v3, v12, :cond_a

    .line 162
    .line 163
    iget-object v3, v14, Lpp;->e:Lgh1;

    .line 164
    .line 165
    iget-object v3, v3, Loj1;->e:Lrx;

    .line 166
    .line 167
    iget-boolean v3, v3, Lfx;->j:Z

    .line 168
    .line 169
    if-nez v3, :cond_a

    .line 170
    .line 171
    goto/16 :goto_33

    .line 172
    .line 173
    :cond_a
    move/from16 v25, v10

    .line 174
    .line 175
    goto :goto_7

    .line 176
    :cond_b
    move/from16 v25, v10

    .line 177
    .line 178
    const/4 v12, 0x1

    .line 179
    iget v10, v13, Loj1;->a:I

    .line 180
    .line 181
    if-ne v10, v12, :cond_c

    .line 182
    .line 183
    if-nez v24, :cond_c

    .line 184
    .line 185
    iget v10, v3, Lrx;->m:I

    .line 186
    .line 187
    add-int/lit8 v17, v17, 0x1

    .line 188
    .line 189
    :goto_6
    const/16 v25, 0x1

    .line 190
    .line 191
    goto :goto_8

    .line 192
    :cond_c
    iget-boolean v3, v3, Lfx;->j:Z

    .line 193
    .line 194
    if-eqz v3, :cond_d

    .line 195
    .line 196
    move/from16 v10, v23

    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_d
    :goto_7
    move/from16 v10, v23

    .line 200
    .line 201
    :goto_8
    if-nez v25, :cond_e

    .line 202
    .line 203
    add-int/lit8 v17, v17, 0x1

    .line 204
    .line 205
    iget-object v3, v14, Lpp;->Z:[F

    .line 206
    .line 207
    iget v10, v0, Loj1;->f:I

    .line 208
    .line 209
    aget v3, v3, v10

    .line 210
    .line 211
    cmpl-float v10, v3, p1

    .line 212
    .line 213
    if-ltz v10, :cond_f

    .line 214
    .line 215
    add-float v19, v19, v3

    .line 216
    .line 217
    goto :goto_9

    .line 218
    :cond_e
    add-int/2addr v15, v10

    .line 219
    :cond_f
    :goto_9
    if-ge v4, v11, :cond_10

    .line 220
    .line 221
    if-ge v4, v9, :cond_10

    .line 222
    .line 223
    iget-object v3, v13, Loj1;->i:Lfx;

    .line 224
    .line 225
    iget v3, v3, Lfx;->f:I

    .line 226
    .line 227
    neg-int v3, v3

    .line 228
    add-int/2addr v15, v3

    .line 229
    :cond_10
    :goto_a
    add-int/lit8 v4, v4, 0x1

    .line 230
    .line 231
    move/from16 v3, v22

    .line 232
    .line 233
    move/from16 v12, v24

    .line 234
    .line 235
    const/16 v10, 0x8

    .line 236
    .line 237
    goto/16 :goto_4

    .line 238
    .line 239
    :cond_11
    move/from16 v22, v3

    .line 240
    .line 241
    move/from16 v24, v12

    .line 242
    .line 243
    if-lt v15, v5, :cond_13

    .line 244
    .line 245
    if-nez v17, :cond_12

    .line 246
    .line 247
    goto :goto_b

    .line 248
    :cond_12
    add-int/lit8 v12, v24, 0x1

    .line 249
    .line 250
    move/from16 v3, v22

    .line 251
    .line 252
    const/16 v10, 0x8

    .line 253
    .line 254
    goto/16 :goto_3

    .line 255
    .line 256
    :cond_13
    :goto_b
    move/from16 v3, v17

    .line 257
    .line 258
    move/from16 v4, v18

    .line 259
    .line 260
    goto :goto_c

    .line 261
    :cond_14
    move/from16 v22, v3

    .line 262
    .line 263
    move/from16 v19, p1

    .line 264
    .line 265
    const/4 v3, 0x0

    .line 266
    const/4 v4, 0x0

    .line 267
    const/4 v15, 0x0

    .line 268
    :goto_c
    iget v1, v1, Lfx;->g:I

    .line 269
    .line 270
    if-eqz v22, :cond_15

    .line 271
    .line 272
    iget v1, v2, Lfx;->g:I

    .line 273
    .line 274
    :cond_15
    const/high16 v2, 0x3f000000    # 0.5f

    .line 275
    .line 276
    if-le v15, v5, :cond_17

    .line 277
    .line 278
    const/high16 v10, 0x40000000    # 2.0f

    .line 279
    .line 280
    if-eqz v22, :cond_16

    .line 281
    .line 282
    sub-int v12, v15, v5

    .line 283
    .line 284
    int-to-float v12, v12

    .line 285
    div-float/2addr v12, v10

    .line 286
    add-float/2addr v12, v2

    .line 287
    float-to-int v10, v12

    .line 288
    add-int/2addr v1, v10

    .line 289
    goto :goto_d

    .line 290
    :cond_16
    sub-int v12, v15, v5

    .line 291
    .line 292
    int-to-float v12, v12

    .line 293
    div-float/2addr v12, v10

    .line 294
    add-float/2addr v12, v2

    .line 295
    float-to-int v10, v12

    .line 296
    sub-int/2addr v1, v10

    .line 297
    :cond_17
    :goto_d
    if-lez v3, :cond_28

    .line 298
    .line 299
    sub-int v10, v5, v15

    .line 300
    .line 301
    int-to-float v10, v10

    .line 302
    int-to-float v12, v3

    .line 303
    div-float v12, v10, v12

    .line 304
    .line 305
    add-float/2addr v12, v2

    .line 306
    float-to-int v12, v12

    .line 307
    const/4 v13, 0x0

    .line 308
    const/4 v14, 0x0

    .line 309
    :goto_e
    if-ge v13, v7, :cond_21

    .line 310
    .line 311
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v17

    .line 315
    move/from16 v18, v2

    .line 316
    .line 317
    move-object/from16 v2, v17

    .line 318
    .line 319
    check-cast v2, Loj1;

    .line 320
    .line 321
    move/from16 v17, v1

    .line 322
    .line 323
    iget-object v1, v2, Loj1;->b:Lpp;

    .line 324
    .line 325
    move/from16 v23, v3

    .line 326
    .line 327
    iget-object v3, v2, Loj1;->e:Lrx;

    .line 328
    .line 329
    move/from16 v24, v10

    .line 330
    .line 331
    iget v10, v1, Lpp;->V:I

    .line 332
    .line 333
    move/from16 v25, v12

    .line 334
    .line 335
    const/16 v12, 0x8

    .line 336
    .line 337
    if-ne v10, v12, :cond_19

    .line 338
    .line 339
    :cond_18
    move/from16 v26, v13

    .line 340
    .line 341
    goto/16 :goto_13

    .line 342
    .line 343
    :cond_19
    iget v10, v2, Loj1;->d:I

    .line 344
    .line 345
    const/4 v12, 0x3

    .line 346
    if-ne v10, v12, :cond_18

    .line 347
    .line 348
    iget-boolean v10, v3, Lfx;->j:Z

    .line 349
    .line 350
    if-nez v10, :cond_18

    .line 351
    .line 352
    cmpl-float v10, v19, p1

    .line 353
    .line 354
    if-lez v10, :cond_1a

    .line 355
    .line 356
    iget-object v10, v1, Lpp;->Z:[F

    .line 357
    .line 358
    iget v12, v0, Loj1;->f:I

    .line 359
    .line 360
    aget v10, v10, v12

    .line 361
    .line 362
    mul-float v10, v10, v24

    .line 363
    .line 364
    div-float v10, v10, v19

    .line 365
    .line 366
    add-float v10, v10, v18

    .line 367
    .line 368
    float-to-int v10, v10

    .line 369
    goto :goto_f

    .line 370
    :cond_1a
    move/from16 v10, v25

    .line 371
    .line 372
    :goto_f
    iget v12, v0, Loj1;->f:I

    .line 373
    .line 374
    if-nez v12, :cond_1d

    .line 375
    .line 376
    iget v12, v1, Lpp;->n:I

    .line 377
    .line 378
    iget v1, v1, Lpp;->m:I

    .line 379
    .line 380
    iget v2, v2, Loj1;->a:I

    .line 381
    .line 382
    move/from16 v26, v13

    .line 383
    .line 384
    const/4 v13, 0x1

    .line 385
    if-ne v2, v13, :cond_1b

    .line 386
    .line 387
    iget v2, v3, Lrx;->m:I

    .line 388
    .line 389
    invoke-static {v10, v2}, Ljava/lang/Math;->min(II)I

    .line 390
    .line 391
    .line 392
    move-result v2

    .line 393
    goto :goto_10

    .line 394
    :cond_1b
    move v2, v10

    .line 395
    :goto_10
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-lez v12, :cond_1c

    .line 400
    .line 401
    invoke-static {v12, v1}, Ljava/lang/Math;->min(II)I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    :cond_1c
    if-eq v1, v10, :cond_20

    .line 406
    .line 407
    goto :goto_12

    .line 408
    :cond_1d
    move/from16 v26, v13

    .line 409
    .line 410
    iget v12, v1, Lpp;->q:I

    .line 411
    .line 412
    iget v1, v1, Lpp;->p:I

    .line 413
    .line 414
    iget v2, v2, Loj1;->a:I

    .line 415
    .line 416
    const/4 v13, 0x1

    .line 417
    if-ne v2, v13, :cond_1e

    .line 418
    .line 419
    iget v2, v3, Lrx;->m:I

    .line 420
    .line 421
    invoke-static {v10, v2}, Ljava/lang/Math;->min(II)I

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    goto :goto_11

    .line 426
    :cond_1e
    move v2, v10

    .line 427
    :goto_11
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    if-lez v12, :cond_1f

    .line 432
    .line 433
    invoke-static {v12, v1}, Ljava/lang/Math;->min(II)I

    .line 434
    .line 435
    .line 436
    move-result v1

    .line 437
    :cond_1f
    if-eq v1, v10, :cond_20

    .line 438
    .line 439
    :goto_12
    add-int/lit8 v14, v14, 0x1

    .line 440
    .line 441
    move v10, v1

    .line 442
    :cond_20
    invoke-virtual {v3, v10}, Lrx;->d(I)V

    .line 443
    .line 444
    .line 445
    :goto_13
    add-int/lit8 v13, v26, 0x1

    .line 446
    .line 447
    move/from16 v1, v17

    .line 448
    .line 449
    move/from16 v2, v18

    .line 450
    .line 451
    move/from16 v3, v23

    .line 452
    .line 453
    move/from16 v10, v24

    .line 454
    .line 455
    move/from16 v12, v25

    .line 456
    .line 457
    goto/16 :goto_e

    .line 458
    .line 459
    :cond_21
    move/from16 v17, v1

    .line 460
    .line 461
    move/from16 v18, v2

    .line 462
    .line 463
    move/from16 v23, v3

    .line 464
    .line 465
    if-lez v14, :cond_25

    .line 466
    .line 467
    sub-int v3, v23, v14

    .line 468
    .line 469
    const/4 v1, 0x0

    .line 470
    const/4 v15, 0x0

    .line 471
    :goto_14
    if-ge v1, v7, :cond_26

    .line 472
    .line 473
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object v2

    .line 477
    check-cast v2, Loj1;

    .line 478
    .line 479
    iget-object v10, v2, Loj1;->b:Lpp;

    .line 480
    .line 481
    iget v10, v10, Lpp;->V:I

    .line 482
    .line 483
    const/16 v12, 0x8

    .line 484
    .line 485
    if-ne v10, v12, :cond_22

    .line 486
    .line 487
    goto :goto_15

    .line 488
    :cond_22
    if-lez v1, :cond_23

    .line 489
    .line 490
    if-lt v1, v8, :cond_23

    .line 491
    .line 492
    iget-object v10, v2, Loj1;->h:Lfx;

    .line 493
    .line 494
    iget v10, v10, Lfx;->f:I

    .line 495
    .line 496
    add-int/2addr v15, v10

    .line 497
    :cond_23
    iget-object v10, v2, Loj1;->e:Lrx;

    .line 498
    .line 499
    iget v10, v10, Lfx;->g:I

    .line 500
    .line 501
    add-int/2addr v15, v10

    .line 502
    if-ge v1, v11, :cond_24

    .line 503
    .line 504
    if-ge v1, v9, :cond_24

    .line 505
    .line 506
    iget-object v2, v2, Loj1;->i:Lfx;

    .line 507
    .line 508
    iget v2, v2, Lfx;->f:I

    .line 509
    .line 510
    neg-int v2, v2

    .line 511
    add-int/2addr v15, v2

    .line 512
    :cond_24
    :goto_15
    add-int/lit8 v1, v1, 0x1

    .line 513
    .line 514
    goto :goto_14

    .line 515
    :cond_25
    move/from16 v3, v23

    .line 516
    .line 517
    :cond_26
    iget v1, v0, Lkj;->l:I

    .line 518
    .line 519
    const/4 v2, 0x2

    .line 520
    if-ne v1, v2, :cond_27

    .line 521
    .line 522
    if-nez v14, :cond_27

    .line 523
    .line 524
    const/4 v1, 0x0

    .line 525
    iput v1, v0, Lkj;->l:I

    .line 526
    .line 527
    goto :goto_16

    .line 528
    :cond_27
    const/4 v1, 0x0

    .line 529
    goto :goto_16

    .line 530
    :cond_28
    move/from16 v17, v1

    .line 531
    .line 532
    move/from16 v18, v2

    .line 533
    .line 534
    move/from16 v23, v3

    .line 535
    .line 536
    const/4 v1, 0x0

    .line 537
    const/4 v2, 0x2

    .line 538
    :goto_16
    if-le v15, v5, :cond_29

    .line 539
    .line 540
    iput v2, v0, Lkj;->l:I

    .line 541
    .line 542
    :cond_29
    if-lez v4, :cond_2a

    .line 543
    .line 544
    if-nez v3, :cond_2a

    .line 545
    .line 546
    if-ne v8, v9, :cond_2a

    .line 547
    .line 548
    iput v2, v0, Lkj;->l:I

    .line 549
    .line 550
    :cond_2a
    iget v2, v0, Lkj;->l:I

    .line 551
    .line 552
    const/4 v13, 0x1

    .line 553
    if-ne v2, v13, :cond_3a

    .line 554
    .line 555
    if-le v4, v13, :cond_2b

    .line 556
    .line 557
    sub-int/2addr v5, v15

    .line 558
    sub-int/2addr v4, v13

    .line 559
    div-int/2addr v5, v4

    .line 560
    goto :goto_17

    .line 561
    :cond_2b
    if-ne v4, v13, :cond_2c

    .line 562
    .line 563
    sub-int/2addr v5, v15

    .line 564
    const/16 v16, 0x2

    .line 565
    .line 566
    div-int/lit8 v5, v5, 0x2

    .line 567
    .line 568
    goto :goto_17

    .line 569
    :cond_2c
    move v5, v1

    .line 570
    :goto_17
    if-lez v3, :cond_2d

    .line 571
    .line 572
    move v5, v1

    .line 573
    :cond_2d
    move v4, v1

    .line 574
    move/from16 v1, v17

    .line 575
    .line 576
    :goto_18
    if-ge v4, v7, :cond_58

    .line 577
    .line 578
    if-eqz v22, :cond_2e

    .line 579
    .line 580
    add-int/lit8 v0, v4, 0x1

    .line 581
    .line 582
    sub-int v0, v7, v0

    .line 583
    .line 584
    goto :goto_19

    .line 585
    :cond_2e
    move v0, v4

    .line 586
    :goto_19
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    check-cast v0, Loj1;

    .line 591
    .line 592
    iget-object v2, v0, Loj1;->b:Lpp;

    .line 593
    .line 594
    iget-object v3, v0, Loj1;->i:Lfx;

    .line 595
    .line 596
    iget-object v10, v0, Loj1;->h:Lfx;

    .line 597
    .line 598
    iget v2, v2, Lpp;->V:I

    .line 599
    .line 600
    const/16 v12, 0x8

    .line 601
    .line 602
    if-ne v2, v12, :cond_2f

    .line 603
    .line 604
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 608
    .line 609
    .line 610
    goto :goto_20

    .line 611
    :cond_2f
    if-lez v4, :cond_31

    .line 612
    .line 613
    if-eqz v22, :cond_30

    .line 614
    .line 615
    sub-int/2addr v1, v5

    .line 616
    goto :goto_1a

    .line 617
    :cond_30
    add-int/2addr v1, v5

    .line 618
    :cond_31
    :goto_1a
    if-lez v4, :cond_33

    .line 619
    .line 620
    if-lt v4, v8, :cond_33

    .line 621
    .line 622
    if-eqz v22, :cond_32

    .line 623
    .line 624
    iget v2, v10, Lfx;->f:I

    .line 625
    .line 626
    sub-int/2addr v1, v2

    .line 627
    goto :goto_1b

    .line 628
    :cond_32
    iget v2, v10, Lfx;->f:I

    .line 629
    .line 630
    add-int/2addr v1, v2

    .line 631
    :cond_33
    :goto_1b
    if-eqz v22, :cond_34

    .line 632
    .line 633
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 634
    .line 635
    .line 636
    goto :goto_1c

    .line 637
    :cond_34
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 638
    .line 639
    .line 640
    :goto_1c
    iget-object v2, v0, Loj1;->e:Lrx;

    .line 641
    .line 642
    iget v12, v2, Lfx;->g:I

    .line 643
    .line 644
    iget v13, v0, Loj1;->d:I

    .line 645
    .line 646
    const/4 v14, 0x3

    .line 647
    if-ne v13, v14, :cond_35

    .line 648
    .line 649
    iget v13, v0, Loj1;->a:I

    .line 650
    .line 651
    const/4 v14, 0x1

    .line 652
    if-ne v13, v14, :cond_35

    .line 653
    .line 654
    iget v12, v2, Lrx;->m:I

    .line 655
    .line 656
    :cond_35
    if-eqz v22, :cond_36

    .line 657
    .line 658
    sub-int/2addr v1, v12

    .line 659
    goto :goto_1d

    .line 660
    :cond_36
    add-int/2addr v1, v12

    .line 661
    :goto_1d
    if-eqz v22, :cond_37

    .line 662
    .line 663
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 664
    .line 665
    .line 666
    :goto_1e
    const/4 v13, 0x1

    .line 667
    goto :goto_1f

    .line 668
    :cond_37
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 669
    .line 670
    .line 671
    goto :goto_1e

    .line 672
    :goto_1f
    iput-boolean v13, v0, Loj1;->g:Z

    .line 673
    .line 674
    if-ge v4, v11, :cond_39

    .line 675
    .line 676
    if-ge v4, v9, :cond_39

    .line 677
    .line 678
    if-eqz v22, :cond_38

    .line 679
    .line 680
    iget v0, v3, Lfx;->f:I

    .line 681
    .line 682
    neg-int v0, v0

    .line 683
    sub-int/2addr v1, v0

    .line 684
    goto :goto_20

    .line 685
    :cond_38
    iget v0, v3, Lfx;->f:I

    .line 686
    .line 687
    neg-int v0, v0

    .line 688
    add-int/2addr v1, v0

    .line 689
    :cond_39
    :goto_20
    add-int/lit8 v4, v4, 0x1

    .line 690
    .line 691
    goto :goto_18

    .line 692
    :cond_3a
    if-nez v2, :cond_47

    .line 693
    .line 694
    sub-int/2addr v5, v15

    .line 695
    const/16 v21, 0x1

    .line 696
    .line 697
    add-int/lit8 v4, v4, 0x1

    .line 698
    .line 699
    div-int/2addr v5, v4

    .line 700
    if-lez v3, :cond_3b

    .line 701
    .line 702
    move v5, v1

    .line 703
    :cond_3b
    move v4, v1

    .line 704
    move/from16 v1, v17

    .line 705
    .line 706
    :goto_21
    if-ge v4, v7, :cond_58

    .line 707
    .line 708
    if-eqz v22, :cond_3c

    .line 709
    .line 710
    add-int/lit8 v0, v4, 0x1

    .line 711
    .line 712
    sub-int v0, v7, v0

    .line 713
    .line 714
    goto :goto_22

    .line 715
    :cond_3c
    move v0, v4

    .line 716
    :goto_22
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 717
    .line 718
    .line 719
    move-result-object v0

    .line 720
    check-cast v0, Loj1;

    .line 721
    .line 722
    iget-object v2, v0, Loj1;->b:Lpp;

    .line 723
    .line 724
    iget-object v3, v0, Loj1;->i:Lfx;

    .line 725
    .line 726
    iget-object v10, v0, Loj1;->h:Lfx;

    .line 727
    .line 728
    iget v2, v2, Lpp;->V:I

    .line 729
    .line 730
    const/16 v12, 0x8

    .line 731
    .line 732
    if-ne v2, v12, :cond_3d

    .line 733
    .line 734
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 735
    .line 736
    .line 737
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 738
    .line 739
    .line 740
    goto :goto_28

    .line 741
    :cond_3d
    if-eqz v22, :cond_3e

    .line 742
    .line 743
    sub-int/2addr v1, v5

    .line 744
    goto :goto_23

    .line 745
    :cond_3e
    add-int/2addr v1, v5

    .line 746
    :goto_23
    if-lez v4, :cond_40

    .line 747
    .line 748
    if-lt v4, v8, :cond_40

    .line 749
    .line 750
    if-eqz v22, :cond_3f

    .line 751
    .line 752
    iget v2, v10, Lfx;->f:I

    .line 753
    .line 754
    sub-int/2addr v1, v2

    .line 755
    goto :goto_24

    .line 756
    :cond_3f
    iget v2, v10, Lfx;->f:I

    .line 757
    .line 758
    add-int/2addr v1, v2

    .line 759
    :cond_40
    :goto_24
    if-eqz v22, :cond_41

    .line 760
    .line 761
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 762
    .line 763
    .line 764
    goto :goto_25

    .line 765
    :cond_41
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 766
    .line 767
    .line 768
    :goto_25
    iget-object v2, v0, Loj1;->e:Lrx;

    .line 769
    .line 770
    iget v12, v2, Lfx;->g:I

    .line 771
    .line 772
    iget v13, v0, Loj1;->d:I

    .line 773
    .line 774
    const/4 v14, 0x3

    .line 775
    if-ne v13, v14, :cond_42

    .line 776
    .line 777
    iget v0, v0, Loj1;->a:I

    .line 778
    .line 779
    const/4 v13, 0x1

    .line 780
    if-ne v0, v13, :cond_42

    .line 781
    .line 782
    iget v0, v2, Lrx;->m:I

    .line 783
    .line 784
    invoke-static {v12, v0}, Ljava/lang/Math;->min(II)I

    .line 785
    .line 786
    .line 787
    move-result v12

    .line 788
    :cond_42
    if-eqz v22, :cond_43

    .line 789
    .line 790
    sub-int/2addr v1, v12

    .line 791
    goto :goto_26

    .line 792
    :cond_43
    add-int/2addr v1, v12

    .line 793
    :goto_26
    if-eqz v22, :cond_44

    .line 794
    .line 795
    invoke-virtual {v10, v1}, Lfx;->d(I)V

    .line 796
    .line 797
    .line 798
    goto :goto_27

    .line 799
    :cond_44
    invoke-virtual {v3, v1}, Lfx;->d(I)V

    .line 800
    .line 801
    .line 802
    :goto_27
    if-ge v4, v11, :cond_46

    .line 803
    .line 804
    if-ge v4, v9, :cond_46

    .line 805
    .line 806
    if-eqz v22, :cond_45

    .line 807
    .line 808
    iget v0, v3, Lfx;->f:I

    .line 809
    .line 810
    neg-int v0, v0

    .line 811
    sub-int/2addr v1, v0

    .line 812
    goto :goto_28

    .line 813
    :cond_45
    iget v0, v3, Lfx;->f:I

    .line 814
    .line 815
    neg-int v0, v0

    .line 816
    add-int/2addr v1, v0

    .line 817
    :cond_46
    :goto_28
    add-int/lit8 v4, v4, 0x1

    .line 818
    .line 819
    goto :goto_21

    .line 820
    :cond_47
    const/4 v4, 0x2

    .line 821
    if-ne v2, v4, :cond_58

    .line 822
    .line 823
    iget v2, v0, Loj1;->f:I

    .line 824
    .line 825
    iget-object v0, v0, Loj1;->b:Lpp;

    .line 826
    .line 827
    if-nez v2, :cond_48

    .line 828
    .line 829
    iget v0, v0, Lpp;->S:F

    .line 830
    .line 831
    goto :goto_29

    .line 832
    :cond_48
    iget v0, v0, Lpp;->T:F

    .line 833
    .line 834
    :goto_29
    if-eqz v22, :cond_49

    .line 835
    .line 836
    const/high16 v2, 0x3f800000    # 1.0f

    .line 837
    .line 838
    sub-float v0, v2, v0

    .line 839
    .line 840
    :cond_49
    sub-int/2addr v5, v15

    .line 841
    int-to-float v2, v5

    .line 842
    mul-float/2addr v2, v0

    .line 843
    add-float v2, v2, v18

    .line 844
    .line 845
    float-to-int v0, v2

    .line 846
    if-ltz v0, :cond_4a

    .line 847
    .line 848
    if-lez v3, :cond_4b

    .line 849
    .line 850
    :cond_4a
    move v0, v1

    .line 851
    :cond_4b
    if-eqz v22, :cond_4c

    .line 852
    .line 853
    sub-int v0, v17, v0

    .line 854
    .line 855
    goto :goto_2a

    .line 856
    :cond_4c
    add-int v0, v17, v0

    .line 857
    .line 858
    :goto_2a
    move v4, v1

    .line 859
    :goto_2b
    if-ge v4, v7, :cond_58

    .line 860
    .line 861
    if-eqz v22, :cond_4d

    .line 862
    .line 863
    add-int/lit8 v1, v4, 0x1

    .line 864
    .line 865
    sub-int v1, v7, v1

    .line 866
    .line 867
    goto :goto_2c

    .line 868
    :cond_4d
    move v1, v4

    .line 869
    :goto_2c
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 870
    .line 871
    .line 872
    move-result-object v1

    .line 873
    check-cast v1, Loj1;

    .line 874
    .line 875
    iget-object v2, v1, Loj1;->b:Lpp;

    .line 876
    .line 877
    iget-object v3, v1, Loj1;->i:Lfx;

    .line 878
    .line 879
    iget-object v5, v1, Loj1;->h:Lfx;

    .line 880
    .line 881
    iget v2, v2, Lpp;->V:I

    .line 882
    .line 883
    const/16 v12, 0x8

    .line 884
    .line 885
    if-ne v2, v12, :cond_4e

    .line 886
    .line 887
    invoke-virtual {v5, v0}, Lfx;->d(I)V

    .line 888
    .line 889
    .line 890
    invoke-virtual {v3, v0}, Lfx;->d(I)V

    .line 891
    .line 892
    .line 893
    const/4 v13, 0x1

    .line 894
    const/4 v14, 0x3

    .line 895
    goto :goto_32

    .line 896
    :cond_4e
    if-lez v4, :cond_50

    .line 897
    .line 898
    if-lt v4, v8, :cond_50

    .line 899
    .line 900
    if-eqz v22, :cond_4f

    .line 901
    .line 902
    iget v2, v5, Lfx;->f:I

    .line 903
    .line 904
    sub-int/2addr v0, v2

    .line 905
    goto :goto_2d

    .line 906
    :cond_4f
    iget v2, v5, Lfx;->f:I

    .line 907
    .line 908
    add-int/2addr v0, v2

    .line 909
    :cond_50
    :goto_2d
    if-eqz v22, :cond_51

    .line 910
    .line 911
    invoke-virtual {v3, v0}, Lfx;->d(I)V

    .line 912
    .line 913
    .line 914
    goto :goto_2e

    .line 915
    :cond_51
    invoke-virtual {v5, v0}, Lfx;->d(I)V

    .line 916
    .line 917
    .line 918
    :goto_2e
    iget-object v2, v1, Loj1;->e:Lrx;

    .line 919
    .line 920
    iget v10, v2, Lfx;->g:I

    .line 921
    .line 922
    iget v13, v1, Loj1;->d:I

    .line 923
    .line 924
    const/4 v14, 0x3

    .line 925
    if-ne v13, v14, :cond_52

    .line 926
    .line 927
    iget v1, v1, Loj1;->a:I

    .line 928
    .line 929
    const/4 v13, 0x1

    .line 930
    if-ne v1, v13, :cond_53

    .line 931
    .line 932
    iget v10, v2, Lrx;->m:I

    .line 933
    .line 934
    goto :goto_2f

    .line 935
    :cond_52
    const/4 v13, 0x1

    .line 936
    :cond_53
    :goto_2f
    if-eqz v22, :cond_54

    .line 937
    .line 938
    sub-int/2addr v0, v10

    .line 939
    goto :goto_30

    .line 940
    :cond_54
    add-int/2addr v0, v10

    .line 941
    :goto_30
    if-eqz v22, :cond_55

    .line 942
    .line 943
    invoke-virtual {v5, v0}, Lfx;->d(I)V

    .line 944
    .line 945
    .line 946
    goto :goto_31

    .line 947
    :cond_55
    invoke-virtual {v3, v0}, Lfx;->d(I)V

    .line 948
    .line 949
    .line 950
    :goto_31
    if-ge v4, v11, :cond_57

    .line 951
    .line 952
    if-ge v4, v9, :cond_57

    .line 953
    .line 954
    if-eqz v22, :cond_56

    .line 955
    .line 956
    iget v1, v3, Lfx;->f:I

    .line 957
    .line 958
    neg-int v1, v1

    .line 959
    sub-int/2addr v0, v1

    .line 960
    goto :goto_32

    .line 961
    :cond_56
    iget v1, v3, Lfx;->f:I

    .line 962
    .line 963
    neg-int v1, v1

    .line 964
    add-int/2addr v0, v1

    .line 965
    :cond_57
    :goto_32
    add-int/lit8 v4, v4, 0x1

    .line 966
    .line 967
    goto :goto_2b

    .line 968
    :cond_58
    :goto_33
    return-void
.end method

.method public final d()V
    .locals 7

    .line 1
    iget-object v0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    check-cast v4, Loj1;

    .line 18
    .line 19
    invoke-virtual {v4}, Loj1;->d()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v3, 0x1

    .line 28
    if-ge v1, v3, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Loj1;

    .line 36
    .line 37
    iget-object v4, v4, Loj1;->b:Lpp;

    .line 38
    .line 39
    sub-int/2addr v1, v3

    .line 40
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Loj1;

    .line 45
    .line 46
    iget-object v0, v0, Loj1;->b:Lpp;

    .line 47
    .line 48
    iget v1, p0, Loj1;->f:I

    .line 49
    .line 50
    iget-object v5, p0, Loj1;->i:Lfx;

    .line 51
    .line 52
    iget-object v6, p0, Loj1;->h:Lfx;

    .line 53
    .line 54
    if-nez v1, :cond_5

    .line 55
    .line 56
    iget-object v1, v4, Lpp;->x:Lbp;

    .line 57
    .line 58
    iget-object v0, v0, Lpp;->z:Lbp;

    .line 59
    .line 60
    invoke-static {v1, v2}, Loj1;->i(Lbp;I)Lfx;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v1}, Lbp;->b()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {p0}, Lkj;->m()Lpp;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    if-eqz v4, :cond_2

    .line 73
    .line 74
    iget-object v1, v4, Lpp;->x:Lbp;

    .line 75
    .line 76
    invoke-virtual {v1}, Lbp;->b()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    :cond_2
    if-eqz v3, :cond_3

    .line 81
    .line 82
    invoke-static {v6, v3, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-static {v0, v2}, Loj1;->i(Lbp;I)Lfx;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0}, Lbp;->b()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0}, Lkj;->n()Lpp;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    iget-object v0, v2, Lpp;->z:Lbp;

    .line 100
    .line 101
    invoke-virtual {v0}, Lbp;->b()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    :cond_4
    if-eqz v1, :cond_9

    .line 106
    .line 107
    neg-int v0, v0

    .line 108
    invoke-static {v5, v1, v0}, Loj1;->b(Lfx;Lfx;I)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_5
    iget-object v1, v4, Lpp;->y:Lbp;

    .line 113
    .line 114
    iget-object v0, v0, Lpp;->A:Lbp;

    .line 115
    .line 116
    invoke-static {v1, v3}, Loj1;->i(Lbp;I)Lfx;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v1}, Lbp;->b()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-virtual {p0}, Lkj;->m()Lpp;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    if-eqz v4, :cond_6

    .line 129
    .line 130
    iget-object v1, v4, Lpp;->y:Lbp;

    .line 131
    .line 132
    invoke-virtual {v1}, Lbp;->b()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    :cond_6
    if-eqz v2, :cond_7

    .line 137
    .line 138
    invoke-static {v6, v2, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 139
    .line 140
    .line 141
    :cond_7
    invoke-static {v0, v3}, Loj1;->i(Lbp;I)Lfx;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0}, Lbp;->b()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    invoke-virtual {p0}, Lkj;->n()Lpp;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    if-eqz v2, :cond_8

    .line 154
    .line 155
    iget-object v0, v2, Lpp;->A:Lbp;

    .line 156
    .line 157
    invoke-virtual {v0}, Lbp;->b()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    :cond_8
    if-eqz v1, :cond_9

    .line 162
    .line 163
    neg-int v0, v0

    .line 164
    invoke-static {v5, v1, v0}, Loj1;->b(Lfx;Lfx;I)V

    .line 165
    .line 166
    .line 167
    :cond_9
    :goto_1
    iput-object p0, v6, Lfx;->a:Loj1;

    .line 168
    .line 169
    iput-object p0, v5, Lfx;->a:Loj1;

    .line 170
    .line 171
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Loj1;

    .line 15
    .line 16
    invoke-virtual {v1}, Loj1;->e()V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Loj1;->c:Lb21;

    .line 3
    .line 4
    iget-object p0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    check-cast v2, Loj1;

    .line 20
    .line 21
    invoke-virtual {v2}, Loj1;->f()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public final j()J
    .locals 7

    .line 1
    iget-object p0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    if-ge v3, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    check-cast v4, Loj1;

    .line 17
    .line 18
    iget-object v5, v4, Loj1;->h:Lfx;

    .line 19
    .line 20
    iget v5, v5, Lfx;->f:I

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    add-long/2addr v1, v5

    .line 24
    invoke-virtual {v4}, Loj1;->j()J

    .line 25
    .line 26
    .line 27
    move-result-wide v5

    .line 28
    add-long/2addr v5, v1

    .line 29
    iget-object v1, v4, Loj1;->i:Lfx;

    .line 30
    .line 31
    iget v1, v1, Lfx;->f:I

    .line 32
    .line 33
    int-to-long v1, v1

    .line 34
    add-long/2addr v1, v5

    .line 35
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-wide v1
.end method

.method public final k()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Loj1;

    .line 16
    .line 17
    invoke-virtual {v3}, Loj1;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final m()Lpp;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge v0, v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Loj1;

    .line 15
    .line 16
    iget-object v1, v1, Loj1;->b:Lpp;

    .line 17
    .line 18
    iget v2, v1, Lpp;->V:I

    .line 19
    .line 20
    const/16 v3, 0x8

    .line 21
    .line 22
    if-eq v2, v3, :cond_0

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final n()Lpp;
    .locals 4

    .line 1
    iget-object p0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Loj1;

    .line 16
    .line 17
    iget-object v1, v1, Loj1;->b:Lpp;

    .line 18
    .line 19
    iget v2, v1, Lpp;->V:I

    .line 20
    .line 21
    const/16 v3, 0x8

    .line 22
    .line 23
    if-eq v2, v3, :cond_0

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, Loj1;->f:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "horizontal : "

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "vertical : "

    .line 9
    .line 10
    :goto_0
    const-string v1, "ChainRun "

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Lkj;->k:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_1
    if-ge v2, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    check-cast v3, Loj1;

    .line 32
    .line 33
    const-string v4, "<"

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v4, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v3, "> "

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    return-object v0
.end method
