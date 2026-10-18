.class public final Lfy0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lr3;)V
    .locals 2

    .line 1
    iget v0, p1, Lr3;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 20
    .line 21
    iget v0, p1, Lr3;->b:I

    .line 22
    .line 23
    iget p1, p1, Lr3;->d:I

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lpy0;->T(II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 30
    .line 31
    iget v0, p1, Lr3;->b:I

    .line 32
    .line 33
    iget p1, p1, Lr3;->d:I

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1}, Lpy0;->V(II)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 40
    .line 41
    iget v0, p1, Lr3;->b:I

    .line 42
    .line 43
    iget p1, p1, Lr3;->d:I

    .line 44
    .line 45
    invoke-virtual {p0, v0, p1}, Lpy0;->U(II)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->v:Lpy0;

    .line 50
    .line 51
    iget v0, p1, Lr3;->b:I

    .line 52
    .line 53
    iget p1, p1, Lr3;->d:I

    .line 54
    .line 55
    invoke-virtual {p0, v0, p1}, Lpy0;->R(II)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public b(I)Lmu0;
    .locals 6

    .line 1
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 4
    .line 5
    invoke-virtual {v0}, Lc9;->z()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    move-object v3, v1

    .line 12
    :goto_0
    if-ge v2, v0, :cond_3

    .line 13
    .line 14
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 15
    .line 16
    invoke-virtual {v4, v2}, Lc9;->y(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_2

    .line 25
    .line 26
    invoke-virtual {v4}, Lmu0;->i()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-nez v5, :cond_2

    .line 31
    .line 32
    iget v5, v4, Lmu0;->c:I

    .line 33
    .line 34
    if-eq v5, p1, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 38
    .line 39
    iget-object v5, v4, Lmu0;->a:Landroid/view/View;

    .line 40
    .line 41
    iget-object v3, v3, Lc9;->m:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v3, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    move-object v3, v4

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move-object v3, v4

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    :goto_2
    if-nez v3, :cond_4

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_4
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 62
    .line 63
    iget-object p1, v3, Lmu0;->a:Landroid/view/View;

    .line 64
    .line 65
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p0, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    :goto_3
    return-object v1

    .line 76
    :cond_5
    return-object v3
.end method

.method public c(ILjava/lang/Object;I)V
    .locals 7

    .line 1
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 4
    .line 5
    invoke-virtual {v0}, Lc9;->z()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p3, p1

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    const/4 v2, 0x2

    .line 12
    const/4 v3, 0x1

    .line 13
    if-ge v1, v0, :cond_5

    .line 14
    .line 15
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 16
    .line 17
    invoke-virtual {v4, v1}, Lc9;->y(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    if-eqz v5, :cond_4

    .line 26
    .line 27
    invoke-virtual {v5}, Lmu0;->p()Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-eqz v6, :cond_0

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_0
    iget v6, v5, Lmu0;->c:I

    .line 35
    .line 36
    if-lt v6, p1, :cond_4

    .line 37
    .line 38
    if-ge v6, p3, :cond_4

    .line 39
    .line 40
    invoke-virtual {v5, v2}, Lmu0;->a(I)V

    .line 41
    .line 42
    .line 43
    const/16 v2, 0x400

    .line 44
    .line 45
    if-nez p2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v5, v2}, Lmu0;->a(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    iget v6, v5, Lmu0;->j:I

    .line 52
    .line 53
    and-int/2addr v2, v6

    .line 54
    if-nez v2, :cond_3

    .line 55
    .line 56
    iget-object v2, v5, Lmu0;->k:Ljava/util/ArrayList;

    .line 57
    .line 58
    if-nez v2, :cond_2

    .line 59
    .line 60
    new-instance v2, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v2, v5, Lmu0;->k:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iput-object v2, v5, Lmu0;->l:Ljava/util/List;

    .line 72
    .line 73
    :cond_2
    iget-object v2, v5, Lmu0;->k:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    :cond_3
    :goto_1
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lqy0;

    .line 83
    .line 84
    iput-boolean v3, v2, Lqy0;->c:Z

    .line 85
    .line 86
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 90
    .line 91
    iget-object v0, p2, Lvy0;->c:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    sub-int/2addr v1, v3

    .line 98
    :goto_3
    if-ltz v1, :cond_8

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    check-cast v4, Lmu0;

    .line 105
    .line 106
    if-nez v4, :cond_6

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_6
    iget v5, v4, Lmu0;->c:I

    .line 110
    .line 111
    if-lt v5, p1, :cond_7

    .line 112
    .line 113
    if-ge v5, p3, :cond_7

    .line 114
    .line 115
    invoke-virtual {v4, v2}, Lmu0;->a(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p2, v1}, Lvy0;->e(I)V

    .line 119
    .line 120
    .line 121
    :cond_7
    :goto_4
    add-int/lit8 v1, v1, -0x1

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_8
    iput-boolean v3, p0, Landroidx/recyclerview/widget/RecyclerView;->q0:Z

    .line 125
    .line 126
    return-void
.end method

.method public d(II)V
    .locals 6

    .line 1
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 4
    .line 5
    invoke-virtual {v0}, Lc9;->z()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    const/4 v3, 0x1

    .line 12
    if-ge v2, v0, :cond_1

    .line 13
    .line 14
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 15
    .line 16
    invoke-virtual {v4, v2}, Lc9;->y(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-static {v4}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {v4}, Lmu0;->p()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-nez v5, :cond_0

    .line 31
    .line 32
    iget v5, v4, Lmu0;->c:I

    .line 33
    .line 34
    if-lt v5, p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v4, p2, v1}, Lmu0;->m(IZ)V

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 40
    .line 41
    iput-boolean v3, v4, Lzy0;->e:Z

    .line 42
    .line 43
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 47
    .line 48
    iget-object v0, v0, Lvy0;->c:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    :goto_1
    if-ge v1, v2, :cond_3

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Lmu0;

    .line 61
    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    iget v5, v4, Lmu0;->c:I

    .line 65
    .line 66
    if-lt v5, p1, :cond_2

    .line 67
    .line 68
    invoke-virtual {v4, p2, v3}, Lmu0;->m(IZ)V

    .line 69
    .line 70
    .line 71
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 75
    .line 76
    .line 77
    iput-boolean v3, p0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 78
    .line 79
    return-void
.end method

.method public e(II)V
    .locals 10

    .line 1
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 4
    .line 5
    invoke-virtual {v0}, Lc9;->z()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ge p1, p2, :cond_0

    .line 12
    .line 13
    move v3, p1

    .line 14
    move v4, p2

    .line 15
    move v5, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v4, p1

    .line 18
    move v3, p2

    .line 19
    move v5, v2

    .line 20
    :goto_0
    const/4 v6, 0x0

    .line 21
    move v7, v6

    .line 22
    :goto_1
    if-ge v7, v0, :cond_4

    .line 23
    .line 24
    iget-object v8, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 25
    .line 26
    invoke-virtual {v8, v7}, Lc9;->y(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-static {v8}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    if-eqz v8, :cond_3

    .line 35
    .line 36
    iget v9, v8, Lmu0;->c:I

    .line 37
    .line 38
    if-lt v9, v3, :cond_3

    .line 39
    .line 40
    if-le v9, v4, :cond_1

    .line 41
    .line 42
    goto :goto_3

    .line 43
    :cond_1
    if-ne v9, p1, :cond_2

    .line 44
    .line 45
    sub-int v9, p2, p1

    .line 46
    .line 47
    invoke-virtual {v8, v9, v6}, Lmu0;->m(IZ)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    invoke-virtual {v8, v5, v6}, Lmu0;->m(IZ)V

    .line 52
    .line 53
    .line 54
    :goto_2
    iget-object v8, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 55
    .line 56
    iput-boolean v2, v8, Lzy0;->e:Z

    .line 57
    .line 58
    :cond_3
    :goto_3
    add-int/lit8 v7, v7, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 62
    .line 63
    iget-object v0, v0, Lvy0;->c:Ljava/util/ArrayList;

    .line 64
    .line 65
    if-ge p1, p2, :cond_5

    .line 66
    .line 67
    move v3, p1

    .line 68
    move v4, p2

    .line 69
    goto :goto_4

    .line 70
    :cond_5
    move v4, p1

    .line 71
    move v3, p2

    .line 72
    move v1, v2

    .line 73
    :goto_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    move v7, v6

    .line 78
    :goto_5
    if-ge v7, v5, :cond_9

    .line 79
    .line 80
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    check-cast v8, Lmu0;

    .line 85
    .line 86
    if-eqz v8, :cond_8

    .line 87
    .line 88
    iget v9, v8, Lmu0;->c:I

    .line 89
    .line 90
    if-lt v9, v3, :cond_8

    .line 91
    .line 92
    if-le v9, v4, :cond_6

    .line 93
    .line 94
    goto :goto_6

    .line 95
    :cond_6
    if-ne v9, p1, :cond_7

    .line 96
    .line 97
    sub-int v9, p2, p1

    .line 98
    .line 99
    invoke-virtual {v8, v9, v6}, Lmu0;->m(IZ)V

    .line 100
    .line 101
    .line 102
    goto :goto_6

    .line 103
    :cond_7
    invoke-virtual {v8, v1, v6}, Lmu0;->m(IZ)V

    .line 104
    .line 105
    .line 106
    :cond_8
    :goto_6
    add-int/lit8 v7, v7, 0x1

    .line 107
    .line 108
    goto :goto_5

    .line 109
    :cond_9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 110
    .line 111
    .line 112
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 113
    .line 114
    return-void
.end method

.method public f(Lmu0;Ltw0;Ltw0;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lmu0;->o(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 8
    .line 9
    move-object v1, v0

    .line 10
    check-cast v1, Luv;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget v3, p2, Ltw0;->b:I

    .line 18
    .line 19
    iget v5, p3, Ltw0;->b:I

    .line 20
    .line 21
    if-ne v3, v5, :cond_1

    .line 22
    .line 23
    iget v0, p2, Ltw0;->c:I

    .line 24
    .line 25
    iget v2, p3, Ltw0;->c:I

    .line 26
    .line 27
    if-eq v0, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object v2, p1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget v4, p2, Ltw0;->c:I

    .line 33
    .line 34
    iget v6, p3, Ltw0;->c:I

    .line 35
    .line 36
    move-object v2, p1

    .line 37
    invoke-virtual/range {v1 .. v6}, Luv;->g(Lmu0;IIII)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    invoke-virtual {v1, v2}, Luv;->l(Lmu0;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, v2, Lmu0;->a:Landroid/view/View;

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    iget-object p1, v1, Luv;->i:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    :goto_2
    if-eqz p1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->P()V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public g(Lmu0;Ltw0;Ltw0;)V
    .locals 7

    .line 1
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lvy0;->j(Lmu0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->e(Lmu0;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Lmu0;->o(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->S:Lly0;

    .line 16
    .line 17
    move-object v1, v0

    .line 18
    check-cast v1, Luv;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iget v3, p2, Ltw0;->b:I

    .line 24
    .line 25
    iget v4, p2, Ltw0;->c:I

    .line 26
    .line 27
    iget-object p2, p1, Lmu0;->a:Landroid/view/View;

    .line 28
    .line 29
    if-nez p3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    :goto_0
    move v5, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget v0, p3, Ltw0;->b:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_1
    if-nez p3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    :goto_2
    move v6, p3

    .line 47
    goto :goto_3

    .line 48
    :cond_1
    iget p3, p3, Ltw0;->c:I

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_3
    invoke-virtual {p1}, Lmu0;->i()Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-nez p3, :cond_2

    .line 56
    .line 57
    if-ne v3, v5, :cond_3

    .line 58
    .line 59
    if-eq v4, v6, :cond_2

    .line 60
    .line 61
    goto :goto_4

    .line 62
    :cond_2
    move-object v2, p1

    .line 63
    goto :goto_5

    .line 64
    :cond_3
    :goto_4
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    add-int/2addr p3, v5

    .line 69
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr v0, v6

    .line 74
    invoke-virtual {p2, v5, v6, p3, v0}, Landroid/view/View;->layout(IIII)V

    .line 75
    .line 76
    .line 77
    move-object v2, p1

    .line 78
    invoke-virtual/range {v1 .. v6}, Luv;->g(Lmu0;IIII)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    goto :goto_6

    .line 83
    :goto_5
    invoke-virtual {v1, v2}, Luv;->l(Lmu0;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, v1, Luv;->h:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    const/4 p1, 0x1

    .line 92
    :goto_6
    if-eqz p1, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->P()V

    .line 95
    .line 96
    .line 97
    :cond_4
    return-void
.end method
