.class public final Lq5;
.super Lpg1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# instance fields
.field public final k:Lo5;

.field public final l:Landroid/content/Context;

.field public m:Lh2;

.field public n:Ljava/util/ArrayList;

.field public final o:Ln5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lq5;->m:Lh2;

    .line 6
    .line 7
    iput-object v0, p0, Lq5;->n:Ljava/util/ArrayList;

    .line 8
    .line 9
    new-instance v0, Ln5;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ln5;-><init>(Lq5;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lq5;->o:Ln5;

    .line 15
    .line 16
    iput-object p1, p0, Lq5;->l:Landroid/content/Context;

    .line 17
    .line 18
    new-instance p1, Lo5;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lq5;->k:Lo5;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final applyTheme(Landroid/content/res/Resources$Theme;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Loy;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources$Theme;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final canApplyTheme()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Loy;->b(Landroid/graphics/drawable/Drawable;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object v1, v0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lyg1;->draw(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, v0, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final getAlpha()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->getAlpha()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final getChangingConfigurations()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    return v0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Loy;->c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lp5;

    .line 6
    .line 7
    iget-object p0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Lp5;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final getIntrinsicHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->getIntrinsicHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final getIntrinsicWidth()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->getIntrinsicWidth()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final getOpacity()I
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->getOpacity()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 214
    invoke-virtual {p0, p1, p2, p3, v0}, Lq5;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public final inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1, p2, p3, p4}, Loy;->d(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    add-int/2addr v1, v2

    .line 19
    :goto_0
    iget-object v3, p0, Lq5;->k:Lo5;

    .line 20
    .line 21
    if-eq v0, v2, :cond_9

    .line 22
    .line 23
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-ge v4, v1, :cond_1

    .line 28
    .line 29
    const/4 v4, 0x3

    .line 30
    if-eq v0, v4, :cond_9

    .line 31
    .line 32
    :cond_1
    const/4 v4, 0x2

    .line 33
    if-ne v0, v4, :cond_8

    .line 34
    .line 35
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v4, "animated-vector"

    .line 40
    .line 41
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/4 v5, 0x0

    .line 46
    const/4 v6, 0x0

    .line 47
    if-eqz v4, :cond_4

    .line 48
    .line 49
    sget-object v0, Lxg;->e:[I

    .line 50
    .line 51
    invoke-static {p1, p4, p3, v0}, Les0;->j(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, v6, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_3

    .line 60
    .line 61
    new-instance v7, Lyg1;

    .line 62
    .line 63
    invoke-direct {v7}, Lyg1;-><init>()V

    .line 64
    .line 65
    .line 66
    sget-object v8, Lc11;->a:Ljava/lang/ThreadLocal;

    .line 67
    .line 68
    invoke-static {p1, v4, p4}, Lx01;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    iput-object v4, v7, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    new-instance v4, Lxg1;

    .line 75
    .line 76
    iget-object v8, v7, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-direct {v4, v8}, Lxg1;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 83
    .line 84
    .line 85
    iput-boolean v6, v7, Lyg1;->o:Z

    .line 86
    .line 87
    iget-object v4, p0, Lq5;->o:Ln5;

    .line 88
    .line 89
    invoke-virtual {v7, v4}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 90
    .line 91
    .line 92
    iget-object v4, v3, Lo5;->a:Lyg1;

    .line 93
    .line 94
    if-eqz v4, :cond_2

    .line 95
    .line 96
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    iput-object v7, v3, Lo5;->a:Lyg1;

    .line 100
    .line 101
    :cond_3
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    const-string v4, "target"

    .line 106
    .line 107
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_8

    .line 112
    .line 113
    sget-object v0, Lxg;->f:[I

    .line 114
    .line 115
    invoke-virtual {p1, p3, v0}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_7

    .line 128
    .line 129
    iget-object v7, p0, Lq5;->l:Landroid/content/Context;

    .line 130
    .line 131
    if-eqz v7, :cond_6

    .line 132
    .line 133
    invoke-static {v7, v6}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    iget-object v7, v3, Lo5;->a:Lyg1;

    .line 138
    .line 139
    iget-object v7, v7, Lyg1;->k:Lwg1;

    .line 140
    .line 141
    iget-object v7, v7, Lwg1;->b:Lvg1;

    .line 142
    .line 143
    iget-object v7, v7, Lvg1;->o:Lda;

    .line 144
    .line 145
    invoke-virtual {v7, v4, v5}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    invoke-virtual {v6, v5}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    iget-object v5, v3, Lo5;->c:Ljava/util/ArrayList;

    .line 153
    .line 154
    if-nez v5, :cond_5

    .line 155
    .line 156
    new-instance v5, Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v5, v3, Lo5;->c:Ljava/util/ArrayList;

    .line 162
    .line 163
    new-instance v7, Lda;

    .line 164
    .line 165
    invoke-direct {v7}, Lu71;-><init>()V

    .line 166
    .line 167
    .line 168
    iput-object v7, v3, Lo5;->d:Lda;

    .line 169
    .line 170
    :cond_5
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    iget-object v3, v3, Lo5;->d:Lda;

    .line 174
    .line 175
    invoke-virtual {v3, v6, v4}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_6
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 180
    .line 181
    .line 182
    const-string p0, "Context can\'t be null when inflating animators"

    .line 183
    .line 184
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_7
    :goto_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 189
    .line 190
    .line 191
    :cond_8
    :goto_2
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :cond_9
    iget-object p0, v3, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 198
    .line 199
    if-nez p0, :cond_a

    .line 200
    .line 201
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 202
    .line 203
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 204
    .line 205
    .line 206
    iput-object p0, v3, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 207
    .line 208
    :cond_a
    iget-object p1, v3, Lo5;->c:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public final isAutoMirrored()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->isAutoMirrored()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final isRunning()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 13
    .line 14
    iget-object p0, p0, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final isStateful()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lyg1;->isStateful()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onLevelChange(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final onStateChange([I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lpg1;->setState([I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setAlpha(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setAutoMirrored(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setAutoMirrored(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setTint(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->g(Landroid/graphics/drawable/Drawable;I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setTint(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->h(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Loy;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 10
    .line 11
    iget-object p0, p0, Lo5;->a:Lyg1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lyg1;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final setVisible(ZZ)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lq5;->k:Lo5;

    .line 11
    .line 12
    iget-object v0, v0, Lo5;->a:Lyg1;

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Lyg1;->setVisible(ZZ)Z

    .line 15
    .line 16
    .line 17
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final start()V
    .locals 2

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lq5;->k:Lo5;

    .line 12
    .line 13
    iget-object v1, v0, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, v0, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final stop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lpg1;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->stop()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lq5;->k:Lo5;

    .line 12
    .line 13
    iget-object p0, p0, Lo5;->b:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
