.class public final Ls3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 81
    iput v0, p0, Ls3;->a:I

    .line 82
    iput-object p1, p0, Ls3;->b:Ljava/lang/Object;

    .line 83
    invoke-static {}, Lj7;->a()Lj7;

    move-result-object p1

    iput-object p1, p0, Ls3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfy0;)V
    .locals 2

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Lnt0;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    iput-object v0, p0, Ls3;->b:Ljava/lang/Object;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ls3;->c:Ljava/lang/Object;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ls3;->d:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 88
    iput v0, p0, Ls3;->a:I

    .line 89
    iput-object p1, p0, Ls3;->e:Ljava/lang/Object;

    .line 90
    new-instance p1, Lbv1;

    const/16 v0, 0x1c

    invoke-direct {p1, v0, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Ls3;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lt3;Lpa0;Lhi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls3;->b:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Ls3;->d:Ljava/lang/Object;

    .line 7
    .line 8
    sget-object p2, Lu00;->j:Lu00;

    .line 9
    .line 10
    iput-object p2, p0, Ls3;->e:Ljava/lang/Object;

    .line 11
    .line 12
    iput-object p2, p0, Ls3;->f:Ljava/lang/Object;

    .line 13
    .line 14
    new-instance p2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Ls3;->c:Ljava/lang/Object;

    .line 20
    .line 21
    iget-object p2, p1, Lt3;->f:Led0;

    .line 22
    .line 23
    invoke-virtual {p2}, Led0;->g()Ljava/net/URI;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    if-nez p3, :cond_0

    .line 32
    .line 33
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 34
    .line 35
    filled-new-array {p1}, [Ljava/net/Proxy;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget-object p1, p1, Lt3;->e:Ljava/net/ProxySelector;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {p1}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_0
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 65
    .line 66
    filled-new-array {p1}, [Ljava/net/Proxy;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :goto_1
    iput-object p1, p0, Ls3;->e:Ljava/lang/Object;

    .line 75
    .line 76
    const/4 p1, 0x0

    .line 77
    iput p1, p0, Ls3;->a:I

    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    iget-object v0, p0, Ls3;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_6

    .line 10
    .line 11
    iget-object v2, p0, Ls3;->d:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Lqo;

    .line 14
    .line 15
    if-eqz v2, :cond_4

    .line 16
    .line 17
    iget-object v2, p0, Ls3;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Lqo;

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    new-instance v2, Lqo;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Ls3;->f:Ljava/lang/Object;

    .line 29
    .line 30
    :cond_0
    const/4 v3, 0x0

    .line 31
    iput-object v3, v2, Lqo;->c:Ljava/lang/Object;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    iput-boolean v4, v2, Lqo;->b:Z

    .line 35
    .line 36
    iput-object v3, v2, Lqo;->d:Ljava/io/Serializable;

    .line 37
    .line 38
    iput-boolean v4, v2, Lqo;->a:Z

    .line 39
    .line 40
    sget-object v3, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 41
    .line 42
    invoke-static {v0}, Loh1;->g(Landroid/view/View;)Landroid/content/res/ColorStateList;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/4 v4, 0x1

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    iput-boolean v4, v2, Lqo;->b:Z

    .line 50
    .line 51
    iput-object v3, v2, Lqo;->c:Ljava/lang/Object;

    .line 52
    .line 53
    :cond_1
    invoke-static {v0}, Loh1;->h(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    iput-boolean v4, v2, Lqo;->a:Z

    .line 60
    .line 61
    iput-object v3, v2, Lqo;->d:Ljava/io/Serializable;

    .line 62
    .line 63
    :cond_2
    iget-boolean v3, v2, Lqo;->b:Z

    .line 64
    .line 65
    if-nez v3, :cond_3

    .line 66
    .line 67
    iget-boolean v3, v2, Lqo;->a:Z

    .line 68
    .line 69
    if-eqz v3, :cond_4

    .line 70
    .line 71
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 76
    .line 77
    invoke-static {v1, v2, p0}, Lw01;->i(Landroid/graphics/drawable/Drawable;Lqo;[I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    iget-object v2, p0, Ls3;->e:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v2, Lqo;

    .line 84
    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget-object v0, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 92
    .line 93
    invoke-static {v1, v2, p0}, Lw01;->i(Landroid/graphics/drawable/Drawable;Lqo;[I)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_5
    iget-object p0, p0, Ls3;->d:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast p0, Lqo;

    .line 100
    .line 101
    if-eqz p0, :cond_6

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget-object v2, Lj7;->b:Landroid/graphics/PorterDuff$Mode;

    .line 108
    .line 109
    invoke-static {v1, p0, v0}, Lw01;->i(Landroid/graphics/drawable/Drawable;Lqo;[I)V

    .line 110
    .line 111
    .line 112
    :cond_6
    return-void
.end method

.method public b(I)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ls3;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_3

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    check-cast v4, Lr3;

    .line 18
    .line 19
    iget v5, v4, Lr3;->a:I

    .line 20
    .line 21
    const/16 v6, 0x8

    .line 22
    .line 23
    const/4 v7, 0x1

    .line 24
    if-ne v5, v6, :cond_0

    .line 25
    .line 26
    iget v4, v4, Lr3;->d:I

    .line 27
    .line 28
    add-int/lit8 v5, v3, 0x1

    .line 29
    .line 30
    invoke-virtual {p0, v4, v5}, Ls3;->g(II)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-ne v4, p1, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    if-ne v5, v7, :cond_2

    .line 38
    .line 39
    iget v5, v4, Lr3;->b:I

    .line 40
    .line 41
    iget v4, v4, Lr3;->d:I

    .line 42
    .line 43
    add-int/2addr v4, v5

    .line 44
    :goto_1
    if-ge v5, v4, :cond_2

    .line 45
    .line 46
    add-int/lit8 v6, v3, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, v5, v6}, Ls3;->g(II)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-ne v6, p1, :cond_1

    .line 53
    .line 54
    :goto_2
    return v7

    .line 55
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    return v2
.end method

.method public c()V
    .locals 6

    .line 1
    iget-object v0, p0, Ls3;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_0

    .line 12
    .line 13
    iget-object v4, p0, Ls3;->e:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v4, Lfy0;

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    check-cast v5, Lr3;

    .line 22
    .line 23
    invoke-virtual {v4, v5}, Lfy0;->a(Lr3;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0, v0}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    iput v2, p0, Ls3;->a:I

    .line 33
    .line 34
    return-void
.end method

.method public d()V
    .locals 9

    .line 1
    iget-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lfy0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ls3;->c()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ls3;->c:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    move v4, v3

    .line 18
    :goto_0
    if-ge v4, v2, :cond_4

    .line 19
    .line 20
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    check-cast v5, Lr3;

    .line 25
    .line 26
    iget v6, v5, Lr3;->a:I

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    if-eq v6, v7, :cond_3

    .line 30
    .line 31
    const/4 v8, 0x2

    .line 32
    if-eq v6, v8, :cond_2

    .line 33
    .line 34
    const/4 v7, 0x4

    .line 35
    if-eq v6, v7, :cond_1

    .line 36
    .line 37
    const/16 v7, 0x8

    .line 38
    .line 39
    if-eq v6, v7, :cond_0

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-virtual {v0, v5}, Lfy0;->a(Lr3;)V

    .line 43
    .line 44
    .line 45
    iget v6, v5, Lr3;->b:I

    .line 46
    .line 47
    iget v5, v5, Lr3;->d:I

    .line 48
    .line 49
    invoke-virtual {v0, v6, v5}, Lfy0;->e(II)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v0, v5}, Lfy0;->a(Lr3;)V

    .line 54
    .line 55
    .line 56
    iget v6, v5, Lr3;->b:I

    .line 57
    .line 58
    iget v7, v5, Lr3;->d:I

    .line 59
    .line 60
    iget-object v5, v5, Lr3;->c:Ljava/lang/Object;

    .line 61
    .line 62
    invoke-virtual {v0, v6, v5, v7}, Lfy0;->c(ILjava/lang/Object;I)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {v0, v5}, Lfy0;->a(Lr3;)V

    .line 67
    .line 68
    .line 69
    iget v6, v5, Lr3;->b:I

    .line 70
    .line 71
    iget v5, v5, Lr3;->d:I

    .line 72
    .line 73
    iget-object v8, v0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 74
    .line 75
    invoke-virtual {v8, v7, v6, v5}, Landroidx/recyclerview/widget/RecyclerView;->L(ZII)V

    .line 76
    .line 77
    .line 78
    iput-boolean v7, v8, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 79
    .line 80
    iget-object v6, v8, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 81
    .line 82
    iget v7, v6, Lzy0;->b:I

    .line 83
    .line 84
    add-int/2addr v7, v5

    .line 85
    iput v7, v6, Lzy0;->b:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    invoke-virtual {v0, v5}, Lfy0;->a(Lr3;)V

    .line 89
    .line 90
    .line 91
    iget v6, v5, Lr3;->b:I

    .line 92
    .line 93
    iget v5, v5, Lr3;->d:I

    .line 94
    .line 95
    invoke-virtual {v0, v6, v5}, Lfy0;->d(II)V

    .line 96
    .line 97
    .line 98
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    invoke-virtual {p0, v1}, Ls3;->r(Ljava/util/ArrayList;)V

    .line 102
    .line 103
    .line 104
    iput v3, p0, Ls3;->a:I

    .line 105
    .line 106
    return-void
.end method

.method public e(Lr3;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ls3;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lnt0;

    .line 4
    .line 5
    iget v1, p1, Lr3;->a:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq v1, v2, :cond_8

    .line 9
    .line 10
    const/16 v3, 0x8

    .line 11
    .line 12
    if-eq v1, v3, :cond_8

    .line 13
    .line 14
    iget v3, p1, Lr3;->b:I

    .line 15
    .line 16
    invoke-virtual {p0, v3, v1}, Ls3;->v(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v3, p1, Lr3;->b:I

    .line 21
    .line 22
    iget v4, p1, Lr3;->a:I

    .line 23
    .line 24
    const/4 v5, 0x2

    .line 25
    const/4 v6, 0x4

    .line 26
    if-eq v4, v5, :cond_1

    .line 27
    .line 28
    if-ne v4, v6, :cond_0

    .line 29
    .line 30
    move v4, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p0, "op should be remove or update."

    .line 33
    .line 34
    invoke-static {p1, p0}, Lo40;->v(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 v4, 0x0

    .line 39
    :goto_0
    move v7, v2

    .line 40
    move v8, v7

    .line 41
    :goto_1
    iget v9, p1, Lr3;->d:I

    .line 42
    .line 43
    const/4 v10, 0x0

    .line 44
    if-ge v7, v9, :cond_6

    .line 45
    .line 46
    iget v9, p1, Lr3;->b:I

    .line 47
    .line 48
    mul-int v11, v4, v7

    .line 49
    .line 50
    add-int/2addr v11, v9

    .line 51
    iget v9, p1, Lr3;->a:I

    .line 52
    .line 53
    invoke-virtual {p0, v11, v9}, Ls3;->v(II)I

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    iget v11, p1, Lr3;->a:I

    .line 58
    .line 59
    if-eq v11, v5, :cond_3

    .line 60
    .line 61
    if-eq v11, v6, :cond_2

    .line 62
    .line 63
    goto :goto_3

    .line 64
    :cond_2
    add-int/lit8 v12, v1, 0x1

    .line 65
    .line 66
    if-ne v9, v12, :cond_4

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_3
    if-ne v9, v1, :cond_4

    .line 70
    .line 71
    :goto_2
    add-int/lit8 v8, v8, 0x1

    .line 72
    .line 73
    goto :goto_4

    .line 74
    :cond_4
    :goto_3
    iget-object v12, p1, Lr3;->c:Ljava/lang/Object;

    .line 75
    .line 76
    invoke-virtual {p0, v12, v11, v1, v8}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p0, v1, v3}, Ls3;->f(Lr3;I)V

    .line 81
    .line 82
    .line 83
    iput-object v10, v1, Lr3;->c:Ljava/lang/Object;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget v1, p1, Lr3;->a:I

    .line 89
    .line 90
    if-ne v1, v6, :cond_5

    .line 91
    .line 92
    add-int/2addr v3, v8

    .line 93
    :cond_5
    move v8, v2

    .line 94
    move v1, v9

    .line 95
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_6
    iget-object v2, p1, Lr3;->c:Ljava/lang/Object;

    .line 99
    .line 100
    iput-object v10, p1, Lr3;->c:Ljava/lang/Object;

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    if-lez v8, :cond_7

    .line 106
    .line 107
    iget p1, p1, Lr3;->a:I

    .line 108
    .line 109
    invoke-virtual {p0, v2, p1, v1, v8}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1, v3}, Ls3;->f(Lr3;I)V

    .line 114
    .line 115
    .line 116
    iput-object v10, p1, Lr3;->c:Ljava/lang/Object;

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    :cond_7
    return-void

    .line 122
    :cond_8
    const-string p0, "should not dispatch add or move for pre layout"

    .line 123
    .line 124
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public f(Lr3;I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lfy0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lfy0;->a(Lr3;)V

    .line 6
    .line 7
    .line 8
    iget v0, p1, Lr3;->a:I

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget v0, p1, Lr3;->d:I

    .line 17
    .line 18
    iget-object p1, p1, Lr3;->c:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p0, p2, p1, v0}, Lfy0;->c(ILjava/lang/Object;I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "only remove and update ops can be dispatched in first pass"

    .line 25
    .line 26
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget p1, p1, Lr3;->d:I

    .line 31
    .line 32
    iget-object p0, p0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->L(ZII)V

    .line 36
    .line 37
    .line 38
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 39
    .line 40
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m0:Lzy0;

    .line 41
    .line 42
    iget p2, p0, Lzy0;->b:I

    .line 43
    .line 44
    add-int/2addr p2, p1

    .line 45
    iput p2, p0, Lzy0;->b:I

    .line 46
    .line 47
    return-void
.end method

.method public g(II)I
    .locals 5

    .line 1
    iget-object p0, p0, Ls3;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    :goto_0
    if-ge p2, v0, :cond_6

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lr3;

    .line 16
    .line 17
    iget v2, v1, Lr3;->a:I

    .line 18
    .line 19
    iget v3, v1, Lr3;->b:I

    .line 20
    .line 21
    const/16 v4, 0x8

    .line 22
    .line 23
    if-ne v2, v4, :cond_2

    .line 24
    .line 25
    if-ne v3, p1, :cond_0

    .line 26
    .line 27
    iget p1, v1, Lr3;->d:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    if-ge v3, p1, :cond_1

    .line 31
    .line 32
    add-int/lit8 p1, p1, -0x1

    .line 33
    .line 34
    :cond_1
    iget v1, v1, Lr3;->d:I

    .line 35
    .line 36
    if-gt v1, p1, :cond_5

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    if-gt v3, p1, :cond_5

    .line 42
    .line 43
    const/4 v4, 0x2

    .line 44
    if-ne v2, v4, :cond_4

    .line 45
    .line 46
    iget v1, v1, Lr3;->d:I

    .line 47
    .line 48
    add-int/2addr v3, v1

    .line 49
    if-ge p1, v3, :cond_3

    .line 50
    .line 51
    const/4 p0, -0x1

    .line 52
    return p0

    .line 53
    :cond_3
    sub-int/2addr p1, v1

    .line 54
    goto :goto_1

    .line 55
    :cond_4
    const/4 v3, 0x1

    .line 56
    if-ne v2, v3, :cond_5

    .line 57
    .line 58
    iget v1, v1, Lr3;->d:I

    .line 59
    .line 60
    add-int/2addr p1, v1

    .line 61
    :cond_5
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_6
    return p1
.end method

.method public h()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lqo;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lqo;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public i()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lqo;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lqo;->d:Ljava/io/Serializable;

    .line 8
    .line 9
    check-cast p0, Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public j()Z
    .locals 2

    .line 1
    iget v0, p0, Ls3;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ls3;->e:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ls3;->c:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ls3;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public l(Landroid/util/AttributeSet;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ls3;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v4, Lgx0;->z:[I

    .line 10
    .line 11
    invoke-static {v1, p1, v4, p2}, Lc9;->F(Landroid/content/Context;Landroid/util/AttributeSet;[II)Lc9;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, v1, Lc9;->k:Ljava/lang/Object;

    .line 16
    .line 17
    move-object v8, v2

    .line 18
    check-cast v8, Landroid/content/res/TypedArray;

    .line 19
    .line 20
    iget-object v2, p0, Ls3;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v2, Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v5, v1, Lc9;->k:Ljava/lang/Object;

    .line 29
    .line 30
    move-object v6, v5

    .line 31
    check-cast v6, Landroid/content/res/TypedArray;

    .line 32
    .line 33
    move-object v5, p1

    .line 34
    move v7, p2

    .line 35
    invoke-static/range {v2 .. v7}, Lzh1;->h(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;I)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    :try_start_0
    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const/4 v2, -0x1

    .line 44
    if-eqz p2, :cond_0

    .line 45
    .line 46
    invoke-virtual {v8, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, p0, Ls3;->a:I

    .line 51
    .line 52
    iget-object p1, p0, Ls3;->c:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p1, Lj7;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget v3, p0, Ls3;->a:I

    .line 61
    .line 62
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :try_start_1
    iget-object v4, p1, Lj7;->a:Lw01;

    .line 64
    .line 65
    invoke-virtual {v4, p2, v3}, Lw01;->g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 66
    .line 67
    .line 68
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 69
    :try_start_2
    monitor-exit p1

    .line 70
    if-eqz p2, :cond_0

    .line 71
    .line 72
    invoke-virtual {p0, p2}, Ls3;->s(Landroid/content/res/ColorStateList;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    move-object p0, v0

    .line 78
    goto :goto_1

    .line 79
    :catchall_1
    move-exception v0

    .line 80
    move-object p0, v0

    .line 81
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 82
    :try_start_4
    throw p0

    .line 83
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 84
    invoke-virtual {v8, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    invoke-virtual {v1, p0}, Lc9;->s(I)Landroid/content/res/ColorStateList;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v0, p0}, Loh1;->q(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    const/4 p0, 0x2

    .line 98
    invoke-virtual {v8, p0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-virtual {v8, p0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    const/4 p1, 0x0

    .line 109
    invoke-static {p0, p1}, Lsy;->c(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {v0, p0}, Loh1;->r(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 114
    .line 115
    .line 116
    :cond_2
    invoke-virtual {v1}, Lc9;->H()V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :goto_1
    invoke-virtual {v1}, Lc9;->H()V

    .line 121
    .line 122
    .line 123
    throw p0
.end method

.method public m(Ljava/lang/Object;III)Lr3;
    .locals 0

    .line 1
    iget-object p0, p0, Ls3;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lnt0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lnt0;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lr3;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Lr3;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput p2, p0, Lr3;->a:I

    .line 19
    .line 20
    iput p3, p0, Lr3;->b:I

    .line 21
    .line 22
    iput p4, p0, Lr3;->d:I

    .line 23
    .line 24
    iput-object p1, p0, Lr3;->c:Ljava/lang/Object;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    iput p2, p0, Lr3;->a:I

    .line 28
    .line 29
    iput p3, p0, Lr3;->b:I

    .line 30
    .line 31
    iput p4, p0, Lr3;->d:I

    .line 32
    .line 33
    iput-object p1, p0, Lr3;->c:Ljava/lang/Object;

    .line 34
    .line 35
    return-object p0
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ls3;->a:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ls3;->s(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ls3;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o(I)V
    .locals 3

    .line 1
    iput p1, p0, Ls3;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Ls3;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lj7;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ls3;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    monitor-enter v0

    .line 18
    :try_start_0
    iget-object v2, v0, Lj7;->a:Lw01;

    .line 19
    .line 20
    invoke-virtual {v2, v1, p1}, Lw01;->g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 21
    .line 22
    .line 23
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    monitor-exit v0

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    :goto_0
    invoke-virtual {p0, p1}, Ls3;->s(Landroid/content/res/ColorStateList;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ls3;->a()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public p(Lr3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lfy0;

    .line 4
    .line 5
    iget-object p0, p0, Ls3;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget p0, p1, Lr3;->a:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq p0, v1, :cond_3

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    if-eq p0, v2, :cond_2

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq p0, v1, :cond_1

    .line 22
    .line 23
    const/16 v1, 0x8

    .line 24
    .line 25
    if-ne p0, v1, :cond_0

    .line 26
    .line 27
    iget p0, p1, Lr3;->b:I

    .line 28
    .line 29
    iget p1, p1, Lr3;->d:I

    .line 30
    .line 31
    invoke-virtual {v0, p0, p1}, Lfy0;->e(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "Unknown update op type for "

    .line 36
    .line 37
    invoke-static {p1, p0}, Lo40;->v(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget p0, p1, Lr3;->b:I

    .line 42
    .line 43
    iget v1, p1, Lr3;->d:I

    .line 44
    .line 45
    iget-object p1, p1, Lr3;->c:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {v0, p0, p1, v1}, Lfy0;->c(ILjava/lang/Object;I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget p0, p1, Lr3;->b:I

    .line 52
    .line 53
    iget p1, p1, Lr3;->d:I

    .line 54
    .line 55
    iget-object v0, v0, Lfy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {v0, v2, p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->L(ZII)V

    .line 59
    .line 60
    .line 61
    iput-boolean v1, v0, Landroidx/recyclerview/widget/RecyclerView;->p0:Z

    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    iget p0, p1, Lr3;->b:I

    .line 65
    .line 66
    iget p1, p1, Lr3;->d:I

    .line 67
    .line 68
    invoke-virtual {v0, p0, p1}, Lfy0;->d(II)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public q()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ls3;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lnt0;

    .line 6
    .line 7
    iget-object v2, v0, Ls3;->e:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Lfy0;

    .line 10
    .line 11
    iget-object v3, v0, Ls3;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v3, Lbv1;

    .line 14
    .line 15
    iget-object v4, v0, Ls3;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v4, Ljava/util/ArrayList;

    .line 18
    .line 19
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    const/4 v6, 0x1

    .line 24
    sub-int/2addr v5, v6

    .line 25
    const/4 v8, 0x0

    .line 26
    :goto_1
    const/16 v9, 0x8

    .line 27
    .line 28
    const/4 v10, -0x1

    .line 29
    if-ltz v5, :cond_3

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v11

    .line 35
    check-cast v11, Lr3;

    .line 36
    .line 37
    iget v11, v11, Lr3;->a:I

    .line 38
    .line 39
    if-ne v11, v9, :cond_1

    .line 40
    .line 41
    if-eqz v8, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_1
    move v8, v6

    .line 45
    :cond_2
    add-int/lit8 v5, v5, -0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    move v5, v10

    .line 49
    :goto_2
    const/4 v8, 0x2

    .line 50
    const/4 v11, 0x4

    .line 51
    if-eq v5, v10, :cond_22

    .line 52
    .line 53
    add-int/lit8 v9, v5, 0x1

    .line 54
    .line 55
    iget-object v13, v3, Lbv1;->k:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v13, Ls3;

    .line 58
    .line 59
    iget-object v14, v13, Ls3;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v14, Lnt0;

    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v15

    .line 67
    check-cast v15, Lr3;

    .line 68
    .line 69
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v16

    .line 73
    move-object/from16 v7, v16

    .line 74
    .line 75
    check-cast v7, Lr3;

    .line 76
    .line 77
    iget v10, v7, Lr3;->a:I

    .line 78
    .line 79
    if-eq v10, v6, :cond_1d

    .line 80
    .line 81
    if-eq v10, v8, :cond_b

    .line 82
    .line 83
    if-eq v10, v11, :cond_4

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    iget v8, v15, Lr3;->d:I

    .line 87
    .line 88
    iget v10, v7, Lr3;->b:I

    .line 89
    .line 90
    if-ge v8, v10, :cond_5

    .line 91
    .line 92
    add-int/lit8 v10, v10, -0x1

    .line 93
    .line 94
    iput v10, v7, Lr3;->b:I

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    iget v12, v7, Lr3;->d:I

    .line 98
    .line 99
    add-int/2addr v10, v12

    .line 100
    if-ge v8, v10, :cond_6

    .line 101
    .line 102
    add-int/lit8 v12, v12, -0x1

    .line 103
    .line 104
    iput v12, v7, Lr3;->d:I

    .line 105
    .line 106
    iget v8, v15, Lr3;->b:I

    .line 107
    .line 108
    iget-object v10, v7, Lr3;->c:Ljava/lang/Object;

    .line 109
    .line 110
    invoke-virtual {v13, v10, v11, v8, v6}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    goto :goto_4

    .line 115
    :cond_6
    :goto_3
    const/4 v6, 0x0

    .line 116
    :goto_4
    iget v8, v15, Lr3;->b:I

    .line 117
    .line 118
    iget v10, v7, Lr3;->b:I

    .line 119
    .line 120
    if-gt v8, v10, :cond_7

    .line 121
    .line 122
    add-int/lit8 v10, v10, 0x1

    .line 123
    .line 124
    iput v10, v7, Lr3;->b:I

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_7
    iget v12, v7, Lr3;->d:I

    .line 128
    .line 129
    add-int/2addr v10, v12

    .line 130
    if-ge v8, v10, :cond_8

    .line 131
    .line 132
    sub-int/2addr v10, v8

    .line 133
    add-int/lit8 v8, v8, 0x1

    .line 134
    .line 135
    iget-object v12, v7, Lr3;->c:Ljava/lang/Object;

    .line 136
    .line 137
    invoke-virtual {v13, v12, v11, v8, v10}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 138
    .line 139
    .line 140
    move-result-object v8

    .line 141
    iget v11, v7, Lr3;->d:I

    .line 142
    .line 143
    sub-int/2addr v11, v10

    .line 144
    iput v11, v7, Lr3;->d:I

    .line 145
    .line 146
    goto :goto_6

    .line 147
    :cond_8
    :goto_5
    const/4 v8, 0x0

    .line 148
    :goto_6
    invoke-virtual {v4, v9, v15}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    iget v9, v7, Lr3;->d:I

    .line 152
    .line 153
    if-lez v9, :cond_9

    .line 154
    .line 155
    invoke-virtual {v4, v5, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    goto :goto_7

    .line 159
    :cond_9
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    const/4 v9, 0x0

    .line 163
    iput-object v9, v7, Lr3;->c:Ljava/lang/Object;

    .line 164
    .line 165
    invoke-virtual {v14, v7}, Lnt0;->c(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :goto_7
    if-eqz v6, :cond_a

    .line 169
    .line 170
    invoke-virtual {v4, v5, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    :cond_a
    if-eqz v8, :cond_0

    .line 174
    .line 175
    invoke-virtual {v4, v5, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    iget v10, v15, Lr3;->b:I

    .line 181
    .line 182
    iget v11, v15, Lr3;->d:I

    .line 183
    .line 184
    iget v12, v7, Lr3;->b:I

    .line 185
    .line 186
    if-ge v10, v11, :cond_d

    .line 187
    .line 188
    if-ne v12, v10, :cond_c

    .line 189
    .line 190
    iget v6, v7, Lr3;->d:I

    .line 191
    .line 192
    sub-int v10, v11, v10

    .line 193
    .line 194
    if-ne v6, v10, :cond_c

    .line 195
    .line 196
    const/4 v6, 0x0

    .line 197
    :goto_8
    const/16 v17, 0x1

    .line 198
    .line 199
    goto :goto_a

    .line 200
    :cond_c
    const/4 v6, 0x0

    .line 201
    :goto_9
    const/16 v17, 0x0

    .line 202
    .line 203
    goto :goto_a

    .line 204
    :cond_d
    add-int/lit8 v6, v11, 0x1

    .line 205
    .line 206
    if-ne v12, v6, :cond_e

    .line 207
    .line 208
    iget v6, v7, Lr3;->d:I

    .line 209
    .line 210
    sub-int/2addr v10, v11

    .line 211
    if-ne v6, v10, :cond_e

    .line 212
    .line 213
    const/4 v6, 0x1

    .line 214
    goto :goto_8

    .line 215
    :cond_e
    const/4 v6, 0x1

    .line 216
    goto :goto_9

    .line 217
    :goto_a
    if-ge v11, v12, :cond_f

    .line 218
    .line 219
    add-int/lit8 v12, v12, -0x1

    .line 220
    .line 221
    iput v12, v7, Lr3;->b:I

    .line 222
    .line 223
    goto :goto_b

    .line 224
    :cond_f
    iget v10, v7, Lr3;->d:I

    .line 225
    .line 226
    add-int v8, v12, v10

    .line 227
    .line 228
    if-ge v11, v8, :cond_10

    .line 229
    .line 230
    add-int/lit8 v10, v10, -0x1

    .line 231
    .line 232
    iput v10, v7, Lr3;->d:I

    .line 233
    .line 234
    const/4 v5, 0x2

    .line 235
    iput v5, v15, Lr3;->a:I

    .line 236
    .line 237
    const/4 v5, 0x1

    .line 238
    iput v5, v15, Lr3;->d:I

    .line 239
    .line 240
    iget v5, v7, Lr3;->d:I

    .line 241
    .line 242
    if-nez v5, :cond_0

    .line 243
    .line 244
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    const/4 v9, 0x0

    .line 248
    iput-object v9, v7, Lr3;->c:Ljava/lang/Object;

    .line 249
    .line 250
    invoke-virtual {v14, v7}, Lnt0;->c(Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :cond_10
    :goto_b
    iget v8, v15, Lr3;->b:I

    .line 256
    .line 257
    if-gt v8, v12, :cond_12

    .line 258
    .line 259
    add-int/lit8 v12, v12, 0x1

    .line 260
    .line 261
    iput v12, v7, Lr3;->b:I

    .line 262
    .line 263
    :cond_11
    const/4 v10, 0x0

    .line 264
    goto :goto_c

    .line 265
    :cond_12
    iget v10, v7, Lr3;->d:I

    .line 266
    .line 267
    add-int/2addr v12, v10

    .line 268
    if-ge v8, v12, :cond_11

    .line 269
    .line 270
    sub-int/2addr v12, v8

    .line 271
    add-int/lit8 v8, v8, 0x1

    .line 272
    .line 273
    const/4 v10, 0x0

    .line 274
    const/4 v11, 0x2

    .line 275
    invoke-virtual {v13, v10, v11, v8, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 276
    .line 277
    .line 278
    move-result-object v18

    .line 279
    iget v8, v15, Lr3;->b:I

    .line 280
    .line 281
    iget v11, v7, Lr3;->b:I

    .line 282
    .line 283
    sub-int/2addr v8, v11

    .line 284
    iput v8, v7, Lr3;->d:I

    .line 285
    .line 286
    move-object/from16 v8, v18

    .line 287
    .line 288
    goto :goto_d

    .line 289
    :goto_c
    move-object v8, v10

    .line 290
    :goto_d
    if-eqz v17, :cond_13

    .line 291
    .line 292
    invoke-virtual {v4, v5, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    iput-object v10, v15, Lr3;->c:Ljava/lang/Object;

    .line 299
    .line 300
    invoke-virtual {v14, v15}, Lnt0;->c(Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_13
    if-eqz v6, :cond_17

    .line 306
    .line 307
    if-eqz v8, :cond_15

    .line 308
    .line 309
    iget v6, v15, Lr3;->b:I

    .line 310
    .line 311
    iget v10, v8, Lr3;->b:I

    .line 312
    .line 313
    if-le v6, v10, :cond_14

    .line 314
    .line 315
    iget v10, v8, Lr3;->d:I

    .line 316
    .line 317
    sub-int/2addr v6, v10

    .line 318
    iput v6, v15, Lr3;->b:I

    .line 319
    .line 320
    :cond_14
    iget v6, v15, Lr3;->d:I

    .line 321
    .line 322
    iget v10, v8, Lr3;->b:I

    .line 323
    .line 324
    if-le v6, v10, :cond_15

    .line 325
    .line 326
    iget v10, v8, Lr3;->d:I

    .line 327
    .line 328
    sub-int/2addr v6, v10

    .line 329
    iput v6, v15, Lr3;->d:I

    .line 330
    .line 331
    :cond_15
    iget v6, v15, Lr3;->b:I

    .line 332
    .line 333
    iget v10, v7, Lr3;->b:I

    .line 334
    .line 335
    if-le v6, v10, :cond_16

    .line 336
    .line 337
    iget v10, v7, Lr3;->d:I

    .line 338
    .line 339
    sub-int/2addr v6, v10

    .line 340
    iput v6, v15, Lr3;->b:I

    .line 341
    .line 342
    :cond_16
    iget v6, v15, Lr3;->d:I

    .line 343
    .line 344
    iget v10, v7, Lr3;->b:I

    .line 345
    .line 346
    if-le v6, v10, :cond_1b

    .line 347
    .line 348
    iget v10, v7, Lr3;->d:I

    .line 349
    .line 350
    sub-int/2addr v6, v10

    .line 351
    iput v6, v15, Lr3;->d:I

    .line 352
    .line 353
    goto :goto_e

    .line 354
    :cond_17
    if-eqz v8, :cond_19

    .line 355
    .line 356
    iget v6, v15, Lr3;->b:I

    .line 357
    .line 358
    iget v10, v8, Lr3;->b:I

    .line 359
    .line 360
    if-lt v6, v10, :cond_18

    .line 361
    .line 362
    iget v10, v8, Lr3;->d:I

    .line 363
    .line 364
    sub-int/2addr v6, v10

    .line 365
    iput v6, v15, Lr3;->b:I

    .line 366
    .line 367
    :cond_18
    iget v6, v15, Lr3;->d:I

    .line 368
    .line 369
    iget v10, v8, Lr3;->b:I

    .line 370
    .line 371
    if-lt v6, v10, :cond_19

    .line 372
    .line 373
    iget v10, v8, Lr3;->d:I

    .line 374
    .line 375
    sub-int/2addr v6, v10

    .line 376
    iput v6, v15, Lr3;->d:I

    .line 377
    .line 378
    :cond_19
    iget v6, v15, Lr3;->b:I

    .line 379
    .line 380
    iget v10, v7, Lr3;->b:I

    .line 381
    .line 382
    if-lt v6, v10, :cond_1a

    .line 383
    .line 384
    iget v10, v7, Lr3;->d:I

    .line 385
    .line 386
    sub-int/2addr v6, v10

    .line 387
    iput v6, v15, Lr3;->b:I

    .line 388
    .line 389
    :cond_1a
    iget v6, v15, Lr3;->d:I

    .line 390
    .line 391
    iget v10, v7, Lr3;->b:I

    .line 392
    .line 393
    if-lt v6, v10, :cond_1b

    .line 394
    .line 395
    iget v10, v7, Lr3;->d:I

    .line 396
    .line 397
    sub-int/2addr v6, v10

    .line 398
    iput v6, v15, Lr3;->d:I

    .line 399
    .line 400
    :cond_1b
    :goto_e
    invoke-virtual {v4, v5, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    iget v6, v15, Lr3;->b:I

    .line 404
    .line 405
    iget v7, v15, Lr3;->d:I

    .line 406
    .line 407
    if-eq v6, v7, :cond_1c

    .line 408
    .line 409
    invoke-virtual {v4, v9, v15}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    goto :goto_f

    .line 413
    :cond_1c
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    :goto_f
    if-eqz v8, :cond_0

    .line 417
    .line 418
    invoke-virtual {v4, v5, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    goto/16 :goto_0

    .line 422
    .line 423
    :cond_1d
    iget v6, v15, Lr3;->d:I

    .line 424
    .line 425
    iget v8, v7, Lr3;->b:I

    .line 426
    .line 427
    if-ge v6, v8, :cond_1e

    .line 428
    .line 429
    const/16 v16, -0x1

    .line 430
    .line 431
    goto :goto_10

    .line 432
    :cond_1e
    const/16 v16, 0x0

    .line 433
    .line 434
    :goto_10
    iget v10, v15, Lr3;->b:I

    .line 435
    .line 436
    if-ge v10, v8, :cond_1f

    .line 437
    .line 438
    add-int/lit8 v16, v16, 0x1

    .line 439
    .line 440
    :cond_1f
    if-gt v8, v10, :cond_20

    .line 441
    .line 442
    iget v8, v7, Lr3;->d:I

    .line 443
    .line 444
    add-int/2addr v10, v8

    .line 445
    iput v10, v15, Lr3;->b:I

    .line 446
    .line 447
    :cond_20
    iget v8, v7, Lr3;->b:I

    .line 448
    .line 449
    if-gt v8, v6, :cond_21

    .line 450
    .line 451
    iget v10, v7, Lr3;->d:I

    .line 452
    .line 453
    add-int/2addr v6, v10

    .line 454
    iput v6, v15, Lr3;->d:I

    .line 455
    .line 456
    :cond_21
    add-int v8, v8, v16

    .line 457
    .line 458
    iput v8, v7, Lr3;->b:I

    .line 459
    .line 460
    invoke-virtual {v4, v5, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v4, v9, v15}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 464
    .line 465
    .line 466
    goto/16 :goto_0

    .line 467
    .line 468
    :cond_22
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 469
    .line 470
    .line 471
    move-result v3

    .line 472
    const/4 v5, 0x0

    .line 473
    :goto_11
    if-ge v5, v3, :cond_36

    .line 474
    .line 475
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v6

    .line 479
    check-cast v6, Lr3;

    .line 480
    .line 481
    iget v7, v6, Lr3;->a:I

    .line 482
    .line 483
    const/4 v8, 0x1

    .line 484
    if-eq v7, v8, :cond_35

    .line 485
    .line 486
    const/4 v8, 0x2

    .line 487
    if-eq v7, v8, :cond_2c

    .line 488
    .line 489
    if-eq v7, v11, :cond_24

    .line 490
    .line 491
    if-eq v7, v9, :cond_23

    .line 492
    .line 493
    :goto_12
    const/4 v8, 0x2

    .line 494
    const/4 v15, 0x0

    .line 495
    const/16 v19, 0x1

    .line 496
    .line 497
    goto/16 :goto_1f

    .line 498
    .line 499
    :cond_23
    invoke-virtual {v0, v6}, Ls3;->p(Lr3;)V

    .line 500
    .line 501
    .line 502
    goto :goto_12

    .line 503
    :cond_24
    iget v7, v6, Lr3;->b:I

    .line 504
    .line 505
    iget v8, v6, Lr3;->d:I

    .line 506
    .line 507
    add-int/2addr v8, v7

    .line 508
    move v10, v7

    .line 509
    const/4 v12, 0x0

    .line 510
    const/4 v13, -0x1

    .line 511
    :goto_13
    if-ge v7, v8, :cond_29

    .line 512
    .line 513
    invoke-virtual {v2, v7}, Lfy0;->b(I)Lmu0;

    .line 514
    .line 515
    .line 516
    move-result-object v14

    .line 517
    if-nez v14, :cond_27

    .line 518
    .line 519
    invoke-virtual {v0, v7}, Ls3;->b(I)Z

    .line 520
    .line 521
    .line 522
    move-result v14

    .line 523
    if-eqz v14, :cond_25

    .line 524
    .line 525
    goto :goto_15

    .line 526
    :cond_25
    const/4 v14, 0x1

    .line 527
    if-ne v13, v14, :cond_26

    .line 528
    .line 529
    iget-object v13, v6, Lr3;->c:Ljava/lang/Object;

    .line 530
    .line 531
    invoke-virtual {v0, v13, v11, v10, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 532
    .line 533
    .line 534
    move-result-object v10

    .line 535
    invoke-virtual {v0, v10}, Ls3;->p(Lr3;)V

    .line 536
    .line 537
    .line 538
    move v10, v7

    .line 539
    const/4 v12, 0x0

    .line 540
    :cond_26
    const/4 v13, 0x0

    .line 541
    :goto_14
    const/16 v19, 0x1

    .line 542
    .line 543
    goto :goto_16

    .line 544
    :cond_27
    :goto_15
    if-nez v13, :cond_28

    .line 545
    .line 546
    iget-object v13, v6, Lr3;->c:Ljava/lang/Object;

    .line 547
    .line 548
    invoke-virtual {v0, v13, v11, v10, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 549
    .line 550
    .line 551
    move-result-object v10

    .line 552
    invoke-virtual {v0, v10}, Ls3;->e(Lr3;)V

    .line 553
    .line 554
    .line 555
    move v10, v7

    .line 556
    const/4 v12, 0x0

    .line 557
    :cond_28
    const/4 v13, 0x1

    .line 558
    goto :goto_14

    .line 559
    :goto_16
    add-int/lit8 v12, v12, 0x1

    .line 560
    .line 561
    add-int/lit8 v7, v7, 0x1

    .line 562
    .line 563
    goto :goto_13

    .line 564
    :cond_29
    iget v7, v6, Lr3;->d:I

    .line 565
    .line 566
    if-eq v12, v7, :cond_2a

    .line 567
    .line 568
    iget-object v7, v6, Lr3;->c:Ljava/lang/Object;

    .line 569
    .line 570
    const/4 v8, 0x0

    .line 571
    iput-object v8, v6, Lr3;->c:Ljava/lang/Object;

    .line 572
    .line 573
    invoke-virtual {v1, v6}, Lnt0;->c(Ljava/lang/Object;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, v7, v11, v10, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 577
    .line 578
    .line 579
    move-result-object v6

    .line 580
    :cond_2a
    if-nez v13, :cond_2b

    .line 581
    .line 582
    invoke-virtual {v0, v6}, Ls3;->e(Lr3;)V

    .line 583
    .line 584
    .line 585
    goto :goto_12

    .line 586
    :cond_2b
    invoke-virtual {v0, v6}, Ls3;->p(Lr3;)V

    .line 587
    .line 588
    .line 589
    goto :goto_12

    .line 590
    :cond_2c
    iget v7, v6, Lr3;->b:I

    .line 591
    .line 592
    iget v8, v6, Lr3;->d:I

    .line 593
    .line 594
    add-int/2addr v8, v7

    .line 595
    move v10, v7

    .line 596
    const/4 v12, 0x0

    .line 597
    const/4 v13, -0x1

    .line 598
    :goto_17
    if-ge v10, v8, :cond_32

    .line 599
    .line 600
    invoke-virtual {v2, v10}, Lfy0;->b(I)Lmu0;

    .line 601
    .line 602
    .line 603
    move-result-object v14

    .line 604
    if-nez v14, :cond_2d

    .line 605
    .line 606
    invoke-virtual {v0, v10}, Ls3;->b(I)Z

    .line 607
    .line 608
    .line 609
    move-result v14

    .line 610
    if-eqz v14, :cond_2e

    .line 611
    .line 612
    :cond_2d
    const/4 v14, 0x2

    .line 613
    const/4 v15, 0x0

    .line 614
    goto :goto_19

    .line 615
    :cond_2e
    const/4 v14, 0x1

    .line 616
    if-ne v13, v14, :cond_2f

    .line 617
    .line 618
    const/4 v14, 0x2

    .line 619
    const/4 v15, 0x0

    .line 620
    invoke-virtual {v0, v15, v14, v7, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 621
    .line 622
    .line 623
    move-result-object v13

    .line 624
    invoke-virtual {v0, v13}, Ls3;->p(Lr3;)V

    .line 625
    .line 626
    .line 627
    const/4 v13, 0x1

    .line 628
    goto :goto_18

    .line 629
    :cond_2f
    const/4 v14, 0x2

    .line 630
    const/4 v15, 0x0

    .line 631
    const/4 v13, 0x0

    .line 632
    :goto_18
    const/4 v14, 0x0

    .line 633
    goto :goto_1b

    .line 634
    :goto_19
    if-nez v13, :cond_30

    .line 635
    .line 636
    invoke-virtual {v0, v15, v14, v7, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 637
    .line 638
    .line 639
    move-result-object v13

    .line 640
    invoke-virtual {v0, v13}, Ls3;->e(Lr3;)V

    .line 641
    .line 642
    .line 643
    const/4 v13, 0x1

    .line 644
    goto :goto_1a

    .line 645
    :cond_30
    const/4 v13, 0x0

    .line 646
    :goto_1a
    const/4 v14, 0x1

    .line 647
    :goto_1b
    if-eqz v13, :cond_31

    .line 648
    .line 649
    sub-int/2addr v10, v12

    .line 650
    sub-int/2addr v8, v12

    .line 651
    const/4 v12, 0x1

    .line 652
    :goto_1c
    const/16 v19, 0x1

    .line 653
    .line 654
    goto :goto_1d

    .line 655
    :cond_31
    add-int/lit8 v12, v12, 0x1

    .line 656
    .line 657
    goto :goto_1c

    .line 658
    :goto_1d
    add-int/lit8 v10, v10, 0x1

    .line 659
    .line 660
    move v13, v14

    .line 661
    goto :goto_17

    .line 662
    :cond_32
    const/16 v19, 0x1

    .line 663
    .line 664
    iget v8, v6, Lr3;->d:I

    .line 665
    .line 666
    if-eq v12, v8, :cond_33

    .line 667
    .line 668
    const/4 v15, 0x0

    .line 669
    iput-object v15, v6, Lr3;->c:Ljava/lang/Object;

    .line 670
    .line 671
    invoke-virtual {v1, v6}, Lnt0;->c(Ljava/lang/Object;)V

    .line 672
    .line 673
    .line 674
    const/4 v8, 0x2

    .line 675
    invoke-virtual {v0, v15, v8, v7, v12}, Ls3;->m(Ljava/lang/Object;III)Lr3;

    .line 676
    .line 677
    .line 678
    move-result-object v6

    .line 679
    goto :goto_1e

    .line 680
    :cond_33
    const/4 v8, 0x2

    .line 681
    const/4 v15, 0x0

    .line 682
    :goto_1e
    if-nez v13, :cond_34

    .line 683
    .line 684
    invoke-virtual {v0, v6}, Ls3;->e(Lr3;)V

    .line 685
    .line 686
    .line 687
    goto :goto_1f

    .line 688
    :cond_34
    invoke-virtual {v0, v6}, Ls3;->p(Lr3;)V

    .line 689
    .line 690
    .line 691
    goto :goto_1f

    .line 692
    :cond_35
    move/from16 v19, v8

    .line 693
    .line 694
    const/4 v8, 0x2

    .line 695
    const/4 v15, 0x0

    .line 696
    invoke-virtual {v0, v6}, Ls3;->p(Lr3;)V

    .line 697
    .line 698
    .line 699
    :goto_1f
    add-int/lit8 v5, v5, 0x1

    .line 700
    .line 701
    goto/16 :goto_11

    .line 702
    .line 703
    :cond_36
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 704
    .line 705
    .line 706
    return-void
.end method

.method public r(Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Lr3;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    iput-object v3, v2, Lr3;->c:Ljava/lang/Object;

    .line 16
    .line 17
    iget-object v3, p0, Ls3;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v3, Lnt0;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lnt0;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public s(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ls3;->d:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lqo;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lqo;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ls3;->d:Ljava/lang/Object;

    .line 15
    .line 16
    :cond_0
    iput-object p1, v0, Lqo;->c:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, v0, Lqo;->b:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Ls3;->d:Ljava/lang/Object;

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0}, Ls3;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public t(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lqo;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lqo;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 13
    .line 14
    :cond_0
    iput-object p1, v0, Lqo;->c:Ljava/lang/Object;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Lqo;->b:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ls3;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public u(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lqo;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lqo;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ls3;->e:Ljava/lang/Object;

    .line 13
    .line 14
    :cond_0
    iput-object p1, v0, Lqo;->d:Ljava/io/Serializable;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Lqo;->a:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Ls3;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public v(II)I
    .locals 9

    .line 1
    iget-object v0, p0, Ls3;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lnt0;

    .line 4
    .line 5
    iget-object p0, p0, Ls3;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    sub-int/2addr v1, v2

    .line 15
    :goto_0
    const/16 v3, 0x8

    .line 16
    .line 17
    if-ltz v1, :cond_d

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, Lr3;

    .line 24
    .line 25
    iget v5, v4, Lr3;->a:I

    .line 26
    .line 27
    iget v6, v4, Lr3;->b:I

    .line 28
    .line 29
    const/4 v7, 0x2

    .line 30
    if-ne v5, v3, :cond_8

    .line 31
    .line 32
    iget v3, v4, Lr3;->d:I

    .line 33
    .line 34
    if-ge v6, v3, :cond_0

    .line 35
    .line 36
    move v8, v3

    .line 37
    move v5, v6

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    move v5, v3

    .line 40
    move v8, v6

    .line 41
    :goto_1
    if-lt p1, v5, :cond_6

    .line 42
    .line 43
    if-gt p1, v8, :cond_6

    .line 44
    .line 45
    if-ne v5, v6, :cond_3

    .line 46
    .line 47
    if-ne p2, v2, :cond_1

    .line 48
    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    iput v3, v4, Lr3;->d:I

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_1
    if-ne p2, v7, :cond_2

    .line 55
    .line 56
    add-int/lit8 v3, v3, -0x1

    .line 57
    .line 58
    iput v3, v4, Lr3;->d:I

    .line 59
    .line 60
    :cond_2
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 61
    .line 62
    goto :goto_4

    .line 63
    :cond_3
    if-ne p2, v2, :cond_4

    .line 64
    .line 65
    add-int/lit8 v6, v6, 0x1

    .line 66
    .line 67
    iput v6, v4, Lr3;->b:I

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_4
    if-ne p2, v7, :cond_5

    .line 71
    .line 72
    add-int/lit8 v6, v6, -0x1

    .line 73
    .line 74
    iput v6, v4, Lr3;->b:I

    .line 75
    .line 76
    :cond_5
    :goto_3
    add-int/lit8 p1, p1, -0x1

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_6
    if-ge p1, v6, :cond_c

    .line 80
    .line 81
    if-ne p2, v2, :cond_7

    .line 82
    .line 83
    add-int/lit8 v6, v6, 0x1

    .line 84
    .line 85
    iput v6, v4, Lr3;->b:I

    .line 86
    .line 87
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    iput v3, v4, Lr3;->d:I

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_7
    if-ne p2, v7, :cond_c

    .line 93
    .line 94
    add-int/lit8 v6, v6, -0x1

    .line 95
    .line 96
    iput v6, v4, Lr3;->b:I

    .line 97
    .line 98
    add-int/lit8 v3, v3, -0x1

    .line 99
    .line 100
    iput v3, v4, Lr3;->d:I

    .line 101
    .line 102
    goto :goto_4

    .line 103
    :cond_8
    if-gt v6, p1, :cond_a

    .line 104
    .line 105
    if-ne v5, v2, :cond_9

    .line 106
    .line 107
    iget v3, v4, Lr3;->d:I

    .line 108
    .line 109
    sub-int/2addr p1, v3

    .line 110
    goto :goto_4

    .line 111
    :cond_9
    if-ne v5, v7, :cond_c

    .line 112
    .line 113
    iget v3, v4, Lr3;->d:I

    .line 114
    .line 115
    add-int/2addr p1, v3

    .line 116
    goto :goto_4

    .line 117
    :cond_a
    if-ne p2, v2, :cond_b

    .line 118
    .line 119
    add-int/lit8 v6, v6, 0x1

    .line 120
    .line 121
    iput v6, v4, Lr3;->b:I

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_b
    if-ne p2, v7, :cond_c

    .line 125
    .line 126
    add-int/lit8 v6, v6, -0x1

    .line 127
    .line 128
    iput v6, v4, Lr3;->b:I

    .line 129
    .line 130
    :cond_c
    :goto_4
    add-int/lit8 v1, v1, -0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_d
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    sub-int/2addr p2, v2

    .line 138
    :goto_5
    if-ltz p2, :cond_11

    .line 139
    .line 140
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Lr3;

    .line 145
    .line 146
    iget v2, v1, Lr3;->a:I

    .line 147
    .line 148
    iget v4, v1, Lr3;->d:I

    .line 149
    .line 150
    const/4 v5, 0x0

    .line 151
    if-ne v2, v3, :cond_f

    .line 152
    .line 153
    iget v2, v1, Lr3;->b:I

    .line 154
    .line 155
    if-eq v4, v2, :cond_e

    .line 156
    .line 157
    if-gez v4, :cond_10

    .line 158
    .line 159
    :cond_e
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    iput-object v5, v1, Lr3;->c:Ljava/lang/Object;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_f
    if-gtz v4, :cond_10

    .line 169
    .line 170
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    iput-object v5, v1, Lr3;->c:Ljava/lang/Object;

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Lnt0;->c(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    :cond_10
    :goto_6
    add-int/lit8 p2, p2, -0x1

    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_11
    return p1
.end method
