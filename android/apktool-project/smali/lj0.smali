.class public Llj0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr71;


# static fields
.field public static final J:Ljava/lang/reflect/Method;

.field public static final K:Ljava/lang/reflect/Method;


# instance fields
.field public final A:Lkj0;

.field public final B:Ljj0;

.field public final C:Lij0;

.field public final D:Lgj0;

.field public final E:Landroid/os/Handler;

.field public final F:Landroid/graphics/Rect;

.field public G:Landroid/graphics/Rect;

.field public H:Z

.field public final I:Lr7;

.field public final j:Landroid/content/Context;

.field public k:Landroid/widget/ListAdapter;

.field public l:Lzy;

.field public final m:I

.field public n:I

.field public o:I

.field public p:I

.field public final q:I

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:I

.field public final v:I

.field public w:Lhj0;

.field public x:Landroid/view/View;

.field public y:Landroid/widget/AdapterView$OnItemClickListener;

.field public z:Landroid/widget/AdapterView$OnItemSelectedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-class v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v2, 0x1c

    .line 6
    .line 7
    if-gt v1, v2, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    :try_start_0
    const-string v3, "setClipToScreenEnabled"

    .line 12
    .line 13
    new-array v4, v2, [Ljava/lang/Class;

    .line 14
    .line 15
    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    aput-object v5, v4, v1

    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    sput-object v3, Llj0;->J:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    :catch_0
    :try_start_1
    const-string v3, "setEpicenterBounds"

    .line 26
    .line 27
    new-array v2, v2, [Ljava/lang/Class;

    .line 28
    .line 29
    const-class v4, Landroid/graphics/Rect;

    .line 30
    .line 31
    aput-object v4, v2, v1

    .line 32
    .line 33
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Llj0;->K:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    .line 39
    :catch_1
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p4, -0x2

    .line 5
    iput p4, p0, Llj0;->m:I

    .line 6
    .line 7
    iput p4, p0, Llj0;->n:I

    .line 8
    .line 9
    const/16 p4, 0x3ea

    .line 10
    .line 11
    iput p4, p0, Llj0;->q:I

    .line 12
    .line 13
    const/4 p4, 0x0

    .line 14
    iput p4, p0, Llj0;->u:I

    .line 15
    .line 16
    const v0, 0x7fffffff

    .line 17
    .line 18
    .line 19
    iput v0, p0, Llj0;->v:I

    .line 20
    .line 21
    new-instance v0, Lkj0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lkj0;-><init>(Llj0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Llj0;->A:Lkj0;

    .line 27
    .line 28
    new-instance v0, Ljj0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ljj0;-><init>(Llj0;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Llj0;->B:Ljj0;

    .line 34
    .line 35
    new-instance v0, Lij0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lij0;-><init>(Llj0;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Llj0;->C:Lij0;

    .line 41
    .line 42
    new-instance v0, Lgj0;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Lgj0;-><init>(Llj0;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Llj0;->D:Lgj0;

    .line 48
    .line 49
    new-instance v0, Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Llj0;->F:Landroid/graphics/Rect;

    .line 55
    .line 56
    iput-object p1, p0, Llj0;->j:Landroid/content/Context;

    .line 57
    .line 58
    new-instance v0, Landroid/os/Handler;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Llj0;->E:Landroid/os/Handler;

    .line 68
    .line 69
    sget-object v0, Lgx0;->o:[I

    .line 70
    .line 71
    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, p4, p4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput v1, p0, Llj0;->o:I

    .line 80
    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-virtual {v0, v1, p4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iput v2, p0, Llj0;->p:I

    .line 87
    .line 88
    if-eqz v2, :cond_0

    .line 89
    .line 90
    iput-boolean v1, p0, Llj0;->r:Z

    .line 91
    .line 92
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 93
    .line 94
    .line 95
    new-instance v0, Lr7;

    .line 96
    .line 97
    invoke-direct {v0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 98
    .line 99
    .line 100
    sget-object v2, Lgx0;->s:[I

    .line 101
    .line 102
    invoke-virtual {p1, p2, v2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    const/4 p3, 0x2

    .line 107
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_1

    .line 112
    .line 113
    invoke-virtual {p2, p3, p4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    invoke-static {v0, p3}, Lot0;->c(Landroid/widget/PopupWindow;Z)V

    .line 118
    .line 119
    .line 120
    :cond_1
    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    if-eqz p3, :cond_2

    .line 125
    .line 126
    invoke-virtual {p2, p4, p4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    if-eqz p3, :cond_2

    .line 131
    .line 132
    invoke-static {p1, p3}, Lrs0;->g(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    goto :goto_0

    .line 137
    :cond_2
    invoke-virtual {p2, p4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 145
    .line 146
    .line 147
    iput-object v0, p0, Llj0;->I:Lr7;

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 150
    .line 151
    .line 152
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Llj0;->I:Lr7;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Llj0;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()V
    .locals 13

    .line 1
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 2
    .line 3
    iget-object v1, p0, Llj0;->j:Landroid/content/Context;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    iget-object v3, p0, Llj0;->I:Lr7;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Llj0;->H:Z

    .line 11
    .line 12
    xor-int/2addr v0, v2

    .line 13
    invoke-virtual {p0, v1, v0}, Llj0;->q(Landroid/content/Context;Z)Lzy;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Llj0;->l:Lzy;

    .line 18
    .line 19
    iget-object v4, p0, Llj0;->k:Landroid/widget/ListAdapter;

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 25
    .line 26
    iget-object v4, p0, Llj0;->y:Landroid/widget/AdapterView$OnItemClickListener;

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 42
    .line 43
    new-instance v4, Laz;

    .line 44
    .line 45
    invoke-direct {v4, v2, p0}, Laz;-><init>(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v4}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 52
    .line 53
    iget-object v4, p0, Llj0;->C:Lij0;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Llj0;->z:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 59
    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    iget-object v4, p0, Llj0;->l:Lzy;

    .line 63
    .line 64
    invoke-virtual {v4, v0}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 68
    .line 69
    invoke-virtual {v3, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/view/ViewGroup;

    .line 78
    .line 79
    :goto_0
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v4, p0, Llj0;->F:Landroid/graphics/Rect;

    .line 84
    .line 85
    const/4 v5, 0x0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 89
    .line 90
    .line 91
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 92
    .line 93
    iget v6, v4, Landroid/graphics/Rect;->bottom:I

    .line 94
    .line 95
    add-int/2addr v6, v0

    .line 96
    iget-boolean v7, p0, Llj0;->r:Z

    .line 97
    .line 98
    if-nez v7, :cond_3

    .line 99
    .line 100
    neg-int v0, v0

    .line 101
    iput v0, p0, Llj0;->p:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-virtual {v4}, Landroid/graphics/Rect;->setEmpty()V

    .line 105
    .line 106
    .line 107
    move v6, v5

    .line 108
    :cond_3
    :goto_1
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/4 v7, 0x2

    .line 113
    if-ne v0, v7, :cond_4

    .line 114
    .line 115
    move v0, v2

    .line 116
    goto :goto_2

    .line 117
    :cond_4
    move v0, v5

    .line 118
    :goto_2
    iget-object v8, p0, Llj0;->x:Landroid/view/View;

    .line 119
    .line 120
    iget v9, p0, Llj0;->p:I

    .line 121
    .line 122
    invoke-static {v3, v8, v9, v0}, Lej0;->a(Landroid/widget/PopupWindow;Landroid/view/View;IZ)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget v8, p0, Llj0;->m:I

    .line 127
    .line 128
    const/4 v9, -0x2

    .line 129
    const/4 v10, -0x1

    .line 130
    if-ne v8, v10, :cond_5

    .line 131
    .line 132
    add-int/2addr v0, v6

    .line 133
    goto :goto_5

    .line 134
    :cond_5
    iget v11, p0, Llj0;->n:I

    .line 135
    .line 136
    if-eq v11, v9, :cond_7

    .line 137
    .line 138
    const/high16 v12, 0x40000000    # 2.0f

    .line 139
    .line 140
    if-eq v11, v10, :cond_6

    .line 141
    .line 142
    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_3

    .line 147
    :cond_6
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 156
    .line 157
    iget v11, v4, Landroid/graphics/Rect;->left:I

    .line 158
    .line 159
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 160
    .line 161
    add-int/2addr v11, v4

    .line 162
    sub-int/2addr v1, v11

    .line 163
    invoke-static {v1, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    goto :goto_3

    .line 168
    :cond_7
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 177
    .line 178
    iget v11, v4, Landroid/graphics/Rect;->left:I

    .line 179
    .line 180
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 181
    .line 182
    add-int/2addr v11, v4

    .line 183
    sub-int/2addr v1, v11

    .line 184
    const/high16 v4, -0x80000000

    .line 185
    .line 186
    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    :goto_3
    iget-object v4, p0, Llj0;->l:Lzy;

    .line 191
    .line 192
    invoke-virtual {v4, v1, v0}, Lzy;->a(II)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-lez v0, :cond_8

    .line 197
    .line 198
    iget-object v1, p0, Llj0;->l:Lzy;

    .line 199
    .line 200
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    iget-object v4, p0, Llj0;->l:Lzy;

    .line 205
    .line 206
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    add-int/2addr v4, v1

    .line 211
    add-int/2addr v4, v6

    .line 212
    goto :goto_4

    .line 213
    :cond_8
    move v4, v5

    .line 214
    :goto_4
    add-int/2addr v0, v4

    .line 215
    :goto_5
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-ne v1, v7, :cond_9

    .line 220
    .line 221
    move v1, v2

    .line 222
    goto :goto_6

    .line 223
    :cond_9
    move v1, v5

    .line 224
    :goto_6
    iget v4, p0, Llj0;->q:I

    .line 225
    .line 226
    invoke-static {v3, v4}, Lot0;->d(Landroid/widget/PopupWindow;I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_15

    .line 234
    .line 235
    iget-object v4, p0, Llj0;->x:Landroid/view/View;

    .line 236
    .line 237
    invoke-virtual {v4}, Landroid/view/View;->isAttachedToWindow()Z

    .line 238
    .line 239
    .line 240
    move-result v4

    .line 241
    if-nez v4, :cond_a

    .line 242
    .line 243
    goto/16 :goto_10

    .line 244
    .line 245
    :cond_a
    iget v4, p0, Llj0;->n:I

    .line 246
    .line 247
    if-ne v4, v10, :cond_b

    .line 248
    .line 249
    move v4, v10

    .line 250
    goto :goto_7

    .line 251
    :cond_b
    if-ne v4, v9, :cond_c

    .line 252
    .line 253
    iget-object v4, p0, Llj0;->x:Landroid/view/View;

    .line 254
    .line 255
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    :cond_c
    :goto_7
    if-ne v8, v10, :cond_11

    .line 260
    .line 261
    if-eqz v1, :cond_d

    .line 262
    .line 263
    move v8, v0

    .line 264
    goto :goto_8

    .line 265
    :cond_d
    move v8, v10

    .line 266
    :goto_8
    iget v0, p0, Llj0;->n:I

    .line 267
    .line 268
    if-eqz v1, :cond_f

    .line 269
    .line 270
    if-ne v0, v10, :cond_e

    .line 271
    .line 272
    move v0, v10

    .line 273
    goto :goto_9

    .line 274
    :cond_e
    move v0, v5

    .line 275
    :goto_9
    invoke-virtual {v3, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v3, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 279
    .line 280
    .line 281
    goto :goto_a

    .line 282
    :cond_f
    if-ne v0, v10, :cond_10

    .line 283
    .line 284
    move v5, v10

    .line 285
    :cond_10
    invoke-virtual {v3, v5}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v3, v10}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 289
    .line 290
    .line 291
    goto :goto_a

    .line 292
    :cond_11
    if-ne v8, v9, :cond_12

    .line 293
    .line 294
    move v8, v0

    .line 295
    :cond_12
    :goto_a
    invoke-virtual {v3, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 296
    .line 297
    .line 298
    move v0, v4

    .line 299
    iget-object v4, p0, Llj0;->x:Landroid/view/View;

    .line 300
    .line 301
    iget v5, p0, Llj0;->o:I

    .line 302
    .line 303
    iget v6, p0, Llj0;->p:I

    .line 304
    .line 305
    if-gez v0, :cond_13

    .line 306
    .line 307
    move v7, v10

    .line 308
    goto :goto_b

    .line 309
    :cond_13
    move v7, v0

    .line 310
    :goto_b
    if-gez v8, :cond_14

    .line 311
    .line 312
    move v8, v10

    .line 313
    :cond_14
    invoke-virtual/range {v3 .. v8}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :cond_15
    iget v1, p0, Llj0;->n:I

    .line 318
    .line 319
    if-ne v1, v10, :cond_16

    .line 320
    .line 321
    move v1, v10

    .line 322
    goto :goto_c

    .line 323
    :cond_16
    if-ne v1, v9, :cond_17

    .line 324
    .line 325
    iget-object v1, p0, Llj0;->x:Landroid/view/View;

    .line 326
    .line 327
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    :cond_17
    :goto_c
    if-ne v8, v10, :cond_18

    .line 332
    .line 333
    move v8, v10

    .line 334
    goto :goto_d

    .line 335
    :cond_18
    if-ne v8, v9, :cond_19

    .line 336
    .line 337
    move v8, v0

    .line 338
    :cond_19
    :goto_d
    invoke-virtual {v3, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v3, v8}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 342
    .line 343
    .line 344
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 345
    .line 346
    const/16 v1, 0x1c

    .line 347
    .line 348
    if-gt v0, v1, :cond_1a

    .line 349
    .line 350
    sget-object v0, Llj0;->J:Ljava/lang/reflect/Method;

    .line 351
    .line 352
    if-eqz v0, :cond_1b

    .line 353
    .line 354
    :try_start_0
    new-array v4, v2, [Ljava/lang/Object;

    .line 355
    .line 356
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 357
    .line 358
    aput-object v6, v4, v5

    .line 359
    .line 360
    invoke-virtual {v0, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    .line 362
    .line 363
    goto :goto_e

    .line 364
    :cond_1a
    invoke-static {v3, v2}, Lfj0;->b(Landroid/widget/PopupWindow;Z)V

    .line 365
    .line 366
    .line 367
    :catch_0
    :cond_1b
    :goto_e
    invoke-virtual {v3, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 368
    .line 369
    .line 370
    iget-object v0, p0, Llj0;->B:Ljj0;

    .line 371
    .line 372
    invoke-virtual {v3, v0}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 373
    .line 374
    .line 375
    iget-boolean v0, p0, Llj0;->t:Z

    .line 376
    .line 377
    if-eqz v0, :cond_1c

    .line 378
    .line 379
    iget-boolean v0, p0, Llj0;->s:Z

    .line 380
    .line 381
    invoke-static {v3, v0}, Lot0;->c(Landroid/widget/PopupWindow;Z)V

    .line 382
    .line 383
    .line 384
    :cond_1c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 385
    .line 386
    if-gt v0, v1, :cond_1d

    .line 387
    .line 388
    sget-object v0, Llj0;->K:Ljava/lang/reflect/Method;

    .line 389
    .line 390
    if-eqz v0, :cond_1e

    .line 391
    .line 392
    :try_start_1
    iget-object v1, p0, Llj0;->G:Landroid/graphics/Rect;

    .line 393
    .line 394
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 399
    .line 400
    .line 401
    goto :goto_f

    .line 402
    :cond_1d
    iget-object v0, p0, Llj0;->G:Landroid/graphics/Rect;

    .line 403
    .line 404
    invoke-static {v3, v0}, Lfj0;->a(Landroid/widget/PopupWindow;Landroid/graphics/Rect;)V

    .line 405
    .line 406
    .line 407
    :catch_1
    :cond_1e
    :goto_f
    iget-object v0, p0, Llj0;->x:Landroid/view/View;

    .line 408
    .line 409
    iget v1, p0, Llj0;->o:I

    .line 410
    .line 411
    iget v4, p0, Llj0;->p:I

    .line 412
    .line 413
    iget v5, p0, Llj0;->u:I

    .line 414
    .line 415
    invoke-virtual {v3, v0, v1, v4, v5}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 416
    .line 417
    .line 418
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 419
    .line 420
    invoke-virtual {v0, v10}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 421
    .line 422
    .line 423
    iget-boolean v0, p0, Llj0;->H:Z

    .line 424
    .line 425
    if-eqz v0, :cond_1f

    .line 426
    .line 427
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 428
    .line 429
    invoke-virtual {v0}, Lzy;->isInTouchMode()Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_20

    .line 434
    .line 435
    :cond_1f
    iget-object v0, p0, Llj0;->l:Lzy;

    .line 436
    .line 437
    if-eqz v0, :cond_20

    .line 438
    .line 439
    invoke-virtual {v0, v2}, Lzy;->setListSelectionHidden(Z)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 443
    .line 444
    .line 445
    :cond_20
    iget-boolean v0, p0, Llj0;->H:Z

    .line 446
    .line 447
    if-nez v0, :cond_21

    .line 448
    .line 449
    iget-object v0, p0, Llj0;->E:Landroid/os/Handler;

    .line 450
    .line 451
    iget-object p0, p0, Llj0;->D:Lgj0;

    .line 452
    .line 453
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 454
    .line 455
    .line 456
    :cond_21
    :goto_10
    return-void
.end method

.method public final d()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Llj0;->I:Lr7;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Llj0;->I:Lr7;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Llj0;->l:Lzy;

    .line 11
    .line 12
    iget-object v0, p0, Llj0;->E:Landroid/os/Handler;

    .line 13
    .line 14
    iget-object p0, p0, Llj0;->A:Lkj0;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final g(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Llj0;->I:Lr7;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h()Lzy;
    .locals 0

    .line 1
    iget-object p0, p0, Llj0;->l:Lzy;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(I)V
    .locals 0

    .line 1
    iput p1, p0, Llj0;->p:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Llj0;->r:Z

    .line 5
    .line 6
    return-void
.end method

.method public final l(I)V
    .locals 0

    .line 1
    iput p1, p0, Llj0;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public final n()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Llj0;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Llj0;->p:I

    .line 8
    .line 9
    return p0
.end method

.method public p(Landroid/widget/ListAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Llj0;->w:Lhj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lhj0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lhj0;-><init>(Llj0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Llj0;->w:Lhj0;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Llj0;->k:Landroid/widget/ListAdapter;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v1, v0}, Landroid/widget/Adapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    iput-object p1, p0, Llj0;->k:Landroid/widget/ListAdapter;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Llj0;->w:Lhj0;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Landroid/widget/Adapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p1, p0, Llj0;->l:Lzy;

    .line 30
    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p0, p0, Llj0;->k:Landroid/widget/ListAdapter;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    return-void
.end method

.method public q(Landroid/content/Context;Z)Lzy;
    .locals 0

    .line 1
    new-instance p0, Lzy;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lzy;-><init>(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final r(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Llj0;->I:Lr7;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Llj0;->F:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr v0, v1

    .line 19
    add-int/2addr v0, p1

    .line 20
    iput v0, p0, Llj0;->n:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iput p1, p0, Llj0;->n:I

    .line 24
    .line 25
    return-void
.end method
