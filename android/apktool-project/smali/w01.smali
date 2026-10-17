.class public final Lw01;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Landroid/graphics/PorterDuff$Mode;

.field public static g:Lw01;

.field public static final h:Lv01;


# instance fields
.field public a:Ljava/util/WeakHashMap;

.field public final b:Ljava/util/WeakHashMap;

.field public c:Landroid/util/TypedValue;

.field public d:Z

.field public e:Li7;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lw01;->f:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    new-instance v0, Lv01;

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-direct {v0, v1}, Lvk0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lw01;->h:Lv01;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lw01;->b:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    return-void
.end method

.method public static declared-synchronized c()Lw01;
    .locals 2

    .line 1
    const-class v0, Lw01;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lw01;->g:Lw01;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lw01;

    .line 9
    .line 10
    invoke-direct {v1}, Lw01;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lw01;->g:Lw01;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-object v1

    .line 20
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v1
.end method

.method public static declared-synchronized f(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .locals 4

    .line 1
    const-class v0, Lw01;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lw01;->h:Lv01;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const/16 v2, 0x1f

    .line 10
    .line 11
    add-int v3, v2, p0

    .line 12
    .line 13
    mul-int/2addr v3, v2

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, v3

    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Lvk0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/graphics/PorterDuffColorFilter;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/2addr p0, v3

    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0, v2}, Lvk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Landroid/graphics/PorterDuffColorFilter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    monitor-exit v0

    .line 55
    return-object v2

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p0
.end method

.method public static i(Landroid/graphics/drawable/Drawable;Lqo;[I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v1, p0, :cond_7

    .line 10
    .line 11
    instance-of v1, p0, Landroid/graphics/drawable/LayerDrawable;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-array v1, v2, [I

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-boolean v0, p1, Lqo;->b:Z

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-boolean v1, p1, Lqo;->a:Z

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    :goto_0
    const/4 v1, 0x0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget-object v0, p1, Lqo;->c:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v0, Landroid/content/res/ColorStateList;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    move-object v0, v1

    .line 52
    :goto_1
    iget-boolean v3, p1, Lqo;->a:Z

    .line 53
    .line 54
    if-eqz v3, :cond_4

    .line 55
    .line 56
    iget-object p1, p1, Lqo;->d:Ljava/io/Serializable;

    .line 57
    .line 58
    check-cast p1, Landroid/graphics/PorterDuff$Mode;

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_4
    sget-object p1, Lw01;->f:Landroid/graphics/PorterDuff$Mode;

    .line 62
    .line 63
    :goto_2
    if-eqz v0, :cond_6

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_5
    invoke-virtual {v0, p2, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-static {p2, p1}, Lw01;->f(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :cond_6
    :goto_3
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 77
    .line 78
    .line 79
    :cond_7
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lw01;->a:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lw01;->a:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lt81;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Lt81;

    .line 21
    .line 22
    invoke-direct {v0}, Lt81;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lw01;->a:Ljava/util/WeakHashMap;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_1
    iget p0, v0, Lt81;->l:I

    .line 31
    .line 32
    const/16 p1, 0x20

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    const/4 v2, 0x1

    .line 36
    const/4 v3, 0x0

    .line 37
    if-eqz p0, :cond_8

    .line 38
    .line 39
    iget-object v4, v0, Lt81;->j:[I

    .line 40
    .line 41
    add-int/lit8 v5, p0, -0x1

    .line 42
    .line 43
    aget v5, v4, v5

    .line 44
    .line 45
    if-gt p2, v5, :cond_8

    .line 46
    .line 47
    invoke-static {p0, p2, v4}, Ldl1;->b(II[I)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-ltz p0, :cond_2

    .line 52
    .line 53
    iget-object p1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 54
    .line 55
    aput-object p3, p1, p0

    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    not-int p0, p0

    .line 59
    iget v4, v0, Lt81;->l:I

    .line 60
    .line 61
    if-ge p0, v4, :cond_3

    .line 62
    .line 63
    iget-object v5, v0, Lt81;->k:[Ljava/lang/Object;

    .line 64
    .line 65
    aget-object v6, v5, p0

    .line 66
    .line 67
    sget-object v7, Lt81;->m:Ljava/lang/Object;

    .line 68
    .line 69
    if-ne v6, v7, :cond_3

    .line 70
    .line 71
    iget-object p1, v0, Lt81;->j:[I

    .line 72
    .line 73
    aput p2, p1, p0

    .line 74
    .line 75
    aput-object p3, v5, p0

    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    iget-object v5, v0, Lt81;->j:[I

    .line 79
    .line 80
    array-length v6, v5

    .line 81
    if-lt v4, v6, :cond_6

    .line 82
    .line 83
    add-int/2addr v4, v2

    .line 84
    mul-int/2addr v4, v1

    .line 85
    move v5, v1

    .line 86
    :goto_0
    if-ge v5, p1, :cond_5

    .line 87
    .line 88
    shl-int v6, v2, v5

    .line 89
    .line 90
    add-int/lit8 v6, v6, -0xc

    .line 91
    .line 92
    if-gt v4, v6, :cond_4

    .line 93
    .line 94
    move v4, v6

    .line 95
    goto :goto_1

    .line 96
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    :goto_1
    div-int/2addr v4, v1

    .line 100
    new-array v5, v4, [I

    .line 101
    .line 102
    new-array p1, v4, [Ljava/lang/Object;

    .line 103
    .line 104
    iget-object v1, v0, Lt81;->j:[I

    .line 105
    .line 106
    array-length v4, v1

    .line 107
    invoke-static {v1, v3, v5, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    .line 109
    .line 110
    iget-object v1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 111
    .line 112
    array-length v4, v1

    .line 113
    invoke-static {v1, v3, p1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    .line 115
    .line 116
    iput-object v5, v0, Lt81;->j:[I

    .line 117
    .line 118
    iput-object p1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 119
    .line 120
    :cond_6
    iget p1, v0, Lt81;->l:I

    .line 121
    .line 122
    sub-int/2addr p1, p0

    .line 123
    if-eqz p1, :cond_7

    .line 124
    .line 125
    add-int/lit8 v1, p0, 0x1

    .line 126
    .line 127
    invoke-static {v5, p0, v5, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    .line 129
    .line 130
    iget-object p1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 131
    .line 132
    iget v3, v0, Lt81;->l:I

    .line 133
    .line 134
    sub-int/2addr v3, p0

    .line 135
    invoke-static {p1, p0, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    .line 137
    .line 138
    :cond_7
    iget-object p1, v0, Lt81;->j:[I

    .line 139
    .line 140
    aput p2, p1, p0

    .line 141
    .line 142
    iget-object p1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 143
    .line 144
    aput-object p3, p1, p0

    .line 145
    .line 146
    iget p0, v0, Lt81;->l:I

    .line 147
    .line 148
    add-int/2addr p0, v2

    .line 149
    iput p0, v0, Lt81;->l:I

    .line 150
    .line 151
    return-void

    .line 152
    :cond_8
    iget-object v4, v0, Lt81;->j:[I

    .line 153
    .line 154
    array-length v5, v4

    .line 155
    if-lt p0, v5, :cond_b

    .line 156
    .line 157
    add-int/lit8 v4, p0, 0x1

    .line 158
    .line 159
    mul-int/2addr v4, v1

    .line 160
    move v5, v1

    .line 161
    :goto_2
    if-ge v5, p1, :cond_a

    .line 162
    .line 163
    shl-int v6, v2, v5

    .line 164
    .line 165
    add-int/lit8 v6, v6, -0xc

    .line 166
    .line 167
    if-gt v4, v6, :cond_9

    .line 168
    .line 169
    move v4, v6

    .line 170
    goto :goto_3

    .line 171
    :cond_9
    add-int/lit8 v5, v5, 0x1

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_a
    :goto_3
    div-int/2addr v4, v1

    .line 175
    new-array p1, v4, [I

    .line 176
    .line 177
    new-array v1, v4, [Ljava/lang/Object;

    .line 178
    .line 179
    iget-object v4, v0, Lt81;->j:[I

    .line 180
    .line 181
    array-length v5, v4

    .line 182
    invoke-static {v4, v3, p1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 183
    .line 184
    .line 185
    iget-object v4, v0, Lt81;->k:[Ljava/lang/Object;

    .line 186
    .line 187
    array-length v5, v4

    .line 188
    invoke-static {v4, v3, v1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    .line 190
    .line 191
    iput-object p1, v0, Lt81;->j:[I

    .line 192
    .line 193
    iput-object v1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 194
    .line 195
    move-object v4, p1

    .line 196
    :cond_b
    aput p2, v4, p0

    .line 197
    .line 198
    iget-object p1, v0, Lt81;->k:[Ljava/lang/Object;

    .line 199
    .line 200
    aput-object p3, p1, p0

    .line 201
    .line 202
    add-int/2addr p0, v2

    .line 203
    iput p0, v0, Lt81;->l:I

    .line 204
    .line 205
    return-void
.end method

.method public final b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 10

    .line 1
    iget-object v0, p0, Lw01;->c:Landroid/util/TypedValue;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lw01;->c:Landroid/util/TypedValue;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 18
    .line 19
    .line 20
    iget v1, v0, Landroid/util/TypedValue;->assetCookie:I

    .line 21
    .line 22
    int-to-long v3, v1

    .line 23
    const/16 v1, 0x20

    .line 24
    .line 25
    shl-long/2addr v3, v1

    .line 26
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 27
    .line 28
    int-to-long v5, v1

    .line 29
    or-long/2addr v3, v5

    .line 30
    monitor-enter p0

    .line 31
    :try_start_0
    iget-object v1, p0, Lw01;->b:Ljava/util/WeakHashMap;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Luk0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    monitor-exit p0

    .line 43
    :goto_0
    move-object v1, v5

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :try_start_1
    invoke-virtual {v1, v3, v4}, Luk0;->c(J)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Ljava/lang/ref/WeakReference;

    .line 50
    .line 51
    if-eqz v6, :cond_3

    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    check-cast v6, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 58
    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v6, v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    monitor-exit p0

    .line 70
    goto :goto_1

    .line 71
    :catchall_0
    move-exception p1

    .line 72
    goto/16 :goto_5

    .line 73
    .line 74
    :cond_2
    :try_start_2
    iget-object v6, v1, Luk0;->k:[J

    .line 75
    .line 76
    iget v7, v1, Luk0;->m:I

    .line 77
    .line 78
    invoke-static {v6, v7, v3, v4}, Ldl1;->c([JIJ)I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-ltz v6, :cond_3

    .line 83
    .line 84
    iget-object v7, v1, Luk0;->l:[Ljava/lang/Object;

    .line 85
    .line 86
    aget-object v8, v7, v6

    .line 87
    .line 88
    sget-object v9, Luk0;->n:Ljava/lang/Object;

    .line 89
    .line 90
    if-eq v8, v9, :cond_3

    .line 91
    .line 92
    aput-object v9, v7, v6

    .line 93
    .line 94
    iput-boolean v2, v1, Luk0;->j:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    .line 96
    :cond_3
    monitor-exit p0

    .line 97
    goto :goto_0

    .line 98
    :goto_1
    if-eqz v1, :cond_4

    .line 99
    .line 100
    return-object v1

    .line 101
    :cond_4
    iget-object v1, p0, Lw01;->e:Li7;

    .line 102
    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_5
    const v1, 0x7f080039

    .line 107
    .line 108
    .line 109
    if-ne p2, v1, :cond_6

    .line 110
    .line 111
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    .line 112
    .line 113
    const p2, 0x7f080038

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1, p2}, Lw01;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    const v1, 0x7f08003a

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p1, v1}, Lw01;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    filled-new-array {p2, v1}, [Landroid/graphics/drawable/Drawable;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-direct {v5, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_6
    const v1, 0x7f08005c

    .line 136
    .line 137
    .line 138
    if-ne p2, v1, :cond_7

    .line 139
    .line 140
    const p2, 0x7f07003b

    .line 141
    .line 142
    .line 143
    invoke-static {p0, p1, p2}, Li7;->o(Lw01;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    goto :goto_2

    .line 148
    :cond_7
    const v1, 0x7f08005b

    .line 149
    .line 150
    .line 151
    if-ne p2, v1, :cond_8

    .line 152
    .line 153
    const p2, 0x7f07003c

    .line 154
    .line 155
    .line 156
    invoke-static {p0, p1, p2}, Li7;->o(Lw01;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    goto :goto_2

    .line 161
    :cond_8
    const v1, 0x7f08005d

    .line 162
    .line 163
    .line 164
    if-ne p2, v1, :cond_9

    .line 165
    .line 166
    const p2, 0x7f07003d

    .line 167
    .line 168
    .line 169
    invoke-static {p0, p1, p2}, Li7;->o(Lw01;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    :cond_9
    :goto_2
    if-eqz v5, :cond_c

    .line 174
    .line 175
    iget p2, v0, Landroid/util/TypedValue;->changingConfigurations:I

    .line 176
    .line 177
    invoke-virtual {v5, p2}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 178
    .line 179
    .line 180
    monitor-enter p0

    .line 181
    :try_start_3
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    if-eqz p2, :cond_b

    .line 186
    .line 187
    iget-object v0, p0, Lw01;->b:Ljava/util/WeakHashMap;

    .line 188
    .line 189
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Luk0;

    .line 194
    .line 195
    if-nez v0, :cond_a

    .line 196
    .line 197
    new-instance v0, Luk0;

    .line 198
    .line 199
    invoke-direct {v0}, Luk0;-><init>()V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lw01;->b:Ljava/util/WeakHashMap;

    .line 203
    .line 204
    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    goto :goto_3

    .line 208
    :catchall_1
    move-exception p1

    .line 209
    goto :goto_4

    .line 210
    :cond_a
    :goto_3
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 211
    .line 212
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, v3, v4, p1}, Luk0;->d(JLjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 216
    .line 217
    .line 218
    monitor-exit p0

    .line 219
    return-object v5

    .line 220
    :cond_b
    monitor-exit p0

    .line 221
    return-object v5

    .line 222
    :goto_4
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 223
    throw p1

    .line 224
    :cond_c
    return-object v5

    .line 225
    :goto_5
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 226
    throw p1
.end method

.method public final declared-synchronized d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lw01;->e(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    monitor-exit p0

    .line 8
    return-object p1

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public final declared-synchronized e(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lw01;->d:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lw01;->d:Z

    .line 9
    .line 10
    const v0, 0x7f080077

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lw01;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    instance-of v1, v0, Lyg1;

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const-string v1, "android.graphics.drawable.VectorDrawable"

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_5

    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lw01;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-static {p1, p2}, Laq;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2, p3, v0}, Lw01;->h(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    :cond_3
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-static {v0}, Lsy;->a(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    .line 63
    :cond_4
    monitor-exit p0

    .line 64
    return-object v0

    .line 65
    :cond_5
    const/4 p1, 0x0

    .line 66
    :try_start_1
    iput-boolean p1, p0, Lw01;->d:Z

    .line 67
    .line 68
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 69
    .line 70
    const-string p2, "This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat."

    .line 71
    .line 72
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw p1
.end method

.method public final declared-synchronized g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lw01;->a:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lt81;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v2, v0, Lt81;->j:[I

    .line 16
    .line 17
    iget v3, v0, Lt81;->l:I

    .line 18
    .line 19
    invoke-static {v3, p2, v2}, Ldl1;->b(II[I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lt81;->k:[Ljava/lang/Object;

    .line 26
    .line 27
    aget-object v0, v0, v2

    .line 28
    .line 29
    sget-object v2, Lt81;->m:Ljava/lang/Object;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :cond_1
    check-cast v0, Landroid/content/res/ColorStateList;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object v0, v1

    .line 38
    :goto_0
    if-nez v0, :cond_5

    .line 39
    .line 40
    iget-object v0, p0, Lw01;->e:Li7;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {v0, p1, p2}, Li7;->q(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :goto_1
    if-eqz v1, :cond_4

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2, v1}, Lw01;->a(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :catchall_0
    move-exception p1

    .line 56
    goto :goto_3

    .line 57
    :cond_4
    :goto_2
    move-object v0, v1

    .line 58
    :cond_5
    monitor-exit p0

    .line 59
    return-object v0

    .line 60
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw p1
.end method

.method public final h(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    invoke-virtual {p0, p1, p2}, Lw01;->g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1, v0}, Loy;->h(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lw01;->e:Li7;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const p0, 0x7f08006a

    .line 21
    .line 22
    .line 23
    if-ne p2, p0, :cond_1

    .line 24
    .line 25
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 26
    .line 27
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-static {p1, v1}, Loy;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-object p1

    .line 33
    :cond_3
    iget-object v0, p0, Lw01;->e:Li7;

    .line 34
    .line 35
    const v2, 0x7f0400ec

    .line 36
    .line 37
    .line 38
    const v3, 0x7f0400ea

    .line 39
    .line 40
    .line 41
    if-eqz v0, :cond_6

    .line 42
    .line 43
    const v0, 0x7f080065

    .line 44
    .line 45
    .line 46
    const v4, 0x102000d

    .line 47
    .line 48
    .line 49
    const v5, 0x102000f

    .line 50
    .line 51
    .line 52
    const/high16 v6, 0x1020000

    .line 53
    .line 54
    if-ne p2, v0, :cond_4

    .line 55
    .line 56
    move-object p0, p4

    .line 57
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 58
    .line 59
    invoke-virtual {p0, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-static {p1, v2}, Lac1;->c(Landroid/content/Context;I)I

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    sget-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 68
    .line 69
    invoke-static {p2, p3, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-static {p1, v2}, Lac1;->c(Landroid/content/Context;I)I

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    invoke-static {p2, p3, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p1, v3}, Lac1;->c(Landroid/content/Context;I)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {p0, p1, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 92
    .line 93
    .line 94
    return-object p4

    .line 95
    :cond_4
    const v0, 0x7f08005c

    .line 96
    .line 97
    .line 98
    if-eq p2, v0, :cond_5

    .line 99
    .line 100
    const v0, 0x7f08005b

    .line 101
    .line 102
    .line 103
    if-eq p2, v0, :cond_5

    .line 104
    .line 105
    const v0, 0x7f08005d

    .line 106
    .line 107
    .line 108
    if-ne p2, v0, :cond_6

    .line 109
    .line 110
    :cond_5
    move-object p0, p4

    .line 111
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 112
    .line 113
    invoke-virtual {p0, v6}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-static {p1, v2}, Lac1;->b(Landroid/content/Context;I)I

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    sget-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 122
    .line 123
    invoke-static {p2, p3, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-static {p1, v3}, Lac1;->c(Landroid/content/Context;I)I

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    invoke-static {p2, p3, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p1, v3}, Lac1;->c(Landroid/content/Context;I)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    invoke-static {p0, p1, v0}, Li7;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 146
    .line 147
    .line 148
    return-object p4

    .line 149
    :cond_6
    iget-object p0, p0, Lw01;->e:Li7;

    .line 150
    .line 151
    const/4 v0, 0x0

    .line 152
    if-eqz p0, :cond_d

    .line 153
    .line 154
    sget-object v4, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 155
    .line 156
    iget-object v5, p0, Li7;->j:Ljava/lang/Object;

    .line 157
    .line 158
    check-cast v5, [I

    .line 159
    .line 160
    invoke-static {v5, p2}, Li7;->j([II)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    const/4 v6, 0x1

    .line 165
    const/4 v7, -0x1

    .line 166
    if-eqz v5, :cond_7

    .line 167
    .line 168
    :goto_1
    move p2, v6

    .line 169
    :goto_2
    move p0, v7

    .line 170
    goto :goto_3

    .line 171
    :cond_7
    iget-object v2, p0, Li7;->l:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast v2, [I

    .line 174
    .line 175
    invoke-static {v2, p2}, Li7;->j([II)Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-eqz v2, :cond_8

    .line 180
    .line 181
    move v2, v3

    .line 182
    goto :goto_1

    .line 183
    :cond_8
    iget-object p0, p0, Li7;->m:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast p0, [I

    .line 186
    .line 187
    invoke-static {p0, p2}, Li7;->j([II)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    const v2, 0x1010031

    .line 192
    .line 193
    .line 194
    if-eqz p0, :cond_9

    .line 195
    .line 196
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_9
    const p0, 0x7f08004e

    .line 200
    .line 201
    .line 202
    if-ne p2, p0, :cond_a

    .line 203
    .line 204
    const p0, 0x42233333    # 40.8f

    .line 205
    .line 206
    .line 207
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    const v2, 0x1010030

    .line 212
    .line 213
    .line 214
    move p2, v6

    .line 215
    goto :goto_3

    .line 216
    :cond_a
    const p0, 0x7f08003c

    .line 217
    .line 218
    .line 219
    if-ne p2, p0, :cond_b

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_b
    move p2, v0

    .line 223
    move v2, p2

    .line 224
    goto :goto_2

    .line 225
    :goto_3
    if-eqz p2, :cond_d

    .line 226
    .line 227
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-static {p1, v2}, Lac1;->c(Landroid/content/Context;I)I

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    const-class v2, Lj7;

    .line 236
    .line 237
    monitor-enter v2

    .line 238
    :try_start_0
    invoke-static {p1, v4}, Lw01;->f(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 239
    .line 240
    .line 241
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    monitor-exit v2

    .line 243
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 244
    .line 245
    .line 246
    if-eq p0, v7, :cond_c

    .line 247
    .line 248
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 249
    .line 250
    .line 251
    :cond_c
    move v0, v6

    .line 252
    goto :goto_4

    .line 253
    :catchall_0
    move-exception p0

    .line 254
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    throw p0

    .line 256
    :cond_d
    :goto_4
    if-nez v0, :cond_e

    .line 257
    .line 258
    if-eqz p3, :cond_e

    .line 259
    .line 260
    return-object v1

    .line 261
    :cond_e
    return-object p4
.end method
