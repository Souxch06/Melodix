.class public final Lv61;
.super La71;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final c:Lx61;


# direct methods
.method public constructor <init>(Lx61;)V
    .locals 0

    .line 1
    invoke-direct {p0}, La71;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv61;->c:Lx61;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Matrix;Lp61;ILandroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    sget-object v3, Lx61;->h:Landroid/graphics/RectF;

    .line 8
    .line 9
    move-object/from16 v3, p0

    .line 10
    .line 11
    iget-object v3, v3, Lv61;->c:Lx61;

    .line 12
    .line 13
    iget v4, v3, Lx61;->f:F

    .line 14
    .line 15
    iget v5, v3, Lx61;->g:F

    .line 16
    .line 17
    new-instance v6, Landroid/graphics/RectF;

    .line 18
    .line 19
    iget v7, v3, Lx61;->b:F

    .line 20
    .line 21
    iget v8, v3, Lx61;->c:F

    .line 22
    .line 23
    iget v9, v3, Lx61;->d:F

    .line 24
    .line 25
    iget v3, v3, Lx61;->e:F

    .line 26
    .line 27
    invoke-direct {v6, v7, v8, v9, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 28
    .line 29
    .line 30
    iget-object v3, v0, Lp61;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    cmpg-float v8, v5, v7

    .line 34
    .line 35
    const/4 v9, 0x1

    .line 36
    const/4 v10, 0x0

    .line 37
    if-gez v8, :cond_0

    .line 38
    .line 39
    move v8, v9

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v8, v10

    .line 42
    :goto_0
    iget-object v11, v0, Lp61;->g:Landroid/graphics/Path;

    .line 43
    .line 44
    const/4 v12, 0x3

    .line 45
    sget-object v17, Lp61;->k:[I

    .line 46
    .line 47
    const/4 v13, 0x2

    .line 48
    if-eqz v8, :cond_1

    .line 49
    .line 50
    aput v10, v17, v10

    .line 51
    .line 52
    iget v10, v0, Lp61;->f:I

    .line 53
    .line 54
    aput v10, v17, v9

    .line 55
    .line 56
    iget v10, v0, Lp61;->e:I

    .line 57
    .line 58
    aput v10, v17, v13

    .line 59
    .line 60
    iget v10, v0, Lp61;->d:I

    .line 61
    .line 62
    aput v10, v17, v12

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    invoke-virtual {v11}, Landroid/graphics/Path;->rewind()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    .line 69
    .line 70
    .line 71
    move-result v14

    .line 72
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    .line 73
    .line 74
    .line 75
    move-result v15

    .line 76
    invoke-virtual {v11, v14, v15}, Landroid/graphics/Path;->moveTo(FF)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v11, v6, v4, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v11}, Landroid/graphics/Path;->close()V

    .line 83
    .line 84
    .line 85
    neg-int v14, v1

    .line 86
    int-to-float v14, v14

    .line 87
    invoke-virtual {v6, v14, v14}, Landroid/graphics/RectF;->inset(FF)V

    .line 88
    .line 89
    .line 90
    aput v10, v17, v10

    .line 91
    .line 92
    iget v10, v0, Lp61;->d:I

    .line 93
    .line 94
    aput v10, v17, v9

    .line 95
    .line 96
    iget v10, v0, Lp61;->e:I

    .line 97
    .line 98
    aput v10, v17, v13

    .line 99
    .line 100
    iget v10, v0, Lp61;->f:I

    .line 101
    .line 102
    aput v10, v17, v12

    .line 103
    .line 104
    :goto_1
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    const/high16 v12, 0x40000000    # 2.0f

    .line 109
    .line 110
    div-float v16, v10, v12

    .line 111
    .line 112
    cmpg-float v7, v16, v7

    .line 113
    .line 114
    if-gtz v7, :cond_2

    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    int-to-float v1, v1

    .line 118
    div-float v1, v1, v16

    .line 119
    .line 120
    const/high16 v7, 0x3f800000    # 1.0f

    .line 121
    .line 122
    sub-float v1, v7, v1

    .line 123
    .line 124
    sub-float v10, v7, v1

    .line 125
    .line 126
    div-float/2addr v10, v12

    .line 127
    add-float/2addr v10, v1

    .line 128
    sget-object v18, Lp61;->l:[F

    .line 129
    .line 130
    aput v1, v18, v9

    .line 131
    .line 132
    aput v10, v18, v13

    .line 133
    .line 134
    new-instance v13, Landroid/graphics/RadialGradient;

    .line 135
    .line 136
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    .line 137
    .line 138
    .line 139
    move-result v14

    .line 140
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    .line 141
    .line 142
    .line 143
    move-result v15

    .line 144
    sget-object v19, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 145
    .line 146
    invoke-direct/range {v13 .. v19}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3, v13}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 153
    .line 154
    .line 155
    move-object/from16 v1, p1

    .line 156
    .line 157
    invoke-virtual {v2, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    div-float/2addr v1, v9

    .line 169
    invoke-virtual {v2, v7, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 170
    .line 171
    .line 172
    if-nez v8, :cond_3

    .line 173
    .line 174
    sget-object v1, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 175
    .line 176
    invoke-virtual {v2, v11, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 177
    .line 178
    .line 179
    iget-object v0, v0, Lp61;->h:Landroid/graphics/Paint;

    .line 180
    .line 181
    invoke-virtual {v2, v11, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 182
    .line 183
    .line 184
    :cond_3
    move v2, v4

    .line 185
    const/4 v4, 0x1

    .line 186
    move v0, v5

    .line 187
    move-object v5, v3

    .line 188
    move v3, v0

    .line 189
    move-object/from16 v0, p4

    .line 190
    .line 191
    move-object v1, v6

    .line 192
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Canvas;->restore()V

    .line 196
    .line 197
    .line 198
    return-void
.end method
