.class public final Lfw;
.super Ld7;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public c:Z

.field public d:Z

.field public e:Ls7;


# virtual methods
.method public final j(Landroid/content/Context;)Ls7;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lfw;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lfw;->e:Ls7;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Ld7;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lw81;

    .line 11
    .line 12
    iget-object v1, v0, Lw81;->c:Lh70;

    .line 13
    .line 14
    iget v0, v0, Lw81;->a:I

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x1

    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    move v0, v4

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v0, v3

    .line 24
    :goto_0
    iget-boolean v2, p0, Lfw;->c:Z

    .line 25
    .line 26
    iget-object v5, v1, Lh70;->Q:Lg70;

    .line 27
    .line 28
    if-nez v5, :cond_2

    .line 29
    .line 30
    move v6, v3

    .line 31
    goto :goto_1

    .line 32
    :cond_2
    iget v6, v5, Lg70;->f:I

    .line 33
    .line 34
    :goto_1
    if-eqz v2, :cond_6

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    if-nez v5, :cond_3

    .line 39
    .line 40
    :goto_2
    move v2, v3

    .line 41
    goto :goto_3

    .line 42
    :cond_3
    iget v2, v5, Lg70;->d:I

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_4
    if-nez v5, :cond_5

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_5
    iget v2, v5, Lg70;->e:I

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_6
    if-eqz v0, :cond_8

    .line 52
    .line 53
    if-nez v5, :cond_7

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_7
    iget v2, v5, Lg70;->b:I

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_8
    if-nez v5, :cond_9

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_9
    iget v2, v5, Lg70;->c:I

    .line 63
    .line 64
    :goto_3
    invoke-virtual {v1, v3, v3, v3, v3}, Lh70;->J(IIII)V

    .line 65
    .line 66
    .line 67
    iget-object v3, v1, Lh70;->M:Landroid/view/ViewGroup;

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    if-eqz v3, :cond_a

    .line 71
    .line 72
    const v7, 0x7f090226

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    if-eqz v3, :cond_a

    .line 80
    .line 81
    iget-object v3, v1, Lh70;->M:Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {v3, v7, v5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_a
    iget-object v1, v1, Lh70;->M:Landroid/view/ViewGroup;

    .line 87
    .line 88
    if-eqz v1, :cond_b

    .line 89
    .line 90
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    if-eqz v1, :cond_b

    .line 95
    .line 96
    goto/16 :goto_7

    .line 97
    .line 98
    :cond_b
    if-nez v2, :cond_16

    .line 99
    .line 100
    if-eqz v6, :cond_16

    .line 101
    .line 102
    const/16 v1, 0x1001

    .line 103
    .line 104
    if-eq v6, v1, :cond_14

    .line 105
    .line 106
    const/16 v1, 0x2002

    .line 107
    .line 108
    if-eq v6, v1, :cond_12

    .line 109
    .line 110
    const/16 v1, 0x2005

    .line 111
    .line 112
    if-eq v6, v1, :cond_10

    .line 113
    .line 114
    const/16 v1, 0x1003

    .line 115
    .line 116
    if-eq v6, v1, :cond_e

    .line 117
    .line 118
    const/16 v1, 0x1004

    .line 119
    .line 120
    if-eq v6, v1, :cond_c

    .line 121
    .line 122
    const/4 v0, -0x1

    .line 123
    :goto_4
    move v2, v0

    .line 124
    goto :goto_5

    .line 125
    :cond_c
    if-eqz v0, :cond_d

    .line 126
    .line 127
    const v0, 0x10100b8

    .line 128
    .line 129
    .line 130
    invoke-static {p1, v0}, Lkp1;->j(Landroid/content/Context;I)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    goto :goto_4

    .line 135
    :cond_d
    const v0, 0x10100b9

    .line 136
    .line 137
    .line 138
    invoke-static {p1, v0}, Lkp1;->j(Landroid/content/Context;I)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    goto :goto_4

    .line 143
    :cond_e
    if-eqz v0, :cond_f

    .line 144
    .line 145
    const v0, 0x7f020005

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_f
    const v0, 0x7f020006

    .line 150
    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_10
    if-eqz v0, :cond_11

    .line 154
    .line 155
    const v0, 0x10100ba

    .line 156
    .line 157
    .line 158
    invoke-static {p1, v0}, Lkp1;->j(Landroid/content/Context;I)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    goto :goto_4

    .line 163
    :cond_11
    const v0, 0x10100bb

    .line 164
    .line 165
    .line 166
    invoke-static {p1, v0}, Lkp1;->j(Landroid/content/Context;I)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    goto :goto_4

    .line 171
    :cond_12
    if-eqz v0, :cond_13

    .line 172
    .line 173
    const v0, 0x7f020003

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_13
    const v0, 0x7f020004

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_14
    if-eqz v0, :cond_15

    .line 182
    .line 183
    const v0, 0x7f020007

    .line 184
    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_15
    const v0, 0x7f020008

    .line 188
    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_16
    :goto_5
    if-eqz v2, :cond_19

    .line 192
    .line 193
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-string v1, "anim"

    .line 202
    .line 203
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    const/16 v1, 0x19

    .line 208
    .line 209
    if-eqz v0, :cond_17

    .line 210
    .line 211
    :try_start_0
    invoke-static {p1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    if-eqz v3, :cond_19

    .line 216
    .line 217
    new-instance v6, Ls7;

    .line 218
    .line 219
    invoke-direct {v6, v1, v3}, Ls7;-><init>(ILjava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 220
    .line 221
    .line 222
    :goto_6
    move-object v5, v6

    .line 223
    goto :goto_7

    .line 224
    :catch_0
    move-exception p0

    .line 225
    throw p0

    .line 226
    :catch_1
    :cond_17
    :try_start_1
    invoke-static {p1, v2}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    if-eqz v3, :cond_19

    .line 231
    .line 232
    new-instance v6, Ls7;

    .line 233
    .line 234
    invoke-direct {v6, v3}, Ls7;-><init>(Landroid/animation/Animator;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 235
    .line 236
    .line 237
    goto :goto_6

    .line 238
    :catch_2
    move-exception v3

    .line 239
    if-nez v0, :cond_18

    .line 240
    .line 241
    invoke-static {p1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    if-eqz p1, :cond_19

    .line 246
    .line 247
    new-instance v5, Ls7;

    .line 248
    .line 249
    invoke-direct {v5, v1, p1}, Ls7;-><init>(ILjava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    goto :goto_7

    .line 253
    :cond_18
    throw v3

    .line 254
    :cond_19
    :goto_7
    iput-object v5, p0, Lfw;->e:Ls7;

    .line 255
    .line 256
    iput-boolean v4, p0, Lfw;->d:Z

    .line 257
    .line 258
    return-object v5
.end method
