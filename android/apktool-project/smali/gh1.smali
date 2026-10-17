.class public final Lgh1;
.super Loj1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public k:Lfx;

.field public l:Lkg;


# virtual methods
.method public final a(Lcx;)V
    .locals 10

    .line 1
    iget p1, p0, Loj1;->j:I

    .line 2
    .line 3
    invoke-static {p1}, Loq;->t(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x3

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq p1, v0, :cond_e

    .line 10
    .line 11
    iget-object p1, p0, Loj1;->e:Lrx;

    .line 12
    .line 13
    iget-boolean v2, p1, Lfx;->c:Z

    .line 14
    .line 15
    const/high16 v3, 0x3f000000    # 0.5f

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-eqz v2, :cond_5

    .line 19
    .line 20
    iget-boolean v2, p1, Lfx;->j:Z

    .line 21
    .line 22
    if-nez v2, :cond_5

    .line 23
    .line 24
    iget v2, p0, Loj1;->d:I

    .line 25
    .line 26
    if-ne v2, v0, :cond_5

    .line 27
    .line 28
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 29
    .line 30
    iget v5, v2, Lpp;->k:I

    .line 31
    .line 32
    const/4 v6, 0x2

    .line 33
    if-eq v5, v6, :cond_4

    .line 34
    .line 35
    if-eq v5, v0, :cond_0

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_0
    iget-object v5, v2, Lpp;->d:Lbc0;

    .line 39
    .line 40
    iget-object v5, v5, Loj1;->e:Lrx;

    .line 41
    .line 42
    iget-boolean v6, v5, Lfx;->j:Z

    .line 43
    .line 44
    if-eqz v6, :cond_5

    .line 45
    .line 46
    iget v6, v2, Lpp;->M:I

    .line 47
    .line 48
    const/4 v7, -0x1

    .line 49
    if-eq v6, v7, :cond_3

    .line 50
    .line 51
    if-eqz v6, :cond_2

    .line 52
    .line 53
    if-eq v6, v1, :cond_1

    .line 54
    .line 55
    move v2, v4

    .line 56
    goto :goto_2

    .line 57
    :cond_1
    iget v5, v5, Lfx;->g:I

    .line 58
    .line 59
    int-to-float v5, v5

    .line 60
    iget v2, v2, Lpp;->L:F

    .line 61
    .line 62
    :goto_0
    div-float/2addr v5, v2

    .line 63
    :goto_1
    add-float/2addr v5, v3

    .line 64
    float-to-int v2, v5

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    iget v5, v5, Lfx;->g:I

    .line 67
    .line 68
    int-to-float v5, v5

    .line 69
    iget v2, v2, Lpp;->L:F

    .line 70
    .line 71
    mul-float/2addr v5, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget v5, v5, Lfx;->g:I

    .line 74
    .line 75
    int-to-float v5, v5

    .line 76
    iget v2, v2, Lpp;->L:F

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :goto_2
    invoke-virtual {p1, v2}, Lrx;->d(I)V

    .line 80
    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_4
    iget-object v5, v2, Lpp;->I:Lqp;

    .line 84
    .line 85
    if-eqz v5, :cond_5

    .line 86
    .line 87
    iget-object v5, v5, Lpp;->e:Lgh1;

    .line 88
    .line 89
    iget-object v5, v5, Loj1;->e:Lrx;

    .line 90
    .line 91
    iget-boolean v6, v5, Lfx;->j:Z

    .line 92
    .line 93
    if-eqz v6, :cond_5

    .line 94
    .line 95
    iget v2, v2, Lpp;->r:F

    .line 96
    .line 97
    iget v5, v5, Lfx;->g:I

    .line 98
    .line 99
    int-to-float v5, v5

    .line 100
    mul-float/2addr v5, v2

    .line 101
    add-float/2addr v5, v3

    .line 102
    float-to-int v2, v5

    .line 103
    invoke-virtual {p1, v2}, Lrx;->d(I)V

    .line 104
    .line 105
    .line 106
    :cond_5
    :goto_3
    iget-object v2, p0, Loj1;->h:Lfx;

    .line 107
    .line 108
    iget-boolean v5, v2, Lfx;->c:Z

    .line 109
    .line 110
    iget-object v6, v2, Lfx;->l:Ljava/util/ArrayList;

    .line 111
    .line 112
    if-eqz v5, :cond_d

    .line 113
    .line 114
    iget-object v5, p0, Loj1;->i:Lfx;

    .line 115
    .line 116
    iget-boolean v7, v5, Lfx;->c:Z

    .line 117
    .line 118
    iget-object v8, v5, Lfx;->l:Ljava/util/ArrayList;

    .line 119
    .line 120
    if-nez v7, :cond_6

    .line 121
    .line 122
    goto/16 :goto_6

    .line 123
    .line 124
    :cond_6
    iget-boolean v7, v2, Lfx;->j:Z

    .line 125
    .line 126
    if-eqz v7, :cond_7

    .line 127
    .line 128
    iget-boolean v7, v5, Lfx;->j:Z

    .line 129
    .line 130
    if-eqz v7, :cond_7

    .line 131
    .line 132
    iget-boolean v7, p1, Lfx;->j:Z

    .line 133
    .line 134
    if-eqz v7, :cond_7

    .line 135
    .line 136
    goto/16 :goto_6

    .line 137
    .line 138
    :cond_7
    iget-boolean v7, p1, Lfx;->j:Z

    .line 139
    .line 140
    if-nez v7, :cond_8

    .line 141
    .line 142
    iget v7, p0, Loj1;->d:I

    .line 143
    .line 144
    if-ne v7, v0, :cond_8

    .line 145
    .line 146
    iget-object v7, p0, Loj1;->b:Lpp;

    .line 147
    .line 148
    iget v9, v7, Lpp;->j:I

    .line 149
    .line 150
    if-nez v9, :cond_8

    .line 151
    .line 152
    invoke-virtual {v7}, Lpp;->p()Z

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    if-nez v7, :cond_8

    .line 157
    .line 158
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Lfx;

    .line 163
    .line 164
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Lfx;

    .line 169
    .line 170
    iget p0, p0, Lfx;->g:I

    .line 171
    .line 172
    iget v1, v2, Lfx;->f:I

    .line 173
    .line 174
    add-int/2addr p0, v1

    .line 175
    iget v0, v0, Lfx;->g:I

    .line 176
    .line 177
    iget v1, v5, Lfx;->f:I

    .line 178
    .line 179
    add-int/2addr v0, v1

    .line 180
    sub-int v1, v0, p0

    .line 181
    .line 182
    invoke-virtual {v2, p0}, Lfx;->d(I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5, v0}, Lfx;->d(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1, v1}, Lrx;->d(I)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_8
    iget-boolean v7, p1, Lfx;->j:Z

    .line 193
    .line 194
    if-nez v7, :cond_a

    .line 195
    .line 196
    iget v7, p0, Loj1;->d:I

    .line 197
    .line 198
    if-ne v7, v0, :cond_a

    .line 199
    .line 200
    iget v0, p0, Loj1;->a:I

    .line 201
    .line 202
    if-ne v0, v1, :cond_a

    .line 203
    .line 204
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-lez v0, :cond_a

    .line 209
    .line 210
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-lez v0, :cond_a

    .line 215
    .line 216
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Lfx;

    .line 221
    .line 222
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    check-cast v1, Lfx;

    .line 227
    .line 228
    iget v0, v0, Lfx;->g:I

    .line 229
    .line 230
    iget v7, v2, Lfx;->f:I

    .line 231
    .line 232
    add-int/2addr v0, v7

    .line 233
    iget v1, v1, Lfx;->g:I

    .line 234
    .line 235
    iget v7, v5, Lfx;->f:I

    .line 236
    .line 237
    add-int/2addr v1, v7

    .line 238
    sub-int/2addr v1, v0

    .line 239
    iget v0, p1, Lrx;->m:I

    .line 240
    .line 241
    if-ge v1, v0, :cond_9

    .line 242
    .line 243
    invoke-virtual {p1, v1}, Lrx;->d(I)V

    .line 244
    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_9
    invoke-virtual {p1, v0}, Lrx;->d(I)V

    .line 248
    .line 249
    .line 250
    :cond_a
    :goto_4
    iget-boolean v0, p1, Lfx;->j:Z

    .line 251
    .line 252
    if-nez v0, :cond_b

    .line 253
    .line 254
    goto :goto_6

    .line 255
    :cond_b
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-lez v0, :cond_d

    .line 260
    .line 261
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-lez v0, :cond_d

    .line 266
    .line 267
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Lfx;

    .line 272
    .line 273
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, Lfx;

    .line 278
    .line 279
    iget v4, v0, Lfx;->g:I

    .line 280
    .line 281
    iget v6, v2, Lfx;->f:I

    .line 282
    .line 283
    add-int/2addr v6, v4

    .line 284
    iget v7, v1, Lfx;->g:I

    .line 285
    .line 286
    iget v8, v5, Lfx;->f:I

    .line 287
    .line 288
    add-int/2addr v8, v7

    .line 289
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 290
    .line 291
    iget p0, p0, Lpp;->T:F

    .line 292
    .line 293
    if-ne v0, v1, :cond_c

    .line 294
    .line 295
    move p0, v3

    .line 296
    goto :goto_5

    .line 297
    :cond_c
    move v4, v6

    .line 298
    move v7, v8

    .line 299
    :goto_5
    sub-int/2addr v7, v4

    .line 300
    iget v0, p1, Lfx;->g:I

    .line 301
    .line 302
    sub-int/2addr v7, v0

    .line 303
    int-to-float v0, v4

    .line 304
    add-float/2addr v0, v3

    .line 305
    int-to-float v1, v7

    .line 306
    mul-float/2addr v1, p0

    .line 307
    add-float/2addr v1, v0

    .line 308
    float-to-int p0, v1

    .line 309
    invoke-virtual {v2, p0}, Lfx;->d(I)V

    .line 310
    .line 311
    .line 312
    iget p0, v2, Lfx;->g:I

    .line 313
    .line 314
    iget p1, p1, Lfx;->g:I

    .line 315
    .line 316
    add-int/2addr p0, p1

    .line 317
    invoke-virtual {v5, p0}, Lfx;->d(I)V

    .line 318
    .line 319
    .line 320
    :cond_d
    :goto_6
    return-void

    .line 321
    :cond_e
    iget-object p1, p0, Loj1;->b:Lpp;

    .line 322
    .line 323
    iget-object v0, p1, Lpp;->y:Lbp;

    .line 324
    .line 325
    iget-object p1, p1, Lpp;->A:Lbp;

    .line 326
    .line 327
    invoke-virtual {p0, v0, p1, v1}, Loj1;->l(Lbp;Lbp;I)V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public final d()V
    .locals 15

    .line 1
    iget-object v0, p0, Lgh1;->k:Lfx;

    .line 2
    .line 3
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 4
    .line 5
    iget-boolean v2, v1, Lpp;->a:Z

    .line 6
    .line 7
    iget-object v3, p0, Loj1;->e:Lrx;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lpp;->g()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v3, v1}, Lrx;->d(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-boolean v1, v3, Lfx;->j:Z

    .line 19
    .line 20
    iget-object v2, v3, Lfx;->k:Ljava/util/ArrayList;

    .line 21
    .line 22
    iget-object v4, v3, Lfx;->l:Ljava/util/ArrayList;

    .line 23
    .line 24
    const/4 v5, 0x4

    .line 25
    const/4 v6, 0x1

    .line 26
    const/4 v7, 0x3

    .line 27
    iget-object v8, p0, Loj1;->i:Lfx;

    .line 28
    .line 29
    iget-object v9, p0, Loj1;->h:Lfx;

    .line 30
    .line 31
    if-nez v1, :cond_3

    .line 32
    .line 33
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 34
    .line 35
    iget-object v10, v1, Lpp;->c0:[I

    .line 36
    .line 37
    aget v10, v10, v6

    .line 38
    .line 39
    iput v10, p0, Loj1;->d:I

    .line 40
    .line 41
    iget-boolean v1, v1, Lpp;->w:Z

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    new-instance v1, Lkg;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lrx;-><init>(Loj1;)V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lgh1;->l:Lkg;

    .line 51
    .line 52
    :cond_1
    iget v1, p0, Loj1;->d:I

    .line 53
    .line 54
    if-eq v1, v7, :cond_4

    .line 55
    .line 56
    if-ne v1, v5, :cond_2

    .line 57
    .line 58
    iget-object v10, p0, Loj1;->b:Lpp;

    .line 59
    .line 60
    iget-object v10, v10, Lpp;->I:Lqp;

    .line 61
    .line 62
    if-eqz v10, :cond_2

    .line 63
    .line 64
    iget-object v11, v10, Lpp;->e:Lgh1;

    .line 65
    .line 66
    iget-object v12, v10, Lpp;->c0:[I

    .line 67
    .line 68
    aget v12, v12, v6

    .line 69
    .line 70
    if-ne v12, v6, :cond_2

    .line 71
    .line 72
    invoke-virtual {v10}, Lpp;->g()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 77
    .line 78
    iget-object v1, v1, Lpp;->y:Lbp;

    .line 79
    .line 80
    invoke-virtual {v1}, Lbp;->b()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    sub-int/2addr v0, v1

    .line 85
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 86
    .line 87
    iget-object v1, v1, Lpp;->A:Lbp;

    .line 88
    .line 89
    invoke-virtual {v1}, Lbp;->b()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    sub-int/2addr v0, v1

    .line 94
    iget-object v1, v11, Loj1;->h:Lfx;

    .line 95
    .line 96
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 97
    .line 98
    iget-object v2, v2, Lpp;->y:Lbp;

    .line 99
    .line 100
    invoke-virtual {v2}, Lbp;->b()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-static {v9, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 105
    .line 106
    .line 107
    iget-object v1, v11, Loj1;->i:Lfx;

    .line 108
    .line 109
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 110
    .line 111
    iget-object p0, p0, Lpp;->A:Lbp;

    .line 112
    .line 113
    invoke-virtual {p0}, Lbp;->b()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    neg-int p0, p0

    .line 118
    invoke-static {v8, v1, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3, v0}, Lrx;->d(I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_2
    if-ne v1, v6, :cond_4

    .line 126
    .line 127
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 128
    .line 129
    invoke-virtual {v1}, Lpp;->g()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {v3, v1}, Lrx;->d(I)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    iget v1, p0, Loj1;->d:I

    .line 138
    .line 139
    if-ne v1, v5, :cond_4

    .line 140
    .line 141
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 142
    .line 143
    iget-object v10, v1, Lpp;->I:Lqp;

    .line 144
    .line 145
    if-eqz v10, :cond_4

    .line 146
    .line 147
    iget-object v11, v10, Lpp;->e:Lgh1;

    .line 148
    .line 149
    iget-object v10, v10, Lpp;->c0:[I

    .line 150
    .line 151
    aget v10, v10, v6

    .line 152
    .line 153
    if-ne v10, v6, :cond_4

    .line 154
    .line 155
    iget-object v0, v11, Loj1;->h:Lfx;

    .line 156
    .line 157
    iget-object v1, v1, Lpp;->y:Lbp;

    .line 158
    .line 159
    invoke-virtual {v1}, Lbp;->b()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-static {v9, v0, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, v11, Loj1;->i:Lfx;

    .line 167
    .line 168
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 169
    .line 170
    iget-object p0, p0, Lpp;->A:Lbp;

    .line 171
    .line 172
    invoke-virtual {p0}, Lbp;->b()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    neg-int p0, p0

    .line 177
    invoke-static {v8, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_4
    :goto_0
    iget-boolean v1, v3, Lfx;->j:Z

    .line 182
    .line 183
    const/4 v10, 0x0

    .line 184
    const/4 v11, 0x2

    .line 185
    if-eqz v1, :cond_d

    .line 186
    .line 187
    iget-object v12, p0, Loj1;->b:Lpp;

    .line 188
    .line 189
    iget-boolean v13, v12, Lpp;->a:Z

    .line 190
    .line 191
    if-eqz v13, :cond_d

    .line 192
    .line 193
    iget-object v1, v12, Lpp;->F:[Lbp;

    .line 194
    .line 195
    aget-object v2, v1, v11

    .line 196
    .line 197
    iget-object v4, v2, Lbp;->d:Lbp;

    .line 198
    .line 199
    if-eqz v4, :cond_8

    .line 200
    .line 201
    aget-object v13, v1, v7

    .line 202
    .line 203
    iget-object v13, v13, Lbp;->d:Lbp;

    .line 204
    .line 205
    if-eqz v13, :cond_8

    .line 206
    .line 207
    invoke-virtual {v12}, Lpp;->p()Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 212
    .line 213
    if-eqz v1, :cond_5

    .line 214
    .line 215
    iget-object v1, v2, Lpp;->F:[Lbp;

    .line 216
    .line 217
    aget-object v1, v1, v11

    .line 218
    .line 219
    invoke-virtual {v1}, Lbp;->b()I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    iput v1, v9, Lfx;->f:I

    .line 224
    .line 225
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 226
    .line 227
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 228
    .line 229
    aget-object v1, v1, v7

    .line 230
    .line 231
    invoke-virtual {v1}, Lbp;->b()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    neg-int v1, v1

    .line 236
    iput v1, v8, Lfx;->f:I

    .line 237
    .line 238
    goto :goto_1

    .line 239
    :cond_5
    iget-object v1, v2, Lpp;->F:[Lbp;

    .line 240
    .line 241
    aget-object v1, v1, v11

    .line 242
    .line 243
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    if-eqz v1, :cond_6

    .line 248
    .line 249
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 250
    .line 251
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 252
    .line 253
    aget-object v2, v2, v11

    .line 254
    .line 255
    invoke-virtual {v2}, Lbp;->b()I

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    invoke-static {v9, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 260
    .line 261
    .line 262
    :cond_6
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 263
    .line 264
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 265
    .line 266
    aget-object v1, v1, v7

    .line 267
    .line 268
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    if-eqz v1, :cond_7

    .line 273
    .line 274
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 275
    .line 276
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 277
    .line 278
    aget-object v2, v2, v7

    .line 279
    .line 280
    invoke-virtual {v2}, Lbp;->b()I

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    neg-int v2, v2

    .line 285
    invoke-static {v8, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 286
    .line 287
    .line 288
    :cond_7
    iput-boolean v6, v9, Lfx;->b:Z

    .line 289
    .line 290
    iput-boolean v6, v8, Lfx;->b:Z

    .line 291
    .line 292
    :goto_1
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 293
    .line 294
    iget-boolean v1, p0, Lpp;->w:Z

    .line 295
    .line 296
    if-eqz v1, :cond_1c

    .line 297
    .line 298
    iget p0, p0, Lpp;->P:I

    .line 299
    .line 300
    invoke-static {v0, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_8
    if-eqz v4, :cond_9

    .line 305
    .line 306
    invoke-static {v2}, Loj1;->h(Lbp;)Lfx;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    if-eqz v1, :cond_1c

    .line 311
    .line 312
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 313
    .line 314
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 315
    .line 316
    aget-object v2, v2, v11

    .line 317
    .line 318
    invoke-virtual {v2}, Lbp;->b()I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    invoke-static {v9, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 323
    .line 324
    .line 325
    iget v1, v3, Lfx;->g:I

    .line 326
    .line 327
    invoke-static {v8, v9, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 328
    .line 329
    .line 330
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 331
    .line 332
    iget-boolean v1, p0, Lpp;->w:Z

    .line 333
    .line 334
    if-eqz v1, :cond_1c

    .line 335
    .line 336
    iget p0, p0, Lpp;->P:I

    .line 337
    .line 338
    invoke-static {v0, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 339
    .line 340
    .line 341
    return-void

    .line 342
    :cond_9
    aget-object v2, v1, v7

    .line 343
    .line 344
    iget-object v4, v2, Lbp;->d:Lbp;

    .line 345
    .line 346
    if-eqz v4, :cond_b

    .line 347
    .line 348
    invoke-static {v2}, Loj1;->h(Lbp;)Lfx;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    if-eqz v1, :cond_a

    .line 353
    .line 354
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 355
    .line 356
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 357
    .line 358
    aget-object v2, v2, v7

    .line 359
    .line 360
    invoke-virtual {v2}, Lbp;->b()I

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    neg-int v2, v2

    .line 365
    invoke-static {v8, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 366
    .line 367
    .line 368
    iget v1, v3, Lfx;->g:I

    .line 369
    .line 370
    neg-int v1, v1

    .line 371
    invoke-static {v9, v8, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 372
    .line 373
    .line 374
    :cond_a
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 375
    .line 376
    iget-boolean v1, p0, Lpp;->w:Z

    .line 377
    .line 378
    if-eqz v1, :cond_1c

    .line 379
    .line 380
    iget p0, p0, Lpp;->P:I

    .line 381
    .line 382
    invoke-static {v0, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 383
    .line 384
    .line 385
    return-void

    .line 386
    :cond_b
    aget-object v1, v1, v5

    .line 387
    .line 388
    iget-object v2, v1, Lbp;->d:Lbp;

    .line 389
    .line 390
    if-eqz v2, :cond_c

    .line 391
    .line 392
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    if-eqz v1, :cond_1c

    .line 397
    .line 398
    invoke-static {v0, v1, v10}, Loj1;->b(Lfx;Lfx;I)V

    .line 399
    .line 400
    .line 401
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 402
    .line 403
    iget p0, p0, Lpp;->P:I

    .line 404
    .line 405
    neg-int p0, p0

    .line 406
    invoke-static {v9, v0, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 407
    .line 408
    .line 409
    iget p0, v3, Lfx;->g:I

    .line 410
    .line 411
    invoke-static {v8, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 412
    .line 413
    .line 414
    return-void

    .line 415
    :cond_c
    instance-of v1, v12, Lbg;

    .line 416
    .line 417
    if-nez v1, :cond_1c

    .line 418
    .line 419
    iget-object v1, v12, Lpp;->I:Lqp;

    .line 420
    .line 421
    if-eqz v1, :cond_1c

    .line 422
    .line 423
    const/4 v1, 0x7

    .line 424
    invoke-virtual {v12, v1}, Lpp;->e(I)Lbp;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    iget-object v1, v1, Lbp;->d:Lbp;

    .line 429
    .line 430
    if-nez v1, :cond_1c

    .line 431
    .line 432
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 433
    .line 434
    iget-object v2, v1, Lpp;->I:Lqp;

    .line 435
    .line 436
    iget-object v2, v2, Lpp;->e:Lgh1;

    .line 437
    .line 438
    iget-object v2, v2, Loj1;->h:Lfx;

    .line 439
    .line 440
    invoke-virtual {v1}, Lpp;->l()I

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    invoke-static {v9, v2, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 445
    .line 446
    .line 447
    iget v1, v3, Lfx;->g:I

    .line 448
    .line 449
    invoke-static {v8, v9, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 450
    .line 451
    .line 452
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 453
    .line 454
    iget-boolean v1, p0, Lpp;->w:Z

    .line 455
    .line 456
    if-eqz v1, :cond_1c

    .line 457
    .line 458
    iget p0, p0, Lpp;->P:I

    .line 459
    .line 460
    invoke-static {v0, v9, p0}, Loj1;->b(Lfx;Lfx;I)V

    .line 461
    .line 462
    .line 463
    return-void

    .line 464
    :cond_d
    if-nez v1, :cond_12

    .line 465
    .line 466
    iget v1, p0, Loj1;->d:I

    .line 467
    .line 468
    if-ne v1, v7, :cond_12

    .line 469
    .line 470
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 471
    .line 472
    iget v12, v1, Lpp;->k:I

    .line 473
    .line 474
    if-eq v12, v11, :cond_10

    .line 475
    .line 476
    if-eq v12, v7, :cond_e

    .line 477
    .line 478
    goto :goto_2

    .line 479
    :cond_e
    invoke-virtual {v1}, Lpp;->p()Z

    .line 480
    .line 481
    .line 482
    move-result v1

    .line 483
    if-nez v1, :cond_13

    .line 484
    .line 485
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 486
    .line 487
    iget v12, v1, Lpp;->j:I

    .line 488
    .line 489
    if-ne v12, v7, :cond_f

    .line 490
    .line 491
    goto :goto_2

    .line 492
    :cond_f
    iget-object v1, v1, Lpp;->d:Lbc0;

    .line 493
    .line 494
    iget-object v1, v1, Loj1;->e:Lrx;

    .line 495
    .line 496
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    iget-object v1, v1, Lfx;->k:Ljava/util/ArrayList;

    .line 500
    .line 501
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    iput-boolean v6, v3, Lfx;->b:Z

    .line 505
    .line 506
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 510
    .line 511
    .line 512
    goto :goto_2

    .line 513
    :cond_10
    iget-object v1, v1, Lpp;->I:Lqp;

    .line 514
    .line 515
    if-nez v1, :cond_11

    .line 516
    .line 517
    goto :goto_2

    .line 518
    :cond_11
    iget-object v1, v1, Lpp;->e:Lgh1;

    .line 519
    .line 520
    iget-object v1, v1, Loj1;->e:Lrx;

    .line 521
    .line 522
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    iget-object v1, v1, Lfx;->k:Ljava/util/ArrayList;

    .line 526
    .line 527
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    iput-boolean v6, v3, Lfx;->b:Z

    .line 531
    .line 532
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 533
    .line 534
    .line 535
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    .line 537
    .line 538
    goto :goto_2

    .line 539
    :cond_12
    invoke-virtual {v3, p0}, Lfx;->b(Loj1;)V

    .line 540
    .line 541
    .line 542
    :cond_13
    :goto_2
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 543
    .line 544
    iget-object v2, v1, Lpp;->F:[Lbp;

    .line 545
    .line 546
    aget-object v12, v2, v11

    .line 547
    .line 548
    iget-object v13, v12, Lbp;->d:Lbp;

    .line 549
    .line 550
    if-eqz v13, :cond_15

    .line 551
    .line 552
    aget-object v14, v2, v7

    .line 553
    .line 554
    iget-object v14, v14, Lbp;->d:Lbp;

    .line 555
    .line 556
    if-eqz v14, :cond_15

    .line 557
    .line 558
    invoke-virtual {v1}, Lpp;->p()Z

    .line 559
    .line 560
    .line 561
    move-result v1

    .line 562
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 563
    .line 564
    if-eqz v1, :cond_14

    .line 565
    .line 566
    iget-object v1, v2, Lpp;->F:[Lbp;

    .line 567
    .line 568
    aget-object v1, v1, v11

    .line 569
    .line 570
    invoke-virtual {v1}, Lbp;->b()I

    .line 571
    .line 572
    .line 573
    move-result v1

    .line 574
    iput v1, v9, Lfx;->f:I

    .line 575
    .line 576
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 577
    .line 578
    iget-object v1, v1, Lpp;->F:[Lbp;

    .line 579
    .line 580
    aget-object v1, v1, v7

    .line 581
    .line 582
    invoke-virtual {v1}, Lbp;->b()I

    .line 583
    .line 584
    .line 585
    move-result v1

    .line 586
    neg-int v1, v1

    .line 587
    iput v1, v8, Lfx;->f:I

    .line 588
    .line 589
    goto :goto_3

    .line 590
    :cond_14
    iget-object v1, v2, Lpp;->F:[Lbp;

    .line 591
    .line 592
    aget-object v1, v1, v11

    .line 593
    .line 594
    invoke-static {v1}, Loj1;->h(Lbp;)Lfx;

    .line 595
    .line 596
    .line 597
    move-result-object v1

    .line 598
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 599
    .line 600
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 601
    .line 602
    aget-object v2, v2, v7

    .line 603
    .line 604
    invoke-static {v2}, Loj1;->h(Lbp;)Lfx;

    .line 605
    .line 606
    .line 607
    move-result-object v2

    .line 608
    invoke-virtual {v1, p0}, Lfx;->b(Loj1;)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v2, p0}, Lfx;->b(Loj1;)V

    .line 612
    .line 613
    .line 614
    iput v5, p0, Loj1;->j:I

    .line 615
    .line 616
    :goto_3
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 617
    .line 618
    iget-boolean v1, v1, Lpp;->w:Z

    .line 619
    .line 620
    if-eqz v1, :cond_1b

    .line 621
    .line 622
    iget-object v1, p0, Lgh1;->l:Lkg;

    .line 623
    .line 624
    invoke-virtual {p0, v0, v9, v6, v1}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 625
    .line 626
    .line 627
    goto/16 :goto_4

    .line 628
    .line 629
    :cond_15
    const/4 v14, 0x0

    .line 630
    if-eqz v13, :cond_17

    .line 631
    .line 632
    invoke-static {v12}, Loj1;->h(Lbp;)Lfx;

    .line 633
    .line 634
    .line 635
    move-result-object v1

    .line 636
    if-eqz v1, :cond_1b

    .line 637
    .line 638
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 639
    .line 640
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 641
    .line 642
    aget-object v2, v2, v11

    .line 643
    .line 644
    invoke-virtual {v2}, Lbp;->b()I

    .line 645
    .line 646
    .line 647
    move-result v2

    .line 648
    invoke-static {v9, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 649
    .line 650
    .line 651
    invoke-virtual {p0, v8, v9, v6, v3}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 652
    .line 653
    .line 654
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 655
    .line 656
    iget-boolean v1, v1, Lpp;->w:Z

    .line 657
    .line 658
    if-eqz v1, :cond_16

    .line 659
    .line 660
    iget-object v1, p0, Lgh1;->l:Lkg;

    .line 661
    .line 662
    invoke-virtual {p0, v0, v9, v6, v1}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 663
    .line 664
    .line 665
    :cond_16
    iget v0, p0, Loj1;->d:I

    .line 666
    .line 667
    if-ne v0, v7, :cond_1b

    .line 668
    .line 669
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 670
    .line 671
    iget v1, v0, Lpp;->L:F

    .line 672
    .line 673
    cmpl-float v1, v1, v14

    .line 674
    .line 675
    if-lez v1, :cond_1b

    .line 676
    .line 677
    iget-object v0, v0, Lpp;->d:Lbc0;

    .line 678
    .line 679
    iget v1, v0, Loj1;->d:I

    .line 680
    .line 681
    if-ne v1, v7, :cond_1b

    .line 682
    .line 683
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 684
    .line 685
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 686
    .line 687
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 691
    .line 692
    iget-object v0, v0, Lpp;->d:Lbc0;

    .line 693
    .line 694
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 695
    .line 696
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 697
    .line 698
    .line 699
    iput-object p0, v3, Lfx;->a:Loj1;

    .line 700
    .line 701
    goto/16 :goto_4

    .line 702
    .line 703
    :cond_17
    aget-object v11, v2, v7

    .line 704
    .line 705
    iget-object v12, v11, Lbp;->d:Lbp;

    .line 706
    .line 707
    const/4 v13, -0x1

    .line 708
    if-eqz v12, :cond_18

    .line 709
    .line 710
    invoke-static {v11}, Loj1;->h(Lbp;)Lfx;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    if-eqz v1, :cond_1b

    .line 715
    .line 716
    iget-object v2, p0, Loj1;->b:Lpp;

    .line 717
    .line 718
    iget-object v2, v2, Lpp;->F:[Lbp;

    .line 719
    .line 720
    aget-object v2, v2, v7

    .line 721
    .line 722
    invoke-virtual {v2}, Lbp;->b()I

    .line 723
    .line 724
    .line 725
    move-result v2

    .line 726
    neg-int v2, v2

    .line 727
    invoke-static {v8, v1, v2}, Loj1;->b(Lfx;Lfx;I)V

    .line 728
    .line 729
    .line 730
    invoke-virtual {p0, v9, v8, v13, v3}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 731
    .line 732
    .line 733
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 734
    .line 735
    iget-boolean v1, v1, Lpp;->w:Z

    .line 736
    .line 737
    if-eqz v1, :cond_1b

    .line 738
    .line 739
    iget-object v1, p0, Lgh1;->l:Lkg;

    .line 740
    .line 741
    invoke-virtual {p0, v0, v9, v6, v1}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 742
    .line 743
    .line 744
    goto :goto_4

    .line 745
    :cond_18
    aget-object v2, v2, v5

    .line 746
    .line 747
    iget-object v5, v2, Lbp;->d:Lbp;

    .line 748
    .line 749
    if-eqz v5, :cond_19

    .line 750
    .line 751
    invoke-static {v2}, Loj1;->h(Lbp;)Lfx;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    if-eqz v1, :cond_1b

    .line 756
    .line 757
    invoke-static {v0, v1, v10}, Loj1;->b(Lfx;Lfx;I)V

    .line 758
    .line 759
    .line 760
    iget-object v1, p0, Lgh1;->l:Lkg;

    .line 761
    .line 762
    invoke-virtual {p0, v9, v0, v13, v1}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 763
    .line 764
    .line 765
    invoke-virtual {p0, v8, v9, v6, v3}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 766
    .line 767
    .line 768
    goto :goto_4

    .line 769
    :cond_19
    instance-of v2, v1, Lbg;

    .line 770
    .line 771
    if-nez v2, :cond_1b

    .line 772
    .line 773
    iget-object v2, v1, Lpp;->I:Lqp;

    .line 774
    .line 775
    if-eqz v2, :cond_1b

    .line 776
    .line 777
    iget-object v2, v2, Lpp;->e:Lgh1;

    .line 778
    .line 779
    iget-object v2, v2, Loj1;->h:Lfx;

    .line 780
    .line 781
    invoke-virtual {v1}, Lpp;->l()I

    .line 782
    .line 783
    .line 784
    move-result v1

    .line 785
    invoke-static {v9, v2, v1}, Loj1;->b(Lfx;Lfx;I)V

    .line 786
    .line 787
    .line 788
    invoke-virtual {p0, v8, v9, v6, v3}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 789
    .line 790
    .line 791
    iget-object v1, p0, Loj1;->b:Lpp;

    .line 792
    .line 793
    iget-boolean v1, v1, Lpp;->w:Z

    .line 794
    .line 795
    if-eqz v1, :cond_1a

    .line 796
    .line 797
    iget-object v1, p0, Lgh1;->l:Lkg;

    .line 798
    .line 799
    invoke-virtual {p0, v0, v9, v6, v1}, Loj1;->c(Lfx;Lfx;ILrx;)V

    .line 800
    .line 801
    .line 802
    :cond_1a
    iget v0, p0, Loj1;->d:I

    .line 803
    .line 804
    if-ne v0, v7, :cond_1b

    .line 805
    .line 806
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 807
    .line 808
    iget v1, v0, Lpp;->L:F

    .line 809
    .line 810
    cmpl-float v1, v1, v14

    .line 811
    .line 812
    if-lez v1, :cond_1b

    .line 813
    .line 814
    iget-object v0, v0, Lpp;->d:Lbc0;

    .line 815
    .line 816
    iget v1, v0, Loj1;->d:I

    .line 817
    .line 818
    if-ne v1, v7, :cond_1b

    .line 819
    .line 820
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 821
    .line 822
    iget-object v0, v0, Lfx;->k:Ljava/util/ArrayList;

    .line 823
    .line 824
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 825
    .line 826
    .line 827
    iget-object v0, p0, Loj1;->b:Lpp;

    .line 828
    .line 829
    iget-object v0, v0, Lpp;->d:Lbc0;

    .line 830
    .line 831
    iget-object v0, v0, Loj1;->e:Lrx;

    .line 832
    .line 833
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 834
    .line 835
    .line 836
    iput-object p0, v3, Lfx;->a:Loj1;

    .line 837
    .line 838
    :cond_1b
    :goto_4
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 839
    .line 840
    .line 841
    move-result p0

    .line 842
    if-nez p0, :cond_1c

    .line 843
    .line 844
    iput-boolean v6, v3, Lfx;->c:Z

    .line 845
    .line 846
    :cond_1c
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Loj1;->h:Lfx;

    .line 2
    .line 3
    iget-boolean v1, v0, Lfx;->j:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 8
    .line 9
    iget v0, v0, Lfx;->g:I

    .line 10
    .line 11
    iput v0, p0, Lpp;->O:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Loj1;->c:Lb21;

    .line 3
    .line 4
    iget-object v0, p0, Loj1;->h:Lfx;

    .line 5
    .line 6
    invoke-virtual {v0}, Lfx;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Loj1;->i:Lfx;

    .line 10
    .line 11
    invoke-virtual {v0}, Lfx;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lgh1;->k:Lfx;

    .line 15
    .line 16
    invoke-virtual {v0}, Lfx;->c()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Loj1;->e:Lrx;

    .line 20
    .line 21
    invoke-virtual {v0}, Lfx;->c()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Loj1;->g:Z

    .line 26
    .line 27
    return-void
.end method

.method public final k()Z
    .locals 2

    .line 1
    iget v0, p0, Loj1;->d:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 7
    .line 8
    iget p0, p0, Lpp;->k:I

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public final m()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Loj1;->g:Z

    .line 3
    .line 4
    iget-object v1, p0, Loj1;->h:Lfx;

    .line 5
    .line 6
    invoke-virtual {v1}, Lfx;->c()V

    .line 7
    .line 8
    .line 9
    iput-boolean v0, v1, Lfx;->j:Z

    .line 10
    .line 11
    iget-object v1, p0, Loj1;->i:Lfx;

    .line 12
    .line 13
    invoke-virtual {v1}, Lfx;->c()V

    .line 14
    .line 15
    .line 16
    iput-boolean v0, v1, Lfx;->j:Z

    .line 17
    .line 18
    iget-object v1, p0, Lgh1;->k:Lfx;

    .line 19
    .line 20
    invoke-virtual {v1}, Lfx;->c()V

    .line 21
    .line 22
    .line 23
    iput-boolean v0, v1, Lfx;->j:Z

    .line 24
    .line 25
    iget-object p0, p0, Loj1;->e:Lrx;

    .line 26
    .line 27
    iput-boolean v0, p0, Lfx;->j:Z

    .line 28
    .line 29
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VerticalRun "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Loj1;->b:Lpp;

    .line 9
    .line 10
    iget-object p0, p0, Lpp;->W:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
