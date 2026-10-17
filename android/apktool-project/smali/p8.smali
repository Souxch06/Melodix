.class public final Lp8;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Lqo;

.field public c:Lqo;

.field public d:Lqo;

.field public e:Lqo;

.field public f:Lqo;

.field public g:Lqo;

.field public h:Lqo;

.field public final i:Ly8;

.field public j:I

.field public k:I

.field public l:Landroid/graphics/Typeface;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lp8;->j:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lp8;->k:I

    .line 9
    .line 10
    iput-object p1, p0, Lp8;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    new-instance v0, Ly8;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ly8;-><init>(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lp8;->i:Ly8;

    .line 18
    .line 19
    return-void
.end method

.method public static c(Landroid/content/Context;Lj7;I)Lqo;
    .locals 1

    .line 1
    monitor-enter p1

    .line 2
    :try_start_0
    iget-object v0, p1, Lj7;->a:Lw01;

    .line 3
    .line 4
    invoke-virtual {v0, p0, p2}, Lw01;->g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 5
    .line 6
    .line 7
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p1, Lqo;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    iput-boolean p2, p1, Lqo;->b:Z

    .line 18
    .line 19
    iput-object p0, p1, Lqo;->c:Ljava/lang/Object;

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p0
.end method

.method public static h(Landroid/view/inputmethod/EditorInfo;Landroid/view/inputmethod/InputConnection;Landroid/widget/TextView;)V
    .locals 10

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-ge v0, v1, :cond_d

    .line 6
    .line 7
    if-eqz p1, :cond_d

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-lt v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0, p1}, Lrz;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    if-lt v0, v1, :cond_1

    .line 23
    .line 24
    invoke-static {p0, p1}, Lrz;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget p2, p0, Landroid/view/inputmethod/EditorInfo;->initialSelStart:I

    .line 29
    .line 30
    iget v0, p0, Landroid/view/inputmethod/EditorInfo;->initialSelEnd:I

    .line 31
    .line 32
    if-le p2, v0, :cond_2

    .line 33
    .line 34
    move v1, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    move v1, p2

    .line 37
    :goto_0
    if-le p2, v0, :cond_3

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    move p2, v0

    .line 41
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v2, 0x0

    .line 46
    const/4 v3, 0x0

    .line 47
    if-ltz v1, :cond_c

    .line 48
    .line 49
    if-le p2, v0, :cond_4

    .line 50
    .line 51
    goto/16 :goto_5

    .line 52
    .line 53
    :cond_4
    iget v4, p0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 54
    .line 55
    and-int/lit16 v4, v4, 0xfff

    .line 56
    .line 57
    const/16 v5, 0x81

    .line 58
    .line 59
    if-eq v4, v5, :cond_b

    .line 60
    .line 61
    const/16 v5, 0xe1

    .line 62
    .line 63
    if-eq v4, v5, :cond_b

    .line 64
    .line 65
    const/16 v5, 0x12

    .line 66
    .line 67
    if-ne v4, v5, :cond_5

    .line 68
    .line 69
    goto/16 :goto_4

    .line 70
    .line 71
    :cond_5
    const/16 v3, 0x800

    .line 72
    .line 73
    if-gt v0, v3, :cond_6

    .line 74
    .line 75
    invoke-static {p0, p1, v1, p2}, Lkn1;->l(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_6
    sub-int v0, p2, v1

    .line 80
    .line 81
    const/16 v3, 0x400

    .line 82
    .line 83
    if-le v0, v3, :cond_7

    .line 84
    .line 85
    move v3, v2

    .line 86
    goto :goto_2

    .line 87
    :cond_7
    move v3, v0

    .line 88
    :goto_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    sub-int/2addr v4, p2

    .line 93
    rsub-int v5, v3, 0x800

    .line 94
    .line 95
    const-wide v6, 0x3fe999999999999aL    # 0.8

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    int-to-double v8, v5

    .line 101
    mul-double/2addr v8, v6

    .line 102
    double-to-int v6, v8

    .line 103
    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    sub-int v6, v5, v6

    .line 108
    .line 109
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    sub-int/2addr v5, v4

    .line 114
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    sub-int/2addr v1, v5

    .line 119
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    invoke-static {v6}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_8

    .line 128
    .line 129
    add-int/lit8 v1, v1, 0x1

    .line 130
    .line 131
    add-int/lit8 v5, v5, -0x1

    .line 132
    .line 133
    :cond_8
    add-int v6, p2, v4

    .line 134
    .line 135
    const/4 v7, 0x1

    .line 136
    sub-int/2addr v6, v7

    .line 137
    invoke-interface {p1, v6}, Ljava/lang/CharSequence;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    invoke-static {v6}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-eqz v6, :cond_9

    .line 146
    .line 147
    add-int/lit8 v4, v4, -0x1

    .line 148
    .line 149
    :cond_9
    add-int v6, v5, v3

    .line 150
    .line 151
    add-int v8, v6, v4

    .line 152
    .line 153
    if-eq v3, v0, :cond_a

    .line 154
    .line 155
    add-int v0, v1, v5

    .line 156
    .line 157
    invoke-interface {p1, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    add-int/2addr v4, p2

    .line 162
    invoke-interface {p1, p2, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const/4 p2, 0x2

    .line 167
    new-array p2, p2, [Ljava/lang/CharSequence;

    .line 168
    .line 169
    aput-object v0, p2, v2

    .line 170
    .line 171
    aput-object p1, p2, v7

    .line 172
    .line 173
    invoke-static {p2}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    goto :goto_3

    .line 178
    :cond_a
    add-int/2addr v8, v1

    .line 179
    invoke-interface {p1, v1, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    :goto_3
    invoke-static {p0, p1, v5, v6}, Lkn1;->l(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_b
    :goto_4
    invoke-static {p0, v3, v2, v2}, Lkn1;->l(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_c
    :goto_5
    invoke-static {p0, v3, v2, v2}, Lkn1;->l(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 192
    .line 193
    .line 194
    :cond_d
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;Lqo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lp8;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 12
    .line 13
    invoke-static {p1, p2, p0}, Lw01;->i(Landroid/graphics/drawable/Drawable;Lqo;[I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final b()V
    .locals 6

    .line 1
    iget-object v0, p0, Lp8;->b:Lqo;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lp8;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lp8;->c:Lqo;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lp8;->d:Lqo;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lp8;->e:Lqo;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aget-object v4, v0, v2

    .line 26
    .line 27
    iget-object v5, p0, Lp8;->b:Lqo;

    .line 28
    .line 29
    invoke-virtual {p0, v4, v5}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 30
    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    aget-object v4, v0, v4

    .line 34
    .line 35
    iget-object v5, p0, Lp8;->c:Lqo;

    .line 36
    .line 37
    invoke-virtual {p0, v4, v5}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 38
    .line 39
    .line 40
    aget-object v4, v0, v1

    .line 41
    .line 42
    iget-object v5, p0, Lp8;->d:Lqo;

    .line 43
    .line 44
    invoke-virtual {p0, v4, v5}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    aget-object v0, v0, v4

    .line 49
    .line 50
    iget-object v4, p0, Lp8;->e:Lqo;

    .line 51
    .line 52
    invoke-virtual {p0, v0, v4}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lp8;->f:Lqo;

    .line 56
    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lp8;->g:Lqo;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void

    .line 65
    :cond_3
    :goto_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    aget-object v2, v0, v2

    .line 70
    .line 71
    iget-object v3, p0, Lp8;->f:Lqo;

    .line 72
    .line 73
    invoke-virtual {p0, v2, v3}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 74
    .line 75
    .line 76
    aget-object v0, v0, v1

    .line 77
    .line 78
    iget-object v1, p0, Lp8;->g:Lqo;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v1}, Lp8;->a(Landroid/graphics/drawable/Drawable;Lqo;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final d()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Lp8;->h:Lqo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lqo;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final e()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Lp8;->h:Lqo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lqo;->d:Ljava/io/Serializable;

    .line 6
    .line 7
    check-cast p0, Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final f(Landroid/util/AttributeSet;I)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v3, p1

    .line 4
    .line 5
    move/from16 v5, p2

    .line 6
    .line 7
    iget-object v1, v0, Lp8;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    invoke-static {}, Lj7;->a()Lj7;

    .line 14
    .line 15
    .line 16
    move-result-object v8

    .line 17
    sget-object v2, Lgx0;->h:[I

    .line 18
    .line 19
    invoke-static {v7, v3, v2, v5}, Lc9;->F(Landroid/content/Context;Landroid/util/AttributeSet;[II)Lc9;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    move-object v3, v2

    .line 24
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v4, v9, Lc9;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v4, Landroid/content/res/TypedArray;

    .line 31
    .line 32
    move v6, v5

    .line 33
    move-object v5, v4

    .line 34
    move-object/from16 v4, p1

    .line 35
    .line 36
    invoke-static/range {v1 .. v6}, Lzh1;->h(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;I)V

    .line 37
    .line 38
    .line 39
    move-object v3, v4

    .line 40
    move v5, v6

    .line 41
    move-object v6, v1

    .line 42
    iget-object v1, v9, Lc9;->k:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Landroid/content/res/TypedArray;

    .line 45
    .line 46
    const/4 v10, 0x0

    .line 47
    const/4 v11, -0x1

    .line 48
    invoke-virtual {v1, v10, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/4 v12, 0x3

    .line 53
    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    invoke-virtual {v1, v12, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    invoke-static {v7, v8, v4}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    iput-object v4, v0, Lp8;->b:Lqo;

    .line 68
    .line 69
    :cond_0
    const/4 v13, 0x1

    .line 70
    invoke-virtual {v1, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_1

    .line 75
    .line 76
    invoke-virtual {v1, v13, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    invoke-static {v7, v8, v4}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iput-object v4, v0, Lp8;->c:Lqo;

    .line 85
    .line 86
    :cond_1
    const/4 v14, 0x4

    .line 87
    invoke-virtual {v1, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    invoke-virtual {v1, v14, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-static {v7, v8, v4}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iput-object v4, v0, Lp8;->d:Lqo;

    .line 102
    .line 103
    :cond_2
    const/4 v15, 0x2

    .line 104
    invoke-virtual {v1, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_3

    .line 109
    .line 110
    invoke-virtual {v1, v15, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    invoke-static {v7, v8, v4}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    iput-object v4, v0, Lp8;->e:Lqo;

    .line 119
    .line 120
    :cond_3
    const/4 v4, 0x5

    .line 121
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 122
    .line 123
    .line 124
    move-result v16

    .line 125
    if-eqz v16, :cond_4

    .line 126
    .line 127
    invoke-virtual {v1, v4, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    invoke-static {v7, v8, v12}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    iput-object v12, v0, Lp8;->f:Lqo;

    .line 136
    .line 137
    :cond_4
    const/4 v12, 0x6

    .line 138
    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 139
    .line 140
    .line 141
    move-result v17

    .line 142
    if-eqz v17, :cond_5

    .line 143
    .line 144
    invoke-virtual {v1, v12, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-static {v7, v8, v1}, Lp8;->c(Landroid/content/Context;Lj7;I)Lqo;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iput-object v1, v0, Lp8;->g:Lqo;

    .line 153
    .line 154
    :cond_5
    invoke-virtual {v9}, Lc9;->H()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    instance-of v1, v1, Landroid/text/method/PasswordTransformationMethod;

    .line 162
    .line 163
    const/16 v9, 0x1a

    .line 164
    .line 165
    sget-object v4, Lgx0;->w:[I

    .line 166
    .line 167
    const/16 v12, 0xe

    .line 168
    .line 169
    const/16 v13, 0xd

    .line 170
    .line 171
    const/16 v15, 0xf

    .line 172
    .line 173
    if-eq v2, v11, :cond_9

    .line 174
    .line 175
    new-instance v14, Lc9;

    .line 176
    .line 177
    invoke-virtual {v7, v2, v4}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-direct {v14, v7, v2}, Lc9;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 182
    .line 183
    .line 184
    if-nez v1, :cond_6

    .line 185
    .line 186
    invoke-virtual {v2, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 187
    .line 188
    .line 189
    move-result v20

    .line 190
    if-eqz v20, :cond_6

    .line 191
    .line 192
    invoke-virtual {v2, v12, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 193
    .line 194
    .line 195
    move-result v20

    .line 196
    move/from16 v21, v20

    .line 197
    .line 198
    const/16 v20, 0x1

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_6
    move/from16 v20, v10

    .line 202
    .line 203
    move/from16 v21, v20

    .line 204
    .line 205
    :goto_0
    invoke-virtual {v0, v7, v14}, Lp8;->n(Landroid/content/Context;Lc9;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v2, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 209
    .line 210
    .line 211
    move-result v22

    .line 212
    if-eqz v22, :cond_7

    .line 213
    .line 214
    invoke-virtual {v2, v15}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v22

    .line 218
    goto :goto_1

    .line 219
    :cond_7
    const/16 v22, 0x0

    .line 220
    .line 221
    :goto_1
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 222
    .line 223
    if-lt v11, v9, :cond_8

    .line 224
    .line 225
    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 226
    .line 227
    .line 228
    move-result v11

    .line 229
    if-eqz v11, :cond_8

    .line 230
    .line 231
    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    goto :goto_2

    .line 236
    :cond_8
    const/4 v2, 0x0

    .line 237
    :goto_2
    invoke-virtual {v14}, Lc9;->H()V

    .line 238
    .line 239
    .line 240
    goto :goto_3

    .line 241
    :cond_9
    move/from16 v20, v10

    .line 242
    .line 243
    move/from16 v21, v20

    .line 244
    .line 245
    const/4 v2, 0x0

    .line 246
    const/16 v22, 0x0

    .line 247
    .line 248
    :goto_3
    new-instance v11, Lc9;

    .line 249
    .line 250
    invoke-virtual {v7, v3, v4, v5, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    invoke-direct {v11, v7, v4}, Lc9;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 255
    .line 256
    .line 257
    if-nez v1, :cond_a

    .line 258
    .line 259
    invoke-virtual {v4, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 260
    .line 261
    .line 262
    move-result v14

    .line 263
    if-eqz v14, :cond_a

    .line 264
    .line 265
    invoke-virtual {v4, v12, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 266
    .line 267
    .line 268
    move-result v21

    .line 269
    const/16 v20, 0x1

    .line 270
    .line 271
    :cond_a
    move/from16 v12, v21

    .line 272
    .line 273
    invoke-virtual {v4, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 274
    .line 275
    .line 276
    move-result v14

    .line 277
    if-eqz v14, :cond_b

    .line 278
    .line 279
    invoke-virtual {v4, v15}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v22

    .line 283
    :cond_b
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 284
    .line 285
    if-lt v14, v9, :cond_c

    .line 286
    .line 287
    invoke-virtual {v4, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 288
    .line 289
    .line 290
    move-result v9

    .line 291
    if-eqz v9, :cond_c

    .line 292
    .line 293
    invoke-virtual {v4, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    :cond_c
    const/16 v9, 0x1c

    .line 298
    .line 299
    if-lt v14, v9, :cond_d

    .line 300
    .line 301
    invoke-virtual {v4, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 302
    .line 303
    .line 304
    move-result v9

    .line 305
    if-eqz v9, :cond_d

    .line 306
    .line 307
    const/4 v9, -0x1

    .line 308
    invoke-virtual {v4, v10, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    if-nez v4, :cond_d

    .line 313
    .line 314
    const/4 v4, 0x0

    .line 315
    invoke-virtual {v6, v10, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 316
    .line 317
    .line 318
    :cond_d
    invoke-virtual {v0, v7, v11}, Lp8;->n(Landroid/content/Context;Lc9;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v11}, Lc9;->H()V

    .line 322
    .line 323
    .line 324
    if-nez v1, :cond_e

    .line 325
    .line 326
    if-eqz v20, :cond_e

    .line 327
    .line 328
    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 329
    .line 330
    .line 331
    :cond_e
    iget-object v1, v0, Lp8;->l:Landroid/graphics/Typeface;

    .line 332
    .line 333
    if-eqz v1, :cond_10

    .line 334
    .line 335
    iget v4, v0, Lp8;->k:I

    .line 336
    .line 337
    const/4 v9, -0x1

    .line 338
    if-ne v4, v9, :cond_f

    .line 339
    .line 340
    iget v4, v0, Lp8;->j:I

    .line 341
    .line 342
    invoke-virtual {v6, v1, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 343
    .line 344
    .line 345
    goto :goto_4

    .line 346
    :cond_f
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 347
    .line 348
    .line 349
    :cond_10
    :goto_4
    if-eqz v2, :cond_11

    .line 350
    .line 351
    invoke-static {v6, v2}, Ln8;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 352
    .line 353
    .line 354
    :cond_11
    if-eqz v22, :cond_12

    .line 355
    .line 356
    invoke-static/range {v22 .. v22}, Lm8;->a(Ljava/lang/String;)Landroid/os/LocaleList;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-static {v6, v1}, Lm8;->b(Landroid/widget/TextView;Landroid/os/LocaleList;)V

    .line 361
    .line 362
    .line 363
    :cond_12
    iget-object v9, v0, Lp8;->i:Ly8;

    .line 364
    .line 365
    iget-object v11, v9, Ly8;->j:Landroid/content/Context;

    .line 366
    .line 367
    sget-object v2, Lgx0;->i:[I

    .line 368
    .line 369
    invoke-virtual {v11, v3, v2, v5, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 370
    .line 371
    .line 372
    move-result-object v4

    .line 373
    iget-object v0, v9, Ly8;->i:Landroid/widget/TextView;

    .line 374
    .line 375
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    const/4 v12, 0x5

    .line 380
    invoke-static/range {v0 .. v5}, Lzh1;->h(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;I)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v4, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    if-eqz v0, :cond_13

    .line 388
    .line 389
    invoke-virtual {v4, v12, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    iput v0, v9, Ly8;->a:I

    .line 394
    .line 395
    :cond_13
    const/4 v0, 0x4

    .line 396
    invoke-virtual {v4, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 397
    .line 398
    .line 399
    move-result v1

    .line 400
    const/high16 v5, -0x40800000    # -1.0f

    .line 401
    .line 402
    if-eqz v1, :cond_14

    .line 403
    .line 404
    invoke-virtual {v4, v0, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    :goto_5
    const/4 v1, 0x2

    .line 409
    goto :goto_6

    .line 410
    :cond_14
    move v0, v5

    .line 411
    goto :goto_5

    .line 412
    :goto_6
    invoke-virtual {v4, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 413
    .line 414
    .line 415
    move-result v14

    .line 416
    if-eqz v14, :cond_15

    .line 417
    .line 418
    invoke-virtual {v4, v1, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 419
    .line 420
    .line 421
    move-result v14

    .line 422
    :goto_7
    const/4 v1, 0x1

    .line 423
    goto :goto_8

    .line 424
    :cond_15
    move v14, v5

    .line 425
    goto :goto_7

    .line 426
    :goto_8
    invoke-virtual {v4, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 427
    .line 428
    .line 429
    move-result v17

    .line 430
    if-eqz v17, :cond_16

    .line 431
    .line 432
    invoke-virtual {v4, v1, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 433
    .line 434
    .line 435
    move-result v17

    .line 436
    :goto_9
    const/4 v1, 0x3

    .line 437
    goto :goto_a

    .line 438
    :cond_16
    move/from16 v17, v5

    .line 439
    .line 440
    goto :goto_9

    .line 441
    :goto_a
    invoke-virtual {v4, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 442
    .line 443
    .line 444
    move-result v16

    .line 445
    move/from16 p0, v5

    .line 446
    .line 447
    if-eqz v16, :cond_19

    .line 448
    .line 449
    invoke-virtual {v4, v1, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 450
    .line 451
    .line 452
    move-result v5

    .line 453
    if-lez v5, :cond_19

    .line 454
    .line 455
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->length()I

    .line 464
    .line 465
    .line 466
    move-result v5

    .line 467
    new-array v12, v5, [I

    .line 468
    .line 469
    if-lez v5, :cond_18

    .line 470
    .line 471
    move v15, v10

    .line 472
    :goto_b
    if-ge v15, v5, :cond_17

    .line 473
    .line 474
    const/4 v13, -0x1

    .line 475
    invoke-virtual {v1, v15, v13}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 476
    .line 477
    .line 478
    move-result v22

    .line 479
    aput v22, v12, v15

    .line 480
    .line 481
    add-int/lit8 v15, v15, 0x1

    .line 482
    .line 483
    const/16 v13, 0xd

    .line 484
    .line 485
    goto :goto_b

    .line 486
    :cond_17
    invoke-static {v12}, Ly8;->b([I)[I

    .line 487
    .line 488
    .line 489
    move-result-object v5

    .line 490
    iput-object v5, v9, Ly8;->f:[I

    .line 491
    .line 492
    invoke-virtual {v9}, Ly8;->h()Z

    .line 493
    .line 494
    .line 495
    :cond_18
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 496
    .line 497
    .line 498
    :cond_19
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v9}, Ly8;->i()Z

    .line 502
    .line 503
    .line 504
    move-result v1

    .line 505
    if-eqz v1, :cond_1e

    .line 506
    .line 507
    iget v1, v9, Ly8;->a:I

    .line 508
    .line 509
    const/4 v4, 0x1

    .line 510
    if-ne v1, v4, :cond_1f

    .line 511
    .line 512
    iget-boolean v1, v9, Ly8;->g:Z

    .line 513
    .line 514
    if-nez v1, :cond_1d

    .line 515
    .line 516
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 521
    .line 522
    .line 523
    move-result-object v1

    .line 524
    cmpl-float v4, v14, p0

    .line 525
    .line 526
    if-nez v4, :cond_1a

    .line 527
    .line 528
    const/high16 v4, 0x41400000    # 12.0f

    .line 529
    .line 530
    const/4 v5, 0x2

    .line 531
    invoke-static {v5, v4, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 532
    .line 533
    .line 534
    move-result v14

    .line 535
    goto :goto_c

    .line 536
    :cond_1a
    const/4 v5, 0x2

    .line 537
    :goto_c
    cmpl-float v4, v17, p0

    .line 538
    .line 539
    if-nez v4, :cond_1b

    .line 540
    .line 541
    const/high16 v4, 0x42e00000    # 112.0f

    .line 542
    .line 543
    invoke-static {v5, v4, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 544
    .line 545
    .line 546
    move-result v17

    .line 547
    :cond_1b
    move/from16 v1, v17

    .line 548
    .line 549
    cmpl-float v4, v0, p0

    .line 550
    .line 551
    if-nez v4, :cond_1c

    .line 552
    .line 553
    const/high16 v0, 0x3f800000    # 1.0f

    .line 554
    .line 555
    :cond_1c
    invoke-virtual {v9, v14, v1, v0}, Ly8;->j(FFF)V

    .line 556
    .line 557
    .line 558
    :cond_1d
    invoke-virtual {v9}, Ly8;->g()Z

    .line 559
    .line 560
    .line 561
    goto :goto_d

    .line 562
    :cond_1e
    iput v10, v9, Ly8;->a:I

    .line 563
    .line 564
    :cond_1f
    :goto_d
    sget-boolean v0, Lri1;->c:Z

    .line 565
    .line 566
    if-eqz v0, :cond_21

    .line 567
    .line 568
    iget v0, v9, Ly8;->a:I

    .line 569
    .line 570
    if-eqz v0, :cond_21

    .line 571
    .line 572
    iget-object v0, v9, Ly8;->f:[I

    .line 573
    .line 574
    array-length v1, v0

    .line 575
    if-lez v1, :cond_21

    .line 576
    .line 577
    invoke-static {v6}, Ln8;->a(Landroid/widget/TextView;)I

    .line 578
    .line 579
    .line 580
    move-result v1

    .line 581
    int-to-float v1, v1

    .line 582
    cmpl-float v1, v1, p0

    .line 583
    .line 584
    if-eqz v1, :cond_20

    .line 585
    .line 586
    iget v0, v9, Ly8;->d:F

    .line 587
    .line 588
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 589
    .line 590
    .line 591
    move-result v0

    .line 592
    iget v1, v9, Ly8;->e:F

    .line 593
    .line 594
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 595
    .line 596
    .line 597
    move-result v1

    .line 598
    iget v4, v9, Ly8;->c:F

    .line 599
    .line 600
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 601
    .line 602
    .line 603
    move-result v4

    .line 604
    invoke-static {v6, v0, v1, v4, v10}, Ln8;->b(Landroid/widget/TextView;IIII)V

    .line 605
    .line 606
    .line 607
    goto :goto_e

    .line 608
    :cond_20
    invoke-static {v6, v0, v10}, Ln8;->c(Landroid/widget/TextView;[II)V

    .line 609
    .line 610
    .line 611
    :cond_21
    :goto_e
    invoke-virtual {v7, v3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    const/16 v1, 0x8

    .line 616
    .line 617
    const/4 v9, -0x1

    .line 618
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 619
    .line 620
    .line 621
    move-result v1

    .line 622
    if-eq v1, v9, :cond_22

    .line 623
    .line 624
    invoke-virtual {v8, v7, v1}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    :goto_f
    const/16 v2, 0xd

    .line 629
    .line 630
    goto :goto_10

    .line 631
    :cond_22
    const/4 v1, 0x0

    .line 632
    goto :goto_f

    .line 633
    :goto_10
    invoke-virtual {v0, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 634
    .line 635
    .line 636
    move-result v2

    .line 637
    if-eq v2, v9, :cond_23

    .line 638
    .line 639
    invoke-virtual {v8, v7, v2}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    goto :goto_11

    .line 644
    :cond_23
    const/4 v2, 0x0

    .line 645
    :goto_11
    const/16 v3, 0x9

    .line 646
    .line 647
    invoke-virtual {v0, v3, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 648
    .line 649
    .line 650
    move-result v3

    .line 651
    if-eq v3, v9, :cond_24

    .line 652
    .line 653
    invoke-virtual {v8, v7, v3}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 654
    .line 655
    .line 656
    move-result-object v3

    .line 657
    :goto_12
    const/4 v4, 0x6

    .line 658
    goto :goto_13

    .line 659
    :cond_24
    const/4 v3, 0x0

    .line 660
    goto :goto_12

    .line 661
    :goto_13
    invoke-virtual {v0, v4, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 662
    .line 663
    .line 664
    move-result v4

    .line 665
    if-eq v4, v9, :cond_25

    .line 666
    .line 667
    invoke-virtual {v8, v7, v4}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 668
    .line 669
    .line 670
    move-result-object v4

    .line 671
    goto :goto_14

    .line 672
    :cond_25
    const/4 v4, 0x0

    .line 673
    :goto_14
    const/16 v5, 0xa

    .line 674
    .line 675
    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 676
    .line 677
    .line 678
    move-result v5

    .line 679
    if-eq v5, v9, :cond_26

    .line 680
    .line 681
    invoke-virtual {v8, v7, v5}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 682
    .line 683
    .line 684
    move-result-object v5

    .line 685
    goto :goto_15

    .line 686
    :cond_26
    const/4 v5, 0x0

    .line 687
    :goto_15
    const/4 v11, 0x7

    .line 688
    invoke-virtual {v0, v11, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 689
    .line 690
    .line 691
    move-result v11

    .line 692
    if-eq v11, v9, :cond_27

    .line 693
    .line 694
    invoke-virtual {v8, v7, v11}, Lj7;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 695
    .line 696
    .line 697
    move-result-object v8

    .line 698
    goto :goto_16

    .line 699
    :cond_27
    const/4 v8, 0x0

    .line 700
    :goto_16
    if-nez v5, :cond_32

    .line 701
    .line 702
    if-eqz v8, :cond_28

    .line 703
    .line 704
    goto :goto_1f

    .line 705
    :cond_28
    if-nez v1, :cond_29

    .line 706
    .line 707
    if-nez v2, :cond_29

    .line 708
    .line 709
    if-nez v3, :cond_29

    .line 710
    .line 711
    if-eqz v4, :cond_37

    .line 712
    .line 713
    :cond_29
    invoke-virtual {v6}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 714
    .line 715
    .line 716
    move-result-object v5

    .line 717
    aget-object v8, v5, v10

    .line 718
    .line 719
    if-nez v8, :cond_2a

    .line 720
    .line 721
    const/16 v19, 0x2

    .line 722
    .line 723
    aget-object v9, v5, v19

    .line 724
    .line 725
    if-eqz v9, :cond_2b

    .line 726
    .line 727
    :cond_2a
    const/16 v16, 0x3

    .line 728
    .line 729
    goto :goto_1b

    .line 730
    :cond_2b
    invoke-virtual {v6}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 731
    .line 732
    .line 733
    move-result-object v5

    .line 734
    if-eqz v1, :cond_2c

    .line 735
    .line 736
    goto :goto_17

    .line 737
    :cond_2c
    aget-object v1, v5, v10

    .line 738
    .line 739
    :goto_17
    if-eqz v2, :cond_2d

    .line 740
    .line 741
    goto :goto_18

    .line 742
    :cond_2d
    const/16 v18, 0x1

    .line 743
    .line 744
    aget-object v2, v5, v18

    .line 745
    .line 746
    :goto_18
    if-eqz v3, :cond_2e

    .line 747
    .line 748
    goto :goto_19

    .line 749
    :cond_2e
    const/16 v19, 0x2

    .line 750
    .line 751
    aget-object v3, v5, v19

    .line 752
    .line 753
    :goto_19
    if-eqz v4, :cond_2f

    .line 754
    .line 755
    goto :goto_1a

    .line 756
    :cond_2f
    const/16 v16, 0x3

    .line 757
    .line 758
    aget-object v4, v5, v16

    .line 759
    .line 760
    :goto_1a
    invoke-virtual {v6, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 761
    .line 762
    .line 763
    goto :goto_24

    .line 764
    :goto_1b
    if-eqz v2, :cond_30

    .line 765
    .line 766
    goto :goto_1c

    .line 767
    :cond_30
    const/16 v18, 0x1

    .line 768
    .line 769
    aget-object v2, v5, v18

    .line 770
    .line 771
    :goto_1c
    if-eqz v4, :cond_31

    .line 772
    .line 773
    :goto_1d
    const/16 v19, 0x2

    .line 774
    .line 775
    goto :goto_1e

    .line 776
    :cond_31
    aget-object v4, v5, v16

    .line 777
    .line 778
    goto :goto_1d

    .line 779
    :goto_1e
    aget-object v1, v5, v19

    .line 780
    .line 781
    invoke-virtual {v6, v8, v2, v1, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 782
    .line 783
    .line 784
    goto :goto_24

    .line 785
    :cond_32
    :goto_1f
    invoke-virtual {v6}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 786
    .line 787
    .line 788
    move-result-object v1

    .line 789
    if-eqz v5, :cond_33

    .line 790
    .line 791
    goto :goto_20

    .line 792
    :cond_33
    aget-object v5, v1, v10

    .line 793
    .line 794
    :goto_20
    if-eqz v2, :cond_34

    .line 795
    .line 796
    goto :goto_21

    .line 797
    :cond_34
    const/16 v18, 0x1

    .line 798
    .line 799
    aget-object v2, v1, v18

    .line 800
    .line 801
    :goto_21
    if-eqz v8, :cond_35

    .line 802
    .line 803
    goto :goto_22

    .line 804
    :cond_35
    const/16 v19, 0x2

    .line 805
    .line 806
    aget-object v8, v1, v19

    .line 807
    .line 808
    :goto_22
    if-eqz v4, :cond_36

    .line 809
    .line 810
    goto :goto_23

    .line 811
    :cond_36
    const/16 v16, 0x3

    .line 812
    .line 813
    aget-object v4, v1, v16

    .line 814
    .line 815
    :goto_23
    invoke-virtual {v6, v5, v2, v8, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 816
    .line 817
    .line 818
    :cond_37
    :goto_24
    const/16 v1, 0xb

    .line 819
    .line 820
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 821
    .line 822
    .line 823
    move-result v2

    .line 824
    if-eqz v2, :cond_39

    .line 825
    .line 826
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 827
    .line 828
    .line 829
    move-result v2

    .line 830
    if-eqz v2, :cond_38

    .line 831
    .line 832
    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 833
    .line 834
    .line 835
    move-result v2

    .line 836
    if-eqz v2, :cond_38

    .line 837
    .line 838
    invoke-static {v7, v2}, Lbh;->p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 839
    .line 840
    .line 841
    move-result-object v2

    .line 842
    if-eqz v2, :cond_38

    .line 843
    .line 844
    goto :goto_25

    .line 845
    :cond_38
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 846
    .line 847
    .line 848
    move-result-object v2

    .line 849
    :goto_25
    invoke-static {v6, v2}, Lub1;->f(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 850
    .line 851
    .line 852
    :cond_39
    const/16 v1, 0xc

    .line 853
    .line 854
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 855
    .line 856
    .line 857
    move-result v2

    .line 858
    const/4 v9, -0x1

    .line 859
    if-eqz v2, :cond_3a

    .line 860
    .line 861
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 862
    .line 863
    .line 864
    move-result v1

    .line 865
    const/4 v2, 0x0

    .line 866
    invoke-static {v1, v2}, Lsy;->c(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 867
    .line 868
    .line 869
    move-result-object v1

    .line 870
    invoke-static {v6, v1}, Lub1;->g(Landroid/widget/TextView;Landroid/graphics/PorterDuff$Mode;)V

    .line 871
    .line 872
    .line 873
    :cond_3a
    const/16 v1, 0xf

    .line 874
    .line 875
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 876
    .line 877
    .line 878
    move-result v1

    .line 879
    const/16 v2, 0x12

    .line 880
    .line 881
    invoke-virtual {v0, v2, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 882
    .line 883
    .line 884
    move-result v2

    .line 885
    const/16 v3, 0x13

    .line 886
    .line 887
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 888
    .line 889
    .line 890
    move-result v4

    .line 891
    if-eqz v4, :cond_3c

    .line 892
    .line 893
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 894
    .line 895
    .line 896
    move-result-object v4

    .line 897
    if-eqz v4, :cond_3b

    .line 898
    .line 899
    iget v5, v4, Landroid/util/TypedValue;->type:I

    .line 900
    .line 901
    const/4 v12, 0x5

    .line 902
    if-ne v5, v12, :cond_3b

    .line 903
    .line 904
    iget v3, v4, Landroid/util/TypedValue;->data:I

    .line 905
    .line 906
    and-int/lit8 v9, v3, 0xf

    .line 907
    .line 908
    invoke-static {v3}, Landroid/util/TypedValue;->complexToFloat(I)F

    .line 909
    .line 910
    .line 911
    move-result v3

    .line 912
    move v4, v9

    .line 913
    const/4 v9, -0x1

    .line 914
    goto :goto_27

    .line 915
    :cond_3b
    const/4 v9, -0x1

    .line 916
    invoke-virtual {v0, v3, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 917
    .line 918
    .line 919
    move-result v3

    .line 920
    int-to-float v3, v3

    .line 921
    :goto_26
    move v4, v9

    .line 922
    goto :goto_27

    .line 923
    :cond_3c
    const/4 v9, -0x1

    .line 924
    move/from16 v3, p0

    .line 925
    .line 926
    goto :goto_26

    .line 927
    :goto_27
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 928
    .line 929
    .line 930
    if-eq v1, v9, :cond_3d

    .line 931
    .line 932
    invoke-static {v6, v1}, Lst;->q(Landroid/widget/TextView;I)V

    .line 933
    .line 934
    .line 935
    :cond_3d
    if-eq v2, v9, :cond_3e

    .line 936
    .line 937
    invoke-static {v6, v2}, Lst;->r(Landroid/widget/TextView;I)V

    .line 938
    .line 939
    .line 940
    :cond_3e
    cmpl-float v0, v3, p0

    .line 941
    .line 942
    if-eqz v0, :cond_41

    .line 943
    .line 944
    if-ne v4, v9, :cond_3f

    .line 945
    .line 946
    float-to-int v0, v3

    .line 947
    invoke-static {v6, v0}, Lst;->s(Landroid/widget/TextView;I)V

    .line 948
    .line 949
    .line 950
    return-void

    .line 951
    :cond_3f
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 952
    .line 953
    const/16 v1, 0x22

    .line 954
    .line 955
    if-lt v0, v1, :cond_40

    .line 956
    .line 957
    invoke-static {v6, v4, v3}, Lxb1;->a(Landroid/widget/TextView;IF)V

    .line 958
    .line 959
    .line 960
    return-void

    .line 961
    :cond_40
    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 962
    .line 963
    .line 964
    move-result-object v0

    .line 965
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 966
    .line 967
    .line 968
    move-result-object v0

    .line 969
    invoke-static {v4, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 970
    .line 971
    .line 972
    move-result v0

    .line 973
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 974
    .line 975
    .line 976
    move-result v0

    .line 977
    invoke-static {v6, v0}, Lst;->s(Landroid/widget/TextView;I)V

    .line 978
    .line 979
    .line 980
    :cond_41
    return-void
.end method

.method public final g(Landroid/content/Context;I)V
    .locals 5

    .line 1
    new-instance v0, Lc9;

    .line 2
    .line 3
    sget-object v1, Lgx0;->w:[I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {v0, p1, p2}, Lc9;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0xe

    .line 13
    .line 14
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x0

    .line 19
    iget-object v4, p0, Lp8;->a:Landroid/widget/TextView;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v4, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0, p1, v0}, Lp8;->n(Landroid/content/Context;Lc9;)V

    .line 48
    .line 49
    .line 50
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 51
    .line 52
    const/16 v1, 0x1a

    .line 53
    .line 54
    if-lt p1, v1, :cond_2

    .line 55
    .line 56
    const/16 p1, 0xd

    .line 57
    .line 58
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-static {v4, p1}, Ln8;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-virtual {v0}, Lc9;->H()V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    iget p0, p0, Lp8;->j:I

    .line 81
    .line 82
    invoke-virtual {v4, p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public final i(IIII)V
    .locals 1

    .line 1
    iget-object p0, p0, Lp8;->i:Ly8;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly8;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ly8;->j:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    int-to-float p1, p1

    .line 20
    invoke-static {p4, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    int-to-float p2, p2

    .line 25
    invoke-static {p4, p2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    int-to-float p3, p3

    .line 30
    invoke-static {p4, p3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    invoke-virtual {p0, p1, p2, p3}, Ly8;->j(FFF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ly8;->g()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ly8;->a()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final j([II)V
    .locals 5

    .line 1
    iget-object p0, p0, Lp8;->i:Ly8;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly8;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-lez v0, :cond_3

    .line 12
    .line 13
    new-array v2, v0, [I

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v3, p0, Ly8;->j:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    :goto_0
    if-ge v1, v0, :cond_1

    .line 33
    .line 34
    aget v4, p1, v1

    .line 35
    .line 36
    int-to-float v4, v4

    .line 37
    invoke-static {p2, v4, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    aput v4, v2, v1

    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    :goto_1
    invoke-static {v2}, Ly8;->b([I)[I

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, p0, Ly8;->f:[I

    .line 55
    .line 56
    invoke-virtual {p0}, Ly8;->h()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 64
    .line 65
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance p2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v0, "None of the preset sizes is valid: "

    .line 72
    .line 73
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0

    .line 87
    :cond_3
    iput-boolean v1, p0, Ly8;->g:Z

    .line 88
    .line 89
    :goto_2
    invoke-virtual {p0}, Ly8;->g()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    invoke-virtual {p0}, Ly8;->a()V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-void
.end method

.method public final k(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Lp8;->i:Ly8;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly8;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ly8;->j:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/high16 v0, 0x41400000    # 12.0f

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-static {v1, v0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/high16 v2, 0x42e00000    # 112.0f

    .line 32
    .line 33
    invoke-static {v1, v2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/high16 v1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1, v1}, Ly8;->j(FFF)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ly8;->g()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Ly8;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const-string p0, "Unknown auto-size text type: "

    .line 53
    .line 54
    invoke-static {p1, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    const/4 p1, 0x0

    .line 63
    iput p1, p0, Ly8;->a:I

    .line 64
    .line 65
    const/high16 v0, -0x40800000    # -1.0f

    .line 66
    .line 67
    iput v0, p0, Ly8;->d:F

    .line 68
    .line 69
    iput v0, p0, Ly8;->e:F

    .line 70
    .line 71
    iput v0, p0, Ly8;->c:F

    .line 72
    .line 73
    new-array v0, p1, [I

    .line 74
    .line 75
    iput-object v0, p0, Ly8;->f:[I

    .line 76
    .line 77
    iput-boolean p1, p0, Ly8;->b:Z

    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public final l(Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lp8;->h:Lqo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lqo;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lp8;->h:Lqo;

    .line 11
    .line 12
    :cond_0
    move-object v1, v0

    .line 13
    iput-object p1, v0, Lqo;->c:Ljava/lang/Object;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    :goto_0
    iput-boolean p1, v0, Lqo;->b:Z

    .line 21
    .line 22
    iput-object v1, p0, Lp8;->b:Lqo;

    .line 23
    .line 24
    iput-object v1, p0, Lp8;->c:Lqo;

    .line 25
    .line 26
    iput-object v1, p0, Lp8;->d:Lqo;

    .line 27
    .line 28
    iput-object v1, p0, Lp8;->e:Lqo;

    .line 29
    .line 30
    iput-object v1, p0, Lp8;->f:Lqo;

    .line 31
    .line 32
    iput-object v1, p0, Lp8;->g:Lqo;

    .line 33
    .line 34
    return-void
.end method

.method public final m(Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lp8;->h:Lqo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lqo;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lp8;->h:Lqo;

    .line 11
    .line 12
    :cond_0
    move-object v1, v0

    .line 13
    iput-object p1, v0, Lqo;->d:Ljava/io/Serializable;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    :goto_0
    iput-boolean p1, v0, Lqo;->a:Z

    .line 21
    .line 22
    iput-object v1, p0, Lp8;->b:Lqo;

    .line 23
    .line 24
    iput-object v1, p0, Lp8;->c:Lqo;

    .line 25
    .line 26
    iput-object v1, p0, Lp8;->d:Lqo;

    .line 27
    .line 28
    iput-object v1, p0, Lp8;->e:Lqo;

    .line 29
    .line 30
    iput-object v1, p0, Lp8;->f:Lqo;

    .line 31
    .line 32
    iput-object v1, p0, Lp8;->g:Lqo;

    .line 33
    .line 34
    return-void
.end method

.method public final n(Landroid/content/Context;Lc9;)V
    .locals 11

    .line 1
    iget v0, p0, Lp8;->j:I

    .line 2
    .line 3
    iget-object v1, p2, Lc9;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Landroid/content/res/TypedArray;

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lp8;->j:I

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/4 v3, -0x1

    .line 17
    const/16 v4, 0x1c

    .line 18
    .line 19
    if-lt v0, v4, :cond_0

    .line 20
    .line 21
    const/16 v5, 0xb

    .line 22
    .line 23
    invoke-virtual {v1, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    iput v5, p0, Lp8;->k:I

    .line 28
    .line 29
    if-eq v5, v3, :cond_0

    .line 30
    .line 31
    iget v5, p0, Lp8;->j:I

    .line 32
    .line 33
    and-int/2addr v5, v2

    .line 34
    iput v5, p0, Lp8;->j:I

    .line 35
    .line 36
    :cond_0
    const/16 v5, 0xa

    .line 37
    .line 38
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v7, 0x1

    .line 43
    const/16 v8, 0xc

    .line 44
    .line 45
    const/4 v9, 0x0

    .line 46
    if-nez v6, :cond_5

    .line 47
    .line 48
    invoke-virtual {v1, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-eqz v6, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_e

    .line 60
    .line 61
    iput-boolean v9, p0, Lp8;->m:Z

    .line 62
    .line 63
    invoke-virtual {v1, v7, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eq p1, v7, :cond_4

    .line 68
    .line 69
    if-eq p1, v2, :cond_3

    .line 70
    .line 71
    const/4 p2, 0x3

    .line 72
    if-eq p1, p2, :cond_2

    .line 73
    .line 74
    goto/16 :goto_5

    .line 75
    .line 76
    :cond_2
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 77
    .line 78
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 82
    .line 83
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 87
    .line 88
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 89
    .line 90
    return-void

    .line 91
    :cond_5
    :goto_0
    const/4 v6, 0x0

    .line 92
    iput-object v6, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 93
    .line 94
    invoke-virtual {v1, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-eqz v6, :cond_6

    .line 99
    .line 100
    move v5, v8

    .line 101
    :cond_6
    iget v6, p0, Lp8;->k:I

    .line 102
    .line 103
    iget v8, p0, Lp8;->j:I

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-nez p1, :cond_b

    .line 110
    .line 111
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 112
    .line 113
    iget-object v10, p0, Lp8;->a:Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-direct {p1, v10}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    new-instance v10, Lk8;

    .line 119
    .line 120
    invoke-direct {v10, p0, v6, v8, p1}, Lk8;-><init>(Lp8;IILjava/lang/ref/WeakReference;)V

    .line 121
    .line 122
    .line 123
    :try_start_0
    iget p1, p0, Lp8;->j:I

    .line 124
    .line 125
    invoke-virtual {p2, v5, p1, v10}, Lc9;->v(IILk8;)Landroid/graphics/Typeface;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    if-eqz p1, :cond_9

    .line 130
    .line 131
    if-lt v0, v4, :cond_8

    .line 132
    .line 133
    iget p2, p0, Lp8;->k:I

    .line 134
    .line 135
    if-eq p2, v3, :cond_8

    .line 136
    .line 137
    invoke-static {p1, v9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget p2, p0, Lp8;->k:I

    .line 142
    .line 143
    iget v0, p0, Lp8;->j:I

    .line 144
    .line 145
    and-int/2addr v0, v2

    .line 146
    if-eqz v0, :cond_7

    .line 147
    .line 148
    move v0, v7

    .line 149
    goto :goto_1

    .line 150
    :cond_7
    move v0, v9

    .line 151
    :goto_1
    invoke-static {p1, p2, v0}, Lo8;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_8
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 159
    .line 160
    :cond_9
    :goto_2
    iget-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 161
    .line 162
    if-nez p1, :cond_a

    .line 163
    .line 164
    move p1, v7

    .line 165
    goto :goto_3

    .line 166
    :cond_a
    move p1, v9

    .line 167
    :goto_3
    iput-boolean p1, p0, Lp8;->m:Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    :catch_0
    :cond_b
    iget-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 170
    .line 171
    if-nez p1, :cond_e

    .line 172
    .line 173
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    if-eqz p1, :cond_e

    .line 178
    .line 179
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 180
    .line 181
    if-lt p2, v4, :cond_d

    .line 182
    .line 183
    iget p2, p0, Lp8;->k:I

    .line 184
    .line 185
    if-eq p2, v3, :cond_d

    .line 186
    .line 187
    invoke-static {p1, v9}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget p2, p0, Lp8;->k:I

    .line 192
    .line 193
    iget v0, p0, Lp8;->j:I

    .line 194
    .line 195
    and-int/2addr v0, v2

    .line 196
    if-eqz v0, :cond_c

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_c
    move v7, v9

    .line 200
    :goto_4
    invoke-static {p1, p2, v7}, Lo8;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_d
    iget p2, p0, Lp8;->j:I

    .line 208
    .line 209
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lp8;->l:Landroid/graphics/Typeface;

    .line 214
    .line 215
    :cond_e
    :goto_5
    return-void
.end method
