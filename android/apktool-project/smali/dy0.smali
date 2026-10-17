.class public final Ldy0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ldy0;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v0, v0, Ldy0;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 6
    .line 7
    if-eqz v1, :cond_b

    .line 8
    .line 9
    check-cast v1, Luv;

    .line 10
    .line 11
    iget-wide v3, v1, Lly0;->d:J

    .line 12
    .line 13
    iget-object v5, v1, Luv;->h:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    iget-object v7, v1, Luv;->j:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v8

    .line 25
    iget-object v9, v1, Luv;->k:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v10

    .line 31
    iget-object v11, v1, Luv;->i:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v12

    .line 37
    if-eqz v6, :cond_0

    .line 38
    .line 39
    if-eqz v8, :cond_0

    .line 40
    .line 41
    if-eqz v12, :cond_0

    .line 42
    .line 43
    if-eqz v10, :cond_0

    .line 44
    .line 45
    goto/16 :goto_6

    .line 46
    .line 47
    :cond_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v13

    .line 51
    const/4 v14, 0x0

    .line 52
    :goto_0
    if-ge v14, v13, :cond_1

    .line 53
    .line 54
    invoke-virtual {v5, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v15

    .line 58
    add-int/lit8 v14, v14, 0x1

    .line 59
    .line 60
    check-cast v15, Lmu0;

    .line 61
    .line 62
    iget-object v2, v15, Lmu0;->a:Landroid/view/View;

    .line 63
    .line 64
    move-object/from16 v16, v5

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    move/from16 v17, v6

    .line 71
    .line 72
    iget-object v6, v1, Luv;->q:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    move/from16 v18, v8

    .line 82
    .line 83
    const/4 v8, 0x0

    .line 84
    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    new-instance v8, Lpv;

    .line 89
    .line 90
    invoke-direct {v8, v1, v15, v5, v2}, Lpv;-><init>(Luv;Lmu0;Landroid/view/ViewPropertyAnimator;Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 98
    .line 99
    .line 100
    move-object/from16 v5, v16

    .line 101
    .line 102
    move/from16 v6, v17

    .line 103
    .line 104
    move/from16 v8, v18

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    move-object/from16 v16, v5

    .line 108
    .line 109
    move/from16 v17, v6

    .line 110
    .line 111
    move/from16 v18, v8

    .line 112
    .line 113
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clear()V

    .line 114
    .line 115
    .line 116
    if-nez v18, :cond_3

    .line 117
    .line 118
    new-instance v2, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 124
    .line 125
    .line 126
    iget-object v5, v1, Luv;->m:Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 132
    .line 133
    .line 134
    new-instance v5, Lmv;

    .line 135
    .line 136
    invoke-direct {v5, v1, v2}, Lmv;-><init>(Luv;Ljava/util/ArrayList;)V

    .line 137
    .line 138
    .line 139
    if-nez v17, :cond_2

    .line 140
    .line 141
    const/4 v6, 0x0

    .line 142
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, Ltv;

    .line 147
    .line 148
    iget-object v2, v2, Ltv;->a:Lmu0;

    .line 149
    .line 150
    iget-object v2, v2, Lmu0;->a:Landroid/view/View;

    .line 151
    .line 152
    sget-object v6, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 153
    .line 154
    invoke-virtual {v2, v5, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    .line 159
    .line 160
    .line 161
    :cond_3
    :goto_1
    if-nez v10, :cond_5

    .line 162
    .line 163
    new-instance v2, Ljava/util/ArrayList;

    .line 164
    .line 165
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 169
    .line 170
    .line 171
    iget-object v5, v1, Luv;->n:Ljava/util/ArrayList;

    .line 172
    .line 173
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 177
    .line 178
    .line 179
    new-instance v5, Lnv;

    .line 180
    .line 181
    invoke-direct {v5, v1, v2}, Lnv;-><init>(Luv;Ljava/util/ArrayList;)V

    .line 182
    .line 183
    .line 184
    if-nez v17, :cond_4

    .line 185
    .line 186
    const/4 v6, 0x0

    .line 187
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, Lsv;

    .line 192
    .line 193
    iget-object v2, v2, Lsv;->a:Lmu0;

    .line 194
    .line 195
    iget-object v2, v2, Lmu0;->a:Landroid/view/View;

    .line 196
    .line 197
    sget-object v6, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 198
    .line 199
    invoke-virtual {v2, v5, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_4
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    .line 204
    .line 205
    .line 206
    :cond_5
    :goto_2
    if-nez v12, :cond_b

    .line 207
    .line 208
    new-instance v2, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 214
    .line 215
    .line 216
    iget-object v5, v1, Luv;->l:Ljava/util/ArrayList;

    .line 217
    .line 218
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 222
    .line 223
    .line 224
    new-instance v5, Lov;

    .line 225
    .line 226
    invoke-direct {v5, v1, v2}, Lov;-><init>(Luv;Ljava/util/ArrayList;)V

    .line 227
    .line 228
    .line 229
    if-eqz v17, :cond_7

    .line 230
    .line 231
    if-eqz v18, :cond_7

    .line 232
    .line 233
    if-nez v10, :cond_6

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_6
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    .line 237
    .line 238
    .line 239
    goto :goto_6

    .line 240
    :cond_7
    :goto_3
    const-wide/16 v6, 0x0

    .line 241
    .line 242
    if-nez v17, :cond_8

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_8
    move-wide v3, v6

    .line 246
    :goto_4
    if-nez v18, :cond_9

    .line 247
    .line 248
    iget-wide v8, v1, Lly0;->e:J

    .line 249
    .line 250
    goto :goto_5

    .line 251
    :cond_9
    move-wide v8, v6

    .line 252
    :goto_5
    if-nez v10, :cond_a

    .line 253
    .line 254
    iget-wide v6, v1, Lly0;->f:J

    .line 255
    .line 256
    :cond_a
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 257
    .line 258
    .line 259
    move-result-wide v6

    .line 260
    add-long/2addr v6, v3

    .line 261
    const/4 v1, 0x0

    .line 262
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    check-cast v2, Lmu0;

    .line 267
    .line 268
    iget-object v2, v2, Lmu0;->a:Landroid/view/View;

    .line 269
    .line 270
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 271
    .line 272
    invoke-virtual {v2, v5, v6, v7}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 273
    .line 274
    .line 275
    goto :goto_7

    .line 276
    :cond_b
    :goto_6
    const/4 v1, 0x0

    .line 277
    :goto_7
    iput-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->s0:Z

    .line 278
    .line 279
    return-void
.end method
