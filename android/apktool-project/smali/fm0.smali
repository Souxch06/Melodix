.class public final Lfm0;
.super Landroid/graphics/drawable/Drawable;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lc71;


# static fields
.field public static final F:Landroid/graphics/Paint;


# instance fields
.field public final A:Lt61;

.field public B:Landroid/graphics/PorterDuffColorFilter;

.field public C:Landroid/graphics/PorterDuffColorFilter;

.field public final D:Landroid/graphics/RectF;

.field public final E:Z

.field public j:Lem0;

.field public final k:[La71;

.field public final l:[La71;

.field public final m:Ljava/util/BitSet;

.field public n:Z

.field public final o:Landroid/graphics/Matrix;

.field public final p:Landroid/graphics/Path;

.field public final q:Landroid/graphics/Path;

.field public final r:Landroid/graphics/RectF;

.field public final s:Landroid/graphics/RectF;

.field public final t:Landroid/graphics/Region;

.field public final u:Landroid/graphics/Region;

.field public v:Lr61;

.field public final w:Landroid/graphics/Paint;

.field public final x:Landroid/graphics/Paint;

.field public final y:Lp61;

.field public final z:Lpa0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lfm0;->F:Landroid/graphics/Paint;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 14
    .line 15
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Lem0;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v1, v0, [La71;

    .line 6
    .line 7
    iput-object v1, p0, Lfm0;->k:[La71;

    .line 8
    .line 9
    new-array v0, v0, [La71;

    .line 10
    .line 11
    iput-object v0, p0, Lfm0;->l:[La71;

    .line 12
    .line 13
    new-instance v0, Ljava/util/BitSet;

    .line 14
    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lfm0;->m:Ljava/util/BitSet;

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Matrix;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lfm0;->o:Landroid/graphics/Matrix;

    .line 28
    .line 29
    new-instance v0, Landroid/graphics/Path;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lfm0;->p:Landroid/graphics/Path;

    .line 35
    .line 36
    new-instance v0, Landroid/graphics/Path;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lfm0;->q:Landroid/graphics/Path;

    .line 42
    .line 43
    new-instance v0, Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lfm0;->r:Landroid/graphics/RectF;

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lfm0;->s:Landroid/graphics/RectF;

    .line 56
    .line 57
    new-instance v0, Landroid/graphics/Region;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lfm0;->t:Landroid/graphics/Region;

    .line 63
    .line 64
    new-instance v0, Landroid/graphics/Region;

    .line 65
    .line 66
    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lfm0;->u:Landroid/graphics/Region;

    .line 70
    .line 71
    new-instance v0, Landroid/graphics/Paint;

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lfm0;->w:Landroid/graphics/Paint;

    .line 78
    .line 79
    new-instance v2, Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 82
    .line 83
    .line 84
    iput-object v2, p0, Lfm0;->x:Landroid/graphics/Paint;

    .line 85
    .line 86
    new-instance v3, Lp61;

    .line 87
    .line 88
    invoke-direct {v3}, Lp61;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v3, p0, Lfm0;->y:Lp61;

    .line 92
    .line 93
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    if-ne v3, v4, :cond_0

    .line 106
    .line 107
    sget-object v3, Ls61;->a:Lt61;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_0
    new-instance v3, Lt61;

    .line 111
    .line 112
    invoke-direct {v3}, Lt61;-><init>()V

    .line 113
    .line 114
    .line 115
    :goto_0
    iput-object v3, p0, Lfm0;->A:Lt61;

    .line 116
    .line 117
    new-instance v3, Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object v3, p0, Lfm0;->D:Landroid/graphics/RectF;

    .line 123
    .line 124
    iput-boolean v1, p0, Lfm0;->E:Z

    .line 125
    .line 126
    iput-object p1, p0, Lfm0;->j:Lem0;

    .line 127
    .line 128
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 129
    .line 130
    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    .line 132
    .line 133
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Lfm0;->g()Z

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Lfm0;->f([I)Z

    .line 146
    .line 147
    .line 148
    new-instance p1, Lpa0;

    .line 149
    .line 150
    const/16 v0, 0x11

    .line 151
    .line 152
    invoke-direct {p1, v0, p0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    iput-object p1, p0, Lfm0;->z:Lpa0;

    .line 156
    .line 157
    return-void
.end method

.method public constructor <init>(Lr61;)V
    .locals 3

    .line 158
    new-instance v0, Lem0;

    .line 159
    invoke-direct {v0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v1, 0x0

    .line 160
    iput-object v1, v0, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 161
    iput-object v1, v0, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 162
    iput-object v1, v0, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 163
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object v2, v0, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 164
    iput-object v1, v0, Lem0;->g:Landroid/graphics/Rect;

    const/high16 v2, 0x3f800000    # 1.0f

    .line 165
    iput v2, v0, Lem0;->h:F

    .line 166
    iput v2, v0, Lem0;->i:F

    const/16 v2, 0xff

    .line 167
    iput v2, v0, Lem0;->k:I

    const/4 v2, 0x0

    .line 168
    iput v2, v0, Lem0;->l:F

    .line 169
    iput v2, v0, Lem0;->m:F

    const/4 v2, 0x0

    .line 170
    iput v2, v0, Lem0;->n:I

    .line 171
    iput v2, v0, Lem0;->o:I

    .line 172
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    iput-object v2, v0, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 173
    iput-object p1, v0, Lem0;->a:Lr61;

    .line 174
    iput-object v1, v0, Lem0;->b:Ltz;

    .line 175
    invoke-direct {p0, v0}, Lfm0;-><init>(Lem0;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/RectF;Landroid/graphics/Path;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget-object v2, v0, Lem0;->a:Lr61;

    .line 4
    .line 5
    iget v3, v0, Lem0;->i:F

    .line 6
    .line 7
    iget-object v5, p0, Lfm0;->z:Lpa0;

    .line 8
    .line 9
    iget-object v1, p0, Lfm0;->A:Lt61;

    .line 10
    .line 11
    move-object v4, p1

    .line 12
    move-object v6, p2

    .line 13
    invoke-virtual/range {v1 .. v6}, Lt61;->a(Lr61;FLandroid/graphics/RectF;Lpa0;Landroid/graphics/Path;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lfm0;->j:Lem0;

    .line 17
    .line 18
    iget p1, p1, Lem0;->h:F

    .line 19
    .line 20
    const/high16 p2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    cmpl-float p1, p1, p2

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lfm0;->o:Landroid/graphics/Matrix;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lfm0;->j:Lem0;

    .line 32
    .line 33
    iget p2, p2, Lem0;->h:F

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/high16 v1, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr v0, v1

    .line 42
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    div-float/2addr v2, v1

    .line 47
    invoke-virtual {p1, p2, p2, v0, v2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v6, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p0, p0, Lfm0;->D:Landroid/graphics/RectF;

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-virtual {v6, p0, p1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final b(I)I
    .locals 5

    .line 1
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget v0, p0, Lem0;->m:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    add-float/2addr v0, v1

    .line 7
    iget v2, p0, Lem0;->l:F

    .line 8
    .line 9
    add-float/2addr v0, v2

    .line 10
    iget-object p0, p0, Lem0;->b:Ltz;

    .line 11
    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    iget-boolean v2, p0, Ltz;->a:Z

    .line 15
    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    const/16 v2, 0xff

    .line 19
    .line 20
    invoke-static {p1, v2}, Ljl;->d(II)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget v4, p0, Ltz;->d:I

    .line 25
    .line 26
    if-ne v3, v4, :cond_3

    .line 27
    .line 28
    iget v3, p0, Ltz;->e:F

    .line 29
    .line 30
    cmpg-float v4, v3, v1

    .line 31
    .line 32
    if-lez v4, :cond_1

    .line 33
    .line 34
    cmpg-float v4, v0, v1

    .line 35
    .line 36
    if-gtz v4, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    div-float/2addr v0, v3

    .line 40
    float-to-double v3, v0

    .line 41
    invoke-static {v3, v4}, Ljava/lang/Math;->log1p(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    double-to-float v0, v3

    .line 46
    const/high16 v3, 0x40900000    # 4.5f

    .line 47
    .line 48
    mul-float/2addr v0, v3

    .line 49
    const/high16 v3, 0x40000000    # 2.0f

    .line 50
    .line 51
    add-float/2addr v0, v3

    .line 52
    const/high16 v3, 0x42c80000    # 100.0f

    .line 53
    .line 54
    div-float/2addr v0, v3

    .line 55
    const/high16 v3, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :goto_0
    move v0, v1

    .line 63
    :goto_1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-static {p1, v2}, Ljl;->d(II)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget v2, p0, Ltz;->b:I

    .line 72
    .line 73
    invoke-static {p1, v2, v0}, Lst;->h(IIF)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    cmpl-float v0, v0, v1

    .line 78
    .line 79
    if-lez v0, :cond_2

    .line 80
    .line 81
    iget p0, p0, Ltz;->c:I

    .line 82
    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    sget v0, Ltz;->f:I

    .line 86
    .line 87
    invoke-static {p0, v0}, Ljl;->d(II)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    invoke-static {p0, p1}, Ljl;->b(II)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    :cond_2
    invoke-static {p1, v3}, Ljl;->d(II)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0

    .line 100
    :cond_3
    return p1
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lfm0;->m:Ljava/util/BitSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/BitSet;->cardinality()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 7
    .line 8
    iget v0, v0, Lem0;->o:I

    .line 9
    .line 10
    iget-object v1, p0, Lfm0;->p:Landroid/graphics/Path;

    .line 11
    .line 12
    iget-object v2, p0, Lfm0;->y:Lp61;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v2, Lp61;->a:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    const/4 v3, 0x4

    .line 23
    if-ge v0, v3, :cond_1

    .line 24
    .line 25
    iget-object v3, p0, Lfm0;->k:[La71;

    .line 26
    .line 27
    aget-object v3, v3, v0

    .line 28
    .line 29
    iget-object v4, p0, Lfm0;->j:Lem0;

    .line 30
    .line 31
    iget v4, v4, Lem0;->n:I

    .line 32
    .line 33
    sget-object v5, La71;->b:Landroid/graphics/Matrix;

    .line 34
    .line 35
    invoke-virtual {v3, v5, v2, v4, p1}, La71;->a(Landroid/graphics/Matrix;Lp61;ILandroid/graphics/Canvas;)V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Lfm0;->l:[La71;

    .line 39
    .line 40
    aget-object v3, v3, v0

    .line 41
    .line 42
    iget-object v4, p0, Lfm0;->j:Lem0;

    .line 43
    .line 44
    iget v4, v4, Lem0;->n:I

    .line 45
    .line 46
    invoke-virtual {v3, v5, v2, v4, p1}, La71;->a(Landroid/graphics/Matrix;Lp61;ILandroid/graphics/Canvas;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-boolean v0, p0, Lfm0;->E:Z

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 57
    .line 58
    iget v0, v0, Lem0;->o:I

    .line 59
    .line 60
    int-to-double v2, v0

    .line 61
    const-wide/16 v4, 0x0

    .line 62
    .line 63
    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    .line 64
    .line 65
    .line 66
    move-result-wide v6

    .line 67
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 68
    .line 69
    .line 70
    move-result-wide v6

    .line 71
    mul-double/2addr v6, v2

    .line 72
    double-to-int v0, v6

    .line 73
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 74
    .line 75
    iget p0, p0, Lem0;->o:I

    .line 76
    .line 77
    int-to-double v2, p0

    .line 78
    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 83
    .line 84
    .line 85
    move-result-wide v4

    .line 86
    mul-double/2addr v4, v2

    .line 87
    double-to-int p0, v4

    .line 88
    neg-int v2, v0

    .line 89
    int-to-float v2, v2

    .line 90
    neg-int v3, p0

    .line 91
    int-to-float v3, v3

    .line 92
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 93
    .line 94
    .line 95
    sget-object v2, Lfm0;->F:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 98
    .line 99
    .line 100
    int-to-float v0, v0

    .line 101
    int-to-float p0, p0

    .line 102
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public final d()Landroid/graphics/RectF;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lfm0;->r:Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lfm0;->B:Landroid/graphics/PorterDuffColorFilter;

    .line 6
    .line 7
    iget-object v3, v0, Lfm0;->w:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget-object v4, v0, Lfm0;->j:Lem0;

    .line 17
    .line 18
    iget v4, v4, Lem0;->k:I

    .line 19
    .line 20
    ushr-int/lit8 v5, v4, 0x7

    .line 21
    .line 22
    add-int/2addr v4, v5

    .line 23
    mul-int/2addr v4, v2

    .line 24
    ushr-int/lit8 v4, v4, 0x8

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object v4, v0, Lfm0;->C:Landroid/graphics/PorterDuffColorFilter;

    .line 30
    .line 31
    iget-object v5, v0, Lfm0;->x:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 34
    .line 35
    .line 36
    iget-object v4, v0, Lfm0;->j:Lem0;

    .line 37
    .line 38
    iget v4, v4, Lem0;->j:F

    .line 39
    .line 40
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/graphics/Paint;->getAlpha()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 48
    .line 49
    iget v6, v6, Lem0;->k:I

    .line 50
    .line 51
    ushr-int/lit8 v7, v6, 0x7

    .line 52
    .line 53
    add-int/2addr v6, v7

    .line 54
    mul-int/2addr v6, v4

    .line 55
    ushr-int/lit8 v6, v6, 0x8

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 58
    .line 59
    .line 60
    iget-boolean v6, v0, Lfm0;->n:Z

    .line 61
    .line 62
    iget-object v10, v0, Lfm0;->s:Landroid/graphics/RectF;

    .line 63
    .line 64
    const/high16 v14, 0x40000000    # 2.0f

    .line 65
    .line 66
    iget-object v12, v0, Lfm0;->q:Landroid/graphics/Path;

    .line 67
    .line 68
    iget-object v15, v0, Lfm0;->p:Landroid/graphics/Path;

    .line 69
    .line 70
    if-eqz v6, :cond_6

    .line 71
    .line 72
    invoke-virtual {v0}, Lfm0;->e()Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_0

    .line 77
    .line 78
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    div-float/2addr v6, v14

    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const/4 v6, 0x0

    .line 85
    :goto_0
    neg-float v6, v6

    .line 86
    iget-object v7, v0, Lfm0;->j:Lem0;

    .line 87
    .line 88
    iget-object v7, v7, Lem0;->a:Lr61;

    .line 89
    .line 90
    invoke-virtual {v7}, Lr61;->d()Lq61;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    iget-object v9, v7, Lr61;->e:Lnq;

    .line 95
    .line 96
    instance-of v11, v9, Luz0;

    .line 97
    .line 98
    if-eqz v11, :cond_1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    new-instance v11, Lu3;

    .line 102
    .line 103
    invoke-direct {v11, v6, v9}, Lu3;-><init>(FLnq;)V

    .line 104
    .line 105
    .line 106
    move-object v9, v11

    .line 107
    :goto_1
    iput-object v9, v8, Lq61;->e:Lnq;

    .line 108
    .line 109
    iget-object v9, v7, Lr61;->f:Lnq;

    .line 110
    .line 111
    instance-of v11, v9, Luz0;

    .line 112
    .line 113
    if-eqz v11, :cond_2

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_2
    new-instance v11, Lu3;

    .line 117
    .line 118
    invoke-direct {v11, v6, v9}, Lu3;-><init>(FLnq;)V

    .line 119
    .line 120
    .line 121
    move-object v9, v11

    .line 122
    :goto_2
    iput-object v9, v8, Lq61;->f:Lnq;

    .line 123
    .line 124
    iget-object v9, v7, Lr61;->h:Lnq;

    .line 125
    .line 126
    instance-of v11, v9, Luz0;

    .line 127
    .line 128
    if-eqz v11, :cond_3

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_3
    new-instance v11, Lu3;

    .line 132
    .line 133
    invoke-direct {v11, v6, v9}, Lu3;-><init>(FLnq;)V

    .line 134
    .line 135
    .line 136
    move-object v9, v11

    .line 137
    :goto_3
    iput-object v9, v8, Lq61;->h:Lnq;

    .line 138
    .line 139
    iget-object v7, v7, Lr61;->g:Lnq;

    .line 140
    .line 141
    instance-of v9, v7, Luz0;

    .line 142
    .line 143
    if-eqz v9, :cond_4

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_4
    new-instance v9, Lu3;

    .line 147
    .line 148
    invoke-direct {v9, v6, v7}, Lu3;-><init>(FLnq;)V

    .line 149
    .line 150
    .line 151
    move-object v7, v9

    .line 152
    :goto_4
    iput-object v7, v8, Lq61;->g:Lnq;

    .line 153
    .line 154
    invoke-virtual {v8}, Lq61;->a()Lr61;

    .line 155
    .line 156
    .line 157
    move-result-object v8

    .line 158
    iput-object v8, v0, Lfm0;->v:Lr61;

    .line 159
    .line 160
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 161
    .line 162
    iget v9, v6, Lem0;->i:F

    .line 163
    .line 164
    invoke-virtual {v0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-virtual {v10, v6}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0}, Lfm0;->e()Z

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    if-eqz v6, :cond_5

    .line 176
    .line 177
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    div-float/2addr v6, v14

    .line 182
    goto :goto_5

    .line 183
    :cond_5
    const/4 v6, 0x0

    .line 184
    :goto_5
    invoke-virtual {v10, v6, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 185
    .line 186
    .line 187
    const/4 v11, 0x0

    .line 188
    iget-object v7, v0, Lfm0;->A:Lt61;

    .line 189
    .line 190
    invoke-virtual/range {v7 .. v12}, Lt61;->a(Lr61;FLandroid/graphics/RectF;Lpa0;Landroid/graphics/Path;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    invoke-virtual {v0, v6, v15}, Lfm0;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 198
    .line 199
    .line 200
    const/4 v6, 0x0

    .line 201
    iput-boolean v6, v0, Lfm0;->n:Z

    .line 202
    .line 203
    :cond_6
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 204
    .line 205
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    iget v6, v6, Lem0;->n:I

    .line 209
    .line 210
    if-lez v6, :cond_9

    .line 211
    .line 212
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 213
    .line 214
    iget-object v6, v6, Lem0;->a:Lr61;

    .line 215
    .line 216
    invoke-virtual {v0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    invoke-virtual {v6, v7}, Lr61;->c(Landroid/graphics/RectF;)Z

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    if-nez v6, :cond_9

    .line 225
    .line 226
    invoke-virtual {v15}, Landroid/graphics/Path;->isConvex()Z

    .line 227
    .line 228
    .line 229
    move-result v6

    .line 230
    if-nez v6, :cond_9

    .line 231
    .line 232
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 233
    .line 234
    const/16 v7, 0x1d

    .line 235
    .line 236
    if-ge v6, v7, :cond_9

    .line 237
    .line 238
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 239
    .line 240
    .line 241
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 242
    .line 243
    iget v6, v6, Lem0;->o:I

    .line 244
    .line 245
    int-to-double v6, v6

    .line 246
    const-wide/16 v8, 0x0

    .line 247
    .line 248
    invoke-static {v8, v9}, Ljava/lang/Math;->toRadians(D)D

    .line 249
    .line 250
    .line 251
    move-result-wide v16

    .line 252
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sin(D)D

    .line 253
    .line 254
    .line 255
    move-result-wide v16

    .line 256
    mul-double v6, v6, v16

    .line 257
    .line 258
    double-to-int v6, v6

    .line 259
    iget-object v7, v0, Lfm0;->j:Lem0;

    .line 260
    .line 261
    iget v7, v7, Lem0;->o:I

    .line 262
    .line 263
    move-wide/from16 v16, v8

    .line 264
    .line 265
    int-to-double v8, v7

    .line 266
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->toRadians(D)D

    .line 267
    .line 268
    .line 269
    move-result-wide v16

    .line 270
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->cos(D)D

    .line 271
    .line 272
    .line 273
    move-result-wide v16

    .line 274
    mul-double v7, v16, v8

    .line 275
    .line 276
    double-to-int v7, v7

    .line 277
    int-to-float v6, v6

    .line 278
    int-to-float v7, v7

    .line 279
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 280
    .line 281
    .line 282
    iget-boolean v6, v0, Lfm0;->E:Z

    .line 283
    .line 284
    if-nez v6, :cond_7

    .line 285
    .line 286
    invoke-virtual/range {p0 .. p1}, Lfm0;->c(Landroid/graphics/Canvas;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_6

    .line 293
    .line 294
    :cond_7
    iget-object v6, v0, Lfm0;->D:Landroid/graphics/RectF;

    .line 295
    .line 296
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 297
    .line 298
    .line 299
    move-result v7

    .line 300
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 301
    .line 302
    .line 303
    move-result-object v8

    .line 304
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    .line 305
    .line 306
    .line 307
    move-result v8

    .line 308
    int-to-float v8, v8

    .line 309
    sub-float/2addr v7, v8

    .line 310
    float-to-int v7, v7

    .line 311
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 312
    .line 313
    .line 314
    move-result v8

    .line 315
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 316
    .line 317
    .line 318
    move-result-object v9

    .line 319
    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    .line 320
    .line 321
    .line 322
    move-result v9

    .line 323
    int-to-float v9, v9

    .line 324
    sub-float/2addr v8, v9

    .line 325
    float-to-int v8, v8

    .line 326
    if-ltz v7, :cond_8

    .line 327
    .line 328
    if-ltz v8, :cond_8

    .line 329
    .line 330
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 331
    .line 332
    .line 333
    move-result v9

    .line 334
    float-to-int v9, v9

    .line 335
    iget-object v11, v0, Lfm0;->j:Lem0;

    .line 336
    .line 337
    iget v11, v11, Lem0;->n:I

    .line 338
    .line 339
    mul-int/lit8 v11, v11, 0x2

    .line 340
    .line 341
    add-int/2addr v11, v9

    .line 342
    add-int/2addr v11, v7

    .line 343
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 344
    .line 345
    .line 346
    move-result v6

    .line 347
    float-to-int v6, v6

    .line 348
    iget-object v9, v0, Lfm0;->j:Lem0;

    .line 349
    .line 350
    iget v9, v9, Lem0;->n:I

    .line 351
    .line 352
    mul-int/lit8 v9, v9, 0x2

    .line 353
    .line 354
    add-int/2addr v9, v6

    .line 355
    add-int/2addr v9, v8

    .line 356
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 357
    .line 358
    invoke-static {v11, v9, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    new-instance v9, Landroid/graphics/Canvas;

    .line 363
    .line 364
    invoke-direct {v9, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 368
    .line 369
    .line 370
    move-result-object v11

    .line 371
    iget v11, v11, Landroid/graphics/Rect;->left:I

    .line 372
    .line 373
    iget-object v13, v0, Lfm0;->j:Lem0;

    .line 374
    .line 375
    iget v13, v13, Lem0;->n:I

    .line 376
    .line 377
    sub-int/2addr v11, v13

    .line 378
    sub-int/2addr v11, v7

    .line 379
    int-to-float v7, v11

    .line 380
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 381
    .line 382
    .line 383
    move-result-object v11

    .line 384
    iget v11, v11, Landroid/graphics/Rect;->top:I

    .line 385
    .line 386
    iget-object v13, v0, Lfm0;->j:Lem0;

    .line 387
    .line 388
    iget v13, v13, Lem0;->n:I

    .line 389
    .line 390
    sub-int/2addr v11, v13

    .line 391
    sub-int/2addr v11, v8

    .line 392
    int-to-float v8, v11

    .line 393
    neg-float v11, v7

    .line 394
    neg-float v13, v8

    .line 395
    invoke-virtual {v9, v11, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v0, v9}, Lfm0;->c(Landroid/graphics/Canvas;)V

    .line 399
    .line 400
    .line 401
    const/4 v9, 0x0

    .line 402
    invoke-virtual {v1, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 409
    .line 410
    .line 411
    goto :goto_6

    .line 412
    :cond_8
    const-string v0, "Invalid shadow bounds. Check that the treatments result in a valid path."

    .line 413
    .line 414
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    return-void

    .line 418
    :cond_9
    :goto_6
    iget-object v6, v0, Lfm0;->j:Lem0;

    .line 419
    .line 420
    iget-object v7, v6, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 421
    .line 422
    sget-object v8, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 423
    .line 424
    if-eq v7, v8, :cond_a

    .line 425
    .line 426
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 427
    .line 428
    if-ne v7, v8, :cond_c

    .line 429
    .line 430
    :cond_a
    iget-object v6, v6, Lem0;->a:Lr61;

    .line 431
    .line 432
    invoke-virtual {v0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 433
    .line 434
    .line 435
    move-result-object v7

    .line 436
    invoke-virtual {v6, v7}, Lr61;->c(Landroid/graphics/RectF;)Z

    .line 437
    .line 438
    .line 439
    move-result v8

    .line 440
    if-eqz v8, :cond_b

    .line 441
    .line 442
    iget-object v6, v6, Lr61;->f:Lnq;

    .line 443
    .line 444
    invoke-interface {v6, v7}, Lnq;->a(Landroid/graphics/RectF;)F

    .line 445
    .line 446
    .line 447
    move-result v6

    .line 448
    iget-object v8, v0, Lfm0;->j:Lem0;

    .line 449
    .line 450
    iget v8, v8, Lem0;->i:F

    .line 451
    .line 452
    mul-float/2addr v6, v8

    .line 453
    invoke-virtual {v1, v7, v6, v6, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 454
    .line 455
    .line 456
    goto :goto_7

    .line 457
    :cond_b
    invoke-virtual {v1, v15, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 458
    .line 459
    .line 460
    :cond_c
    :goto_7
    invoke-virtual {v0}, Lfm0;->e()Z

    .line 461
    .line 462
    .line 463
    move-result v6

    .line 464
    if-eqz v6, :cond_f

    .line 465
    .line 466
    iget-object v6, v0, Lfm0;->v:Lr61;

    .line 467
    .line 468
    invoke-virtual {v0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 469
    .line 470
    .line 471
    move-result-object v7

    .line 472
    invoke-virtual {v10, v7}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v0}, Lfm0;->e()Z

    .line 476
    .line 477
    .line 478
    move-result v7

    .line 479
    if-eqz v7, :cond_d

    .line 480
    .line 481
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 482
    .line 483
    .line 484
    move-result v7

    .line 485
    div-float v13, v7, v14

    .line 486
    .line 487
    goto :goto_8

    .line 488
    :cond_d
    const/4 v13, 0x0

    .line 489
    :goto_8
    invoke-virtual {v10, v13, v13}, Landroid/graphics/RectF;->inset(FF)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v6, v10}, Lr61;->c(Landroid/graphics/RectF;)Z

    .line 493
    .line 494
    .line 495
    move-result v7

    .line 496
    if-eqz v7, :cond_e

    .line 497
    .line 498
    iget-object v6, v6, Lr61;->f:Lnq;

    .line 499
    .line 500
    invoke-interface {v6, v10}, Lnq;->a(Landroid/graphics/RectF;)F

    .line 501
    .line 502
    .line 503
    move-result v6

    .line 504
    iget-object v0, v0, Lfm0;->j:Lem0;

    .line 505
    .line 506
    iget v0, v0, Lem0;->i:F

    .line 507
    .line 508
    mul-float/2addr v6, v0

    .line 509
    invoke-virtual {v1, v10, v6, v6, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 510
    .line 511
    .line 512
    goto :goto_9

    .line 513
    :cond_e
    invoke-virtual {v1, v12, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 514
    .line 515
    .line 516
    :cond_f
    :goto_9
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 517
    .line 518
    .line 519
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 520
    .line 521
    .line 522
    return-void
.end method

.method public final e()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget-object v0, v0, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lfm0;->x:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 v0, 0x0

    .line 20
    cmpl-float p0, p0, v0

    .line 21
    .line 22
    if-lez p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final f([I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget-object v0, v0, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lfm0;->w:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget-object v3, p0, Lfm0;->j:Lem0;

    .line 15
    .line 16
    iget-object v3, v3, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    invoke-virtual {v3, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eq v2, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    :goto_0
    iget-object v2, p0, Lfm0;->j:Lem0;

    .line 31
    .line 32
    iget-object v2, v2, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lfm0;->x:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 43
    .line 44
    iget-object p0, p0, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 45
    .line 46
    invoke-virtual {p0, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eq v3, p0, :cond_1

    .line 51
    .line 52
    invoke-virtual {v2, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 53
    .line 54
    .line 55
    return v1

    .line 56
    :cond_1
    return v0
.end method

.method public final g()Z
    .locals 8

    .line 1
    iget-object v0, p0, Lfm0;->B:Landroid/graphics/PorterDuffColorFilter;

    .line 2
    .line 3
    iget-object v1, p0, Lfm0;->C:Landroid/graphics/PorterDuffColorFilter;

    .line 4
    .line 5
    iget-object v2, p0, Lfm0;->j:Lem0;

    .line 6
    .line 7
    iget-object v3, v2, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    iget-object v2, v2, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v6, 0x1

    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    invoke-virtual {v3, v7, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-virtual {p0, v3}, Lfm0;->b(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    new-instance v7, Landroid/graphics/PorterDuffColorFilter;

    .line 32
    .line 33
    invoke-direct {v7, v3, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    iget-object v2, p0, Lfm0;->w:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p0, v2}, Lfm0;->b(I)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eq v3, v2, :cond_2

    .line 48
    .line 49
    new-instance v7, Landroid/graphics/PorterDuffColorFilter;

    .line 50
    .line 51
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 52
    .line 53
    invoke-direct {v7, v3, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    move-object v7, v4

    .line 58
    :goto_1
    iput-object v7, p0, Lfm0;->B:Landroid/graphics/PorterDuffColorFilter;

    .line 59
    .line 60
    iget-object v2, p0, Lfm0;->j:Lem0;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    iput-object v4, p0, Lfm0;->C:Landroid/graphics/PorterDuffColorFilter;

    .line 66
    .line 67
    iget-object v2, p0, Lfm0;->j:Lem0;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lfm0;->B:Landroid/graphics/PorterDuffColorFilter;

    .line 73
    .line 74
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    iget-object p0, p0, Lfm0;->C:Landroid/graphics/PorterDuffColorFilter;

    .line 81
    .line 82
    invoke-static {v1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_3

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    return v5

    .line 90
    :cond_4
    :goto_2
    return v6
.end method

.method public final getAlpha()I
    .locals 0

    .line 1
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget p0, p0, Lem0;->k:I

    .line 4
    .line 5
    return p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 7
    .line 8
    iget-object v0, v0, Lem0;->a:Lr61;

    .line 9
    .line 10
    invoke-virtual {p0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lr61;->c(Landroid/graphics/RectF;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 21
    .line 22
    iget-object v0, v0, Lem0;->a:Lr61;

    .line 23
    .line 24
    iget-object v0, v0, Lr61;->e:Lnq;

    .line 25
    .line 26
    invoke-virtual {p0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Lnq;->a(Landroid/graphics/RectF;)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lfm0;->j:Lem0;

    .line 35
    .line 36
    iget v1, v1, Lem0;->i:F

    .line 37
    .line 38
    mul-float/2addr v0, v1

    .line 39
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lfm0;->p:Landroid/graphics/Path;

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Lfm0;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 54
    .line 55
    .line 56
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const/16 v0, 0x1e

    .line 59
    .line 60
    if-lt p0, v0, :cond_1

    .line 61
    .line 62
    invoke-static {p1, v1}, Lf1;->n(Landroid/graphics/Outline;Landroid/graphics/Path;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    const/16 v0, 0x1d

    .line 67
    .line 68
    if-lt p0, v0, :cond_2

    .line 69
    .line 70
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    :catch_0
    return-void

    .line 74
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/Path;->isConvex()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method

.method public final getPadding(Landroid/graphics/Rect;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget-object v0, v0, Lem0;->g:Landroid/graphics/Rect;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final getTransparentRegion()Landroid/graphics/Region;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lfm0;->t:Landroid/graphics/Region;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/graphics/Region;->set(Landroid/graphics/Rect;)Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lfm0;->d()Landroid/graphics/RectF;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Lfm0;->p:Landroid/graphics/Path;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v2}, Lfm0;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lfm0;->u:Landroid/graphics/Region;

    .line 20
    .line 21
    invoke-virtual {p0, v2, v1}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    .line 22
    .line 23
    .line 24
    sget-object v0, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 25
    .line 26
    invoke-virtual {v1, p0, v0}, Landroid/graphics/Region;->op(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z

    .line 27
    .line 28
    .line 29
    return-object v1
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget v1, v0, Lem0;->m:F

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    add-float/2addr v1, v2

    .line 7
    const/high16 v2, 0x3f400000    # 0.75f

    .line 8
    .line 9
    mul-float/2addr v2, v1

    .line 10
    float-to-double v2, v2

    .line 11
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    double-to-int v2, v2

    .line 16
    iput v2, v0, Lem0;->n:I

    .line 17
    .line 18
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 19
    .line 20
    const/high16 v2, 0x3e800000    # 0.25f

    .line 21
    .line 22
    mul-float/2addr v1, v2

    .line 23
    float-to-double v1, v1

    .line 24
    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    double-to-int v1, v1

    .line 29
    iput v1, v0, Lem0;->o:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lfm0;->g()Z

    .line 32
    .line 33
    .line 34
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final invalidateSelf()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lfm0;->n:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final isStateful()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 8
    .line 9
    iget-object v0, v0, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 25
    .line 26
    iget-object v0, v0, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Lfm0;->j:Lem0;

    .line 37
    .line 38
    iget-object p0, p0, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    new-instance v0, Lem0;

    .line 2
    .line 3
    iget-object v1, p0, Lfm0;->j:Lem0;

    .line 4
    .line 5
    invoke-direct {v0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-object v2, v0, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    iput-object v2, v0, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 12
    .line 13
    iput-object v2, v0, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 14
    .line 15
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 16
    .line 17
    iput-object v3, v0, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 18
    .line 19
    iput-object v2, v0, Lem0;->g:Landroid/graphics/Rect;

    .line 20
    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v2, v0, Lem0;->h:F

    .line 24
    .line 25
    iput v2, v0, Lem0;->i:F

    .line 26
    .line 27
    const/16 v2, 0xff

    .line 28
    .line 29
    iput v2, v0, Lem0;->k:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    iput v2, v0, Lem0;->l:F

    .line 33
    .line 34
    iput v2, v0, Lem0;->m:F

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    iput v2, v0, Lem0;->n:I

    .line 38
    .line 39
    iput v2, v0, Lem0;->o:I

    .line 40
    .line 41
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 42
    .line 43
    iput-object v2, v0, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 44
    .line 45
    iget-object v2, v1, Lem0;->a:Lr61;

    .line 46
    .line 47
    iput-object v2, v0, Lem0;->a:Lr61;

    .line 48
    .line 49
    iget-object v2, v1, Lem0;->b:Ltz;

    .line 50
    .line 51
    iput-object v2, v0, Lem0;->b:Ltz;

    .line 52
    .line 53
    iget v2, v1, Lem0;->j:F

    .line 54
    .line 55
    iput v2, v0, Lem0;->j:F

    .line 56
    .line 57
    iget-object v2, v1, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 58
    .line 59
    iput-object v2, v0, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 60
    .line 61
    iget-object v2, v1, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 62
    .line 63
    iput-object v2, v0, Lem0;->d:Landroid/content/res/ColorStateList;

    .line 64
    .line 65
    iget-object v2, v1, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 66
    .line 67
    iput-object v2, v0, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 68
    .line 69
    iget-object v2, v1, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 70
    .line 71
    iput-object v2, v0, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 72
    .line 73
    iget v2, v1, Lem0;->k:I

    .line 74
    .line 75
    iput v2, v0, Lem0;->k:I

    .line 76
    .line 77
    iget v2, v1, Lem0;->h:F

    .line 78
    .line 79
    iput v2, v0, Lem0;->h:F

    .line 80
    .line 81
    iget v2, v1, Lem0;->o:I

    .line 82
    .line 83
    iput v2, v0, Lem0;->o:I

    .line 84
    .line 85
    iget v2, v1, Lem0;->i:F

    .line 86
    .line 87
    iput v2, v0, Lem0;->i:F

    .line 88
    .line 89
    iget v2, v1, Lem0;->l:F

    .line 90
    .line 91
    iput v2, v0, Lem0;->l:F

    .line 92
    .line 93
    iget v2, v1, Lem0;->m:F

    .line 94
    .line 95
    iput v2, v0, Lem0;->m:F

    .line 96
    .line 97
    iget v2, v1, Lem0;->n:I

    .line 98
    .line 99
    iput v2, v0, Lem0;->n:I

    .line 100
    .line 101
    iget-object v2, v1, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 102
    .line 103
    iput-object v2, v0, Lem0;->p:Landroid/graphics/Paint$Style;

    .line 104
    .line 105
    iget-object v1, v1, Lem0;->g:Landroid/graphics/Rect;

    .line 106
    .line 107
    if-eqz v1, :cond_0

    .line 108
    .line 109
    new-instance v2, Landroid/graphics/Rect;

    .line 110
    .line 111
    invoke-direct {v2, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    iput-object v2, v0, Lem0;->g:Landroid/graphics/Rect;

    .line 115
    .line 116
    :cond_0
    iput-object v0, p0, Lfm0;->j:Lem0;

    .line 117
    .line 118
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lfm0;->n:Z

    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final onStateChange([I)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lfm0;->f([I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Lfm0;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 17
    :goto_1
    if-eqz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Lfm0;->invalidateSelf()V

    .line 20
    .line 21
    .line 22
    :cond_2
    return p1
.end method

.method public final setAlpha(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget v1, v0, Lem0;->k:I

    .line 4
    .line 5
    if-eq v1, p1, :cond_0

    .line 6
    .line 7
    iput p1, v0, Lem0;->k:I

    .line 8
    .line 9
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final setShapeAppearanceModel(Lr61;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iput-object p1, v0, Lem0;->a:Lr61;

    .line 4
    .line 5
    invoke-virtual {p0}, Lfm0;->invalidateSelf()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setTint(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lfm0;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iput-object p1, v0, Lem0;->e:Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    invoke-virtual {p0}, Lfm0;->g()Z

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 2
    .line 3
    iget-object v1, v0, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    if-eq v1, p1, :cond_0

    .line 6
    .line 7
    iput-object p1, v0, Lem0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    invoke-virtual {p0}, Lfm0;->g()Z

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
