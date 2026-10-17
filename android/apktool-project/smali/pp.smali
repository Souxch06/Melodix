.class public Lpp;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final A:Lbp;

.field public final B:Lbp;

.field public final C:Lbp;

.field public final D:Lbp;

.field public final E:Lbp;

.field public final F:[Lbp;

.field public final G:Ljava/util/ArrayList;

.field public final H:[Z

.field public I:Lqp;

.field public J:I

.field public K:I

.field public L:F

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:I

.field public R:I

.field public S:F

.field public T:F

.field public U:Landroid/view/View;

.field public V:I

.field public W:Ljava/lang/String;

.field public X:I

.field public Y:I

.field public final Z:[F

.field public a:Z

.field public final a0:[Lpp;

.field public b:Lkj;

.field public final b0:[Lpp;

.field public c:Lkj;

.field public final c0:[I

.field public final d:Lbc0;

.field public final e:Lgh1;

.field public final f:[Z

.field public final g:[I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public final l:[I

.field public m:I

.field public n:I

.field public o:F

.field public p:I

.field public q:I

.field public r:F

.field public s:I

.field public t:F

.field public final u:[I

.field public v:F

.field public w:Z

.field public final x:Lbp;

.field public final y:Lbp;

.field public final z:Lbp;


# direct methods
.method public constructor <init>()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Lpp;->a:Z

    .line 8
    .line 9
    new-instance v2, Lbc0;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Loj1;-><init>(Lpp;)V

    .line 12
    .line 13
    .line 14
    iget-object v3, v2, Loj1;->h:Lfx;

    .line 15
    .line 16
    const/4 v4, 0x4

    .line 17
    iput v4, v3, Lfx;->e:I

    .line 18
    .line 19
    iget-object v3, v2, Loj1;->i:Lfx;

    .line 20
    .line 21
    const/4 v5, 0x5

    .line 22
    iput v5, v3, Lfx;->e:I

    .line 23
    .line 24
    iput v1, v2, Loj1;->f:I

    .line 25
    .line 26
    iput-object v2, v0, Lpp;->d:Lbc0;

    .line 27
    .line 28
    new-instance v2, Lgh1;

    .line 29
    .line 30
    invoke-direct {v2, v0}, Loj1;-><init>(Lpp;)V

    .line 31
    .line 32
    .line 33
    new-instance v3, Lfx;

    .line 34
    .line 35
    invoke-direct {v3, v2}, Lfx;-><init>(Loj1;)V

    .line 36
    .line 37
    .line 38
    iput-object v3, v2, Lgh1;->k:Lfx;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    iput-object v6, v2, Lgh1;->l:Lkg;

    .line 42
    .line 43
    iget-object v7, v2, Loj1;->h:Lfx;

    .line 44
    .line 45
    const/4 v8, 0x6

    .line 46
    iput v8, v7, Lfx;->e:I

    .line 47
    .line 48
    iget-object v7, v2, Loj1;->i:Lfx;

    .line 49
    .line 50
    const/4 v9, 0x7

    .line 51
    iput v9, v7, Lfx;->e:I

    .line 52
    .line 53
    const/16 v7, 0x8

    .line 54
    .line 55
    iput v7, v3, Lfx;->e:I

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    iput v3, v2, Loj1;->f:I

    .line 59
    .line 60
    iput-object v2, v0, Lpp;->e:Lgh1;

    .line 61
    .line 62
    const/4 v2, 0x2

    .line 63
    new-array v10, v2, [Z

    .line 64
    .line 65
    fill-array-data v10, :array_0

    .line 66
    .line 67
    .line 68
    iput-object v10, v0, Lpp;->f:[Z

    .line 69
    .line 70
    filled-new-array {v1, v1, v1, v1}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    iput-object v10, v0, Lpp;->g:[I

    .line 75
    .line 76
    const/4 v10, -0x1

    .line 77
    iput v10, v0, Lpp;->h:I

    .line 78
    .line 79
    iput v10, v0, Lpp;->i:I

    .line 80
    .line 81
    iput v1, v0, Lpp;->j:I

    .line 82
    .line 83
    iput v1, v0, Lpp;->k:I

    .line 84
    .line 85
    new-array v11, v2, [I

    .line 86
    .line 87
    iput-object v11, v0, Lpp;->l:[I

    .line 88
    .line 89
    iput v1, v0, Lpp;->m:I

    .line 90
    .line 91
    iput v1, v0, Lpp;->n:I

    .line 92
    .line 93
    const/high16 v11, 0x3f800000    # 1.0f

    .line 94
    .line 95
    iput v11, v0, Lpp;->o:F

    .line 96
    .line 97
    iput v1, v0, Lpp;->p:I

    .line 98
    .line 99
    iput v1, v0, Lpp;->q:I

    .line 100
    .line 101
    iput v11, v0, Lpp;->r:F

    .line 102
    .line 103
    iput v10, v0, Lpp;->s:I

    .line 104
    .line 105
    iput v11, v0, Lpp;->t:F

    .line 106
    .line 107
    const v11, 0x7fffffff

    .line 108
    .line 109
    .line 110
    filled-new-array {v11, v11}, [I

    .line 111
    .line 112
    .line 113
    move-result-object v11

    .line 114
    iput-object v11, v0, Lpp;->u:[I

    .line 115
    .line 116
    const/4 v11, 0x0

    .line 117
    iput v11, v0, Lpp;->v:F

    .line 118
    .line 119
    iput-boolean v1, v0, Lpp;->w:Z

    .line 120
    .line 121
    new-instance v12, Lbp;

    .line 122
    .line 123
    invoke-direct {v12, v0, v2}, Lbp;-><init>(Lpp;I)V

    .line 124
    .line 125
    .line 126
    iput-object v12, v0, Lpp;->x:Lbp;

    .line 127
    .line 128
    new-instance v14, Lbp;

    .line 129
    .line 130
    const/4 v13, 0x3

    .line 131
    invoke-direct {v14, v0, v13}, Lbp;-><init>(Lpp;I)V

    .line 132
    .line 133
    .line 134
    iput-object v14, v0, Lpp;->y:Lbp;

    .line 135
    .line 136
    new-instance v13, Lbp;

    .line 137
    .line 138
    invoke-direct {v13, v0, v4}, Lbp;-><init>(Lpp;I)V

    .line 139
    .line 140
    .line 141
    iput-object v13, v0, Lpp;->z:Lbp;

    .line 142
    .line 143
    new-instance v15, Lbp;

    .line 144
    .line 145
    invoke-direct {v15, v0, v5}, Lbp;-><init>(Lpp;I)V

    .line 146
    .line 147
    .line 148
    iput-object v15, v0, Lpp;->A:Lbp;

    .line 149
    .line 150
    new-instance v4, Lbp;

    .line 151
    .line 152
    invoke-direct {v4, v0, v8}, Lbp;-><init>(Lpp;I)V

    .line 153
    .line 154
    .line 155
    iput-object v4, v0, Lpp;->B:Lbp;

    .line 156
    .line 157
    new-instance v5, Lbp;

    .line 158
    .line 159
    invoke-direct {v5, v0, v7}, Lbp;-><init>(Lpp;I)V

    .line 160
    .line 161
    .line 162
    iput-object v5, v0, Lpp;->C:Lbp;

    .line 163
    .line 164
    new-instance v7, Lbp;

    .line 165
    .line 166
    const/16 v8, 0x9

    .line 167
    .line 168
    invoke-direct {v7, v0, v8}, Lbp;-><init>(Lpp;I)V

    .line 169
    .line 170
    .line 171
    iput-object v7, v0, Lpp;->D:Lbp;

    .line 172
    .line 173
    new-instance v8, Lbp;

    .line 174
    .line 175
    invoke-direct {v8, v0, v9}, Lbp;-><init>(Lpp;I)V

    .line 176
    .line 177
    .line 178
    iput-object v8, v0, Lpp;->E:Lbp;

    .line 179
    .line 180
    move-object/from16 v16, v4

    .line 181
    .line 182
    move-object/from16 v17, v8

    .line 183
    .line 184
    filled-new-array/range {v12 .. v17}, [Lbp;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    move-object/from16 v8, v16

    .line 189
    .line 190
    move-object/from16 v9, v17

    .line 191
    .line 192
    iput-object v4, v0, Lpp;->F:[Lbp;

    .line 193
    .line 194
    new-instance v4, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .line 198
    .line 199
    iput-object v4, v0, Lpp;->G:Ljava/util/ArrayList;

    .line 200
    .line 201
    new-array v10, v2, [Z

    .line 202
    .line 203
    iput-object v10, v0, Lpp;->H:[Z

    .line 204
    .line 205
    filled-new-array {v3, v3}, [I

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    iput-object v3, v0, Lpp;->c0:[I

    .line 210
    .line 211
    iput-object v6, v0, Lpp;->I:Lqp;

    .line 212
    .line 213
    iput v1, v0, Lpp;->J:I

    .line 214
    .line 215
    iput v1, v0, Lpp;->K:I

    .line 216
    .line 217
    iput v11, v0, Lpp;->L:F

    .line 218
    .line 219
    const/4 v3, -0x1

    .line 220
    iput v3, v0, Lpp;->M:I

    .line 221
    .line 222
    iput v1, v0, Lpp;->N:I

    .line 223
    .line 224
    iput v1, v0, Lpp;->O:I

    .line 225
    .line 226
    iput v1, v0, Lpp;->P:I

    .line 227
    .line 228
    const/high16 v3, 0x3f000000    # 0.5f

    .line 229
    .line 230
    iput v3, v0, Lpp;->S:F

    .line 231
    .line 232
    iput v3, v0, Lpp;->T:F

    .line 233
    .line 234
    iput v1, v0, Lpp;->V:I

    .line 235
    .line 236
    iput-object v6, v0, Lpp;->W:Ljava/lang/String;

    .line 237
    .line 238
    iput v1, v0, Lpp;->X:I

    .line 239
    .line 240
    iput v1, v0, Lpp;->Y:I

    .line 241
    .line 242
    new-array v1, v2, [F

    .line 243
    .line 244
    fill-array-data v1, :array_1

    .line 245
    .line 246
    .line 247
    iput-object v1, v0, Lpp;->Z:[F

    .line 248
    .line 249
    filled-new-array {v6, v6}, [Lpp;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iput-object v1, v0, Lpp;->a0:[Lpp;

    .line 254
    .line 255
    filled-new-array {v6, v6}, [Lpp;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    iput-object v1, v0, Lpp;->b0:[Lpp;

    .line 260
    .line 261
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    nop

    .line 287
    :array_0
    .array-data 1
        0x1t
        0x1t
    .end array-data

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    nop

    .line 293
    :array_1
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method


# virtual methods
.method public a(Lpi0;)V
    .locals 58

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lpp;->x:Lbp;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, v0, Lpp;->z:Lbp;

    .line 12
    .line 13
    invoke-virtual {v1, v4}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    iget-object v6, v0, Lpp;->y:Lbp;

    .line 18
    .line 19
    invoke-virtual {v1, v6}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    iget-object v8, v0, Lpp;->A:Lbp;

    .line 24
    .line 25
    invoke-virtual {v1, v8}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 26
    .line 27
    .line 28
    move-result-object v9

    .line 29
    iget-object v10, v0, Lpp;->B:Lbp;

    .line 30
    .line 31
    invoke-virtual {v1, v10}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 32
    .line 33
    .line 34
    move-result-object v11

    .line 35
    iget-object v12, v0, Lpp;->d:Lbc0;

    .line 36
    .line 37
    iget-object v13, v12, Loj1;->h:Lfx;

    .line 38
    .line 39
    iget-object v14, v12, Loj1;->i:Lfx;

    .line 40
    .line 41
    iget-boolean v15, v13, Lfx;->j:Z

    .line 42
    .line 43
    move-object/from16 v16, v10

    .line 44
    .line 45
    iget-object v10, v0, Lpp;->f:[Z

    .line 46
    .line 47
    move-object/from16 v18, v10

    .line 48
    .line 49
    iget-object v10, v0, Lpp;->e:Lgh1;

    .line 50
    .line 51
    move/from16 v19, v15

    .line 52
    .line 53
    const/16 v21, 0x1

    .line 54
    .line 55
    if-eqz v19, :cond_3

    .line 56
    .line 57
    const/16 v19, 0x0

    .line 58
    .line 59
    iget-boolean v15, v14, Lfx;->j:Z

    .line 60
    .line 61
    if-eqz v15, :cond_3

    .line 62
    .line 63
    iget-object v15, v10, Loj1;->h:Lfx;

    .line 64
    .line 65
    move-object/from16 v22, v12

    .line 66
    .line 67
    iget-object v12, v10, Loj1;->i:Lfx;

    .line 68
    .line 69
    iget-boolean v15, v15, Lfx;->j:Z

    .line 70
    .line 71
    if-eqz v15, :cond_4

    .line 72
    .line 73
    iget-boolean v15, v12, Lfx;->j:Z

    .line 74
    .line 75
    if-eqz v15, :cond_4

    .line 76
    .line 77
    iget v2, v13, Lfx;->g:I

    .line 78
    .line 79
    invoke-virtual {v1, v3, v2}, Lpi0;->d(Ln81;I)V

    .line 80
    .line 81
    .line 82
    iget v2, v14, Lfx;->g:I

    .line 83
    .line 84
    invoke-virtual {v1, v5, v2}, Lpi0;->d(Ln81;I)V

    .line 85
    .line 86
    .line 87
    iget-object v2, v10, Loj1;->h:Lfx;

    .line 88
    .line 89
    iget v2, v2, Lfx;->g:I

    .line 90
    .line 91
    invoke-virtual {v1, v7, v2}, Lpi0;->d(Ln81;I)V

    .line 92
    .line 93
    .line 94
    iget v2, v12, Lfx;->g:I

    .line 95
    .line 96
    invoke-virtual {v1, v9, v2}, Lpi0;->d(Ln81;I)V

    .line 97
    .line 98
    .line 99
    iget-object v2, v10, Lgh1;->k:Lfx;

    .line 100
    .line 101
    iget v2, v2, Lfx;->g:I

    .line 102
    .line 103
    invoke-virtual {v1, v11, v2}, Lpi0;->d(Ln81;I)V

    .line 104
    .line 105
    .line 106
    iget-object v2, v0, Lpp;->I:Lqp;

    .line 107
    .line 108
    if-eqz v2, :cond_41

    .line 109
    .line 110
    iget-object v2, v2, Lpp;->c0:[I

    .line 111
    .line 112
    aget v3, v2, v19

    .line 113
    .line 114
    const/4 v4, 0x2

    .line 115
    if-ne v3, v4, :cond_0

    .line 116
    .line 117
    move/from16 v3, v21

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    move/from16 v3, v19

    .line 121
    .line 122
    :goto_0
    aget v2, v2, v21

    .line 123
    .line 124
    if-ne v2, v4, :cond_1

    .line 125
    .line 126
    move/from16 v2, v21

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_1
    move/from16 v2, v19

    .line 130
    .line 131
    :goto_1
    if-eqz v3, :cond_2

    .line 132
    .line 133
    aget-boolean v3, v18, v19

    .line 134
    .line 135
    if-eqz v3, :cond_2

    .line 136
    .line 137
    invoke-virtual {v0}, Lpp;->o()Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-nez v3, :cond_2

    .line 142
    .line 143
    iget-object v3, v0, Lpp;->I:Lqp;

    .line 144
    .line 145
    iget-object v3, v3, Lpp;->z:Lbp;

    .line 146
    .line 147
    invoke-virtual {v1, v3}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    move/from16 v6, v19

    .line 152
    .line 153
    const/16 v4, 0x8

    .line 154
    .line 155
    invoke-virtual {v1, v3, v5, v6, v4}, Lpi0;->f(Ln81;Ln81;II)V

    .line 156
    .line 157
    .line 158
    :cond_2
    if-eqz v2, :cond_41

    .line 159
    .line 160
    aget-boolean v2, v18, v21

    .line 161
    .line 162
    if-eqz v2, :cond_41

    .line 163
    .line 164
    invoke-virtual {v0}, Lpp;->p()Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-nez v2, :cond_41

    .line 169
    .line 170
    iget-object v0, v0, Lpp;->I:Lqp;

    .line 171
    .line 172
    iget-object v0, v0, Lpp;->A:Lbp;

    .line 173
    .line 174
    invoke-virtual {v1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const/16 v4, 0x8

    .line 179
    .line 180
    const/4 v6, 0x0

    .line 181
    invoke-virtual {v1, v0, v9, v6, v4}, Lpi0;->f(Ln81;Ln81;II)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_3
    move-object/from16 v22, v12

    .line 186
    .line 187
    :cond_4
    iget-object v12, v0, Lpp;->I:Lqp;

    .line 188
    .line 189
    if-eqz v12, :cond_c

    .line 190
    .line 191
    iget-object v12, v12, Lpp;->c0:[I

    .line 192
    .line 193
    const/4 v13, 0x0

    .line 194
    aget v15, v12, v13

    .line 195
    .line 196
    const/4 v13, 0x2

    .line 197
    if-ne v15, v13, :cond_5

    .line 198
    .line 199
    move/from16 v15, v21

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_5
    const/4 v15, 0x0

    .line 203
    :goto_2
    aget v12, v12, v21

    .line 204
    .line 205
    if-ne v12, v13, :cond_6

    .line 206
    .line 207
    move/from16 v12, v21

    .line 208
    .line 209
    :goto_3
    const/4 v13, 0x0

    .line 210
    goto :goto_4

    .line 211
    :cond_6
    const/4 v12, 0x0

    .line 212
    goto :goto_3

    .line 213
    :goto_4
    invoke-virtual {v0, v13}, Lpp;->n(I)Z

    .line 214
    .line 215
    .line 216
    move-result v19

    .line 217
    if-eqz v19, :cond_7

    .line 218
    .line 219
    move-object/from16 v23, v7

    .line 220
    .line 221
    iget-object v7, v0, Lpp;->I:Lqp;

    .line 222
    .line 223
    invoke-virtual {v7, v0, v13}, Lqp;->y(Lpp;I)V

    .line 224
    .line 225
    .line 226
    move/from16 v7, v21

    .line 227
    .line 228
    move v13, v7

    .line 229
    goto :goto_5

    .line 230
    :cond_7
    move-object/from16 v23, v7

    .line 231
    .line 232
    invoke-virtual {v0}, Lpp;->o()Z

    .line 233
    .line 234
    .line 235
    move-result v7

    .line 236
    move/from16 v13, v21

    .line 237
    .line 238
    :goto_5
    invoke-virtual {v0, v13}, Lpp;->n(I)Z

    .line 239
    .line 240
    .line 241
    move-result v21

    .line 242
    if-eqz v21, :cond_8

    .line 243
    .line 244
    move/from16 v24, v7

    .line 245
    .line 246
    iget-object v7, v0, Lpp;->I:Lqp;

    .line 247
    .line 248
    invoke-virtual {v7, v0, v13}, Lqp;->y(Lpp;I)V

    .line 249
    .line 250
    .line 251
    const/4 v7, 0x1

    .line 252
    goto :goto_6

    .line 253
    :cond_8
    move/from16 v24, v7

    .line 254
    .line 255
    invoke-virtual {v0}, Lpp;->p()Z

    .line 256
    .line 257
    .line 258
    move-result v7

    .line 259
    :goto_6
    if-nez v24, :cond_a

    .line 260
    .line 261
    if-eqz v15, :cond_a

    .line 262
    .line 263
    iget v13, v0, Lpp;->V:I

    .line 264
    .line 265
    move/from16 v25, v7

    .line 266
    .line 267
    const/16 v7, 0x8

    .line 268
    .line 269
    if-eq v13, v7, :cond_9

    .line 270
    .line 271
    iget-object v7, v2, Lbp;->d:Lbp;

    .line 272
    .line 273
    if-nez v7, :cond_9

    .line 274
    .line 275
    iget-object v7, v4, Lbp;->d:Lbp;

    .line 276
    .line 277
    if-nez v7, :cond_9

    .line 278
    .line 279
    iget-object v7, v0, Lpp;->I:Lqp;

    .line 280
    .line 281
    iget-object v7, v7, Lpp;->z:Lbp;

    .line 282
    .line 283
    invoke-virtual {v1, v7}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 284
    .line 285
    .line 286
    move-result-object v7

    .line 287
    move-object/from16 v26, v2

    .line 288
    .line 289
    const/4 v2, 0x0

    .line 290
    const/4 v13, 0x1

    .line 291
    invoke-virtual {v1, v7, v5, v2, v13}, Lpi0;->f(Ln81;Ln81;II)V

    .line 292
    .line 293
    .line 294
    goto :goto_7

    .line 295
    :cond_9
    move-object/from16 v26, v2

    .line 296
    .line 297
    goto :goto_7

    .line 298
    :cond_a
    move-object/from16 v26, v2

    .line 299
    .line 300
    move/from16 v25, v7

    .line 301
    .line 302
    :goto_7
    if-nez v25, :cond_b

    .line 303
    .line 304
    if-eqz v12, :cond_b

    .line 305
    .line 306
    iget v2, v0, Lpp;->V:I

    .line 307
    .line 308
    const/16 v7, 0x8

    .line 309
    .line 310
    if-eq v2, v7, :cond_b

    .line 311
    .line 312
    iget-object v2, v6, Lbp;->d:Lbp;

    .line 313
    .line 314
    if-nez v2, :cond_b

    .line 315
    .line 316
    iget-object v2, v8, Lbp;->d:Lbp;

    .line 317
    .line 318
    if-nez v2, :cond_b

    .line 319
    .line 320
    if-nez v16, :cond_b

    .line 321
    .line 322
    iget-object v2, v0, Lpp;->I:Lqp;

    .line 323
    .line 324
    iget-object v2, v2, Lpp;->A:Lbp;

    .line 325
    .line 326
    invoke-virtual {v1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    const/4 v7, 0x0

    .line 331
    const/4 v13, 0x1

    .line 332
    invoke-virtual {v1, v2, v9, v7, v13}, Lpi0;->f(Ln81;Ln81;II)V

    .line 333
    .line 334
    .line 335
    :cond_b
    move-object v7, v4

    .line 336
    move v4, v12

    .line 337
    move-object/from16 v2, v18

    .line 338
    .line 339
    move/from16 v18, v24

    .line 340
    .line 341
    goto :goto_8

    .line 342
    :cond_c
    move-object/from16 v26, v2

    .line 343
    .line 344
    move-object/from16 v23, v7

    .line 345
    .line 346
    move-object v7, v4

    .line 347
    move-object/from16 v2, v18

    .line 348
    .line 349
    const/4 v4, 0x0

    .line 350
    const/4 v15, 0x0

    .line 351
    const/16 v18, 0x0

    .line 352
    .line 353
    const/16 v25, 0x0

    .line 354
    .line 355
    :goto_8
    iget v12, v0, Lpp;->J:I

    .line 356
    .line 357
    iget v13, v0, Lpp;->Q:I

    .line 358
    .line 359
    if-ge v12, v13, :cond_d

    .line 360
    .line 361
    :goto_9
    move-object/from16 v24, v2

    .line 362
    .line 363
    goto :goto_a

    .line 364
    :cond_d
    move v13, v12

    .line 365
    goto :goto_9

    .line 366
    :goto_a
    iget v2, v0, Lpp;->K:I

    .line 367
    .line 368
    move/from16 v27, v4

    .line 369
    .line 370
    iget v4, v0, Lpp;->R:I

    .line 371
    .line 372
    if-ge v2, v4, :cond_e

    .line 373
    .line 374
    move/from16 v28, v4

    .line 375
    .line 376
    goto :goto_b

    .line 377
    :cond_e
    move/from16 v28, v2

    .line 378
    .line 379
    :goto_b
    iget-object v4, v0, Lpp;->c0:[I

    .line 380
    .line 381
    move-object/from16 v29, v4

    .line 382
    .line 383
    const/16 v19, 0x0

    .line 384
    .line 385
    aget v4, v29, v19

    .line 386
    .line 387
    move-object/from16 v30, v6

    .line 388
    .line 389
    const/4 v6, 0x3

    .line 390
    if-eq v4, v6, :cond_f

    .line 391
    .line 392
    const/16 v31, 0x1

    .line 393
    .line 394
    :goto_c
    move-object/from16 v32, v7

    .line 395
    .line 396
    const/16 v21, 0x1

    .line 397
    .line 398
    goto :goto_d

    .line 399
    :cond_f
    const/16 v31, 0x0

    .line 400
    .line 401
    goto :goto_c

    .line 402
    :goto_d
    aget v7, v29, v21

    .line 403
    .line 404
    if-eq v7, v6, :cond_10

    .line 405
    .line 406
    const/16 v33, 0x1

    .line 407
    .line 408
    goto :goto_e

    .line 409
    :cond_10
    const/16 v33, 0x0

    .line 410
    .line 411
    :goto_e
    iget v6, v0, Lpp;->M:I

    .line 412
    .line 413
    iput v6, v0, Lpp;->s:I

    .line 414
    .line 415
    move-object/from16 v35, v8

    .line 416
    .line 417
    iget v8, v0, Lpp;->L:F

    .line 418
    .line 419
    iput v8, v0, Lpp;->t:F

    .line 420
    .line 421
    move/from16 v36, v8

    .line 422
    .line 423
    iget v8, v0, Lpp;->j:I

    .line 424
    .line 425
    move/from16 v37, v8

    .line 426
    .line 427
    iget v8, v0, Lpp;->k:I

    .line 428
    .line 429
    const/16 v38, 0x0

    .line 430
    .line 431
    cmpl-float v38, v36, v38

    .line 432
    .line 433
    move/from16 v39, v8

    .line 434
    .line 435
    const/high16 v40, 0x3f800000    # 1.0f

    .line 436
    .line 437
    if-lez v38, :cond_25

    .line 438
    .line 439
    iget v8, v0, Lpp;->V:I

    .line 440
    .line 441
    move-object/from16 v41, v9

    .line 442
    .line 443
    const/16 v9, 0x8

    .line 444
    .line 445
    if-eq v8, v9, :cond_24

    .line 446
    .line 447
    const/4 v8, 0x3

    .line 448
    if-ne v4, v8, :cond_11

    .line 449
    .line 450
    if-nez v37, :cond_11

    .line 451
    .line 452
    move v9, v8

    .line 453
    goto :goto_f

    .line 454
    :cond_11
    move/from16 v9, v37

    .line 455
    .line 456
    :goto_f
    if-ne v7, v8, :cond_12

    .line 457
    .line 458
    if-nez v39, :cond_12

    .line 459
    .line 460
    move-object/from16 v42, v10

    .line 461
    .line 462
    move v10, v8

    .line 463
    goto :goto_10

    .line 464
    :cond_12
    move-object/from16 v42, v10

    .line 465
    .line 466
    move/from16 v10, v39

    .line 467
    .line 468
    :goto_10
    if-ne v4, v8, :cond_1f

    .line 469
    .line 470
    if-ne v7, v8, :cond_1f

    .line 471
    .line 472
    if-ne v9, v8, :cond_1f

    .line 473
    .line 474
    if-ne v10, v8, :cond_1f

    .line 475
    .line 476
    const/4 v8, -0x1

    .line 477
    if-ne v6, v8, :cond_15

    .line 478
    .line 479
    if-eqz v31, :cond_13

    .line 480
    .line 481
    if-nez v33, :cond_13

    .line 482
    .line 483
    const/4 v2, 0x0

    .line 484
    iput v2, v0, Lpp;->s:I

    .line 485
    .line 486
    const/4 v6, 0x0

    .line 487
    goto :goto_11

    .line 488
    :cond_13
    if-nez v31, :cond_15

    .line 489
    .line 490
    if-eqz v33, :cond_15

    .line 491
    .line 492
    const/4 v2, 0x1

    .line 493
    iput v2, v0, Lpp;->s:I

    .line 494
    .line 495
    if-ne v6, v8, :cond_14

    .line 496
    .line 497
    div-float v8, v40, v36

    .line 498
    .line 499
    iput v8, v0, Lpp;->t:F

    .line 500
    .line 501
    :cond_14
    const/4 v6, 0x1

    .line 502
    :cond_15
    :goto_11
    if-nez v6, :cond_17

    .line 503
    .line 504
    invoke-virtual/range {v30 .. v30}, Lbp;->d()Z

    .line 505
    .line 506
    .line 507
    move-result v2

    .line 508
    if-eqz v2, :cond_16

    .line 509
    .line 510
    invoke-virtual/range {v35 .. v35}, Lbp;->d()Z

    .line 511
    .line 512
    .line 513
    move-result v2

    .line 514
    if-nez v2, :cond_17

    .line 515
    .line 516
    :cond_16
    const/4 v2, 0x1

    .line 517
    goto :goto_12

    .line 518
    :cond_17
    const/4 v2, 0x1

    .line 519
    goto :goto_13

    .line 520
    :goto_12
    iput v2, v0, Lpp;->s:I

    .line 521
    .line 522
    goto :goto_14

    .line 523
    :goto_13
    iget v4, v0, Lpp;->s:I

    .line 524
    .line 525
    if-ne v4, v2, :cond_19

    .line 526
    .line 527
    invoke-virtual/range {v26 .. v26}, Lbp;->d()Z

    .line 528
    .line 529
    .line 530
    move-result v2

    .line 531
    if-eqz v2, :cond_18

    .line 532
    .line 533
    invoke-virtual/range {v32 .. v32}, Lbp;->d()Z

    .line 534
    .line 535
    .line 536
    move-result v2

    .line 537
    if-nez v2, :cond_19

    .line 538
    .line 539
    :cond_18
    const/4 v2, 0x0

    .line 540
    iput v2, v0, Lpp;->s:I

    .line 541
    .line 542
    :cond_19
    :goto_14
    iget v2, v0, Lpp;->s:I

    .line 543
    .line 544
    const/4 v8, -0x1

    .line 545
    if-ne v2, v8, :cond_1c

    .line 546
    .line 547
    invoke-virtual/range {v30 .. v30}, Lbp;->d()Z

    .line 548
    .line 549
    .line 550
    move-result v2

    .line 551
    if-eqz v2, :cond_1a

    .line 552
    .line 553
    invoke-virtual/range {v35 .. v35}, Lbp;->d()Z

    .line 554
    .line 555
    .line 556
    move-result v2

    .line 557
    if-eqz v2, :cond_1a

    .line 558
    .line 559
    invoke-virtual/range {v26 .. v26}, Lbp;->d()Z

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    if-eqz v2, :cond_1a

    .line 564
    .line 565
    invoke-virtual/range {v32 .. v32}, Lbp;->d()Z

    .line 566
    .line 567
    .line 568
    move-result v2

    .line 569
    if-nez v2, :cond_1c

    .line 570
    .line 571
    :cond_1a
    invoke-virtual/range {v30 .. v30}, Lbp;->d()Z

    .line 572
    .line 573
    .line 574
    move-result v2

    .line 575
    if-eqz v2, :cond_1b

    .line 576
    .line 577
    invoke-virtual/range {v35 .. v35}, Lbp;->d()Z

    .line 578
    .line 579
    .line 580
    move-result v2

    .line 581
    if-eqz v2, :cond_1b

    .line 582
    .line 583
    const/4 v2, 0x0

    .line 584
    iput v2, v0, Lpp;->s:I

    .line 585
    .line 586
    goto :goto_15

    .line 587
    :cond_1b
    invoke-virtual/range {v26 .. v26}, Lbp;->d()Z

    .line 588
    .line 589
    .line 590
    move-result v2

    .line 591
    if-eqz v2, :cond_1c

    .line 592
    .line 593
    invoke-virtual/range {v32 .. v32}, Lbp;->d()Z

    .line 594
    .line 595
    .line 596
    move-result v2

    .line 597
    if-eqz v2, :cond_1c

    .line 598
    .line 599
    iget v2, v0, Lpp;->t:F

    .line 600
    .line 601
    div-float v8, v40, v2

    .line 602
    .line 603
    iput v8, v0, Lpp;->t:F

    .line 604
    .line 605
    const/4 v2, 0x1

    .line 606
    iput v2, v0, Lpp;->s:I

    .line 607
    .line 608
    :cond_1c
    :goto_15
    iget v2, v0, Lpp;->s:I

    .line 609
    .line 610
    const/4 v8, -0x1

    .line 611
    if-ne v2, v8, :cond_1e

    .line 612
    .line 613
    iget v4, v0, Lpp;->m:I

    .line 614
    .line 615
    if-lez v4, :cond_1d

    .line 616
    .line 617
    iget v6, v0, Lpp;->p:I

    .line 618
    .line 619
    if-nez v6, :cond_1d

    .line 620
    .line 621
    const/4 v6, 0x0

    .line 622
    iput v6, v0, Lpp;->s:I

    .line 623
    .line 624
    const/4 v2, 0x0

    .line 625
    goto :goto_16

    .line 626
    :cond_1d
    if-nez v4, :cond_1e

    .line 627
    .line 628
    iget v4, v0, Lpp;->p:I

    .line 629
    .line 630
    if-lez v4, :cond_1e

    .line 631
    .line 632
    iget v2, v0, Lpp;->t:F

    .line 633
    .line 634
    div-float v8, v40, v2

    .line 635
    .line 636
    iput v8, v0, Lpp;->t:F

    .line 637
    .line 638
    const/4 v2, 0x1

    .line 639
    iput v2, v0, Lpp;->s:I

    .line 640
    .line 641
    const/4 v2, 0x1

    .line 642
    :cond_1e
    :goto_16
    move v6, v2

    .line 643
    const/4 v8, 0x3

    .line 644
    goto :goto_1b

    .line 645
    :cond_1f
    if-ne v4, v8, :cond_21

    .line 646
    .line 647
    if-ne v9, v8, :cond_21

    .line 648
    .line 649
    const/4 v8, 0x0

    .line 650
    iput v8, v0, Lpp;->s:I

    .line 651
    .line 652
    int-to-float v2, v2

    .line 653
    mul-float v8, v36, v2

    .line 654
    .line 655
    float-to-int v2, v8

    .line 656
    const/4 v8, 0x3

    .line 657
    move v13, v2

    .line 658
    move-object/from16 v2, v22

    .line 659
    .line 660
    const/4 v6, 0x0

    .line 661
    if-eq v7, v8, :cond_20

    .line 662
    .line 663
    const/4 v9, 0x4

    .line 664
    const/16 v30, 0x0

    .line 665
    .line 666
    :goto_17
    move/from16 v22, v10

    .line 667
    .line 668
    goto :goto_1e

    .line 669
    :cond_20
    :goto_18
    const/16 v30, 0x1

    .line 670
    .line 671
    goto :goto_17

    .line 672
    :cond_21
    if-ne v7, v8, :cond_23

    .line 673
    .line 674
    if-ne v10, v8, :cond_23

    .line 675
    .line 676
    const/4 v2, 0x1

    .line 677
    iput v2, v0, Lpp;->s:I

    .line 678
    .line 679
    const/4 v2, -0x1

    .line 680
    if-ne v6, v2, :cond_22

    .line 681
    .line 682
    div-float v2, v40, v36

    .line 683
    .line 684
    iput v2, v0, Lpp;->t:F

    .line 685
    .line 686
    goto :goto_19

    .line 687
    :cond_22
    move/from16 v2, v36

    .line 688
    .line 689
    :goto_19
    int-to-float v6, v12

    .line 690
    mul-float/2addr v2, v6

    .line 691
    float-to-int v2, v2

    .line 692
    move/from16 v28, v2

    .line 693
    .line 694
    move-object/from16 v2, v22

    .line 695
    .line 696
    const/4 v6, 0x1

    .line 697
    if-eq v4, v8, :cond_20

    .line 698
    .line 699
    const/16 v22, 0x4

    .line 700
    .line 701
    :goto_1a
    const/16 v30, 0x0

    .line 702
    .line 703
    goto :goto_1e

    .line 704
    :cond_23
    :goto_1b
    move-object/from16 v2, v22

    .line 705
    .line 706
    goto :goto_18

    .line 707
    :cond_24
    :goto_1c
    move-object/from16 v42, v10

    .line 708
    .line 709
    const/4 v8, 0x3

    .line 710
    goto :goto_1d

    .line 711
    :cond_25
    move-object/from16 v41, v9

    .line 712
    .line 713
    goto :goto_1c

    .line 714
    :goto_1d
    move-object/from16 v2, v22

    .line 715
    .line 716
    move/from16 v9, v37

    .line 717
    .line 718
    move/from16 v22, v39

    .line 719
    .line 720
    goto :goto_1a

    .line 721
    :goto_1e
    iget-object v4, v0, Lpp;->l:[I

    .line 722
    .line 723
    const/16 v19, 0x0

    .line 724
    .line 725
    aput v9, v4, v19

    .line 726
    .line 727
    const/16 v21, 0x1

    .line 728
    .line 729
    aput v22, v4, v21

    .line 730
    .line 731
    const/4 v4, -0x1

    .line 732
    if-eqz v30, :cond_27

    .line 733
    .line 734
    if-eqz v6, :cond_26

    .line 735
    .line 736
    if-ne v6, v4, :cond_27

    .line 737
    .line 738
    :cond_26
    const/4 v6, 0x1

    .line 739
    goto :goto_1f

    .line 740
    :cond_27
    move/from16 v6, v19

    .line 741
    .line 742
    :goto_1f
    aget v7, v29, v19

    .line 743
    .line 744
    const/4 v10, 0x2

    .line 745
    if-ne v7, v10, :cond_28

    .line 746
    .line 747
    instance-of v7, v0, Lqp;

    .line 748
    .line 749
    if-eqz v7, :cond_28

    .line 750
    .line 751
    move/from16 v21, v9

    .line 752
    .line 753
    const/4 v9, 0x1

    .line 754
    :goto_20
    const/4 v7, 0x1

    .line 755
    goto :goto_21

    .line 756
    :cond_28
    move/from16 v21, v9

    .line 757
    .line 758
    const/4 v9, 0x0

    .line 759
    goto :goto_20

    .line 760
    :goto_21
    if-eqz v9, :cond_29

    .line 761
    .line 762
    const/4 v13, 0x0

    .line 763
    :cond_29
    iget-object v10, v0, Lpp;->E:Lbp;

    .line 764
    .line 765
    invoke-virtual {v10}, Lbp;->d()Z

    .line 766
    .line 767
    .line 768
    move-result v12

    .line 769
    xor-int/lit8 v26, v12, 0x1

    .line 770
    .line 771
    iget-object v12, v0, Lpp;->H:[Z

    .line 772
    .line 773
    const/16 v19, 0x0

    .line 774
    .line 775
    const/16 v31, 0x8

    .line 776
    .line 777
    aget-boolean v20, v12, v19

    .line 778
    .line 779
    aget-boolean v32, v12, v7

    .line 780
    .line 781
    iget v12, v0, Lpp;->h:I

    .line 782
    .line 783
    move-object/from16 v33, v2

    .line 784
    .line 785
    iget-object v2, v0, Lpp;->u:[I

    .line 786
    .line 787
    const/16 v34, 0x0

    .line 788
    .line 789
    const/4 v4, 0x2

    .line 790
    if-eq v12, v4, :cond_2f

    .line 791
    .line 792
    move-object/from16 v12, v33

    .line 793
    .line 794
    iget-object v12, v12, Loj1;->h:Lfx;

    .line 795
    .line 796
    iget-boolean v4, v12, Lfx;->j:Z

    .line 797
    .line 798
    if-eqz v4, :cond_2a

    .line 799
    .line 800
    iget-boolean v4, v14, Lfx;->j:Z

    .line 801
    .line 802
    if-nez v4, :cond_2b

    .line 803
    .line 804
    :cond_2a
    move/from16 v12, v31

    .line 805
    .line 806
    goto :goto_22

    .line 807
    :cond_2b
    iget v4, v12, Lfx;->g:I

    .line 808
    .line 809
    invoke-virtual {v1, v3, v4}, Lpi0;->d(Ln81;I)V

    .line 810
    .line 811
    .line 812
    iget v4, v14, Lfx;->g:I

    .line 813
    .line 814
    invoke-virtual {v1, v5, v4}, Lpi0;->d(Ln81;I)V

    .line 815
    .line 816
    .line 817
    iget-object v4, v0, Lpp;->I:Lqp;

    .line 818
    .line 819
    if-eqz v4, :cond_2c

    .line 820
    .line 821
    if-eqz v15, :cond_2c

    .line 822
    .line 823
    const/4 v6, 0x0

    .line 824
    aget-boolean v4, v24, v6

    .line 825
    .line 826
    if-eqz v4, :cond_2c

    .line 827
    .line 828
    invoke-virtual {v0}, Lpp;->o()Z

    .line 829
    .line 830
    .line 831
    move-result v4

    .line 832
    if-nez v4, :cond_2c

    .line 833
    .line 834
    iget-object v4, v0, Lpp;->I:Lqp;

    .line 835
    .line 836
    iget-object v4, v4, Lpp;->z:Lbp;

    .line 837
    .line 838
    invoke-virtual {v1, v4}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 839
    .line 840
    .line 841
    move-result-object v4

    .line 842
    move/from16 v12, v31

    .line 843
    .line 844
    invoke-virtual {v1, v4, v5, v6, v12}, Lpi0;->f(Ln81;Ln81;II)V

    .line 845
    .line 846
    .line 847
    :cond_2c
    move-object/from16 v45, v2

    .line 848
    .line 849
    move-object/from16 v48, v3

    .line 850
    .line 851
    move-object/from16 v49, v5

    .line 852
    .line 853
    move-object/from16 v46, v10

    .line 854
    .line 855
    move-object/from16 v52, v11

    .line 856
    .line 857
    move v3, v15

    .line 858
    move-object/from16 v55, v16

    .line 859
    .line 860
    move-object/from16 v50, v23

    .line 861
    .line 862
    move/from16 v19, v25

    .line 863
    .line 864
    move/from16 v4, v27

    .line 865
    .line 866
    move-object/from16 v54, v35

    .line 867
    .line 868
    move-object/from16 v51, v41

    .line 869
    .line 870
    move-object/from16 v2, v42

    .line 871
    .line 872
    move-object/from16 v27, v24

    .line 873
    .line 874
    goto/16 :goto_26

    .line 875
    .line 876
    :goto_22
    iget-object v4, v0, Lpp;->I:Lqp;

    .line 877
    .line 878
    if-eqz v4, :cond_2d

    .line 879
    .line 880
    iget-object v4, v4, Lpp;->z:Lbp;

    .line 881
    .line 882
    invoke-virtual {v1, v4}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 883
    .line 884
    .line 885
    move-result-object v4

    .line 886
    goto :goto_23

    .line 887
    :cond_2d
    move-object/from16 v4, v34

    .line 888
    .line 889
    :goto_23
    iget-object v14, v0, Lpp;->I:Lqp;

    .line 890
    .line 891
    if-eqz v14, :cond_2e

    .line 892
    .line 893
    iget-object v14, v14, Lpp;->x:Lbp;

    .line 894
    .line 895
    invoke-virtual {v1, v14}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 896
    .line 897
    .line 898
    move-result-object v14

    .line 899
    :goto_24
    move-object/from16 v31, v5

    .line 900
    .line 901
    const/16 v19, 0x0

    .line 902
    .line 903
    goto :goto_25

    .line 904
    :cond_2e
    move-object/from16 v14, v34

    .line 905
    .line 906
    goto :goto_24

    .line 907
    :goto_25
    aget-boolean v5, v24, v19

    .line 908
    .line 909
    move/from16 v33, v8

    .line 910
    .line 911
    aget v8, v29, v19

    .line 912
    .line 913
    move/from16 v36, v12

    .line 914
    .line 915
    iget v12, v0, Lpp;->N:I

    .line 916
    .line 917
    move/from16 v17, v6

    .line 918
    .line 919
    move-object v6, v14

    .line 920
    const/16 v37, 0x2

    .line 921
    .line 922
    iget v14, v0, Lpp;->Q:I

    .line 923
    .line 924
    move-object/from16 v39, v3

    .line 925
    .line 926
    move v3, v15

    .line 927
    aget v15, v2, v19

    .line 928
    .line 929
    iget v7, v0, Lpp;->S:F

    .line 930
    .line 931
    iget v1, v0, Lpp;->m:I

    .line 932
    .line 933
    move/from16 v43, v1

    .line 934
    .line 935
    iget v1, v0, Lpp;->n:I

    .line 936
    .line 937
    move/from16 v44, v1

    .line 938
    .line 939
    iget v1, v0, Lpp;->o:F

    .line 940
    .line 941
    move-object/from16 v45, v2

    .line 942
    .line 943
    const/4 v2, 0x1

    .line 944
    move-object/from16 v46, v10

    .line 945
    .line 946
    iget-object v10, v0, Lpp;->x:Lbp;

    .line 947
    .line 948
    move-object/from16 v47, v11

    .line 949
    .line 950
    iget-object v11, v0, Lpp;->z:Lbp;

    .line 951
    .line 952
    move-object/from16 v55, v16

    .line 953
    .line 954
    move-object/from16 v50, v23

    .line 955
    .line 956
    move/from16 v19, v25

    .line 957
    .line 958
    move-object/from16 v49, v31

    .line 959
    .line 960
    move-object/from16 v54, v35

    .line 961
    .line 962
    move-object/from16 v48, v39

    .line 963
    .line 964
    move-object/from16 v51, v41

    .line 965
    .line 966
    move-object/from16 v53, v42

    .line 967
    .line 968
    move/from16 v23, v43

    .line 969
    .line 970
    move-object/from16 v52, v47

    .line 971
    .line 972
    move/from16 v25, v1

    .line 973
    .line 974
    move/from16 v16, v7

    .line 975
    .line 976
    move-object/from16 v1, p1

    .line 977
    .line 978
    move-object v7, v4

    .line 979
    move/from16 v4, v27

    .line 980
    .line 981
    move-object/from16 v27, v24

    .line 982
    .line 983
    move/from16 v24, v44

    .line 984
    .line 985
    invoke-virtual/range {v0 .. v26}, Lpp;->c(Lpi0;ZZZZLn81;Ln81;IZLbp;Lbp;IIIIFZZZZIIIIFZ)V

    .line 986
    .line 987
    .line 988
    move-object/from16 v2, v53

    .line 989
    .line 990
    goto :goto_26

    .line 991
    :cond_2f
    move-object/from16 v45, v2

    .line 992
    .line 993
    move-object/from16 v48, v3

    .line 994
    .line 995
    move-object/from16 v49, v5

    .line 996
    .line 997
    move-object/from16 v46, v10

    .line 998
    .line 999
    move-object/from16 v52, v11

    .line 1000
    .line 1001
    move v3, v15

    .line 1002
    move-object/from16 v55, v16

    .line 1003
    .line 1004
    move-object/from16 v50, v23

    .line 1005
    .line 1006
    move/from16 v19, v25

    .line 1007
    .line 1008
    move/from16 v4, v27

    .line 1009
    .line 1010
    move-object/from16 v54, v35

    .line 1011
    .line 1012
    move-object/from16 v51, v41

    .line 1013
    .line 1014
    move-object/from16 v27, v24

    .line 1015
    .line 1016
    move-object/from16 v2, v42

    .line 1017
    .line 1018
    :goto_26
    iget-object v5, v2, Loj1;->h:Lfx;

    .line 1019
    .line 1020
    iget-object v6, v2, Loj1;->i:Lfx;

    .line 1021
    .line 1022
    iget-boolean v7, v5, Lfx;->j:Z

    .line 1023
    .line 1024
    if-eqz v7, :cond_32

    .line 1025
    .line 1026
    iget-boolean v7, v6, Lfx;->j:Z

    .line 1027
    .line 1028
    if-eqz v7, :cond_32

    .line 1029
    .line 1030
    iget v5, v5, Lfx;->g:I

    .line 1031
    .line 1032
    move-object/from16 v7, v50

    .line 1033
    .line 1034
    invoke-virtual {v1, v7, v5}, Lpi0;->d(Ln81;I)V

    .line 1035
    .line 1036
    .line 1037
    iget v5, v6, Lfx;->g:I

    .line 1038
    .line 1039
    move-object/from16 v6, v51

    .line 1040
    .line 1041
    invoke-virtual {v1, v6, v5}, Lpi0;->d(Ln81;I)V

    .line 1042
    .line 1043
    .line 1044
    iget-object v2, v2, Lgh1;->k:Lfx;

    .line 1045
    .line 1046
    iget v2, v2, Lfx;->g:I

    .line 1047
    .line 1048
    move-object/from16 v5, v52

    .line 1049
    .line 1050
    invoke-virtual {v1, v5, v2}, Lpi0;->d(Ln81;I)V

    .line 1051
    .line 1052
    .line 1053
    iget-object v2, v0, Lpp;->I:Lqp;

    .line 1054
    .line 1055
    if-eqz v2, :cond_31

    .line 1056
    .line 1057
    if-nez v19, :cond_31

    .line 1058
    .line 1059
    if-eqz v4, :cond_31

    .line 1060
    .line 1061
    const/4 v8, 0x1

    .line 1062
    aget-boolean v9, v27, v8

    .line 1063
    .line 1064
    if-eqz v9, :cond_30

    .line 1065
    .line 1066
    iget-object v2, v2, Lpp;->A:Lbp;

    .line 1067
    .line 1068
    invoke-virtual {v1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1069
    .line 1070
    .line 1071
    move-result-object v2

    .line 1072
    const/16 v9, 0x8

    .line 1073
    .line 1074
    const/4 v13, 0x0

    .line 1075
    invoke-virtual {v1, v2, v6, v13, v9}, Lpi0;->f(Ln81;Ln81;II)V

    .line 1076
    .line 1077
    .line 1078
    goto :goto_28

    .line 1079
    :cond_30
    :goto_27
    const/16 v9, 0x8

    .line 1080
    .line 1081
    const/4 v13, 0x0

    .line 1082
    goto :goto_28

    .line 1083
    :cond_31
    const/4 v8, 0x1

    .line 1084
    goto :goto_27

    .line 1085
    :goto_28
    move v15, v13

    .line 1086
    goto :goto_29

    .line 1087
    :cond_32
    move-object/from16 v7, v50

    .line 1088
    .line 1089
    move-object/from16 v6, v51

    .line 1090
    .line 1091
    move-object/from16 v5, v52

    .line 1092
    .line 1093
    const/4 v8, 0x1

    .line 1094
    const/16 v9, 0x8

    .line 1095
    .line 1096
    const/4 v13, 0x0

    .line 1097
    move v15, v8

    .line 1098
    :goto_29
    iget v2, v0, Lpp;->i:I

    .line 1099
    .line 1100
    const/4 v10, 0x2

    .line 1101
    if-ne v2, v10, :cond_33

    .line 1102
    .line 1103
    move v15, v13

    .line 1104
    :cond_33
    const/4 v2, 0x5

    .line 1105
    if-eqz v15, :cond_3e

    .line 1106
    .line 1107
    aget v11, v29, v8

    .line 1108
    .line 1109
    if-ne v11, v10, :cond_34

    .line 1110
    .line 1111
    instance-of v11, v0, Lqp;

    .line 1112
    .line 1113
    if-eqz v11, :cond_34

    .line 1114
    .line 1115
    move v15, v8

    .line 1116
    goto :goto_2a

    .line 1117
    :cond_34
    move v15, v13

    .line 1118
    :goto_2a
    if-eqz v15, :cond_35

    .line 1119
    .line 1120
    move/from16 v28, v13

    .line 1121
    .line 1122
    :cond_35
    if-eqz v30, :cond_37

    .line 1123
    .line 1124
    iget v11, v0, Lpp;->s:I

    .line 1125
    .line 1126
    if-eq v11, v8, :cond_36

    .line 1127
    .line 1128
    const/4 v12, -0x1

    .line 1129
    if-ne v11, v12, :cond_37

    .line 1130
    .line 1131
    :cond_36
    move/from16 v17, v8

    .line 1132
    .line 1133
    goto :goto_2b

    .line 1134
    :cond_37
    move/from16 v17, v13

    .line 1135
    .line 1136
    :goto_2b
    iget-object v11, v0, Lpp;->I:Lqp;

    .line 1137
    .line 1138
    if-eqz v11, :cond_38

    .line 1139
    .line 1140
    iget-object v11, v11, Lpp;->A:Lbp;

    .line 1141
    .line 1142
    invoke-virtual {v1, v11}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v11

    .line 1146
    goto :goto_2c

    .line 1147
    :cond_38
    move-object/from16 v11, v34

    .line 1148
    .line 1149
    :goto_2c
    iget-object v12, v0, Lpp;->I:Lqp;

    .line 1150
    .line 1151
    if-eqz v12, :cond_39

    .line 1152
    .line 1153
    iget-object v12, v12, Lpp;->y:Lbp;

    .line 1154
    .line 1155
    invoke-virtual {v1, v12}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1156
    .line 1157
    .line 1158
    move-result-object v34

    .line 1159
    :cond_39
    iget v12, v0, Lpp;->P:I

    .line 1160
    .line 1161
    if-gtz v12, :cond_3a

    .line 1162
    .line 1163
    iget v14, v0, Lpp;->V:I

    .line 1164
    .line 1165
    if-ne v14, v9, :cond_3d

    .line 1166
    .line 1167
    :cond_3a
    invoke-virtual {v1, v5, v7, v12, v9}, Lpi0;->e(Ln81;Ln81;II)V

    .line 1168
    .line 1169
    .line 1170
    move-object/from16 v12, v55

    .line 1171
    .line 1172
    iget-object v12, v12, Lbp;->d:Lbp;

    .line 1173
    .line 1174
    if-eqz v12, :cond_3c

    .line 1175
    .line 1176
    invoke-virtual {v1, v12}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v12

    .line 1180
    invoke-virtual {v1, v5, v12, v13, v9}, Lpi0;->e(Ln81;Ln81;II)V

    .line 1181
    .line 1182
    .line 1183
    if-eqz v4, :cond_3b

    .line 1184
    .line 1185
    move-object/from16 v5, v54

    .line 1186
    .line 1187
    invoke-virtual {v1, v5}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v5

    .line 1191
    invoke-virtual {v1, v11, v5, v13, v2}, Lpi0;->f(Ln81;Ln81;II)V

    .line 1192
    .line 1193
    .line 1194
    :cond_3b
    move/from16 v26, v13

    .line 1195
    .line 1196
    goto :goto_2d

    .line 1197
    :cond_3c
    iget v12, v0, Lpp;->V:I

    .line 1198
    .line 1199
    if-ne v12, v9, :cond_3d

    .line 1200
    .line 1201
    invoke-virtual {v1, v5, v7, v13, v9}, Lpi0;->e(Ln81;Ln81;II)V

    .line 1202
    .line 1203
    .line 1204
    :cond_3d
    :goto_2d
    aget-boolean v5, v27, v8

    .line 1205
    .line 1206
    aget v9, v29, v8

    .line 1207
    .line 1208
    iget v12, v0, Lpp;->O:I

    .line 1209
    .line 1210
    iget v14, v0, Lpp;->R:I

    .line 1211
    .line 1212
    aget v13, v45, v8

    .line 1213
    .line 1214
    iget v2, v0, Lpp;->T:F

    .line 1215
    .line 1216
    iget v8, v0, Lpp;->p:I

    .line 1217
    .line 1218
    iget v10, v0, Lpp;->q:I

    .line 1219
    .line 1220
    iget v1, v0, Lpp;->r:F

    .line 1221
    .line 1222
    move/from16 v16, v2

    .line 1223
    .line 1224
    const/16 v20, 0x5

    .line 1225
    .line 1226
    const/4 v2, 0x0

    .line 1227
    move/from16 v24, v10

    .line 1228
    .line 1229
    iget-object v10, v0, Lpp;->y:Lbp;

    .line 1230
    .line 1231
    move-object/from16 v50, v7

    .line 1232
    .line 1233
    move-object v7, v11

    .line 1234
    iget-object v11, v0, Lpp;->A:Lbp;

    .line 1235
    .line 1236
    move/from16 v20, v4

    .line 1237
    .line 1238
    move v4, v3

    .line 1239
    move/from16 v3, v20

    .line 1240
    .line 1241
    move/from16 v20, v19

    .line 1242
    .line 1243
    move/from16 v19, v18

    .line 1244
    .line 1245
    move/from16 v18, v20

    .line 1246
    .line 1247
    move/from16 v20, v22

    .line 1248
    .line 1249
    move/from16 v22, v21

    .line 1250
    .line 1251
    move/from16 v21, v20

    .line 1252
    .line 1253
    move/from16 v25, v1

    .line 1254
    .line 1255
    move-object/from16 v57, v6

    .line 1256
    .line 1257
    move/from16 v23, v8

    .line 1258
    .line 1259
    move v8, v9

    .line 1260
    move v9, v15

    .line 1261
    move/from16 v20, v32

    .line 1262
    .line 1263
    move-object/from16 v6, v34

    .line 1264
    .line 1265
    move-object/from16 v56, v50

    .line 1266
    .line 1267
    move-object/from16 v1, p1

    .line 1268
    .line 1269
    move v15, v13

    .line 1270
    move/from16 v13, v28

    .line 1271
    .line 1272
    invoke-virtual/range {v0 .. v26}, Lpp;->c(Lpi0;ZZZZLn81;Ln81;IZLbp;Lbp;IIIIFZZZZIIIIFZ)V

    .line 1273
    .line 1274
    .line 1275
    goto :goto_2e

    .line 1276
    :cond_3e
    move-object/from16 v57, v6

    .line 1277
    .line 1278
    move-object/from16 v56, v7

    .line 1279
    .line 1280
    :goto_2e
    if-eqz v30, :cond_40

    .line 1281
    .line 1282
    iget v2, v0, Lpp;->s:I

    .line 1283
    .line 1284
    iget v3, v0, Lpp;->t:F

    .line 1285
    .line 1286
    const/high16 v4, -0x40800000    # -1.0f

    .line 1287
    .line 1288
    const/4 v13, 0x1

    .line 1289
    if-ne v2, v13, :cond_3f

    .line 1290
    .line 1291
    invoke-virtual {v1}, Lpi0;->k()Lga;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v2

    .line 1295
    iget-object v5, v2, Lga;->d:Lfa;

    .line 1296
    .line 1297
    move-object/from16 v6, v57

    .line 1298
    .line 1299
    invoke-interface {v5, v6, v4}, Lfa;->j(Ln81;F)V

    .line 1300
    .line 1301
    .line 1302
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1303
    .line 1304
    move-object/from16 v7, v56

    .line 1305
    .line 1306
    const/high16 v5, 0x3f800000    # 1.0f

    .line 1307
    .line 1308
    invoke-interface {v4, v7, v5}, Lfa;->j(Ln81;F)V

    .line 1309
    .line 1310
    .line 1311
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1312
    .line 1313
    move-object/from16 v8, v49

    .line 1314
    .line 1315
    invoke-interface {v4, v8, v3}, Lfa;->j(Ln81;F)V

    .line 1316
    .line 1317
    .line 1318
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1319
    .line 1320
    neg-float v3, v3

    .line 1321
    move-object/from16 v9, v48

    .line 1322
    .line 1323
    invoke-interface {v4, v9, v3}, Lfa;->j(Ln81;F)V

    .line 1324
    .line 1325
    .line 1326
    invoke-virtual {v1, v2}, Lpi0;->c(Lga;)V

    .line 1327
    .line 1328
    .line 1329
    goto :goto_2f

    .line 1330
    :cond_3f
    move-object/from16 v9, v48

    .line 1331
    .line 1332
    move-object/from16 v8, v49

    .line 1333
    .line 1334
    move-object/from16 v7, v56

    .line 1335
    .line 1336
    move-object/from16 v6, v57

    .line 1337
    .line 1338
    const/high16 v5, 0x3f800000    # 1.0f

    .line 1339
    .line 1340
    invoke-virtual {v1}, Lpi0;->k()Lga;

    .line 1341
    .line 1342
    .line 1343
    move-result-object v2

    .line 1344
    iget-object v10, v2, Lga;->d:Lfa;

    .line 1345
    .line 1346
    invoke-interface {v10, v8, v4}, Lfa;->j(Ln81;F)V

    .line 1347
    .line 1348
    .line 1349
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1350
    .line 1351
    invoke-interface {v4, v9, v5}, Lfa;->j(Ln81;F)V

    .line 1352
    .line 1353
    .line 1354
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1355
    .line 1356
    invoke-interface {v4, v6, v3}, Lfa;->j(Ln81;F)V

    .line 1357
    .line 1358
    .line 1359
    iget-object v4, v2, Lga;->d:Lfa;

    .line 1360
    .line 1361
    neg-float v3, v3

    .line 1362
    invoke-interface {v4, v7, v3}, Lfa;->j(Ln81;F)V

    .line 1363
    .line 1364
    .line 1365
    invoke-virtual {v1, v2}, Lpi0;->c(Lga;)V

    .line 1366
    .line 1367
    .line 1368
    :cond_40
    :goto_2f
    invoke-virtual/range {v46 .. v46}, Lbp;->d()Z

    .line 1369
    .line 1370
    .line 1371
    move-result v2

    .line 1372
    if-eqz v2, :cond_41

    .line 1373
    .line 1374
    move-object/from16 v2, v46

    .line 1375
    .line 1376
    iget-object v3, v2, Lbp;->d:Lbp;

    .line 1377
    .line 1378
    iget-object v3, v3, Lbp;->b:Lpp;

    .line 1379
    .line 1380
    iget v4, v0, Lpp;->v:F

    .line 1381
    .line 1382
    const/high16 v5, 0x42b40000    # 90.0f

    .line 1383
    .line 1384
    add-float/2addr v4, v5

    .line 1385
    float-to-double v4, v4

    .line 1386
    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    .line 1387
    .line 1388
    .line 1389
    move-result-wide v4

    .line 1390
    double-to-float v4, v4

    .line 1391
    invoke-virtual {v2}, Lbp;->b()I

    .line 1392
    .line 1393
    .line 1394
    move-result v2

    .line 1395
    const/4 v10, 0x2

    .line 1396
    invoke-virtual {v0, v10}, Lpp;->e(I)Lbp;

    .line 1397
    .line 1398
    .line 1399
    move-result-object v5

    .line 1400
    invoke-virtual {v1, v5}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1401
    .line 1402
    .line 1403
    move-result-object v5

    .line 1404
    const/4 v8, 0x3

    .line 1405
    invoke-virtual {v0, v8}, Lpp;->e(I)Lbp;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v6

    .line 1409
    invoke-virtual {v1, v6}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1410
    .line 1411
    .line 1412
    move-result-object v6

    .line 1413
    const/4 v7, 0x4

    .line 1414
    invoke-virtual {v0, v7}, Lpp;->e(I)Lbp;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v9

    .line 1418
    invoke-virtual {v1, v9}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1419
    .line 1420
    .line 1421
    move-result-object v9

    .line 1422
    const/4 v11, 0x5

    .line 1423
    invoke-virtual {v0, v11}, Lpp;->e(I)Lbp;

    .line 1424
    .line 1425
    .line 1426
    move-result-object v0

    .line 1427
    invoke-virtual {v1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1428
    .line 1429
    .line 1430
    move-result-object v0

    .line 1431
    invoke-virtual {v3, v10}, Lpp;->e(I)Lbp;

    .line 1432
    .line 1433
    .line 1434
    move-result-object v10

    .line 1435
    invoke-virtual {v1, v10}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1436
    .line 1437
    .line 1438
    move-result-object v10

    .line 1439
    invoke-virtual {v3, v8}, Lpp;->e(I)Lbp;

    .line 1440
    .line 1441
    .line 1442
    move-result-object v8

    .line 1443
    invoke-virtual {v1, v8}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v8

    .line 1447
    invoke-virtual {v3, v7}, Lpp;->e(I)Lbp;

    .line 1448
    .line 1449
    .line 1450
    move-result-object v7

    .line 1451
    invoke-virtual {v1, v7}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1452
    .line 1453
    .line 1454
    move-result-object v7

    .line 1455
    invoke-virtual {v3, v11}, Lpp;->e(I)Lbp;

    .line 1456
    .line 1457
    .line 1458
    move-result-object v3

    .line 1459
    invoke-virtual {v1, v3}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 1460
    .line 1461
    .line 1462
    move-result-object v3

    .line 1463
    invoke-virtual {v1}, Lpi0;->k()Lga;

    .line 1464
    .line 1465
    .line 1466
    move-result-object v11

    .line 1467
    float-to-double v12, v4

    .line 1468
    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    .line 1469
    .line 1470
    .line 1471
    move-result-wide v14

    .line 1472
    move-wide/from16 v16, v12

    .line 1473
    .line 1474
    int-to-double v12, v2

    .line 1475
    mul-double/2addr v14, v12

    .line 1476
    double-to-float v2, v14

    .line 1477
    iget-object v4, v11, Lga;->d:Lfa;

    .line 1478
    .line 1479
    const/high16 v14, 0x3f000000    # 0.5f

    .line 1480
    .line 1481
    invoke-interface {v4, v8, v14}, Lfa;->j(Ln81;F)V

    .line 1482
    .line 1483
    .line 1484
    iget-object v4, v11, Lga;->d:Lfa;

    .line 1485
    .line 1486
    invoke-interface {v4, v3, v14}, Lfa;->j(Ln81;F)V

    .line 1487
    .line 1488
    .line 1489
    iget-object v3, v11, Lga;->d:Lfa;

    .line 1490
    .line 1491
    const/high16 v4, -0x41000000    # -0.5f

    .line 1492
    .line 1493
    invoke-interface {v3, v6, v4}, Lfa;->j(Ln81;F)V

    .line 1494
    .line 1495
    .line 1496
    iget-object v3, v11, Lga;->d:Lfa;

    .line 1497
    .line 1498
    invoke-interface {v3, v0, v4}, Lfa;->j(Ln81;F)V

    .line 1499
    .line 1500
    .line 1501
    neg-float v0, v2

    .line 1502
    iput v0, v11, Lga;->b:F

    .line 1503
    .line 1504
    invoke-virtual {v1, v11}, Lpi0;->c(Lga;)V

    .line 1505
    .line 1506
    .line 1507
    invoke-virtual {v1}, Lpi0;->k()Lga;

    .line 1508
    .line 1509
    .line 1510
    move-result-object v0

    .line 1511
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->cos(D)D

    .line 1512
    .line 1513
    .line 1514
    move-result-wide v2

    .line 1515
    mul-double/2addr v2, v12

    .line 1516
    double-to-float v2, v2

    .line 1517
    iget-object v3, v0, Lga;->d:Lfa;

    .line 1518
    .line 1519
    invoke-interface {v3, v10, v14}, Lfa;->j(Ln81;F)V

    .line 1520
    .line 1521
    .line 1522
    iget-object v3, v0, Lga;->d:Lfa;

    .line 1523
    .line 1524
    invoke-interface {v3, v7, v14}, Lfa;->j(Ln81;F)V

    .line 1525
    .line 1526
    .line 1527
    iget-object v3, v0, Lga;->d:Lfa;

    .line 1528
    .line 1529
    invoke-interface {v3, v5, v4}, Lfa;->j(Ln81;F)V

    .line 1530
    .line 1531
    .line 1532
    iget-object v3, v0, Lga;->d:Lfa;

    .line 1533
    .line 1534
    invoke-interface {v3, v9, v4}, Lfa;->j(Ln81;F)V

    .line 1535
    .line 1536
    .line 1537
    neg-float v2, v2

    .line 1538
    iput v2, v0, Lga;->b:F

    .line 1539
    .line 1540
    invoke-virtual {v1, v0}, Lpi0;->c(Lga;)V

    .line 1541
    .line 1542
    .line 1543
    :cond_41
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget p0, p0, Lpp;->V:I

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final c(Lpi0;ZZZZLn81;Ln81;IZLbp;Lbp;IIIIFZZZZIIIIFZ)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move/from16 v14, p14

    move/from16 v2, p15

    move/from16 v4, p23

    move/from16 v5, p24

    move/from16 v6, p25

    .line 1
    invoke-virtual {v1, v12}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v7

    .line 2
    invoke-virtual {v1, v13}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v8

    .line 3
    iget-object v9, v12, Lbp;->d:Lbp;

    .line 4
    invoke-virtual {v1, v9}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v9

    .line 5
    iget-object v15, v13, Lbp;->d:Lbp;

    .line 6
    invoke-virtual {v1, v15}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v15

    .line 7
    invoke-virtual {v12}, Lbp;->d()Z

    move-result v16

    .line 8
    invoke-virtual {v13}, Lbp;->d()Z

    move-result v17

    .line 9
    iget-object v11, v0, Lpp;->E:Lbp;

    invoke-virtual {v11}, Lbp;->d()Z

    move-result v11

    if-eqz v17, :cond_0

    add-int/lit8 v18, v16, 0x1

    goto :goto_0

    :cond_0
    move/from16 v18, v16

    :goto_0
    if-eqz v11, :cond_1

    add-int/lit8 v18, v18, 0x1

    :cond_1
    move/from16 v19, v11

    move/from16 v11, v18

    if-eqz p17, :cond_2

    const/4 v3, 0x3

    goto :goto_1

    :cond_2
    move/from16 v3, p21

    .line 10
    :goto_1
    invoke-static/range {p8 .. p8}, Loq;->t(I)I

    move-result v13

    const/4 v10, 0x1

    move-object/from16 v20, v15

    if-eqz v13, :cond_3

    if-eq v13, v10, :cond_3

    const/4 v10, 0x2

    if-eq v13, v10, :cond_4

    :cond_3
    :goto_2
    const/4 v10, 0x0

    goto :goto_3

    :cond_4
    const/4 v10, 0x4

    if-ne v3, v10, :cond_5

    goto :goto_2

    :cond_5
    const/4 v10, 0x1

    .line 11
    :goto_3
    iget v13, v0, Lpp;->V:I

    const/16 v15, 0x8

    if-ne v13, v15, :cond_6

    const/4 v10, 0x0

    const/4 v13, 0x0

    goto :goto_4

    :cond_6
    move v13, v10

    move/from16 v10, p13

    :goto_4
    if-eqz p26, :cond_9

    if-nez v16, :cond_8

    if-nez v17, :cond_8

    if-nez v19, :cond_8

    move/from16 v15, p12

    .line 12
    invoke-virtual {v1, v7, v15}, Lpi0;->d(Ln81;I)V

    :cond_7
    move/from16 p13, v13

    const/16 v13, 0x8

    goto :goto_5

    :cond_8
    if-eqz v16, :cond_7

    if-nez v17, :cond_7

    .line 13
    invoke-virtual {v12}, Lbp;->b()I

    move-result v15

    move/from16 p13, v13

    const/16 v13, 0x8

    invoke-virtual {v1, v7, v9, v15, v13}, Lpi0;->e(Ln81;Ln81;II)V

    goto :goto_5

    :cond_9
    move/from16 p13, v13

    move v13, v15

    :goto_5
    if-nez p13, :cond_d

    if-eqz p9, :cond_b

    const/4 v6, 0x3

    const/4 v15, 0x0

    .line 14
    invoke-virtual {v1, v8, v7, v15, v6}, Lpi0;->e(Ln81;Ln81;II)V

    if-lez v14, :cond_a

    .line 15
    invoke-virtual {v1, v8, v7, v14, v13}, Lpi0;->f(Ln81;Ln81;II)V

    :cond_a
    const v6, 0x7fffffff

    if-ge v2, v6, :cond_c

    .line 16
    invoke-virtual {v1, v8, v7, v2, v13}, Lpi0;->g(Ln81;Ln81;II)V

    goto :goto_6

    .line 17
    :cond_b
    invoke-virtual {v1, v8, v7, v10, v13}, Lpi0;->e(Ln81;Ln81;II)V

    :cond_c
    :goto_6
    move/from16 v10, p5

    move/from16 v15, p13

    move v13, v4

    goto/16 :goto_b

    :cond_d
    const/4 v2, 0x2

    if-eq v11, v2, :cond_10

    if-nez p17, :cond_10

    const/4 v2, 0x1

    if-eq v3, v2, :cond_e

    if-nez v3, :cond_10

    .line 18
    :cond_e
    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-lez v5, :cond_f

    .line 19
    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_f
    const/16 v13, 0x8

    .line 20
    invoke-virtual {v1, v8, v7, v2, v13}, Lpi0;->e(Ln81;Ln81;II)V

    move/from16 v10, p5

    move v13, v4

    :goto_7
    const/4 v15, 0x0

    goto/16 :goto_b

    :cond_10
    const/4 v2, -0x2

    if-ne v4, v2, :cond_11

    move v4, v10

    :cond_11
    if-ne v5, v2, :cond_12

    move v5, v10

    :cond_12
    if-lez v10, :cond_13

    const/4 v2, 0x1

    if-eq v3, v2, :cond_13

    const/4 v10, 0x0

    :cond_13
    const/16 v13, 0x8

    if-lez v4, :cond_14

    .line 21
    invoke-virtual {v1, v8, v7, v4, v13}, Lpi0;->f(Ln81;Ln81;II)V

    .line 22
    invoke-static {v10, v4}, Ljava/lang/Math;->max(II)I

    move-result v10

    :cond_14
    const/4 v2, 0x1

    if-lez v5, :cond_16

    if-eqz p3, :cond_15

    if-ne v3, v2, :cond_15

    goto :goto_8

    .line 23
    :cond_15
    invoke-virtual {v1, v8, v7, v5, v13}, Lpi0;->g(Ln81;Ln81;II)V

    .line 24
    :goto_8
    invoke-static {v10, v5}, Ljava/lang/Math;->min(II)I

    move-result v10

    :cond_16
    if-ne v3, v2, :cond_19

    if-eqz p3, :cond_17

    .line 25
    invoke-virtual {v1, v8, v7, v10, v13}, Lpi0;->e(Ln81;Ln81;II)V

    const/4 v2, 0x5

    goto :goto_6

    :cond_17
    if-eqz p18, :cond_18

    const/4 v2, 0x5

    .line 26
    invoke-virtual {v1, v8, v7, v10, v2}, Lpi0;->e(Ln81;Ln81;II)V

    .line 27
    invoke-virtual {v1, v8, v7, v10, v13}, Lpi0;->g(Ln81;Ln81;II)V

    goto :goto_6

    :cond_18
    const/4 v2, 0x5

    .line 28
    invoke-virtual {v1, v8, v7, v10, v2}, Lpi0;->e(Ln81;Ln81;II)V

    .line 29
    invoke-virtual {v1, v8, v7, v10, v13}, Lpi0;->g(Ln81;Ln81;II)V

    goto :goto_6

    :cond_19
    const/4 v2, 0x5

    const/4 v10, 0x2

    if-ne v3, v10, :cond_1c

    .line 30
    iget v13, v12, Lbp;->c:I

    const/4 v15, 0x3

    if-eq v13, v15, :cond_1a

    if-ne v13, v2, :cond_1b

    :cond_1a
    const/4 v13, 0x4

    goto :goto_9

    .line 31
    :cond_1b
    iget-object v2, v0, Lpp;->I:Lqp;

    invoke-virtual {v2, v10}, Lpp;->e(I)Lbp;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v2

    .line 32
    iget-object v10, v0, Lpp;->I:Lqp;

    const/4 v13, 0x4

    invoke-virtual {v10, v13}, Lpp;->e(I)Lbp;

    move-result-object v10

    invoke-virtual {v1, v10}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v10

    goto :goto_a

    .line 33
    :goto_9
    iget-object v2, v0, Lpp;->I:Lqp;

    const/4 v15, 0x3

    invoke-virtual {v2, v15}, Lpp;->e(I)Lbp;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v2

    .line 34
    iget-object v10, v0, Lpp;->I:Lqp;

    const/4 v15, 0x5

    invoke-virtual {v10, v15}, Lpp;->e(I)Lbp;

    move-result-object v10

    invoke-virtual {v1, v10}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    move-result-object v10

    .line 35
    :goto_a
    invoke-virtual {v1}, Lpi0;->k()Lga;

    move-result-object v15

    .line 36
    iget-object v13, v15, Lga;->d:Lfa;

    move/from16 p9, v4

    const/high16 v4, -0x40800000    # -1.0f

    invoke-interface {v13, v8, v4}, Lfa;->j(Ln81;F)V

    .line 37
    iget-object v4, v15, Lga;->d:Lfa;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-interface {v4, v7, v13}, Lfa;->j(Ln81;F)V

    .line 38
    iget-object v4, v15, Lga;->d:Lfa;

    invoke-interface {v4, v10, v6}, Lfa;->j(Ln81;F)V

    .line 39
    iget-object v4, v15, Lga;->d:Lfa;

    neg-float v6, v6

    invoke-interface {v4, v2, v6}, Lfa;->j(Ln81;F)V

    .line 40
    invoke-virtual {v1, v15}, Lpi0;->c(Lga;)V

    move/from16 v10, p5

    move/from16 v13, p9

    goto/16 :goto_7

    :cond_1c
    move/from16 p9, v4

    move/from16 v13, p9

    move/from16 v15, p13

    const/4 v10, 0x1

    :goto_b
    if-eqz p26, :cond_4c

    if-eqz p18, :cond_1d

    move-object/from16 v3, p7

    move-object v2, v7

    move-object v7, v8

    move/from16 p5, v10

    const/4 v4, 0x2

    move-object/from16 v10, p6

    goto/16 :goto_24

    :cond_1d
    if-nez v16, :cond_1e

    if-nez v17, :cond_1e

    if-nez v19, :cond_1e

    :goto_c
    move-object v7, v8

    move/from16 p5, v10

    move-object/from16 v6, v20

    goto/16 :goto_21

    :cond_1e
    if-eqz v16, :cond_1f

    if-nez v17, :cond_1f

    goto :goto_c

    :cond_1f
    if-nez v16, :cond_21

    if-eqz v17, :cond_21

    .line 41
    invoke-virtual/range {p11 .. p11}, Lbp;->b()I

    move-result v0

    neg-int v0, v0

    move-object/from16 v6, v20

    const/16 v13, 0x8

    invoke-virtual {v1, v8, v6, v0, v13}, Lpi0;->e(Ln81;Ln81;II)V

    if-eqz p3, :cond_20

    move-object/from16 v11, p6

    const/4 v0, 0x0

    const/4 v15, 0x5

    .line 42
    invoke-virtual {v1, v7, v11, v0, v15}, Lpi0;->f(Ln81;Ln81;II)V

    :cond_20
    move-object v7, v8

    move/from16 p5, v10

    goto/16 :goto_21

    :cond_21
    move-object/from16 v11, p6

    move-object/from16 v6, v20

    if-eqz v16, :cond_20

    if-eqz v17, :cond_20

    .line 43
    iget-object v2, v12, Lbp;->d:Lbp;

    iget-object v2, v2, Lbp;->b:Lpp;

    move-object/from16 v4, p11

    .line 44
    iget-object v1, v4, Lbp;->d:Lbp;

    iget-object v1, v1, Lbp;->b:Lpp;

    move/from16 p5, v10

    .line 45
    iget-object v10, v0, Lpp;->I:Lqp;

    const/16 v16, 0x6

    if-eqz v15, :cond_32

    if-nez v3, :cond_25

    if-nez v5, :cond_22

    if-nez v13, :cond_22

    const/16 v5, 0x8

    const/16 v17, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x8

    goto :goto_d

    :cond_22
    const/4 v5, 0x5

    const/16 v17, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x5

    .line 46
    :goto_d
    instance-of v4, v2, Lbg;

    if-nez v4, :cond_24

    instance-of v4, v1, Lbg;

    if-eqz v4, :cond_23

    goto :goto_e

    :cond_23
    move/from16 v24, v20

    const/4 v4, 0x0

    move/from16 v20, v19

    move/from16 v19, v5

    move/from16 v5, v17

    move/from16 v17, v3

    move/from16 v3, v16

    goto/16 :goto_18

    :cond_24
    :goto_e
    move/from16 v5, v17

    move/from16 v24, v20

    const/4 v4, 0x0

    move/from16 v17, v3

    move/from16 v3, v16

    move/from16 v20, v19

    const/16 v19, 0x4

    goto/16 :goto_18

    :cond_25
    const/4 v4, 0x1

    if-ne v3, v4, :cond_26

    move/from16 v17, v3

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x4

    const/16 v20, 0x0

    :goto_f
    const/16 v24, 0x8

    goto/16 :goto_18

    :cond_26
    const/4 v4, 0x3

    if-ne v3, v4, :cond_31

    .line 47
    iget v4, v0, Lpp;->s:I

    move/from16 v17, v3

    const/4 v3, -0x1

    if-ne v4, v3, :cond_29

    if-eqz p19, :cond_28

    if-eqz p3, :cond_27

    const/4 v3, 0x5

    :goto_10
    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x5

    const/16 v20, 0x1

    goto :goto_f

    :cond_27
    const/4 v3, 0x4

    goto :goto_10

    :cond_28
    const/16 v3, 0x8

    goto :goto_10

    :cond_29
    if-eqz p17, :cond_2c

    move/from16 v3, p22

    const/4 v4, 0x2

    if-eq v3, v4, :cond_2b

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2a

    goto :goto_11

    :cond_2a
    const/4 v3, 0x5

    const/16 v4, 0x8

    goto :goto_12

    :cond_2b
    :goto_11
    const/4 v3, 0x4

    const/4 v4, 0x5

    :goto_12
    move/from16 v19, v3

    move/from16 v24, v4

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_13
    const/16 v20, 0x1

    goto :goto_18

    :cond_2c
    if-lez v5, :cond_2d

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x5

    :goto_14
    const/16 v20, 0x1

    :goto_15
    const/16 v24, 0x5

    goto :goto_18

    :cond_2d
    if-nez v5, :cond_30

    if-nez v13, :cond_30

    if-nez p19, :cond_2e

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x8

    goto :goto_14

    :cond_2e
    if-eq v2, v10, :cond_2f

    if-eq v1, v10, :cond_2f

    const/4 v3, 0x4

    goto :goto_16

    :cond_2f
    const/4 v3, 0x5

    :goto_16
    move/from16 v24, v3

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x4

    goto :goto_13

    :cond_30
    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/16 v19, 0x4

    goto :goto_14

    :cond_31
    move/from16 v17, v3

    move/from16 v3, v16

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_17
    const/16 v19, 0x4

    const/16 v20, 0x0

    goto :goto_15

    :cond_32
    move/from16 v17, v3

    move/from16 v3, v16

    const/4 v4, 0x1

    const/4 v5, 0x1

    goto :goto_17

    :goto_18
    if-eqz v4, :cond_33

    if-ne v9, v6, :cond_33

    if-eq v2, v10, :cond_33

    const/16 v25, 0x0

    const/16 v26, 0x0

    goto :goto_19

    :cond_33
    move/from16 v25, v4

    const/16 v26, 0x1

    :goto_19
    if-eqz v5, :cond_35

    .line 48
    iget v4, v0, Lpp;->V:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_34

    const/4 v3, 0x4

    .line 49
    :cond_34
    invoke-virtual {v12}, Lbp;->b()I

    move-result v4

    move-object/from16 v23, v2

    move-object v2, v7

    move-object v7, v8

    .line 50
    invoke-virtual/range {p11 .. p11}, Lbp;->b()I

    move-result v8

    move-object/from16 p8, v9

    move v9, v3

    move-object/from16 v3, p8

    move v12, v5

    move/from16 p8, v13

    move/from16 p9, v15

    move/from16 v13, v17

    move-object/from16 v14, v23

    move/from16 v5, p16

    move-object v15, v1

    move-object/from16 v1, p1

    .line 51
    invoke-virtual/range {v1 .. v9}, Lpi0;->b(Ln81;Ln81;IFLn81;Ln81;II)V

    goto :goto_1a

    :cond_35
    move-object v14, v2

    move-object v2, v7

    move-object v7, v8

    move-object v3, v9

    move/from16 p8, v13

    move/from16 p9, v15

    move/from16 v13, v17

    const/16 v12, 0x8

    move-object v15, v1

    move-object/from16 v1, p1

    .line 52
    :goto_1a
    iget v0, v0, Lpp;->V:I

    if-ne v0, v12, :cond_36

    goto/16 :goto_28

    :cond_36
    if-eqz v25, :cond_39

    if-eqz p3, :cond_38

    if-eq v3, v6, :cond_38

    if-nez p9, :cond_38

    .line 53
    instance-of v0, v14, Lbg;

    if-nez v0, :cond_37

    instance-of v0, v15, Lbg;

    if-eqz v0, :cond_38

    :cond_37
    move/from16 v0, v16

    goto :goto_1b

    :cond_38
    move/from16 v0, v24

    .line 54
    :goto_1b
    invoke-virtual/range {p10 .. p10}, Lbp;->b()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v0}, Lpi0;->f(Ln81;Ln81;II)V

    .line 55
    invoke-virtual/range {p11 .. p11}, Lbp;->b()I

    move-result v4

    neg-int v4, v4

    invoke-virtual {v1, v7, v6, v4, v0}, Lpi0;->g(Ln81;Ln81;II)V

    move/from16 v24, v0

    :cond_39
    if-eqz p3, :cond_3a

    if-eqz p20, :cond_3a

    .line 56
    instance-of v0, v14, Lbg;

    if-nez v0, :cond_3a

    instance-of v0, v15, Lbg;

    if-nez v0, :cond_3a

    move/from16 v0, v16

    move v4, v0

    const/16 v21, 0x1

    goto :goto_1c

    :cond_3a
    move/from16 v0, v19

    move/from16 v4, v24

    move/from16 v21, v26

    :goto_1c
    if-eqz v21, :cond_46

    if-eqz v20, :cond_43

    if-eqz p19, :cond_3b

    if-eqz p4, :cond_43

    :cond_3b
    if-eq v14, v10, :cond_3d

    if-ne v15, v10, :cond_3c

    goto :goto_1d

    :cond_3c
    move/from16 v16, v0

    .line 57
    :cond_3d
    :goto_1d
    instance-of v5, v14, Lfb0;

    if-nez v5, :cond_3e

    instance-of v5, v15, Lfb0;

    if-eqz v5, :cond_3f

    :cond_3e
    const/16 v16, 0x5

    .line 58
    :cond_3f
    instance-of v5, v14, Lbg;

    if-nez v5, :cond_40

    instance-of v5, v15, Lbg;

    if-eqz v5, :cond_41

    :cond_40
    const/16 v16, 0x5

    :cond_41
    if-eqz p19, :cond_42

    const/4 v5, 0x5

    goto :goto_1e

    :cond_42
    move/from16 v5, v16

    .line 59
    :goto_1e
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_43
    if-eqz p3, :cond_45

    .line 60
    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-eqz p17, :cond_45

    if-nez p19, :cond_45

    if-eq v14, v10, :cond_44

    if-ne v15, v10, :cond_45

    :cond_44
    const/4 v10, 0x4

    goto :goto_1f

    :cond_45
    move v10, v0

    .line 61
    :goto_1f
    invoke-virtual/range {p10 .. p10}, Lbp;->b()I

    move-result v0

    invoke-virtual {v1, v2, v3, v0, v10}, Lpi0;->e(Ln81;Ln81;II)V

    .line 62
    invoke-virtual/range {p11 .. p11}, Lbp;->b()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {v1, v7, v6, v0, v10}, Lpi0;->e(Ln81;Ln81;II)V

    :cond_46
    if-eqz p3, :cond_48

    if-ne v11, v3, :cond_47

    .line 63
    invoke-virtual/range {p10 .. p10}, Lbp;->b()I

    move-result v0

    goto :goto_20

    :cond_47
    const/4 v0, 0x0

    :goto_20
    if-eq v3, v11, :cond_48

    const/4 v15, 0x5

    .line 64
    invoke-virtual {v1, v2, v11, v0, v15}, Lpi0;->f(Ln81;Ln81;II)V

    :cond_48
    if-eqz p3, :cond_4a

    if-eqz p9, :cond_4a

    if-nez p14, :cond_4a

    if-nez p8, :cond_4a

    if-eqz p9, :cond_49

    const/4 v15, 0x3

    if-ne v13, v15, :cond_49

    const/16 v13, 0x8

    const/4 v15, 0x0

    .line 65
    invoke-virtual {v1, v7, v2, v15, v13}, Lpi0;->f(Ln81;Ln81;II)V

    goto :goto_21

    :cond_49
    const/4 v15, 0x0

    const/4 v0, 0x5

    .line 66
    invoke-virtual {v1, v7, v2, v15, v0}, Lpi0;->f(Ln81;Ln81;II)V

    :cond_4a
    :goto_21
    if-eqz p3, :cond_51

    if-eqz p5, :cond_51

    move-object/from16 v13, p11

    .line 67
    iget-object v0, v13, Lbp;->d:Lbp;

    if-eqz v0, :cond_4b

    .line 68
    invoke-virtual {v13}, Lbp;->b()I

    move-result v15

    :goto_22
    move-object/from16 v3, p7

    goto :goto_23

    :cond_4b
    const/4 v15, 0x0

    goto :goto_22

    :goto_23
    if-eq v6, v3, :cond_51

    const/4 v0, 0x5

    .line 69
    invoke-virtual {v1, v3, v7, v15, v0}, Lpi0;->f(Ln81;Ln81;II)V

    return-void

    :cond_4c
    move-object/from16 v3, p7

    move-object v2, v7

    move-object v7, v8

    move/from16 p5, v10

    move-object/from16 v10, p6

    const/4 v4, 0x2

    :goto_24
    if-ge v11, v4, :cond_51

    if-eqz p3, :cond_51

    if-eqz p5, :cond_51

    const/16 v13, 0x8

    const/4 v15, 0x0

    .line 70
    invoke-virtual {v1, v2, v10, v15, v13}, Lpi0;->f(Ln81;Ln81;II)V

    .line 71
    iget-object v0, v0, Lpp;->B:Lbp;

    if-nez p2, :cond_4e

    iget-object v2, v0, Lbp;->d:Lbp;

    if-nez v2, :cond_4d

    goto :goto_25

    :cond_4d
    const/4 v15, 0x0

    goto :goto_26

    :cond_4e
    :goto_25
    const/4 v15, 0x1

    :goto_26
    if-nez p2, :cond_50

    .line 72
    iget-object v0, v0, Lbp;->d:Lbp;

    if-eqz v0, :cond_50

    .line 73
    iget-object v0, v0, Lbp;->b:Lpp;

    .line 74
    iget v2, v0, Lpp;->L:F

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_4f

    iget-object v0, v0, Lpp;->c0:[I

    const/16 v22, 0x0

    aget v2, v0, v22

    const/4 v15, 0x3

    if-ne v2, v15, :cond_4f

    const/16 v21, 0x1

    aget v0, v0, v21

    if-ne v0, v15, :cond_4f

    move/from16 v10, v21

    goto :goto_27

    :cond_4f
    const/4 v10, 0x0

    goto :goto_27

    :cond_50
    move v10, v15

    :goto_27
    if-eqz v10, :cond_51

    const/16 v13, 0x8

    const/4 v15, 0x0

    .line 75
    invoke-virtual {v1, v3, v7, v15, v13}, Lpi0;->f(Ln81;Ln81;II)V

    :cond_51
    :goto_28
    return-void
.end method

.method public final d(Lpi0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpp;->x:Lbp;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lpp;->z:Lbp;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lpp;->A:Lbp;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lpp;->P:I

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lpp;->B:Lbp;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lpi0;->j(Ljava/lang/Object;)Ln81;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public e(I)Lbp;
    .locals 1

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/lang/AssertionError;

    .line 9
    .line 10
    invoke-static {p1}, Loq;->s(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    throw p0

    .line 18
    :pswitch_0
    iget-object p0, p0, Lpp;->D:Lbp;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_1
    iget-object p0, p0, Lpp;->C:Lbp;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_2
    iget-object p0, p0, Lpp;->E:Lbp;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_3
    iget-object p0, p0, Lpp;->B:Lbp;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_4
    iget-object p0, p0, Lpp;->A:Lbp;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_5
    iget-object p0, p0, Lpp;->z:Lbp;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_6
    iget-object p0, p0, Lpp;->y:Lbp;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_7
    iget-object p0, p0, Lpp;->x:Lbp;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_8
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f(I)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object p0, p0, Lpp;->c0:[I

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    aget p0, p0, v0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const/4 v1, 0x1

    .line 10
    if-ne p1, v1, :cond_1

    .line 11
    .line 12
    aget p0, p0, v1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    return v0
.end method

.method public final g()I
    .locals 2

    .line 1
    iget v0, p0, Lpp;->V:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Lpp;->K:I

    .line 10
    .line 11
    return p0
.end method

.method public final h(I)Lpp;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lpp;->z:Lbp;

    .line 4
    .line 5
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lbp;->d:Lbp;

    .line 10
    .line 11
    if-ne v0, p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p1, Lbp;->b:Lpp;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lpp;->A:Lbp;

    .line 20
    .line 21
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lbp;->d:Lbp;

    .line 26
    .line 27
    if-ne v0, p0, :cond_1

    .line 28
    .line 29
    iget-object p0, p1, Lbp;->b:Lpp;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final i(I)Lpp;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lpp;->x:Lbp;

    .line 4
    .line 5
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lbp;->d:Lbp;

    .line 10
    .line 11
    if-ne v0, p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p1, Lbp;->b:Lpp;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lpp;->y:Lbp;

    .line 20
    .line 21
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lbp;->d:Lbp;

    .line 26
    .line 27
    if-ne v0, p0, :cond_1

    .line 28
    .line 29
    iget-object p0, p1, Lbp;->b:Lpp;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final j()I
    .locals 2

    .line 1
    iget v0, p0, Lpp;->V:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Lpp;->J:I

    .line 10
    .line 11
    return p0
.end method

.method public final k()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, v0, Lqp;->j0:I

    .line 6
    .line 7
    iget p0, p0, Lpp;->N:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    iget p0, p0, Lpp;->N:I

    .line 12
    .line 13
    return p0
.end method

.method public final l()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpp;->I:Lqp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, v0, Lqp;->k0:I

    .line 6
    .line 7
    iget p0, p0, Lpp;->O:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    iget p0, p0, Lpp;->O:I

    .line 12
    .line 13
    return p0
.end method

.method public final m(IIIILpp;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lpp;->e(I)Lbp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p5, p2}, Lpp;->e(I)Lbp;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p3, p4}, Lbp;->a(Lbp;II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final n(I)Z
    .locals 2

    .line 1
    mul-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iget-object p0, p0, Lpp;->F:[Lbp;

    .line 4
    .line 5
    aget-object v0, p0, p1

    .line 6
    .line 7
    iget-object v1, v0, Lbp;->d:Lbp;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Lbp;->d:Lbp;

    .line 12
    .line 13
    if-eq v1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    add-int/2addr p1, v0

    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    iget-object p1, p0, Lbp;->d:Lbp;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lbp;->d:Lbp;

    .line 24
    .line 25
    if-ne p1, p0, :cond_0

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final o()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lpp;->x:Lbp;

    .line 2
    .line 3
    iget-object v1, v0, Lbp;->d:Lbp;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v1, Lbp;->d:Lbp;

    .line 8
    .line 9
    if-eq v1, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lpp;->z:Lbp;

    .line 12
    .line 13
    iget-object v0, p0, Lbp;->d:Lbp;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Lbp;->d:Lbp;

    .line 18
    .line 19
    if-ne v0, p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final p()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 2
    .line 3
    iget-object v1, v0, Lbp;->d:Lbp;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v1, Lbp;->d:Lbp;

    .line 8
    .line 9
    if-eq v1, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lpp;->A:Lbp;

    .line 12
    .line 13
    iget-object v0, p0, Lbp;->d:Lbp;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Lbp;->d:Lbp;

    .line 18
    .line 19
    if-ne v0, p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public q()V
    .locals 5

    .line 1
    iget-object v0, p0, Lpp;->x:Lbp;

    .line 2
    .line 3
    invoke-virtual {v0}, Lbp;->e()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 7
    .line 8
    invoke-virtual {v0}, Lbp;->e()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lpp;->z:Lbp;

    .line 12
    .line 13
    invoke-virtual {v0}, Lbp;->e()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lpp;->A:Lbp;

    .line 17
    .line 18
    invoke-virtual {v0}, Lbp;->e()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lpp;->B:Lbp;

    .line 22
    .line 23
    invoke-virtual {v0}, Lbp;->e()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lpp;->C:Lbp;

    .line 27
    .line 28
    invoke-virtual {v0}, Lbp;->e()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lpp;->D:Lbp;

    .line 32
    .line 33
    invoke-virtual {v0}, Lbp;->e()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lpp;->E:Lbp;

    .line 37
    .line 38
    invoke-virtual {v0}, Lbp;->e()V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lpp;->I:Lqp;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput v1, p0, Lpp;->v:F

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    iput v2, p0, Lpp;->J:I

    .line 49
    .line 50
    iput v2, p0, Lpp;->K:I

    .line 51
    .line 52
    iput v1, p0, Lpp;->L:F

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    iput v1, p0, Lpp;->M:I

    .line 56
    .line 57
    iput v2, p0, Lpp;->N:I

    .line 58
    .line 59
    iput v2, p0, Lpp;->O:I

    .line 60
    .line 61
    iput v2, p0, Lpp;->P:I

    .line 62
    .line 63
    iput v2, p0, Lpp;->Q:I

    .line 64
    .line 65
    iput v2, p0, Lpp;->R:I

    .line 66
    .line 67
    const/high16 v3, 0x3f000000    # 0.5f

    .line 68
    .line 69
    iput v3, p0, Lpp;->S:F

    .line 70
    .line 71
    iput v3, p0, Lpp;->T:F

    .line 72
    .line 73
    iget-object v3, p0, Lpp;->c0:[I

    .line 74
    .line 75
    const/4 v4, 0x1

    .line 76
    aput v4, v3, v2

    .line 77
    .line 78
    aput v4, v3, v4

    .line 79
    .line 80
    iput-object v0, p0, Lpp;->U:Landroid/view/View;

    .line 81
    .line 82
    iput v2, p0, Lpp;->V:I

    .line 83
    .line 84
    iput v2, p0, Lpp;->X:I

    .line 85
    .line 86
    iput v2, p0, Lpp;->Y:I

    .line 87
    .line 88
    iget-object v0, p0, Lpp;->Z:[F

    .line 89
    .line 90
    const/high16 v3, -0x40800000    # -1.0f

    .line 91
    .line 92
    aput v3, v0, v2

    .line 93
    .line 94
    aput v3, v0, v4

    .line 95
    .line 96
    iput v1, p0, Lpp;->h:I

    .line 97
    .line 98
    iput v1, p0, Lpp;->i:I

    .line 99
    .line 100
    iget-object v0, p0, Lpp;->u:[I

    .line 101
    .line 102
    const v3, 0x7fffffff

    .line 103
    .line 104
    .line 105
    aput v3, v0, v2

    .line 106
    .line 107
    aput v3, v0, v4

    .line 108
    .line 109
    iput v2, p0, Lpp;->j:I

    .line 110
    .line 111
    iput v2, p0, Lpp;->k:I

    .line 112
    .line 113
    const/high16 v0, 0x3f800000    # 1.0f

    .line 114
    .line 115
    iput v0, p0, Lpp;->o:F

    .line 116
    .line 117
    iput v0, p0, Lpp;->r:F

    .line 118
    .line 119
    iput v3, p0, Lpp;->n:I

    .line 120
    .line 121
    iput v3, p0, Lpp;->q:I

    .line 122
    .line 123
    iput v2, p0, Lpp;->m:I

    .line 124
    .line 125
    iput v2, p0, Lpp;->p:I

    .line 126
    .line 127
    iput v1, p0, Lpp;->s:I

    .line 128
    .line 129
    iput v0, p0, Lpp;->t:F

    .line 130
    .line 131
    iget-object v0, p0, Lpp;->f:[Z

    .line 132
    .line 133
    aput-boolean v4, v0, v2

    .line 134
    .line 135
    aput-boolean v4, v0, v4

    .line 136
    .line 137
    iget-object p0, p0, Lpp;->H:[Z

    .line 138
    .line 139
    aput-boolean v2, p0, v2

    .line 140
    .line 141
    aput-boolean v2, p0, v4

    .line 142
    .line 143
    return-void
.end method

.method public r(Ler0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lpp;->x:Lbp;

    .line 2
    .line 3
    invoke-virtual {p1}, Lbp;->f()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lpp;->y:Lbp;

    .line 7
    .line 8
    invoke-virtual {p1}, Lbp;->f()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lpp;->z:Lbp;

    .line 12
    .line 13
    invoke-virtual {p1}, Lbp;->f()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lpp;->A:Lbp;

    .line 17
    .line 18
    invoke-virtual {p1}, Lbp;->f()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lpp;->B:Lbp;

    .line 22
    .line 23
    invoke-virtual {p1}, Lbp;->f()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lpp;->E:Lbp;

    .line 27
    .line 28
    invoke-virtual {p1}, Lbp;->f()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lpp;->C:Lbp;

    .line 32
    .line 33
    invoke-virtual {p1}, Lbp;->f()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lpp;->D:Lbp;

    .line 37
    .line 38
    invoke-virtual {p0}, Lbp;->f()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final s(I)V
    .locals 1

    .line 1
    iput p1, p0, Lpp;->K:I

    .line 2
    .line 3
    iget v0, p0, Lpp;->R:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iput v0, p0, Lpp;->K:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final t(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lpp;->c0:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lpp;->W:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "id: "

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lpp;->W:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, " "

    .line 22
    .line 23
    invoke-static {v1, v2, v3}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "("

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v1, p0, Lpp;->N:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, ", "

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v1, p0, Lpp;->O:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, ") - ("

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget v1, p0, Lpp;->J:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, " x "

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget p0, p0, Lpp;->K:I

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p0, ")"

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public final u(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lpp;->c0:[I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public final v(I)V
    .locals 1

    .line 1
    iput p1, p0, Lpp;->J:I

    .line 2
    .line 3
    iget v0, p0, Lpp;->Q:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iput v0, p0, Lpp;->J:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public w(ZZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Lpp;->d:Lbc0;

    .line 2
    .line 3
    iget-boolean v1, v0, Loj1;->g:Z

    .line 4
    .line 5
    and-int/2addr p1, v1

    .line 6
    iget-object v1, p0, Lpp;->e:Lgh1;

    .line 7
    .line 8
    iget-boolean v2, v1, Loj1;->g:Z

    .line 9
    .line 10
    and-int/2addr p2, v2

    .line 11
    iget-object v2, v0, Loj1;->h:Lfx;

    .line 12
    .line 13
    iget v2, v2, Lfx;->g:I

    .line 14
    .line 15
    iget-object v3, v1, Loj1;->h:Lfx;

    .line 16
    .line 17
    iget v3, v3, Lfx;->g:I

    .line 18
    .line 19
    iget-object v0, v0, Loj1;->i:Lfx;

    .line 20
    .line 21
    iget v0, v0, Lfx;->g:I

    .line 22
    .line 23
    iget-object v1, v1, Loj1;->i:Lfx;

    .line 24
    .line 25
    iget v1, v1, Lfx;->g:I

    .line 26
    .line 27
    sub-int v4, v0, v2

    .line 28
    .line 29
    sub-int v5, v1, v3

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    if-ltz v4, :cond_0

    .line 33
    .line 34
    if-ltz v5, :cond_0

    .line 35
    .line 36
    const/high16 v4, -0x80000000

    .line 37
    .line 38
    if-eq v2, v4, :cond_0

    .line 39
    .line 40
    const v5, 0x7fffffff

    .line 41
    .line 42
    .line 43
    if-eq v2, v5, :cond_0

    .line 44
    .line 45
    if-eq v3, v4, :cond_0

    .line 46
    .line 47
    if-eq v3, v5, :cond_0

    .line 48
    .line 49
    if-eq v0, v4, :cond_0

    .line 50
    .line 51
    if-eq v0, v5, :cond_0

    .line 52
    .line 53
    if-eq v1, v4, :cond_0

    .line 54
    .line 55
    if-ne v1, v5, :cond_1

    .line 56
    .line 57
    :cond_0
    move v0, v6

    .line 58
    move v1, v0

    .line 59
    move v2, v1

    .line 60
    move v3, v2

    .line 61
    :cond_1
    sub-int/2addr v0, v2

    .line 62
    sub-int/2addr v1, v3

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    iput v2, p0, Lpp;->N:I

    .line 66
    .line 67
    :cond_2
    if-eqz p2, :cond_3

    .line 68
    .line 69
    iput v3, p0, Lpp;->O:I

    .line 70
    .line 71
    :cond_3
    iget v2, p0, Lpp;->V:I

    .line 72
    .line 73
    const/16 v3, 0x8

    .line 74
    .line 75
    if-ne v2, v3, :cond_4

    .line 76
    .line 77
    iput v6, p0, Lpp;->J:I

    .line 78
    .line 79
    iput v6, p0, Lpp;->K:I

    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    const/4 v2, 0x1

    .line 83
    iget-object v3, p0, Lpp;->c0:[I

    .line 84
    .line 85
    if-eqz p1, :cond_6

    .line 86
    .line 87
    aget p1, v3, v6

    .line 88
    .line 89
    if-ne p1, v2, :cond_5

    .line 90
    .line 91
    iget p1, p0, Lpp;->J:I

    .line 92
    .line 93
    if-ge v0, p1, :cond_5

    .line 94
    .line 95
    move v0, p1

    .line 96
    :cond_5
    iput v0, p0, Lpp;->J:I

    .line 97
    .line 98
    iget p1, p0, Lpp;->Q:I

    .line 99
    .line 100
    if-ge v0, p1, :cond_6

    .line 101
    .line 102
    iput p1, p0, Lpp;->J:I

    .line 103
    .line 104
    :cond_6
    if-eqz p2, :cond_8

    .line 105
    .line 106
    aget p1, v3, v2

    .line 107
    .line 108
    if-ne p1, v2, :cond_7

    .line 109
    .line 110
    iget p1, p0, Lpp;->K:I

    .line 111
    .line 112
    if-ge v1, p1, :cond_7

    .line 113
    .line 114
    move v1, p1

    .line 115
    :cond_7
    iput v1, p0, Lpp;->K:I

    .line 116
    .line 117
    iget p1, p0, Lpp;->R:I

    .line 118
    .line 119
    if-ge v1, p1, :cond_8

    .line 120
    .line 121
    iput p1, p0, Lpp;->K:I

    .line 122
    .line 123
    :cond_8
    return-void
.end method

.method public x(Lpi0;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lpp;->x:Lbp;

    .line 5
    .line 6
    invoke-static {p1}, Lpi0;->m(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Lpp;->y:Lbp;

    .line 11
    .line 12
    invoke-static {v0}, Lpi0;->m(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lpp;->z:Lbp;

    .line 17
    .line 18
    invoke-static {v1}, Lpi0;->m(Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lpp;->A:Lbp;

    .line 23
    .line 24
    invoke-static {v2}, Lpi0;->m(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p0, Lpp;->d:Lbc0;

    .line 29
    .line 30
    iget-object v4, v3, Loj1;->h:Lfx;

    .line 31
    .line 32
    iget-boolean v5, v4, Lfx;->j:Z

    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    iget-object v3, v3, Loj1;->i:Lfx;

    .line 37
    .line 38
    iget-boolean v5, v3, Lfx;->j:Z

    .line 39
    .line 40
    if-eqz v5, :cond_0

    .line 41
    .line 42
    iget p1, v4, Lfx;->g:I

    .line 43
    .line 44
    iget v1, v3, Lfx;->g:I

    .line 45
    .line 46
    :cond_0
    iget-object v3, p0, Lpp;->e:Lgh1;

    .line 47
    .line 48
    iget-object v4, v3, Loj1;->h:Lfx;

    .line 49
    .line 50
    iget-boolean v5, v4, Lfx;->j:Z

    .line 51
    .line 52
    if-eqz v5, :cond_1

    .line 53
    .line 54
    iget-object v3, v3, Loj1;->i:Lfx;

    .line 55
    .line 56
    iget-boolean v5, v3, Lfx;->j:Z

    .line 57
    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    iget v0, v4, Lfx;->g:I

    .line 61
    .line 62
    iget v2, v3, Lfx;->g:I

    .line 63
    .line 64
    :cond_1
    sub-int v3, v1, p1

    .line 65
    .line 66
    sub-int v4, v2, v0

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    if-ltz v3, :cond_2

    .line 70
    .line 71
    if-ltz v4, :cond_2

    .line 72
    .line 73
    const/high16 v3, -0x80000000

    .line 74
    .line 75
    if-eq p1, v3, :cond_2

    .line 76
    .line 77
    const v4, 0x7fffffff

    .line 78
    .line 79
    .line 80
    if-eq p1, v4, :cond_2

    .line 81
    .line 82
    if-eq v0, v3, :cond_2

    .line 83
    .line 84
    if-eq v0, v4, :cond_2

    .line 85
    .line 86
    if-eq v1, v3, :cond_2

    .line 87
    .line 88
    if-eq v1, v4, :cond_2

    .line 89
    .line 90
    if-eq v2, v3, :cond_2

    .line 91
    .line 92
    if-ne v2, v4, :cond_3

    .line 93
    .line 94
    :cond_2
    move p1, v5

    .line 95
    move v0, p1

    .line 96
    move v1, v0

    .line 97
    move v2, v1

    .line 98
    :cond_3
    sub-int/2addr v1, p1

    .line 99
    sub-int/2addr v2, v0

    .line 100
    iput p1, p0, Lpp;->N:I

    .line 101
    .line 102
    iput v0, p0, Lpp;->O:I

    .line 103
    .line 104
    iget p1, p0, Lpp;->V:I

    .line 105
    .line 106
    const/16 v0, 0x8

    .line 107
    .line 108
    if-ne p1, v0, :cond_4

    .line 109
    .line 110
    iput v5, p0, Lpp;->J:I

    .line 111
    .line 112
    iput v5, p0, Lpp;->K:I

    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    iget-object p1, p0, Lpp;->c0:[I

    .line 116
    .line 117
    aget v0, p1, v5

    .line 118
    .line 119
    const/4 v3, 0x1

    .line 120
    if-ne v0, v3, :cond_5

    .line 121
    .line 122
    iget v0, p0, Lpp;->J:I

    .line 123
    .line 124
    if-ge v1, v0, :cond_5

    .line 125
    .line 126
    move v1, v0

    .line 127
    :cond_5
    aget p1, p1, v3

    .line 128
    .line 129
    if-ne p1, v3, :cond_6

    .line 130
    .line 131
    iget p1, p0, Lpp;->K:I

    .line 132
    .line 133
    if-ge v2, p1, :cond_6

    .line 134
    .line 135
    move v2, p1

    .line 136
    :cond_6
    iput v1, p0, Lpp;->J:I

    .line 137
    .line 138
    iput v2, p0, Lpp;->K:I

    .line 139
    .line 140
    iget p1, p0, Lpp;->R:I

    .line 141
    .line 142
    if-ge v2, p1, :cond_7

    .line 143
    .line 144
    iput p1, p0, Lpp;->K:I

    .line 145
    .line 146
    :cond_7
    iget p1, p0, Lpp;->Q:I

    .line 147
    .line 148
    if-ge v1, p1, :cond_8

    .line 149
    .line 150
    iput p1, p0, Lpp;->J:I

    .line 151
    .line 152
    :cond_8
    return-void
.end method
