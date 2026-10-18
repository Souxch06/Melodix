.class public final Landroidx/fragment/app/a;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ls7;

.field public final b:Ler0;

.field public final c:Lh70;

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>(Ls7;Ler0;Lh70;)V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 107
    iput-boolean v0, p0, Landroidx/fragment/app/a;->d:Z

    const/4 v0, -0x1

    .line 108
    iput v0, p0, Landroidx/fragment/app/a;->e:I

    .line 109
    iput-object p1, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 110
    iput-object p2, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 111
    iput-object p3, p0, Landroidx/fragment/app/a;->c:Lh70;

    return-void
.end method

.method public constructor <init>(Ls7;Ler0;Lh70;Le80;)V
    .locals 2

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 113
    iput-boolean v0, p0, Landroidx/fragment/app/a;->d:Z

    const/4 v1, -0x1

    .line 114
    iput v1, p0, Landroidx/fragment/app/a;->e:I

    .line 115
    iput-object p1, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 116
    iput-object p2, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 117
    iput-object p3, p0, Landroidx/fragment/app/a;->c:Lh70;

    const/4 p0, 0x0

    .line 118
    iput-object p0, p3, Lh70;->l:Landroid/util/SparseArray;

    .line 119
    iput-object p0, p3, Lh70;->m:Landroid/os/Bundle;

    .line 120
    iput v0, p3, Lh70;->z:I

    .line 121
    iput-boolean v0, p3, Lh70;->w:Z

    .line 122
    iput-boolean v0, p3, Lh70;->t:Z

    .line 123
    iget-object p1, p3, Lh70;->p:Lh70;

    if-eqz p1, :cond_0

    iget-object p1, p1, Lh70;->n:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object p1, p0

    :goto_0
    iput-object p1, p3, Lh70;->q:Ljava/lang/String;

    .line 124
    iput-object p0, p3, Lh70;->p:Lh70;

    .line 125
    iget-object p0, p4, Le80;->v:Landroid/os/Bundle;

    if-eqz p0, :cond_1

    .line 126
    iput-object p0, p3, Lh70;->k:Landroid/os/Bundle;

    return-void

    .line 127
    :cond_1
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    iput-object p0, p3, Lh70;->k:Landroid/os/Bundle;

    return-void
.end method

.method public constructor <init>(Ls7;Ler0;Ljava/lang/ClassLoader;Lt70;Le80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/a;->d:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Landroidx/fragment/app/a;->e:I

    .line 9
    .line 10
    iput-object p1, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 11
    .line 12
    iput-object p2, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 13
    .line 14
    iget-object p1, p5, Le80;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p4, p1}, Lt70;->a(Ljava/lang/String;)Lh70;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p2, p5, Le80;->s:Landroid/os/Bundle;

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2, p3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1, p2}, Lh70;->K(Landroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p5, Le80;->k:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p2, p1, Lh70;->n:Ljava/lang/String;

    .line 33
    .line 34
    iget-boolean p2, p5, Le80;->l:Z

    .line 35
    .line 36
    iput-boolean p2, p1, Lh70;->v:Z

    .line 37
    .line 38
    const/4 p2, 0x1

    .line 39
    iput-boolean p2, p1, Lh70;->x:Z

    .line 40
    .line 41
    iget p2, p5, Le80;->m:I

    .line 42
    .line 43
    iput p2, p1, Lh70;->E:I

    .line 44
    .line 45
    iget p2, p5, Le80;->n:I

    .line 46
    .line 47
    iput p2, p1, Lh70;->F:I

    .line 48
    .line 49
    iget-object p2, p5, Le80;->o:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p2, p1, Lh70;->G:Ljava/lang/String;

    .line 52
    .line 53
    iget-boolean p2, p5, Le80;->p:Z

    .line 54
    .line 55
    iput-boolean p2, p1, Lh70;->J:Z

    .line 56
    .line 57
    iget-boolean p2, p5, Le80;->q:Z

    .line 58
    .line 59
    iput-boolean p2, p1, Lh70;->u:Z

    .line 60
    .line 61
    iget-boolean p2, p5, Le80;->r:Z

    .line 62
    .line 63
    iput-boolean p2, p1, Lh70;->I:Z

    .line 64
    .line 65
    iget-boolean p2, p5, Le80;->t:Z

    .line 66
    .line 67
    iput-boolean p2, p1, Lh70;->H:Z

    .line 68
    .line 69
    invoke-static {}, Lwh0;->values()[Lwh0;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iget p3, p5, Le80;->u:I

    .line 74
    .line 75
    aget-object p2, p2, p3

    .line 76
    .line 77
    iput-object p2, p1, Lh70;->V:Lwh0;

    .line 78
    .line 79
    iget-object p2, p5, Le80;->v:Landroid/os/Bundle;

    .line 80
    .line 81
    if-eqz p2, :cond_1

    .line 82
    .line 83
    iput-object p2, p1, Lh70;->k:Landroid/os/Bundle;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    new-instance p2, Landroid/os/Bundle;

    .line 87
    .line 88
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p2, p1, Lh70;->k:Landroid/os/Bundle;

    .line 92
    .line 93
    :goto_0
    iput-object p1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 94
    .line 95
    const/4 p0, 0x2

    .line 96
    invoke-static {p0}, Lz70;->F(I)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_2

    .line 101
    .line 102
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iget-object v2, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v1, v2, Lh70;->C:Lz70;

    .line 14
    .line 15
    invoke-virtual {v1}, Lz70;->L()V

    .line 16
    .line 17
    .line 18
    iput v0, v2, Lh70;->j:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, v2, Lh70;->L:Z

    .line 22
    .line 23
    invoke-virtual {v2}, Lh70;->s()V

    .line 24
    .line 25
    .line 26
    iget-boolean v3, v2, Lh70;->L:Z

    .line 27
    .line 28
    const-string v4, "Fragment "

    .line 29
    .line 30
    if-eqz v3, :cond_6

    .line 31
    .line 32
    invoke-static {v0}, Lz70;->F(I)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v2}, Lh70;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, v2, Lh70;->N:Landroid/view/View;

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    if-eqz v0, :cond_5

    .line 45
    .line 46
    iget-object v5, v2, Lh70;->k:Landroid/os/Bundle;

    .line 47
    .line 48
    iget-object v6, v2, Lh70;->l:Landroid/util/SparseArray;

    .line 49
    .line 50
    if-eqz v6, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0, v6}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 53
    .line 54
    .line 55
    iput-object v3, v2, Lh70;->l:Landroid/util/SparseArray;

    .line 56
    .line 57
    :cond_2
    iget-object v0, v2, Lh70;->N:Landroid/view/View;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    iget-object v0, v2, Lh70;->X:Lj80;

    .line 62
    .line 63
    iget-object v6, v2, Lh70;->m:Landroid/os/Bundle;

    .line 64
    .line 65
    iget-object v0, v0, Lj80;->m:Lo80;

    .line 66
    .line 67
    invoke-virtual {v0, v6}, Lo80;->d(Landroid/os/Bundle;)V

    .line 68
    .line 69
    .line 70
    iput-object v3, v2, Lh70;->m:Landroid/os/Bundle;

    .line 71
    .line 72
    :cond_3
    iput-boolean v1, v2, Lh70;->L:Z

    .line 73
    .line 74
    invoke-virtual {v2, v5}, Lh70;->E(Landroid/os/Bundle;)V

    .line 75
    .line 76
    .line 77
    iget-boolean v0, v2, Lh70;->L:Z

    .line 78
    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    iget-object v0, v2, Lh70;->N:Landroid/view/View;

    .line 82
    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    iget-object v0, v2, Lh70;->X:Lj80;

    .line 86
    .line 87
    sget-object v4, Lvh0;->ON_CREATE:Lvh0;

    .line 88
    .line 89
    invoke-virtual {v0, v4}, Lj80;->b(Lvh0;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    new-instance p0, Lqa1;

    .line 94
    .line 95
    const-string v0, " did not call through to super.onViewStateRestored()"

    .line 96
    .line 97
    invoke-static {v4, v2, v0}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p0

    .line 105
    :cond_5
    :goto_0
    iput-object v3, v2, Lh70;->k:Landroid/os/Bundle;

    .line 106
    .line 107
    iget-object v0, v2, Lh70;->C:Lz70;

    .line 108
    .line 109
    iput-boolean v1, v0, Lz70;->E:Z

    .line 110
    .line 111
    iput-boolean v1, v0, Lz70;->F:Z

    .line 112
    .line 113
    iget-object v2, v0, Lz70;->L:Lb80;

    .line 114
    .line 115
    iput-boolean v1, v2, Lb80;->h:Z

    .line 116
    .line 117
    const/4 v2, 0x4

    .line 118
    invoke-virtual {v0, v2}, Lz70;->t(I)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Ls7;->f(Z)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_6
    new-instance p0, Lqa1;

    .line 128
    .line 129
    const-string v0, " did not call through to super.onActivityCreated()"

    .line 130
    .line 131
    invoke-static {v4, v2, v0}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw p0
.end method

.method public final b()V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 2
    .line 3
    iget-object v0, v0, Ler0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 8
    .line 9
    iget-object v1, p0, Lh70;->M:Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    add-int/lit8 v4, v3, -0x1

    .line 20
    .line 21
    :goto_0
    if-ltz v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Lh70;

    .line 28
    .line 29
    iget-object v6, v5, Lh70;->M:Landroid/view/ViewGroup;

    .line 30
    .line 31
    if-ne v6, v1, :cond_1

    .line 32
    .line 33
    iget-object v5, v5, Lh70;->N:Landroid/view/View;

    .line 34
    .line 35
    if-eqz v5, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/lit8 v2, v0, 0x1

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_1
    add-int/lit8 v4, v4, -0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-ge v3, v4, :cond_4

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Lh70;

    .line 60
    .line 61
    iget-object v5, v4, Lh70;->M:Landroid/view/ViewGroup;

    .line 62
    .line 63
    if-ne v5, v1, :cond_3

    .line 64
    .line 65
    iget-object v4, v4, Lh70;->N:Landroid/view/View;

    .line 66
    .line 67
    if-eqz v4, :cond_3

    .line 68
    .line 69
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    goto :goto_1

    .line 75
    :cond_4
    :goto_2
    iget-object v0, p0, Lh70;->M:Landroid/view/ViewGroup;

    .line 76
    .line 77
    iget-object p0, p0, Lh70;->N:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {v0, p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final c()V
    .locals 8

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, v1, Lh70;->p:Lh70;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, " that does not belong to this FragmentManager!"

    .line 17
    .line 18
    const-string v4, " declared target fragment "

    .line 19
    .line 20
    iget-object v5, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 21
    .line 22
    const-string v6, "Fragment "

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, v0, Lh70;->n:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v5, v5, Ler0;->l:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v5, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroidx/fragment/app/a;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v3, v1, Lh70;->p:Lh70;

    .line 41
    .line 42
    iget-object v3, v3, Lh70;->n:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v3, v1, Lh70;->q:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v2, v1, Lh70;->p:Lh70;

    .line 47
    .line 48
    move-object v2, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v1, v1, Lh70;->p:Lh70;

    .line 61
    .line 62
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p0

    .line 79
    :cond_2
    iget-object v0, v1, Lh70;->q:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    iget-object v2, v5, Ler0;->l:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v2, Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    move-object v2, v0

    .line 92
    check-cast v2, Landroidx/fragment/app/a;

    .line 93
    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v0, v1, Lh70;->q:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p0, v0, v3}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    :goto_0
    if-eqz v2, :cond_5

    .line 119
    .line 120
    invoke-virtual {v2}, Landroidx/fragment/app/a;->k()V

    .line 121
    .line 122
    .line 123
    :cond_5
    iget-object v0, v1, Lh70;->A:Lz70;

    .line 124
    .line 125
    iget-object v2, v0, Lz70;->t:Lj70;

    .line 126
    .line 127
    iput-object v2, v1, Lh70;->B:Lj70;

    .line 128
    .line 129
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 130
    .line 131
    iput-object v0, v1, Lh70;->D:Lh70;

    .line 132
    .line 133
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 134
    .line 135
    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0, v0}, Ls7;->l(Z)V

    .line 137
    .line 138
    .line 139
    iget-object v2, v1, Lh70;->a0:Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    move v4, v0

    .line 146
    :goto_1
    if-ge v4, v3, :cond_6

    .line 147
    .line 148
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    add-int/lit8 v4, v4, 0x1

    .line 153
    .line 154
    check-cast v5, Le70;

    .line 155
    .line 156
    iget-object v5, v5, Le70;->a:Lh70;

    .line 157
    .line 158
    iget-object v7, v5, Lh70;->Z:Lo80;

    .line 159
    .line 160
    invoke-virtual {v7}, Lo80;->c()V

    .line 161
    .line 162
    .line 163
    invoke-static {v5}, Lk42;->e(Lz21;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_6
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 168
    .line 169
    .line 170
    iget-object v2, v1, Lh70;->C:Lz70;

    .line 171
    .line 172
    iget-object v3, v1, Lh70;->B:Lj70;

    .line 173
    .line 174
    invoke-virtual {v1}, Lh70;->b()Lju1;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v2, v3, v4, v1}, Lz70;->b(Lj70;Lju1;Lh70;)V

    .line 179
    .line 180
    .line 181
    iput v0, v1, Lh70;->j:I

    .line 182
    .line 183
    iput-boolean v0, v1, Lh70;->L:Z

    .line 184
    .line 185
    iget-object v2, v1, Lh70;->B:Lj70;

    .line 186
    .line 187
    iget-object v2, v2, Lj70;->y:Le6;

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Lh70;->u(Le6;)V

    .line 190
    .line 191
    .line 192
    iget-boolean v2, v1, Lh70;->L:Z

    .line 193
    .line 194
    if-eqz v2, :cond_8

    .line 195
    .line 196
    iget-object v2, v1, Lh70;->A:Lz70;

    .line 197
    .line 198
    iget-object v2, v2, Lz70;->m:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 199
    .line 200
    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_7

    .line 209
    .line 210
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    check-cast v3, Lc80;

    .line 215
    .line 216
    invoke-interface {v3}, Lc80;->b()V

    .line 217
    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_7
    iget-object v1, v1, Lh70;->C:Lz70;

    .line 221
    .line 222
    iput-boolean v0, v1, Lz70;->E:Z

    .line 223
    .line 224
    iput-boolean v0, v1, Lz70;->F:Z

    .line 225
    .line 226
    iget-object v2, v1, Lz70;->L:Lb80;

    .line 227
    .line 228
    iput-boolean v0, v2, Lb80;->h:Z

    .line 229
    .line 230
    invoke-virtual {v1, v0}, Lz70;->t(I)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0, v0}, Ls7;->g(Z)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_8
    new-instance p0, Lqa1;

    .line 238
    .line 239
    const-string v0, " did not call through to super.onAttach()"

    .line 240
    .line 241
    invoke-static {v6, v1, v0}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    throw p0
.end method

.method public final d()I
    .locals 13

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-object v1, v0, Lh70;->A:Lz70;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget p0, v0, Lh70;->j:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget v1, p0, Landroidx/fragment/app/a;->e:I

    .line 11
    .line 12
    iget-object v2, v0, Lh70;->V:Lwh0;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x5

    .line 20
    const/4 v5, -0x1

    .line 21
    const/4 v6, 0x3

    .line 22
    const/4 v7, 0x4

    .line 23
    const/4 v8, 0x2

    .line 24
    const/4 v9, 0x1

    .line 25
    if-eq v2, v9, :cond_3

    .line 26
    .line 27
    if-eq v2, v8, :cond_2

    .line 28
    .line 29
    if-eq v2, v6, :cond_1

    .line 30
    .line 31
    if-eq v2, v7, :cond_4

    .line 32
    .line 33
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-static {v1, v9}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_0

    .line 48
    :cond_3
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    :cond_4
    :goto_0
    iget-boolean v2, v0, Lh70;->v:Z

    .line 53
    .line 54
    if-eqz v2, :cond_7

    .line 55
    .line 56
    iget-boolean v2, v0, Lh70;->w:Z

    .line 57
    .line 58
    iget p0, p0, Landroidx/fragment/app/a;->e:I

    .line 59
    .line 60
    if-eqz v2, :cond_5

    .line 61
    .line 62
    invoke-static {p0, v8}, Ljava/lang/Math;->max(II)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget-object p0, v0, Lh70;->N:Landroid/view/View;

    .line 67
    .line 68
    if-eqz p0, :cond_7

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-nez p0, :cond_7

    .line 75
    .line 76
    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    goto :goto_1

    .line 81
    :cond_5
    if-ge p0, v7, :cond_6

    .line 82
    .line 83
    iget p0, v0, Lh70;->j:I

    .line 84
    .line 85
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_1

    .line 90
    :cond_6
    invoke-static {v1, v9}, Ljava/lang/Math;->min(II)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    :cond_7
    :goto_1
    iget-boolean p0, v0, Lh70;->t:Z

    .line 95
    .line 96
    if-nez p0, :cond_8

    .line 97
    .line 98
    invoke-static {v1, v9}, Ljava/lang/Math;->min(II)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    :cond_8
    iget-object p0, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 103
    .line 104
    if-eqz p0, :cond_f

    .line 105
    .line 106
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v2}, Lz70;->E()Lt11;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {p0, v2}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, v0}, Lhw;->d(Lh70;)Lw81;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    if-eqz v2, :cond_9

    .line 123
    .line 124
    iget v2, v2, Lw81;->b:I

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_9
    move v2, v3

    .line 128
    :goto_2
    iget-object p0, p0, Lhw;->c:Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    :cond_a
    :goto_3
    if-ge v3, v10, :cond_c

    .line 135
    .line 136
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v11

    .line 140
    add-int/lit8 v3, v3, 0x1

    .line 141
    .line 142
    check-cast v11, Lw81;

    .line 143
    .line 144
    iget-object v12, v11, Lw81;->c:Lh70;

    .line 145
    .line 146
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    if-eq v12, v0, :cond_b

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_b
    iget-boolean v12, v11, Lw81;->f:Z

    .line 153
    .line 154
    if-nez v12, :cond_a

    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_c
    const/4 v11, 0x0

    .line 158
    :goto_4
    if-eqz v11, :cond_e

    .line 159
    .line 160
    if-eqz v2, :cond_d

    .line 161
    .line 162
    if-ne v2, v9, :cond_e

    .line 163
    .line 164
    :cond_d
    iget p0, v11, Lw81;->b:I

    .line 165
    .line 166
    move v3, p0

    .line 167
    goto :goto_5

    .line 168
    :cond_e
    move v3, v2

    .line 169
    :cond_f
    :goto_5
    if-ne v3, v8, :cond_10

    .line 170
    .line 171
    const/4 p0, 0x6

    .line 172
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_6

    .line 177
    :cond_10
    if-ne v3, v6, :cond_11

    .line 178
    .line 179
    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    goto :goto_6

    .line 184
    :cond_11
    iget-boolean p0, v0, Lh70;->u:Z

    .line 185
    .line 186
    if-eqz p0, :cond_13

    .line 187
    .line 188
    invoke-virtual {v0}, Lh70;->r()Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-eqz p0, :cond_12

    .line 193
    .line 194
    invoke-static {v1, v9}, Ljava/lang/Math;->min(II)I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_6

    .line 199
    :cond_12
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    :cond_13
    :goto_6
    iget-boolean p0, v0, Lh70;->O:Z

    .line 204
    .line 205
    if-eqz p0, :cond_14

    .line 206
    .line 207
    iget p0, v0, Lh70;->j:I

    .line 208
    .line 209
    if-ge p0, v4, :cond_14

    .line 210
    .line 211
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    :cond_14
    invoke-static {v8}, Lz70;->F(I)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_15

    .line 220
    .line 221
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    :cond_15
    return v1
.end method

.method public final e()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-boolean v0, v1, Lh70;->T:Z

    .line 14
    .line 15
    iget-object v2, v1, Lh70;->k:Landroid/os/Bundle;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const/4 v4, 0x0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 22
    .line 23
    invoke-virtual {p0, v4}, Ls7;->m(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, v1, Lh70;->k:Landroid/os/Bundle;

    .line 27
    .line 28
    iget-object v2, v1, Lh70;->C:Lz70;

    .line 29
    .line 30
    invoke-virtual {v2}, Lz70;->L()V

    .line 31
    .line 32
    .line 33
    iput v3, v1, Lh70;->j:I

    .line 34
    .line 35
    iput-boolean v4, v1, Lh70;->L:Z

    .line 36
    .line 37
    iget-object v2, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 38
    .line 39
    new-instance v5, Landroidx/fragment/app/Fragment$6;

    .line 40
    .line 41
    invoke-direct {v5, v1}, Landroidx/fragment/app/Fragment$6;-><init>(Lh70;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v5}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, v1, Lh70;->Z:Lo80;

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Lo80;->d(Landroid/os/Bundle;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Lh70;->v(Landroid/os/Bundle;)V

    .line 53
    .line 54
    .line 55
    iput-boolean v3, v1, Lh70;->T:Z

    .line 56
    .line 57
    iget-boolean v0, v1, Lh70;->L:Z

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 62
    .line 63
    sget-object v1, Lvh0;->ON_CREATE:Lvh0;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v4}, Ls7;->h(Z)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    new-instance p0, Lqa1;

    .line 73
    .line 74
    const-string v0, "Fragment "

    .line 75
    .line 76
    const-string v2, " did not call through to super.onCreate()"

    .line 77
    .line 78
    invoke-static {v0, v1, v2}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p0

    .line 86
    :cond_2
    if-eqz v2, :cond_3

    .line 87
    .line 88
    const-string p0, "android:support:fragments"

    .line 89
    .line 90
    invoke-virtual {v2, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    if-eqz p0, :cond_3

    .line 95
    .line 96
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Lz70;->Q(Landroid/os/Parcelable;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, v1, Lh70;->C:Lz70;

    .line 102
    .line 103
    iput-boolean v4, p0, Lz70;->E:Z

    .line 104
    .line 105
    iput-boolean v4, p0, Lz70;->F:Z

    .line 106
    .line 107
    iget-object v0, p0, Lz70;->L:Lb80;

    .line 108
    .line 109
    iput-boolean v4, v0, Lb80;->h:Z

    .line 110
    .line 111
    invoke-virtual {p0, v3}, Lz70;->t(I)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iput v3, v1, Lh70;->j:I

    .line 115
    .line 116
    return-void
.end method

.method public final f()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-boolean v1, v0, Lh70;->v:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x3

    .line 9
    invoke-static {v1}, Lz70;->F(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v1, v0, Lh70;->k:Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lh70;->z(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lh70;->S:Landroid/view/LayoutInflater;

    .line 25
    .line 26
    iget-object v2, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    goto/16 :goto_1

    .line 31
    .line 32
    :cond_2
    iget v2, v0, Lh70;->F:I

    .line 33
    .line 34
    if-eqz v2, :cond_6

    .line 35
    .line 36
    const/4 v3, -0x1

    .line 37
    if-eq v2, v3, :cond_5

    .line 38
    .line 39
    iget-object v3, v0, Lh70;->A:Lz70;

    .line 40
    .line 41
    iget-object v3, v3, Lz70;->u:Lju1;

    .line 42
    .line 43
    invoke-virtual {v3, v2}, Lju1;->r(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/view/ViewGroup;

    .line 48
    .line 49
    if-nez v2, :cond_4

    .line 50
    .line 51
    iget-boolean v3, v0, Lh70;->x:Z

    .line 52
    .line 53
    if-eqz v3, :cond_3

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    :try_start_0
    invoke-virtual {v0}, Lh70;->l()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget v1, v0, Lh70;->F:I

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    goto :goto_0

    .line 67
    :catch_0
    const-string p0, "unknown"

    .line 68
    .line 69
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 70
    .line 71
    iget v2, v0, Lh70;->F:I

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v4, "No view found for id 0x"

    .line 80
    .line 81
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v2, " ("

    .line 88
    .line 89
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p0, ") for fragment "

    .line 96
    .line 97
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw v1

    .line 111
    :cond_4
    instance-of v3, v2, Ll70;

    .line 112
    .line 113
    if-nez v3, :cond_7

    .line 114
    .line 115
    sget-object v3, Lh80;->a:Lg80;

    .line 116
    .line 117
    new-instance v3, Ld80;

    .line 118
    .line 119
    new-instance v4, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v5, "Attempting to add fragment "

    .line 122
    .line 123
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v5, " to container "

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v5, " which is not a FragmentContainerView"

    .line 138
    .line 139
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-direct {v3, v0, v4}, Lti1;-><init>(Lh70;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v3}, Lh80;->b(Lti1;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v0}, Lh80;->a(Lh70;)Lg80;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_5
    const-string p0, "Cannot create fragment "

    .line 161
    .line 162
    const-string v1, " for a container view with no id"

    .line 163
    .line 164
    invoke-static {p0, v0, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_6
    const/4 v2, 0x0

    .line 173
    :cond_7
    :goto_1
    iput-object v2, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 174
    .line 175
    iget-object v3, v0, Lh70;->k:Landroid/os/Bundle;

    .line 176
    .line 177
    invoke-virtual {v0, v1, v2, v3}, Lh70;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 178
    .line 179
    .line 180
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 181
    .line 182
    const/4 v3, 0x2

    .line 183
    if-eqz v1, :cond_c

    .line 184
    .line 185
    const/4 v4, 0x0

    .line 186
    invoke-virtual {v1, v4}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 187
    .line 188
    .line 189
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 190
    .line 191
    const v5, 0x7f0900df

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v5, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    if-eqz v2, :cond_8

    .line 198
    .line 199
    invoke-virtual {p0}, Landroidx/fragment/app/a;->b()V

    .line 200
    .line 201
    .line 202
    :cond_8
    iget-boolean v1, v0, Lh70;->H:Z

    .line 203
    .line 204
    if-eqz v1, :cond_9

    .line 205
    .line 206
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 207
    .line 208
    const/16 v2, 0x8

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 211
    .line 212
    .line 213
    :cond_9
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 214
    .line 215
    sget-object v2, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 216
    .line 217
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    iget-object v2, v0, Lh70;->N:Landroid/view/View;

    .line 222
    .line 223
    if-eqz v1, :cond_a

    .line 224
    .line 225
    invoke-static {v2}, Lmh1;->c(Landroid/view/View;)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_a
    new-instance v1, Lbj;

    .line 230
    .line 231
    invoke-direct {v1, v3, v2}, Lbj;-><init>(ILjava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v2, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 235
    .line 236
    .line 237
    :goto_2
    iget-object v1, v0, Lh70;->k:Landroid/os/Bundle;

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Lh70;->D(Landroid/os/Bundle;)V

    .line 240
    .line 241
    .line 242
    iget-object v1, v0, Lh70;->C:Lz70;

    .line 243
    .line 244
    invoke-virtual {v1, v3}, Lz70;->t(I)V

    .line 245
    .line 246
    .line 247
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 248
    .line 249
    invoke-virtual {p0, v4}, Ls7;->t(Z)V

    .line 250
    .line 251
    .line 252
    iget-object p0, v0, Lh70;->N:Landroid/view/View;

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 259
    .line 260
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    invoke-virtual {v0}, Lh70;->f()Lg70;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    iput v1, v2, Lg70;->j:F

    .line 269
    .line 270
    iget-object v1, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 271
    .line 272
    if-eqz v1, :cond_c

    .line 273
    .line 274
    if-nez p0, :cond_c

    .line 275
    .line 276
    iget-object p0, v0, Lh70;->N:Landroid/view/View;

    .line 277
    .line 278
    invoke-virtual {p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    if-eqz p0, :cond_b

    .line 283
    .line 284
    invoke-virtual {v0}, Lh70;->f()Lg70;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iput-object p0, v1, Lg70;->k:Landroid/view/View;

    .line 289
    .line 290
    invoke-static {v3}, Lz70;->F(I)Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-eqz v1, :cond_b

    .line 295
    .line 296
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    :cond_b
    iget-object p0, v0, Lh70;->N:Landroid/view/View;

    .line 303
    .line 304
    const/4 v1, 0x0

    .line 305
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 306
    .line 307
    .line 308
    :cond_c
    iput v3, v0, Lh70;->j:I

    .line 309
    .line 310
    return-void
.end method

.method public final g()V
    .locals 9

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iget-object v2, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-boolean v1, v2, Lh70;->u:Z

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v2}, Lh70;->r()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v1, v4

    .line 28
    :goto_0
    iget-object v5, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object v6, v2, Lh70;->n:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v7, v5, Ler0;->m:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v7, Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-virtual {v7, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    check-cast v6, Le80;

    .line 43
    .line 44
    :cond_2
    if-nez v1, :cond_7

    .line 45
    .line 46
    iget-object v6, v5, Ler0;->n:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v6, Lb80;

    .line 49
    .line 50
    iget-object v7, v6, Lb80;->c:Ljava/util/HashMap;

    .line 51
    .line 52
    iget-object v8, v2, Lh70;->n:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    if-nez v7, :cond_3

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    iget-boolean v7, v6, Lb80;->f:Z

    .line 62
    .line 63
    if-eqz v7, :cond_4

    .line 64
    .line 65
    iget-boolean v6, v6, Lb80;->g:Z

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_4
    :goto_1
    move v6, v3

    .line 69
    :goto_2
    if-eqz v6, :cond_5

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_5
    iget-object p0, v2, Lh70;->q:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    invoke-virtual {v5, p0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    if-eqz p0, :cond_6

    .line 81
    .line 82
    iget-boolean v0, p0, Lh70;->J:Z

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    iput-object p0, v2, Lh70;->p:Lh70;

    .line 87
    .line 88
    :cond_6
    iput v4, v2, Lh70;->j:I

    .line 89
    .line 90
    return-void

    .line 91
    :cond_7
    :goto_3
    iget-object v6, v2, Lh70;->B:Lj70;

    .line 92
    .line 93
    if-eqz v6, :cond_8

    .line 94
    .line 95
    iget-object v6, v5, Ler0;->n:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v6, Lb80;

    .line 98
    .line 99
    iget-boolean v6, v6, Lb80;->g:Z

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_8
    iget-object v6, v6, Lj70;->y:Le6;

    .line 103
    .line 104
    invoke-virtual {v6}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    xor-int/2addr v6, v3

    .line 109
    :goto_4
    if-eqz v1, :cond_9

    .line 110
    .line 111
    goto :goto_5

    .line 112
    :cond_9
    if-eqz v6, :cond_b

    .line 113
    .line 114
    :goto_5
    iget-object v1, v5, Ler0;->n:Ljava/lang/Object;

    .line 115
    .line 116
    check-cast v1, Lb80;

    .line 117
    .line 118
    invoke-static {v0}, Lz70;->F(I)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_a

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    :cond_a
    iget-object v0, v2, Lh70;->n:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Lb80;->b(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_b
    iget-object v0, v2, Lh70;->C:Lz70;

    .line 136
    .line 137
    invoke-virtual {v0}, Lz70;->k()V

    .line 138
    .line 139
    .line 140
    iget-object v0, v2, Lh70;->W:Landroidx/lifecycle/a;

    .line 141
    .line 142
    sget-object v1, Lvh0;->ON_DESTROY:Lvh0;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 145
    .line 146
    .line 147
    iput v4, v2, Lh70;->j:I

    .line 148
    .line 149
    iput-boolean v4, v2, Lh70;->L:Z

    .line 150
    .line 151
    iput-boolean v4, v2, Lh70;->T:Z

    .line 152
    .line 153
    iput-boolean v3, v2, Lh70;->L:Z

    .line 154
    .line 155
    iget-boolean v0, v2, Lh70;->L:Z

    .line 156
    .line 157
    if-eqz v0, :cond_f

    .line 158
    .line 159
    iget-object v0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 160
    .line 161
    invoke-virtual {v0, v4}, Ls7;->i(Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v5}, Ler0;->j()Ljava/util/ArrayList;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    :cond_c
    :goto_6
    if-ge v4, v1, :cond_d

    .line 173
    .line 174
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    add-int/lit8 v4, v4, 0x1

    .line 179
    .line 180
    check-cast v3, Landroidx/fragment/app/a;

    .line 181
    .line 182
    if-eqz v3, :cond_c

    .line 183
    .line 184
    iget-object v3, v3, Landroidx/fragment/app/a;->c:Lh70;

    .line 185
    .line 186
    iget-object v6, v2, Lh70;->n:Ljava/lang/String;

    .line 187
    .line 188
    iget-object v7, v3, Lh70;->q:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v6

    .line 194
    if-eqz v6, :cond_c

    .line 195
    .line 196
    iput-object v2, v3, Lh70;->p:Lh70;

    .line 197
    .line 198
    const/4 v6, 0x0

    .line 199
    iput-object v6, v3, Lh70;->q:Ljava/lang/String;

    .line 200
    .line 201
    goto :goto_6

    .line 202
    :cond_d
    iget-object v0, v2, Lh70;->q:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v0, :cond_e

    .line 205
    .line 206
    invoke-virtual {v5, v0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, v2, Lh70;->p:Lh70;

    .line 211
    .line 212
    :cond_e
    invoke-virtual {v5, p0}, Ler0;->n(Landroidx/fragment/app/a;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_f
    new-instance p0, Lqa1;

    .line 217
    .line 218
    const-string v0, "Fragment "

    .line 219
    .line 220
    const-string v1, " did not call through to super.onDestroy()"

    .line 221
    .line 222
    invoke-static {v0, v2, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    throw p0
.end method

.method public final h()V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Lz70;->F(I)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v2, v0, Lh70;->N:Landroid/view/View;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v1, v0, Lh70;->C:Lz70;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v1, v2}, Lz70;->t(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, v0, Lh70;->X:Lj80;

    .line 35
    .line 36
    invoke-virtual {v1}, Lj80;->f()V

    .line 37
    .line 38
    .line 39
    iget-object v1, v1, Lj80;->l:Landroidx/lifecycle/a;

    .line 40
    .line 41
    iget-object v1, v1, Landroidx/lifecycle/a;->b:Lwh0;

    .line 42
    .line 43
    sget-object v3, Lwh0;->l:Lwh0;

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-ltz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, v0, Lh70;->X:Lj80;

    .line 52
    .line 53
    sget-object v3, Lvh0;->ON_DESTROY:Lvh0;

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Lj80;->b(Lvh0;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iput v2, v0, Lh70;->j:I

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    iput-boolean v1, v0, Lh70;->L:Z

    .line 62
    .line 63
    invoke-virtual {v0}, Lh70;->x()V

    .line 64
    .line 65
    .line 66
    iget-boolean v3, v0, Lh70;->L:Z

    .line 67
    .line 68
    if-eqz v3, :cond_7

    .line 69
    .line 70
    invoke-interface {v0}, Lii1;->d()Lhi1;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    sget-object v4, Ldt;->k:Ldt;

    .line 78
    .line 79
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    const-class v5, Lxj0;

    .line 83
    .line 84
    invoke-virtual {v5}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    if-eqz v6, :cond_6

    .line 89
    .line 90
    const-string v7, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 91
    .line 92
    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    iget-object v3, v3, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 97
    .line 98
    invoke-virtual {v3, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    check-cast v7, Lfi1;

    .line 103
    .line 104
    invoke-virtual {v5, v7}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    new-instance v5, Ljava/util/LinkedHashMap;

    .line 115
    .line 116
    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v4, v4, Let;->j:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v4, Ljava/util/LinkedHashMap;

    .line 122
    .line 123
    invoke-interface {v5, v4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 124
    .line 125
    .line 126
    sget-object v4, Lt11;->q:Lt11;

    .line 127
    .line 128
    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    :try_start_0
    new-instance v4, Lxj0;

    .line 132
    .line 133
    invoke-direct {v4}, Lxj0;-><init>()V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    .line 136
    :goto_0
    move-object v7, v4

    .line 137
    goto :goto_1

    .line 138
    :catch_0
    new-instance v4, Lxj0;

    .line 139
    .line 140
    invoke-direct {v4}, Lxj0;-><init>()V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :goto_1
    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lfi1;

    .line 149
    .line 150
    if-eqz v3, :cond_4

    .line 151
    .line 152
    invoke-virtual {v3}, Lfi1;->a()V

    .line 153
    .line 154
    .line 155
    :cond_4
    :goto_2
    check-cast v7, Lxj0;

    .line 156
    .line 157
    iget-object v3, v7, Lxj0;->c:Lt81;

    .line 158
    .line 159
    iget v4, v3, Lt81;->l:I

    .line 160
    .line 161
    if-gtz v4, :cond_5

    .line 162
    .line 163
    iput-boolean v1, v0, Lh70;->y:Z

    .line 164
    .line 165
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 166
    .line 167
    invoke-virtual {p0, v1}, Ls7;->u(Z)V

    .line 168
    .line 169
    .line 170
    const/4 p0, 0x0

    .line 171
    iput-object p0, v0, Lh70;->M:Landroid/view/ViewGroup;

    .line 172
    .line 173
    iput-object p0, v0, Lh70;->N:Landroid/view/View;

    .line 174
    .line 175
    iput-object p0, v0, Lh70;->X:Lj80;

    .line 176
    .line 177
    iget-object v3, v0, Lh70;->Y:Landroidx/lifecycle/b;

    .line 178
    .line 179
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    const-string v4, "setValue"

    .line 183
    .line 184
    invoke-static {v4}, Landroidx/lifecycle/b;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget v4, v3, Landroidx/lifecycle/b;->g:I

    .line 188
    .line 189
    add-int/2addr v4, v2

    .line 190
    iput v4, v3, Landroidx/lifecycle/b;->g:I

    .line 191
    .line 192
    iput-object p0, v3, Landroidx/lifecycle/b;->e:Ljava/lang/Object;

    .line 193
    .line 194
    invoke-virtual {v3, p0}, Landroidx/lifecycle/b;->c(Lwj0;)V

    .line 195
    .line 196
    .line 197
    iput-boolean v1, v0, Lh70;->w:Z

    .line 198
    .line 199
    return-void

    .line 200
    :cond_5
    iget-object p0, v3, Lt81;->k:[Ljava/lang/Object;

    .line 201
    .line 202
    aget-object p0, p0, v1

    .line 203
    .line 204
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 205
    .line 206
    .line 207
    invoke-static {}, Lz0;->a()V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_6
    const-string p0, "Local and anonymous classes can not be ViewModels"

    .line 212
    .line 213
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_7
    new-instance p0, Lqa1;

    .line 218
    .line 219
    const-string v1, "Fragment "

    .line 220
    .line 221
    const-string v2, " did not call through to super.onDestroyView()"

    .line 222
    .line 223
    invoke-static {v1, v0, v2}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    throw p0
.end method

.method public final i()V
    .locals 7

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iget-object v2, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v1, -0x1

    .line 14
    iput v1, v2, Lh70;->j:I

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    iput-boolean v3, v2, Lh70;->L:Z

    .line 18
    .line 19
    invoke-virtual {v2}, Lh70;->y()V

    .line 20
    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    iput-object v4, v2, Lh70;->S:Landroid/view/LayoutInflater;

    .line 24
    .line 25
    iget-boolean v5, v2, Lh70;->L:Z

    .line 26
    .line 27
    if-eqz v5, :cond_7

    .line 28
    .line 29
    iget-object v5, v2, Lh70;->C:Lz70;

    .line 30
    .line 31
    iget-boolean v6, v5, Lz70;->G:Z

    .line 32
    .line 33
    if-nez v6, :cond_1

    .line 34
    .line 35
    invoke-virtual {v5}, Lz70;->k()V

    .line 36
    .line 37
    .line 38
    new-instance v5, Lz70;

    .line 39
    .line 40
    invoke-direct {v5}, Lz70;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v5, v2, Lh70;->C:Lz70;

    .line 44
    .line 45
    :cond_1
    iget-object v5, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 46
    .line 47
    invoke-virtual {v5, v3}, Ls7;->j(Z)V

    .line 48
    .line 49
    .line 50
    iput v1, v2, Lh70;->j:I

    .line 51
    .line 52
    iput-object v4, v2, Lh70;->B:Lj70;

    .line 53
    .line 54
    iput-object v4, v2, Lh70;->D:Lh70;

    .line 55
    .line 56
    iput-object v4, v2, Lh70;->A:Lz70;

    .line 57
    .line 58
    iget-boolean v1, v2, Lh70;->u:Z

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {v2}, Lh70;->r()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    iget-object p0, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 70
    .line 71
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast p0, Lb80;

    .line 74
    .line 75
    iget-object v1, p0, Lb80;->c:Ljava/util/HashMap;

    .line 76
    .line 77
    iget-object v3, v2, Lh70;->n:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-nez v1, :cond_3

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    iget-boolean v1, p0, Lb80;->f:Z

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    iget-boolean p0, p0, Lb80;->g:Z

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    :goto_0
    const/4 p0, 0x1

    .line 94
    :goto_1
    if-eqz p0, :cond_6

    .line 95
    .line 96
    :goto_2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_5

    .line 101
    .line 102
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    :cond_5
    invoke-virtual {v2}, Lh70;->p()V

    .line 106
    .line 107
    .line 108
    :cond_6
    return-void

    .line 109
    :cond_7
    new-instance p0, Lqa1;

    .line 110
    .line 111
    const-string v0, "Fragment "

    .line 112
    .line 113
    const-string v1, " did not call through to super.onDetach()"

    .line 114
    .line 115
    invoke-static {v0, v2, v1}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p0
.end method

.method public final j()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-boolean v1, v0, Lh70;->v:Z

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    iget-boolean v1, v0, Lh70;->w:Z

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    iget-boolean v1, v0, Lh70;->y:Z

    .line 12
    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-static {v1}, Lz70;->F(I)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, v0, Lh70;->k:Landroid/os/Bundle;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lh70;->z(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lh70;->S:Landroid/view/LayoutInflater;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    iget-object v3, v0, Lh70;->k:Landroid/os/Bundle;

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3}, Lh70;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {v1, v2}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 48
    .line 49
    const v3, 0x7f0900df

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-boolean v1, v0, Lh70;->H:Z

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    iget-object v1, v0, Lh70;->N:Landroid/view/View;

    .line 60
    .line 61
    const/16 v3, 0x8

    .line 62
    .line 63
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v1, v0, Lh70;->k:Landroid/os/Bundle;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lh70;->D(Landroid/os/Bundle;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, v0, Lh70;->C:Lz70;

    .line 72
    .line 73
    const/4 v3, 0x2

    .line 74
    invoke-virtual {v1, v3}, Lz70;->t(I)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Ls7;->t(Z)V

    .line 80
    .line 81
    .line 82
    iput v3, v0, Lh70;->j:I

    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public final k()V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->b:Ler0;

    .line 2
    .line 3
    iget-boolean v1, p0, Landroidx/fragment/app/a;->d:Z

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    iget-object v3, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-static {v2}, Lz70;->F(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    const/4 v1, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    :try_start_0
    iput-boolean v1, p0, Landroidx/fragment/app/a;->d:Z

    .line 23
    .line 24
    move v5, v4

    .line 25
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/a;->d()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    iget v7, v3, Lh70;->j:I

    .line 30
    .line 31
    const/4 v8, 0x3

    .line 32
    if-eq v6, v7, :cond_9

    .line 33
    .line 34
    if-le v6, v7, :cond_4

    .line 35
    .line 36
    add-int/lit8 v7, v7, 0x1

    .line 37
    .line 38
    packed-switch v7, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    goto/16 :goto_1

    .line 42
    .line 43
    :pswitch_0
    invoke-virtual {p0}, Landroidx/fragment/app/a;->n()V

    .line 44
    .line 45
    .line 46
    goto/16 :goto_1

    .line 47
    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :pswitch_1
    const/4 v5, 0x6

    .line 52
    iput v5, v3, Lh70;->j:I

    .line 53
    .line 54
    goto/16 :goto_1

    .line 55
    .line 56
    :pswitch_2
    invoke-virtual {p0}, Landroidx/fragment/app/a;->p()V

    .line 57
    .line 58
    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :pswitch_3
    iget-object v5, v3, Lh70;->N:Landroid/view/View;

    .line 62
    .line 63
    if-eqz v5, :cond_3

    .line 64
    .line 65
    iget-object v5, v3, Lh70;->M:Landroid/view/ViewGroup;

    .line 66
    .line 67
    if-eqz v5, :cond_3

    .line 68
    .line 69
    invoke-virtual {v3}, Lh70;->k()Lz70;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-virtual {v6}, Lz70;->E()Lt11;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-static {v5, v6}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    iget-object v6, v3, Lh70;->N:Landroid/view/View;

    .line 82
    .line 83
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    invoke-static {v6}, Lx81;->b(I)I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    invoke-static {v2}, Lz70;->F(I)Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-eqz v7, :cond_2

    .line 96
    .line 97
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    :cond_2
    invoke-virtual {v5, v6, v2, p0}, Lhw;->a(IILandroidx/fragment/app/a;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    const/4 v5, 0x4

    .line 104
    iput v5, v3, Lh70;->j:I

    .line 105
    .line 106
    goto/16 :goto_1

    .line 107
    .line 108
    :pswitch_4
    invoke-virtual {p0}, Landroidx/fragment/app/a;->a()V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_1

    .line 112
    .line 113
    :pswitch_5
    invoke-virtual {p0}, Landroidx/fragment/app/a;->j()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroidx/fragment/app/a;->f()V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_1

    .line 120
    .line 121
    :pswitch_6
    invoke-virtual {p0}, Landroidx/fragment/app/a;->e()V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :pswitch_7
    invoke-virtual {p0}, Landroidx/fragment/app/a;->c()V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    add-int/lit8 v7, v7, -0x1

    .line 130
    .line 131
    packed-switch v7, :pswitch_data_1

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :pswitch_8
    invoke-virtual {p0}, Landroidx/fragment/app/a;->l()V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :pswitch_9
    const/4 v5, 0x5

    .line 140
    iput v5, v3, Lh70;->j:I

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :pswitch_a
    invoke-virtual {p0}, Landroidx/fragment/app/a;->q()V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :pswitch_b
    invoke-static {v8}, Lz70;->F(I)Z

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    if-eqz v5, :cond_5

    .line 152
    .line 153
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object v5, v3, Lh70;->N:Landroid/view/View;

    .line 157
    .line 158
    if-eqz v5, :cond_6

    .line 159
    .line 160
    iget-object v5, v3, Lh70;->l:Landroid/util/SparseArray;

    .line 161
    .line 162
    if-nez v5, :cond_6

    .line 163
    .line 164
    invoke-virtual {p0}, Landroidx/fragment/app/a;->o()V

    .line 165
    .line 166
    .line 167
    :cond_6
    iget-object v5, v3, Lh70;->N:Landroid/view/View;

    .line 168
    .line 169
    if-eqz v5, :cond_8

    .line 170
    .line 171
    iget-object v5, v3, Lh70;->M:Landroid/view/ViewGroup;

    .line 172
    .line 173
    if-eqz v5, :cond_8

    .line 174
    .line 175
    invoke-virtual {v3}, Lh70;->k()Lz70;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    invoke-virtual {v6}, Lz70;->E()Lt11;

    .line 180
    .line 181
    .line 182
    move-result-object v6

    .line 183
    invoke-static {v5, v6}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    invoke-static {v2}, Lz70;->F(I)Z

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    if-eqz v6, :cond_7

    .line 192
    .line 193
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    :cond_7
    invoke-virtual {v5, v1, v8, p0}, Lhw;->a(IILandroidx/fragment/app/a;)V

    .line 197
    .line 198
    .line 199
    :cond_8
    iput v8, v3, Lh70;->j:I

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :pswitch_c
    iput-boolean v4, v3, Lh70;->w:Z

    .line 203
    .line 204
    iput v2, v3, Lh70;->j:I

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :pswitch_d
    invoke-virtual {p0}, Landroidx/fragment/app/a;->h()V

    .line 208
    .line 209
    .line 210
    iput v1, v3, Lh70;->j:I

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :pswitch_e
    invoke-virtual {p0}, Landroidx/fragment/app/a;->g()V

    .line 214
    .line 215
    .line 216
    goto :goto_1

    .line 217
    :pswitch_f
    invoke-virtual {p0}, Landroidx/fragment/app/a;->i()V

    .line 218
    .line 219
    .line 220
    :goto_1
    move v5, v1

    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_9
    if-nez v5, :cond_d

    .line 224
    .line 225
    const/4 v5, -0x1

    .line 226
    if-ne v7, v5, :cond_d

    .line 227
    .line 228
    iget-boolean v5, v3, Lh70;->u:Z

    .line 229
    .line 230
    if-eqz v5, :cond_d

    .line 231
    .line 232
    invoke-virtual {v3}, Lh70;->r()Z

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    if-nez v5, :cond_d

    .line 237
    .line 238
    invoke-static {v8}, Lz70;->F(I)Z

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    if-eqz v5, :cond_a

    .line 243
    .line 244
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    :cond_a
    iget-object v5, v0, Ler0;->n:Ljava/lang/Object;

    .line 248
    .line 249
    check-cast v5, Lb80;

    .line 250
    .line 251
    invoke-static {v8}, Lz70;->F(I)Z

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    if-eqz v6, :cond_b

    .line 256
    .line 257
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 258
    .line 259
    .line 260
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    :cond_b
    iget-object v6, v3, Lh70;->n:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {v5, v6}, Lb80;->b(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0, p0}, Ler0;->n(Landroidx/fragment/app/a;)V

    .line 269
    .line 270
    .line 271
    invoke-static {v8}, Lz70;->F(I)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-eqz v0, :cond_c

    .line 276
    .line 277
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    :cond_c
    invoke-virtual {v3}, Lh70;->p()V

    .line 281
    .line 282
    .line 283
    :cond_d
    iget-boolean v0, v3, Lh70;->R:Z

    .line 284
    .line 285
    if-eqz v0, :cond_13

    .line 286
    .line 287
    iget-object v0, v3, Lh70;->N:Landroid/view/View;

    .line 288
    .line 289
    if-eqz v0, :cond_11

    .line 290
    .line 291
    iget-object v0, v3, Lh70;->M:Landroid/view/ViewGroup;

    .line 292
    .line 293
    if-eqz v0, :cond_11

    .line 294
    .line 295
    invoke-virtual {v3}, Lh70;->k()Lz70;

    .line 296
    .line 297
    .line 298
    move-result-object v5

    .line 299
    invoke-virtual {v5}, Lz70;->E()Lt11;

    .line 300
    .line 301
    .line 302
    move-result-object v5

    .line 303
    invoke-static {v0, v5}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iget-boolean v5, v3, Lh70;->H:Z

    .line 308
    .line 309
    if-eqz v5, :cond_f

    .line 310
    .line 311
    invoke-static {v2}, Lz70;->F(I)Z

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    if-eqz v2, :cond_e

    .line 316
    .line 317
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    :cond_e
    invoke-virtual {v0, v8, v1, p0}, Lhw;->a(IILandroidx/fragment/app/a;)V

    .line 321
    .line 322
    .line 323
    goto :goto_2

    .line 324
    :cond_f
    invoke-static {v2}, Lz70;->F(I)Z

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    if-eqz v5, :cond_10

    .line 329
    .line 330
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    :cond_10
    invoke-virtual {v0, v2, v1, p0}, Lhw;->a(IILandroidx/fragment/app/a;)V

    .line 334
    .line 335
    .line 336
    :cond_11
    :goto_2
    iget-object v0, v3, Lh70;->A:Lz70;

    .line 337
    .line 338
    if-eqz v0, :cond_12

    .line 339
    .line 340
    iget-boolean v2, v3, Lh70;->t:Z

    .line 341
    .line 342
    if-eqz v2, :cond_12

    .line 343
    .line 344
    invoke-static {v3}, Lz70;->G(Lh70;)Z

    .line 345
    .line 346
    .line 347
    move-result v2

    .line 348
    if-eqz v2, :cond_12

    .line 349
    .line 350
    iput-boolean v1, v0, Lz70;->D:Z

    .line 351
    .line 352
    :cond_12
    iput-boolean v4, v3, Lh70;->R:Z

    .line 353
    .line 354
    iget-object v0, v3, Lh70;->C:Lz70;

    .line 355
    .line 356
    invoke-virtual {v0}, Lz70;->n()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 357
    .line 358
    .line 359
    :cond_13
    iput-boolean v4, p0, Landroidx/fragment/app/a;->d:Z

    .line 360
    .line 361
    return-void

    .line 362
    :goto_3
    iput-boolean v4, p0, Landroidx/fragment/app/a;->d:Z

    .line 363
    .line 364
    throw v0

    .line 365
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method public final l()V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 14
    .line 15
    const/4 v2, 0x5

    .line 16
    invoke-virtual {v0, v2}, Lz70;->t(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, v1, Lh70;->N:Landroid/view/View;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, v1, Lh70;->X:Lj80;

    .line 24
    .line 25
    sget-object v2, Lvh0;->ON_PAUSE:Lvh0;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lj80;->b(Lvh0;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 31
    .line 32
    sget-object v2, Lvh0;->ON_PAUSE:Lvh0;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x6

    .line 38
    iput v0, v1, Lh70;->j:I

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, v1, Lh70;->L:Z

    .line 42
    .line 43
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, v1, v0}, Ls7;->k(Lh70;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final m(Ljava/lang/ClassLoader;)V
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-object v0, p0, Lh70;->k:Landroid/os/Bundle;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lh70;->k:Landroid/os/Bundle;

    .line 12
    .line 13
    const-string v0, "android:view_state"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lh70;->l:Landroid/util/SparseArray;

    .line 20
    .line 21
    iget-object p1, p0, Lh70;->k:Landroid/os/Bundle;

    .line 22
    .line 23
    const-string v0, "android:view_registry_state"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lh70;->m:Landroid/os/Bundle;

    .line 30
    .line 31
    iget-object p1, p0, Lh70;->k:Landroid/os/Bundle;

    .line 32
    .line 33
    const-string v0, "android:target_state"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lh70;->q:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lh70;->k:Landroid/os/Bundle;

    .line 44
    .line 45
    const-string v0, "android:target_req_state"

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Lh70;->r:I

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lh70;->k:Landroid/os/Bundle;

    .line 55
    .line 56
    const-string v0, "android:user_visible_hint"

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iput-boolean p1, p0, Lh70;->P:Z

    .line 64
    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    iput-boolean v1, p0, Lh70;->O:Z

    .line 68
    .line 69
    :cond_2
    :goto_0
    return-void
.end method

.method public final n()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, v1, Lh70;->Q:Lg70;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    move-object v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, v0, Lg70;->k:Landroid/view/View;

    .line 21
    .line 22
    :goto_0
    if-eqz v0, :cond_4

    .line 23
    .line 24
    iget-object v3, v1, Lh70;->N:Landroid/view/View;

    .line 25
    .line 26
    if-ne v0, v3, :cond_2

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :goto_1
    if-eqz v3, :cond_4

    .line 34
    .line 35
    iget-object v4, v1, Lh70;->N:Landroid/view/View;

    .line 36
    .line 37
    if-ne v3, v4, :cond_3

    .line 38
    .line 39
    :goto_2
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 40
    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static {v3}, Lz70;->F(I)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_4

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    iget-object v0, v1, Lh70;->N:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_3
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    goto :goto_1

    .line 70
    :cond_4
    :goto_3
    invoke-virtual {v1}, Lh70;->f()Lg70;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v2, v0, Lg70;->k:Landroid/view/View;

    .line 75
    .line 76
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 77
    .line 78
    invoke-virtual {v0}, Lz70;->L()V

    .line 79
    .line 80
    .line 81
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    invoke-virtual {v0, v3}, Lz70;->y(Z)Z

    .line 85
    .line 86
    .line 87
    const/4 v0, 0x7

    .line 88
    iput v0, v1, Lh70;->j:I

    .line 89
    .line 90
    const/4 v4, 0x0

    .line 91
    iput-boolean v4, v1, Lh70;->L:Z

    .line 92
    .line 93
    iput-boolean v3, v1, Lh70;->L:Z

    .line 94
    .line 95
    iget-boolean v3, v1, Lh70;->L:Z

    .line 96
    .line 97
    if-eqz v3, :cond_6

    .line 98
    .line 99
    iget-object v3, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 100
    .line 101
    sget-object v5, Lvh0;->ON_RESUME:Lvh0;

    .line 102
    .line 103
    invoke-virtual {v3, v5}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 104
    .line 105
    .line 106
    iget-object v3, v1, Lh70;->N:Landroid/view/View;

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    iget-object v3, v1, Lh70;->X:Lj80;

    .line 111
    .line 112
    iget-object v3, v3, Lj80;->l:Landroidx/lifecycle/a;

    .line 113
    .line 114
    invoke-virtual {v3, v5}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    iget-object v3, v1, Lh70;->C:Lz70;

    .line 118
    .line 119
    iput-boolean v4, v3, Lz70;->E:Z

    .line 120
    .line 121
    iput-boolean v4, v3, Lz70;->F:Z

    .line 122
    .line 123
    iget-object v5, v3, Lz70;->L:Lb80;

    .line 124
    .line 125
    iput-boolean v4, v5, Lb80;->h:Z

    .line 126
    .line 127
    invoke-virtual {v3, v0}, Lz70;->t(I)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 131
    .line 132
    invoke-virtual {p0, v1, v4}, Ls7;->n(Lh70;Z)V

    .line 133
    .line 134
    .line 135
    iput-object v2, v1, Lh70;->k:Landroid/os/Bundle;

    .line 136
    .line 137
    iput-object v2, v1, Lh70;->l:Landroid/util/SparseArray;

    .line 138
    .line 139
    iput-object v2, v1, Lh70;->m:Landroid/os/Bundle;

    .line 140
    .line 141
    return-void

    .line 142
    :cond_6
    new-instance p0, Lqa1;

    .line 143
    .line 144
    const-string v0, "Fragment "

    .line 145
    .line 146
    const-string v2, " did not call through to super.onResume()"

    .line 147
    .line 148
    invoke-static {v0, v1, v2}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p0
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-object v0, p0, Lh70;->N:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Lz70;->F(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lh70;->N:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    :cond_1
    new-instance v0, Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lh70;->N:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-lez v1, :cond_2

    .line 38
    .line 39
    iput-object v0, p0, Lh70;->l:Landroid/util/SparseArray;

    .line 40
    .line 41
    :cond_2
    new-instance v0, Landroid/os/Bundle;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lh70;->X:Lj80;

    .line 47
    .line 48
    iget-object v1, v1, Lj80;->m:Lo80;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lo80;->e(Landroid/os/Bundle;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_3

    .line 58
    .line 59
    iput-object v0, p0, Lh70;->m:Landroid/os/Bundle;

    .line 60
    .line 61
    :cond_3
    :goto_0
    return-void
.end method

.method public final p()V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 14
    .line 15
    invoke-virtual {v0}, Lz70;->L()V

    .line 16
    .line 17
    .line 18
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Lz70;->y(Z)Z

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x5

    .line 25
    iput v0, v1, Lh70;->j:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput-boolean v2, v1, Lh70;->L:Z

    .line 29
    .line 30
    invoke-virtual {v1}, Lh70;->B()V

    .line 31
    .line 32
    .line 33
    iget-boolean v3, v1, Lh70;->L:Z

    .line 34
    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    iget-object v3, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 38
    .line 39
    sget-object v4, Lvh0;->ON_START:Lvh0;

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 42
    .line 43
    .line 44
    iget-object v3, v1, Lh70;->N:Landroid/view/View;

    .line 45
    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    iget-object v3, v1, Lh70;->X:Lj80;

    .line 49
    .line 50
    iget-object v3, v3, Lj80;->l:Landroidx/lifecycle/a;

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v1, v1, Lh70;->C:Lz70;

    .line 56
    .line 57
    iput-boolean v2, v1, Lz70;->E:Z

    .line 58
    .line 59
    iput-boolean v2, v1, Lz70;->F:Z

    .line 60
    .line 61
    iget-object v3, v1, Lz70;->L:Lb80;

    .line 62
    .line 63
    iput-boolean v2, v3, Lb80;->h:Z

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Lz70;->t(I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Ls7;->r(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    new-instance p0, Lqa1;

    .line 75
    .line 76
    const-string v0, "Fragment "

    .line 77
    .line 78
    const-string v2, " did not call through to super.onStart()"

    .line 79
    .line 80
    invoke-static {v0, v1, v2}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0
.end method

.method public final q()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, v1, Lh70;->C:Lz70;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    iput-boolean v2, v0, Lz70;->F:Z

    .line 17
    .line 18
    iget-object v3, v0, Lz70;->L:Lb80;

    .line 19
    .line 20
    iput-boolean v2, v3, Lb80;->h:Z

    .line 21
    .line 22
    const/4 v2, 0x4

    .line 23
    invoke-virtual {v0, v2}, Lz70;->t(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, v1, Lh70;->N:Landroid/view/View;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, v1, Lh70;->X:Lj80;

    .line 31
    .line 32
    sget-object v3, Lvh0;->ON_STOP:Lvh0;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Lj80;->b(Lvh0;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, v1, Lh70;->W:Landroidx/lifecycle/a;

    .line 38
    .line 39
    sget-object v3, Lvh0;->ON_STOP:Lvh0;

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 42
    .line 43
    .line 44
    iput v2, v1, Lh70;->j:I

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, v1, Lh70;->L:Z

    .line 48
    .line 49
    invoke-virtual {v1}, Lh70;->C()V

    .line 50
    .line 51
    .line 52
    iget-boolean v2, v1, Lh70;->L:Z

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Landroidx/fragment/app/a;->a:Ls7;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ls7;->s(Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    new-instance p0, Lqa1;

    .line 63
    .line 64
    const-string v0, "Fragment "

    .line 65
    .line 66
    const-string v2, " did not call through to super.onStop()"

    .line 67
    .line 68
    invoke-static {v0, v1, v2}, Loq;->g(Ljava/lang/String;Lh70;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p0
.end method
