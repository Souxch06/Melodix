.class public Landroidx/recyclerview/widget/StaggeredGridLayoutManager;
.super Lpy0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final A:Lxn0;

.field public final B:I

.field public C:Z

.field public D:Z

.field public E:Lk91;

.field public final F:Landroid/graphics/Rect;

.field public final G:Lh91;

.field public final H:Z

.field public I:[I

.field public final J:Lg91;

.field public final o:I

.field public final p:[Ll91;

.field public final q:Lvz;

.field public final r:Lvz;

.field public final s:I

.field public t:I

.field public final u:Ljh0;

.field public v:Z

.field public w:Z

.field public final x:Ljava/util/BitSet;

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lpy0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 11
    .line 12
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 13
    .line 14
    const/high16 v2, -0x80000000

    .line 15
    .line 16
    iput v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 17
    .line 18
    new-instance v2, Lxn0;

    .line 19
    .line 20
    const/16 v3, 0xe

    .line 21
    .line 22
    invoke-direct {v2, v3, v1}, Lxn0;-><init>(IZ)V

    .line 23
    .line 24
    .line 25
    iput-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    iput v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:I

    .line 29
    .line 30
    new-instance v3, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:Landroid/graphics/Rect;

    .line 36
    .line 37
    new-instance v3, Lh91;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Lh91;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;)V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Lh91;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    iput-boolean v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 46
    .line 47
    new-instance v4, Lg91;

    .line 48
    .line 49
    invoke-direct {v4, p0}, Lg91;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;)V

    .line 50
    .line 51
    .line 52
    iput-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:Lg91;

    .line 53
    .line 54
    invoke-static {p1, p2, p3, p4}, Lpy0;->E(Landroid/content/Context;Landroid/util/AttributeSet;II)Loy0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget p2, p1, Loy0;->a:I

    .line 59
    .line 60
    const/4 p3, 0x0

    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    if-ne p2, v3, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const-string p0, "invalid orientation."

    .line 67
    .line 68
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p3

    .line 72
    :cond_1
    :goto_0
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 76
    .line 77
    if-ne p2, p4, :cond_2

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iput p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 81
    .line 82
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 83
    .line 84
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r:Lvz;

    .line 85
    .line 86
    iput-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 87
    .line 88
    iput-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r:Lvz;

    .line 89
    .line 90
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget p2, p1, Loy0;->b:I

    .line 94
    .line 95
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 99
    .line 100
    if-eq p2, p4, :cond_5

    .line 101
    .line 102
    iget-object p4, v2, Lxn0;->k:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast p4, [I

    .line 105
    .line 106
    if-eqz p4, :cond_3

    .line 107
    .line 108
    invoke-static {p4, v0}, Ljava/util/Arrays;->fill([II)V

    .line 109
    .line 110
    .line 111
    :cond_3
    iput-object p3, v2, Lxn0;->l:Ljava/lang/Object;

    .line 112
    .line 113
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 114
    .line 115
    .line 116
    iput p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 117
    .line 118
    new-instance p2, Ljava/util/BitSet;

    .line 119
    .line 120
    iget p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 121
    .line 122
    invoke-direct {p2, p4}, Ljava/util/BitSet;-><init>(I)V

    .line 123
    .line 124
    .line 125
    iput-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:Ljava/util/BitSet;

    .line 126
    .line 127
    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 128
    .line 129
    new-array p2, p2, [Ll91;

    .line 130
    .line 131
    iput-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 132
    .line 133
    move p2, v1

    .line 134
    :goto_2
    iget p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 135
    .line 136
    if-ge p2, p4, :cond_4

    .line 137
    .line 138
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 139
    .line 140
    new-instance v0, Ll91;

    .line 141
    .line 142
    invoke-direct {v0, p0, p2}, Ll91;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;I)V

    .line 143
    .line 144
    .line 145
    aput-object v0, p4, p2

    .line 146
    .line 147
    add-int/lit8 p2, p2, 0x1

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_4
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 151
    .line 152
    .line 153
    :cond_5
    iget-boolean p1, p1, Loy0;->c:Z

    .line 154
    .line 155
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 159
    .line 160
    if-eqz p2, :cond_6

    .line 161
    .line 162
    iget-boolean p3, p2, Lk91;->q:Z

    .line 163
    .line 164
    if-eq p3, p1, :cond_6

    .line 165
    .line 166
    iput-boolean p1, p2, Lk91;->q:Z

    .line 167
    .line 168
    :cond_6
    iput-boolean p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 169
    .line 170
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 171
    .line 172
    .line 173
    new-instance p1, Ljh0;

    .line 174
    .line 175
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 176
    .line 177
    .line 178
    iput-boolean v3, p1, Ljh0;->a:Z

    .line 179
    .line 180
    iput v1, p1, Ljh0;->f:I

    .line 181
    .line 182
    iput v1, p1, Ljh0;->g:I

    .line 183
    .line 184
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 185
    .line 186
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 187
    .line 188
    invoke-static {p0, p1}, Lvz;->a(Lpy0;I)Lvz;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 193
    .line 194
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 195
    .line 196
    sub-int/2addr v3, p1

    .line 197
    invoke-static {p0, v3}, Lvz;->a(Lpy0;I)Lvz;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r:Lvz;

    .line 202
    .line 203
    return-void
.end method

.method public static S0(III)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    return p0

    .line 20
    :cond_2
    :goto_1
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sub-int/2addr p0, p1

    .line 25
    sub-int/2addr p0, p2

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {p0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method


# virtual methods
.method public final A0()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lpy0;->t(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lpy0;->D(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final B0(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll91;->f(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    :goto_0
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 12
    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 16
    .line 17
    aget-object v2, v2, v1

    .line 18
    .line 19
    invoke-virtual {v2, p1}, Ll91;->f(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-le v2, v0, :cond_0

    .line 24
    .line 25
    move v0, v2

    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public final C0(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll91;->h(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    :goto_0
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 12
    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 16
    .line 17
    aget-object v2, v2, v1

    .line 18
    .line 19
    invoke-virtual {v2, p1}, Ll91;->h(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ge v2, v0, :cond_0

    .line 24
    .line 25
    move v0, v2

    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public final D0(III)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    const/16 v1, 0x8

    .line 15
    .line 16
    if-ne p3, v1, :cond_2

    .line 17
    .line 18
    if-ge p1, p2, :cond_1

    .line 19
    .line 20
    add-int/lit8 v2, p2, 0x1

    .line 21
    .line 22
    :goto_1
    move v3, p1

    .line 23
    goto :goto_2

    .line 24
    :cond_1
    add-int/lit8 v2, p1, 0x1

    .line 25
    .line 26
    move v3, p2

    .line 27
    goto :goto_2

    .line 28
    :cond_2
    add-int v2, p1, p2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :goto_2
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 32
    .line 33
    iget-object v5, v4, Lxn0;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v5, [I

    .line 36
    .line 37
    const/4 v6, 0x1

    .line 38
    if-nez v5, :cond_3

    .line 39
    .line 40
    goto/16 :goto_8

    .line 41
    .line 42
    :cond_3
    array-length v5, v5

    .line 43
    if-lt v3, v5, :cond_4

    .line 44
    .line 45
    goto/16 :goto_8

    .line 46
    .line 47
    :cond_4
    iget-object v5, v4, Lxn0;->l:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v5, Ljava/util/ArrayList;

    .line 50
    .line 51
    const/4 v7, -0x1

    .line 52
    if-nez v5, :cond_6

    .line 53
    .line 54
    :cond_5
    move v5, v7

    .line 55
    goto :goto_7

    .line 56
    :cond_6
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    sub-int/2addr v5, v6

    .line 61
    :goto_3
    if-ltz v5, :cond_8

    .line 62
    .line 63
    iget-object v8, v4, Lxn0;->l:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v8, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    check-cast v8, Lj91;

    .line 72
    .line 73
    iget v9, v8, Lj91;->j:I

    .line 74
    .line 75
    if-ne v9, v3, :cond_7

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_7
    add-int/lit8 v5, v5, -0x1

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_8
    const/4 v8, 0x0

    .line 82
    :goto_4
    if-eqz v8, :cond_9

    .line 83
    .line 84
    iget-object v5, v4, Lxn0;->l:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v5, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-interface {v5, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    :cond_9
    iget-object v5, v4, Lxn0;->l:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v5, Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    const/4 v8, 0x0

    .line 100
    :goto_5
    if-ge v8, v5, :cond_b

    .line 101
    .line 102
    iget-object v9, v4, Lxn0;->l:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v9, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v9

    .line 110
    check-cast v9, Lj91;

    .line 111
    .line 112
    iget v9, v9, Lj91;->j:I

    .line 113
    .line 114
    if-lt v9, v3, :cond_a

    .line 115
    .line 116
    goto :goto_6

    .line 117
    :cond_a
    add-int/lit8 v8, v8, 0x1

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :cond_b
    move v8, v7

    .line 121
    :goto_6
    if-eq v8, v7, :cond_5

    .line 122
    .line 123
    iget-object v5, v4, Lxn0;->l:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v5, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    check-cast v5, Lj91;

    .line 132
    .line 133
    iget-object v9, v4, Lxn0;->l:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v9, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-interface {v9, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    iget v5, v5, Lj91;->j:I

    .line 141
    .line 142
    :goto_7
    iget-object v8, v4, Lxn0;->k:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v8, [I

    .line 145
    .line 146
    if-ne v5, v7, :cond_c

    .line 147
    .line 148
    array-length v5, v8

    .line 149
    invoke-static {v8, v3, v5, v7}, Ljava/util/Arrays;->fill([IIII)V

    .line 150
    .line 151
    .line 152
    iget-object v5, v4, Lxn0;->k:Ljava/lang/Object;

    .line 153
    .line 154
    check-cast v5, [I

    .line 155
    .line 156
    array-length v5, v5

    .line 157
    goto :goto_8

    .line 158
    :cond_c
    add-int/2addr v5, v6

    .line 159
    invoke-static {v8, v3, v5, v7}, Ljava/util/Arrays;->fill([IIII)V

    .line 160
    .line 161
    .line 162
    :goto_8
    if-eq p3, v6, :cond_f

    .line 163
    .line 164
    const/4 v5, 0x2

    .line 165
    if-eq p3, v5, :cond_e

    .line 166
    .line 167
    if-eq p3, v1, :cond_d

    .line 168
    .line 169
    goto :goto_9

    .line 170
    :cond_d
    invoke-virtual {v4, p1, v6}, Lxn0;->s(II)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4, p2, v6}, Lxn0;->r(II)V

    .line 174
    .line 175
    .line 176
    goto :goto_9

    .line 177
    :cond_e
    invoke-virtual {v4, p1, p2}, Lxn0;->s(II)V

    .line 178
    .line 179
    .line 180
    goto :goto_9

    .line 181
    :cond_f
    invoke-virtual {v4, p1, p2}, Lxn0;->r(II)V

    .line 182
    .line 183
    .line 184
    :goto_9
    if-gt v2, v0, :cond_10

    .line 185
    .line 186
    goto :goto_b

    .line 187
    :cond_10
    iget-boolean p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 188
    .line 189
    if-eqz p1, :cond_11

    .line 190
    .line 191
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    goto :goto_a

    .line 196
    :cond_11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    :goto_a
    if-gt v3, p1, :cond_12

    .line 201
    .line 202
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 203
    .line 204
    .line 205
    :cond_12
    :goto_b
    return-void
.end method

.method public final E0()Landroid/view/View;
    .locals 15

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, v0, -0x1

    .line 6
    .line 7
    new-instance v2, Ljava/util/BitSet;

    .line 8
    .line 9
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/util/BitSet;-><init>(I)V

    .line 12
    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x1

    .line 16
    invoke-virtual {v2, v4, v3, v5}, Ljava/util/BitSet;->set(IIZ)V

    .line 17
    .line 18
    .line 19
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 20
    .line 21
    const/4 v6, -0x1

    .line 22
    if-ne v3, v5, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    move v3, v5

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v3, v6

    .line 33
    :goto_0
    iget-boolean v7, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 34
    .line 35
    if-eqz v7, :cond_1

    .line 36
    .line 37
    move v0, v6

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v1, v4

    .line 40
    :goto_1
    if-ge v1, v0, :cond_2

    .line 41
    .line 42
    move v6, v5

    .line 43
    :cond_2
    if-eq v1, v0, :cond_d

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Lpy0;->t(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    check-cast v8, Li91;

    .line 54
    .line 55
    iget-object v9, v8, Li91;->e:Ll91;

    .line 56
    .line 57
    iget v9, v9, Ll91;->e:I

    .line 58
    .line 59
    invoke-virtual {v2, v9}, Ljava/util/BitSet;->get(I)Z

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    iget-object v10, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 64
    .line 65
    if-eqz v9, :cond_7

    .line 66
    .line 67
    iget-object v9, v8, Li91;->e:Ll91;

    .line 68
    .line 69
    iget-boolean v11, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 70
    .line 71
    const/high16 v12, -0x80000000

    .line 72
    .line 73
    if-eqz v11, :cond_4

    .line 74
    .line 75
    iget v11, v9, Ll91;->c:I

    .line 76
    .line 77
    if-eq v11, v12, :cond_3

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    invoke-virtual {v9}, Ll91;->a()V

    .line 81
    .line 82
    .line 83
    iget v11, v9, Ll91;->c:I

    .line 84
    .line 85
    :goto_2
    invoke-virtual {v10}, Lvz;->g()I

    .line 86
    .line 87
    .line 88
    move-result v12

    .line 89
    if-ge v11, v12, :cond_6

    .line 90
    .line 91
    iget-object p0, v9, Ll91;->a:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    sub-int/2addr v0, v5

    .line 98
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Li91;

    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    return-object v7

    .line 114
    :cond_4
    iget v11, v9, Ll91;->b:I

    .line 115
    .line 116
    iget-object v13, v9, Ll91;->a:Ljava/util/ArrayList;

    .line 117
    .line 118
    if-eq v11, v12, :cond_5

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_5
    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v11

    .line 125
    check-cast v11, Landroid/view/View;

    .line 126
    .line 127
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object v12

    .line 131
    check-cast v12, Li91;

    .line 132
    .line 133
    iget-object v14, v9, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 134
    .line 135
    iget-object v14, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 136
    .line 137
    invoke-virtual {v14, v11}, Lvz;->e(Landroid/view/View;)I

    .line 138
    .line 139
    .line 140
    move-result v11

    .line 141
    iput v11, v9, Ll91;->b:I

    .line 142
    .line 143
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    iget v11, v9, Ll91;->b:I

    .line 147
    .line 148
    :goto_3
    invoke-virtual {v10}, Lvz;->k()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    if-le v11, v9, :cond_6

    .line 153
    .line 154
    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Landroid/view/View;

    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    check-cast p0, Li91;

    .line 165
    .line 166
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    return-object v7

    .line 170
    :cond_6
    iget-object v9, v8, Li91;->e:Ll91;

    .line 171
    .line 172
    iget v9, v9, Ll91;->e:I

    .line 173
    .line 174
    invoke-virtual {v2, v9}, Ljava/util/BitSet;->clear(I)V

    .line 175
    .line 176
    .line 177
    :cond_7
    add-int/2addr v1, v6

    .line 178
    if-eq v1, v0, :cond_2

    .line 179
    .line 180
    invoke-virtual {p0, v1}, Lpy0;->t(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v9

    .line 184
    iget-boolean v11, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 185
    .line 186
    if-eqz v11, :cond_9

    .line 187
    .line 188
    invoke-virtual {v10, v7}, Lvz;->b(Landroid/view/View;)I

    .line 189
    .line 190
    .line 191
    move-result v11

    .line 192
    invoke-virtual {v10, v9}, Lvz;->b(Landroid/view/View;)I

    .line 193
    .line 194
    .line 195
    move-result v10

    .line 196
    if-ge v11, v10, :cond_8

    .line 197
    .line 198
    goto :goto_7

    .line 199
    :cond_8
    if-ne v11, v10, :cond_2

    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_9
    invoke-virtual {v10, v7}, Lvz;->e(Landroid/view/View;)I

    .line 203
    .line 204
    .line 205
    move-result v11

    .line 206
    invoke-virtual {v10, v9}, Lvz;->e(Landroid/view/View;)I

    .line 207
    .line 208
    .line 209
    move-result v10

    .line 210
    if-le v11, v10, :cond_a

    .line 211
    .line 212
    goto :goto_7

    .line 213
    :cond_a
    if-ne v11, v10, :cond_2

    .line 214
    .line 215
    :goto_4
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 216
    .line 217
    .line 218
    move-result-object v9

    .line 219
    check-cast v9, Li91;

    .line 220
    .line 221
    iget-object v8, v8, Li91;->e:Ll91;

    .line 222
    .line 223
    iget v8, v8, Ll91;->e:I

    .line 224
    .line 225
    iget-object v9, v9, Li91;->e:Ll91;

    .line 226
    .line 227
    iget v9, v9, Ll91;->e:I

    .line 228
    .line 229
    sub-int/2addr v8, v9

    .line 230
    if-gez v8, :cond_b

    .line 231
    .line 232
    move v8, v5

    .line 233
    goto :goto_5

    .line 234
    :cond_b
    move v8, v4

    .line 235
    :goto_5
    if-gez v3, :cond_c

    .line 236
    .line 237
    move v9, v5

    .line 238
    goto :goto_6

    .line 239
    :cond_c
    move v9, v4

    .line 240
    :goto_6
    if-eq v8, v9, :cond_2

    .line 241
    .line 242
    :goto_7
    return-object v7

    .line 243
    :cond_d
    const/4 p0, 0x0

    .line 244
    return-object p0
.end method

.method public final F(Lvy0;Lzy0;)I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-super {p0, p1, p2}, Lpy0;->F(Lvy0;Lzy0;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final F0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lpy0;->y()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final G0(Landroid/view/View;II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:Landroid/graphics/Rect;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->H(Landroid/view/View;)Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Li91;

    .line 24
    .line 25
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 26
    .line 27
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    add-int/2addr v2, v3

    .line 30
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 31
    .line 32
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 33
    .line 34
    add-int/2addr v3, v4

    .line 35
    invoke-static {p2, v2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->S0(III)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 40
    .line 41
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 42
    .line 43
    add-int/2addr v2, v3

    .line 44
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 45
    .line 46
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    add-int/2addr v3, v1

    .line 49
    invoke-static {p3, v2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->S0(III)I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    invoke-virtual {p0, p1, p2, p3, v0}, Lpy0;->o0(Landroid/view/View;IILqy0;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final H()Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final H0(Lvy0;Lzy0;Z)V
    .locals 17

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
    iget-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 8
    .line 9
    const/4 v4, -0x1

    .line 10
    iget-object v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Lh91;

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    iget v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 15
    .line 16
    if-eq v3, v4, :cond_1

    .line 17
    .line 18
    :cond_0
    invoke-virtual {v2}, Lzy0;->b()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    invoke-virtual/range {p0 .. p1}, Lpy0;->b0(Lvy0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v5}, Lh91;->a()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-boolean v3, v5, Lh91;->e:Z

    .line 32
    .line 33
    iget-object v6, v5, Lh91;->g:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 34
    .line 35
    const/4 v7, 0x0

    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    iget v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 39
    .line 40
    if-ne v3, v4, :cond_3

    .line 41
    .line 42
    iget-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 43
    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v3, v7

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    :goto_0
    const/4 v3, 0x1

    .line 50
    :goto_1
    iget-object v9, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 51
    .line 52
    iget v10, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 53
    .line 54
    const/4 v11, 0x0

    .line 55
    iget-object v12, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 56
    .line 57
    const/high16 v13, -0x80000000

    .line 58
    .line 59
    if-eqz v3, :cond_25

    .line 60
    .line 61
    invoke-virtual {v5}, Lh91;->a()V

    .line 62
    .line 63
    .line 64
    iget-object v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 65
    .line 66
    iget-object v15, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 67
    .line 68
    if-eqz v14, :cond_a

    .line 69
    .line 70
    iget v8, v14, Lk91;->l:I

    .line 71
    .line 72
    if-lez v8, :cond_7

    .line 73
    .line 74
    if-ne v8, v10, :cond_6

    .line 75
    .line 76
    move v8, v7

    .line 77
    :goto_2
    if-ge v8, v10, :cond_7

    .line 78
    .line 79
    aget-object v14, v9, v8

    .line 80
    .line 81
    invoke-virtual {v14}, Ll91;->b()V

    .line 82
    .line 83
    .line 84
    iget-object v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 85
    .line 86
    iget-object v4, v14, Lk91;->m:[I

    .line 87
    .line 88
    aget v4, v4, v8

    .line 89
    .line 90
    if-eq v4, v13, :cond_5

    .line 91
    .line 92
    iget-boolean v14, v14, Lk91;->r:Z

    .line 93
    .line 94
    if-eqz v14, :cond_4

    .line 95
    .line 96
    invoke-virtual {v15}, Lvz;->g()I

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    :goto_3
    add-int/2addr v4, v14

    .line 101
    goto :goto_4

    .line 102
    :cond_4
    invoke-virtual {v15}, Lvz;->k()I

    .line 103
    .line 104
    .line 105
    move-result v14

    .line 106
    goto :goto_3

    .line 107
    :cond_5
    :goto_4
    aget-object v14, v9, v8

    .line 108
    .line 109
    iput v4, v14, Ll91;->b:I

    .line 110
    .line 111
    iput v4, v14, Ll91;->c:I

    .line 112
    .line 113
    add-int/lit8 v8, v8, 0x1

    .line 114
    .line 115
    const/4 v4, -0x1

    .line 116
    goto :goto_2

    .line 117
    :cond_6
    iput-object v11, v14, Lk91;->m:[I

    .line 118
    .line 119
    iput v7, v14, Lk91;->l:I

    .line 120
    .line 121
    iput v7, v14, Lk91;->n:I

    .line 122
    .line 123
    iput-object v11, v14, Lk91;->o:[I

    .line 124
    .line 125
    iput-object v11, v14, Lk91;->p:Ljava/util/ArrayList;

    .line 126
    .line 127
    iget v4, v14, Lk91;->k:I

    .line 128
    .line 129
    iput v4, v14, Lk91;->j:I

    .line 130
    .line 131
    :cond_7
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 132
    .line 133
    iget-boolean v8, v4, Lk91;->s:Z

    .line 134
    .line 135
    iput-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:Z

    .line 136
    .line 137
    iget-boolean v4, v4, Lk91;->q:Z

    .line 138
    .line 139
    invoke-virtual {v0, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 143
    .line 144
    if-eqz v8, :cond_8

    .line 145
    .line 146
    iget-boolean v14, v8, Lk91;->q:Z

    .line 147
    .line 148
    if-eq v14, v4, :cond_8

    .line 149
    .line 150
    iput-boolean v4, v8, Lk91;->q:Z

    .line 151
    .line 152
    :cond_8
    iput-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 153
    .line 154
    invoke-virtual {v0}, Lpy0;->g0()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N0()V

    .line 158
    .line 159
    .line 160
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 161
    .line 162
    iget v8, v4, Lk91;->j:I

    .line 163
    .line 164
    const/4 v14, -0x1

    .line 165
    if-eq v8, v14, :cond_9

    .line 166
    .line 167
    iput v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 168
    .line 169
    iget-boolean v8, v4, Lk91;->r:Z

    .line 170
    .line 171
    iput-boolean v8, v5, Lh91;->c:Z

    .line 172
    .line 173
    goto :goto_5

    .line 174
    :cond_9
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 175
    .line 176
    iput-boolean v8, v5, Lh91;->c:Z

    .line 177
    .line 178
    :goto_5
    iget v8, v4, Lk91;->n:I

    .line 179
    .line 180
    const/4 v14, 0x1

    .line 181
    if-le v8, v14, :cond_b

    .line 182
    .line 183
    iget-object v8, v4, Lk91;->o:[I

    .line 184
    .line 185
    iput-object v8, v12, Lxn0;->k:Ljava/lang/Object;

    .line 186
    .line 187
    iget-object v4, v4, Lk91;->p:Ljava/util/ArrayList;

    .line 188
    .line 189
    iput-object v4, v12, Lxn0;->l:Ljava/lang/Object;

    .line 190
    .line 191
    goto :goto_6

    .line 192
    :cond_a
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N0()V

    .line 193
    .line 194
    .line 195
    iget-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 196
    .line 197
    iput-boolean v4, v5, Lh91;->c:Z

    .line 198
    .line 199
    :cond_b
    :goto_6
    iget-boolean v4, v2, Lzy0;->f:Z

    .line 200
    .line 201
    if-nez v4, :cond_20

    .line 202
    .line 203
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 204
    .line 205
    const/4 v14, -0x1

    .line 206
    if-ne v4, v14, :cond_c

    .line 207
    .line 208
    goto/16 :goto_12

    .line 209
    .line 210
    :cond_c
    if-ltz v4, :cond_1f

    .line 211
    .line 212
    invoke-virtual {v2}, Lzy0;->b()I

    .line 213
    .line 214
    .line 215
    move-result v8

    .line 216
    if-lt v4, v8, :cond_d

    .line 217
    .line 218
    goto/16 :goto_11

    .line 219
    .line 220
    :cond_d
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 221
    .line 222
    if-eqz v4, :cond_f

    .line 223
    .line 224
    iget v8, v4, Lk91;->j:I

    .line 225
    .line 226
    if-eq v8, v14, :cond_f

    .line 227
    .line 228
    iget v4, v4, Lk91;->l:I

    .line 229
    .line 230
    const/4 v14, 0x1

    .line 231
    if-ge v4, v14, :cond_e

    .line 232
    .line 233
    goto :goto_8

    .line 234
    :cond_e
    iput v13, v5, Lh91;->b:I

    .line 235
    .line 236
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 237
    .line 238
    iput v4, v5, Lh91;->a:I

    .line 239
    .line 240
    :goto_7
    const/4 v14, 0x1

    .line 241
    goto/16 :goto_16

    .line 242
    .line 243
    :cond_f
    :goto_8
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 244
    .line 245
    invoke-virtual {v0, v4}, Lpy0;->p(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v4

    .line 249
    if-eqz v4, :cond_17

    .line 250
    .line 251
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 252
    .line 253
    if-eqz v8, :cond_10

    .line 254
    .line 255
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    goto :goto_9

    .line 260
    :cond_10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 261
    .line 262
    .line 263
    move-result v8

    .line 264
    :goto_9
    iput v8, v5, Lh91;->a:I

    .line 265
    .line 266
    iget v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 267
    .line 268
    if-eq v8, v13, :cond_12

    .line 269
    .line 270
    iget-boolean v8, v5, Lh91;->c:Z

    .line 271
    .line 272
    if-eqz v8, :cond_11

    .line 273
    .line 274
    invoke-virtual {v15}, Lvz;->g()I

    .line 275
    .line 276
    .line 277
    move-result v8

    .line 278
    iget v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 279
    .line 280
    sub-int/2addr v8, v14

    .line 281
    invoke-virtual {v15, v4}, Lvz;->b(Landroid/view/View;)I

    .line 282
    .line 283
    .line 284
    move-result v4

    .line 285
    sub-int/2addr v8, v4

    .line 286
    iput v8, v5, Lh91;->b:I

    .line 287
    .line 288
    goto :goto_7

    .line 289
    :cond_11
    invoke-virtual {v15}, Lvz;->k()I

    .line 290
    .line 291
    .line 292
    move-result v8

    .line 293
    iget v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 294
    .line 295
    add-int/2addr v8, v14

    .line 296
    invoke-virtual {v15, v4}, Lvz;->e(Landroid/view/View;)I

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    sub-int/2addr v8, v4

    .line 301
    iput v8, v5, Lh91;->b:I

    .line 302
    .line 303
    goto :goto_7

    .line 304
    :cond_12
    invoke-virtual {v15, v4}, Lvz;->c(Landroid/view/View;)I

    .line 305
    .line 306
    .line 307
    move-result v8

    .line 308
    invoke-virtual {v15}, Lvz;->l()I

    .line 309
    .line 310
    .line 311
    move-result v14

    .line 312
    if-le v8, v14, :cond_14

    .line 313
    .line 314
    iget-boolean v4, v5, Lh91;->c:Z

    .line 315
    .line 316
    if-eqz v4, :cond_13

    .line 317
    .line 318
    invoke-virtual {v15}, Lvz;->g()I

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    goto :goto_a

    .line 323
    :cond_13
    invoke-virtual {v15}, Lvz;->k()I

    .line 324
    .line 325
    .line 326
    move-result v4

    .line 327
    :goto_a
    iput v4, v5, Lh91;->b:I

    .line 328
    .line 329
    goto :goto_7

    .line 330
    :cond_14
    invoke-virtual {v15, v4}, Lvz;->e(Landroid/view/View;)I

    .line 331
    .line 332
    .line 333
    move-result v8

    .line 334
    invoke-virtual {v15}, Lvz;->k()I

    .line 335
    .line 336
    .line 337
    move-result v14

    .line 338
    sub-int/2addr v8, v14

    .line 339
    if-gez v8, :cond_15

    .line 340
    .line 341
    neg-int v4, v8

    .line 342
    iput v4, v5, Lh91;->b:I

    .line 343
    .line 344
    goto :goto_7

    .line 345
    :cond_15
    invoke-virtual {v15}, Lvz;->g()I

    .line 346
    .line 347
    .line 348
    move-result v8

    .line 349
    invoke-virtual {v15, v4}, Lvz;->b(Landroid/view/View;)I

    .line 350
    .line 351
    .line 352
    move-result v4

    .line 353
    sub-int/2addr v8, v4

    .line 354
    if-gez v8, :cond_16

    .line 355
    .line 356
    iput v8, v5, Lh91;->b:I

    .line 357
    .line 358
    goto :goto_7

    .line 359
    :cond_16
    iput v13, v5, Lh91;->b:I

    .line 360
    .line 361
    goto :goto_7

    .line 362
    :cond_17
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 363
    .line 364
    iput v4, v5, Lh91;->a:I

    .line 365
    .line 366
    iget v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 367
    .line 368
    if-ne v8, v13, :cond_1d

    .line 369
    .line 370
    invoke-virtual {v0}, Lpy0;->u()I

    .line 371
    .line 372
    .line 373
    move-result v8

    .line 374
    if-nez v8, :cond_18

    .line 375
    .line 376
    iget-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 377
    .line 378
    if-eqz v4, :cond_1a

    .line 379
    .line 380
    goto :goto_c

    .line 381
    :cond_18
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 382
    .line 383
    .line 384
    move-result v8

    .line 385
    if-ge v4, v8, :cond_19

    .line 386
    .line 387
    const/4 v4, 0x1

    .line 388
    goto :goto_b

    .line 389
    :cond_19
    move v4, v7

    .line 390
    :goto_b
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 391
    .line 392
    if-eq v4, v8, :cond_1b

    .line 393
    .line 394
    :cond_1a
    move v4, v7

    .line 395
    goto :goto_d

    .line 396
    :cond_1b
    :goto_c
    const/4 v4, 0x1

    .line 397
    :goto_d
    iput-boolean v4, v5, Lh91;->c:Z

    .line 398
    .line 399
    iget-object v8, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 400
    .line 401
    if-eqz v4, :cond_1c

    .line 402
    .line 403
    invoke-virtual {v8}, Lvz;->g()I

    .line 404
    .line 405
    .line 406
    move-result v4

    .line 407
    goto :goto_e

    .line 408
    :cond_1c
    invoke-virtual {v8}, Lvz;->k()I

    .line 409
    .line 410
    .line 411
    move-result v4

    .line 412
    :goto_e
    iput v4, v5, Lh91;->b:I

    .line 413
    .line 414
    :goto_f
    const/4 v14, 0x1

    .line 415
    goto :goto_10

    .line 416
    :cond_1d
    iget-boolean v4, v5, Lh91;->c:Z

    .line 417
    .line 418
    iget-object v14, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 419
    .line 420
    if-eqz v4, :cond_1e

    .line 421
    .line 422
    invoke-virtual {v14}, Lvz;->g()I

    .line 423
    .line 424
    .line 425
    move-result v4

    .line 426
    sub-int/2addr v4, v8

    .line 427
    iput v4, v5, Lh91;->b:I

    .line 428
    .line 429
    goto :goto_f

    .line 430
    :cond_1e
    invoke-virtual {v14}, Lvz;->k()I

    .line 431
    .line 432
    .line 433
    move-result v4

    .line 434
    add-int/2addr v4, v8

    .line 435
    iput v4, v5, Lh91;->b:I

    .line 436
    .line 437
    goto :goto_f

    .line 438
    :goto_10
    iput-boolean v14, v5, Lh91;->d:Z

    .line 439
    .line 440
    goto :goto_16

    .line 441
    :cond_1f
    :goto_11
    iput v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 442
    .line 443
    iput v13, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 444
    .line 445
    :cond_20
    :goto_12
    iget-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 446
    .line 447
    if-eqz v4, :cond_23

    .line 448
    .line 449
    invoke-virtual {v2}, Lzy0;->b()I

    .line 450
    .line 451
    .line 452
    move-result v4

    .line 453
    invoke-virtual {v0}, Lpy0;->u()I

    .line 454
    .line 455
    .line 456
    move-result v8

    .line 457
    const/16 v16, 0x1

    .line 458
    .line 459
    add-int/lit8 v8, v8, -0x1

    .line 460
    .line 461
    :goto_13
    if-ltz v8, :cond_22

    .line 462
    .line 463
    invoke-virtual {v0, v8}, Lpy0;->t(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v14

    .line 467
    invoke-static {v14}, Lpy0;->D(Landroid/view/View;)I

    .line 468
    .line 469
    .line 470
    move-result v14

    .line 471
    if-ltz v14, :cond_21

    .line 472
    .line 473
    if-ge v14, v4, :cond_21

    .line 474
    .line 475
    goto :goto_15

    .line 476
    :cond_21
    add-int/lit8 v8, v8, -0x1

    .line 477
    .line 478
    goto :goto_13

    .line 479
    :cond_22
    move v14, v7

    .line 480
    goto :goto_15

    .line 481
    :cond_23
    invoke-virtual {v2}, Lzy0;->b()I

    .line 482
    .line 483
    .line 484
    move-result v4

    .line 485
    invoke-virtual {v0}, Lpy0;->u()I

    .line 486
    .line 487
    .line 488
    move-result v8

    .line 489
    move v14, v7

    .line 490
    :goto_14
    if-ge v14, v8, :cond_22

    .line 491
    .line 492
    invoke-virtual {v0, v14}, Lpy0;->t(I)Landroid/view/View;

    .line 493
    .line 494
    .line 495
    move-result-object v15

    .line 496
    invoke-static {v15}, Lpy0;->D(Landroid/view/View;)I

    .line 497
    .line 498
    .line 499
    move-result v15

    .line 500
    if-ltz v15, :cond_24

    .line 501
    .line 502
    if-ge v15, v4, :cond_24

    .line 503
    .line 504
    move v14, v15

    .line 505
    goto :goto_15

    .line 506
    :cond_24
    add-int/lit8 v14, v14, 0x1

    .line 507
    .line 508
    goto :goto_14

    .line 509
    :goto_15
    iput v14, v5, Lh91;->a:I

    .line 510
    .line 511
    iput v13, v5, Lh91;->b:I

    .line 512
    .line 513
    goto/16 :goto_7

    .line 514
    .line 515
    :goto_16
    iput-boolean v14, v5, Lh91;->e:Z

    .line 516
    .line 517
    :cond_25
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 518
    .line 519
    if-nez v4, :cond_26

    .line 520
    .line 521
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 522
    .line 523
    const/4 v14, -0x1

    .line 524
    if-ne v4, v14, :cond_26

    .line 525
    .line 526
    iget-boolean v4, v5, Lh91;->c:Z

    .line 527
    .line 528
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 529
    .line 530
    if-ne v4, v8, :cond_27

    .line 531
    .line 532
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 533
    .line 534
    .line 535
    move-result v4

    .line 536
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:Z

    .line 537
    .line 538
    if-eq v4, v8, :cond_26

    .line 539
    .line 540
    goto :goto_17

    .line 541
    :cond_26
    const/4 v14, 0x1

    .line 542
    goto :goto_18

    .line 543
    :cond_27
    :goto_17
    iget-object v4, v12, Lxn0;->k:Ljava/lang/Object;

    .line 544
    .line 545
    check-cast v4, [I

    .line 546
    .line 547
    if-eqz v4, :cond_28

    .line 548
    .line 549
    const/4 v14, -0x1

    .line 550
    invoke-static {v4, v14}, Ljava/util/Arrays;->fill([II)V

    .line 551
    .line 552
    .line 553
    :cond_28
    iput-object v11, v12, Lxn0;->l:Ljava/lang/Object;

    .line 554
    .line 555
    const/4 v14, 0x1

    .line 556
    iput-boolean v14, v5, Lh91;->d:Z

    .line 557
    .line 558
    :goto_18
    invoke-virtual {v0}, Lpy0;->u()I

    .line 559
    .line 560
    .line 561
    move-result v4

    .line 562
    if-lez v4, :cond_37

    .line 563
    .line 564
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 565
    .line 566
    if-eqz v4, :cond_29

    .line 567
    .line 568
    iget v4, v4, Lk91;->l:I

    .line 569
    .line 570
    if-ge v4, v14, :cond_37

    .line 571
    .line 572
    :cond_29
    iget-boolean v4, v5, Lh91;->d:Z

    .line 573
    .line 574
    if-eqz v4, :cond_2b

    .line 575
    .line 576
    move v3, v7

    .line 577
    :goto_19
    if-ge v3, v10, :cond_37

    .line 578
    .line 579
    aget-object v4, v9, v3

    .line 580
    .line 581
    invoke-virtual {v4}, Ll91;->b()V

    .line 582
    .line 583
    .line 584
    iget v4, v5, Lh91;->b:I

    .line 585
    .line 586
    if-eq v4, v13, :cond_2a

    .line 587
    .line 588
    aget-object v6, v9, v3

    .line 589
    .line 590
    iput v4, v6, Ll91;->b:I

    .line 591
    .line 592
    iput v4, v6, Ll91;->c:I

    .line 593
    .line 594
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    .line 595
    .line 596
    goto :goto_19

    .line 597
    :cond_2b
    if-nez v3, :cond_2d

    .line 598
    .line 599
    iget-object v3, v5, Lh91;->f:[I

    .line 600
    .line 601
    if-nez v3, :cond_2c

    .line 602
    .line 603
    goto :goto_1b

    .line 604
    :cond_2c
    move v3, v7

    .line 605
    :goto_1a
    if-ge v3, v10, :cond_37

    .line 606
    .line 607
    aget-object v4, v9, v3

    .line 608
    .line 609
    invoke-virtual {v4}, Ll91;->b()V

    .line 610
    .line 611
    .line 612
    iget-object v6, v5, Lh91;->f:[I

    .line 613
    .line 614
    aget v6, v6, v3

    .line 615
    .line 616
    iput v6, v4, Ll91;->b:I

    .line 617
    .line 618
    iput v6, v4, Ll91;->c:I

    .line 619
    .line 620
    add-int/lit8 v3, v3, 0x1

    .line 621
    .line 622
    goto :goto_1a

    .line 623
    :cond_2d
    :goto_1b
    move v3, v7

    .line 624
    :goto_1c
    if-ge v3, v10, :cond_34

    .line 625
    .line 626
    aget-object v4, v9, v3

    .line 627
    .line 628
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 629
    .line 630
    iget v11, v5, Lh91;->b:I

    .line 631
    .line 632
    iget-object v12, v4, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 633
    .line 634
    if-eqz v8, :cond_2e

    .line 635
    .line 636
    invoke-virtual {v4, v13}, Ll91;->f(I)I

    .line 637
    .line 638
    .line 639
    move-result v14

    .line 640
    goto :goto_1d

    .line 641
    :cond_2e
    invoke-virtual {v4, v13}, Ll91;->h(I)I

    .line 642
    .line 643
    .line 644
    move-result v14

    .line 645
    :goto_1d
    invoke-virtual {v4}, Ll91;->b()V

    .line 646
    .line 647
    .line 648
    if-ne v14, v13, :cond_2f

    .line 649
    .line 650
    goto :goto_1e

    .line 651
    :cond_2f
    if-eqz v8, :cond_30

    .line 652
    .line 653
    iget-object v15, v12, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 654
    .line 655
    invoke-virtual {v15}, Lvz;->g()I

    .line 656
    .line 657
    .line 658
    move-result v15

    .line 659
    if-lt v14, v15, :cond_33

    .line 660
    .line 661
    :cond_30
    if-nez v8, :cond_31

    .line 662
    .line 663
    iget-object v8, v12, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 664
    .line 665
    invoke-virtual {v8}, Lvz;->k()I

    .line 666
    .line 667
    .line 668
    move-result v8

    .line 669
    if-le v14, v8, :cond_31

    .line 670
    .line 671
    goto :goto_1e

    .line 672
    :cond_31
    if-eq v11, v13, :cond_32

    .line 673
    .line 674
    add-int/2addr v14, v11

    .line 675
    :cond_32
    iput v14, v4, Ll91;->c:I

    .line 676
    .line 677
    iput v14, v4, Ll91;->b:I

    .line 678
    .line 679
    :cond_33
    :goto_1e
    add-int/lit8 v3, v3, 0x1

    .line 680
    .line 681
    goto :goto_1c

    .line 682
    :cond_34
    array-length v3, v9

    .line 683
    iget-object v4, v5, Lh91;->f:[I

    .line 684
    .line 685
    if-eqz v4, :cond_35

    .line 686
    .line 687
    array-length v4, v4

    .line 688
    if-ge v4, v3, :cond_36

    .line 689
    .line 690
    :cond_35
    iget-object v4, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 691
    .line 692
    array-length v4, v4

    .line 693
    new-array v4, v4, [I

    .line 694
    .line 695
    iput-object v4, v5, Lh91;->f:[I

    .line 696
    .line 697
    :cond_36
    move v4, v7

    .line 698
    :goto_1f
    if-ge v4, v3, :cond_37

    .line 699
    .line 700
    iget-object v6, v5, Lh91;->f:[I

    .line 701
    .line 702
    aget-object v8, v9, v4

    .line 703
    .line 704
    invoke-virtual {v8, v13}, Ll91;->h(I)I

    .line 705
    .line 706
    .line 707
    move-result v8

    .line 708
    aput v8, v6, v4

    .line 709
    .line 710
    add-int/lit8 v4, v4, 0x1

    .line 711
    .line 712
    goto :goto_1f

    .line 713
    :cond_37
    invoke-virtual/range {p0 .. p1}, Lpy0;->o(Lvy0;)V

    .line 714
    .line 715
    .line 716
    iget-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 717
    .line 718
    iput-boolean v7, v3, Ljh0;->a:Z

    .line 719
    .line 720
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r:Lvz;

    .line 721
    .line 722
    invoke-virtual {v4}, Lvz;->l()I

    .line 723
    .line 724
    .line 725
    move-result v6

    .line 726
    div-int v8, v6, v10

    .line 727
    .line 728
    iput v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 729
    .line 730
    invoke-virtual {v4}, Lvz;->i()I

    .line 731
    .line 732
    .line 733
    move-result v8

    .line 734
    invoke-static {v6, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 735
    .line 736
    .line 737
    iget v6, v5, Lh91;->a:I

    .line 738
    .line 739
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->Q0(I)V

    .line 740
    .line 741
    .line 742
    iget-boolean v6, v5, Lh91;->c:Z

    .line 743
    .line 744
    if-eqz v6, :cond_38

    .line 745
    .line 746
    const/4 v14, -0x1

    .line 747
    invoke-virtual {v0, v14}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 748
    .line 749
    .line 750
    invoke-virtual {v0, v1, v3, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 751
    .line 752
    .line 753
    const/4 v6, 0x1

    .line 754
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 755
    .line 756
    .line 757
    iget v8, v5, Lh91;->a:I

    .line 758
    .line 759
    iget v9, v3, Ljh0;->d:I

    .line 760
    .line 761
    add-int/2addr v8, v9

    .line 762
    iput v8, v3, Ljh0;->c:I

    .line 763
    .line 764
    invoke-virtual {v0, v1, v3, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 765
    .line 766
    .line 767
    goto :goto_20

    .line 768
    :cond_38
    const/4 v6, 0x1

    .line 769
    const/4 v14, -0x1

    .line 770
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {v0, v1, v3, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 774
    .line 775
    .line 776
    invoke-virtual {v0, v14}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 777
    .line 778
    .line 779
    iget v6, v5, Lh91;->a:I

    .line 780
    .line 781
    iget v8, v3, Ljh0;->d:I

    .line 782
    .line 783
    add-int/2addr v6, v8

    .line 784
    iput v6, v3, Ljh0;->c:I

    .line 785
    .line 786
    invoke-virtual {v0, v1, v3, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 787
    .line 788
    .line 789
    :goto_20
    invoke-virtual {v4}, Lvz;->i()I

    .line 790
    .line 791
    .line 792
    move-result v3

    .line 793
    const/high16 v6, 0x40000000    # 2.0f

    .line 794
    .line 795
    if-ne v3, v6, :cond_39

    .line 796
    .line 797
    goto/16 :goto_25

    .line 798
    .line 799
    :cond_39
    invoke-virtual {v0}, Lpy0;->u()I

    .line 800
    .line 801
    .line 802
    move-result v3

    .line 803
    const/4 v6, 0x0

    .line 804
    move v8, v7

    .line 805
    :goto_21
    if-ge v8, v3, :cond_3b

    .line 806
    .line 807
    invoke-virtual {v0, v8}, Lpy0;->t(I)Landroid/view/View;

    .line 808
    .line 809
    .line 810
    move-result-object v9

    .line 811
    invoke-virtual {v4, v9}, Lvz;->c(Landroid/view/View;)I

    .line 812
    .line 813
    .line 814
    move-result v11

    .line 815
    int-to-float v11, v11

    .line 816
    cmpg-float v12, v11, v6

    .line 817
    .line 818
    if-gez v12, :cond_3a

    .line 819
    .line 820
    goto :goto_22

    .line 821
    :cond_3a
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 822
    .line 823
    .line 824
    move-result-object v9

    .line 825
    check-cast v9, Li91;

    .line 826
    .line 827
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 828
    .line 829
    .line 830
    invoke-static {v6, v11}, Ljava/lang/Math;->max(FF)F

    .line 831
    .line 832
    .line 833
    move-result v6

    .line 834
    :goto_22
    add-int/lit8 v8, v8, 0x1

    .line 835
    .line 836
    goto :goto_21

    .line 837
    :cond_3b
    iget v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 838
    .line 839
    int-to-float v9, v10

    .line 840
    mul-float/2addr v6, v9

    .line 841
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 842
    .line 843
    .line 844
    move-result v6

    .line 845
    invoke-virtual {v4}, Lvz;->i()I

    .line 846
    .line 847
    .line 848
    move-result v9

    .line 849
    if-ne v9, v13, :cond_3c

    .line 850
    .line 851
    invoke-virtual {v4}, Lvz;->l()I

    .line 852
    .line 853
    .line 854
    move-result v9

    .line 855
    invoke-static {v6, v9}, Ljava/lang/Math;->min(II)I

    .line 856
    .line 857
    .line 858
    move-result v6

    .line 859
    :cond_3c
    div-int v9, v6, v10

    .line 860
    .line 861
    iput v9, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 862
    .line 863
    invoke-virtual {v4}, Lvz;->i()I

    .line 864
    .line 865
    .line 866
    move-result v4

    .line 867
    invoke-static {v6, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 868
    .line 869
    .line 870
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 871
    .line 872
    if-ne v4, v8, :cond_3d

    .line 873
    .line 874
    goto :goto_25

    .line 875
    :cond_3d
    move v4, v7

    .line 876
    :goto_23
    if-ge v4, v3, :cond_40

    .line 877
    .line 878
    invoke-virtual {v0, v4}, Lpy0;->t(I)Landroid/view/View;

    .line 879
    .line 880
    .line 881
    move-result-object v6

    .line 882
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 883
    .line 884
    .line 885
    move-result-object v9

    .line 886
    check-cast v9, Li91;

    .line 887
    .line 888
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 889
    .line 890
    .line 891
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 892
    .line 893
    .line 894
    move-result v11

    .line 895
    iget v12, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 896
    .line 897
    if-eqz v11, :cond_3e

    .line 898
    .line 899
    const/4 v14, 0x1

    .line 900
    if-ne v12, v14, :cond_3e

    .line 901
    .line 902
    add-int/lit8 v11, v10, -0x1

    .line 903
    .line 904
    iget-object v9, v9, Li91;->e:Ll91;

    .line 905
    .line 906
    iget v9, v9, Ll91;->e:I

    .line 907
    .line 908
    sub-int/2addr v11, v9

    .line 909
    neg-int v9, v11

    .line 910
    iget v11, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 911
    .line 912
    mul-int/2addr v11, v9

    .line 913
    mul-int/2addr v9, v8

    .line 914
    sub-int/2addr v11, v9

    .line 915
    invoke-virtual {v6, v11}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 916
    .line 917
    .line 918
    goto :goto_24

    .line 919
    :cond_3e
    iget-object v9, v9, Li91;->e:Ll91;

    .line 920
    .line 921
    iget v9, v9, Ll91;->e:I

    .line 922
    .line 923
    iget v11, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 924
    .line 925
    mul-int/2addr v11, v9

    .line 926
    mul-int/2addr v9, v8

    .line 927
    const/4 v14, 0x1

    .line 928
    if-ne v12, v14, :cond_3f

    .line 929
    .line 930
    sub-int/2addr v11, v9

    .line 931
    invoke-virtual {v6, v11}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 932
    .line 933
    .line 934
    goto :goto_24

    .line 935
    :cond_3f
    sub-int/2addr v11, v9

    .line 936
    invoke-virtual {v6, v11}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 937
    .line 938
    .line 939
    :goto_24
    add-int/lit8 v4, v4, 0x1

    .line 940
    .line 941
    goto :goto_23

    .line 942
    :cond_40
    :goto_25
    invoke-virtual {v0}, Lpy0;->u()I

    .line 943
    .line 944
    .line 945
    move-result v3

    .line 946
    if-lez v3, :cond_42

    .line 947
    .line 948
    iget-boolean v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 949
    .line 950
    if-eqz v3, :cond_41

    .line 951
    .line 952
    const/4 v14, 0x1

    .line 953
    invoke-virtual {v0, v1, v2, v14}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x0(Lvy0;Lzy0;Z)V

    .line 954
    .line 955
    .line 956
    invoke-virtual {v0, v1, v2, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y0(Lvy0;Lzy0;Z)V

    .line 957
    .line 958
    .line 959
    goto :goto_26

    .line 960
    :cond_41
    const/4 v14, 0x1

    .line 961
    invoke-virtual {v0, v1, v2, v14}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y0(Lvy0;Lzy0;Z)V

    .line 962
    .line 963
    .line 964
    invoke-virtual {v0, v1, v2, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x0(Lvy0;Lzy0;Z)V

    .line 965
    .line 966
    .line 967
    goto :goto_26

    .line 968
    :cond_42
    const/4 v14, 0x1

    .line 969
    :goto_26
    if-eqz p3, :cond_44

    .line 970
    .line 971
    iget-boolean v3, v2, Lzy0;->f:Z

    .line 972
    .line 973
    if-nez v3, :cond_44

    .line 974
    .line 975
    iget v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:I

    .line 976
    .line 977
    if-eqz v3, :cond_44

    .line 978
    .line 979
    invoke-virtual {v0}, Lpy0;->u()I

    .line 980
    .line 981
    .line 982
    move-result v3

    .line 983
    if-lez v3, :cond_44

    .line 984
    .line 985
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E0()Landroid/view/View;

    .line 986
    .line 987
    .line 988
    move-result-object v3

    .line 989
    if-eqz v3, :cond_44

    .line 990
    .line 991
    iget-object v3, v0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 992
    .line 993
    if-eqz v3, :cond_43

    .line 994
    .line 995
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:Lg91;

    .line 996
    .line 997
    invoke-virtual {v3, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 998
    .line 999
    .line 1000
    :cond_43
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s0()Z

    .line 1001
    .line 1002
    .line 1003
    move-result v3

    .line 1004
    if-eqz v3, :cond_44

    .line 1005
    .line 1006
    move v8, v14

    .line 1007
    goto :goto_27

    .line 1008
    :cond_44
    move v8, v7

    .line 1009
    :goto_27
    iget-boolean v3, v2, Lzy0;->f:Z

    .line 1010
    .line 1011
    if-eqz v3, :cond_45

    .line 1012
    .line 1013
    invoke-virtual {v5}, Lh91;->a()V

    .line 1014
    .line 1015
    .line 1016
    :cond_45
    iget-boolean v3, v5, Lh91;->c:Z

    .line 1017
    .line 1018
    iput-boolean v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 1019
    .line 1020
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 1021
    .line 1022
    .line 1023
    move-result v3

    .line 1024
    iput-boolean v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:Z

    .line 1025
    .line 1026
    if-eqz v8, :cond_46

    .line 1027
    .line 1028
    invoke-virtual {v5}, Lh91;->a()V

    .line 1029
    .line 1030
    .line 1031
    invoke-virtual {v0, v1, v2, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H0(Lvy0;Lzy0;Z)V

    .line 1032
    .line 1033
    .line 1034
    :cond_46
    return-void
.end method

.method public final I0(I)Z
    .locals 4

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    move p1, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p1, v2

    .line 13
    :goto_0
    iget-boolean p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 14
    .line 15
    if-eq p1, p0, :cond_1

    .line 16
    .line 17
    return v3

    .line 18
    :cond_1
    return v2

    .line 19
    :cond_2
    if-ne p1, v1, :cond_3

    .line 20
    .line 21
    move p1, v3

    .line 22
    goto :goto_1

    .line 23
    :cond_3
    move p1, v2

    .line 24
    :goto_1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 25
    .line 26
    if-ne p1, v0, :cond_4

    .line 27
    .line 28
    move p1, v3

    .line 29
    goto :goto_2

    .line 30
    :cond_4
    move p1, v2

    .line 31
    :goto_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-ne p1, p0, :cond_5

    .line 36
    .line 37
    return v3

    .line 38
    :cond_5
    return v2
.end method

.method public final J0(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    move v2, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, -0x1

    .line 15
    :goto_0
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 16
    .line 17
    iput-boolean v0, v3, Ljh0;->a:Z

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->Q0(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 23
    .line 24
    .line 25
    iget p0, v3, Ljh0;->d:I

    .line 26
    .line 27
    add-int/2addr v1, p0

    .line 28
    iput v1, v3, Ljh0;->c:I

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iput p0, v3, Ljh0;->b:I

    .line 35
    .line 36
    return-void
.end method

.method public final K(I)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lpy0;->K(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 10
    .line 11
    aget-object v1, v1, v0

    .line 12
    .line 13
    iget v2, v1, Ll91;->b:I

    .line 14
    .line 15
    const/high16 v3, -0x80000000

    .line 16
    .line 17
    if-eq v2, v3, :cond_0

    .line 18
    .line 19
    add-int/2addr v2, p1

    .line 20
    iput v2, v1, Ll91;->b:I

    .line 21
    .line 22
    :cond_0
    iget v2, v1, Ll91;->c:I

    .line 23
    .line 24
    if-eq v2, v3, :cond_1

    .line 25
    .line 26
    add-int/2addr v2, p1

    .line 27
    iput v2, v1, Ll91;->c:I

    .line 28
    .line 29
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    return-void
.end method

.method public final K0(Lvy0;Ljh0;)V
    .locals 6

    .line 1
    iget-boolean v0, p2, Ljh0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    iget-boolean v0, p2, Ljh0;->i:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    iget v0, p2, Ljh0;->b:I

    .line 12
    .line 13
    iget v1, p2, Ljh0;->e:I

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    iget p2, p2, Ljh0;->g:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L0(Lvy0;I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget p2, p2, Ljh0;->f:I

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M0(Lvy0;I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 33
    .line 34
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    const/4 v5, 0x0

    .line 38
    if-ne v1, v2, :cond_6

    .line 39
    .line 40
    iget v1, p2, Ljh0;->f:I

    .line 41
    .line 42
    aget-object v2, v3, v5

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ll91;->h(I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    :goto_0
    if-ge v4, v0, :cond_4

    .line 49
    .line 50
    aget-object v5, v3, v4

    .line 51
    .line 52
    invoke-virtual {v5, v1}, Ll91;->h(I)I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-le v5, v2, :cond_3

    .line 57
    .line 58
    move v2, v5

    .line 59
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    sub-int/2addr v1, v2

    .line 63
    iget v0, p2, Ljh0;->g:I

    .line 64
    .line 65
    if-gez v1, :cond_5

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_5
    iget p2, p2, Ljh0;->b:I

    .line 69
    .line 70
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    sub-int/2addr v0, p2

    .line 75
    :goto_1
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L0(Lvy0;I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_6
    iget v1, p2, Ljh0;->g:I

    .line 80
    .line 81
    aget-object v2, v3, v5

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Ll91;->f(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    :goto_2
    if-ge v4, v0, :cond_8

    .line 88
    .line 89
    aget-object v5, v3, v4

    .line 90
    .line 91
    invoke-virtual {v5, v1}, Ll91;->f(I)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-ge v5, v2, :cond_7

    .line 96
    .line 97
    move v2, v5

    .line 98
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_8
    iget v0, p2, Ljh0;->g:I

    .line 102
    .line 103
    sub-int/2addr v2, v0

    .line 104
    iget v0, p2, Ljh0;->f:I

    .line 105
    .line 106
    if-gez v2, :cond_9

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_9
    iget p2, p2, Ljh0;->b:I

    .line 110
    .line 111
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    add-int/2addr v0, p2

    .line 116
    :goto_3
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M0(Lvy0;I)V

    .line 117
    .line 118
    .line 119
    :cond_a
    :goto_4
    return-void
.end method

.method public final L(I)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lpy0;->L(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 10
    .line 11
    aget-object v1, v1, v0

    .line 12
    .line 13
    iget v2, v1, Ll91;->b:I

    .line 14
    .line 15
    const/high16 v3, -0x80000000

    .line 16
    .line 17
    if-eq v2, v3, :cond_0

    .line 18
    .line 19
    add-int/2addr v2, p1

    .line 20
    iput v2, v1, Ll91;->b:I

    .line 21
    .line 22
    :cond_0
    iget v2, v1, Ll91;->c:I

    .line 23
    .line 24
    if-eq v2, v3, :cond_1

    .line 25
    .line 26
    add-int/2addr v2, p1

    .line 27
    iput v2, v1, Ll91;->c:I

    .line 28
    .line 29
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    return-void
.end method

.method public final L0(Lvy0;I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    sub-int/2addr v0, v1

    .line 7
    :goto_0
    if-ltz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lpy0;->t(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Lvz;->e(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-lt v4, p2, :cond_4

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lvz;->n(Landroid/view/View;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-lt v3, p2, :cond_4

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Li91;

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    iget-object v4, v3, Li91;->e:Ll91;

    .line 37
    .line 38
    iget-object v4, v4, Ll91;->a:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-ne v4, v1, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget-object v3, v3, Li91;->e:Ll91;

    .line 48
    .line 49
    iget-object v4, v3, Ll91;->a:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    add-int/lit8 v6, v5, -0x1

    .line 56
    .line 57
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    check-cast v6, Li91;

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    iput-object v7, v6, Li91;->e:Ll91;

    .line 71
    .line 72
    iget-object v7, v6, Lqy0;->a:Lmu0;

    .line 73
    .line 74
    invoke-virtual {v7}, Lmu0;->i()Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-nez v7, :cond_1

    .line 79
    .line 80
    iget-object v6, v6, Lqy0;->a:Lmu0;

    .line 81
    .line 82
    invoke-virtual {v6}, Lmu0;->l()Z

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    if-eqz v6, :cond_2

    .line 87
    .line 88
    :cond_1
    iget v6, v3, Ll91;->d:I

    .line 89
    .line 90
    iget-object v7, v3, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 91
    .line 92
    iget-object v7, v7, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 93
    .line 94
    invoke-virtual {v7, v4}, Lvz;->c(Landroid/view/View;)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    sub-int/2addr v6, v4

    .line 99
    iput v6, v3, Ll91;->d:I

    .line 100
    .line 101
    :cond_2
    const/high16 v4, -0x80000000

    .line 102
    .line 103
    if-ne v5, v1, :cond_3

    .line 104
    .line 105
    iput v4, v3, Ll91;->b:I

    .line 106
    .line 107
    :cond_3
    iput v4, v3, Ll91;->c:I

    .line 108
    .line 109
    invoke-virtual {p0, v2, p1}, Lpy0;->d0(Landroid/view/View;Lvy0;)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 v0, v0, -0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    :goto_1
    return-void
.end method

.method public final M(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:Lg91;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 12
    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 16
    .line 17
    aget-object v1, v1, v0

    .line 18
    .line 19
    invoke-virtual {v1}, Ll91;->b()V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final M0(Lvy0;I)V
    .locals 6

    .line 1
    :goto_0
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_4

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lpy0;->t(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Lvz;->b(Landroid/view/View;)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-gt v3, p2, :cond_4

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Lvz;->m(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-gt v2, p2, :cond_4

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Li91;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    iget-object v3, v2, Li91;->e:Ll91;

    .line 36
    .line 37
    iget-object v3, v3, Ll91;->a:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x1

    .line 44
    if-ne v3, v4, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget-object v2, v2, Li91;->e:Ll91;

    .line 48
    .line 49
    iget-object v3, v2, Ll91;->a:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Li91;

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    iput-object v5, v4, Li91;->e:Ll91;

    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    const/high16 v5, -0x80000000

    .line 71
    .line 72
    if-nez v3, :cond_1

    .line 73
    .line 74
    iput v5, v2, Ll91;->c:I

    .line 75
    .line 76
    :cond_1
    iget-object v3, v4, Lqy0;->a:Lmu0;

    .line 77
    .line 78
    invoke-virtual {v3}, Lmu0;->i()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-nez v3, :cond_2

    .line 83
    .line 84
    iget-object v3, v4, Lqy0;->a:Lmu0;

    .line 85
    .line 86
    invoke-virtual {v3}, Lmu0;->l()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_3

    .line 91
    .line 92
    :cond_2
    iget v3, v2, Ll91;->d:I

    .line 93
    .line 94
    iget-object v4, v2, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 95
    .line 96
    iget-object v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 97
    .line 98
    invoke-virtual {v4, v0}, Lvz;->c(Landroid/view/View;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    sub-int/2addr v3, v0

    .line 103
    iput v3, v2, Ll91;->d:I

    .line 104
    .line 105
    :cond_3
    iput v5, v2, Ll91;->b:I

    .line 106
    .line 107
    invoke-virtual {p0, v1, p1}, Lpy0;->d0(Landroid/view/View;Lvy0;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    :goto_1
    return-void
.end method

.method public final N(Landroid/view/View;ILvy0;Lzy0;)Landroid/view/View;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_10

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y(Landroid/view/View;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    iget-object v0, p0, Lpy0;->a:Lc9;

    .line 23
    .line 24
    iget-object v0, v0, Lc9;->m:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    :goto_0
    move-object p1, v1

    .line 35
    :cond_3
    if-nez p1, :cond_4

    .line 36
    .line 37
    goto/16 :goto_10

    .line 38
    .line 39
    :cond_4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N0()V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 43
    .line 44
    const/high16 v2, -0x80000000

    .line 45
    .line 46
    const/4 v3, -0x1

    .line 47
    const/4 v4, 0x1

    .line 48
    if-eq p2, v4, :cond_e

    .line 49
    .line 50
    const/4 v5, 0x2

    .line 51
    if-eq p2, v5, :cond_c

    .line 52
    .line 53
    const/16 v5, 0x11

    .line 54
    .line 55
    if-eq p2, v5, :cond_b

    .line 56
    .line 57
    const/16 v5, 0x21

    .line 58
    .line 59
    if-eq p2, v5, :cond_9

    .line 60
    .line 61
    const/16 v5, 0x42

    .line 62
    .line 63
    if-eq p2, v5, :cond_8

    .line 64
    .line 65
    const/16 v5, 0x82

    .line 66
    .line 67
    if-eq p2, v5, :cond_6

    .line 68
    .line 69
    :cond_5
    move p2, v2

    .line 70
    goto :goto_4

    .line 71
    :cond_6
    if-ne v0, v4, :cond_5

    .line 72
    .line 73
    :cond_7
    :goto_1
    move p2, v4

    .line 74
    goto :goto_4

    .line 75
    :cond_8
    if-nez v0, :cond_5

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_9
    if-ne v0, v4, :cond_5

    .line 79
    .line 80
    :cond_a
    :goto_2
    move p2, v3

    .line 81
    goto :goto_4

    .line 82
    :cond_b
    if-nez v0, :cond_5

    .line 83
    .line 84
    :goto_3
    goto :goto_2

    .line 85
    :cond_c
    if-ne v0, v4, :cond_d

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_7

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_e
    if-ne v0, v4, :cond_f

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_a

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :goto_4
    if-ne p2, v2, :cond_10

    .line 106
    .line 107
    goto/16 :goto_10

    .line 108
    .line 109
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Li91;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    iget-object v0, v0, Li91;->e:Ll91;

    .line 119
    .line 120
    if-ne p2, v4, :cond_11

    .line 121
    .line 122
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    goto :goto_5

    .line 127
    :cond_11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    :goto_5
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->Q0(I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P0(I)V

    .line 135
    .line 136
    .line 137
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 138
    .line 139
    iget v6, v5, Ljh0;->d:I

    .line 140
    .line 141
    add-int/2addr v6, v2

    .line 142
    iput v6, v5, Ljh0;->c:I

    .line 143
    .line 144
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 145
    .line 146
    invoke-virtual {v6}, Lvz;->l()I

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    int-to-float v6, v6

    .line 151
    const v7, 0x3eaaaaab

    .line 152
    .line 153
    .line 154
    mul-float/2addr v6, v7

    .line 155
    float-to-int v6, v6

    .line 156
    iput v6, v5, Ljh0;->b:I

    .line 157
    .line 158
    iput-boolean v4, v5, Ljh0;->h:Z

    .line 159
    .line 160
    const/4 v6, 0x0

    .line 161
    iput-boolean v6, v5, Ljh0;->a:Z

    .line 162
    .line 163
    invoke-virtual {p0, p3, v5, p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 164
    .line 165
    .line 166
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 167
    .line 168
    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 169
    .line 170
    invoke-virtual {v0, v2, p2}, Ll91;->g(II)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    if-eqz p3, :cond_12

    .line 175
    .line 176
    if-eq p3, p1, :cond_12

    .line 177
    .line 178
    return-object p3

    .line 179
    :cond_12
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I0(I)Z

    .line 180
    .line 181
    .line 182
    move-result p3

    .line 183
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 184
    .line 185
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 186
    .line 187
    if-eqz p3, :cond_14

    .line 188
    .line 189
    add-int/lit8 p3, v5, -0x1

    .line 190
    .line 191
    :goto_6
    if-ltz p3, :cond_16

    .line 192
    .line 193
    aget-object v7, p4, p3

    .line 194
    .line 195
    invoke-virtual {v7, v2, p2}, Ll91;->g(II)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v7

    .line 199
    if-eqz v7, :cond_13

    .line 200
    .line 201
    if-eq v7, p1, :cond_13

    .line 202
    .line 203
    return-object v7

    .line 204
    :cond_13
    add-int/lit8 p3, p3, -0x1

    .line 205
    .line 206
    goto :goto_6

    .line 207
    :cond_14
    move p3, v6

    .line 208
    :goto_7
    if-ge p3, v5, :cond_16

    .line 209
    .line 210
    aget-object v7, p4, p3

    .line 211
    .line 212
    invoke-virtual {v7, v2, p2}, Ll91;->g(II)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    if-eqz v7, :cond_15

    .line 217
    .line 218
    if-eq v7, p1, :cond_15

    .line 219
    .line 220
    return-object v7

    .line 221
    :cond_15
    add-int/lit8 p3, p3, 0x1

    .line 222
    .line 223
    goto :goto_7

    .line 224
    :cond_16
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 225
    .line 226
    xor-int/2addr p3, v4

    .line 227
    if-ne p2, v3, :cond_17

    .line 228
    .line 229
    move v2, v4

    .line 230
    goto :goto_8

    .line 231
    :cond_17
    move v2, v6

    .line 232
    :goto_8
    if-ne p3, v2, :cond_18

    .line 233
    .line 234
    move p3, v4

    .line 235
    goto :goto_9

    .line 236
    :cond_18
    move p3, v6

    .line 237
    :goto_9
    if-eqz p3, :cond_19

    .line 238
    .line 239
    invoke-virtual {v0}, Ll91;->c()I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    goto :goto_a

    .line 244
    :cond_19
    invoke-virtual {v0}, Ll91;->d()I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    :goto_a
    invoke-virtual {p0, v2}, Lpy0;->p(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    if-eqz v2, :cond_1a

    .line 253
    .line 254
    if-eq v2, p1, :cond_1a

    .line 255
    .line 256
    return-object v2

    .line 257
    :cond_1a
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I0(I)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-eqz p2, :cond_1e

    .line 262
    .line 263
    sub-int/2addr v5, v4

    .line 264
    :goto_b
    if-ltz v5, :cond_21

    .line 265
    .line 266
    iget p2, v0, Ll91;->e:I

    .line 267
    .line 268
    if-ne v5, p2, :cond_1b

    .line 269
    .line 270
    goto :goto_d

    .line 271
    :cond_1b
    if-eqz p3, :cond_1c

    .line 272
    .line 273
    aget-object p2, p4, v5

    .line 274
    .line 275
    invoke-virtual {p2}, Ll91;->c()I

    .line 276
    .line 277
    .line 278
    move-result p2

    .line 279
    goto :goto_c

    .line 280
    :cond_1c
    aget-object p2, p4, v5

    .line 281
    .line 282
    invoke-virtual {p2}, Ll91;->d()I

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    :goto_c
    invoke-virtual {p0, p2}, Lpy0;->p(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object p2

    .line 290
    if-eqz p2, :cond_1d

    .line 291
    .line 292
    if-eq p2, p1, :cond_1d

    .line 293
    .line 294
    return-object p2

    .line 295
    :cond_1d
    :goto_d
    add-int/lit8 v5, v5, -0x1

    .line 296
    .line 297
    goto :goto_b

    .line 298
    :cond_1e
    :goto_e
    if-ge v6, v5, :cond_21

    .line 299
    .line 300
    if-eqz p3, :cond_1f

    .line 301
    .line 302
    aget-object p2, p4, v6

    .line 303
    .line 304
    invoke-virtual {p2}, Ll91;->c()I

    .line 305
    .line 306
    .line 307
    move-result p2

    .line 308
    goto :goto_f

    .line 309
    :cond_1f
    aget-object p2, p4, v6

    .line 310
    .line 311
    invoke-virtual {p2}, Ll91;->d()I

    .line 312
    .line 313
    .line 314
    move-result p2

    .line 315
    :goto_f
    invoke-virtual {p0, p2}, Lpy0;->p(I)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object p2

    .line 319
    if-eqz p2, :cond_20

    .line 320
    .line 321
    if-eq p2, p1, :cond_20

    .line 322
    .line 323
    return-object p2

    .line 324
    :cond_20
    add-int/lit8 v6, v6, 0x1

    .line 325
    .line 326
    goto :goto_e

    .line 327
    :cond_21
    :goto_10
    return-object v1
.end method

.method public final N0()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 14
    .line 15
    xor-int/2addr v0, v1

    .line 16
    iput-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 22
    .line 23
    return-void
.end method

.method public final O(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lpy0;->O(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lpy0;->u()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v1}, Lpy0;->D(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {p0}, Lpy0;->D(Landroid/view/View;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-ge v0, p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method public final O0(ILvy0;Lzy0;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J0(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 15
    .line 16
    invoke-virtual {p0, p2, v0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u0(Lvy0;Ljh0;Lzy0;)I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    iget v2, v0, Ljh0;->b:I

    .line 21
    .line 22
    if-ge v2, p3, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    if-gez p1, :cond_2

    .line 26
    .line 27
    neg-int p1, p3

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    move p1, p3

    .line 30
    :goto_0
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 31
    .line 32
    neg-int v2, p1

    .line 33
    invoke-virtual {p3, v2}, Lvz;->o(I)V

    .line 34
    .line 35
    .line 36
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 37
    .line 38
    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 39
    .line 40
    iput v1, v0, Ljh0;->b:I

    .line 41
    .line 42
    invoke-virtual {p0, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K0(Lvy0;Ljh0;)V

    .line 43
    .line 44
    .line 45
    return p1

    .line 46
    :cond_3
    :goto_1
    return v1
.end method

.method public final P(Lvy0;Lzy0;Landroid/view/View;Lo1;)V
    .locals 6

    .line 1
    iget-object p1, p4, Lo1;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    instance-of v0, p2, Li91;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p3, p4}, Lpy0;->Q(Landroid/view/View;Lo1;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast p2, Li91;

    .line 16
    .line 17
    iget-object p2, p2, Li91;->e:Ll91;

    .line 18
    .line 19
    const/4 p3, -0x1

    .line 20
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 21
    .line 22
    if-nez p0, :cond_2

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    :goto_0
    move v0, p3

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget p3, p2, Ll91;->e:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :goto_1
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    const/4 v1, 0x1

    .line 34
    const/4 v2, -0x1

    .line 35
    const/4 v3, -0x1

    .line 36
    invoke-static/range {v0 .. v5}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    if-nez p2, :cond_3

    .line 45
    .line 46
    :goto_2
    move v2, p3

    .line 47
    goto :goto_3

    .line 48
    :cond_3
    iget p3, p2, Ll91;->e:I

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_3
    const/4 v4, 0x0

    .line 52
    const/4 v5, 0x0

    .line 53
    const/4 v0, -0x1

    .line 54
    const/4 v1, -0x1

    .line 55
    const/4 v3, 0x1

    .line 56
    invoke-static/range {v0 .. v5}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final P0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 2
    .line 3
    iput p1, v0, Ljh0;->e:I

    .line 4
    .line 5
    iget-boolean p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, -0x1

    .line 9
    if-ne p1, v2, :cond_0

    .line 10
    .line 11
    move p1, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    if-ne p0, p1, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v1, v2

    .line 18
    :goto_1
    iput v1, v0, Ljh0;->d:I

    .line 19
    .line 20
    return-void
.end method

.method public final Q0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Ljh0;->b:I

    .line 5
    .line 6
    iput p1, v0, Ljh0;->c:I

    .line 7
    .line 8
    iget-object p1, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-boolean p1, p1, Landroidx/recyclerview/widget/RecyclerView;->p:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lvz;->k()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, v0, Ljh0;->f:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lvz;->g()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, v0, Ljh0;->g:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Lvz;->f()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, v0, Ljh0;->g:I

    .line 36
    .line 37
    iput v1, v0, Ljh0;->f:I

    .line 38
    .line 39
    :goto_0
    iput-boolean v1, v0, Ljh0;->h:Z

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, v0, Ljh0;->a:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Lvz;->i()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lvz;->f()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_1

    .line 55
    .line 56
    move v1, p1

    .line 57
    :cond_1
    iput-boolean v1, v0, Ljh0;->i:Z

    .line 58
    .line 59
    return-void
.end method

.method public final R(II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D0(III)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final R0(Ll91;II)V
    .locals 5

    .line 1
    iget v0, p1, Ll91;->d:I

    .line 2
    .line 3
    iget v1, p1, Ll91;->e:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:Ljava/util/BitSet;

    .line 7
    .line 8
    const/high16 v3, -0x80000000

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    if-ne p2, v2, :cond_1

    .line 12
    .line 13
    iget p2, p1, Ll91;->b:I

    .line 14
    .line 15
    if-eq p2, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p2, p1, Ll91;->a:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Li91;

    .line 31
    .line 32
    iget-object v3, p1, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 33
    .line 34
    iget-object v3, v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 35
    .line 36
    invoke-virtual {v3, p2}, Lvz;->e(Landroid/view/View;)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p1, Ll91;->b:I

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    iget p2, p1, Ll91;->b:I

    .line 46
    .line 47
    :goto_0
    add-int/2addr p2, v0

    .line 48
    if-gt p2, p3, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0, v1, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget p2, p1, Ll91;->c:I

    .line 55
    .line 56
    if-eq p2, v3, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {p1}, Ll91;->a()V

    .line 60
    .line 61
    .line 62
    iget p2, p1, Ll91;->c:I

    .line 63
    .line 64
    :goto_1
    sub-int/2addr p2, v0

    .line 65
    if-lt p2, p3, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0, v1, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 2
    .line 3
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, [I

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    iput-object v1, v0, Lxn0;->l:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final T(II)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D0(III)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final U(II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D0(III)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final V(II)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D0(III)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final W(Lvy0;Lzy0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H0(Lvy0;Lzy0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final X(Lzy0;)V
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:I

    .line 3
    .line 4
    const/high16 p1, -0x80000000

    .line 5
    .line 6
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 10
    .line 11
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Lh91;

    .line 12
    .line 13
    invoke-virtual {p0}, Lh91;->a()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final Y(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lk91;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lk91;

    .line 6
    .line 7
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 8
    .line 9
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final Z()Landroid/os/Parcelable;
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lk91;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v1, v0, Lk91;->l:I

    .line 11
    .line 12
    iput v1, p0, Lk91;->l:I

    .line 13
    .line 14
    iget v1, v0, Lk91;->j:I

    .line 15
    .line 16
    iput v1, p0, Lk91;->j:I

    .line 17
    .line 18
    iget v1, v0, Lk91;->k:I

    .line 19
    .line 20
    iput v1, p0, Lk91;->k:I

    .line 21
    .line 22
    iget-object v1, v0, Lk91;->m:[I

    .line 23
    .line 24
    iput-object v1, p0, Lk91;->m:[I

    .line 25
    .line 26
    iget v1, v0, Lk91;->n:I

    .line 27
    .line 28
    iput v1, p0, Lk91;->n:I

    .line 29
    .line 30
    iget-object v1, v0, Lk91;->o:[I

    .line 31
    .line 32
    iput-object v1, p0, Lk91;->o:[I

    .line 33
    .line 34
    iget-boolean v1, v0, Lk91;->q:Z

    .line 35
    .line 36
    iput-boolean v1, p0, Lk91;->q:Z

    .line 37
    .line 38
    iget-boolean v1, v0, Lk91;->r:Z

    .line 39
    .line 40
    iput-boolean v1, p0, Lk91;->r:Z

    .line 41
    .line 42
    iget-boolean v1, v0, Lk91;->s:Z

    .line 43
    .line 44
    iput-boolean v1, p0, Lk91;->s:Z

    .line 45
    .line 46
    iget-object v0, v0, Lk91;->p:Ljava/util/ArrayList;

    .line 47
    .line 48
    iput-object v0, p0, Lk91;->p:Ljava/util/ArrayList;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_0
    new-instance v0, Lk91;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Z

    .line 57
    .line 58
    iput-boolean v1, v0, Lk91;->q:Z

    .line 59
    .line 60
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lk91;->r:Z

    .line 63
    .line 64
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:Z

    .line 65
    .line 66
    iput-boolean v1, v0, Lk91;->s:Z

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 70
    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    iget-object v3, v2, Lxn0;->k:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v3, [I

    .line 76
    .line 77
    if-eqz v3, :cond_1

    .line 78
    .line 79
    iput-object v3, v0, Lk91;->o:[I

    .line 80
    .line 81
    array-length v3, v3

    .line 82
    iput v3, v0, Lk91;->n:I

    .line 83
    .line 84
    iget-object v2, v2, Lxn0;->l:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v2, Ljava/util/ArrayList;

    .line 87
    .line 88
    iput-object v2, v0, Lk91;->p:Ljava/util/ArrayList;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    iput v1, v0, Lk91;->n:I

    .line 92
    .line 93
    :goto_0
    invoke-virtual {p0}, Lpy0;->u()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    const/4 v3, -0x1

    .line 98
    if-lez v2, :cond_8

    .line 99
    .line 100
    iget-boolean v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 101
    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    goto :goto_1

    .line 109
    :cond_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    :goto_1
    iput v2, v0, Lk91;->j:I

    .line 114
    .line 115
    iget-boolean v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 116
    .line 117
    const/4 v4, 0x1

    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    goto :goto_2

    .line 125
    :cond_3
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    :goto_2
    if-nez v2, :cond_4

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_4
    invoke-static {v2}, Lpy0;->D(Landroid/view/View;)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    :goto_3
    iput v3, v0, Lk91;->k:I

    .line 137
    .line 138
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 139
    .line 140
    iput v2, v0, Lk91;->l:I

    .line 141
    .line 142
    new-array v3, v2, [I

    .line 143
    .line 144
    iput-object v3, v0, Lk91;->m:[I

    .line 145
    .line 146
    :goto_4
    if-ge v1, v2, :cond_7

    .line 147
    .line 148
    iget-boolean v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:Z

    .line 149
    .line 150
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 151
    .line 152
    const/high16 v5, -0x80000000

    .line 153
    .line 154
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 155
    .line 156
    if-eqz v3, :cond_5

    .line 157
    .line 158
    aget-object v3, v6, v1

    .line 159
    .line 160
    invoke-virtual {v3, v5}, Ll91;->f(I)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    if-eq v3, v5, :cond_6

    .line 165
    .line 166
    invoke-virtual {v4}, Lvz;->g()I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    :goto_5
    sub-int/2addr v3, v4

    .line 171
    goto :goto_6

    .line 172
    :cond_5
    aget-object v3, v6, v1

    .line 173
    .line 174
    invoke-virtual {v3, v5}, Ll91;->h(I)I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-eq v3, v5, :cond_6

    .line 179
    .line 180
    invoke-virtual {v4}, Lvz;->k()I

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    goto :goto_5

    .line 185
    :cond_6
    :goto_6
    iget-object v4, v0, Lk91;->m:[I

    .line 186
    .line 187
    aput v3, v4, v1

    .line 188
    .line 189
    add-int/lit8 v1, v1, 0x1

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_7
    return-object v0

    .line 193
    :cond_8
    iput v3, v0, Lk91;->j:I

    .line 194
    .line 195
    iput v3, v0, Lk91;->k:I

    .line 196
    .line 197
    iput v1, v0, Lk91;->l:I

    .line 198
    .line 199
    return-object v0
.end method

.method public final a0(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s0()Z

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Lpy0;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final c()Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final e(Lqy0;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Li91;

    .line 2
    .line 3
    return p0
.end method

.method public final g(IILzy0;Lwk;)V
    .locals 6

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move p1, p2

    .line 7
    :goto_0
    invoke-virtual {p0}, Lpy0;->u()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_7

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    goto :goto_4

    .line 16
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J0(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:[I

    .line 20
    .line 21
    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    array-length p1, p1

    .line 26
    if-ge p1, p2, :cond_3

    .line 27
    .line 28
    :cond_2
    new-array p1, p2, [I

    .line 29
    .line 30
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:[I

    .line 31
    .line 32
    :cond_3
    const/4 p1, 0x0

    .line 33
    move v0, p1

    .line 34
    move v1, v0

    .line 35
    :goto_1
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 36
    .line 37
    if-ge v0, p2, :cond_6

    .line 38
    .line 39
    iget v3, v2, Ljh0;->d:I

    .line 40
    .line 41
    const/4 v4, -0x1

    .line 42
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 43
    .line 44
    if-ne v3, v4, :cond_4

    .line 45
    .line 46
    iget v2, v2, Ljh0;->f:I

    .line 47
    .line 48
    aget-object v3, v5, v0

    .line 49
    .line 50
    invoke-virtual {v3, v2}, Ll91;->h(I)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    sub-int/2addr v2, v3

    .line 55
    goto :goto_2

    .line 56
    :cond_4
    aget-object v3, v5, v0

    .line 57
    .line 58
    iget v4, v2, Ljh0;->g:I

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ll91;->f(I)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    iget v2, v2, Ljh0;->g:I

    .line 65
    .line 66
    sub-int v2, v3, v2

    .line 67
    .line 68
    :goto_2
    if-ltz v2, :cond_5

    .line 69
    .line 70
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:[I

    .line 71
    .line 72
    aput v2, v3, v1

    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_6
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:[I

    .line 80
    .line 81
    invoke-static {p2, p1, v1}, Ljava/util/Arrays;->sort([III)V

    .line 82
    .line 83
    .line 84
    :goto_3
    if-ge p1, v1, :cond_7

    .line 85
    .line 86
    iget p2, v2, Ljh0;->c:I

    .line 87
    .line 88
    if-ltz p2, :cond_7

    .line 89
    .line 90
    invoke-virtual {p3}, Lzy0;->b()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-ge p2, v0, :cond_7

    .line 95
    .line 96
    iget p2, v2, Ljh0;->c:I

    .line 97
    .line 98
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:[I

    .line 99
    .line 100
    aget v0, v0, p1

    .line 101
    .line 102
    invoke-virtual {p4, p2, v0}, Lwk;->a(II)V

    .line 103
    .line 104
    .line 105
    iget p2, v2, Ljh0;->c:I

    .line 106
    .line 107
    iget v0, v2, Ljh0;->d:I

    .line 108
    .line 109
    add-int/2addr p2, v0

    .line 110
    iput p2, v2, Ljh0;->c:I

    .line 111
    .line 112
    add-int/lit8 p1, p1, 0x1

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_7
    :goto_4
    return-void
.end method

.method public final h0(ILvy0;Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O0(ILvy0;Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final i(Lzy0;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 10
    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 22
    .line 23
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    move-object v1, p1

    .line 27
    invoke-static/range {v1 .. v6}, Lml;->j(Lzy0;Lvz;Landroid/view/View;Landroid/view/View;Lpy0;Z)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final i0(ILvy0;Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O0(ILvy0;Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final j(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final k(Lzy0;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 10
    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 22
    .line 23
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    move-object v1, p1

    .line 27
    invoke-static/range {v1 .. v6}, Lml;->l(Lzy0;Lvz;Landroid/view/View;Landroid/view/View;Lpy0;Z)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final l(Lzy0;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 10
    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 22
    .line 23
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    move-object v1, p1

    .line 27
    invoke-static/range {v1 .. v6}, Lml;->j(Lzy0;Lvz;Landroid/view/View;Landroid/view/View;Lpy0;Z)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final l0(Landroid/graphics/Rect;II)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lpy0;->A()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lpy0;->B()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v1, v0

    .line 10
    invoke-virtual {p0}, Lpy0;->C()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Lpy0;->z()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, v0

    .line 19
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    iget v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 23
    .line 24
    if-ne v0, v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    add-int/2addr p1, v2

    .line 31
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getMinimumHeight()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {p3, p1, v0}, Lpy0;->f(III)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 44
    .line 45
    mul-int/2addr p3, v4

    .line 46
    add-int/2addr p3, v1

    .line 47
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getMinimumWidth()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {p2, p3, v0}, Lpy0;->f(III)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    add-int/2addr p1, v1

    .line 63
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 64
    .line 65
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getMinimumWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {p2, p1, v0}, Lpy0;->f(III)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 76
    .line 77
    mul-int/2addr p1, v4

    .line 78
    add-int/2addr p1, v2

    .line 79
    iget-object v0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getMinimumHeight()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-static {p3, p1, v0}, Lpy0;->f(III)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    :goto_0
    iget-object p0, p0, Lpy0;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 90
    .line 91
    invoke-static {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->d(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final m(Lzy0;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t0(Lzy0;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final n(Lzy0;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 10
    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 22
    .line 23
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    move-object v1, p1

    .line 27
    invoke-static/range {v1 .. v6}, Lml;->l(Lzy0;Lvz;Landroid/view/View;Landroid/view/View;Lpy0;Z)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final q()Lqy0;
    .locals 2

    .line 1
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Li91;

    .line 8
    .line 9
    invoke-direct {p0, v1, v0}, Lqy0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Li91;

    .line 14
    .line 15
    invoke-direct {p0, v0, v1}, Lqy0;-><init>(II)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final r(Landroid/content/Context;Landroid/util/AttributeSet;)Lqy0;
    .locals 0

    .line 1
    new-instance p0, Li91;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lqy0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final r0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Lk91;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final s(Landroid/view/ViewGroup$LayoutParams;)Lqy0;
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Li91;

    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lqy0;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Li91;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lqy0;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final s0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:I

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-boolean v0, p0, Lpy0;->f:Z

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z0()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A0()I

    .line 34
    .line 35
    .line 36
    :goto_0
    if-nez v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E0()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 45
    .line 46
    iget-object v1, v0, Lxn0;->k:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v1, [I

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    const/4 v2, -0x1

    .line 53
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 54
    .line 55
    .line 56
    :cond_2
    const/4 v1, 0x0

    .line 57
    iput-object v1, v0, Lxn0;->l:Ljava/lang/Object;

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    iput-boolean v0, p0, Lpy0;->e:Z

    .line 61
    .line 62
    invoke-virtual {p0}, Lpy0;->g0()V

    .line 63
    .line 64
    .line 65
    return v0

    .line 66
    :cond_3
    :goto_1
    return v1
.end method

.method public final t0(Lzy0;)I
    .locals 8

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 10
    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w0(Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v0(Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 22
    .line 23
    iget-boolean v7, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 24
    .line 25
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 26
    .line 27
    move-object v5, p0

    .line 28
    move-object v1, p1

    .line 29
    invoke-static/range {v1 .. v7}, Lml;->k(Lzy0;Lvz;Landroid/view/View;Landroid/view/View;Lpy0;ZZ)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public final u0(Lvy0;Ljh0;Lzy0;)I
    .locals 24

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
    iget-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:Ljava/util/BitSet;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    iget v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 11
    .line 12
    const/4 v6, 0x1

    .line 13
    invoke-virtual {v3, v4, v5, v6}, Ljava/util/BitSet;->set(IIZ)V

    .line 14
    .line 15
    .line 16
    iget-object v7, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Ljh0;

    .line 17
    .line 18
    iget-boolean v8, v7, Ljh0;->i:Z

    .line 19
    .line 20
    if-eqz v8, :cond_1

    .line 21
    .line 22
    iget v8, v2, Ljh0;->e:I

    .line 23
    .line 24
    if-ne v8, v6, :cond_0

    .line 25
    .line 26
    const v11, 0x7fffffff

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/high16 v11, -0x80000000

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget v8, v2, Ljh0;->e:I

    .line 34
    .line 35
    if-ne v8, v6, :cond_2

    .line 36
    .line 37
    iget v11, v2, Ljh0;->g:I

    .line 38
    .line 39
    iget v12, v2, Ljh0;->b:I

    .line 40
    .line 41
    add-int/2addr v11, v12

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget v11, v2, Ljh0;->f:I

    .line 44
    .line 45
    iget v12, v2, Ljh0;->b:I

    .line 46
    .line 47
    sub-int/2addr v11, v12

    .line 48
    :goto_0
    move v12, v4

    .line 49
    :goto_1
    iget-object v13, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p:[Ll91;

    .line 50
    .line 51
    if-ge v12, v5, :cond_4

    .line 52
    .line 53
    aget-object v14, v13, v12

    .line 54
    .line 55
    iget-object v14, v14, Ll91;->a:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result v14

    .line 61
    if-eqz v14, :cond_3

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    aget-object v13, v13, v12

    .line 65
    .line 66
    invoke-virtual {v0, v13, v8, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->R0(Ll91;II)V

    .line 67
    .line 68
    .line 69
    :goto_2
    add-int/lit8 v12, v12, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    iget-boolean v8, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:Z

    .line 73
    .line 74
    iget-object v12, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 75
    .line 76
    if-eqz v8, :cond_5

    .line 77
    .line 78
    invoke-virtual {v12}, Lvz;->g()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    goto :goto_3

    .line 83
    :cond_5
    invoke-virtual {v12}, Lvz;->k()I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    :goto_3
    move v14, v4

    .line 88
    :goto_4
    iget v15, v2, Ljh0;->c:I

    .line 89
    .line 90
    if-ltz v15, :cond_1d

    .line 91
    .line 92
    invoke-virtual/range {p3 .. p3}, Lzy0;->b()I

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    if-ge v15, v9, :cond_1d

    .line 97
    .line 98
    iget-boolean v9, v7, Ljh0;->i:Z

    .line 99
    .line 100
    if-nez v9, :cond_6

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/util/BitSet;->isEmpty()Z

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    if-nez v9, :cond_1d

    .line 107
    .line 108
    :cond_6
    iget v9, v2, Ljh0;->c:I

    .line 109
    .line 110
    const-wide v14, 0x7fffffffffffffffL

    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, v9, v14, v15}, Lvy0;->i(IJ)Lmu0;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    iget-object v9, v9, Lmu0;->a:Landroid/view/View;

    .line 120
    .line 121
    iget v14, v2, Ljh0;->c:I

    .line 122
    .line 123
    iget v15, v2, Ljh0;->d:I

    .line 124
    .line 125
    add-int/2addr v14, v15

    .line 126
    iput v14, v2, Ljh0;->c:I

    .line 127
    .line 128
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 129
    .line 130
    .line 131
    move-result-object v14

    .line 132
    check-cast v14, Li91;

    .line 133
    .line 134
    iget-object v15, v14, Lqy0;->a:Lmu0;

    .line 135
    .line 136
    invoke-virtual {v15}, Lmu0;->c()I

    .line 137
    .line 138
    .line 139
    move-result v15

    .line 140
    iget-object v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Lxn0;

    .line 141
    .line 142
    iget-object v6, v4, Lxn0;->k:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v6, [I

    .line 145
    .line 146
    if-eqz v6, :cond_8

    .line 147
    .line 148
    array-length v10, v6

    .line 149
    if-lt v15, v10, :cond_7

    .line 150
    .line 151
    goto :goto_6

    .line 152
    :cond_7
    aget v6, v6, v15

    .line 153
    .line 154
    :goto_5
    const/4 v10, -0x1

    .line 155
    goto :goto_7

    .line 156
    :cond_8
    :goto_6
    const/4 v6, -0x1

    .line 157
    goto :goto_5

    .line 158
    :goto_7
    if-ne v6, v10, :cond_f

    .line 159
    .line 160
    iget v6, v2, Ljh0;->e:I

    .line 161
    .line 162
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I0(I)Z

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    if-eqz v6, :cond_9

    .line 167
    .line 168
    add-int/lit8 v6, v5, -0x1

    .line 169
    .line 170
    move/from16 v18, v5

    .line 171
    .line 172
    move/from16 v19, v6

    .line 173
    .line 174
    const/4 v5, -0x1

    .line 175
    const/4 v10, -0x1

    .line 176
    goto :goto_8

    .line 177
    :cond_9
    move/from16 v18, v5

    .line 178
    .line 179
    const/4 v10, 0x1

    .line 180
    const/16 v19, 0x0

    .line 181
    .line 182
    :goto_8
    iget v6, v2, Ljh0;->e:I

    .line 183
    .line 184
    const/16 v20, 0x0

    .line 185
    .line 186
    move/from16 v21, v10

    .line 187
    .line 188
    const/4 v10, 0x1

    .line 189
    if-ne v6, v10, :cond_d

    .line 190
    .line 191
    invoke-virtual {v12}, Lvz;->k()I

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    move-object/from16 v22, v13

    .line 196
    .line 197
    move/from16 v10, v19

    .line 198
    .line 199
    const v13, 0x7fffffff

    .line 200
    .line 201
    .line 202
    :goto_9
    if-eq v10, v5, :cond_b

    .line 203
    .line 204
    move/from16 v19, v10

    .line 205
    .line 206
    aget-object v10, v22, v19

    .line 207
    .line 208
    move-object/from16 v23, v3

    .line 209
    .line 210
    invoke-virtual {v10, v6}, Ll91;->f(I)I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    if-ge v3, v13, :cond_a

    .line 215
    .line 216
    move v13, v3

    .line 217
    move-object/from16 v20, v10

    .line 218
    .line 219
    :cond_a
    add-int v10, v19, v21

    .line 220
    .line 221
    move-object/from16 v3, v23

    .line 222
    .line 223
    goto :goto_9

    .line 224
    :cond_b
    move-object/from16 v23, v3

    .line 225
    .line 226
    :cond_c
    move-object/from16 v3, v20

    .line 227
    .line 228
    goto :goto_b

    .line 229
    :cond_d
    move-object/from16 v23, v3

    .line 230
    .line 231
    move-object/from16 v22, v13

    .line 232
    .line 233
    invoke-virtual {v12}, Lvz;->g()I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    move/from16 v6, v19

    .line 238
    .line 239
    const/high16 v10, -0x80000000

    .line 240
    .line 241
    :goto_a
    if-eq v6, v5, :cond_c

    .line 242
    .line 243
    aget-object v13, v22, v6

    .line 244
    .line 245
    move/from16 v19, v5

    .line 246
    .line 247
    invoke-virtual {v13, v3}, Ll91;->h(I)I

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-le v5, v10, :cond_e

    .line 252
    .line 253
    move v10, v5

    .line 254
    move-object/from16 v20, v13

    .line 255
    .line 256
    :cond_e
    add-int v6, v6, v21

    .line 257
    .line 258
    move/from16 v5, v19

    .line 259
    .line 260
    goto :goto_a

    .line 261
    :goto_b
    invoke-virtual {v4, v15}, Lxn0;->h(I)V

    .line 262
    .line 263
    .line 264
    iget-object v4, v4, Lxn0;->k:Ljava/lang/Object;

    .line 265
    .line 266
    check-cast v4, [I

    .line 267
    .line 268
    iget v5, v3, Ll91;->e:I

    .line 269
    .line 270
    aput v5, v4, v15

    .line 271
    .line 272
    goto :goto_c

    .line 273
    :cond_f
    move-object/from16 v23, v3

    .line 274
    .line 275
    move/from16 v18, v5

    .line 276
    .line 277
    move-object/from16 v22, v13

    .line 278
    .line 279
    aget-object v3, v22, v6

    .line 280
    .line 281
    :goto_c
    iput-object v3, v14, Li91;->e:Ll91;

    .line 282
    .line 283
    iget v4, v2, Ljh0;->e:I

    .line 284
    .line 285
    const/4 v10, 0x1

    .line 286
    if-ne v4, v10, :cond_10

    .line 287
    .line 288
    const/4 v4, -0x1

    .line 289
    const/4 v5, 0x0

    .line 290
    invoke-virtual {v0, v9, v4, v5}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 291
    .line 292
    .line 293
    goto :goto_d

    .line 294
    :cond_10
    const/4 v5, 0x0

    .line 295
    invoke-virtual {v0, v9, v5, v5}, Lpy0;->a(Landroid/view/View;IZ)V

    .line 296
    .line 297
    .line 298
    :goto_d
    iget v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 299
    .line 300
    if-ne v4, v10, :cond_11

    .line 301
    .line 302
    iget v6, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 303
    .line 304
    iget v13, v0, Lpy0;->k:I

    .line 305
    .line 306
    iget v15, v14, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 307
    .line 308
    invoke-static {v5, v6, v13, v5, v15}, Lpy0;->v(ZIIII)I

    .line 309
    .line 310
    .line 311
    move-result v6

    .line 312
    iget v5, v0, Lpy0;->n:I

    .line 313
    .line 314
    iget v13, v0, Lpy0;->l:I

    .line 315
    .line 316
    invoke-virtual {v0}, Lpy0;->C()I

    .line 317
    .line 318
    .line 319
    move-result v15

    .line 320
    invoke-virtual {v0}, Lpy0;->z()I

    .line 321
    .line 322
    .line 323
    move-result v17

    .line 324
    add-int v15, v17, v15

    .line 325
    .line 326
    iget v1, v14, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 327
    .line 328
    invoke-static {v10, v5, v13, v15, v1}, Lpy0;->v(ZIIII)I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    invoke-virtual {v0, v9, v6, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G0(Landroid/view/View;II)V

    .line 333
    .line 334
    .line 335
    goto :goto_e

    .line 336
    :cond_11
    iget v1, v0, Lpy0;->m:I

    .line 337
    .line 338
    iget v5, v0, Lpy0;->k:I

    .line 339
    .line 340
    invoke-virtual {v0}, Lpy0;->A()I

    .line 341
    .line 342
    .line 343
    move-result v6

    .line 344
    invoke-virtual {v0}, Lpy0;->B()I

    .line 345
    .line 346
    .line 347
    move-result v13

    .line 348
    add-int/2addr v13, v6

    .line 349
    iget v6, v14, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 350
    .line 351
    invoke-static {v10, v1, v5, v13, v6}, Lpy0;->v(ZIIII)I

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    iget v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 356
    .line 357
    iget v6, v0, Lpy0;->l:I

    .line 358
    .line 359
    iget v13, v14, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 360
    .line 361
    const/4 v15, 0x0

    .line 362
    invoke-static {v15, v5, v6, v15, v13}, Lpy0;->v(ZIIII)I

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    invoke-virtual {v0, v9, v1, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G0(Landroid/view/View;II)V

    .line 367
    .line 368
    .line 369
    :goto_e
    iget v1, v2, Ljh0;->e:I

    .line 370
    .line 371
    if-ne v1, v10, :cond_12

    .line 372
    .line 373
    invoke-virtual {v3, v8}, Ll91;->f(I)I

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    invoke-virtual {v12, v9}, Lvz;->c(Landroid/view/View;)I

    .line 378
    .line 379
    .line 380
    move-result v5

    .line 381
    add-int/2addr v5, v1

    .line 382
    goto :goto_f

    .line 383
    :cond_12
    invoke-virtual {v3, v8}, Ll91;->h(I)I

    .line 384
    .line 385
    .line 386
    move-result v5

    .line 387
    invoke-virtual {v12, v9}, Lvz;->c(Landroid/view/View;)I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    sub-int v1, v5, v1

    .line 392
    .line 393
    :goto_f
    iget v6, v2, Ljh0;->e:I

    .line 394
    .line 395
    iget-object v13, v14, Li91;->e:Ll91;

    .line 396
    .line 397
    if-ne v6, v10, :cond_16

    .line 398
    .line 399
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 403
    .line 404
    .line 405
    move-result-object v6

    .line 406
    check-cast v6, Li91;

    .line 407
    .line 408
    iput-object v13, v6, Li91;->e:Ll91;

    .line 409
    .line 410
    iget-object v14, v13, Ll91;->a:Ljava/util/ArrayList;

    .line 411
    .line 412
    invoke-virtual {v14, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 413
    .line 414
    .line 415
    const/high16 v15, -0x80000000

    .line 416
    .line 417
    iput v15, v13, Ll91;->c:I

    .line 418
    .line 419
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    .line 420
    .line 421
    .line 422
    move-result v14

    .line 423
    if-ne v14, v10, :cond_13

    .line 424
    .line 425
    iput v15, v13, Ll91;->b:I

    .line 426
    .line 427
    :cond_13
    iget-object v10, v6, Lqy0;->a:Lmu0;

    .line 428
    .line 429
    invoke-virtual {v10}, Lmu0;->i()Z

    .line 430
    .line 431
    .line 432
    move-result v10

    .line 433
    if-nez v10, :cond_14

    .line 434
    .line 435
    iget-object v6, v6, Lqy0;->a:Lmu0;

    .line 436
    .line 437
    invoke-virtual {v6}, Lmu0;->l()Z

    .line 438
    .line 439
    .line 440
    move-result v6

    .line 441
    if-eqz v6, :cond_15

    .line 442
    .line 443
    :cond_14
    iget v6, v13, Ll91;->d:I

    .line 444
    .line 445
    iget-object v10, v13, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 446
    .line 447
    iget-object v10, v10, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 448
    .line 449
    invoke-virtual {v10, v9}, Lvz;->c(Landroid/view/View;)I

    .line 450
    .line 451
    .line 452
    move-result v10

    .line 453
    add-int/2addr v10, v6

    .line 454
    iput v10, v13, Ll91;->d:I

    .line 455
    .line 456
    :cond_15
    const/high16 v15, -0x80000000

    .line 457
    .line 458
    goto :goto_10

    .line 459
    :cond_16
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 460
    .line 461
    .line 462
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 463
    .line 464
    .line 465
    move-result-object v6

    .line 466
    check-cast v6, Li91;

    .line 467
    .line 468
    iput-object v13, v6, Li91;->e:Ll91;

    .line 469
    .line 470
    iget-object v10, v13, Ll91;->a:Ljava/util/ArrayList;

    .line 471
    .line 472
    const/4 v15, 0x0

    .line 473
    invoke-virtual {v10, v15, v9}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 474
    .line 475
    .line 476
    const/high16 v15, -0x80000000

    .line 477
    .line 478
    iput v15, v13, Ll91;->b:I

    .line 479
    .line 480
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 481
    .line 482
    .line 483
    move-result v10

    .line 484
    const/4 v14, 0x1

    .line 485
    if-ne v10, v14, :cond_17

    .line 486
    .line 487
    iput v15, v13, Ll91;->c:I

    .line 488
    .line 489
    :cond_17
    iget-object v10, v6, Lqy0;->a:Lmu0;

    .line 490
    .line 491
    invoke-virtual {v10}, Lmu0;->i()Z

    .line 492
    .line 493
    .line 494
    move-result v10

    .line 495
    if-nez v10, :cond_18

    .line 496
    .line 497
    iget-object v6, v6, Lqy0;->a:Lmu0;

    .line 498
    .line 499
    invoke-virtual {v6}, Lmu0;->l()Z

    .line 500
    .line 501
    .line 502
    move-result v6

    .line 503
    if-eqz v6, :cond_19

    .line 504
    .line 505
    :cond_18
    iget v6, v13, Ll91;->d:I

    .line 506
    .line 507
    iget-object v10, v13, Ll91;->f:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 508
    .line 509
    iget-object v10, v10, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 510
    .line 511
    invoke-virtual {v10, v9}, Lvz;->c(Landroid/view/View;)I

    .line 512
    .line 513
    .line 514
    move-result v10

    .line 515
    add-int/2addr v10, v6

    .line 516
    iput v10, v13, Ll91;->d:I

    .line 517
    .line 518
    :cond_19
    :goto_10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F0()Z

    .line 519
    .line 520
    .line 521
    move-result v6

    .line 522
    iget-object v10, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r:Lvz;

    .line 523
    .line 524
    if-eqz v6, :cond_1a

    .line 525
    .line 526
    const/4 v14, 0x1

    .line 527
    if-ne v4, v14, :cond_1a

    .line 528
    .line 529
    invoke-virtual {v10}, Lvz;->g()I

    .line 530
    .line 531
    .line 532
    move-result v6

    .line 533
    add-int/lit8 v13, v18, -0x1

    .line 534
    .line 535
    iget v14, v3, Ll91;->e:I

    .line 536
    .line 537
    sub-int/2addr v13, v14

    .line 538
    iget v14, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 539
    .line 540
    mul-int/2addr v13, v14

    .line 541
    sub-int/2addr v6, v13

    .line 542
    invoke-virtual {v10, v9}, Lvz;->c(Landroid/view/View;)I

    .line 543
    .line 544
    .line 545
    move-result v10

    .line 546
    sub-int v10, v6, v10

    .line 547
    .line 548
    :goto_11
    const/4 v14, 0x1

    .line 549
    goto :goto_12

    .line 550
    :cond_1a
    iget v6, v3, Ll91;->e:I

    .line 551
    .line 552
    iget v13, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:I

    .line 553
    .line 554
    mul-int/2addr v6, v13

    .line 555
    invoke-virtual {v10}, Lvz;->k()I

    .line 556
    .line 557
    .line 558
    move-result v13

    .line 559
    add-int/2addr v6, v13

    .line 560
    invoke-virtual {v10, v9}, Lvz;->c(Landroid/view/View;)I

    .line 561
    .line 562
    .line 563
    move-result v10

    .line 564
    add-int/2addr v10, v6

    .line 565
    move v14, v10

    .line 566
    move v10, v6

    .line 567
    move v6, v14

    .line 568
    goto :goto_11

    .line 569
    :goto_12
    if-ne v4, v14, :cond_1b

    .line 570
    .line 571
    invoke-static {v9, v10, v1, v6, v5}, Lpy0;->J(Landroid/view/View;IIII)V

    .line 572
    .line 573
    .line 574
    goto :goto_13

    .line 575
    :cond_1b
    invoke-static {v9, v1, v10, v5, v6}, Lpy0;->J(Landroid/view/View;IIII)V

    .line 576
    .line 577
    .line 578
    :goto_13
    iget v1, v7, Ljh0;->e:I

    .line 579
    .line 580
    invoke-virtual {v0, v3, v1, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->R0(Ll91;II)V

    .line 581
    .line 582
    .line 583
    move-object/from16 v1, p1

    .line 584
    .line 585
    invoke-virtual {v0, v1, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K0(Lvy0;Ljh0;)V

    .line 586
    .line 587
    .line 588
    iget-boolean v4, v7, Ljh0;->h:Z

    .line 589
    .line 590
    if-eqz v4, :cond_1c

    .line 591
    .line 592
    invoke-virtual {v9}, Landroid/view/View;->hasFocusable()Z

    .line 593
    .line 594
    .line 595
    move-result v4

    .line 596
    if-eqz v4, :cond_1c

    .line 597
    .line 598
    iget v3, v3, Ll91;->e:I

    .line 599
    .line 600
    move-object/from16 v4, v23

    .line 601
    .line 602
    const/4 v5, 0x0

    .line 603
    invoke-virtual {v4, v3, v5}, Ljava/util/BitSet;->set(IZ)V

    .line 604
    .line 605
    .line 606
    goto :goto_14

    .line 607
    :cond_1c
    move-object/from16 v4, v23

    .line 608
    .line 609
    :goto_14
    move-object v3, v4

    .line 610
    move v6, v14

    .line 611
    move/from16 v5, v18

    .line 612
    .line 613
    move-object/from16 v13, v22

    .line 614
    .line 615
    const/4 v4, 0x0

    .line 616
    goto/16 :goto_4

    .line 617
    .line 618
    :cond_1d
    if-nez v14, :cond_1e

    .line 619
    .line 620
    invoke-virtual {v0, v1, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K0(Lvy0;Ljh0;)V

    .line 621
    .line 622
    .line 623
    :cond_1e
    iget v1, v7, Ljh0;->e:I

    .line 624
    .line 625
    const/4 v4, -0x1

    .line 626
    if-ne v1, v4, :cond_1f

    .line 627
    .line 628
    invoke-virtual {v12}, Lvz;->k()I

    .line 629
    .line 630
    .line 631
    move-result v1

    .line 632
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C0(I)I

    .line 633
    .line 634
    .line 635
    move-result v0

    .line 636
    invoke-virtual {v12}, Lvz;->k()I

    .line 637
    .line 638
    .line 639
    move-result v1

    .line 640
    sub-int/2addr v1, v0

    .line 641
    goto :goto_15

    .line 642
    :cond_1f
    invoke-virtual {v12}, Lvz;->g()I

    .line 643
    .line 644
    .line 645
    move-result v1

    .line 646
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B0(I)I

    .line 647
    .line 648
    .line 649
    move-result v0

    .line 650
    invoke-virtual {v12}, Lvz;->g()I

    .line 651
    .line 652
    .line 653
    move-result v1

    .line 654
    sub-int v1, v0, v1

    .line 655
    .line 656
    :goto_15
    if-lez v1, :cond_20

    .line 657
    .line 658
    iget v0, v2, Ljh0;->b:I

    .line 659
    .line 660
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 661
    .line 662
    .line 663
    move-result v0

    .line 664
    return v0

    .line 665
    :cond_20
    const/16 v16, 0x0

    .line 666
    .line 667
    return v16
.end method

.method public final v0(Z)Landroid/view/View;
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 2
    .line 3
    invoke-virtual {v0}, Lvz;->k()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Lvz;->g()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lpy0;->u()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    add-int/lit8 v3, v3, -0x1

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    if-ltz v3, :cond_4

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Lpy0;->t(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    invoke-virtual {v0, v5}, Lvz;->e(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    invoke-virtual {v0, v5}, Lvz;->b(Landroid/view/View;)I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    if-le v7, v1, :cond_3

    .line 33
    .line 34
    if-lt v6, v2, :cond_0

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    if-le v7, v2, :cond_2

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    if-nez v4, :cond_3

    .line 43
    .line 44
    move-object v4, v5

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    :goto_1
    return-object v5

    .line 47
    :cond_3
    :goto_2
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_4
    return-object v4
.end method

.method public final w(Lvy0;Lzy0;)I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1, p2}, Lpy0;->w(Lvy0;Lzy0;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final w0(Z)Landroid/view/View;
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 2
    .line 3
    invoke-virtual {v0}, Lvz;->k()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Lvz;->g()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lpy0;->u()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    :goto_0
    if-ge v5, v3, :cond_4

    .line 18
    .line 19
    invoke-virtual {p0, v5}, Lpy0;->t(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {v0, v6}, Lvz;->e(Landroid/view/View;)I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    invoke-virtual {v0, v6}, Lvz;->b(Landroid/view/View;)I

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    if-le v8, v1, :cond_3

    .line 32
    .line 33
    if-lt v7, v2, :cond_0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    if-ge v7, v1, :cond_2

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    if-nez v4, :cond_3

    .line 42
    .line 43
    move-object v4, v6

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    :goto_1
    return-object v6

    .line 46
    :cond_3
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_4
    return-object v4
.end method

.method public final x0(Lvy0;Lzy0;Z)V
    .locals 2

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B0(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 11
    .line 12
    invoke-virtual {v0}, Lvz;->g()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr v0, v1

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    neg-int v1, v0

    .line 20
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O0(ILvy0;Lzy0;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    neg-int p1, p1

    .line 25
    sub-int/2addr v0, p1

    .line 26
    if-eqz p3, :cond_1

    .line 27
    .line 28
    if-lez v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lvz;->o(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public final y0(Lvy0;Lzy0;Z)V
    .locals 2

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C0(I)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 12
    .line 13
    invoke-virtual {v0}, Lvz;->k()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int/2addr v1, v0

    .line 18
    if-lez v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O0(ILvy0;Lzy0;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sub-int/2addr v1, p1

    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q:Lvz;

    .line 30
    .line 31
    neg-int p1, v1

    .line 32
    invoke-virtual {p0, p1}, Lvz;->o(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public final z0()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lpy0;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, v1}, Lpy0;->t(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lpy0;->D(Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
