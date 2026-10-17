.class public Landroidx/constraintlayout/widget/ConstraintLayout;
.super Landroid/view/ViewGroup;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final j:Landroid/util/SparseArray;

.field public final k:Ljava/util/ArrayList;

.field public final l:Lqp;

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:Z

.field public r:I

.field public s:Lop;

.field public t:Ls7;

.field public u:I

.field public v:Ljava/util/HashMap;

.field public final w:Landroid/util/SparseArray;

.field public final x:Lgp;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    new-instance p1, Lqp;

    .line 20
    .line 21
    invoke-direct {p1}, Lqp;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 28
    .line 29
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 30
    .line 31
    const p1, 0x7fffffff

    .line 32
    .line 33
    .line 34
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 35
    .line 36
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 40
    .line 41
    const/16 p1, 0x107

    .line 42
    .line 43
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 47
    .line 48
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ls7;

    .line 49
    .line 50
    const/4 v0, -0x1

    .line 51
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 52
    .line 53
    new-instance v0, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:Ljava/util/HashMap;

    .line 59
    .line 60
    new-instance v0, Landroid/util/SparseArray;

    .line 61
    .line 62
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 66
    .line 67
    new-instance v0, Lgp;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Lgp;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Lgp;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->b(Landroid/util/AttributeSet;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 78
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 79
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 80
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 81
    new-instance p1, Lqp;

    invoke-direct {p1}, Lqp;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    const/4 p1, 0x0

    .line 82
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 83
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    const p1, 0x7fffffff

    .line 84
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 85
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    const/4 p1, 0x1

    .line 86
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    const/16 p1, 0x107

    .line 87
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    const/4 p1, 0x0

    .line 88
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 89
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ls7;

    const/4 p1, -0x1

    .line 90
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 91
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:Ljava/util/HashMap;

    .line 92
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 93
    new-instance p1, Lgp;

    invoke-direct {p1, p0}, Lgp;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Lgp;

    .line 94
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->b(Landroid/util/AttributeSet;)V

    return-void
.end method

.method private getPaddingWidth()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, v0

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/2addr p0, v0

    .line 36
    if-lez p0, :cond_0

    .line 37
    .line 38
    return p0

    .line 39
    :cond_0
    return v2
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lpp;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    if-nez p1, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lfp;

    .line 15
    .line 16
    iget-object p0, p0, Lfp;->j0:Lpp;

    .line 17
    .line 18
    return-object p0
.end method

.method public final b(Landroid/util/AttributeSet;)V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 2
    .line 3
    iput-object p0, v0, Lpp;->U:Landroid/view/View;

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Lgp;

    .line 6
    .line 7
    iput-object v1, v0, Lqp;->g0:Lgp;

    .line 8
    .line 9
    iget-object v2, v0, Lqp;->f0:Lex;

    .line 10
    .line 11
    iput-object v1, v2, Lex;->f:Lgp;

    .line 12
    .line 13
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v1, v2, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz p1, :cond_8

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    sget-object v4, Lax0;->b:[I

    .line 33
    .line 34
    invoke-virtual {v3, p1, v4, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    move v4, v2

    .line 43
    :goto_0
    if-ge v4, v3, :cond_7

    .line 44
    .line 45
    invoke-virtual {p1, v4}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/16 v6, 0x9

    .line 50
    .line 51
    if-ne v5, v6, :cond_0

    .line 52
    .line 53
    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 54
    .line 55
    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_0
    const/16 v6, 0xa

    .line 63
    .line 64
    if-ne v5, v6, :cond_1

    .line 65
    .line 66
    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 67
    .line 68
    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    const/4 v6, 0x7

    .line 76
    if-ne v5, v6, :cond_2

    .line 77
    .line 78
    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 79
    .line 80
    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_2
    const/16 v6, 0x8

    .line 88
    .line 89
    if-ne v5, v6, :cond_3

    .line 90
    .line 91
    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 92
    .line 93
    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_3
    const/16 v6, 0x59

    .line 101
    .line 102
    if-ne v5, v6, :cond_4

    .line 103
    .line 104
    iget v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 105
    .line 106
    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    const/16 v6, 0x26

    .line 114
    .line 115
    if-ne v5, v6, :cond_5

    .line 116
    .line 117
    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-eqz v5, :cond_6

    .line 122
    .line 123
    :try_start_0
    invoke-virtual {p0, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->c(I)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :catch_0
    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ls7;

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_5
    const/16 v6, 0x12

    .line 131
    .line 132
    if-ne v5, v6, :cond_6

    .line 133
    .line 134
    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    :try_start_1
    new-instance v6, Lop;

    .line 139
    .line 140
    invoke-direct {v6}, Lop;-><init>()V

    .line 141
    .line 142
    .line 143
    iput-object v6, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    invoke-virtual {v6, v7, v5}, Lop;->d(Landroid/content/Context;I)V
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :catch_1
    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 154
    .line 155
    :goto_1
    iput v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 156
    .line 157
    :cond_6
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 161
    .line 162
    .line 163
    :cond_8
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 164
    .line 165
    iput p0, v0, Lqp;->p0:I

    .line 166
    .line 167
    const/16 p1, 0x100

    .line 168
    .line 169
    and-int/2addr p0, p1

    .line 170
    if-ne p0, p1, :cond_9

    .line 171
    .line 172
    const/4 v2, 0x1

    .line 173
    :cond_9
    sput-boolean v2, Lpi0;->p:Z

    .line 174
    .line 175
    return-void
.end method

.method public final c(I)V
    .locals 5

    .line 1
    new-instance v0, Ls7;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/16 v2, 0xb

    .line 8
    .line 9
    invoke-direct {v0, v2}, Ls7;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v2, v0, Ls7;->k:Ljava/lang/Object;

    .line 18
    .line 19
    new-instance v2, Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v2, v0, Ls7;->l:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :try_start_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x0

    .line 39
    :goto_0
    const/4 v4, 0x1

    .line 40
    if-eq v2, v4, :cond_3

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    const/4 v4, 0x2

    .line 45
    if-eq v2, v4, :cond_0

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    sparse-switch v4, :sswitch_data_0

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :sswitch_0
    const-string v4, "Variant"

    .line 61
    .line 62
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    new-instance v2, Lip;

    .line 69
    .line 70
    invoke-direct {v2, v1, p1}, Lip;-><init>(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)V

    .line 71
    .line 72
    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    iget-object v4, v3, Lhp;->c:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v4, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :catch_0
    move-exception p1

    .line 84
    goto :goto_3

    .line 85
    :catch_1
    move-exception p1

    .line 86
    goto :goto_4

    .line 87
    :sswitch_1
    const-string v4, "layoutDescription"

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :sswitch_2
    const-string v4, "StateSet"

    .line 91
    .line 92
    :goto_1
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    goto :goto_2

    .line 97
    :sswitch_3
    const-string v4, "State"

    .line 98
    .line 99
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    new-instance v3, Lhp;

    .line 106
    .line 107
    invoke-direct {v3, v1, p1}, Lhp;-><init>(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)V

    .line 108
    .line 109
    .line 110
    iget-object v2, v0, Ls7;->k:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v2, Landroid/util/SparseArray;

    .line 113
    .line 114
    iget v4, v3, Lhp;->a:I

    .line 115
    .line 116
    invoke-virtual {v2, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :sswitch_4
    const-string v4, "ConstraintSet"

    .line 121
    .line 122
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    invoke-virtual {v0, v1, p1}, Ls7;->F(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    :cond_2
    :goto_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 136
    .line 137
    .line 138
    move-result v2
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    goto :goto_0

    .line 140
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 141
    .line 142
    .line 143
    goto :goto_5

    .line 144
    :goto_4
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 145
    .line 146
    .line 147
    :cond_3
    :goto_5
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ls7;

    .line 148
    .line 149
    return-void

    .line 150
    nop

    .line 151
    :sswitch_data_0
    .sparse-switch
        -0x50764adb -> :sswitch_4
        0x4c7d471 -> :sswitch_3
        0x526c4e31 -> :sswitch_2
        0x62ce7272 -> :sswitch_1
        0x7155a865 -> :sswitch_0
    .end sparse-switch
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lfp;

    .line 2
    .line 3
    return p0
.end method

.method public final d(Lqp;III)V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-static/range {p3 .. p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-static/range {p3 .. p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    invoke-static/range {p4 .. p4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-static/range {p4 .. p4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    const/4 v8, 0x0

    .line 28
    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result v9

    .line 36
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    add-int v10, v7, v9

    .line 41
    .line 42
    invoke-direct {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    .line 43
    .line 44
    .line 45
    move-result v11

    .line 46
    iget-object v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Lgp;

    .line 47
    .line 48
    iput v7, v12, Lgp;->b:I

    .line 49
    .line 50
    iput v9, v12, Lgp;->c:I

    .line 51
    .line 52
    iput v11, v12, Lgp;->d:I

    .line 53
    .line 54
    iput v10, v12, Lgp;->e:I

    .line 55
    .line 56
    move/from16 v9, p3

    .line 57
    .line 58
    iput v9, v12, Lgp;->f:I

    .line 59
    .line 60
    move/from16 v9, p4

    .line 61
    .line 62
    iput v9, v12, Lgp;->g:I

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getPaddingEnd()I

    .line 73
    .line 74
    .line 75
    move-result v13

    .line 76
    invoke-static {v8, v13}, Ljava/lang/Math;->max(II)I

    .line 77
    .line 78
    .line 79
    move-result v13

    .line 80
    const/4 v14, 0x1

    .line 81
    if-gtz v9, :cond_1

    .line 82
    .line 83
    if-lez v13, :cond_0

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 87
    .line 88
    .line 89
    move-result v9

    .line 90
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v15

    .line 99
    invoke-virtual {v15}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v15

    .line 103
    iget v15, v15, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 104
    .line 105
    const/high16 v16, 0x400000

    .line 106
    .line 107
    and-int v15, v15, v16

    .line 108
    .line 109
    if-eqz v15, :cond_2

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    .line 112
    .line 113
    .line 114
    move-result v15

    .line 115
    if-ne v14, v15, :cond_2

    .line 116
    .line 117
    move v9, v13

    .line 118
    :cond_2
    :goto_1
    sub-int/2addr v4, v11

    .line 119
    sub-int/2addr v6, v10

    .line 120
    iget v10, v12, Lgp;->e:I

    .line 121
    .line 122
    iget v11, v12, Lgp;->d:I

    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 125
    .line 126
    .line 127
    move-result v12

    .line 128
    const/high16 v15, 0x40000000    # 2.0f

    .line 129
    .line 130
    const/high16 v13, -0x80000000

    .line 131
    .line 132
    if-eq v3, v13, :cond_6

    .line 133
    .line 134
    if-eqz v3, :cond_4

    .line 135
    .line 136
    if-eq v3, v15, :cond_3

    .line 137
    .line 138
    move/from16 v17, v8

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_3
    iget v14, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 142
    .line 143
    sub-int/2addr v14, v11

    .line 144
    invoke-static {v14, v4}, Ljava/lang/Math;->min(II)I

    .line 145
    .line 146
    .line 147
    move-result v14

    .line 148
    move/from16 v17, v14

    .line 149
    .line 150
    const/4 v14, 0x1

    .line 151
    goto :goto_4

    .line 152
    :cond_4
    if-nez v12, :cond_5

    .line 153
    .line 154
    iget v14, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 155
    .line 156
    invoke-static {v8, v14}, Ljava/lang/Math;->max(II)I

    .line 157
    .line 158
    .line 159
    move-result v14

    .line 160
    :goto_2
    move/from16 v17, v14

    .line 161
    .line 162
    :goto_3
    const/4 v14, 0x2

    .line 163
    goto :goto_4

    .line 164
    :cond_5
    move/from16 v17, v8

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_6
    if-nez v12, :cond_7

    .line 168
    .line 169
    iget v14, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 170
    .line 171
    invoke-static {v8, v14}, Ljava/lang/Math;->max(II)I

    .line 172
    .line 173
    .line 174
    move-result v14

    .line 175
    goto :goto_2

    .line 176
    :cond_7
    move/from16 v17, v4

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :goto_4
    if-eq v5, v13, :cond_b

    .line 180
    .line 181
    if-eqz v5, :cond_9

    .line 182
    .line 183
    if-eq v5, v15, :cond_8

    .line 184
    .line 185
    move v13, v8

    .line 186
    :goto_5
    const/4 v12, 0x1

    .line 187
    goto :goto_8

    .line 188
    :cond_8
    iget v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 189
    .line 190
    sub-int/2addr v12, v10

    .line 191
    invoke-static {v12, v6}, Ljava/lang/Math;->min(II)I

    .line 192
    .line 193
    .line 194
    move-result v12

    .line 195
    move v13, v12

    .line 196
    goto :goto_5

    .line 197
    :cond_9
    if-nez v12, :cond_a

    .line 198
    .line 199
    iget v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 200
    .line 201
    invoke-static {v8, v12}, Ljava/lang/Math;->max(II)I

    .line 202
    .line 203
    .line 204
    move-result v12

    .line 205
    :goto_6
    move v13, v12

    .line 206
    :goto_7
    const/4 v12, 0x2

    .line 207
    goto :goto_8

    .line 208
    :cond_a
    move v13, v8

    .line 209
    goto :goto_7

    .line 210
    :cond_b
    if-nez v12, :cond_c

    .line 211
    .line 212
    iget v12, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 213
    .line 214
    invoke-static {v8, v12}, Ljava/lang/Math;->max(II)I

    .line 215
    .line 216
    .line 217
    move-result v12

    .line 218
    goto :goto_6

    .line 219
    :cond_c
    move v13, v6

    .line 220
    goto :goto_7

    .line 221
    :goto_8
    invoke-virtual {v1}, Lpp;->j()I

    .line 222
    .line 223
    .line 224
    move-result v15

    .line 225
    iget-object v8, v1, Lqp;->f0:Lex;

    .line 226
    .line 227
    move/from16 v19, v10

    .line 228
    .line 229
    iget-object v10, v1, Lpp;->u:[I

    .line 230
    .line 231
    move-object/from16 v20, v10

    .line 232
    .line 233
    move/from16 v10, v17

    .line 234
    .line 235
    if-ne v10, v15, :cond_d

    .line 236
    .line 237
    invoke-virtual {v1}, Lpp;->g()I

    .line 238
    .line 239
    .line 240
    move-result v15

    .line 241
    if-eq v13, v15, :cond_e

    .line 242
    .line 243
    :cond_d
    const/4 v15, 0x1

    .line 244
    goto :goto_a

    .line 245
    :cond_e
    const/16 p4, 0x1

    .line 246
    .line 247
    :goto_9
    const/4 v15, 0x0

    .line 248
    goto :goto_b

    .line 249
    :goto_a
    iput-boolean v15, v8, Lex;->c:Z

    .line 250
    .line 251
    move/from16 p4, v15

    .line 252
    .line 253
    goto :goto_9

    .line 254
    :goto_b
    iput v15, v1, Lpp;->N:I

    .line 255
    .line 256
    iput v15, v1, Lpp;->O:I

    .line 257
    .line 258
    move/from16 v18, v15

    .line 259
    .line 260
    iget v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 261
    .line 262
    sub-int/2addr v15, v11

    .line 263
    aput v15, v20, v18

    .line 264
    .line 265
    iget v15, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 266
    .line 267
    sub-int v15, v15, v19

    .line 268
    .line 269
    aput v15, v20, p4

    .line 270
    .line 271
    move/from16 v15, v18

    .line 272
    .line 273
    iput v15, v1, Lpp;->Q:I

    .line 274
    .line 275
    iput v15, v1, Lpp;->R:I

    .line 276
    .line 277
    invoke-virtual {v1, v14}, Lpp;->t(I)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v1, v10}, Lpp;->v(I)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1, v12}, Lpp;->u(I)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v1, v13}, Lpp;->s(I)V

    .line 287
    .line 288
    .line 289
    iget v10, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 290
    .line 291
    sub-int/2addr v10, v11

    .line 292
    if-gez v10, :cond_f

    .line 293
    .line 294
    iput v15, v1, Lpp;->Q:I

    .line 295
    .line 296
    goto :goto_c

    .line 297
    :cond_f
    iput v10, v1, Lpp;->Q:I

    .line 298
    .line 299
    :goto_c
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 300
    .line 301
    sub-int v0, v0, v19

    .line 302
    .line 303
    if-gez v0, :cond_10

    .line 304
    .line 305
    iput v15, v1, Lpp;->R:I

    .line 306
    .line 307
    goto :goto_d

    .line 308
    :cond_10
    iput v0, v1, Lpp;->R:I

    .line 309
    .line 310
    :goto_d
    iput v9, v1, Lqp;->j0:I

    .line 311
    .line 312
    iput v7, v1, Lqp;->k0:I

    .line 313
    .line 314
    iget-object v0, v1, Lqp;->e0:Lc9;

    .line 315
    .line 316
    iget-object v7, v0, Lc9;->m:Ljava/lang/Object;

    .line 317
    .line 318
    check-cast v7, Lqp;

    .line 319
    .line 320
    iget-object v9, v0, Lc9;->k:Ljava/lang/Object;

    .line 321
    .line 322
    check-cast v9, Ljava/util/ArrayList;

    .line 323
    .line 324
    iget-object v10, v1, Lqp;->g0:Lgp;

    .line 325
    .line 326
    iget-object v11, v1, Lqp;->d0:Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 329
    .line 330
    .line 331
    move-result v11

    .line 332
    invoke-virtual {v1}, Lpp;->j()I

    .line 333
    .line 334
    .line 335
    move-result v12

    .line 336
    invoke-virtual {v1}, Lpp;->g()I

    .line 337
    .line 338
    .line 339
    move-result v13

    .line 340
    and-int/lit16 v14, v2, 0x80

    .line 341
    .line 342
    const/16 v15, 0x80

    .line 343
    .line 344
    if-ne v14, v15, :cond_11

    .line 345
    .line 346
    const/4 v14, 0x1

    .line 347
    goto :goto_e

    .line 348
    :cond_11
    const/4 v14, 0x0

    .line 349
    :goto_e
    if-nez v14, :cond_13

    .line 350
    .line 351
    const/16 v15, 0x40

    .line 352
    .line 353
    and-int/2addr v2, v15

    .line 354
    if-ne v2, v15, :cond_12

    .line 355
    .line 356
    goto :goto_f

    .line 357
    :cond_12
    const/4 v2, 0x0

    .line 358
    goto :goto_10

    .line 359
    :cond_13
    :goto_f
    const/4 v2, 0x1

    .line 360
    :goto_10
    if-eqz v2, :cond_1b

    .line 361
    .line 362
    const/4 v15, 0x0

    .line 363
    :goto_11
    if-ge v15, v11, :cond_1b

    .line 364
    .line 365
    move/from16 p2, v2

    .line 366
    .line 367
    iget-object v2, v1, Lqp;->d0:Ljava/util/ArrayList;

    .line 368
    .line 369
    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    check-cast v2, Lpp;

    .line 374
    .line 375
    move/from16 v17, v11

    .line 376
    .line 377
    iget-object v11, v2, Lpp;->c0:[I

    .line 378
    .line 379
    move-object/from16 v19, v11

    .line 380
    .line 381
    const/16 v18, 0x0

    .line 382
    .line 383
    aget v11, v19, v18

    .line 384
    .line 385
    move/from16 v21, v15

    .line 386
    .line 387
    const/4 v15, 0x3

    .line 388
    if-ne v11, v15, :cond_14

    .line 389
    .line 390
    const/16 v23, 0x1

    .line 391
    .line 392
    :goto_12
    const/16 v22, 0x1

    .line 393
    .line 394
    goto :goto_13

    .line 395
    :cond_14
    const/16 v23, 0x0

    .line 396
    .line 397
    goto :goto_12

    .line 398
    :goto_13
    aget v11, v19, v22

    .line 399
    .line 400
    if-ne v11, v15, :cond_15

    .line 401
    .line 402
    const/4 v11, 0x1

    .line 403
    goto :goto_14

    .line 404
    :cond_15
    const/4 v11, 0x0

    .line 405
    :goto_14
    if-eqz v23, :cond_16

    .line 406
    .line 407
    if-eqz v11, :cond_16

    .line 408
    .line 409
    iget v11, v2, Lpp;->L:F

    .line 410
    .line 411
    const/4 v15, 0x0

    .line 412
    cmpl-float v11, v11, v15

    .line 413
    .line 414
    if-lez v11, :cond_16

    .line 415
    .line 416
    const/4 v11, 0x1

    .line 417
    goto :goto_15

    .line 418
    :cond_16
    const/4 v11, 0x0

    .line 419
    :goto_15
    invoke-virtual {v2}, Lpp;->o()Z

    .line 420
    .line 421
    .line 422
    move-result v15

    .line 423
    if-eqz v15, :cond_18

    .line 424
    .line 425
    if-eqz v11, :cond_18

    .line 426
    .line 427
    :cond_17
    :goto_16
    const/4 v2, 0x0

    .line 428
    :goto_17
    const/high16 v11, 0x40000000    # 2.0f

    .line 429
    .line 430
    goto :goto_18

    .line 431
    :cond_18
    invoke-virtual {v2}, Lpp;->p()Z

    .line 432
    .line 433
    .line 434
    move-result v15

    .line 435
    if-eqz v15, :cond_19

    .line 436
    .line 437
    if-eqz v11, :cond_19

    .line 438
    .line 439
    goto :goto_16

    .line 440
    :cond_19
    invoke-virtual {v2}, Lpp;->o()Z

    .line 441
    .line 442
    .line 443
    move-result v11

    .line 444
    if-nez v11, :cond_17

    .line 445
    .line 446
    invoke-virtual {v2}, Lpp;->p()Z

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    if-eqz v2, :cond_1a

    .line 451
    .line 452
    goto :goto_16

    .line 453
    :cond_1a
    add-int/lit8 v15, v21, 0x1

    .line 454
    .line 455
    move/from16 v2, p2

    .line 456
    .line 457
    move/from16 v11, v17

    .line 458
    .line 459
    goto :goto_11

    .line 460
    :cond_1b
    move/from16 p2, v2

    .line 461
    .line 462
    move/from16 v17, v11

    .line 463
    .line 464
    move/from16 v2, p2

    .line 465
    .line 466
    goto :goto_17

    .line 467
    :goto_18
    if-ne v3, v11, :cond_1c

    .line 468
    .line 469
    if-eq v5, v11, :cond_1d

    .line 470
    .line 471
    :cond_1c
    if-eqz v14, :cond_1e

    .line 472
    .line 473
    :cond_1d
    const/4 v11, 0x1

    .line 474
    goto :goto_19

    .line 475
    :cond_1e
    const/4 v11, 0x0

    .line 476
    :goto_19
    and-int/2addr v2, v11

    .line 477
    if-eqz v2, :cond_3e

    .line 478
    .line 479
    const/16 v18, 0x0

    .line 480
    .line 481
    aget v2, v20, v18

    .line 482
    .line 483
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 484
    .line 485
    .line 486
    move-result v2

    .line 487
    const/4 v15, 0x1

    .line 488
    aget v4, v20, v15

    .line 489
    .line 490
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    .line 491
    .line 492
    .line 493
    move-result v4

    .line 494
    const/high16 v6, 0x40000000    # 2.0f

    .line 495
    .line 496
    if-ne v3, v6, :cond_1f

    .line 497
    .line 498
    invoke-virtual {v1}, Lpp;->j()I

    .line 499
    .line 500
    .line 501
    move-result v11

    .line 502
    if-eq v11, v2, :cond_1f

    .line 503
    .line 504
    invoke-virtual {v1, v2}, Lpp;->v(I)V

    .line 505
    .line 506
    .line 507
    iput-boolean v15, v8, Lex;->b:Z

    .line 508
    .line 509
    :cond_1f
    if-ne v5, v6, :cond_20

    .line 510
    .line 511
    invoke-virtual {v1}, Lpp;->g()I

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    if-eq v2, v4, :cond_20

    .line 516
    .line 517
    invoke-virtual {v1, v4}, Lpp;->s(I)V

    .line 518
    .line 519
    .line 520
    iput-boolean v15, v8, Lex;->b:Z

    .line 521
    .line 522
    :cond_20
    if-ne v3, v6, :cond_37

    .line 523
    .line 524
    if-ne v5, v6, :cond_37

    .line 525
    .line 526
    iget-object v2, v8, Lex;->e:Ljava/util/ArrayList;

    .line 527
    .line 528
    iget-object v4, v8, Lex;->a:Lqp;

    .line 529
    .line 530
    iget-boolean v6, v8, Lex;->b:Z

    .line 531
    .line 532
    if-nez v6, :cond_22

    .line 533
    .line 534
    iget-boolean v6, v8, Lex;->c:Z

    .line 535
    .line 536
    if-eqz v6, :cond_21

    .line 537
    .line 538
    goto :goto_1a

    .line 539
    :cond_21
    const/4 v15, 0x0

    .line 540
    goto :goto_1c

    .line 541
    :cond_22
    :goto_1a
    iget-object v6, v4, Lqp;->d0:Ljava/util/ArrayList;

    .line 542
    .line 543
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 544
    .line 545
    .line 546
    move-result v11

    .line 547
    const/4 v15, 0x0

    .line 548
    :goto_1b
    if-ge v15, v11, :cond_23

    .line 549
    .line 550
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 551
    .line 552
    .line 553
    move-result-object v19

    .line 554
    add-int/lit8 v15, v15, 0x1

    .line 555
    .line 556
    move-object/from16 v20, v6

    .line 557
    .line 558
    move-object/from16 v6, v19

    .line 559
    .line 560
    check-cast v6, Lpp;

    .line 561
    .line 562
    move/from16 v19, v11

    .line 563
    .line 564
    const/4 v11, 0x0

    .line 565
    iput-boolean v11, v6, Lpp;->a:Z

    .line 566
    .line 567
    iget-object v11, v6, Lpp;->d:Lbc0;

    .line 568
    .line 569
    invoke-virtual {v11}, Lbc0;->n()V

    .line 570
    .line 571
    .line 572
    iget-object v6, v6, Lpp;->e:Lgh1;

    .line 573
    .line 574
    invoke-virtual {v6}, Lgh1;->m()V

    .line 575
    .line 576
    .line 577
    move/from16 v11, v19

    .line 578
    .line 579
    move-object/from16 v6, v20

    .line 580
    .line 581
    goto :goto_1b

    .line 582
    :cond_23
    const/4 v15, 0x0

    .line 583
    iput-boolean v15, v4, Lpp;->a:Z

    .line 584
    .line 585
    iget-object v6, v4, Lpp;->d:Lbc0;

    .line 586
    .line 587
    invoke-virtual {v6}, Lbc0;->n()V

    .line 588
    .line 589
    .line 590
    iget-object v6, v4, Lpp;->e:Lgh1;

    .line 591
    .line 592
    invoke-virtual {v6}, Lgh1;->m()V

    .line 593
    .line 594
    .line 595
    iput-boolean v15, v8, Lex;->c:Z

    .line 596
    .line 597
    :goto_1c
    iget-object v6, v8, Lex;->d:Lqp;

    .line 598
    .line 599
    invoke-virtual {v8, v6}, Lex;->b(Lqp;)V

    .line 600
    .line 601
    .line 602
    iput v15, v4, Lpp;->N:I

    .line 603
    .line 604
    iget-object v6, v4, Lpp;->c0:[I

    .line 605
    .line 606
    iget-object v11, v4, Lpp;->e:Lgh1;

    .line 607
    .line 608
    move-object/from16 v19, v6

    .line 609
    .line 610
    iget-object v6, v4, Lpp;->d:Lbc0;

    .line 611
    .line 612
    iput v15, v4, Lpp;->O:I

    .line 613
    .line 614
    move-object/from16 v20, v10

    .line 615
    .line 616
    invoke-virtual {v4, v15}, Lpp;->f(I)I

    .line 617
    .line 618
    .line 619
    move-result v10

    .line 620
    move-object/from16 v21, v9

    .line 621
    .line 622
    const/4 v15, 0x1

    .line 623
    invoke-virtual {v4, v15}, Lpp;->f(I)I

    .line 624
    .line 625
    .line 626
    move-result v9

    .line 627
    iget-boolean v15, v8, Lex;->b:Z

    .line 628
    .line 629
    if-eqz v15, :cond_24

    .line 630
    .line 631
    invoke-virtual {v8}, Lex;->c()V

    .line 632
    .line 633
    .line 634
    :cond_24
    invoke-virtual {v4}, Lpp;->k()I

    .line 635
    .line 636
    .line 637
    move-result v15

    .line 638
    move-object/from16 v22, v7

    .line 639
    .line 640
    invoke-virtual {v4}, Lpp;->l()I

    .line 641
    .line 642
    .line 643
    move-result v7

    .line 644
    move/from16 v23, v12

    .line 645
    .line 646
    iget-object v12, v6, Loj1;->h:Lfx;

    .line 647
    .line 648
    move/from16 v24, v13

    .line 649
    .line 650
    iget-object v13, v6, Loj1;->e:Lrx;

    .line 651
    .line 652
    invoke-virtual {v12, v15}, Lfx;->d(I)V

    .line 653
    .line 654
    .line 655
    iget-object v12, v11, Loj1;->h:Lfx;

    .line 656
    .line 657
    move/from16 v25, v15

    .line 658
    .line 659
    iget-object v15, v11, Loj1;->e:Lrx;

    .line 660
    .line 661
    invoke-virtual {v12, v7}, Lfx;->d(I)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v8}, Lex;->g()V

    .line 665
    .line 666
    .line 667
    const/4 v12, 0x2

    .line 668
    if-eq v10, v12, :cond_27

    .line 669
    .line 670
    if-ne v9, v12, :cond_25

    .line 671
    .line 672
    goto :goto_1e

    .line 673
    :cond_25
    move/from16 v26, v7

    .line 674
    .line 675
    :cond_26
    const/4 v7, 0x1

    .line 676
    :goto_1d
    const/16 v18, 0x0

    .line 677
    .line 678
    goto :goto_20

    .line 679
    :cond_27
    :goto_1e
    if-eqz v14, :cond_29

    .line 680
    .line 681
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 682
    .line 683
    .line 684
    move-result v12

    .line 685
    move/from16 v26, v7

    .line 686
    .line 687
    const/4 v7, 0x0

    .line 688
    :cond_28
    if-ge v7, v12, :cond_2a

    .line 689
    .line 690
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v27

    .line 694
    add-int/lit8 v7, v7, 0x1

    .line 695
    .line 696
    check-cast v27, Loj1;

    .line 697
    .line 698
    invoke-virtual/range {v27 .. v27}, Loj1;->k()Z

    .line 699
    .line 700
    .line 701
    move-result v27

    .line 702
    if-nez v27, :cond_28

    .line 703
    .line 704
    const/4 v14, 0x0

    .line 705
    goto :goto_1f

    .line 706
    :cond_29
    move/from16 v26, v7

    .line 707
    .line 708
    :cond_2a
    :goto_1f
    if-eqz v14, :cond_2b

    .line 709
    .line 710
    const/4 v12, 0x2

    .line 711
    if-ne v10, v12, :cond_2b

    .line 712
    .line 713
    const/4 v7, 0x1

    .line 714
    invoke-virtual {v4, v7}, Lpp;->t(I)V

    .line 715
    .line 716
    .line 717
    const/4 v7, 0x0

    .line 718
    invoke-virtual {v8, v4, v7}, Lex;->d(Lqp;I)I

    .line 719
    .line 720
    .line 721
    move-result v12

    .line 722
    invoke-virtual {v4, v12}, Lpp;->v(I)V

    .line 723
    .line 724
    .line 725
    invoke-virtual {v4}, Lpp;->j()I

    .line 726
    .line 727
    .line 728
    move-result v7

    .line 729
    invoke-virtual {v13, v7}, Lrx;->d(I)V

    .line 730
    .line 731
    .line 732
    :cond_2b
    if-eqz v14, :cond_26

    .line 733
    .line 734
    const/4 v12, 0x2

    .line 735
    if-ne v9, v12, :cond_26

    .line 736
    .line 737
    const/4 v7, 0x1

    .line 738
    invoke-virtual {v4, v7}, Lpp;->u(I)V

    .line 739
    .line 740
    .line 741
    invoke-virtual {v8, v4, v7}, Lex;->d(Lqp;I)I

    .line 742
    .line 743
    .line 744
    move-result v12

    .line 745
    invoke-virtual {v4, v12}, Lpp;->s(I)V

    .line 746
    .line 747
    .line 748
    invoke-virtual {v4}, Lpp;->g()I

    .line 749
    .line 750
    .line 751
    move-result v12

    .line 752
    invoke-virtual {v15, v12}, Lrx;->d(I)V

    .line 753
    .line 754
    .line 755
    goto :goto_1d

    .line 756
    :goto_20
    aget v12, v19, v18

    .line 757
    .line 758
    if-eq v12, v7, :cond_2d

    .line 759
    .line 760
    const/4 v7, 0x4

    .line 761
    if-ne v12, v7, :cond_2c

    .line 762
    .line 763
    goto :goto_21

    .line 764
    :cond_2c
    const/4 v6, 0x0

    .line 765
    goto :goto_22

    .line 766
    :cond_2d
    :goto_21
    invoke-virtual {v4}, Lpp;->j()I

    .line 767
    .line 768
    .line 769
    move-result v7

    .line 770
    add-int v7, v7, v25

    .line 771
    .line 772
    iget-object v6, v6, Loj1;->i:Lfx;

    .line 773
    .line 774
    invoke-virtual {v6, v7}, Lfx;->d(I)V

    .line 775
    .line 776
    .line 777
    sub-int v7, v7, v25

    .line 778
    .line 779
    invoke-virtual {v13, v7}, Lrx;->d(I)V

    .line 780
    .line 781
    .line 782
    invoke-virtual {v8}, Lex;->g()V

    .line 783
    .line 784
    .line 785
    const/4 v7, 0x1

    .line 786
    aget v6, v19, v7

    .line 787
    .line 788
    if-eq v6, v7, :cond_2e

    .line 789
    .line 790
    const/4 v7, 0x4

    .line 791
    if-ne v6, v7, :cond_2f

    .line 792
    .line 793
    :cond_2e
    invoke-virtual {v4}, Lpp;->g()I

    .line 794
    .line 795
    .line 796
    move-result v6

    .line 797
    add-int v6, v6, v26

    .line 798
    .line 799
    iget-object v7, v11, Loj1;->i:Lfx;

    .line 800
    .line 801
    invoke-virtual {v7, v6}, Lfx;->d(I)V

    .line 802
    .line 803
    .line 804
    sub-int v6, v6, v26

    .line 805
    .line 806
    invoke-virtual {v15, v6}, Lrx;->d(I)V

    .line 807
    .line 808
    .line 809
    :cond_2f
    invoke-virtual {v8}, Lex;->g()V

    .line 810
    .line 811
    .line 812
    const/4 v6, 0x1

    .line 813
    :goto_22
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 814
    .line 815
    .line 816
    move-result v7

    .line 817
    const/4 v8, 0x0

    .line 818
    :goto_23
    if-ge v8, v7, :cond_31

    .line 819
    .line 820
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 821
    .line 822
    .line 823
    move-result-object v11

    .line 824
    add-int/lit8 v8, v8, 0x1

    .line 825
    .line 826
    check-cast v11, Loj1;

    .line 827
    .line 828
    iget-object v12, v11, Loj1;->b:Lpp;

    .line 829
    .line 830
    if-ne v12, v4, :cond_30

    .line 831
    .line 832
    iget-boolean v12, v11, Loj1;->g:Z

    .line 833
    .line 834
    if-nez v12, :cond_30

    .line 835
    .line 836
    goto :goto_23

    .line 837
    :cond_30
    invoke-virtual {v11}, Loj1;->e()V

    .line 838
    .line 839
    .line 840
    goto :goto_23

    .line 841
    :cond_31
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 842
    .line 843
    .line 844
    move-result v7

    .line 845
    const/4 v8, 0x0

    .line 846
    :cond_32
    :goto_24
    if-ge v8, v7, :cond_36

    .line 847
    .line 848
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 849
    .line 850
    .line 851
    move-result-object v11

    .line 852
    add-int/lit8 v8, v8, 0x1

    .line 853
    .line 854
    check-cast v11, Loj1;

    .line 855
    .line 856
    if-nez v6, :cond_33

    .line 857
    .line 858
    iget-object v12, v11, Loj1;->b:Lpp;

    .line 859
    .line 860
    if-ne v12, v4, :cond_33

    .line 861
    .line 862
    goto :goto_24

    .line 863
    :cond_33
    iget-object v12, v11, Loj1;->h:Lfx;

    .line 864
    .line 865
    iget-boolean v12, v12, Lfx;->j:Z

    .line 866
    .line 867
    if-nez v12, :cond_34

    .line 868
    .line 869
    :goto_25
    const/4 v2, 0x0

    .line 870
    goto :goto_26

    .line 871
    :cond_34
    iget-object v12, v11, Loj1;->i:Lfx;

    .line 872
    .line 873
    iget-boolean v12, v12, Lfx;->j:Z

    .line 874
    .line 875
    if-nez v12, :cond_35

    .line 876
    .line 877
    instance-of v12, v11, Lgb0;

    .line 878
    .line 879
    if-nez v12, :cond_35

    .line 880
    .line 881
    goto :goto_25

    .line 882
    :cond_35
    iget-object v12, v11, Loj1;->e:Lrx;

    .line 883
    .line 884
    iget-boolean v12, v12, Lfx;->j:Z

    .line 885
    .line 886
    if-nez v12, :cond_32

    .line 887
    .line 888
    instance-of v12, v11, Lkj;

    .line 889
    .line 890
    if-nez v12, :cond_32

    .line 891
    .line 892
    instance-of v11, v11, Lgb0;

    .line 893
    .line 894
    if-nez v11, :cond_32

    .line 895
    .line 896
    goto :goto_25

    .line 897
    :cond_36
    const/4 v2, 0x1

    .line 898
    :goto_26
    invoke-virtual {v4, v10}, Lpp;->t(I)V

    .line 899
    .line 900
    .line 901
    invoke-virtual {v4, v9}, Lpp;->u(I)V

    .line 902
    .line 903
    .line 904
    move v4, v2

    .line 905
    const/4 v2, 0x2

    .line 906
    const/high16 v11, 0x40000000    # 2.0f

    .line 907
    .line 908
    goto/16 :goto_2a

    .line 909
    .line 910
    :cond_37
    move-object/from16 v22, v7

    .line 911
    .line 912
    move-object/from16 v21, v9

    .line 913
    .line 914
    move-object/from16 v20, v10

    .line 915
    .line 916
    move/from16 v23, v12

    .line 917
    .line 918
    move/from16 v24, v13

    .line 919
    .line 920
    iget-object v2, v8, Lex;->a:Lqp;

    .line 921
    .line 922
    iget-boolean v4, v8, Lex;->b:Z

    .line 923
    .line 924
    if-eqz v4, :cond_39

    .line 925
    .line 926
    iget-object v4, v2, Lqp;->d0:Ljava/util/ArrayList;

    .line 927
    .line 928
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 929
    .line 930
    .line 931
    move-result v6

    .line 932
    const/4 v7, 0x0

    .line 933
    :goto_27
    if-ge v7, v6, :cond_38

    .line 934
    .line 935
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 936
    .line 937
    .line 938
    move-result-object v9

    .line 939
    add-int/lit8 v7, v7, 0x1

    .line 940
    .line 941
    check-cast v9, Lpp;

    .line 942
    .line 943
    const/4 v15, 0x0

    .line 944
    iput-boolean v15, v9, Lpp;->a:Z

    .line 945
    .line 946
    iget-object v10, v9, Lpp;->d:Lbc0;

    .line 947
    .line 948
    iget-object v11, v10, Loj1;->e:Lrx;

    .line 949
    .line 950
    iput-boolean v15, v11, Lfx;->j:Z

    .line 951
    .line 952
    iput-boolean v15, v10, Loj1;->g:Z

    .line 953
    .line 954
    invoke-virtual {v10}, Lbc0;->n()V

    .line 955
    .line 956
    .line 957
    iget-object v9, v9, Lpp;->e:Lgh1;

    .line 958
    .line 959
    iget-object v10, v9, Loj1;->e:Lrx;

    .line 960
    .line 961
    iput-boolean v15, v10, Lfx;->j:Z

    .line 962
    .line 963
    iput-boolean v15, v9, Loj1;->g:Z

    .line 964
    .line 965
    invoke-virtual {v9}, Lgh1;->m()V

    .line 966
    .line 967
    .line 968
    goto :goto_27

    .line 969
    :cond_38
    const/4 v15, 0x0

    .line 970
    iput-boolean v15, v2, Lpp;->a:Z

    .line 971
    .line 972
    iget-object v4, v2, Lpp;->d:Lbc0;

    .line 973
    .line 974
    iget-object v6, v4, Loj1;->e:Lrx;

    .line 975
    .line 976
    iput-boolean v15, v6, Lfx;->j:Z

    .line 977
    .line 978
    iput-boolean v15, v4, Loj1;->g:Z

    .line 979
    .line 980
    invoke-virtual {v4}, Lbc0;->n()V

    .line 981
    .line 982
    .line 983
    iget-object v4, v2, Lpp;->e:Lgh1;

    .line 984
    .line 985
    iget-object v6, v4, Loj1;->e:Lrx;

    .line 986
    .line 987
    iput-boolean v15, v6, Lfx;->j:Z

    .line 988
    .line 989
    iput-boolean v15, v4, Loj1;->g:Z

    .line 990
    .line 991
    invoke-virtual {v4}, Lgh1;->m()V

    .line 992
    .line 993
    .line 994
    invoke-virtual {v8}, Lex;->c()V

    .line 995
    .line 996
    .line 997
    goto :goto_28

    .line 998
    :cond_39
    const/4 v15, 0x0

    .line 999
    :goto_28
    iget-object v4, v8, Lex;->d:Lqp;

    .line 1000
    .line 1001
    invoke-virtual {v8, v4}, Lex;->b(Lqp;)V

    .line 1002
    .line 1003
    .line 1004
    iput v15, v2, Lpp;->N:I

    .line 1005
    .line 1006
    iput v15, v2, Lpp;->O:I

    .line 1007
    .line 1008
    iget-object v4, v2, Lpp;->d:Lbc0;

    .line 1009
    .line 1010
    iget-object v4, v4, Loj1;->h:Lfx;

    .line 1011
    .line 1012
    invoke-virtual {v4, v15}, Lfx;->d(I)V

    .line 1013
    .line 1014
    .line 1015
    iget-object v2, v2, Lpp;->e:Lgh1;

    .line 1016
    .line 1017
    iget-object v2, v2, Loj1;->h:Lfx;

    .line 1018
    .line 1019
    invoke-virtual {v2, v15}, Lfx;->d(I)V

    .line 1020
    .line 1021
    .line 1022
    const/high16 v11, 0x40000000    # 2.0f

    .line 1023
    .line 1024
    if-ne v3, v11, :cond_3a

    .line 1025
    .line 1026
    invoke-virtual {v1, v15, v14}, Lqp;->A(IZ)Z

    .line 1027
    .line 1028
    .line 1029
    move-result v2

    .line 1030
    move v4, v2

    .line 1031
    const/4 v2, 0x1

    .line 1032
    goto :goto_29

    .line 1033
    :cond_3a
    const/4 v2, 0x0

    .line 1034
    const/4 v4, 0x1

    .line 1035
    :goto_29
    if-ne v5, v11, :cond_3b

    .line 1036
    .line 1037
    const/4 v15, 0x1

    .line 1038
    invoke-virtual {v1, v15, v14}, Lqp;->A(IZ)Z

    .line 1039
    .line 1040
    .line 1041
    move-result v6

    .line 1042
    and-int/2addr v4, v6

    .line 1043
    add-int/lit8 v2, v2, 0x1

    .line 1044
    .line 1045
    :cond_3b
    :goto_2a
    if-eqz v4, :cond_3f

    .line 1046
    .line 1047
    if-ne v3, v11, :cond_3c

    .line 1048
    .line 1049
    const/4 v3, 0x1

    .line 1050
    goto :goto_2b

    .line 1051
    :cond_3c
    const/4 v3, 0x0

    .line 1052
    :goto_2b
    if-ne v5, v11, :cond_3d

    .line 1053
    .line 1054
    const/4 v5, 0x1

    .line 1055
    goto :goto_2c

    .line 1056
    :cond_3d
    const/4 v5, 0x0

    .line 1057
    :goto_2c
    invoke-virtual {v1, v3, v5}, Lqp;->w(ZZ)V

    .line 1058
    .line 1059
    .line 1060
    goto :goto_2d

    .line 1061
    :cond_3e
    move-object/from16 v22, v7

    .line 1062
    .line 1063
    move-object/from16 v21, v9

    .line 1064
    .line 1065
    move-object/from16 v20, v10

    .line 1066
    .line 1067
    move/from16 v23, v12

    .line 1068
    .line 1069
    move/from16 v24, v13

    .line 1070
    .line 1071
    const/4 v2, 0x0

    .line 1072
    const/4 v4, 0x0

    .line 1073
    :cond_3f
    :goto_2d
    if-eqz v4, :cond_41

    .line 1074
    .line 1075
    const/4 v12, 0x2

    .line 1076
    if-eq v2, v12, :cond_40

    .line 1077
    .line 1078
    goto :goto_2e

    .line 1079
    :cond_40
    return-void

    .line 1080
    :cond_41
    :goto_2e
    if-lez v17, :cond_47

    .line 1081
    .line 1082
    iget-object v2, v1, Lqp;->d0:Ljava/util/ArrayList;

    .line 1083
    .line 1084
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 1085
    .line 1086
    .line 1087
    move-result v2

    .line 1088
    iget-object v3, v1, Lqp;->g0:Lgp;

    .line 1089
    .line 1090
    const/4 v15, 0x0

    .line 1091
    :goto_2f
    if-ge v15, v2, :cond_45

    .line 1092
    .line 1093
    iget-object v4, v1, Lqp;->d0:Ljava/util/ArrayList;

    .line 1094
    .line 1095
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v4

    .line 1099
    check-cast v4, Lpp;

    .line 1100
    .line 1101
    instance-of v5, v4, Lfb0;

    .line 1102
    .line 1103
    if-eqz v5, :cond_42

    .line 1104
    .line 1105
    :goto_30
    const/4 v8, 0x3

    .line 1106
    goto :goto_31

    .line 1107
    :cond_42
    iget-object v5, v4, Lpp;->d:Lbc0;

    .line 1108
    .line 1109
    iget-object v5, v5, Loj1;->e:Lrx;

    .line 1110
    .line 1111
    iget-boolean v5, v5, Lfx;->j:Z

    .line 1112
    .line 1113
    if-eqz v5, :cond_43

    .line 1114
    .line 1115
    iget-object v5, v4, Lpp;->e:Lgh1;

    .line 1116
    .line 1117
    iget-object v5, v5, Loj1;->e:Lrx;

    .line 1118
    .line 1119
    iget-boolean v5, v5, Lfx;->j:Z

    .line 1120
    .line 1121
    if-eqz v5, :cond_43

    .line 1122
    .line 1123
    goto :goto_30

    .line 1124
    :cond_43
    const/4 v11, 0x0

    .line 1125
    invoke-virtual {v4, v11}, Lpp;->f(I)I

    .line 1126
    .line 1127
    .line 1128
    move-result v5

    .line 1129
    const/4 v7, 0x1

    .line 1130
    invoke-virtual {v4, v7}, Lpp;->f(I)I

    .line 1131
    .line 1132
    .line 1133
    move-result v6

    .line 1134
    const/4 v8, 0x3

    .line 1135
    if-ne v5, v8, :cond_44

    .line 1136
    .line 1137
    iget v5, v4, Lpp;->j:I

    .line 1138
    .line 1139
    if-eq v5, v7, :cond_44

    .line 1140
    .line 1141
    if-ne v6, v8, :cond_44

    .line 1142
    .line 1143
    iget v5, v4, Lpp;->k:I

    .line 1144
    .line 1145
    if-eq v5, v7, :cond_44

    .line 1146
    .line 1147
    goto :goto_31

    .line 1148
    :cond_44
    const/4 v11, 0x0

    .line 1149
    invoke-virtual {v0, v3, v4, v11}, Lc9;->E(Lgp;Lpp;Z)Z

    .line 1150
    .line 1151
    .line 1152
    :goto_31
    add-int/lit8 v15, v15, 0x1

    .line 1153
    .line 1154
    goto :goto_2f

    .line 1155
    :cond_45
    iget-object v2, v3, Lgp;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 1156
    .line 1157
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 1158
    .line 1159
    .line 1160
    move-result v3

    .line 1161
    iget-object v4, v2, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 1162
    .line 1163
    const/4 v15, 0x0

    .line 1164
    :goto_32
    if-ge v15, v3, :cond_46

    .line 1165
    .line 1166
    invoke-virtual {v2, v15}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1167
    .line 1168
    .line 1169
    add-int/lit8 v15, v15, 0x1

    .line 1170
    .line 1171
    goto :goto_32

    .line 1172
    :cond_46
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 1173
    .line 1174
    .line 1175
    move-result v2

    .line 1176
    if-lez v2, :cond_47

    .line 1177
    .line 1178
    const/4 v15, 0x0

    .line 1179
    :goto_33
    if-ge v15, v2, :cond_47

    .line 1180
    .line 1181
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1182
    .line 1183
    .line 1184
    move-result-object v3

    .line 1185
    check-cast v3, Ldp;

    .line 1186
    .line 1187
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1188
    .line 1189
    .line 1190
    add-int/lit8 v15, v15, 0x1

    .line 1191
    .line 1192
    goto :goto_33

    .line 1193
    :cond_47
    iget v2, v1, Lqp;->p0:I

    .line 1194
    .line 1195
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    .line 1196
    .line 1197
    .line 1198
    move-result v3

    .line 1199
    move/from16 v4, v23

    .line 1200
    .line 1201
    move/from16 v5, v24

    .line 1202
    .line 1203
    if-lez v17, :cond_48

    .line 1204
    .line 1205
    invoke-virtual {v0, v1, v4, v5}, Lc9;->K(Lqp;II)V

    .line 1206
    .line 1207
    .line 1208
    :cond_48
    if-lez v3, :cond_5a

    .line 1209
    .line 1210
    iget-object v6, v1, Lpp;->c0:[I

    .line 1211
    .line 1212
    const/16 v18, 0x0

    .line 1213
    .line 1214
    aget v7, v6, v18

    .line 1215
    .line 1216
    const/4 v12, 0x2

    .line 1217
    if-ne v7, v12, :cond_49

    .line 1218
    .line 1219
    const/4 v15, 0x1

    .line 1220
    :goto_34
    const/4 v7, 0x1

    .line 1221
    goto :goto_35

    .line 1222
    :cond_49
    move/from16 v15, v18

    .line 1223
    .line 1224
    goto :goto_34

    .line 1225
    :goto_35
    aget v6, v6, v7

    .line 1226
    .line 1227
    if-ne v6, v12, :cond_4a

    .line 1228
    .line 1229
    const/4 v6, 0x1

    .line 1230
    goto :goto_36

    .line 1231
    :cond_4a
    move/from16 v6, v18

    .line 1232
    .line 1233
    :goto_36
    invoke-virtual {v1}, Lpp;->j()I

    .line 1234
    .line 1235
    .line 1236
    move-result v7

    .line 1237
    move-object/from16 v8, v22

    .line 1238
    .line 1239
    iget v9, v8, Lpp;->Q:I

    .line 1240
    .line 1241
    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    .line 1242
    .line 1243
    .line 1244
    move-result v7

    .line 1245
    invoke-virtual {v1}, Lpp;->g()I

    .line 1246
    .line 1247
    .line 1248
    move-result v9

    .line 1249
    iget v8, v8, Lpp;->R:I

    .line 1250
    .line 1251
    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    .line 1252
    .line 1253
    .line 1254
    move-result v8

    .line 1255
    move/from16 v9, v18

    .line 1256
    .line 1257
    :goto_37
    if-ge v9, v3, :cond_4b

    .line 1258
    .line 1259
    move-object/from16 v10, v21

    .line 1260
    .line 1261
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1262
    .line 1263
    .line 1264
    move-result-object v11

    .line 1265
    check-cast v11, Lpp;

    .line 1266
    .line 1267
    add-int/lit8 v9, v9, 0x1

    .line 1268
    .line 1269
    goto :goto_37

    .line 1270
    :cond_4b
    move/from16 v9, v18

    .line 1271
    .line 1272
    move v11, v9

    .line 1273
    :goto_38
    move-object/from16 v10, v21

    .line 1274
    .line 1275
    const/4 v12, 0x2

    .line 1276
    if-ge v9, v12, :cond_57

    .line 1277
    .line 1278
    move v13, v11

    .line 1279
    move/from16 v11, v18

    .line 1280
    .line 1281
    :goto_39
    if-ge v11, v3, :cond_55

    .line 1282
    .line 1283
    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1284
    .line 1285
    .line 1286
    move-result-object v14

    .line 1287
    check-cast v14, Lpp;

    .line 1288
    .line 1289
    instance-of v12, v14, Lbg;

    .line 1290
    .line 1291
    if-eqz v12, :cond_4c

    .line 1292
    .line 1293
    :goto_3a
    move/from16 p0, v3

    .line 1294
    .line 1295
    goto :goto_3b

    .line 1296
    :cond_4c
    instance-of v12, v14, Lfb0;

    .line 1297
    .line 1298
    if-eqz v12, :cond_4d

    .line 1299
    .line 1300
    goto :goto_3a

    .line 1301
    :cond_4d
    iget v12, v14, Lpp;->V:I

    .line 1302
    .line 1303
    move/from16 p0, v3

    .line 1304
    .line 1305
    const/16 v3, 0x8

    .line 1306
    .line 1307
    if-ne v12, v3, :cond_4e

    .line 1308
    .line 1309
    goto :goto_3b

    .line 1310
    :cond_4e
    iget-object v3, v14, Lpp;->d:Lbc0;

    .line 1311
    .line 1312
    iget-object v3, v3, Loj1;->e:Lrx;

    .line 1313
    .line 1314
    iget-boolean v3, v3, Lfx;->j:Z

    .line 1315
    .line 1316
    if-eqz v3, :cond_4f

    .line 1317
    .line 1318
    iget-object v3, v14, Lpp;->e:Lgh1;

    .line 1319
    .line 1320
    iget-object v3, v3, Loj1;->e:Lrx;

    .line 1321
    .line 1322
    iget-boolean v3, v3, Lfx;->j:Z

    .line 1323
    .line 1324
    if-eqz v3, :cond_4f

    .line 1325
    .line 1326
    :goto_3b
    move/from16 v16, v6

    .line 1327
    .line 1328
    move/from16 v17, v9

    .line 1329
    .line 1330
    move-object/from16 v21, v10

    .line 1331
    .line 1332
    const/4 v9, 0x4

    .line 1333
    goto/16 :goto_3e

    .line 1334
    .line 1335
    :cond_4f
    invoke-virtual {v14}, Lpp;->j()I

    .line 1336
    .line 1337
    .line 1338
    move-result v3

    .line 1339
    invoke-virtual {v14}, Lpp;->g()I

    .line 1340
    .line 1341
    .line 1342
    move-result v12

    .line 1343
    move/from16 v16, v6

    .line 1344
    .line 1345
    iget v6, v14, Lpp;->P:I

    .line 1346
    .line 1347
    move/from16 v17, v9

    .line 1348
    .line 1349
    move-object/from16 v21, v10

    .line 1350
    .line 1351
    move-object/from16 v10, v20

    .line 1352
    .line 1353
    const/4 v9, 0x1

    .line 1354
    invoke-virtual {v0, v10, v14, v9}, Lc9;->E(Lgp;Lpp;Z)Z

    .line 1355
    .line 1356
    .line 1357
    move-result v19

    .line 1358
    or-int v13, v13, v19

    .line 1359
    .line 1360
    invoke-virtual {v14}, Lpp;->j()I

    .line 1361
    .line 1362
    .line 1363
    move-result v9

    .line 1364
    invoke-virtual {v14}, Lpp;->g()I

    .line 1365
    .line 1366
    .line 1367
    move-result v10

    .line 1368
    if-eq v9, v3, :cond_51

    .line 1369
    .line 1370
    invoke-virtual {v14, v9}, Lpp;->v(I)V

    .line 1371
    .line 1372
    .line 1373
    if-eqz v15, :cond_50

    .line 1374
    .line 1375
    invoke-virtual {v14}, Lpp;->k()I

    .line 1376
    .line 1377
    .line 1378
    move-result v3

    .line 1379
    iget v9, v14, Lpp;->J:I

    .line 1380
    .line 1381
    add-int/2addr v3, v9

    .line 1382
    if-le v3, v7, :cond_50

    .line 1383
    .line 1384
    invoke-virtual {v14}, Lpp;->k()I

    .line 1385
    .line 1386
    .line 1387
    move-result v3

    .line 1388
    iget v9, v14, Lpp;->J:I

    .line 1389
    .line 1390
    add-int/2addr v3, v9

    .line 1391
    const/4 v9, 0x4

    .line 1392
    invoke-virtual {v14, v9}, Lpp;->e(I)Lbp;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v13

    .line 1396
    invoke-virtual {v13}, Lbp;->b()I

    .line 1397
    .line 1398
    .line 1399
    move-result v13

    .line 1400
    add-int/2addr v13, v3

    .line 1401
    invoke-static {v7, v13}, Ljava/lang/Math;->max(II)I

    .line 1402
    .line 1403
    .line 1404
    move-result v7

    .line 1405
    goto :goto_3c

    .line 1406
    :cond_50
    const/4 v9, 0x4

    .line 1407
    :goto_3c
    const/4 v13, 0x1

    .line 1408
    goto :goto_3d

    .line 1409
    :cond_51
    const/4 v9, 0x4

    .line 1410
    :goto_3d
    if-eq v10, v12, :cond_53

    .line 1411
    .line 1412
    invoke-virtual {v14, v10}, Lpp;->s(I)V

    .line 1413
    .line 1414
    .line 1415
    if-eqz v16, :cond_52

    .line 1416
    .line 1417
    invoke-virtual {v14}, Lpp;->l()I

    .line 1418
    .line 1419
    .line 1420
    move-result v3

    .line 1421
    iget v10, v14, Lpp;->K:I

    .line 1422
    .line 1423
    add-int/2addr v3, v10

    .line 1424
    if-le v3, v8, :cond_52

    .line 1425
    .line 1426
    invoke-virtual {v14}, Lpp;->l()I

    .line 1427
    .line 1428
    .line 1429
    move-result v3

    .line 1430
    iget v10, v14, Lpp;->K:I

    .line 1431
    .line 1432
    add-int/2addr v3, v10

    .line 1433
    const/4 v10, 0x5

    .line 1434
    invoke-virtual {v14, v10}, Lpp;->e(I)Lbp;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v10

    .line 1438
    invoke-virtual {v10}, Lbp;->b()I

    .line 1439
    .line 1440
    .line 1441
    move-result v10

    .line 1442
    add-int/2addr v10, v3

    .line 1443
    invoke-static {v8, v10}, Ljava/lang/Math;->max(II)I

    .line 1444
    .line 1445
    .line 1446
    move-result v8

    .line 1447
    :cond_52
    const/4 v13, 0x1

    .line 1448
    :cond_53
    iget-boolean v3, v14, Lpp;->w:Z

    .line 1449
    .line 1450
    if-eqz v3, :cond_54

    .line 1451
    .line 1452
    iget v3, v14, Lpp;->P:I

    .line 1453
    .line 1454
    if-eq v6, v3, :cond_54

    .line 1455
    .line 1456
    const/4 v13, 0x1

    .line 1457
    :cond_54
    :goto_3e
    add-int/lit8 v11, v11, 0x1

    .line 1458
    .line 1459
    move/from16 v3, p0

    .line 1460
    .line 1461
    move/from16 v6, v16

    .line 1462
    .line 1463
    move/from16 v9, v17

    .line 1464
    .line 1465
    move-object/from16 v10, v21

    .line 1466
    .line 1467
    const/4 v12, 0x2

    .line 1468
    goto/16 :goto_39

    .line 1469
    .line 1470
    :cond_55
    move/from16 p0, v3

    .line 1471
    .line 1472
    move/from16 v16, v6

    .line 1473
    .line 1474
    move/from16 v17, v9

    .line 1475
    .line 1476
    move-object/from16 v21, v10

    .line 1477
    .line 1478
    const/4 v9, 0x4

    .line 1479
    if-eqz v13, :cond_56

    .line 1480
    .line 1481
    invoke-virtual {v0, v1, v4, v5}, Lc9;->K(Lqp;II)V

    .line 1482
    .line 1483
    .line 1484
    move/from16 v11, v18

    .line 1485
    .line 1486
    goto :goto_3f

    .line 1487
    :cond_56
    move v11, v13

    .line 1488
    :goto_3f
    add-int/lit8 v3, v17, 0x1

    .line 1489
    .line 1490
    move v9, v3

    .line 1491
    move/from16 v6, v16

    .line 1492
    .line 1493
    move/from16 v3, p0

    .line 1494
    .line 1495
    goto/16 :goto_38

    .line 1496
    .line 1497
    :cond_57
    if-eqz v11, :cond_5b

    .line 1498
    .line 1499
    invoke-virtual {v0, v1, v4, v5}, Lc9;->K(Lqp;II)V

    .line 1500
    .line 1501
    .line 1502
    invoke-virtual {v1}, Lpp;->j()I

    .line 1503
    .line 1504
    .line 1505
    move-result v3

    .line 1506
    if-ge v3, v7, :cond_58

    .line 1507
    .line 1508
    invoke-virtual {v1, v7}, Lpp;->v(I)V

    .line 1509
    .line 1510
    .line 1511
    const/4 v15, 0x1

    .line 1512
    goto :goto_40

    .line 1513
    :cond_58
    move/from16 v15, v18

    .line 1514
    .line 1515
    :goto_40
    invoke-virtual {v1}, Lpp;->g()I

    .line 1516
    .line 1517
    .line 1518
    move-result v3

    .line 1519
    if-ge v3, v8, :cond_59

    .line 1520
    .line 1521
    invoke-virtual {v1, v8}, Lpp;->s(I)V

    .line 1522
    .line 1523
    .line 1524
    const/4 v15, 0x1

    .line 1525
    :cond_59
    if-eqz v15, :cond_5b

    .line 1526
    .line 1527
    invoke-virtual {v0, v1, v4, v5}, Lc9;->K(Lqp;II)V

    .line 1528
    .line 1529
    .line 1530
    goto :goto_41

    .line 1531
    :cond_5a
    const/16 v18, 0x0

    .line 1532
    .line 1533
    :cond_5b
    :goto_41
    iput v2, v1, Lqp;->p0:I

    .line 1534
    .line 1535
    const/16 v0, 0x100

    .line 1536
    .line 1537
    and-int/lit16 v1, v2, 0x100

    .line 1538
    .line 1539
    if-ne v1, v0, :cond_5c

    .line 1540
    .line 1541
    const/4 v8, 0x1

    .line 1542
    goto :goto_42

    .line 1543
    :cond_5c
    move/from16 v8, v18

    .line 1544
    .line 1545
    :goto_42
    sput-boolean v8, Lpi0;->p:Z

    .line 1546
    .line 1547
    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-lez v3, :cond_0

    .line 13
    .line 14
    move v4, v1

    .line 15
    :goto_0
    if-ge v4, v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    check-cast v5, Ldp;

    .line 22
    .line 23
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    add-int/lit8 v4, v4, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    int-to-float v3, v3

    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    int-to-float v4, v4

    .line 52
    move v5, v1

    .line 53
    :goto_1
    if-ge v5, v2, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    const/16 v8, 0x8

    .line 64
    .line 65
    if-ne v7, v8, :cond_1

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_1
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    if-eqz v6, :cond_2

    .line 74
    .line 75
    instance-of v7, v6, Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v7, :cond_2

    .line 78
    .line 79
    check-cast v6, Ljava/lang/String;

    .line 80
    .line 81
    const-string v7, ","

    .line 82
    .line 83
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    array-length v7, v6

    .line 88
    const/4 v8, 0x4

    .line 89
    if-ne v7, v8, :cond_2

    .line 90
    .line 91
    aget-object v7, v6, v1

    .line 92
    .line 93
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    const/4 v8, 0x1

    .line 98
    aget-object v8, v6, v8

    .line 99
    .line 100
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    const/4 v9, 0x2

    .line 105
    aget-object v9, v6, v9

    .line 106
    .line 107
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v9

    .line 111
    const/4 v10, 0x3

    .line 112
    aget-object v6, v6, v10

    .line 113
    .line 114
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    int-to-float v7, v7

    .line 119
    const/high16 v10, 0x44870000    # 1080.0f

    .line 120
    .line 121
    div-float/2addr v7, v10

    .line 122
    mul-float/2addr v7, v3

    .line 123
    float-to-int v7, v7

    .line 124
    int-to-float v8, v8

    .line 125
    const/high16 v11, 0x44f00000    # 1920.0f

    .line 126
    .line 127
    div-float/2addr v8, v11

    .line 128
    mul-float/2addr v8, v4

    .line 129
    float-to-int v8, v8

    .line 130
    int-to-float v9, v9

    .line 131
    div-float/2addr v9, v10

    .line 132
    mul-float/2addr v9, v3

    .line 133
    float-to-int v9, v9

    .line 134
    int-to-float v6, v6

    .line 135
    div-float/2addr v6, v11

    .line 136
    mul-float/2addr v6, v4

    .line 137
    float-to-int v6, v6

    .line 138
    new-instance v15, Landroid/graphics/Paint;

    .line 139
    .line 140
    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    .line 141
    .line 142
    .line 143
    const/high16 v10, -0x10000

    .line 144
    .line 145
    invoke-virtual {v15, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 146
    .line 147
    .line 148
    int-to-float v11, v7

    .line 149
    int-to-float v12, v8

    .line 150
    add-int/2addr v7, v9

    .line 151
    int-to-float v13, v7

    .line 152
    move v14, v12

    .line 153
    move-object/from16 v10, p1

    .line 154
    .line 155
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 156
    .line 157
    .line 158
    move v7, v11

    .line 159
    add-int/2addr v8, v6

    .line 160
    int-to-float v14, v8

    .line 161
    move v11, v13

    .line 162
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 163
    .line 164
    .line 165
    move v6, v12

    .line 166
    move v12, v14

    .line 167
    move v13, v7

    .line 168
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 169
    .line 170
    .line 171
    move v7, v11

    .line 172
    move v11, v13

    .line 173
    move v14, v6

    .line 174
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 175
    .line 176
    .line 177
    move/from16 v16, v14

    .line 178
    .line 179
    move v14, v12

    .line 180
    move/from16 v12, v16

    .line 181
    .line 182
    const v6, -0xff0100

    .line 183
    .line 184
    .line 185
    invoke-virtual {v15, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    .line 187
    .line 188
    move v13, v7

    .line 189
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 190
    .line 191
    .line 192
    move/from16 v16, v14

    .line 193
    .line 194
    move v14, v12

    .line 195
    move/from16 v12, v16

    .line 196
    .line 197
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 198
    .line 199
    .line 200
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 201
    .line 202
    goto/16 :goto_1

    .line 203
    .line 204
    :cond_3
    return-void
.end method

.method public final forceLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->forceLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Lfp;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0}, Lfp;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 11

    .line 1
    new-instance v0, Lfp;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    iput v1, v0, Lfp;->a:I

    .line 12
    .line 13
    iput v1, v0, Lfp;->b:I

    .line 14
    .line 15
    const/high16 v2, -0x40800000    # -1.0f

    .line 16
    .line 17
    iput v2, v0, Lfp;->c:F

    .line 18
    .line 19
    iput v1, v0, Lfp;->d:I

    .line 20
    .line 21
    iput v1, v0, Lfp;->e:I

    .line 22
    .line 23
    iput v1, v0, Lfp;->f:I

    .line 24
    .line 25
    iput v1, v0, Lfp;->g:I

    .line 26
    .line 27
    iput v1, v0, Lfp;->h:I

    .line 28
    .line 29
    iput v1, v0, Lfp;->i:I

    .line 30
    .line 31
    iput v1, v0, Lfp;->j:I

    .line 32
    .line 33
    iput v1, v0, Lfp;->k:I

    .line 34
    .line 35
    iput v1, v0, Lfp;->l:I

    .line 36
    .line 37
    iput v1, v0, Lfp;->m:I

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    iput v3, v0, Lfp;->n:I

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    iput v4, v0, Lfp;->o:F

    .line 44
    .line 45
    iput v1, v0, Lfp;->p:I

    .line 46
    .line 47
    iput v1, v0, Lfp;->q:I

    .line 48
    .line 49
    iput v1, v0, Lfp;->r:I

    .line 50
    .line 51
    iput v1, v0, Lfp;->s:I

    .line 52
    .line 53
    iput v1, v0, Lfp;->t:I

    .line 54
    .line 55
    iput v1, v0, Lfp;->u:I

    .line 56
    .line 57
    iput v1, v0, Lfp;->v:I

    .line 58
    .line 59
    iput v1, v0, Lfp;->w:I

    .line 60
    .line 61
    iput v1, v0, Lfp;->x:I

    .line 62
    .line 63
    iput v1, v0, Lfp;->y:I

    .line 64
    .line 65
    const/high16 v5, 0x3f000000    # 0.5f

    .line 66
    .line 67
    iput v5, v0, Lfp;->z:F

    .line 68
    .line 69
    iput v5, v0, Lfp;->A:F

    .line 70
    .line 71
    const/4 v6, 0x0

    .line 72
    iput-object v6, v0, Lfp;->B:Ljava/lang/String;

    .line 73
    .line 74
    iput v2, v0, Lfp;->C:F

    .line 75
    .line 76
    iput v2, v0, Lfp;->D:F

    .line 77
    .line 78
    iput v3, v0, Lfp;->E:I

    .line 79
    .line 80
    iput v3, v0, Lfp;->F:I

    .line 81
    .line 82
    iput v3, v0, Lfp;->G:I

    .line 83
    .line 84
    iput v3, v0, Lfp;->H:I

    .line 85
    .line 86
    iput v3, v0, Lfp;->I:I

    .line 87
    .line 88
    iput v3, v0, Lfp;->J:I

    .line 89
    .line 90
    iput v3, v0, Lfp;->K:I

    .line 91
    .line 92
    iput v3, v0, Lfp;->L:I

    .line 93
    .line 94
    const/high16 v2, 0x3f800000    # 1.0f

    .line 95
    .line 96
    iput v2, v0, Lfp;->M:F

    .line 97
    .line 98
    iput v2, v0, Lfp;->N:F

    .line 99
    .line 100
    iput v1, v0, Lfp;->O:I

    .line 101
    .line 102
    iput v1, v0, Lfp;->P:I

    .line 103
    .line 104
    iput v1, v0, Lfp;->Q:I

    .line 105
    .line 106
    iput-boolean v3, v0, Lfp;->R:Z

    .line 107
    .line 108
    iput-boolean v3, v0, Lfp;->S:Z

    .line 109
    .line 110
    iput-object v6, v0, Lfp;->T:Ljava/lang/String;

    .line 111
    .line 112
    const/4 v2, 0x1

    .line 113
    iput-boolean v2, v0, Lfp;->U:Z

    .line 114
    .line 115
    iput-boolean v2, v0, Lfp;->V:Z

    .line 116
    .line 117
    iput-boolean v3, v0, Lfp;->W:Z

    .line 118
    .line 119
    iput-boolean v3, v0, Lfp;->X:Z

    .line 120
    .line 121
    iput-boolean v3, v0, Lfp;->Y:Z

    .line 122
    .line 123
    iput v1, v0, Lfp;->Z:I

    .line 124
    .line 125
    iput v1, v0, Lfp;->a0:I

    .line 126
    .line 127
    iput v1, v0, Lfp;->b0:I

    .line 128
    .line 129
    iput v1, v0, Lfp;->c0:I

    .line 130
    .line 131
    iput v1, v0, Lfp;->d0:I

    .line 132
    .line 133
    iput v1, v0, Lfp;->e0:I

    .line 134
    .line 135
    iput v5, v0, Lfp;->f0:F

    .line 136
    .line 137
    new-instance v5, Lpp;

    .line 138
    .line 139
    invoke-direct {v5}, Lpp;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object v5, v0, Lfp;->j0:Lpp;

    .line 143
    .line 144
    sget-object v5, Lax0;->b:[I

    .line 145
    .line 146
    invoke-virtual {p0, p1, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    move v5, v3

    .line 155
    :goto_0
    if-ge v5, p1, :cond_6

    .line 156
    .line 157
    invoke-virtual {p0, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    sget-object v7, Lep;->a:Landroid/util/SparseIntArray;

    .line 162
    .line 163
    invoke-virtual {v7, v6}, Landroid/util/SparseIntArray;->get(I)I

    .line 164
    .line 165
    .line 166
    move-result v7

    .line 167
    const/4 v8, 0x2

    .line 168
    const/4 v9, -0x2

    .line 169
    packed-switch v7, :pswitch_data_0

    .line 170
    .line 171
    .line 172
    packed-switch v7, :pswitch_data_1

    .line 173
    .line 174
    .line 175
    goto/16 :goto_3

    .line 176
    .line 177
    :pswitch_0
    invoke-virtual {p0, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    iput-object v6, v0, Lfp;->T:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :pswitch_1
    iget v7, v0, Lfp;->P:I

    .line 186
    .line 187
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    iput v6, v0, Lfp;->P:I

    .line 192
    .line 193
    goto/16 :goto_3

    .line 194
    .line 195
    :pswitch_2
    iget v7, v0, Lfp;->O:I

    .line 196
    .line 197
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    iput v6, v0, Lfp;->O:I

    .line 202
    .line 203
    goto/16 :goto_3

    .line 204
    .line 205
    :pswitch_3
    invoke-virtual {p0, v6, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    iput v6, v0, Lfp;->F:I

    .line 210
    .line 211
    goto/16 :goto_3

    .line 212
    .line 213
    :pswitch_4
    invoke-virtual {p0, v6, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    iput v6, v0, Lfp;->E:I

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :pswitch_5
    iget v7, v0, Lfp;->D:F

    .line 222
    .line 223
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 224
    .line 225
    .line 226
    move-result v6

    .line 227
    iput v6, v0, Lfp;->D:F

    .line 228
    .line 229
    goto/16 :goto_3

    .line 230
    .line 231
    :pswitch_6
    iget v7, v0, Lfp;->C:F

    .line 232
    .line 233
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    iput v6, v0, Lfp;->C:F

    .line 238
    .line 239
    goto/16 :goto_3

    .line 240
    .line 241
    :pswitch_7
    invoke-virtual {p0, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v6

    .line 245
    iput-object v6, v0, Lfp;->B:Ljava/lang/String;

    .line 246
    .line 247
    if-eqz v6, :cond_5

    .line 248
    .line 249
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    iget-object v7, v0, Lfp;->B:Ljava/lang/String;

    .line 254
    .line 255
    const/16 v8, 0x2c

    .line 256
    .line 257
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    if-lez v7, :cond_2

    .line 262
    .line 263
    add-int/lit8 v8, v6, -0x1

    .line 264
    .line 265
    if-ge v7, v8, :cond_2

    .line 266
    .line 267
    iget-object v8, v0, Lfp;->B:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v8, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v8

    .line 273
    const-string v9, "W"

    .line 274
    .line 275
    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 276
    .line 277
    .line 278
    move-result v9

    .line 279
    if-eqz v9, :cond_0

    .line 280
    .line 281
    move v8, v3

    .line 282
    goto :goto_1

    .line 283
    :cond_0
    const-string v9, "H"

    .line 284
    .line 285
    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    if-eqz v8, :cond_1

    .line 290
    .line 291
    move v8, v2

    .line 292
    goto :goto_1

    .line 293
    :cond_1
    move v8, v1

    .line 294
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 295
    .line 296
    goto :goto_2

    .line 297
    :cond_2
    move v8, v1

    .line 298
    move v7, v3

    .line 299
    :goto_2
    iget-object v9, v0, Lfp;->B:Ljava/lang/String;

    .line 300
    .line 301
    const/16 v10, 0x3a

    .line 302
    .line 303
    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    .line 304
    .line 305
    .line 306
    move-result v9

    .line 307
    if-ltz v9, :cond_4

    .line 308
    .line 309
    add-int/lit8 v6, v6, -0x1

    .line 310
    .line 311
    if-ge v9, v6, :cond_4

    .line 312
    .line 313
    iget-object v6, v0, Lfp;->B:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {v6, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v6

    .line 319
    iget-object v7, v0, Lfp;->B:Ljava/lang/String;

    .line 320
    .line 321
    add-int/lit8 v9, v9, 0x1

    .line 322
    .line 323
    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v7

    .line 327
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 328
    .line 329
    .line 330
    move-result v9

    .line 331
    if-lez v9, :cond_5

    .line 332
    .line 333
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 334
    .line 335
    .line 336
    move-result v9

    .line 337
    if-lez v9, :cond_5

    .line 338
    .line 339
    :try_start_0
    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 340
    .line 341
    .line 342
    move-result v6

    .line 343
    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 344
    .line 345
    .line 346
    move-result v7

    .line 347
    cmpl-float v9, v6, v4

    .line 348
    .line 349
    if-lez v9, :cond_5

    .line 350
    .line 351
    cmpl-float v9, v7, v4

    .line 352
    .line 353
    if-lez v9, :cond_5

    .line 354
    .line 355
    if-ne v8, v2, :cond_3

    .line 356
    .line 357
    div-float/2addr v7, v6

    .line 358
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 359
    .line 360
    .line 361
    goto/16 :goto_3

    .line 362
    .line 363
    :cond_3
    div-float/2addr v6, v7

    .line 364
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_4

    .line 365
    .line 366
    .line 367
    goto/16 :goto_3

    .line 368
    .line 369
    :cond_4
    iget-object v6, v0, Lfp;->B:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v6

    .line 375
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 376
    .line 377
    .line 378
    move-result v7

    .line 379
    if-lez v7, :cond_5

    .line 380
    .line 381
    :try_start_1
    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_4

    .line 382
    .line 383
    .line 384
    goto/16 :goto_3

    .line 385
    .line 386
    :pswitch_8
    iget v7, v0, Lfp;->N:F

    .line 387
    .line 388
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 389
    .line 390
    .line 391
    move-result v6

    .line 392
    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    .line 393
    .line 394
    .line 395
    move-result v6

    .line 396
    iput v6, v0, Lfp;->N:F

    .line 397
    .line 398
    iput v8, v0, Lfp;->H:I

    .line 399
    .line 400
    goto/16 :goto_3

    .line 401
    .line 402
    :pswitch_9
    :try_start_2
    iget v7, v0, Lfp;->L:I

    .line 403
    .line 404
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 405
    .line 406
    .line 407
    move-result v7

    .line 408
    iput v7, v0, Lfp;->L:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 409
    .line 410
    goto/16 :goto_3

    .line 411
    .line 412
    :catch_0
    iget v7, v0, Lfp;->L:I

    .line 413
    .line 414
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 415
    .line 416
    .line 417
    move-result v6

    .line 418
    if-ne v6, v9, :cond_5

    .line 419
    .line 420
    iput v9, v0, Lfp;->L:I

    .line 421
    .line 422
    goto/16 :goto_3

    .line 423
    .line 424
    :pswitch_a
    :try_start_3
    iget v7, v0, Lfp;->J:I

    .line 425
    .line 426
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 427
    .line 428
    .line 429
    move-result v7

    .line 430
    iput v7, v0, Lfp;->J:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 431
    .line 432
    goto/16 :goto_3

    .line 433
    .line 434
    :catch_1
    iget v7, v0, Lfp;->J:I

    .line 435
    .line 436
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 437
    .line 438
    .line 439
    move-result v6

    .line 440
    if-ne v6, v9, :cond_5

    .line 441
    .line 442
    iput v9, v0, Lfp;->J:I

    .line 443
    .line 444
    goto/16 :goto_3

    .line 445
    .line 446
    :pswitch_b
    iget v7, v0, Lfp;->M:F

    .line 447
    .line 448
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 449
    .line 450
    .line 451
    move-result v6

    .line 452
    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    .line 453
    .line 454
    .line 455
    move-result v6

    .line 456
    iput v6, v0, Lfp;->M:F

    .line 457
    .line 458
    iput v8, v0, Lfp;->G:I

    .line 459
    .line 460
    goto/16 :goto_3

    .line 461
    .line 462
    :pswitch_c
    :try_start_4
    iget v7, v0, Lfp;->K:I

    .line 463
    .line 464
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 465
    .line 466
    .line 467
    move-result v7

    .line 468
    iput v7, v0, Lfp;->K:I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 469
    .line 470
    goto/16 :goto_3

    .line 471
    .line 472
    :catch_2
    iget v7, v0, Lfp;->K:I

    .line 473
    .line 474
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 475
    .line 476
    .line 477
    move-result v6

    .line 478
    if-ne v6, v9, :cond_5

    .line 479
    .line 480
    iput v9, v0, Lfp;->K:I

    .line 481
    .line 482
    goto/16 :goto_3

    .line 483
    .line 484
    :pswitch_d
    :try_start_5
    iget v7, v0, Lfp;->I:I

    .line 485
    .line 486
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 487
    .line 488
    .line 489
    move-result v7

    .line 490
    iput v7, v0, Lfp;->I:I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 491
    .line 492
    goto/16 :goto_3

    .line 493
    .line 494
    :catch_3
    iget v7, v0, Lfp;->I:I

    .line 495
    .line 496
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 497
    .line 498
    .line 499
    move-result v6

    .line 500
    if-ne v6, v9, :cond_5

    .line 501
    .line 502
    iput v9, v0, Lfp;->I:I

    .line 503
    .line 504
    goto/16 :goto_3

    .line 505
    .line 506
    :pswitch_e
    invoke-virtual {p0, v6, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 507
    .line 508
    .line 509
    move-result v6

    .line 510
    iput v6, v0, Lfp;->H:I

    .line 511
    .line 512
    goto/16 :goto_3

    .line 513
    .line 514
    :pswitch_f
    invoke-virtual {p0, v6, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 515
    .line 516
    .line 517
    move-result v6

    .line 518
    iput v6, v0, Lfp;->G:I

    .line 519
    .line 520
    goto/16 :goto_3

    .line 521
    .line 522
    :pswitch_10
    iget v7, v0, Lfp;->A:F

    .line 523
    .line 524
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 525
    .line 526
    .line 527
    move-result v6

    .line 528
    iput v6, v0, Lfp;->A:F

    .line 529
    .line 530
    goto/16 :goto_3

    .line 531
    .line 532
    :pswitch_11
    iget v7, v0, Lfp;->z:F

    .line 533
    .line 534
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 535
    .line 536
    .line 537
    move-result v6

    .line 538
    iput v6, v0, Lfp;->z:F

    .line 539
    .line 540
    goto/16 :goto_3

    .line 541
    .line 542
    :pswitch_12
    iget-boolean v7, v0, Lfp;->S:Z

    .line 543
    .line 544
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 545
    .line 546
    .line 547
    move-result v6

    .line 548
    iput-boolean v6, v0, Lfp;->S:Z

    .line 549
    .line 550
    goto/16 :goto_3

    .line 551
    .line 552
    :pswitch_13
    iget-boolean v7, v0, Lfp;->R:Z

    .line 553
    .line 554
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 555
    .line 556
    .line 557
    move-result v6

    .line 558
    iput-boolean v6, v0, Lfp;->R:Z

    .line 559
    .line 560
    goto/16 :goto_3

    .line 561
    .line 562
    :pswitch_14
    iget v7, v0, Lfp;->y:I

    .line 563
    .line 564
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 565
    .line 566
    .line 567
    move-result v6

    .line 568
    iput v6, v0, Lfp;->y:I

    .line 569
    .line 570
    goto/16 :goto_3

    .line 571
    .line 572
    :pswitch_15
    iget v7, v0, Lfp;->x:I

    .line 573
    .line 574
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 575
    .line 576
    .line 577
    move-result v6

    .line 578
    iput v6, v0, Lfp;->x:I

    .line 579
    .line 580
    goto/16 :goto_3

    .line 581
    .line 582
    :pswitch_16
    iget v7, v0, Lfp;->w:I

    .line 583
    .line 584
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 585
    .line 586
    .line 587
    move-result v6

    .line 588
    iput v6, v0, Lfp;->w:I

    .line 589
    .line 590
    goto/16 :goto_3

    .line 591
    .line 592
    :pswitch_17
    iget v7, v0, Lfp;->v:I

    .line 593
    .line 594
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 595
    .line 596
    .line 597
    move-result v6

    .line 598
    iput v6, v0, Lfp;->v:I

    .line 599
    .line 600
    goto/16 :goto_3

    .line 601
    .line 602
    :pswitch_18
    iget v7, v0, Lfp;->u:I

    .line 603
    .line 604
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 605
    .line 606
    .line 607
    move-result v6

    .line 608
    iput v6, v0, Lfp;->u:I

    .line 609
    .line 610
    goto/16 :goto_3

    .line 611
    .line 612
    :pswitch_19
    iget v7, v0, Lfp;->t:I

    .line 613
    .line 614
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 615
    .line 616
    .line 617
    move-result v6

    .line 618
    iput v6, v0, Lfp;->t:I

    .line 619
    .line 620
    goto/16 :goto_3

    .line 621
    .line 622
    :pswitch_1a
    iget v7, v0, Lfp;->s:I

    .line 623
    .line 624
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 625
    .line 626
    .line 627
    move-result v7

    .line 628
    iput v7, v0, Lfp;->s:I

    .line 629
    .line 630
    if-ne v7, v1, :cond_5

    .line 631
    .line 632
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 633
    .line 634
    .line 635
    move-result v6

    .line 636
    iput v6, v0, Lfp;->s:I

    .line 637
    .line 638
    goto/16 :goto_3

    .line 639
    .line 640
    :pswitch_1b
    iget v7, v0, Lfp;->r:I

    .line 641
    .line 642
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 643
    .line 644
    .line 645
    move-result v7

    .line 646
    iput v7, v0, Lfp;->r:I

    .line 647
    .line 648
    if-ne v7, v1, :cond_5

    .line 649
    .line 650
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 651
    .line 652
    .line 653
    move-result v6

    .line 654
    iput v6, v0, Lfp;->r:I

    .line 655
    .line 656
    goto/16 :goto_3

    .line 657
    .line 658
    :pswitch_1c
    iget v7, v0, Lfp;->q:I

    .line 659
    .line 660
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 661
    .line 662
    .line 663
    move-result v7

    .line 664
    iput v7, v0, Lfp;->q:I

    .line 665
    .line 666
    if-ne v7, v1, :cond_5

    .line 667
    .line 668
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 669
    .line 670
    .line 671
    move-result v6

    .line 672
    iput v6, v0, Lfp;->q:I

    .line 673
    .line 674
    goto/16 :goto_3

    .line 675
    .line 676
    :pswitch_1d
    iget v7, v0, Lfp;->p:I

    .line 677
    .line 678
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 679
    .line 680
    .line 681
    move-result v7

    .line 682
    iput v7, v0, Lfp;->p:I

    .line 683
    .line 684
    if-ne v7, v1, :cond_5

    .line 685
    .line 686
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 687
    .line 688
    .line 689
    move-result v6

    .line 690
    iput v6, v0, Lfp;->p:I

    .line 691
    .line 692
    goto/16 :goto_3

    .line 693
    .line 694
    :pswitch_1e
    iget v7, v0, Lfp;->l:I

    .line 695
    .line 696
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 697
    .line 698
    .line 699
    move-result v7

    .line 700
    iput v7, v0, Lfp;->l:I

    .line 701
    .line 702
    if-ne v7, v1, :cond_5

    .line 703
    .line 704
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 705
    .line 706
    .line 707
    move-result v6

    .line 708
    iput v6, v0, Lfp;->l:I

    .line 709
    .line 710
    goto/16 :goto_3

    .line 711
    .line 712
    :pswitch_1f
    iget v7, v0, Lfp;->k:I

    .line 713
    .line 714
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 715
    .line 716
    .line 717
    move-result v7

    .line 718
    iput v7, v0, Lfp;->k:I

    .line 719
    .line 720
    if-ne v7, v1, :cond_5

    .line 721
    .line 722
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 723
    .line 724
    .line 725
    move-result v6

    .line 726
    iput v6, v0, Lfp;->k:I

    .line 727
    .line 728
    goto/16 :goto_3

    .line 729
    .line 730
    :pswitch_20
    iget v7, v0, Lfp;->j:I

    .line 731
    .line 732
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 733
    .line 734
    .line 735
    move-result v7

    .line 736
    iput v7, v0, Lfp;->j:I

    .line 737
    .line 738
    if-ne v7, v1, :cond_5

    .line 739
    .line 740
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 741
    .line 742
    .line 743
    move-result v6

    .line 744
    iput v6, v0, Lfp;->j:I

    .line 745
    .line 746
    goto/16 :goto_3

    .line 747
    .line 748
    :pswitch_21
    iget v7, v0, Lfp;->i:I

    .line 749
    .line 750
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 751
    .line 752
    .line 753
    move-result v7

    .line 754
    iput v7, v0, Lfp;->i:I

    .line 755
    .line 756
    if-ne v7, v1, :cond_5

    .line 757
    .line 758
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 759
    .line 760
    .line 761
    move-result v6

    .line 762
    iput v6, v0, Lfp;->i:I

    .line 763
    .line 764
    goto/16 :goto_3

    .line 765
    .line 766
    :pswitch_22
    iget v7, v0, Lfp;->h:I

    .line 767
    .line 768
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 769
    .line 770
    .line 771
    move-result v7

    .line 772
    iput v7, v0, Lfp;->h:I

    .line 773
    .line 774
    if-ne v7, v1, :cond_5

    .line 775
    .line 776
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 777
    .line 778
    .line 779
    move-result v6

    .line 780
    iput v6, v0, Lfp;->h:I

    .line 781
    .line 782
    goto/16 :goto_3

    .line 783
    .line 784
    :pswitch_23
    iget v7, v0, Lfp;->g:I

    .line 785
    .line 786
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 787
    .line 788
    .line 789
    move-result v7

    .line 790
    iput v7, v0, Lfp;->g:I

    .line 791
    .line 792
    if-ne v7, v1, :cond_5

    .line 793
    .line 794
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 795
    .line 796
    .line 797
    move-result v6

    .line 798
    iput v6, v0, Lfp;->g:I

    .line 799
    .line 800
    goto/16 :goto_3

    .line 801
    .line 802
    :pswitch_24
    iget v7, v0, Lfp;->f:I

    .line 803
    .line 804
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 805
    .line 806
    .line 807
    move-result v7

    .line 808
    iput v7, v0, Lfp;->f:I

    .line 809
    .line 810
    if-ne v7, v1, :cond_5

    .line 811
    .line 812
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 813
    .line 814
    .line 815
    move-result v6

    .line 816
    iput v6, v0, Lfp;->f:I

    .line 817
    .line 818
    goto/16 :goto_3

    .line 819
    .line 820
    :pswitch_25
    iget v7, v0, Lfp;->e:I

    .line 821
    .line 822
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 823
    .line 824
    .line 825
    move-result v7

    .line 826
    iput v7, v0, Lfp;->e:I

    .line 827
    .line 828
    if-ne v7, v1, :cond_5

    .line 829
    .line 830
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 831
    .line 832
    .line 833
    move-result v6

    .line 834
    iput v6, v0, Lfp;->e:I

    .line 835
    .line 836
    goto :goto_3

    .line 837
    :pswitch_26
    iget v7, v0, Lfp;->d:I

    .line 838
    .line 839
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 840
    .line 841
    .line 842
    move-result v7

    .line 843
    iput v7, v0, Lfp;->d:I

    .line 844
    .line 845
    if-ne v7, v1, :cond_5

    .line 846
    .line 847
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 848
    .line 849
    .line 850
    move-result v6

    .line 851
    iput v6, v0, Lfp;->d:I

    .line 852
    .line 853
    goto :goto_3

    .line 854
    :pswitch_27
    iget v7, v0, Lfp;->c:F

    .line 855
    .line 856
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 857
    .line 858
    .line 859
    move-result v6

    .line 860
    iput v6, v0, Lfp;->c:F

    .line 861
    .line 862
    goto :goto_3

    .line 863
    :pswitch_28
    iget v7, v0, Lfp;->b:I

    .line 864
    .line 865
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 866
    .line 867
    .line 868
    move-result v6

    .line 869
    iput v6, v0, Lfp;->b:I

    .line 870
    .line 871
    goto :goto_3

    .line 872
    :pswitch_29
    iget v7, v0, Lfp;->a:I

    .line 873
    .line 874
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 875
    .line 876
    .line 877
    move-result v6

    .line 878
    iput v6, v0, Lfp;->a:I

    .line 879
    .line 880
    goto :goto_3

    .line 881
    :pswitch_2a
    iget v7, v0, Lfp;->o:F

    .line 882
    .line 883
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 884
    .line 885
    .line 886
    move-result v6

    .line 887
    const/high16 v7, 0x43b40000    # 360.0f

    .line 888
    .line 889
    rem-float/2addr v6, v7

    .line 890
    iput v6, v0, Lfp;->o:F

    .line 891
    .line 892
    cmpg-float v8, v6, v4

    .line 893
    .line 894
    if-gez v8, :cond_5

    .line 895
    .line 896
    sub-float v6, v7, v6

    .line 897
    .line 898
    rem-float/2addr v6, v7

    .line 899
    iput v6, v0, Lfp;->o:F

    .line 900
    .line 901
    goto :goto_3

    .line 902
    :pswitch_2b
    iget v7, v0, Lfp;->n:I

    .line 903
    .line 904
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 905
    .line 906
    .line 907
    move-result v6

    .line 908
    iput v6, v0, Lfp;->n:I

    .line 909
    .line 910
    goto :goto_3

    .line 911
    :pswitch_2c
    iget v7, v0, Lfp;->m:I

    .line 912
    .line 913
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 914
    .line 915
    .line 916
    move-result v7

    .line 917
    iput v7, v0, Lfp;->m:I

    .line 918
    .line 919
    if-ne v7, v1, :cond_5

    .line 920
    .line 921
    invoke-virtual {p0, v6, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 922
    .line 923
    .line 924
    move-result v6

    .line 925
    iput v6, v0, Lfp;->m:I

    .line 926
    .line 927
    goto :goto_3

    .line 928
    :pswitch_2d
    iget v7, v0, Lfp;->Q:I

    .line 929
    .line 930
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 931
    .line 932
    .line 933
    move-result v6

    .line 934
    iput v6, v0, Lfp;->Q:I

    .line 935
    .line 936
    :catch_4
    :cond_5
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 937
    .line 938
    goto/16 :goto_0

    .line 939
    .line 940
    :cond_6
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 941
    .line 942
    .line 943
    invoke-virtual {v0}, Lfp;->a()V

    .line 944
    .line 945
    .line 946
    return-object v0

    .line 947
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    .line 948
    .line 949
    .line 950
    .line 951
    .line 952
    .line 953
    .line 954
    .line 955
    .line 956
    .line 957
    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    .line 972
    .line 973
    .line 974
    .line 975
    .line 976
    .line 977
    .line 978
    .line 979
    .line 980
    .line 981
    .line 982
    .line 983
    .line 984
    .line 985
    .line 986
    .line 987
    .line 988
    .line 989
    .line 990
    .line 991
    .line 992
    .line 993
    .line 994
    .line 995
    .line 996
    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    .line 1002
    .line 1003
    .line 1004
    .line 1005
    .line 1006
    .line 1007
    .line 1008
    .line 1009
    .line 1010
    .line 1011
    .line 1012
    .line 1013
    .line 1014
    .line 1015
    .line 1016
    .line 1017
    .line 1018
    .line 1019
    .line 1020
    .line 1021
    .line 1022
    .line 1023
    .line 1024
    .line 1025
    .line 1026
    .line 1027
    :pswitch_data_1
    .packed-switch 0x2c
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

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 4

    .line 947
    new-instance p0, Lfp;

    .line 948
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, -0x1

    .line 949
    iput p1, p0, Lfp;->a:I

    .line 950
    iput p1, p0, Lfp;->b:I

    const/high16 v0, -0x40800000    # -1.0f

    .line 951
    iput v0, p0, Lfp;->c:F

    .line 952
    iput p1, p0, Lfp;->d:I

    .line 953
    iput p1, p0, Lfp;->e:I

    .line 954
    iput p1, p0, Lfp;->f:I

    .line 955
    iput p1, p0, Lfp;->g:I

    .line 956
    iput p1, p0, Lfp;->h:I

    .line 957
    iput p1, p0, Lfp;->i:I

    .line 958
    iput p1, p0, Lfp;->j:I

    .line 959
    iput p1, p0, Lfp;->k:I

    .line 960
    iput p1, p0, Lfp;->l:I

    .line 961
    iput p1, p0, Lfp;->m:I

    const/4 v1, 0x0

    .line 962
    iput v1, p0, Lfp;->n:I

    const/4 v2, 0x0

    .line 963
    iput v2, p0, Lfp;->o:F

    .line 964
    iput p1, p0, Lfp;->p:I

    .line 965
    iput p1, p0, Lfp;->q:I

    .line 966
    iput p1, p0, Lfp;->r:I

    .line 967
    iput p1, p0, Lfp;->s:I

    .line 968
    iput p1, p0, Lfp;->t:I

    .line 969
    iput p1, p0, Lfp;->u:I

    .line 970
    iput p1, p0, Lfp;->v:I

    .line 971
    iput p1, p0, Lfp;->w:I

    .line 972
    iput p1, p0, Lfp;->x:I

    .line 973
    iput p1, p0, Lfp;->y:I

    const/high16 v2, 0x3f000000    # 0.5f

    .line 974
    iput v2, p0, Lfp;->z:F

    .line 975
    iput v2, p0, Lfp;->A:F

    const/4 v3, 0x0

    .line 976
    iput-object v3, p0, Lfp;->B:Ljava/lang/String;

    .line 977
    iput v0, p0, Lfp;->C:F

    .line 978
    iput v0, p0, Lfp;->D:F

    .line 979
    iput v1, p0, Lfp;->E:I

    .line 980
    iput v1, p0, Lfp;->F:I

    .line 981
    iput v1, p0, Lfp;->G:I

    .line 982
    iput v1, p0, Lfp;->H:I

    .line 983
    iput v1, p0, Lfp;->I:I

    .line 984
    iput v1, p0, Lfp;->J:I

    .line 985
    iput v1, p0, Lfp;->K:I

    .line 986
    iput v1, p0, Lfp;->L:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 987
    iput v0, p0, Lfp;->M:F

    .line 988
    iput v0, p0, Lfp;->N:F

    .line 989
    iput p1, p0, Lfp;->O:I

    .line 990
    iput p1, p0, Lfp;->P:I

    .line 991
    iput p1, p0, Lfp;->Q:I

    .line 992
    iput-boolean v1, p0, Lfp;->R:Z

    .line 993
    iput-boolean v1, p0, Lfp;->S:Z

    .line 994
    iput-object v3, p0, Lfp;->T:Ljava/lang/String;

    const/4 v0, 0x1

    .line 995
    iput-boolean v0, p0, Lfp;->U:Z

    .line 996
    iput-boolean v0, p0, Lfp;->V:Z

    .line 997
    iput-boolean v1, p0, Lfp;->W:Z

    .line 998
    iput-boolean v1, p0, Lfp;->X:Z

    .line 999
    iput-boolean v1, p0, Lfp;->Y:Z

    .line 1000
    iput p1, p0, Lfp;->Z:I

    .line 1001
    iput p1, p0, Lfp;->a0:I

    .line 1002
    iput p1, p0, Lfp;->b0:I

    .line 1003
    iput p1, p0, Lfp;->c0:I

    .line 1004
    iput p1, p0, Lfp;->d0:I

    .line 1005
    iput p1, p0, Lfp;->e0:I

    .line 1006
    iput v2, p0, Lfp;->f0:F

    .line 1007
    new-instance p1, Lpp;

    invoke-direct {p1}, Lpp;-><init>()V

    iput-object p1, p0, Lfp;->j0:Lpp;

    return-object p0
.end method

.method public getMaxHeight()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinHeight()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinWidth()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getOptimizationLevel()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 2
    .line 3
    iget p0, p0, Lqp;->p0:I

    .line 4
    .line 5
    return p0
.end method

.method public final onLayout(ZIIII)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x0

    .line 10
    move p4, p3

    .line 11
    :goto_0
    if-ge p4, p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p5

    .line 17
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lfp;

    .line 22
    .line 23
    iget-object v1, v0, Lfp;->j0:Lpp;

    .line 24
    .line 25
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x8

    .line 30
    .line 31
    if-ne v2, v3, :cond_0

    .line 32
    .line 33
    iget-boolean v2, v0, Lfp;->X:Z

    .line 34
    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    iget-boolean v0, v0, Lfp;->Y:Z

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-virtual {v1}, Lpp;->k()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {v1}, Lpp;->l()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1}, Lpp;->j()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/2addr v3, v0

    .line 57
    invoke-virtual {v1}, Lpp;->g()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v1, v2

    .line 62
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 63
    .line 64
    .line 65
    :goto_1
    add-int/lit8 p4, p4, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-lez p1, :cond_2

    .line 75
    .line 76
    :goto_2
    if-ge p3, p1, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    check-cast p2, Ldp;

    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    add-int/lit8 p3, p3, 0x1

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    return-void
.end method

.method public final onMeasure(II)V
    .locals 36

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    move/from16 v3, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 16
    .line 17
    const/high16 v4, 0x400000

    .line 18
    .line 19
    and-int/2addr v0, v4

    .line 20
    const/4 v4, 0x1

    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/view/View;->getLayoutDirection()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ne v4, v0, :cond_0

    .line 29
    .line 30
    move v0, v4

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v0, v5

    .line 33
    :goto_0
    iget-object v6, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 34
    .line 35
    iput-boolean v0, v6, Lqp;->h0:Z

    .line 36
    .line 37
    iget-boolean v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 38
    .line 39
    if-eqz v0, :cond_67

    .line 40
    .line 41
    iput-boolean v5, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    move v7, v5

    .line 48
    :goto_1
    if-ge v7, v0, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-virtual {v8}, Landroid/view/View;->isLayoutRequested()Z

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-eqz v8, :cond_1

    .line 59
    .line 60
    move v7, v4

    .line 61
    goto :goto_2

    .line 62
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    move v7, v5

    .line 66
    :goto_2
    if-eqz v7, :cond_62

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/view/View;->isInEditMode()Z

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    move v0, v5

    .line 77
    :goto_3
    if-ge v0, v11, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v12

    .line 83
    invoke-virtual {v1, v12}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 84
    .line 85
    .line 86
    move-result-object v12

    .line 87
    if-nez v12, :cond_3

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_3
    invoke-virtual {v12}, Lpp;->q()V

    .line 91
    .line 92
    .line 93
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_4
    iget-object v13, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 97
    .line 98
    const/4 v14, -0x1

    .line 99
    if-eqz v10, :cond_d

    .line 100
    .line 101
    move v0, v5

    .line 102
    :goto_5
    if-ge v0, v11, :cond_d

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v15

    .line 108
    :try_start_0
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    invoke-virtual {v15}, Landroid/view/View;->getId()I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    invoke-virtual {v8, v12}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-virtual {v15}, Landroid/view/View;->getId()I

    .line 121
    .line 122
    .line 123
    move-result v12

    .line 124
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v12

    .line 128
    if-eqz v8, :cond_7

    .line 129
    .line 130
    iget-object v5, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->v:Ljava/util/HashMap;

    .line 131
    .line 132
    if-nez v5, :cond_5

    .line 133
    .line 134
    new-instance v5, Ljava/util/HashMap;

    .line 135
    .line 136
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object v5, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->v:Ljava/util/HashMap;

    .line 140
    .line 141
    :cond_5
    const-string v5, "/"

    .line 142
    .line 143
    invoke-virtual {v8, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eq v5, v14, :cond_6

    .line 148
    .line 149
    add-int/lit8 v5, v5, 0x1

    .line 150
    .line 151
    invoke-virtual {v8, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    goto :goto_6

    .line 156
    :cond_6
    move-object v5, v8

    .line 157
    :goto_6
    iget-object v9, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->v:Ljava/util/HashMap;

    .line 158
    .line 159
    invoke-virtual {v9, v5, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    :cond_7
    const/16 v5, 0x2f

    .line 163
    .line 164
    invoke-virtual {v8, v5}, Ljava/lang/String;->indexOf(I)I

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    if-eq v5, v14, :cond_8

    .line 169
    .line 170
    add-int/lit8 v5, v5, 0x1

    .line 171
    .line 172
    invoke-virtual {v8, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    :cond_8
    invoke-virtual {v15}, Landroid/view/View;->getId()I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-nez v5, :cond_9

    .line 181
    .line 182
    :goto_7
    move-object v5, v6

    .line 183
    goto :goto_8

    .line 184
    :cond_9
    invoke-virtual {v13, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v9

    .line 188
    check-cast v9, Landroid/view/View;

    .line 189
    .line 190
    if-nez v9, :cond_a

    .line 191
    .line 192
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v9

    .line 196
    if-eqz v9, :cond_a

    .line 197
    .line 198
    if-eq v9, v1, :cond_a

    .line 199
    .line 200
    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    if-ne v5, v1, :cond_a

    .line 205
    .line 206
    invoke-virtual {v1, v9}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    .line 207
    .line 208
    .line 209
    :cond_a
    if-ne v9, v1, :cond_b

    .line 210
    .line 211
    goto :goto_7

    .line 212
    :cond_b
    if-nez v9, :cond_c

    .line 213
    .line 214
    const/4 v5, 0x0

    .line 215
    goto :goto_8

    .line 216
    :cond_c
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Lfp;

    .line 221
    .line 222
    iget-object v5, v5, Lfp;->j0:Lpp;

    .line 223
    .line 224
    :goto_8
    iput-object v8, v5, Lpp;->W:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .line 226
    :catch_0
    add-int/lit8 v0, v0, 0x1

    .line 227
    .line 228
    const/4 v5, 0x0

    .line 229
    goto :goto_5

    .line 230
    :cond_d
    iget v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 231
    .line 232
    if-eq v0, v14, :cond_e

    .line 233
    .line 234
    const/4 v0, 0x0

    .line 235
    :goto_9
    if-ge v0, v11, :cond_e

    .line 236
    .line 237
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 242
    .line 243
    .line 244
    add-int/lit8 v0, v0, 0x1

    .line 245
    .line 246
    goto :goto_9

    .line 247
    :cond_e
    iget-object v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 248
    .line 249
    if-eqz v0, :cond_22

    .line 250
    .line 251
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 252
    .line 253
    .line 254
    move-result v8

    .line 255
    new-instance v9, Ljava/util/HashSet;

    .line 256
    .line 257
    iget-object v12, v0, Lop;->b:Ljava/util/HashMap;

    .line 258
    .line 259
    invoke-virtual {v12}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-direct {v9, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 264
    .line 265
    .line 266
    const/4 v15, 0x0

    .line 267
    :goto_a
    if-ge v15, v8, :cond_1c

    .line 268
    .line 269
    invoke-virtual {v1, v15}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-virtual {v12, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v4

    .line 285
    if-nez v4, :cond_10

    .line 286
    .line 287
    :try_start_1
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 296
    .line 297
    .line 298
    move-result v4

    .line 299
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 300
    .line 301
    .line 302
    :catch_1
    :cond_f
    :goto_b
    move/from16 v18, v7

    .line 303
    .line 304
    move/from16 v19, v8

    .line 305
    .line 306
    move-object/from16 v20, v9

    .line 307
    .line 308
    move/from16 v21, v10

    .line 309
    .line 310
    goto/16 :goto_13

    .line 311
    .line 312
    :cond_10
    if-eq v0, v14, :cond_1b

    .line 313
    .line 314
    if-ne v0, v14, :cond_11

    .line 315
    .line 316
    goto :goto_b

    .line 317
    :cond_11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    invoke-virtual {v12, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    if-eqz v4, :cond_f

    .line 326
    .line 327
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    invoke-virtual {v9, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    invoke-virtual {v12, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v4

    .line 342
    check-cast v4, Ljp;

    .line 343
    .line 344
    instance-of v14, v5, Lag;

    .line 345
    .line 346
    if-eqz v14, :cond_12

    .line 347
    .line 348
    iget-object v14, v4, Ljp;->d:Lkp;

    .line 349
    .line 350
    move/from16 v18, v7

    .line 351
    .line 352
    const/4 v7, 0x1

    .line 353
    iput v7, v14, Lkp;->c0:I

    .line 354
    .line 355
    goto :goto_c

    .line 356
    :cond_12
    move/from16 v18, v7

    .line 357
    .line 358
    const/4 v7, 0x1

    .line 359
    :goto_c
    iget-object v14, v4, Ljp;->d:Lkp;

    .line 360
    .line 361
    iget-object v7, v4, Ljp;->b:Lmp;

    .line 362
    .line 363
    move/from16 v19, v8

    .line 364
    .line 365
    iget-object v8, v4, Ljp;->e:Lnp;

    .line 366
    .line 367
    move-object/from16 v20, v9

    .line 368
    .line 369
    iget v9, v14, Lkp;->c0:I

    .line 370
    .line 371
    move/from16 v21, v10

    .line 372
    .line 373
    const/4 v10, -0x1

    .line 374
    if-eq v9, v10, :cond_15

    .line 375
    .line 376
    const/4 v10, 0x1

    .line 377
    if-eq v9, v10, :cond_13

    .line 378
    .line 379
    goto :goto_d

    .line 380
    :cond_13
    move-object v9, v5

    .line 381
    check-cast v9, Lag;

    .line 382
    .line 383
    invoke-virtual {v9, v0}, Landroid/view/View;->setId(I)V

    .line 384
    .line 385
    .line 386
    iget v0, v14, Lkp;->a0:I

    .line 387
    .line 388
    invoke-virtual {v9, v0}, Lag;->setType(I)V

    .line 389
    .line 390
    .line 391
    iget v0, v14, Lkp;->b0:I

    .line 392
    .line 393
    invoke-virtual {v9, v0}, Lag;->setMargin(I)V

    .line 394
    .line 395
    .line 396
    iget-boolean v0, v14, Lkp;->i0:Z

    .line 397
    .line 398
    invoke-virtual {v9, v0}, Lag;->setAllowsGoneWidget(Z)V

    .line 399
    .line 400
    .line 401
    iget-object v0, v14, Lkp;->d0:[I

    .line 402
    .line 403
    if-eqz v0, :cond_14

    .line 404
    .line 405
    invoke-virtual {v9, v0}, Ldp;->setReferencedIds([I)V

    .line 406
    .line 407
    .line 408
    goto :goto_d

    .line 409
    :cond_14
    iget-object v0, v14, Lkp;->e0:Ljava/lang/String;

    .line 410
    .line 411
    if-eqz v0, :cond_15

    .line 412
    .line 413
    invoke-static {v9, v0}, Lop;->b(Lag;Ljava/lang/String;)[I

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    iput-object v0, v14, Lkp;->d0:[I

    .line 418
    .line 419
    invoke-virtual {v9, v0}, Ldp;->setReferencedIds([I)V

    .line 420
    .line 421
    .line 422
    :cond_15
    :goto_d
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    move-object v9, v0

    .line 427
    check-cast v9, Lfp;

    .line 428
    .line 429
    invoke-virtual {v9}, Lfp;->a()V

    .line 430
    .line 431
    .line 432
    invoke-virtual {v4, v9}, Ljp;->a(Lfp;)V

    .line 433
    .line 434
    .line 435
    iget-object v4, v4, Ljp;->f:Ljava/util/HashMap;

    .line 436
    .line 437
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 438
    .line 439
    .line 440
    move-result-object v10

    .line 441
    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 446
    .line 447
    .line 448
    move-result-object v14

    .line 449
    :goto_e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    if-eqz v0, :cond_16

    .line 454
    .line 455
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    check-cast v0, Ljava/lang/String;

    .line 460
    .line 461
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v22

    .line 465
    move-object/from16 v23, v4

    .line 466
    .line 467
    move-object/from16 v4, v22

    .line 468
    .line 469
    check-cast v4, Lcp;

    .line 470
    .line 471
    move-object/from16 v22, v14

    .line 472
    .line 473
    const-string v14, "set"

    .line 474
    .line 475
    invoke-static {v14, v0}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    :try_start_2
    iget v14, v4, Lcp;->a:I

    .line 480
    .line 481
    invoke-static {v14}, Loq;->t(I)I

    .line 482
    .line 483
    .line 484
    move-result v14
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_2

    .line 485
    sget-object v24, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 486
    .line 487
    sget-object v25, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 488
    .line 489
    packed-switch v14, :pswitch_data_0

    .line 490
    .line 491
    .line 492
    goto/16 :goto_12

    .line 493
    .line 494
    :pswitch_0
    :try_start_3
    filled-new-array/range {v25 .. v25}, [Ljava/lang/Class;

    .line 495
    .line 496
    .line 497
    move-result-object v14

    .line 498
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    iget v4, v4, Lcp;->c:F

    .line 503
    .line 504
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    goto/16 :goto_12

    .line 516
    .line 517
    :catch_2
    move-exception v0

    .line 518
    goto/16 :goto_f

    .line 519
    .line 520
    :catch_3
    move-exception v0

    .line 521
    goto/16 :goto_10

    .line 522
    .line 523
    :catch_4
    move-exception v0

    .line 524
    goto/16 :goto_11

    .line 525
    .line 526
    :pswitch_1
    sget-object v14, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 527
    .line 528
    filled-new-array {v14}, [Ljava/lang/Class;

    .line 529
    .line 530
    .line 531
    move-result-object v14

    .line 532
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    iget-boolean v4, v4, Lcp;->e:Z

    .line 537
    .line 538
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 539
    .line 540
    .line 541
    move-result-object v4

    .line 542
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v4

    .line 546
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    goto/16 :goto_12

    .line 550
    .line 551
    :pswitch_2
    const-class v14, Ljava/lang/CharSequence;

    .line 552
    .line 553
    filled-new-array {v14}, [Ljava/lang/Class;

    .line 554
    .line 555
    .line 556
    move-result-object v14

    .line 557
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    iget-object v4, v4, Lcp;->d:Ljava/lang/String;

    .line 562
    .line 563
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    move-result-object v4

    .line 567
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    goto :goto_12

    .line 571
    :pswitch_3
    const-class v14, Landroid/graphics/drawable/Drawable;

    .line 572
    .line 573
    filled-new-array {v14}, [Ljava/lang/Class;

    .line 574
    .line 575
    .line 576
    move-result-object v14

    .line 577
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 578
    .line 579
    .line 580
    move-result-object v0

    .line 581
    new-instance v14, Landroid/graphics/drawable/ColorDrawable;

    .line 582
    .line 583
    invoke-direct {v14}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 584
    .line 585
    .line 586
    iget v4, v4, Lcp;->f:I

    .line 587
    .line 588
    invoke-virtual {v14, v4}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    .line 589
    .line 590
    .line 591
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v4

    .line 595
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    .line 597
    .line 598
    goto :goto_12

    .line 599
    :pswitch_4
    filled-new-array/range {v24 .. v24}, [Ljava/lang/Class;

    .line 600
    .line 601
    .line 602
    move-result-object v14

    .line 603
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    iget v4, v4, Lcp;->f:I

    .line 608
    .line 609
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 610
    .line 611
    .line 612
    move-result-object v4

    .line 613
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 614
    .line 615
    .line 616
    move-result-object v4

    .line 617
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    .line 619
    .line 620
    goto :goto_12

    .line 621
    :pswitch_5
    filled-new-array/range {v25 .. v25}, [Ljava/lang/Class;

    .line 622
    .line 623
    .line 624
    move-result-object v14

    .line 625
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    iget v4, v4, Lcp;->c:F

    .line 630
    .line 631
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 632
    .line 633
    .line 634
    move-result-object v4

    .line 635
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v4

    .line 639
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    goto :goto_12

    .line 643
    :pswitch_6
    filled-new-array/range {v24 .. v24}, [Ljava/lang/Class;

    .line 644
    .line 645
    .line 646
    move-result-object v14

    .line 647
    invoke-virtual {v10, v0, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    iget v4, v4, Lcp;->b:I

    .line 652
    .line 653
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 654
    .line 655
    .line 656
    move-result-object v4

    .line 657
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object v4

    .line 661
    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_2

    .line 662
    .line 663
    .line 664
    goto :goto_12

    .line 665
    :goto_f
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 666
    .line 667
    .line 668
    goto :goto_12

    .line 669
    :goto_10
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 670
    .line 671
    .line 672
    goto :goto_12

    .line 673
    :goto_11
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 674
    .line 675
    .line 676
    :goto_12
    move-object/from16 v14, v22

    .line 677
    .line 678
    move-object/from16 v4, v23

    .line 679
    .line 680
    goto/16 :goto_e

    .line 681
    .line 682
    :cond_16
    invoke-virtual {v5, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 683
    .line 684
    .line 685
    iget v0, v7, Lmp;->b:I

    .line 686
    .line 687
    if-nez v0, :cond_17

    .line 688
    .line 689
    iget v0, v7, Lmp;->a:I

    .line 690
    .line 691
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    .line 692
    .line 693
    .line 694
    :cond_17
    iget v0, v7, Lmp;->c:F

    .line 695
    .line 696
    invoke-virtual {v5, v0}, Landroid/view/View;->setAlpha(F)V

    .line 697
    .line 698
    .line 699
    iget v0, v8, Lnp;->a:F

    .line 700
    .line 701
    invoke-virtual {v5, v0}, Landroid/view/View;->setRotation(F)V

    .line 702
    .line 703
    .line 704
    iget v0, v8, Lnp;->b:F

    .line 705
    .line 706
    invoke-virtual {v5, v0}, Landroid/view/View;->setRotationX(F)V

    .line 707
    .line 708
    .line 709
    iget v0, v8, Lnp;->c:F

    .line 710
    .line 711
    invoke-virtual {v5, v0}, Landroid/view/View;->setRotationY(F)V

    .line 712
    .line 713
    .line 714
    iget v0, v8, Lnp;->d:F

    .line 715
    .line 716
    invoke-virtual {v5, v0}, Landroid/view/View;->setScaleX(F)V

    .line 717
    .line 718
    .line 719
    iget v0, v8, Lnp;->e:F

    .line 720
    .line 721
    invoke-virtual {v5, v0}, Landroid/view/View;->setScaleY(F)V

    .line 722
    .line 723
    .line 724
    iget v0, v8, Lnp;->f:F

    .line 725
    .line 726
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 727
    .line 728
    .line 729
    move-result v0

    .line 730
    if-nez v0, :cond_18

    .line 731
    .line 732
    iget v0, v8, Lnp;->f:F

    .line 733
    .line 734
    invoke-virtual {v5, v0}, Landroid/view/View;->setPivotX(F)V

    .line 735
    .line 736
    .line 737
    :cond_18
    iget v0, v8, Lnp;->g:F

    .line 738
    .line 739
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 740
    .line 741
    .line 742
    move-result v0

    .line 743
    if-nez v0, :cond_19

    .line 744
    .line 745
    iget v0, v8, Lnp;->g:F

    .line 746
    .line 747
    invoke-virtual {v5, v0}, Landroid/view/View;->setPivotY(F)V

    .line 748
    .line 749
    .line 750
    :cond_19
    iget v0, v8, Lnp;->h:F

    .line 751
    .line 752
    invoke-virtual {v5, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 753
    .line 754
    .line 755
    iget v0, v8, Lnp;->i:F

    .line 756
    .line 757
    invoke-virtual {v5, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 758
    .line 759
    .line 760
    iget v0, v8, Lnp;->j:F

    .line 761
    .line 762
    invoke-virtual {v5, v0}, Landroid/view/View;->setTranslationZ(F)V

    .line 763
    .line 764
    .line 765
    iget-boolean v0, v8, Lnp;->k:Z

    .line 766
    .line 767
    if-eqz v0, :cond_1a

    .line 768
    .line 769
    iget v0, v8, Lnp;->l:F

    .line 770
    .line 771
    invoke-virtual {v5, v0}, Landroid/view/View;->setElevation(F)V

    .line 772
    .line 773
    .line 774
    :cond_1a
    :goto_13
    add-int/lit8 v15, v15, 0x1

    .line 775
    .line 776
    move/from16 v7, v18

    .line 777
    .line 778
    move/from16 v8, v19

    .line 779
    .line 780
    move-object/from16 v9, v20

    .line 781
    .line 782
    move/from16 v10, v21

    .line 783
    .line 784
    const/4 v4, 0x1

    .line 785
    const/4 v14, -0x1

    .line 786
    goto/16 :goto_a

    .line 787
    .line 788
    :cond_1b
    new-instance v0, Ljava/lang/RuntimeException;

    .line 789
    .line 790
    const-string v1, "All children of ConstraintLayout must have ids to use ConstraintSet"

    .line 791
    .line 792
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 793
    .line 794
    .line 795
    throw v0

    .line 796
    :cond_1c
    move/from16 v18, v7

    .line 797
    .line 798
    move-object/from16 v20, v9

    .line 799
    .line 800
    move/from16 v21, v10

    .line 801
    .line 802
    invoke-virtual/range {v20 .. v20}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    :cond_1d
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 807
    .line 808
    .line 809
    move-result v4

    .line 810
    if-eqz v4, :cond_23

    .line 811
    .line 812
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 813
    .line 814
    .line 815
    move-result-object v4

    .line 816
    check-cast v4, Ljava/lang/Integer;

    .line 817
    .line 818
    invoke-virtual {v12, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    .line 820
    .line 821
    move-result-object v5

    .line 822
    check-cast v5, Ljp;

    .line 823
    .line 824
    iget-object v7, v5, Ljp;->d:Lkp;

    .line 825
    .line 826
    iget v8, v7, Lkp;->c0:I

    .line 827
    .line 828
    const/4 v10, -0x1

    .line 829
    if-eq v8, v10, :cond_21

    .line 830
    .line 831
    const/4 v10, 0x1

    .line 832
    if-eq v8, v10, :cond_1e

    .line 833
    .line 834
    goto :goto_16

    .line 835
    :cond_1e
    new-instance v8, Lag;

    .line 836
    .line 837
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 838
    .line 839
    .line 840
    move-result-object v9

    .line 841
    invoke-direct {v8, v9}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 842
    .line 843
    .line 844
    const/16 v10, 0x20

    .line 845
    .line 846
    new-array v10, v10, [I

    .line 847
    .line 848
    iput-object v10, v8, Ldp;->j:[I

    .line 849
    .line 850
    new-instance v10, Ljava/util/HashMap;

    .line 851
    .line 852
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 853
    .line 854
    .line 855
    iput-object v10, v8, Ldp;->o:Ljava/util/HashMap;

    .line 856
    .line 857
    iput-object v9, v8, Ldp;->l:Landroid/content/Context;

    .line 858
    .line 859
    new-instance v9, Lbg;

    .line 860
    .line 861
    invoke-direct {v9}, Lpp;-><init>()V

    .line 862
    .line 863
    .line 864
    const/4 v10, 0x4

    .line 865
    new-array v14, v10, [Lpp;

    .line 866
    .line 867
    iput-object v14, v9, Lbg;->d0:[Lpp;

    .line 868
    .line 869
    const/4 v10, 0x0

    .line 870
    iput v10, v9, Lbg;->e0:I

    .line 871
    .line 872
    iput v10, v9, Lbg;->f0:I

    .line 873
    .line 874
    const/4 v14, 0x1

    .line 875
    iput-boolean v14, v9, Lbg;->g0:Z

    .line 876
    .line 877
    iput v10, v9, Lbg;->h0:I

    .line 878
    .line 879
    iput-object v9, v8, Lag;->q:Lbg;

    .line 880
    .line 881
    iput-object v9, v8, Ldp;->m:Lbg;

    .line 882
    .line 883
    invoke-virtual {v8}, Ldp;->d()V

    .line 884
    .line 885
    .line 886
    const/16 v9, 0x8

    .line 887
    .line 888
    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 889
    .line 890
    .line 891
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 892
    .line 893
    .line 894
    move-result v9

    .line 895
    invoke-virtual {v8, v9}, Landroid/view/View;->setId(I)V

    .line 896
    .line 897
    .line 898
    iget-object v9, v7, Lkp;->d0:[I

    .line 899
    .line 900
    if-eqz v9, :cond_1f

    .line 901
    .line 902
    invoke-virtual {v8, v9}, Ldp;->setReferencedIds([I)V

    .line 903
    .line 904
    .line 905
    goto :goto_15

    .line 906
    :cond_1f
    iget-object v9, v7, Lkp;->e0:Ljava/lang/String;

    .line 907
    .line 908
    if-eqz v9, :cond_20

    .line 909
    .line 910
    invoke-static {v8, v9}, Lop;->b(Lag;Ljava/lang/String;)[I

    .line 911
    .line 912
    .line 913
    move-result-object v9

    .line 914
    iput-object v9, v7, Lkp;->d0:[I

    .line 915
    .line 916
    invoke-virtual {v8, v9}, Ldp;->setReferencedIds([I)V

    .line 917
    .line 918
    .line 919
    :cond_20
    :goto_15
    iget v9, v7, Lkp;->a0:I

    .line 920
    .line 921
    invoke-virtual {v8, v9}, Lag;->setType(I)V

    .line 922
    .line 923
    .line 924
    iget v9, v7, Lkp;->b0:I

    .line 925
    .line 926
    invoke-virtual {v8, v9}, Lag;->setMargin(I)V

    .line 927
    .line 928
    .line 929
    new-instance v9, Lfp;

    .line 930
    .line 931
    const/4 v10, -0x2

    .line 932
    invoke-direct {v9, v10}, Lfp;-><init>(I)V

    .line 933
    .line 934
    .line 935
    invoke-virtual {v8}, Ldp;->d()V

    .line 936
    .line 937
    .line 938
    invoke-virtual {v5, v9}, Ljp;->a(Lfp;)V

    .line 939
    .line 940
    .line 941
    invoke-virtual {v1, v8, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 942
    .line 943
    .line 944
    :cond_21
    :goto_16
    iget-boolean v7, v7, Lkp;->a:Z

    .line 945
    .line 946
    if-eqz v7, :cond_1d

    .line 947
    .line 948
    new-instance v7, Leb0;

    .line 949
    .line 950
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 951
    .line 952
    .line 953
    move-result-object v8

    .line 954
    invoke-direct {v7, v8}, Leb0;-><init>(Landroid/content/Context;)V

    .line 955
    .line 956
    .line 957
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 958
    .line 959
    .line 960
    move-result v4

    .line 961
    invoke-virtual {v7, v4}, Landroid/view/View;->setId(I)V

    .line 962
    .line 963
    .line 964
    new-instance v4, Lfp;

    .line 965
    .line 966
    const/4 v10, -0x2

    .line 967
    invoke-direct {v4, v10}, Lfp;-><init>(I)V

    .line 968
    .line 969
    .line 970
    invoke-virtual {v5, v4}, Ljp;->a(Lfp;)V

    .line 971
    .line 972
    .line 973
    invoke-virtual {v1, v7, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 974
    .line 975
    .line 976
    goto/16 :goto_14

    .line 977
    .line 978
    :cond_22
    move/from16 v18, v7

    .line 979
    .line 980
    move/from16 v21, v10

    .line 981
    .line 982
    :cond_23
    iget-object v0, v6, Lqp;->d0:Ljava/util/ArrayList;

    .line 983
    .line 984
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 985
    .line 986
    .line 987
    iget-object v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 988
    .line 989
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 990
    .line 991
    .line 992
    move-result v4

    .line 993
    if-lez v4, :cond_2b

    .line 994
    .line 995
    const/4 v7, 0x0

    .line 996
    :goto_17
    if-ge v7, v4, :cond_2b

    .line 997
    .line 998
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 999
    .line 1000
    .line 1001
    move-result-object v8

    .line 1002
    check-cast v8, Ldp;

    .line 1003
    .line 1004
    iget-object v9, v8, Ldp;->o:Ljava/util/HashMap;

    .line 1005
    .line 1006
    invoke-virtual {v8}, Landroid/view/View;->isInEditMode()Z

    .line 1007
    .line 1008
    .line 1009
    move-result v10

    .line 1010
    if-eqz v10, :cond_24

    .line 1011
    .line 1012
    iget-object v10, v8, Ldp;->n:Ljava/lang/String;

    .line 1013
    .line 1014
    invoke-virtual {v8, v10}, Ldp;->setIds(Ljava/lang/String;)V

    .line 1015
    .line 1016
    .line 1017
    :cond_24
    iget-object v10, v8, Ldp;->m:Lbg;

    .line 1018
    .line 1019
    if-nez v10, :cond_25

    .line 1020
    .line 1021
    move-object/from16 v20, v0

    .line 1022
    .line 1023
    const/16 v19, 0x2

    .line 1024
    .line 1025
    goto/16 :goto_1b

    .line 1026
    .line 1027
    :cond_25
    const/4 v12, 0x0

    .line 1028
    iput v12, v10, Lbg;->e0:I

    .line 1029
    .line 1030
    iget-object v10, v10, Lbg;->d0:[Lpp;

    .line 1031
    .line 1032
    const/4 v12, 0x0

    .line 1033
    invoke-static {v10, v12}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1034
    .line 1035
    .line 1036
    const/4 v10, 0x0

    .line 1037
    :goto_18
    iget v12, v8, Ldp;->k:I

    .line 1038
    .line 1039
    if-ge v10, v12, :cond_2a

    .line 1040
    .line 1041
    iget-object v12, v8, Ldp;->j:[I

    .line 1042
    .line 1043
    aget v12, v12, v10

    .line 1044
    .line 1045
    invoke-virtual {v13, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1046
    .line 1047
    .line 1048
    move-result-object v14

    .line 1049
    check-cast v14, Landroid/view/View;

    .line 1050
    .line 1051
    if-nez v14, :cond_26

    .line 1052
    .line 1053
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1054
    .line 1055
    .line 1056
    move-result-object v12

    .line 1057
    invoke-virtual {v9, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1058
    .line 1059
    .line 1060
    move-result-object v12

    .line 1061
    check-cast v12, Ljava/lang/String;

    .line 1062
    .line 1063
    invoke-virtual {v8, v1, v12}, Ldp;->c(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)I

    .line 1064
    .line 1065
    .line 1066
    move-result v15

    .line 1067
    if-eqz v15, :cond_26

    .line 1068
    .line 1069
    iget-object v14, v8, Ldp;->j:[I

    .line 1070
    .line 1071
    aput v15, v14, v10

    .line 1072
    .line 1073
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v14

    .line 1077
    invoke-virtual {v9, v14, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    invoke-virtual {v13, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v12

    .line 1084
    move-object v14, v12

    .line 1085
    check-cast v14, Landroid/view/View;

    .line 1086
    .line 1087
    :cond_26
    if-eqz v14, :cond_29

    .line 1088
    .line 1089
    iget-object v12, v8, Ldp;->m:Lbg;

    .line 1090
    .line 1091
    invoke-virtual {v1, v14}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 1092
    .line 1093
    .line 1094
    move-result-object v14

    .line 1095
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1096
    .line 1097
    .line 1098
    if-eq v14, v12, :cond_29

    .line 1099
    .line 1100
    if-nez v14, :cond_27

    .line 1101
    .line 1102
    goto :goto_19

    .line 1103
    :cond_27
    iget v15, v12, Lbg;->e0:I

    .line 1104
    .line 1105
    const/16 v17, 0x1

    .line 1106
    .line 1107
    add-int/lit8 v15, v15, 0x1

    .line 1108
    .line 1109
    const/16 v19, 0x2

    .line 1110
    .line 1111
    iget-object v5, v12, Lbg;->d0:[Lpp;

    .line 1112
    .line 1113
    move-object/from16 v20, v0

    .line 1114
    .line 1115
    array-length v0, v5

    .line 1116
    if-le v15, v0, :cond_28

    .line 1117
    .line 1118
    array-length v0, v5

    .line 1119
    mul-int/lit8 v0, v0, 0x2

    .line 1120
    .line 1121
    invoke-static {v5, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 1122
    .line 1123
    .line 1124
    move-result-object v0

    .line 1125
    move-object v5, v0

    .line 1126
    check-cast v5, [Lpp;

    .line 1127
    .line 1128
    iput-object v5, v12, Lbg;->d0:[Lpp;

    .line 1129
    .line 1130
    :cond_28
    iget v0, v12, Lbg;->e0:I

    .line 1131
    .line 1132
    aput-object v14, v5, v0

    .line 1133
    .line 1134
    const/16 v17, 0x1

    .line 1135
    .line 1136
    add-int/lit8 v0, v0, 0x1

    .line 1137
    .line 1138
    iput v0, v12, Lbg;->e0:I

    .line 1139
    .line 1140
    goto :goto_1a

    .line 1141
    :cond_29
    :goto_19
    move-object/from16 v20, v0

    .line 1142
    .line 1143
    const/16 v19, 0x2

    .line 1144
    .line 1145
    :goto_1a
    add-int/lit8 v10, v10, 0x1

    .line 1146
    .line 1147
    move-object/from16 v0, v20

    .line 1148
    .line 1149
    goto :goto_18

    .line 1150
    :cond_2a
    move-object/from16 v20, v0

    .line 1151
    .line 1152
    const/16 v19, 0x2

    .line 1153
    .line 1154
    iget-object v0, v8, Ldp;->m:Lbg;

    .line 1155
    .line 1156
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1157
    .line 1158
    .line 1159
    :goto_1b
    add-int/lit8 v7, v7, 0x1

    .line 1160
    .line 1161
    move-object/from16 v0, v20

    .line 1162
    .line 1163
    goto/16 :goto_17

    .line 1164
    .line 1165
    :cond_2b
    const/16 v19, 0x2

    .line 1166
    .line 1167
    const/4 v0, 0x0

    .line 1168
    :goto_1c
    if-ge v0, v11, :cond_2c

    .line 1169
    .line 1170
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1171
    .line 1172
    .line 1173
    add-int/lit8 v0, v0, 0x1

    .line 1174
    .line 1175
    goto :goto_1c

    .line 1176
    :cond_2c
    iget-object v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 1177
    .line 1178
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 1179
    .line 1180
    .line 1181
    const/4 v10, 0x0

    .line 1182
    invoke-virtual {v0, v10, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1183
    .line 1184
    .line 1185
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 1186
    .line 1187
    .line 1188
    move-result v4

    .line 1189
    invoke-virtual {v0, v4, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1190
    .line 1191
    .line 1192
    const/4 v4, 0x0

    .line 1193
    :goto_1d
    if-ge v4, v11, :cond_2d

    .line 1194
    .line 1195
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v5

    .line 1199
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v7

    .line 1203
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 1204
    .line 1205
    .line 1206
    move-result v5

    .line 1207
    invoke-virtual {v0, v5, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1208
    .line 1209
    .line 1210
    add-int/lit8 v4, v4, 0x1

    .line 1211
    .line 1212
    goto :goto_1d

    .line 1213
    :cond_2d
    const/4 v4, 0x0

    .line 1214
    :goto_1e
    if-ge v4, v11, :cond_63

    .line 1215
    .line 1216
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v5

    .line 1220
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v7

    .line 1224
    if-nez v7, :cond_2f

    .line 1225
    .line 1226
    :cond_2e
    :goto_1f
    move/from16 v28, v4

    .line 1227
    .line 1228
    move/from16 v4, v19

    .line 1229
    .line 1230
    const/4 v5, -0x2

    .line 1231
    const/4 v15, -0x1

    .line 1232
    goto/16 :goto_3b

    .line 1233
    .line 1234
    :cond_2f
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v8

    .line 1238
    check-cast v8, Lfp;

    .line 1239
    .line 1240
    iget-object v9, v6, Lqp;->d0:Ljava/util/ArrayList;

    .line 1241
    .line 1242
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1243
    .line 1244
    .line 1245
    iget-object v9, v7, Lpp;->I:Lqp;

    .line 1246
    .line 1247
    if-eqz v9, :cond_30

    .line 1248
    .line 1249
    iget-object v9, v9, Lqp;->d0:Ljava/util/ArrayList;

    .line 1250
    .line 1251
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1252
    .line 1253
    .line 1254
    const/4 v12, 0x0

    .line 1255
    iput-object v12, v7, Lpp;->I:Lqp;

    .line 1256
    .line 1257
    goto :goto_20

    .line 1258
    :cond_30
    const/4 v12, 0x0

    .line 1259
    :goto_20
    iput-object v6, v7, Lpp;->I:Lqp;

    .line 1260
    .line 1261
    invoke-virtual {v8}, Lfp;->a()V

    .line 1262
    .line 1263
    .line 1264
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 1265
    .line 1266
    .line 1267
    move-result v9

    .line 1268
    iput v9, v7, Lpp;->V:I

    .line 1269
    .line 1270
    iput-object v5, v7, Lpp;->U:Landroid/view/View;

    .line 1271
    .line 1272
    instance-of v9, v5, Ldp;

    .line 1273
    .line 1274
    const/4 v10, 0x6

    .line 1275
    if-eqz v9, :cond_35

    .line 1276
    .line 1277
    check-cast v5, Ldp;

    .line 1278
    .line 1279
    iget-boolean v9, v6, Lqp;->h0:Z

    .line 1280
    .line 1281
    check-cast v5, Lag;

    .line 1282
    .line 1283
    iget v5, v5, Lag;->p:I

    .line 1284
    .line 1285
    const/4 v14, 0x5

    .line 1286
    if-eqz v9, :cond_32

    .line 1287
    .line 1288
    if-ne v5, v14, :cond_31

    .line 1289
    .line 1290
    :goto_21
    const/4 v5, 0x1

    .line 1291
    goto :goto_23

    .line 1292
    :cond_31
    if-ne v5, v10, :cond_34

    .line 1293
    .line 1294
    :goto_22
    const/4 v5, 0x0

    .line 1295
    goto :goto_23

    .line 1296
    :cond_32
    if-ne v5, v14, :cond_33

    .line 1297
    .line 1298
    goto :goto_22

    .line 1299
    :cond_33
    if-ne v5, v10, :cond_34

    .line 1300
    .line 1301
    goto :goto_21

    .line 1302
    :cond_34
    :goto_23
    instance-of v9, v7, Lbg;

    .line 1303
    .line 1304
    if-eqz v9, :cond_35

    .line 1305
    .line 1306
    move-object v9, v7

    .line 1307
    check-cast v9, Lbg;

    .line 1308
    .line 1309
    iput v5, v9, Lbg;->f0:I

    .line 1310
    .line 1311
    :cond_35
    iget-boolean v5, v8, Lfp;->X:Z

    .line 1312
    .line 1313
    if-eqz v5, :cond_39

    .line 1314
    .line 1315
    check-cast v7, Lfb0;

    .line 1316
    .line 1317
    iget v5, v8, Lfp;->g0:I

    .line 1318
    .line 1319
    iget v9, v8, Lfp;->h0:I

    .line 1320
    .line 1321
    iget v8, v8, Lfp;->i0:F

    .line 1322
    .line 1323
    const/high16 v10, -0x40800000    # -1.0f

    .line 1324
    .line 1325
    cmpl-float v14, v8, v10

    .line 1326
    .line 1327
    if-eqz v14, :cond_36

    .line 1328
    .line 1329
    if-lez v14, :cond_2e

    .line 1330
    .line 1331
    iput v8, v7, Lfb0;->d0:F

    .line 1332
    .line 1333
    const/4 v8, -0x1

    .line 1334
    iput v8, v7, Lfb0;->e0:I

    .line 1335
    .line 1336
    iput v8, v7, Lfb0;->f0:I

    .line 1337
    .line 1338
    goto :goto_24

    .line 1339
    :cond_36
    const/4 v8, -0x1

    .line 1340
    if-eq v5, v8, :cond_38

    .line 1341
    .line 1342
    if-le v5, v8, :cond_37

    .line 1343
    .line 1344
    iput v10, v7, Lfb0;->d0:F

    .line 1345
    .line 1346
    iput v5, v7, Lfb0;->e0:I

    .line 1347
    .line 1348
    iput v8, v7, Lfb0;->f0:I

    .line 1349
    .line 1350
    :cond_37
    :goto_24
    move/from16 v28, v4

    .line 1351
    .line 1352
    move v15, v8

    .line 1353
    move/from16 v4, v19

    .line 1354
    .line 1355
    const/4 v5, -0x2

    .line 1356
    goto/16 :goto_3b

    .line 1357
    .line 1358
    :cond_38
    if-eq v9, v8, :cond_37

    .line 1359
    .line 1360
    if-le v9, v8, :cond_37

    .line 1361
    .line 1362
    iput v10, v7, Lfb0;->d0:F

    .line 1363
    .line 1364
    iput v8, v7, Lfb0;->e0:I

    .line 1365
    .line 1366
    iput v9, v7, Lfb0;->f0:I

    .line 1367
    .line 1368
    goto/16 :goto_1f

    .line 1369
    .line 1370
    :cond_39
    iget v5, v8, Lfp;->Z:I

    .line 1371
    .line 1372
    iget v9, v8, Lfp;->a0:I

    .line 1373
    .line 1374
    iget v14, v8, Lfp;->b0:I

    .line 1375
    .line 1376
    iget v15, v8, Lfp;->c0:I

    .line 1377
    .line 1378
    iget v12, v8, Lfp;->d0:I

    .line 1379
    .line 1380
    iget v10, v8, Lfp;->e0:I

    .line 1381
    .line 1382
    move/from16 v28, v4

    .line 1383
    .line 1384
    iget v4, v8, Lfp;->f0:F

    .line 1385
    .line 1386
    move-object/from16 v22, v7

    .line 1387
    .line 1388
    iget v7, v8, Lfp;->m:I

    .line 1389
    .line 1390
    const/16 v29, 0x4

    .line 1391
    .line 1392
    const/16 v30, 0x2

    .line 1393
    .line 1394
    move/from16 v31, v10

    .line 1395
    .line 1396
    const/16 v32, 0x5

    .line 1397
    .line 1398
    const/16 v33, 0x3

    .line 1399
    .line 1400
    const/4 v10, -0x1

    .line 1401
    const/16 v34, 0x0

    .line 1402
    .line 1403
    if-eq v7, v10, :cond_3b

    .line 1404
    .line 1405
    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v4

    .line 1409
    move-object/from16 v27, v4

    .line 1410
    .line 1411
    check-cast v27, Lpp;

    .line 1412
    .line 1413
    if-eqz v27, :cond_3a

    .line 1414
    .line 1415
    iget v4, v8, Lfp;->o:F

    .line 1416
    .line 1417
    iget v5, v8, Lfp;->n:I

    .line 1418
    .line 1419
    const/16 v23, 0x7

    .line 1420
    .line 1421
    const/16 v26, 0x0

    .line 1422
    .line 1423
    move/from16 v24, v23

    .line 1424
    .line 1425
    move/from16 v25, v5

    .line 1426
    .line 1427
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1428
    .line 1429
    .line 1430
    move-object/from16 v7, v22

    .line 1431
    .line 1432
    iput v4, v7, Lpp;->v:F

    .line 1433
    .line 1434
    goto :goto_25

    .line 1435
    :cond_3a
    move-object/from16 v7, v22

    .line 1436
    .line 1437
    :goto_25
    move-object v10, v7

    .line 1438
    goto/16 :goto_2e

    .line 1439
    .line 1440
    :cond_3b
    move-object/from16 v7, v22

    .line 1441
    .line 1442
    if-eq v5, v10, :cond_3e

    .line 1443
    .line 1444
    invoke-virtual {v0, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1445
    .line 1446
    .line 1447
    move-result-object v5

    .line 1448
    move-object/from16 v27, v5

    .line 1449
    .line 1450
    check-cast v27, Lpp;

    .line 1451
    .line 1452
    if-eqz v27, :cond_3c

    .line 1453
    .line 1454
    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 1455
    .line 1456
    move/from16 v24, v30

    .line 1457
    .line 1458
    move/from16 v25, v5

    .line 1459
    .line 1460
    move-object/from16 v22, v7

    .line 1461
    .line 1462
    move/from16 v26, v12

    .line 1463
    .line 1464
    move/from16 v23, v30

    .line 1465
    .line 1466
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1467
    .line 1468
    .line 1469
    goto :goto_26

    .line 1470
    :cond_3c
    move-object/from16 v22, v7

    .line 1471
    .line 1472
    move/from16 v23, v30

    .line 1473
    .line 1474
    :cond_3d
    :goto_26
    move/from16 v24, v23

    .line 1475
    .line 1476
    move/from16 v23, v29

    .line 1477
    .line 1478
    goto :goto_27

    .line 1479
    :cond_3e
    move-object/from16 v22, v7

    .line 1480
    .line 1481
    move/from16 v26, v12

    .line 1482
    .line 1483
    move/from16 v23, v30

    .line 1484
    .line 1485
    if-eq v9, v10, :cond_3d

    .line 1486
    .line 1487
    invoke-virtual {v0, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1488
    .line 1489
    .line 1490
    move-result-object v5

    .line 1491
    move-object/from16 v27, v5

    .line 1492
    .line 1493
    check-cast v27, Lpp;

    .line 1494
    .line 1495
    if-eqz v27, :cond_3d

    .line 1496
    .line 1497
    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 1498
    .line 1499
    move/from16 v25, v5

    .line 1500
    .line 1501
    move/from16 v24, v29

    .line 1502
    .line 1503
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1504
    .line 1505
    .line 1506
    move/from16 v35, v24

    .line 1507
    .line 1508
    move/from16 v24, v23

    .line 1509
    .line 1510
    move/from16 v23, v35

    .line 1511
    .line 1512
    :goto_27
    if-eq v14, v10, :cond_41

    .line 1513
    .line 1514
    invoke-virtual {v0, v14}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1515
    .line 1516
    .line 1517
    move-result-object v5

    .line 1518
    move-object/from16 v27, v5

    .line 1519
    .line 1520
    check-cast v27, Lpp;

    .line 1521
    .line 1522
    if-eqz v27, :cond_3f

    .line 1523
    .line 1524
    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 1525
    .line 1526
    move/from16 v25, v5

    .line 1527
    .line 1528
    move/from16 v26, v31

    .line 1529
    .line 1530
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1531
    .line 1532
    .line 1533
    :cond_3f
    move/from16 v5, v24

    .line 1534
    .line 1535
    :cond_40
    :goto_28
    move/from16 v7, v23

    .line 1536
    .line 1537
    goto :goto_29

    .line 1538
    :cond_41
    move/from16 v5, v24

    .line 1539
    .line 1540
    move/from16 v26, v31

    .line 1541
    .line 1542
    if-eq v15, v10, :cond_40

    .line 1543
    .line 1544
    invoke-virtual {v0, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1545
    .line 1546
    .line 1547
    move-result-object v7

    .line 1548
    move-object/from16 v27, v7

    .line 1549
    .line 1550
    check-cast v27, Lpp;

    .line 1551
    .line 1552
    if-eqz v27, :cond_40

    .line 1553
    .line 1554
    iget v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 1555
    .line 1556
    move/from16 v24, v23

    .line 1557
    .line 1558
    move/from16 v25, v7

    .line 1559
    .line 1560
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1561
    .line 1562
    .line 1563
    goto :goto_28

    .line 1564
    :goto_29
    iget v9, v8, Lfp;->h:I

    .line 1565
    .line 1566
    if-eq v9, v10, :cond_43

    .line 1567
    .line 1568
    invoke-virtual {v0, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1569
    .line 1570
    .line 1571
    move-result-object v9

    .line 1572
    move-object/from16 v27, v9

    .line 1573
    .line 1574
    check-cast v27, Lpp;

    .line 1575
    .line 1576
    if-eqz v27, :cond_42

    .line 1577
    .line 1578
    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1579
    .line 1580
    iget v10, v8, Lfp;->u:I

    .line 1581
    .line 1582
    move/from16 v24, v33

    .line 1583
    .line 1584
    move/from16 v25, v9

    .line 1585
    .line 1586
    move/from16 v26, v10

    .line 1587
    .line 1588
    move/from16 v23, v33

    .line 1589
    .line 1590
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1591
    .line 1592
    .line 1593
    goto :goto_2a

    .line 1594
    :cond_42
    move/from16 v23, v33

    .line 1595
    .line 1596
    :goto_2a
    move/from16 v24, v23

    .line 1597
    .line 1598
    move/from16 v23, v32

    .line 1599
    .line 1600
    const/4 v10, -0x1

    .line 1601
    goto :goto_2b

    .line 1602
    :cond_43
    move/from16 v23, v33

    .line 1603
    .line 1604
    iget v9, v8, Lfp;->i:I

    .line 1605
    .line 1606
    const/4 v10, -0x1

    .line 1607
    if-eq v9, v10, :cond_44

    .line 1608
    .line 1609
    invoke-virtual {v0, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1610
    .line 1611
    .line 1612
    move-result-object v9

    .line 1613
    move-object/from16 v27, v9

    .line 1614
    .line 1615
    check-cast v27, Lpp;

    .line 1616
    .line 1617
    if-eqz v27, :cond_44

    .line 1618
    .line 1619
    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1620
    .line 1621
    iget v12, v8, Lfp;->u:I

    .line 1622
    .line 1623
    move/from16 v25, v9

    .line 1624
    .line 1625
    move/from16 v26, v12

    .line 1626
    .line 1627
    move/from16 v24, v32

    .line 1628
    .line 1629
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1630
    .line 1631
    .line 1632
    move/from16 v35, v24

    .line 1633
    .line 1634
    move/from16 v24, v23

    .line 1635
    .line 1636
    move/from16 v23, v35

    .line 1637
    .line 1638
    goto :goto_2b

    .line 1639
    :cond_44
    move/from16 v24, v23

    .line 1640
    .line 1641
    move/from16 v23, v32

    .line 1642
    .line 1643
    :goto_2b
    iget v9, v8, Lfp;->j:I

    .line 1644
    .line 1645
    if-eq v9, v10, :cond_47

    .line 1646
    .line 1647
    invoke-virtual {v0, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1648
    .line 1649
    .line 1650
    move-result-object v9

    .line 1651
    move-object/from16 v27, v9

    .line 1652
    .line 1653
    check-cast v27, Lpp;

    .line 1654
    .line 1655
    if-eqz v27, :cond_45

    .line 1656
    .line 1657
    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 1658
    .line 1659
    iget v12, v8, Lfp;->w:I

    .line 1660
    .line 1661
    move/from16 v25, v9

    .line 1662
    .line 1663
    move/from16 v26, v12

    .line 1664
    .line 1665
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1666
    .line 1667
    .line 1668
    :cond_45
    move/from16 v9, v24

    .line 1669
    .line 1670
    :cond_46
    :goto_2c
    move-object/from16 v10, v22

    .line 1671
    .line 1672
    move/from16 v12, v23

    .line 1673
    .line 1674
    goto :goto_2d

    .line 1675
    :cond_47
    move/from16 v9, v24

    .line 1676
    .line 1677
    iget v12, v8, Lfp;->k:I

    .line 1678
    .line 1679
    if-eq v12, v10, :cond_46

    .line 1680
    .line 1681
    invoke-virtual {v0, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1682
    .line 1683
    .line 1684
    move-result-object v10

    .line 1685
    move-object/from16 v27, v10

    .line 1686
    .line 1687
    check-cast v27, Lpp;

    .line 1688
    .line 1689
    if-eqz v27, :cond_46

    .line 1690
    .line 1691
    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 1692
    .line 1693
    iget v12, v8, Lfp;->w:I

    .line 1694
    .line 1695
    move/from16 v24, v23

    .line 1696
    .line 1697
    move/from16 v25, v10

    .line 1698
    .line 1699
    move/from16 v26, v12

    .line 1700
    .line 1701
    invoke-virtual/range {v22 .. v27}, Lpp;->m(IIIILpp;)V

    .line 1702
    .line 1703
    .line 1704
    goto :goto_2c

    .line 1705
    :goto_2d
    iget v14, v8, Lfp;->l:I

    .line 1706
    .line 1707
    const/4 v15, -0x1

    .line 1708
    if-eq v14, v15, :cond_48

    .line 1709
    .line 1710
    invoke-virtual {v13, v14}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1711
    .line 1712
    .line 1713
    move-result-object v14

    .line 1714
    check-cast v14, Landroid/view/View;

    .line 1715
    .line 1716
    iget v15, v8, Lfp;->l:I

    .line 1717
    .line 1718
    invoke-virtual {v0, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 1719
    .line 1720
    .line 1721
    move-result-object v15

    .line 1722
    check-cast v15, Lpp;

    .line 1723
    .line 1724
    if-eqz v15, :cond_48

    .line 1725
    .line 1726
    if-eqz v14, :cond_48

    .line 1727
    .line 1728
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1729
    .line 1730
    .line 1731
    move-result-object v7

    .line 1732
    instance-of v7, v7, Lfp;

    .line 1733
    .line 1734
    if-eqz v7, :cond_48

    .line 1735
    .line 1736
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1737
    .line 1738
    .line 1739
    move-result-object v7

    .line 1740
    check-cast v7, Lfp;

    .line 1741
    .line 1742
    const/4 v14, 0x1

    .line 1743
    iput-boolean v14, v8, Lfp;->W:Z

    .line 1744
    .line 1745
    iput-boolean v14, v7, Lfp;->W:Z

    .line 1746
    .line 1747
    const/4 v5, 0x6

    .line 1748
    invoke-virtual {v10, v5}, Lpp;->e(I)Lbp;

    .line 1749
    .line 1750
    .line 1751
    move-result-object v12

    .line 1752
    invoke-virtual {v15, v5}, Lpp;->e(I)Lbp;

    .line 1753
    .line 1754
    .line 1755
    move-result-object v5

    .line 1756
    const/4 v9, -0x1

    .line 1757
    const/4 v15, 0x0

    .line 1758
    invoke-virtual {v12, v5, v15, v9}, Lbp;->a(Lbp;II)V

    .line 1759
    .line 1760
    .line 1761
    iput-boolean v14, v10, Lpp;->w:Z

    .line 1762
    .line 1763
    iget-object v5, v7, Lfp;->j0:Lpp;

    .line 1764
    .line 1765
    iput-boolean v14, v5, Lpp;->w:Z

    .line 1766
    .line 1767
    const/4 v9, 0x3

    .line 1768
    invoke-virtual {v10, v9}, Lpp;->e(I)Lbp;

    .line 1769
    .line 1770
    .line 1771
    move-result-object v5

    .line 1772
    invoke-virtual {v5}, Lbp;->e()V

    .line 1773
    .line 1774
    .line 1775
    const/4 v12, 0x5

    .line 1776
    invoke-virtual {v10, v12}, Lpp;->e(I)Lbp;

    .line 1777
    .line 1778
    .line 1779
    move-result-object v5

    .line 1780
    invoke-virtual {v5}, Lbp;->e()V

    .line 1781
    .line 1782
    .line 1783
    :cond_48
    cmpl-float v5, v4, v34

    .line 1784
    .line 1785
    if-ltz v5, :cond_49

    .line 1786
    .line 1787
    iput v4, v10, Lpp;->S:F

    .line 1788
    .line 1789
    :cond_49
    iget v4, v8, Lfp;->A:F

    .line 1790
    .line 1791
    cmpl-float v5, v4, v34

    .line 1792
    .line 1793
    if-ltz v5, :cond_4a

    .line 1794
    .line 1795
    iput v4, v10, Lpp;->T:F

    .line 1796
    .line 1797
    :cond_4a
    :goto_2e
    if-eqz v21, :cond_4c

    .line 1798
    .line 1799
    iget v4, v8, Lfp;->O:I

    .line 1800
    .line 1801
    const/4 v15, -0x1

    .line 1802
    if-ne v4, v15, :cond_4b

    .line 1803
    .line 1804
    iget v5, v8, Lfp;->P:I

    .line 1805
    .line 1806
    if-eq v5, v15, :cond_4c

    .line 1807
    .line 1808
    :cond_4b
    iget v5, v8, Lfp;->P:I

    .line 1809
    .line 1810
    iput v4, v10, Lpp;->N:I

    .line 1811
    .line 1812
    iput v5, v10, Lpp;->O:I

    .line 1813
    .line 1814
    :cond_4c
    iget-boolean v4, v8, Lfp;->U:Z

    .line 1815
    .line 1816
    if-nez v4, :cond_4f

    .line 1817
    .line 1818
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 1819
    .line 1820
    const/4 v15, -0x1

    .line 1821
    if-ne v4, v15, :cond_4e

    .line 1822
    .line 1823
    iget-boolean v4, v8, Lfp;->R:Z

    .line 1824
    .line 1825
    if-eqz v4, :cond_4d

    .line 1826
    .line 1827
    const/4 v4, 0x3

    .line 1828
    invoke-virtual {v10, v4}, Lpp;->t(I)V

    .line 1829
    .line 1830
    .line 1831
    :goto_2f
    const/4 v5, 0x2

    .line 1832
    goto :goto_30

    .line 1833
    :cond_4d
    const/4 v4, 0x3

    .line 1834
    const/4 v5, 0x4

    .line 1835
    invoke-virtual {v10, v5}, Lpp;->t(I)V

    .line 1836
    .line 1837
    .line 1838
    goto :goto_2f

    .line 1839
    :goto_30
    invoke-virtual {v10, v5}, Lpp;->e(I)Lbp;

    .line 1840
    .line 1841
    .line 1842
    move-result-object v5

    .line 1843
    iget v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 1844
    .line 1845
    iput v7, v5, Lbp;->e:I

    .line 1846
    .line 1847
    const/4 v7, 0x4

    .line 1848
    invoke-virtual {v10, v7}, Lpp;->e(I)Lbp;

    .line 1849
    .line 1850
    .line 1851
    move-result-object v5

    .line 1852
    iget v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 1853
    .line 1854
    iput v7, v5, Lbp;->e:I

    .line 1855
    .line 1856
    goto :goto_31

    .line 1857
    :cond_4e
    const/4 v4, 0x3

    .line 1858
    invoke-virtual {v10, v4}, Lpp;->t(I)V

    .line 1859
    .line 1860
    .line 1861
    const/4 v15, 0x0

    .line 1862
    invoke-virtual {v10, v15}, Lpp;->v(I)V

    .line 1863
    .line 1864
    .line 1865
    goto :goto_31

    .line 1866
    :cond_4f
    const/4 v14, 0x1

    .line 1867
    invoke-virtual {v10, v14}, Lpp;->t(I)V

    .line 1868
    .line 1869
    .line 1870
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 1871
    .line 1872
    invoke-virtual {v10, v4}, Lpp;->v(I)V

    .line 1873
    .line 1874
    .line 1875
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 1876
    .line 1877
    const/4 v5, -0x2

    .line 1878
    if-ne v4, v5, :cond_50

    .line 1879
    .line 1880
    move/from16 v4, v19

    .line 1881
    .line 1882
    invoke-virtual {v10, v4}, Lpp;->t(I)V

    .line 1883
    .line 1884
    .line 1885
    :cond_50
    :goto_31
    iget-boolean v4, v8, Lfp;->V:Z

    .line 1886
    .line 1887
    if-nez v4, :cond_53

    .line 1888
    .line 1889
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 1890
    .line 1891
    const/4 v15, -0x1

    .line 1892
    if-ne v4, v15, :cond_52

    .line 1893
    .line 1894
    iget-boolean v4, v8, Lfp;->S:Z

    .line 1895
    .line 1896
    if-eqz v4, :cond_51

    .line 1897
    .line 1898
    const/4 v4, 0x3

    .line 1899
    invoke-virtual {v10, v4}, Lpp;->u(I)V

    .line 1900
    .line 1901
    .line 1902
    :goto_32
    const/4 v9, 0x3

    .line 1903
    goto :goto_33

    .line 1904
    :cond_51
    const/4 v4, 0x3

    .line 1905
    const/4 v5, 0x4

    .line 1906
    invoke-virtual {v10, v5}, Lpp;->u(I)V

    .line 1907
    .line 1908
    .line 1909
    goto :goto_32

    .line 1910
    :goto_33
    invoke-virtual {v10, v9}, Lpp;->e(I)Lbp;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v5

    .line 1914
    iget v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1915
    .line 1916
    iput v7, v5, Lbp;->e:I

    .line 1917
    .line 1918
    const/4 v12, 0x5

    .line 1919
    invoke-virtual {v10, v12}, Lpp;->e(I)Lbp;

    .line 1920
    .line 1921
    .line 1922
    move-result-object v5

    .line 1923
    iget v7, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 1924
    .line 1925
    iput v7, v5, Lbp;->e:I

    .line 1926
    .line 1927
    :goto_34
    const/4 v5, -0x2

    .line 1928
    goto :goto_35

    .line 1929
    :cond_52
    const/4 v4, 0x3

    .line 1930
    invoke-virtual {v10, v4}, Lpp;->u(I)V

    .line 1931
    .line 1932
    .line 1933
    const/4 v12, 0x0

    .line 1934
    invoke-virtual {v10, v12}, Lpp;->s(I)V

    .line 1935
    .line 1936
    .line 1937
    goto :goto_34

    .line 1938
    :cond_53
    const/4 v14, 0x1

    .line 1939
    const/4 v15, -0x1

    .line 1940
    invoke-virtual {v10, v14}, Lpp;->u(I)V

    .line 1941
    .line 1942
    .line 1943
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 1944
    .line 1945
    invoke-virtual {v10, v4}, Lpp;->s(I)V

    .line 1946
    .line 1947
    .line 1948
    iget v4, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 1949
    .line 1950
    const/4 v5, -0x2

    .line 1951
    if-ne v4, v5, :cond_54

    .line 1952
    .line 1953
    const/4 v4, 0x2

    .line 1954
    invoke-virtual {v10, v4}, Lpp;->u(I)V

    .line 1955
    .line 1956
    .line 1957
    :cond_54
    :goto_35
    iget-object v4, v8, Lfp;->B:Ljava/lang/String;

    .line 1958
    .line 1959
    if-eqz v4, :cond_55

    .line 1960
    .line 1961
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 1962
    .line 1963
    .line 1964
    move-result v7

    .line 1965
    if-nez v7, :cond_56

    .line 1966
    .line 1967
    :cond_55
    move/from16 v4, v34

    .line 1968
    .line 1969
    goto/16 :goto_39

    .line 1970
    .line 1971
    :cond_56
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 1972
    .line 1973
    .line 1974
    move-result v7

    .line 1975
    const/16 v9, 0x2c

    .line 1976
    .line 1977
    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    .line 1978
    .line 1979
    .line 1980
    move-result v9

    .line 1981
    if-lez v9, :cond_59

    .line 1982
    .line 1983
    add-int/lit8 v12, v7, -0x1

    .line 1984
    .line 1985
    if-ge v9, v12, :cond_59

    .line 1986
    .line 1987
    const/4 v12, 0x0

    .line 1988
    invoke-virtual {v4, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 1989
    .line 1990
    .line 1991
    move-result-object v14

    .line 1992
    const-string v12, "W"

    .line 1993
    .line 1994
    invoke-virtual {v14, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 1995
    .line 1996
    .line 1997
    move-result v12

    .line 1998
    if-eqz v12, :cond_57

    .line 1999
    .line 2000
    const/4 v12, 0x0

    .line 2001
    goto :goto_36

    .line 2002
    :cond_57
    const-string v12, "H"

    .line 2003
    .line 2004
    invoke-virtual {v14, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 2005
    .line 2006
    .line 2007
    move-result v12

    .line 2008
    if-eqz v12, :cond_58

    .line 2009
    .line 2010
    const/4 v12, 0x1

    .line 2011
    goto :goto_36

    .line 2012
    :cond_58
    move v12, v15

    .line 2013
    :goto_36
    add-int/lit8 v9, v9, 0x1

    .line 2014
    .line 2015
    goto :goto_37

    .line 2016
    :cond_59
    move v12, v15

    .line 2017
    const/4 v9, 0x0

    .line 2018
    :goto_37
    const/16 v14, 0x3a

    .line 2019
    .line 2020
    invoke-virtual {v4, v14}, Ljava/lang/String;->indexOf(I)I

    .line 2021
    .line 2022
    .line 2023
    move-result v14

    .line 2024
    if-ltz v14, :cond_5b

    .line 2025
    .line 2026
    add-int/lit8 v7, v7, -0x1

    .line 2027
    .line 2028
    if-ge v14, v7, :cond_5b

    .line 2029
    .line 2030
    invoke-virtual {v4, v9, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 2031
    .line 2032
    .line 2033
    move-result-object v7

    .line 2034
    add-int/lit8 v14, v14, 0x1

    .line 2035
    .line 2036
    invoke-virtual {v4, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 2037
    .line 2038
    .line 2039
    move-result-object v4

    .line 2040
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 2041
    .line 2042
    .line 2043
    move-result v9

    .line 2044
    if-lez v9, :cond_5c

    .line 2045
    .line 2046
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 2047
    .line 2048
    .line 2049
    move-result v9

    .line 2050
    if-lez v9, :cond_5c

    .line 2051
    .line 2052
    :try_start_4
    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2053
    .line 2054
    .line 2055
    move-result v7

    .line 2056
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2057
    .line 2058
    .line 2059
    move-result v4

    .line 2060
    cmpl-float v9, v7, v34

    .line 2061
    .line 2062
    if-lez v9, :cond_5c

    .line 2063
    .line 2064
    cmpl-float v9, v4, v34

    .line 2065
    .line 2066
    if-lez v9, :cond_5c

    .line 2067
    .line 2068
    const/4 v14, 0x1

    .line 2069
    if-ne v12, v14, :cond_5a

    .line 2070
    .line 2071
    div-float/2addr v4, v7

    .line 2072
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 2073
    .line 2074
    .line 2075
    move-result v4

    .line 2076
    goto :goto_38

    .line 2077
    :cond_5a
    div-float/2addr v7, v4

    .line 2078
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 2079
    .line 2080
    .line 2081
    move-result v4
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_5

    .line 2082
    goto :goto_38

    .line 2083
    :cond_5b
    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 2084
    .line 2085
    .line 2086
    move-result-object v4

    .line 2087
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 2088
    .line 2089
    .line 2090
    move-result v7

    .line 2091
    if-lez v7, :cond_5c

    .line 2092
    .line 2093
    :try_start_5
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 2094
    .line 2095
    .line 2096
    move-result v4
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    .line 2097
    goto :goto_38

    .line 2098
    :catch_5
    :cond_5c
    move/from16 v4, v34

    .line 2099
    .line 2100
    :goto_38
    cmpl-float v7, v4, v34

    .line 2101
    .line 2102
    if-lez v7, :cond_5d

    .line 2103
    .line 2104
    iput v4, v10, Lpp;->L:F

    .line 2105
    .line 2106
    iput v12, v10, Lpp;->M:I

    .line 2107
    .line 2108
    goto :goto_3a

    .line 2109
    :goto_39
    iput v4, v10, Lpp;->L:F

    .line 2110
    .line 2111
    :cond_5d
    :goto_3a
    iget v4, v8, Lfp;->C:F

    .line 2112
    .line 2113
    iget-object v7, v10, Lpp;->Z:[F

    .line 2114
    .line 2115
    const/16 v16, 0x0

    .line 2116
    .line 2117
    aput v4, v7, v16

    .line 2118
    .line 2119
    iget v4, v8, Lfp;->D:F

    .line 2120
    .line 2121
    const/16 v17, 0x1

    .line 2122
    .line 2123
    aput v4, v7, v17

    .line 2124
    .line 2125
    iget v4, v8, Lfp;->E:I

    .line 2126
    .line 2127
    iput v4, v10, Lpp;->X:I

    .line 2128
    .line 2129
    iget v4, v8, Lfp;->F:I

    .line 2130
    .line 2131
    iput v4, v10, Lpp;->Y:I

    .line 2132
    .line 2133
    iget v4, v8, Lfp;->G:I

    .line 2134
    .line 2135
    iget v7, v8, Lfp;->I:I

    .line 2136
    .line 2137
    iget v9, v8, Lfp;->K:I

    .line 2138
    .line 2139
    iget v12, v8, Lfp;->M:F

    .line 2140
    .line 2141
    iput v4, v10, Lpp;->j:I

    .line 2142
    .line 2143
    iput v7, v10, Lpp;->m:I

    .line 2144
    .line 2145
    const v7, 0x7fffffff

    .line 2146
    .line 2147
    .line 2148
    if-ne v9, v7, :cond_5e

    .line 2149
    .line 2150
    const/4 v9, 0x0

    .line 2151
    :cond_5e
    iput v9, v10, Lpp;->n:I

    .line 2152
    .line 2153
    iput v12, v10, Lpp;->o:F

    .line 2154
    .line 2155
    const/16 v34, 0x0

    .line 2156
    .line 2157
    cmpl-float v9, v12, v34

    .line 2158
    .line 2159
    const/high16 v14, 0x3f800000    # 1.0f

    .line 2160
    .line 2161
    if-lez v9, :cond_5f

    .line 2162
    .line 2163
    cmpg-float v9, v12, v14

    .line 2164
    .line 2165
    if-gez v9, :cond_5f

    .line 2166
    .line 2167
    if-nez v4, :cond_5f

    .line 2168
    .line 2169
    const/4 v4, 0x2

    .line 2170
    iput v4, v10, Lpp;->j:I

    .line 2171
    .line 2172
    :cond_5f
    iget v4, v8, Lfp;->H:I

    .line 2173
    .line 2174
    iget v9, v8, Lfp;->J:I

    .line 2175
    .line 2176
    iget v12, v8, Lfp;->L:I

    .line 2177
    .line 2178
    iget v8, v8, Lfp;->N:F

    .line 2179
    .line 2180
    iput v4, v10, Lpp;->k:I

    .line 2181
    .line 2182
    iput v9, v10, Lpp;->p:I

    .line 2183
    .line 2184
    if-ne v12, v7, :cond_60

    .line 2185
    .line 2186
    const/4 v12, 0x0

    .line 2187
    :cond_60
    iput v12, v10, Lpp;->q:I

    .line 2188
    .line 2189
    iput v8, v10, Lpp;->r:F

    .line 2190
    .line 2191
    const/16 v34, 0x0

    .line 2192
    .line 2193
    cmpl-float v7, v8, v34

    .line 2194
    .line 2195
    if-lez v7, :cond_61

    .line 2196
    .line 2197
    cmpg-float v7, v8, v14

    .line 2198
    .line 2199
    if-gez v7, :cond_61

    .line 2200
    .line 2201
    if-nez v4, :cond_61

    .line 2202
    .line 2203
    const/4 v4, 0x2

    .line 2204
    iput v4, v10, Lpp;->k:I

    .line 2205
    .line 2206
    goto :goto_3b

    .line 2207
    :cond_61
    const/4 v4, 0x2

    .line 2208
    :goto_3b
    add-int/lit8 v7, v28, 0x1

    .line 2209
    .line 2210
    move/from16 v19, v4

    .line 2211
    .line 2212
    move v4, v7

    .line 2213
    goto/16 :goto_1e

    .line 2214
    .line 2215
    :cond_62
    move/from16 v18, v7

    .line 2216
    .line 2217
    :cond_63
    if-eqz v18, :cond_67

    .line 2218
    .line 2219
    iget-object v0, v6, Lqp;->e0:Lc9;

    .line 2220
    .line 2221
    iget-object v0, v0, Lc9;->k:Ljava/lang/Object;

    .line 2222
    .line 2223
    check-cast v0, Ljava/util/ArrayList;

    .line 2224
    .line 2225
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2226
    .line 2227
    .line 2228
    iget-object v4, v6, Lqp;->d0:Ljava/util/ArrayList;

    .line 2229
    .line 2230
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 2231
    .line 2232
    .line 2233
    move-result v4

    .line 2234
    const/4 v10, 0x0

    .line 2235
    :goto_3c
    if-ge v10, v4, :cond_66

    .line 2236
    .line 2237
    iget-object v5, v6, Lqp;->d0:Ljava/util/ArrayList;

    .line 2238
    .line 2239
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2240
    .line 2241
    .line 2242
    move-result-object v5

    .line 2243
    check-cast v5, Lpp;

    .line 2244
    .line 2245
    iget-object v7, v5, Lpp;->c0:[I

    .line 2246
    .line 2247
    const/16 v16, 0x0

    .line 2248
    .line 2249
    aget v8, v7, v16

    .line 2250
    .line 2251
    const/4 v9, 0x3

    .line 2252
    const/4 v11, 0x4

    .line 2253
    if-eq v8, v9, :cond_64

    .line 2254
    .line 2255
    if-eq v8, v11, :cond_64

    .line 2256
    .line 2257
    const/16 v17, 0x1

    .line 2258
    .line 2259
    aget v7, v7, v17

    .line 2260
    .line 2261
    if-eq v7, v9, :cond_64

    .line 2262
    .line 2263
    if-ne v7, v11, :cond_65

    .line 2264
    .line 2265
    :cond_64
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2266
    .line 2267
    .line 2268
    :cond_65
    add-int/lit8 v10, v10, 0x1

    .line 2269
    .line 2270
    goto :goto_3c

    .line 2271
    :cond_66
    iget-object v0, v6, Lqp;->f0:Lex;

    .line 2272
    .line 2273
    const/4 v14, 0x1

    .line 2274
    iput-boolean v14, v0, Lex;->b:Z

    .line 2275
    .line 2276
    :cond_67
    iget v0, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 2277
    .line 2278
    invoke-virtual {v1, v6, v0, v2, v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->d(Lqp;III)V

    .line 2279
    .line 2280
    .line 2281
    invoke-virtual {v6}, Lpp;->j()I

    .line 2282
    .line 2283
    .line 2284
    move-result v0

    .line 2285
    invoke-virtual {v6}, Lpp;->g()I

    .line 2286
    .line 2287
    .line 2288
    move-result v4

    .line 2289
    iget-boolean v5, v6, Lqp;->q0:Z

    .line 2290
    .line 2291
    iget-boolean v6, v6, Lqp;->r0:Z

    .line 2292
    .line 2293
    iget-object v7, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Lgp;

    .line 2294
    .line 2295
    iget v8, v7, Lgp;->e:I

    .line 2296
    .line 2297
    iget v7, v7, Lgp;->d:I

    .line 2298
    .line 2299
    add-int/2addr v0, v7

    .line 2300
    add-int/2addr v4, v8

    .line 2301
    const/4 v12, 0x0

    .line 2302
    invoke-static {v0, v2, v12}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 2303
    .line 2304
    .line 2305
    move-result v0

    .line 2306
    invoke-static {v4, v3, v12}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 2307
    .line 2308
    .line 2309
    move-result v2

    .line 2310
    const v3, 0xffffff

    .line 2311
    .line 2312
    .line 2313
    and-int/2addr v0, v3

    .line 2314
    and-int/2addr v2, v3

    .line 2315
    iget v3, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 2316
    .line 2317
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 2318
    .line 2319
    .line 2320
    move-result v0

    .line 2321
    iget v3, v1, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 2322
    .line 2323
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 2324
    .line 2325
    .line 2326
    move-result v2

    .line 2327
    const/high16 v3, 0x1000000

    .line 2328
    .line 2329
    if-eqz v5, :cond_68

    .line 2330
    .line 2331
    or-int/2addr v0, v3

    .line 2332
    :cond_68
    if-eqz v6, :cond_69

    .line 2333
    .line 2334
    or-int/2addr v2, v3

    .line 2335
    :cond_69
    invoke-virtual {v1, v0, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 2336
    .line 2337
    .line 2338
    return-void

    .line 2339
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onViewAdded(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, p1, Leb0;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    instance-of v0, v0, Lfb0;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lfp;

    .line 22
    .line 23
    new-instance v1, Lfb0;

    .line 24
    .line 25
    invoke-direct {v1}, Lfb0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, v0, Lfp;->j0:Lpp;

    .line 29
    .line 30
    iput-boolean v2, v0, Lfp;->X:Z

    .line 31
    .line 32
    iget v0, v0, Lfp;->Q:I

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lfb0;->y(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    instance-of v0, p1, Ldp;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    move-object v0, p1

    .line 42
    check-cast v0, Ldp;

    .line 43
    .line 44
    invoke-virtual {v0}, Ldp;->d()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lfp;

    .line 52
    .line 53
    iput-boolean v2, v1, Lfp;->Y:Z

    .line 54
    .line 55
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v3, :cond_1

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 76
    .line 77
    return-void
.end method

.method public final onViewRemoved(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lpp;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 18
    .line 19
    iget-object v1, v1, Lqp;->d0:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-object v1, v0, Lpp;->I:Lqp;

    .line 26
    .line 27
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 34
    .line 35
    return-void
.end method

.method public final requestLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setConstraintSet(Lop;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:Lop;

    .line 2
    .line 3
    return-void
.end method

.method public setId(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/view/View;->setId(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {v1, p1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setMaxHeight(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMaxWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMinHeight(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMinWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnConstraintsChanged(Lrp;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ls7;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:I

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:Lqp;

    .line 4
    .line 5
    iput p1, p0, Lqp;->p0:I

    .line 6
    .line 7
    const/16 p0, 0x100

    .line 8
    .line 9
    and-int/2addr p1, p0

    .line 10
    if-ne p1, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    sput-boolean p0, Lpi0;->p:Z

    .line 16
    .line 17
    return-void
.end method

.method public final shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
