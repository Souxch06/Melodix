.class public Landroidx/recyclerview/widget/GridLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public D:Z

.field public final E:I

.field public F:[I

.field public G:[Landroid/view/View;

.field public final H:Landroid/util/SparseIntArray;

.field public final I:Landroid/util/SparseIntArray;

.field public final J:Ls7;

.field public final K:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->D:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 9
    .line 10
    new-instance v0, Landroid/util/SparseIntArray;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->H:Landroid/util/SparseIntArray;

    .line 16
    .line 17
    new-instance v0, Landroid/util/SparseIntArray;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->I:Landroid/util/SparseIntArray;

    .line 23
    .line 24
    new-instance v0, Ls7;

    .line 25
    .line 26
    invoke-direct {v0}, Ls7;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->K:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-static {p1, p2, p3, p4}, Lpy0;->E(Landroid/content/Context;Landroid/util/AttributeSet;II)Loy0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget p1, p1, Loy0;->b:I

    .line 43
    .line 44
    iget p2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 45
    .line 46
    if-ne p1, p2, :cond_0

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 p2, 0x1

    .line 50
    iput-boolean p2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->D:Z

    .line 51
    .line 52
    if-lt p1, p2, :cond_1

    .line 53
    .line 54
    iput p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 55
    .line 56
    invoke-virtual {v0}, Ls7;->y()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    const-string p0, "Span count should be at least 1. Provided "

    .line 64
    .line 65
    invoke-static {p1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    throw p0
.end method


# virtual methods
.method public final D0(Lvy0;Lzy0;III)Landroid/view/View;
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->x0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 5
    .line 6
    invoke-virtual {v0}, Lvz;->k()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 11
    .line 12
    invoke-virtual {v1}, Lvz;->g()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-le p4, p3, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v2, -0x1

    .line 21
    :goto_0
    const/4 v3, 0x0

    .line 22
    move-object v4, v3

    .line 23
    :goto_1
    if-eq p3, p4, :cond_6

    .line 24
    .line 25
    invoke-virtual {p0, p3}, Lpy0;->t(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-static {v5}, Lpy0;->D(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-ltz v6, :cond_5

    .line 34
    .line 35
    if-ge v6, p5, :cond_5

    .line 36
    .line 37
    invoke-virtual {p0, v6, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->Y0(ILvy0;Lzy0;)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-eqz v6, :cond_1

    .line 42
    .line 43
    goto :goto_3

    .line 44
    :cond_1
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    check-cast v6, Lqy0;

    .line 49
    .line 50
    iget-object v6, v6, Lqy0;->a:Lmu0;

    .line 51
    .line 52
    invoke-virtual {v6}, Lmu0;->i()Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_2

    .line 57
    .line 58
    if-nez v4, :cond_5

    .line 59
    .line 60
    move-object v4, v5

    .line 61
    goto :goto_3

    .line 62
    :cond_2
    iget-object v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 63
    .line 64
    invoke-virtual {v6, v5}, Lvz;->e(Landroid/view/View;)I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-ge v6, v1, :cond_4

    .line 69
    .line 70
    iget-object v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 71
    .line 72
    invoke-virtual {v6, v5}, Lvz;->b(Landroid/view/View;)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-ge v6, v0, :cond_3

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_3
    return-object v5

    .line 80
    :cond_4
    :goto_2
    if-nez v3, :cond_5

    .line 81
    .line 82
    move-object v3, v5

    .line 83
    :cond_5
    :goto_3
    add-int/2addr p3, v2

    .line 84
    goto :goto_1

    .line 85
    :cond_6
    if-eqz v3, :cond_7

    .line 86
    .line 87
    return-object v3

    .line 88
    :cond_7
    return-object v4
.end method

.method public final F(Lvy0;Lzy0;)I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p2}, Lzy0;->b()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    invoke-virtual {p2}, Lzy0;->b()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr v0, v1

    .line 22
    invoke-virtual {p0, v0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->X0(ILvy0;Lzy0;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr p0, v1

    .line 27
    return p0
.end method

.method public final J0(Lvy0;Lzy0;Lmi0;Lli0;)V
    .locals 19

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
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    iget-object v5, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 12
    .line 13
    invoke-virtual {v5}, Lvz;->j()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const/4 v6, 0x1

    .line 18
    const/high16 v8, 0x40000000    # 2.0f

    .line 19
    .line 20
    if-eq v5, v8, :cond_0

    .line 21
    .line 22
    move v9, v6

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v9, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0}, Lpy0;->u()I

    .line 26
    .line 27
    .line 28
    move-result v10

    .line 29
    iget v11, v0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 30
    .line 31
    if-lez v10, :cond_1

    .line 32
    .line 33
    iget-object v10, v0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 34
    .line 35
    aget v10, v10, v11

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const/4 v10, 0x0

    .line 39
    :goto_1
    if-eqz v9, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->b1()V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget v12, v3, Lmi0;->e:I

    .line 45
    .line 46
    if-ne v12, v6, :cond_3

    .line 47
    .line 48
    move v12, v6

    .line 49
    goto :goto_2

    .line 50
    :cond_3
    const/4 v12, 0x0

    .line 51
    :goto_2
    if-nez v12, :cond_4

    .line 52
    .line 53
    iget v13, v3, Lmi0;->d:I

    .line 54
    .line 55
    invoke-virtual {v0, v13, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->Y0(ILvy0;Lzy0;)I

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    iget v14, v3, Lmi0;->d:I

    .line 60
    .line 61
    invoke-virtual {v0, v14, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->Z0(ILvy0;Lzy0;)I

    .line 62
    .line 63
    .line 64
    move-result v14

    .line 65
    add-int/2addr v14, v13

    .line 66
    :goto_3
    const/4 v13, 0x0

    .line 67
    goto :goto_4

    .line 68
    :cond_4
    move v14, v11

    .line 69
    goto :goto_3

    .line 70
    :goto_4
    if-ge v13, v11, :cond_8

    .line 71
    .line 72
    iget v15, v3, Lmi0;->d:I

    .line 73
    .line 74
    if-ltz v15, :cond_8

    .line 75
    .line 76
    invoke-virtual {v2}, Lzy0;->b()I

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    if-ge v15, v8, :cond_8

    .line 81
    .line 82
    if-lez v14, :cond_8

    .line 83
    .line 84
    iget v8, v3, Lmi0;->d:I

    .line 85
    .line 86
    invoke-virtual {v0, v8, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->Z0(ILvy0;Lzy0;)I

    .line 87
    .line 88
    .line 89
    move-result v15

    .line 90
    if-gt v15, v11, :cond_7

    .line 91
    .line 92
    sub-int/2addr v14, v15

    .line 93
    if-gez v14, :cond_5

    .line 94
    .line 95
    goto :goto_5

    .line 96
    :cond_5
    invoke-virtual {v3, v1}, Lmi0;->b(Lvy0;)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    if-nez v8, :cond_6

    .line 101
    .line 102
    goto :goto_5

    .line 103
    :cond_6
    iget-object v15, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 104
    .line 105
    aput-object v8, v15, v13

    .line 106
    .line 107
    add-int/lit8 v13, v13, 0x1

    .line 108
    .line 109
    const/high16 v8, 0x40000000    # 2.0f

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 113
    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v2, "Item at position "

    .line 117
    .line 118
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v2, " requires "

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v2, " spans but GridLayoutManager has only "

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v2, " spans."

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    throw v0

    .line 153
    :cond_8
    :goto_5
    if-nez v13, :cond_9

    .line 154
    .line 155
    iput-boolean v6, v4, Lli0;->b:Z

    .line 156
    .line 157
    return-void

    .line 158
    :cond_9
    if-eqz v12, :cond_a

    .line 159
    .line 160
    move/from16 v16, v6

    .line 161
    .line 162
    move v15, v13

    .line 163
    const/4 v14, 0x0

    .line 164
    goto :goto_6

    .line 165
    :cond_a
    add-int/lit8 v14, v13, -0x1

    .line 166
    .line 167
    const/4 v15, -0x1

    .line 168
    const/16 v16, -0x1

    .line 169
    .line 170
    :goto_6
    const/4 v6, 0x0

    .line 171
    :goto_7
    if-eq v14, v15, :cond_b

    .line 172
    .line 173
    iget-object v7, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 174
    .line 175
    aget-object v7, v7, v14

    .line 176
    .line 177
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 178
    .line 179
    .line 180
    move-result-object v17

    .line 181
    move-object/from16 v8, v17

    .line 182
    .line 183
    check-cast v8, Ldb0;

    .line 184
    .line 185
    invoke-static {v7}, Lpy0;->D(Landroid/view/View;)I

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    invoke-virtual {v0, v7, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->Z0(ILvy0;Lzy0;)I

    .line 190
    .line 191
    .line 192
    move-result v7

    .line 193
    iput v7, v8, Ldb0;->f:I

    .line 194
    .line 195
    iput v6, v8, Ldb0;->e:I

    .line 196
    .line 197
    add-int/2addr v6, v7

    .line 198
    add-int v14, v14, v16

    .line 199
    .line 200
    goto :goto_7

    .line 201
    :cond_b
    const/4 v1, 0x0

    .line 202
    const/4 v2, 0x0

    .line 203
    const/4 v6, 0x0

    .line 204
    :goto_8
    if-ge v2, v13, :cond_12

    .line 205
    .line 206
    iget-object v7, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 207
    .line 208
    aget-object v7, v7, v2

    .line 209
    .line 210
    iget-object v8, v3, Lmi0;->k:Ljava/util/List;

    .line 211
    .line 212
    if-nez v8, :cond_d

    .line 213
    .line 214
    if-eqz v12, :cond_c

    .line 215
    .line 216
    const/4 v8, -0x1

    .line 217
    const/4 v14, 0x0

    .line 218
    invoke-virtual {v0, v7, v8, v14}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 219
    .line 220
    .line 221
    goto :goto_9

    .line 222
    :cond_c
    const/4 v8, -0x1

    .line 223
    const/4 v14, 0x0

    .line 224
    invoke-virtual {v0, v7, v14, v14}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 225
    .line 226
    .line 227
    goto :goto_9

    .line 228
    :cond_d
    const/4 v8, -0x1

    .line 229
    const/4 v14, 0x0

    .line 230
    if-eqz v12, :cond_e

    .line 231
    .line 232
    const/4 v15, 0x1

    .line 233
    invoke-virtual {v0, v7, v8, v15}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 234
    .line 235
    .line 236
    goto :goto_9

    .line 237
    :cond_e
    const/4 v15, 0x1

    .line 238
    invoke-virtual {v0, v7, v14, v15}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 239
    .line 240
    .line 241
    :goto_9
    iget-object v8, v0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 242
    .line 243
    iget-object v15, v0, Landroidx/recyclerview/widget/GridLayoutManager;->K:Landroid/graphics/Rect;

    .line 244
    .line 245
    if-nez v8, :cond_f

    .line 246
    .line 247
    invoke-virtual {v15, v14, v14, v14, v14}, Landroid/graphics/Rect;->set(IIII)V

    .line 248
    .line 249
    .line 250
    goto :goto_a

    .line 251
    :cond_f
    invoke-virtual {v8, v7}, Landroidx/recyclerview/widget/RecyclerView;->H(Landroid/view/View;)Landroid/graphics/Rect;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    invoke-virtual {v15, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 256
    .line 257
    .line 258
    :goto_a
    invoke-virtual {v0, v7, v5, v14}, Landroidx/recyclerview/widget/GridLayoutManager;->a1(Landroid/view/View;IZ)V

    .line 259
    .line 260
    .line 261
    iget-object v8, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 262
    .line 263
    invoke-virtual {v8, v7}, Lvz;->c(Landroid/view/View;)I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    if-le v8, v6, :cond_10

    .line 268
    .line 269
    move v6, v8

    .line 270
    :cond_10
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 271
    .line 272
    .line 273
    move-result-object v8

    .line 274
    check-cast v8, Ldb0;

    .line 275
    .line 276
    iget-object v14, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 277
    .line 278
    invoke-virtual {v14, v7}, Lvz;->d(Landroid/view/View;)I

    .line 279
    .line 280
    .line 281
    move-result v7

    .line 282
    int-to-float v7, v7

    .line 283
    const/high16 v14, 0x3f800000    # 1.0f

    .line 284
    .line 285
    mul-float/2addr v7, v14

    .line 286
    iget v8, v8, Ldb0;->f:I

    .line 287
    .line 288
    int-to-float v8, v8

    .line 289
    div-float/2addr v7, v8

    .line 290
    cmpl-float v8, v7, v1

    .line 291
    .line 292
    if-lez v8, :cond_11

    .line 293
    .line 294
    move v1, v7

    .line 295
    :cond_11
    add-int/lit8 v2, v2, 0x1

    .line 296
    .line 297
    goto :goto_8

    .line 298
    :cond_12
    if-eqz v9, :cond_14

    .line 299
    .line 300
    int-to-float v2, v11

    .line 301
    mul-float/2addr v1, v2

    .line 302
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    invoke-static {v1, v10}, Ljava/lang/Math;->max(II)I

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->U0(I)V

    .line 311
    .line 312
    .line 313
    const/4 v6, 0x0

    .line 314
    const/4 v14, 0x0

    .line 315
    :goto_b
    if-ge v14, v13, :cond_14

    .line 316
    .line 317
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 318
    .line 319
    aget-object v1, v1, v14

    .line 320
    .line 321
    const/high16 v2, 0x40000000    # 2.0f

    .line 322
    .line 323
    const/4 v15, 0x1

    .line 324
    invoke-virtual {v0, v1, v2, v15}, Landroidx/recyclerview/widget/GridLayoutManager;->a1(Landroid/view/View;IZ)V

    .line 325
    .line 326
    .line 327
    iget-object v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 328
    .line 329
    invoke-virtual {v2, v1}, Lvz;->c(Landroid/view/View;)I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    if-le v1, v6, :cond_13

    .line 334
    .line 335
    move v6, v1

    .line 336
    :cond_13
    add-int/lit8 v14, v14, 0x1

    .line 337
    .line 338
    goto :goto_b

    .line 339
    :cond_14
    const/4 v14, 0x0

    .line 340
    :goto_c
    if-ge v14, v13, :cond_18

    .line 341
    .line 342
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 343
    .line 344
    aget-object v1, v1, v14

    .line 345
    .line 346
    iget-object v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 347
    .line 348
    invoke-virtual {v2, v1}, Lvz;->c(Landroid/view/View;)I

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    if-eq v2, v6, :cond_16

    .line 353
    .line 354
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    check-cast v2, Ldb0;

    .line 359
    .line 360
    iget-object v5, v2, Lqy0;->b:Landroid/graphics/Rect;

    .line 361
    .line 362
    iget v7, v5, Landroid/graphics/Rect;->top:I

    .line 363
    .line 364
    iget v8, v5, Landroid/graphics/Rect;->bottom:I

    .line 365
    .line 366
    add-int/2addr v7, v8

    .line 367
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 368
    .line 369
    add-int/2addr v7, v8

    .line 370
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 371
    .line 372
    add-int/2addr v7, v8

    .line 373
    iget v8, v5, Landroid/graphics/Rect;->left:I

    .line 374
    .line 375
    iget v5, v5, Landroid/graphics/Rect;->right:I

    .line 376
    .line 377
    add-int/2addr v8, v5

    .line 378
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 379
    .line 380
    add-int/2addr v8, v5

    .line 381
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 382
    .line 383
    add-int/2addr v8, v5

    .line 384
    iget v5, v2, Ldb0;->e:I

    .line 385
    .line 386
    iget v9, v2, Ldb0;->f:I

    .line 387
    .line 388
    invoke-virtual {v0, v5, v9}, Landroidx/recyclerview/widget/GridLayoutManager;->W0(II)I

    .line 389
    .line 390
    .line 391
    move-result v5

    .line 392
    iget v9, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 393
    .line 394
    const/4 v15, 0x1

    .line 395
    if-ne v9, v15, :cond_15

    .line 396
    .line 397
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 398
    .line 399
    const/4 v9, 0x0

    .line 400
    const/high16 v10, 0x40000000    # 2.0f

    .line 401
    .line 402
    invoke-static {v9, v5, v10, v8, v2}, Lpy0;->v(ZIIII)I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    sub-int v5, v6, v7

    .line 407
    .line 408
    invoke-static {v5, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 409
    .line 410
    .line 411
    move-result v5

    .line 412
    goto :goto_d

    .line 413
    :cond_15
    const/4 v9, 0x0

    .line 414
    const/high16 v10, 0x40000000    # 2.0f

    .line 415
    .line 416
    sub-int v8, v6, v8

    .line 417
    .line 418
    invoke-static {v8, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 419
    .line 420
    .line 421
    move-result v8

    .line 422
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 423
    .line 424
    invoke-static {v9, v5, v10, v7, v2}, Lpy0;->v(ZIIII)I

    .line 425
    .line 426
    .line 427
    move-result v5

    .line 428
    move v2, v8

    .line 429
    :goto_d
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 430
    .line 431
    .line 432
    move-result-object v7

    .line 433
    check-cast v7, Lqy0;

    .line 434
    .line 435
    invoke-virtual {v0, v1, v2, v5, v7}, Lpy0;->q0(Landroid/view/View;IILqy0;)Z

    .line 436
    .line 437
    .line 438
    move-result v7

    .line 439
    if-eqz v7, :cond_17

    .line 440
    .line 441
    invoke-virtual {v1, v2, v5}, Landroid/view/View;->measure(II)V

    .line 442
    .line 443
    .line 444
    goto :goto_e

    .line 445
    :cond_16
    const/4 v9, 0x0

    .line 446
    const/high16 v10, 0x40000000    # 2.0f

    .line 447
    .line 448
    :cond_17
    :goto_e
    add-int/lit8 v14, v14, 0x1

    .line 449
    .line 450
    goto :goto_c

    .line 451
    :cond_18
    const/4 v9, 0x0

    .line 452
    iput v6, v4, Lli0;->a:I

    .line 453
    .line 454
    iget v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 455
    .line 456
    iget v2, v3, Lmi0;->f:I

    .line 457
    .line 458
    iget v14, v3, Lmi0;->b:I

    .line 459
    .line 460
    const/4 v15, 0x1

    .line 461
    if-ne v1, v15, :cond_1a

    .line 462
    .line 463
    const/4 v8, -0x1

    .line 464
    if-ne v2, v8, :cond_19

    .line 465
    .line 466
    sub-int v1, v14, v6

    .line 467
    .line 468
    move v2, v14

    .line 469
    move v14, v1

    .line 470
    move v1, v2

    .line 471
    :goto_f
    move v2, v9

    .line 472
    move v3, v2

    .line 473
    goto :goto_11

    .line 474
    :cond_19
    add-int v1, v14, v6

    .line 475
    .line 476
    goto :goto_f

    .line 477
    :cond_1a
    const/4 v8, -0x1

    .line 478
    if-ne v2, v8, :cond_1b

    .line 479
    .line 480
    sub-int v1, v14, v6

    .line 481
    .line 482
    move v2, v1

    .line 483
    move v1, v9

    .line 484
    move v3, v14

    .line 485
    :goto_10
    move v14, v1

    .line 486
    goto :goto_11

    .line 487
    :cond_1b
    add-int v1, v14, v6

    .line 488
    .line 489
    move v3, v1

    .line 490
    move v1, v9

    .line 491
    move v2, v14

    .line 492
    goto :goto_10

    .line 493
    :goto_11
    move v7, v9

    .line 494
    :goto_12
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 495
    .line 496
    if-ge v7, v13, :cond_20

    .line 497
    .line 498
    aget-object v5, v5, v7

    .line 499
    .line 500
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    check-cast v6, Ldb0;

    .line 505
    .line 506
    iget v8, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 507
    .line 508
    const/4 v15, 0x1

    .line 509
    if-ne v8, v15, :cond_1d

    .line 510
    .line 511
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->I0()Z

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    if-eqz v2, :cond_1c

    .line 516
    .line 517
    invoke-virtual {v0}, Lpy0;->A()I

    .line 518
    .line 519
    .line 520
    move-result v2

    .line 521
    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 522
    .line 523
    iget v8, v6, Ldb0;->e:I

    .line 524
    .line 525
    sub-int v8, v11, v8

    .line 526
    .line 527
    aget v3, v3, v8

    .line 528
    .line 529
    add-int/2addr v2, v3

    .line 530
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 531
    .line 532
    invoke-virtual {v3, v5}, Lvz;->d(Landroid/view/View;)I

    .line 533
    .line 534
    .line 535
    move-result v3

    .line 536
    sub-int v3, v2, v3

    .line 537
    .line 538
    move/from16 v18, v3

    .line 539
    .line 540
    move v3, v2

    .line 541
    move/from16 v2, v18

    .line 542
    .line 543
    goto :goto_13

    .line 544
    :cond_1c
    invoke-virtual {v0}, Lpy0;->A()I

    .line 545
    .line 546
    .line 547
    move-result v2

    .line 548
    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 549
    .line 550
    iget v8, v6, Ldb0;->e:I

    .line 551
    .line 552
    aget v3, v3, v8

    .line 553
    .line 554
    add-int/2addr v2, v3

    .line 555
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 556
    .line 557
    invoke-virtual {v3, v5}, Lvz;->d(Landroid/view/View;)I

    .line 558
    .line 559
    .line 560
    move-result v3

    .line 561
    add-int/2addr v3, v2

    .line 562
    goto :goto_13

    .line 563
    :cond_1d
    invoke-virtual {v0}, Lpy0;->C()I

    .line 564
    .line 565
    .line 566
    move-result v1

    .line 567
    iget-object v8, v0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 568
    .line 569
    iget v9, v6, Ldb0;->e:I

    .line 570
    .line 571
    aget v8, v8, v9

    .line 572
    .line 573
    add-int/2addr v1, v8

    .line 574
    iget-object v8, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 575
    .line 576
    invoke-virtual {v8, v5}, Lvz;->d(Landroid/view/View;)I

    .line 577
    .line 578
    .line 579
    move-result v8

    .line 580
    add-int/2addr v8, v1

    .line 581
    move v14, v1

    .line 582
    move v1, v8

    .line 583
    :goto_13
    invoke-static {v5, v2, v14, v3, v1}, Lpy0;->J(Landroid/view/View;IIII)V

    .line 584
    .line 585
    .line 586
    iget-object v8, v6, Lqy0;->a:Lmu0;

    .line 587
    .line 588
    invoke-virtual {v8}, Lmu0;->i()Z

    .line 589
    .line 590
    .line 591
    move-result v8

    .line 592
    if-nez v8, :cond_1e

    .line 593
    .line 594
    iget-object v6, v6, Lqy0;->a:Lmu0;

    .line 595
    .line 596
    invoke-virtual {v6}, Lmu0;->l()Z

    .line 597
    .line 598
    .line 599
    move-result v6

    .line 600
    if-eqz v6, :cond_1f

    .line 601
    .line 602
    :cond_1e
    const/4 v15, 0x1

    .line 603
    goto :goto_14

    .line 604
    :cond_1f
    const/4 v15, 0x1

    .line 605
    goto :goto_15

    .line 606
    :goto_14
    iput-boolean v15, v4, Lli0;->c:Z

    .line 607
    .line 608
    :goto_15
    iget-boolean v6, v4, Lli0;->d:Z

    .line 609
    .line 610
    invoke-virtual {v5}, Landroid/view/View;->hasFocusable()Z

    .line 611
    .line 612
    .line 613
    move-result v5

    .line 614
    or-int/2addr v5, v6

    .line 615
    iput-boolean v5, v4, Lli0;->d:Z

    .line 616
    .line 617
    add-int/lit8 v7, v7, 0x1

    .line 618
    .line 619
    goto :goto_12

    .line 620
    :cond_20
    const/4 v0, 0x0

    .line 621
    invoke-static {v5, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 622
    .line 623
    .line 624
    return-void
.end method

.method public final K0(Lvy0;Lzy0;Lki0;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->b1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lzy0;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_3

    .line 9
    .line 10
    iget-boolean v0, p2, Lzy0;->f:Z

    .line 11
    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    if-ne p4, v0, :cond_0

    .line 16
    .line 17
    move p4, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p4, 0x0

    .line 20
    :goto_0
    iget v1, p3, Lki0;->b:I

    .line 21
    .line 22
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->Y0(ILvy0;Lzy0;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz p4, :cond_1

    .line 27
    .line 28
    :goto_1
    if-lez v1, :cond_3

    .line 29
    .line 30
    iget p4, p3, Lki0;->b:I

    .line 31
    .line 32
    if-lez p4, :cond_3

    .line 33
    .line 34
    add-int/lit8 p4, p4, -0x1

    .line 35
    .line 36
    iput p4, p3, Lki0;->b:I

    .line 37
    .line 38
    invoke-virtual {p0, p4, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->Y0(ILvy0;Lzy0;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-virtual {p2}, Lzy0;->b()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    sub-int/2addr p4, v0

    .line 48
    iget v0, p3, Lki0;->b:I

    .line 49
    .line 50
    :goto_2
    if-ge v0, p4, :cond_2

    .line 51
    .line 52
    add-int/lit8 v2, v0, 0x1

    .line 53
    .line 54
    invoke-virtual {p0, v2, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->Y0(ILvy0;Lzy0;)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-le v3, v1, :cond_2

    .line 59
    .line 60
    move v0, v2

    .line 61
    move v1, v3

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    iput v0, p3, Lki0;->b:I

    .line 64
    .line 65
    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->V0()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final N(Landroid/view/View;ILvy0;Lzy0;)Landroid/view/View;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    iget-object v3, v0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    move-object/from16 v5, p1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object/from16 v5, p1

    .line 16
    .line 17
    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v6, v0, Lpy0;->a:Lc9;

    .line 25
    .line 26
    iget-object v6, v6, Lc9;->m:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v6, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-eqz v6, :cond_2

    .line 35
    .line 36
    :goto_0
    move-object v3, v4

    .line 37
    :cond_2
    if-nez v3, :cond_3

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Ldb0;

    .line 45
    .line 46
    iget v7, v6, Ldb0;->e:I

    .line 47
    .line 48
    iget v6, v6, Ldb0;->f:I

    .line 49
    .line 50
    add-int/2addr v6, v7

    .line 51
    invoke-super/range {p0 .. p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->N(Landroid/view/View;ILvy0;Lzy0;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    if-nez v5, :cond_4

    .line 56
    .line 57
    :goto_1
    return-object v4

    .line 58
    :cond_4
    move/from16 v5, p2

    .line 59
    .line 60
    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->w0(I)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    const/4 v9, 0x1

    .line 65
    if-ne v5, v9, :cond_5

    .line 66
    .line 67
    move v5, v9

    .line 68
    goto :goto_2

    .line 69
    :cond_5
    const/4 v5, 0x0

    .line 70
    :goto_2
    iget-boolean v10, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Z

    .line 71
    .line 72
    const/4 v11, -0x1

    .line 73
    if-eq v5, v10, :cond_6

    .line 74
    .line 75
    invoke-virtual {v0}, Lpy0;->u()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    sub-int/2addr v5, v9

    .line 80
    move v10, v11

    .line 81
    move v12, v10

    .line 82
    goto :goto_3

    .line 83
    :cond_6
    invoke-virtual {v0}, Lpy0;->u()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    move v10, v5

    .line 88
    move v12, v9

    .line 89
    const/4 v5, 0x0

    .line 90
    :goto_3
    iget v13, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 91
    .line 92
    if-ne v13, v9, :cond_7

    .line 93
    .line 94
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->I0()Z

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    if-eqz v13, :cond_7

    .line 99
    .line 100
    move v13, v9

    .line 101
    goto :goto_4

    .line 102
    :cond_7
    const/4 v13, 0x0

    .line 103
    :goto_4
    invoke-virtual {v0, v5, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->X0(ILvy0;Lzy0;)I

    .line 104
    .line 105
    .line 106
    move-result v14

    .line 107
    move-object/from16 v16, v4

    .line 108
    .line 109
    move v8, v11

    .line 110
    move v15, v8

    .line 111
    const/4 v9, 0x0

    .line 112
    move v11, v5

    .line 113
    const/4 v4, 0x0

    .line 114
    move-object/from16 v5, v16

    .line 115
    .line 116
    :goto_5
    move-object/from16 v17, v5

    .line 117
    .line 118
    if-eq v11, v10, :cond_18

    .line 119
    .line 120
    invoke-virtual {v0, v11, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->X0(ILvy0;Lzy0;)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    invoke-virtual {v0, v11}, Lpy0;->t(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    if-ne v1, v3, :cond_8

    .line 129
    .line 130
    goto/16 :goto_c

    .line 131
    .line 132
    :cond_8
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 133
    .line 134
    .line 135
    move-result v18

    .line 136
    if-eqz v18, :cond_a

    .line 137
    .line 138
    if-eq v5, v14, :cond_a

    .line 139
    .line 140
    if-eqz v16, :cond_9

    .line 141
    .line 142
    goto/16 :goto_c

    .line 143
    .line 144
    :cond_9
    move-object/from16 v18, v3

    .line 145
    .line 146
    move/from16 v19, v9

    .line 147
    .line 148
    move/from16 v21, v10

    .line 149
    .line 150
    goto/16 :goto_a

    .line 151
    .line 152
    :cond_a
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    check-cast v5, Ldb0;

    .line 157
    .line 158
    iget v2, v5, Ldb0;->e:I

    .line 159
    .line 160
    move-object/from16 v18, v3

    .line 161
    .line 162
    iget v3, v5, Ldb0;->f:I

    .line 163
    .line 164
    add-int/2addr v3, v2

    .line 165
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 166
    .line 167
    .line 168
    move-result v19

    .line 169
    if-eqz v19, :cond_b

    .line 170
    .line 171
    if-ne v2, v7, :cond_b

    .line 172
    .line 173
    if-ne v3, v6, :cond_b

    .line 174
    .line 175
    return-object v1

    .line 176
    :cond_b
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 177
    .line 178
    .line 179
    move-result v19

    .line 180
    if-eqz v19, :cond_c

    .line 181
    .line 182
    if-eqz v16, :cond_d

    .line 183
    .line 184
    :cond_c
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 185
    .line 186
    .line 187
    move-result v19

    .line 188
    if-nez v19, :cond_e

    .line 189
    .line 190
    if-nez v17, :cond_e

    .line 191
    .line 192
    :cond_d
    move/from16 v19, v9

    .line 193
    .line 194
    move/from16 v21, v10

    .line 195
    .line 196
    goto :goto_9

    .line 197
    :cond_e
    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    .line 198
    .line 199
    .line 200
    move-result v19

    .line 201
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 202
    .line 203
    .line 204
    move-result v20

    .line 205
    move/from16 v21, v10

    .line 206
    .line 207
    sub-int v10, v20, v19

    .line 208
    .line 209
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 210
    .line 211
    .line 212
    move-result v19

    .line 213
    if-eqz v19, :cond_12

    .line 214
    .line 215
    if-le v10, v9, :cond_f

    .line 216
    .line 217
    :goto_6
    move/from16 v19, v9

    .line 218
    .line 219
    goto :goto_9

    .line 220
    :cond_f
    if-ne v10, v9, :cond_11

    .line 221
    .line 222
    if-le v2, v15, :cond_10

    .line 223
    .line 224
    const/4 v10, 0x1

    .line 225
    goto :goto_7

    .line 226
    :cond_10
    const/4 v10, 0x0

    .line 227
    :goto_7
    if-ne v13, v10, :cond_11

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_11
    move/from16 v19, v9

    .line 231
    .line 232
    goto :goto_a

    .line 233
    :cond_12
    if-nez v16, :cond_11

    .line 234
    .line 235
    move/from16 v19, v9

    .line 236
    .line 237
    iget-object v9, v0, Lpy0;->c:Lxn0;

    .line 238
    .line 239
    invoke-virtual {v9, v1}, Lxn0;->q(Landroid/view/View;)Z

    .line 240
    .line 241
    .line 242
    move-result v9

    .line 243
    if-eqz v9, :cond_13

    .line 244
    .line 245
    iget-object v9, v0, Lpy0;->d:Lxn0;

    .line 246
    .line 247
    invoke-virtual {v9, v1}, Lxn0;->q(Landroid/view/View;)Z

    .line 248
    .line 249
    .line 250
    move-result v9

    .line 251
    if-eqz v9, :cond_13

    .line 252
    .line 253
    goto :goto_a

    .line 254
    :cond_13
    if-le v10, v4, :cond_14

    .line 255
    .line 256
    goto :goto_9

    .line 257
    :cond_14
    if-ne v10, v4, :cond_17

    .line 258
    .line 259
    if-le v2, v8, :cond_15

    .line 260
    .line 261
    const/4 v9, 0x1

    .line 262
    goto :goto_8

    .line 263
    :cond_15
    const/4 v9, 0x0

    .line 264
    :goto_8
    if-ne v13, v9, :cond_17

    .line 265
    .line 266
    :goto_9
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    .line 267
    .line 268
    .line 269
    move-result v9

    .line 270
    iget v5, v5, Ldb0;->e:I

    .line 271
    .line 272
    if-eqz v9, :cond_16

    .line 273
    .line 274
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    sub-int v9, v3, v2

    .line 283
    .line 284
    move-object/from16 v16, v1

    .line 285
    .line 286
    move v15, v5

    .line 287
    move-object/from16 v5, v17

    .line 288
    .line 289
    goto :goto_b

    .line 290
    :cond_16
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    sub-int v4, v3, v2

    .line 299
    .line 300
    move v8, v5

    .line 301
    move/from16 v9, v19

    .line 302
    .line 303
    move-object v5, v1

    .line 304
    goto :goto_b

    .line 305
    :cond_17
    :goto_a
    move-object/from16 v5, v17

    .line 306
    .line 307
    move/from16 v9, v19

    .line 308
    .line 309
    :goto_b
    add-int/2addr v11, v12

    .line 310
    move-object/from16 v1, p3

    .line 311
    .line 312
    move-object/from16 v2, p4

    .line 313
    .line 314
    move-object/from16 v3, v18

    .line 315
    .line 316
    move/from16 v10, v21

    .line 317
    .line 318
    goto/16 :goto_5

    .line 319
    .line 320
    :cond_18
    :goto_c
    if-eqz v16, :cond_19

    .line 321
    .line 322
    return-object v16

    .line 323
    :cond_19
    return-object v17
.end method

.method public final P(Lvy0;Lzy0;Landroid/view/View;Lo1;)V
    .locals 9

    .line 1
    iget-object v0, p4, Lo1;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    instance-of v2, v1, Ldb0;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p3, p4}, Lpy0;->Q(Landroid/view/View;Lo1;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast v1, Ldb0;

    .line 16
    .line 17
    iget-object p3, v1, Lqy0;->a:Lmu0;

    .line 18
    .line 19
    invoke-virtual {p3}, Lmu0;->c()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    invoke-virtual {p0, p3, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->X0(ILvy0;Lzy0;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget p0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 28
    .line 29
    iget v4, v1, Ldb0;->e:I

    .line 30
    .line 31
    iget v3, v1, Ldb0;->f:I

    .line 32
    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    const/4 v7, 0x0

    .line 37
    const/4 v5, 0x1

    .line 38
    move v8, v4

    .line 39
    move v4, v2

    .line 40
    move v2, v8

    .line 41
    invoke-static/range {v2 .. v7}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const/4 v6, 0x0

    .line 50
    const/4 v7, 0x0

    .line 51
    move v5, v3

    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-static/range {v2 .. v7}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final Q0(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->Q0(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 9
    .line 10
    const-string p1, "GridLayoutManager does not support stack from end. Consider using reverse layout"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public final R(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls7;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final S()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls7;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final T(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls7;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final U(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls7;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final U0(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 2
    .line 3
    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    array-length v3, v0

    .line 9
    add-int/lit8 v4, v1, 0x1

    .line 10
    .line 11
    if-ne v3, v4, :cond_0

    .line 12
    .line 13
    array-length v3, v0

    .line 14
    sub-int/2addr v3, v2

    .line 15
    aget v3, v0, v3

    .line 16
    .line 17
    if-eq v3, p1, :cond_1

    .line 18
    .line 19
    :cond_0
    add-int/lit8 v0, v1, 0x1

    .line 20
    .line 21
    new-array v0, v0, [I

    .line 22
    .line 23
    :cond_1
    const/4 v3, 0x0

    .line 24
    aput v3, v0, v3

    .line 25
    .line 26
    div-int v4, p1, v1

    .line 27
    .line 28
    rem-int/2addr p1, v1

    .line 29
    move v5, v3

    .line 30
    :goto_0
    if-gt v2, v1, :cond_3

    .line 31
    .line 32
    add-int/2addr v3, p1

    .line 33
    if-lez v3, :cond_2

    .line 34
    .line 35
    sub-int v6, v1, v3

    .line 36
    .line 37
    if-ge v6, p1, :cond_2

    .line 38
    .line 39
    add-int/lit8 v6, v4, 0x1

    .line 40
    .line 41
    sub-int/2addr v3, v1

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    move v6, v4

    .line 44
    :goto_1
    add-int/2addr v5, v6

    .line 45
    aput v5, v0, v2

    .line 46
    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 51
    .line 52
    return-void
.end method

.method public final V(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls7;->y()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :cond_1
    :goto_0
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 13
    .line 14
    new-array v0, v0, [Landroid/view/View;

    .line 15
    .line 16
    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->G:[Landroid/view/View;

    .line 17
    .line 18
    return-void
.end method

.method public final W(Lvy0;Lzy0;)V
    .locals 7

    .line 1
    iget-boolean v0, p2, Lzy0;->f:Z

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->I:Landroid/util/SparseIntArray;

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->H:Landroid/util/SparseIntArray;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lpy0;->u()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v3, 0x0

    .line 14
    :goto_0
    if-ge v3, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v3}, Lpy0;->t(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    check-cast v4, Ldb0;

    .line 25
    .line 26
    iget-object v5, v4, Lqy0;->a:Lmu0;

    .line 27
    .line 28
    invoke-virtual {v5}, Lmu0;->c()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    iget v6, v4, Ldb0;->f:I

    .line 33
    .line 34
    invoke-virtual {v2, v5, v6}, Landroid/util/SparseIntArray;->put(II)V

    .line 35
    .line 36
    .line 37
    iget v4, v4, Ldb0;->e:I

    .line 38
    .line 39
    invoke-virtual {v1, v5, v4}, Landroid/util/SparseIntArray;->put(II)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->W(Lvy0;Lzy0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/util/SparseIntArray;->clear()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/util/SparseIntArray;->clear()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final W0(II)I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->I0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 13
    .line 14
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 15
    .line 16
    sub-int v1, p0, p1

    .line 17
    .line 18
    aget v1, v0, v1

    .line 19
    .line 20
    sub-int/2addr p0, p1

    .line 21
    sub-int/2addr p0, p2

    .line 22
    aget p0, v0, p0

    .line 23
    .line 24
    sub-int/2addr v1, p0

    .line 25
    return v1

    .line 26
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 27
    .line 28
    add-int/2addr p2, p1

    .line 29
    aget p2, p0, p2

    .line 30
    .line 31
    aget p0, p0, p1

    .line 32
    .line 33
    sub-int/2addr p2, p0

    .line 34
    return p2
.end method

.method public final X(Lzy0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->X(Lzy0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->D:Z

    .line 6
    .line 7
    return-void
.end method

.method public final X0(ILvy0;Lzy0;)I
    .locals 1

    .line 1
    iget-boolean p3, p3, Lzy0;->f:Z

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 11
    .line 12
    invoke-static {p1, p0}, Ls7;->x(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-virtual {p2, p1}, Lvy0;->b(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 p2, -0x1

    .line 22
    if-ne p1, p2, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 30
    .line 31
    invoke-static {p1, p0}, Ls7;->x(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public final Y0(ILvy0;Lzy0;)I
    .locals 2

    .line 1
    iget-boolean p3, p3, Lzy0;->f:Z

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 11
    .line 12
    rem-int/2addr p1, p0

    .line 13
    return p1

    .line 14
    :cond_0
    iget-object p3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->I:Landroid/util/SparseIntArray;

    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    invoke-virtual {p3, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eq p3, v1, :cond_1

    .line 22
    .line 23
    return p3

    .line 24
    :cond_1
    invoke-virtual {p2, p1}, Lvy0;->b(I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-ne p1, v1, :cond_2

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 36
    .line 37
    rem-int/2addr p1, p0

    .line 38
    return p1
.end method

.method public final Z0(ILvy0;Lzy0;)I
    .locals 2

    .line 1
    iget-boolean p3, p3, Lzy0;->f:Z

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->H:Landroid/util/SparseIntArray;

    .line 13
    .line 14
    const/4 p3, -0x1

    .line 15
    invoke-virtual {p0, p1, p3}, Landroid/util/SparseIntArray;->get(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eq p0, p3, :cond_1

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    invoke-virtual {p2, p1}, Lvy0;->b(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-ne p0, p3, :cond_2

    .line 27
    .line 28
    return v1

    .line 29
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    return v1
.end method

.method public final a1(Landroid/view/View;IZ)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ldb0;

    .line 6
    .line 7
    iget-object v1, v0, Lqy0;->b:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    add-int/2addr v2, v3

    .line 14
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 15
    .line 16
    add-int/2addr v2, v3

    .line 17
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 18
    .line 19
    add-int/2addr v2, v3

    .line 20
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 23
    .line 24
    add-int/2addr v3, v1

    .line 25
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 26
    .line 27
    add-int/2addr v3, v1

    .line 28
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 29
    .line 30
    add-int/2addr v3, v1

    .line 31
    iget v1, v0, Ldb0;->e:I

    .line 32
    .line 33
    iget v4, v0, Ldb0;->f:I

    .line 34
    .line 35
    invoke-virtual {p0, v1, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->W0(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget v4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    const/4 v6, 0x1

    .line 43
    if-ne v4, v6, :cond_0

    .line 44
    .line 45
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 46
    .line 47
    invoke-static {v5, v1, p2, v3, v4}, Lpy0;->v(ZIIII)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 52
    .line 53
    invoke-virtual {v1}, Lvz;->l()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iget v3, p0, Lpy0;->l:I

    .line 58
    .line 59
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 60
    .line 61
    invoke-static {v6, v1, v3, v2, v0}, Lpy0;->v(ZIIII)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 67
    .line 68
    invoke-static {v5, v1, p2, v2, v4}, Lpy0;->v(ZIIII)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->q:Lvz;

    .line 73
    .line 74
    invoke-virtual {v1}, Lvz;->l()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iget v2, p0, Lpy0;->k:I

    .line 79
    .line 80
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 81
    .line 82
    invoke-static {v6, v1, v2, v3, v0}, Lpy0;->v(ZIIII)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    move v7, v0

    .line 87
    move v0, p2

    .line 88
    move p2, v7

    .line 89
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Lqy0;

    .line 94
    .line 95
    if-eqz p3, :cond_1

    .line 96
    .line 97
    invoke-virtual {p0, p1, p2, v0, v1}, Lpy0;->q0(Landroid/view/View;IILqy0;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    invoke-virtual {p0, p1, p2, v0, v1}, Lpy0;->o0(Landroid/view/View;IILqy0;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    :goto_1
    if-eqz p0, :cond_2

    .line 107
    .line 108
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public final b1()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lpy0;->m:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lpy0;->B()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Lpy0;->A()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    :goto_0
    sub-int/2addr v0, v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget v0, p0, Lpy0;->n:I

    .line 20
    .line 21
    invoke-virtual {p0}, Lpy0;->z()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v0, v1

    .line 26
    invoke-virtual {p0}, Lpy0;->C()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->U0(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final e(Lqy0;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ldb0;

    .line 2
    .line 3
    return p0
.end method

.method public final h0(ILvy0;Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->b1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->V0()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->h0(ILvy0;Lzy0;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final i0(ILvy0;Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->b1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->V0()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->i0(ILvy0;Lzy0;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final j(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->u0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final k(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->v0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final l0(Landroid/graphics/Rect;II)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Lpy0;->l0(Landroid/graphics/Rect;II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lpy0;->A()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Lpy0;->B()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/2addr v1, v0

    .line 17
    invoke-virtual {p0}, Lpy0;->C()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Lpy0;->z()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v2, v0

    .line 26
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    if-ne v0, v3, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    add-int/2addr p1, v2

    .line 36
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getMinimumHeight()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {p3, p1, v0}, Lpy0;->f(III)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget-object p3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 49
    .line 50
    array-length v0, p3

    .line 51
    sub-int/2addr v0, v3

    .line 52
    aget p3, p3, v0

    .line 53
    .line 54
    add-int/2addr p3, v1

    .line 55
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getMinimumWidth()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {p2, p3, v0}, Lpy0;->f(III)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    add-int/2addr p1, v1

    .line 71
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 72
    .line 73
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getMinimumWidth()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {p2, p1, v0}, Lpy0;->f(III)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iget-object p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->F:[I

    .line 84
    .line 85
    array-length v0, p1

    .line 86
    sub-int/2addr v0, v3

    .line 87
    aget p1, p1, v0

    .line 88
    .line 89
    add-int/2addr p1, v2

    .line 90
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getMinimumHeight()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-static {p3, p1, v0}, Lpy0;->f(III)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    :goto_0
    iget-object p0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 101
    .line 102
    invoke-static {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->d(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final m(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->u0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final n(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->v0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final q()Lqy0;
    .locals 2

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ldb0;

    .line 8
    .line 9
    invoke-direct {p0, v1, v0}, Ldb0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Ldb0;

    .line 14
    .line 15
    invoke-direct {p0, v0, v1}, Ldb0;-><init>(II)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final r(Landroid/content/Context;Landroid/util/AttributeSet;)Lqy0;
    .locals 0

    .line 1
    new-instance p0, Ldb0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lqy0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ldb0;->e:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ldb0;->f:I

    .line 11
    .line 12
    return-object p0
.end method

.method public final r0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Lni0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->D:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final s(Landroid/view/ViewGroup$LayoutParams;)Lqy0;
    .locals 2

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, -0x1

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ldb0;

    .line 8
    .line 9
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lqy0;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 12
    .line 13
    .line 14
    iput v1, p0, Ldb0;->e:I

    .line 15
    .line 16
    iput v0, p0, Ldb0;->f:I

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance p0, Ldb0;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lqy0;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    iput v1, p0, Ldb0;->e:I

    .line 25
    .line 26
    iput v0, p0, Ldb0;->f:I

    .line 27
    .line 28
    return-object p0
.end method

.method public final s0(Lzy0;Lmi0;Lwk;)V
    .locals 6

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v3, v0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    iget v4, p2, Lmi0;->d:I

    .line 9
    .line 10
    if-ltz v4, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lzy0;->b()I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    if-ge v4, v5, :cond_0

    .line 17
    .line 18
    if-lez v3, :cond_0

    .line 19
    .line 20
    iget v4, p2, Lmi0;->d:I

    .line 21
    .line 22
    iget v5, p2, Lmi0;->g:I

    .line 23
    .line 24
    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual {p3, v4, v5}, Lwk;->a(II)V

    .line 29
    .line 30
    .line 31
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->J:Ls7;

    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    add-int/lit8 v3, v3, -0x1

    .line 37
    .line 38
    iget v4, p2, Lmi0;->d:I

    .line 39
    .line 40
    iget v5, p2, Lmi0;->e:I

    .line 41
    .line 42
    add-int/2addr v4, v5

    .line 43
    iput v4, p2, Lmi0;->d:I

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    return-void
.end method

.method public final w(Lvy0;Lzy0;)I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->o:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->E:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p2}, Lzy0;->b()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    invoke-virtual {p2}, Lzy0;->b()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr v0, v1

    .line 22
    invoke-virtual {p0, v0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->X0(ILvy0;Lzy0;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr p0, v1

    .line 27
    return p0
.end method
