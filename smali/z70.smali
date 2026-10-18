.class public final Lz70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public A:Ls7;

.field public B:Ls7;

.field public C:Ljava/util/ArrayDeque;

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Ljava/util/ArrayList;

.field public J:Ljava/util/ArrayList;

.field public K:Ljava/util/ArrayList;

.field public L:Lb80;

.field public final M:Lu70;

.field public final a:Ljava/util/ArrayList;

.field public b:Z

.field public final c:Ler0;

.field public d:Ljava/util/ArrayList;

.field public e:Ljava/util/ArrayList;

.field public final f:Ln70;

.field public g:Landroidx/activity/b;

.field public final h:Lr70;

.field public final i:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final j:Ljava/util/Map;

.field public final k:Ljava/util/Map;

.field public final l:Ls7;

.field public final m:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final n:Lp70;

.field public final o:Lp70;

.field public final p:Lp70;

.field public final q:Lp70;

.field public final r:Ls70;

.field public s:I

.field public t:Lj70;

.field public u:Lju1;

.field public v:Lh70;

.field public w:Lh70;

.field public final x:Lt70;

.field public final y:Lt11;

.field public z:Ls7;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ler0;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ler0;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lz70;->c:Ler0;

    .line 19
    .line 20
    new-instance v0, Ln70;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ln70;-><init>(Lz70;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lz70;->f:Ln70;

    .line 26
    .line 27
    new-instance v0, Lr70;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lr70;-><init>(Lz70;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lz70;->h:Lr70;

    .line 33
    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lz70;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    .line 41
    new-instance v0, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lz70;->j:Ljava/util/Map;

    .line 51
    .line 52
    new-instance v0, Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lz70;->k:Ljava/util/Map;

    .line 62
    .line 63
    new-instance v0, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 69
    .line 70
    .line 71
    new-instance v0, Ls7;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ls7;-><init>(Lz70;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lz70;->l:Ls7;

    .line 77
    .line 78
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lz70;->m:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 84
    .line 85
    new-instance v0, Lp70;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-direct {v0, p0, v1}, Lp70;-><init>(Lz70;I)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lz70;->n:Lp70;

    .line 92
    .line 93
    new-instance v0, Lp70;

    .line 94
    .line 95
    const/4 v1, 0x1

    .line 96
    invoke-direct {v0, p0, v1}, Lp70;-><init>(Lz70;I)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lz70;->o:Lp70;

    .line 100
    .line 101
    new-instance v0, Lp70;

    .line 102
    .line 103
    const/4 v1, 0x2

    .line 104
    invoke-direct {v0, p0, v1}, Lp70;-><init>(Lz70;I)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lz70;->p:Lp70;

    .line 108
    .line 109
    new-instance v0, Lp70;

    .line 110
    .line 111
    const/4 v1, 0x3

    .line 112
    invoke-direct {v0, p0, v1}, Lp70;-><init>(Lz70;I)V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lz70;->q:Lp70;

    .line 116
    .line 117
    new-instance v0, Ls70;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ls70;-><init>(Lz70;)V

    .line 120
    .line 121
    .line 122
    iput-object v0, p0, Lz70;->r:Ls70;

    .line 123
    .line 124
    const/4 v0, -0x1

    .line 125
    iput v0, p0, Lz70;->s:I

    .line 126
    .line 127
    new-instance v0, Lt70;

    .line 128
    .line 129
    invoke-direct {v0, p0}, Lt70;-><init>(Lz70;)V

    .line 130
    .line 131
    .line 132
    iput-object v0, p0, Lz70;->x:Lt70;

    .line 133
    .line 134
    new-instance v0, Lt11;

    .line 135
    .line 136
    const/16 v1, 0xf

    .line 137
    .line 138
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lz70;->y:Lt11;

    .line 142
    .line 143
    new-instance v0, Ljava/util/ArrayDeque;

    .line 144
    .line 145
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object v0, p0, Lz70;->C:Ljava/util/ArrayDeque;

    .line 149
    .line 150
    new-instance v0, Lu70;

    .line 151
    .line 152
    invoke-direct {v0, p0}, Lu70;-><init>(Lz70;)V

    .line 153
    .line 154
    .line 155
    iput-object v0, p0, Lz70;->M:Lu70;

    .line 156
    .line 157
    return-void
.end method

.method public static F(I)Z
    .locals 1

    .line 1
    const-string v0, "FragmentManager"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static G(Lh70;)Z
    .locals 5

    .line 1
    iget-object p0, p0, Lh70;->C:Lz70;

    .line 2
    .line 3
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ler0;->k()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    move v3, v2

    .line 16
    :cond_0
    if-ge v3, v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    add-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    check-cast v4, Lh70;

    .line 25
    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-static {v4}, Lz70;->G(Lh70;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    :cond_1
    if-eqz v2, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_2
    return v1
.end method

.method public static I(Lh70;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-boolean v0, p0, Lh70;->K:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lh70;->D:Lh70;

    .line 13
    .line 14
    invoke-static {p0}, Lz70;->I(Lh70;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_2
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public static J(Lh70;)Z
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lh70;->A:Lz70;

    .line 5
    .line 6
    iget-object v1, v0, Lz70;->w:Lh70;

    .line 7
    .line 8
    if-eq p0, v1, :cond_1

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    iget-object p0, v0, Lz70;->v:Lh70;

    .line 12
    .line 13
    invoke-static {p0}, Lz70;->J(Lh70;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method


# virtual methods
.method public final A(I)Lh70;
    .locals 4

    .line 1
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 2
    .line 3
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lh70;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget v3, v2, Lh70;->E:I

    .line 24
    .line 25
    if-ne v3, p1, :cond_0

    .line 26
    .line 27
    return-object v2

    .line 28
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroidx/fragment/app/a;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object v0, v0, Landroidx/fragment/app/a;->c:Lh70;

    .line 58
    .line 59
    iget v1, v0, Lh70;->E:I

    .line 60
    .line 61
    if-ne v1, p1, :cond_2

    .line 62
    .line 63
    return-object v0

    .line 64
    :cond_3
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method public final B(Ljava/lang/String;)Lh70;
    .locals 4

    .line 1
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 2
    .line 3
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lh70;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-object v3, v2, Lh70;->G:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    return-object v2

    .line 32
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroidx/fragment/app/a;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, v0, Landroidx/fragment/app/a;->c:Lh70;

    .line 62
    .line 63
    iget-object v1, v0, Lh70;->G:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_3
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method public final C(Lh70;)Landroid/view/ViewGroup;
    .locals 1

    .line 1
    iget-object v0, p1, Lh70;->M:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget v0, p1, Lh70;->F:I

    .line 7
    .line 8
    if-gtz v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v0, p0, Lz70;->u:Lju1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lju1;->s()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, Lz70;->u:Lju1;

    .line 20
    .line 21
    iget p1, p1, Lh70;->F:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lju1;->r(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    instance-of p1, p0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    check-cast p0, Landroid/view/ViewGroup;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public final D()Lt70;
    .locals 1

    .line 1
    iget-object v0, p0, Lz70;->v:Lh70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Lh70;->A:Lz70;

    .line 6
    .line 7
    invoke-virtual {p0}, Lz70;->D()Lt70;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lz70;->x:Lt70;

    .line 13
    .line 14
    return-object p0
.end method

.method public final E()Lt11;
    .locals 1

    .line 1
    iget-object v0, p0, Lz70;->v:Lh70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Lh70;->A:Lz70;

    .line 6
    .line 7
    invoke-virtual {p0}, Lz70;->E()Lt11;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lz70;->y:Lt11;

    .line 13
    .line 14
    return-object p0
.end method

.method public final H()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lz70;->v:Lh70;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lh70;->B:Lj70;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Lh70;->t:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lh70;->k()Lz70;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lz70;->H()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

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

.method public final K(IZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p0, "No activity"

    .line 10
    .line 11
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    :goto_0
    if-nez p2, :cond_2

    .line 16
    .line 17
    iget p2, p0, Lz70;->s:I

    .line 18
    .line 19
    if-ne p1, p2, :cond_2

    .line 20
    .line 21
    goto :goto_3

    .line 22
    :cond_2
    iput p1, p0, Lz70;->s:I

    .line 23
    .line 24
    iget-object p1, p0, Lz70;->c:Ler0;

    .line 25
    .line 26
    iget-object p2, p1, Ler0;->l:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p2, Ljava/util/HashMap;

    .line 29
    .line 30
    iget-object v0, p1, Ler0;->k:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    move v3, v2

    .line 40
    :cond_3
    :goto_1
    if-ge v3, v1, :cond_4

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    check-cast v4, Lh70;

    .line 49
    .line 50
    iget-object v4, v4, Lh70;->n:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Landroidx/fragment/app/a;

    .line 57
    .line 58
    if-eqz v4, :cond_3

    .line 59
    .line 60
    invoke-virtual {v4}, Landroidx/fragment/app/a;->k()V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    invoke-virtual {p2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    :cond_5
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Landroidx/fragment/app/a;

    .line 83
    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    invoke-virtual {v0}, Landroidx/fragment/app/a;->k()V

    .line 87
    .line 88
    .line 89
    iget-object v1, v0, Landroidx/fragment/app/a;->c:Lh70;

    .line 90
    .line 91
    iget-boolean v3, v1, Lh70;->u:Z

    .line 92
    .line 93
    if-eqz v3, :cond_5

    .line 94
    .line 95
    invoke-virtual {v1}, Lh70;->r()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_5

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ler0;->n(Landroidx/fragment/app/a;)V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_6
    invoke-virtual {p0}, Lz70;->X()V

    .line 106
    .line 107
    .line 108
    iget-boolean p1, p0, Lz70;->D:Z

    .line 109
    .line 110
    if-eqz p1, :cond_7

    .line 111
    .line 112
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 113
    .line 114
    if-eqz p1, :cond_7

    .line 115
    .line 116
    iget p2, p0, Lz70;->s:I

    .line 117
    .line 118
    const/4 v0, 0x7

    .line 119
    if-ne p2, v0, :cond_7

    .line 120
    .line 121
    iget-object p1, p1, Lj70;->B:Le6;

    .line 122
    .line 123
    invoke-virtual {p1}, Le6;->invalidateOptionsMenu()V

    .line 124
    .line 125
    .line 126
    iput-boolean v2, p0, Lz70;->D:Z

    .line 127
    .line 128
    :cond_7
    :goto_3
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lz70;->E:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lz70;->F:Z

    .line 10
    .line 11
    iget-object v1, p0, Lz70;->L:Lb80;

    .line 12
    .line 13
    iput-boolean v0, v1, Lb80;->h:Z

    .line 14
    .line 15
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lh70;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 40
    .line 41
    invoke-virtual {v0}, Lz70;->L()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    :goto_1
    return-void
.end method

.method public final M()Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lz70;->y(Z)Z

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v1}, Lz70;->x(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Lz70;->w:Lh70;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Lh70;->h()Lz70;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lz70;->M()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    iget-object v2, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v3, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 27
    .line 28
    const/4 v4, -0x1

    .line 29
    invoke-virtual {p0, v2, v3, v4, v0}, Lz70;->N(Ljava/util/ArrayList;Ljava/util/ArrayList;II)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iput-boolean v1, p0, Lz70;->b:Z

    .line 36
    .line 37
    :try_start_0
    iget-object v1, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 38
    .line 39
    iget-object v2, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0, v1, v2}, Lz70;->P(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lz70;->d()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    invoke-virtual {p0}, Lz70;->d()V

    .line 50
    .line 51
    .line 52
    throw v0

    .line 53
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lz70;->Z()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lz70;->u()V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 60
    .line 61
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p0, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {p0, v1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    return v0
.end method

.method public final N(Ljava/util/ArrayList;Ljava/util/ArrayList;II)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    and-int/2addr p4, v0

    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    move p4, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p4, v1

    .line 9
    :goto_0
    iget-object v2, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    if-eqz v2, :cond_9

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    goto :goto_4

    .line 21
    :cond_1
    if-gez p3, :cond_3

    .line 22
    .line 23
    if-eqz p4, :cond_2

    .line 24
    .line 25
    move v3, v1

    .line 26
    goto :goto_4

    .line 27
    :cond_2
    iget-object p3, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    add-int/lit8 v3, p3, -0x1

    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_3
    iget-object v2, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int/2addr v2, v0

    .line 43
    :goto_1
    if-ltz v2, :cond_5

    .line 44
    .line 45
    iget-object v4, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ltf;

    .line 52
    .line 53
    if-ltz p3, :cond_4

    .line 54
    .line 55
    iget v4, v4, Ltf;->s:I

    .line 56
    .line 57
    if-ne p3, v4, :cond_4

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_4
    add-int/lit8 v2, v2, -0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_5
    :goto_2
    if-gez v2, :cond_6

    .line 64
    .line 65
    move v3, v2

    .line 66
    goto :goto_4

    .line 67
    :cond_6
    if-eqz p4, :cond_7

    .line 68
    .line 69
    move v3, v2

    .line 70
    :goto_3
    if-lez v3, :cond_9

    .line 71
    .line 72
    iget-object p4, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 73
    .line 74
    add-int/lit8 v2, v3, -0x1

    .line 75
    .line 76
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p4

    .line 80
    check-cast p4, Ltf;

    .line 81
    .line 82
    if-ltz p3, :cond_9

    .line 83
    .line 84
    iget p4, p4, Ltf;->s:I

    .line 85
    .line 86
    if-ne p3, p4, :cond_9

    .line 87
    .line 88
    add-int/lit8 v3, v3, -0x1

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_7
    iget-object p3, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    sub-int/2addr p3, v0

    .line 98
    if-ne v2, p3, :cond_8

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_8
    add-int/lit8 v3, v2, 0x1

    .line 102
    .line 103
    :cond_9
    :goto_4
    if-gez v3, :cond_a

    .line 104
    .line 105
    return v1

    .line 106
    :cond_a
    iget-object p3, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    sub-int/2addr p3, v0

    .line 113
    :goto_5
    if-lt p3, v3, :cond_b

    .line 114
    .line 115
    iget-object p4, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    check-cast p4, Ltf;

    .line 122
    .line 123
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    add-int/lit8 p3, p3, -0x1

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_b
    return v0
.end method

.method public final O(Lh70;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Lh70;->r()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-boolean v1, p1, Lh70;->I:Z

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return-void

    .line 23
    :cond_2
    :goto_0
    iget-object v0, p0, Lz70;->c:Ler0;

    .line 24
    .line 25
    iget-object v1, v0, Ler0;->k:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Ljava/util/ArrayList;

    .line 28
    .line 29
    monitor-enter v1

    .line 30
    :try_start_0
    iget-object v0, v0, Ler0;->k:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p1, Lh70;->t:Z

    .line 40
    .line 41
    invoke-static {p1}, Lz70;->G(Lh70;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iput-boolean v1, p0, Lz70;->D:Z

    .line 49
    .line 50
    :cond_3
    iput-boolean v1, p1, Lh70;->u:Z

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lz70;->W(Lh70;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p0
.end method

.method public final P(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ne v0, v1, :cond_6

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    move v2, v1

    .line 24
    :goto_0
    if-ge v1, v0, :cond_4

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ltf;

    .line 31
    .line 32
    iget-boolean v3, v3, Ltf;->p:Z

    .line 33
    .line 34
    if-nez v3, :cond_3

    .line 35
    .line 36
    if-eq v2, v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2, v2, v1}, Lz70;->z(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 39
    .line 40
    .line 41
    :cond_1
    add-int/lit8 v2, v1, 0x1

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    :goto_1
    if-ge v2, v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Ltf;

    .line 74
    .line 75
    iget-boolean v3, v3, Ltf;->p:Z

    .line 76
    .line 77
    if-nez v3, :cond_2

    .line 78
    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {p0, p1, p2, v1, v2}, Lz70;->z(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 83
    .line 84
    .line 85
    add-int/lit8 v1, v2, -0x1

    .line 86
    .line 87
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    if-eq v2, v0, :cond_5

    .line 91
    .line 92
    invoke-virtual {p0, p1, p2, v2, v0}, Lz70;->z(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_2
    return-void

    .line 96
    :cond_6
    const-string p0, "Internal error with the back stack records"

    .line 97
    .line 98
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final Q(Landroid/os/Parcelable;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    check-cast v1, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ljava/lang/String;

    .line 26
    .line 27
    const-string v4, "result_"

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    iget-object v5, v0, Lz70;->t:Lj70;

    .line 42
    .line 43
    iget-object v5, v5, Lj70;->y:Le6;

    .line 44
    .line 45
    invoke-virtual {v5}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 50
    .line 51
    .line 52
    const/4 v5, 0x7

    .line 53
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v5, v0, Lz70;->k:Ljava/util/Map;

    .line 58
    .line 59
    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    const-string v5, "state"

    .line 81
    .line 82
    if-eqz v4, :cond_3

    .line 83
    .line 84
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Ljava/lang/String;

    .line 89
    .line 90
    const-string v6, "fragment_"

    .line 91
    .line 92
    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-eqz v6, :cond_2

    .line 97
    .line 98
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    if-eqz v4, :cond_2

    .line 103
    .line 104
    iget-object v6, v0, Lz70;->t:Lj70;

    .line 105
    .line 106
    iget-object v6, v6, Lj70;->y:Le6;

    .line 107
    .line 108
    invoke-virtual {v6}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-virtual {v4, v6}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    check-cast v4, Le80;

    .line 120
    .line 121
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    iget-object v3, v0, Lz70;->c:Ler0;

    .line 126
    .line 127
    iget-object v4, v3, Ler0;->m:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v4, Ljava/util/HashMap;

    .line 130
    .line 131
    iget-object v6, v3, Ler0;->l:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast v6, Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    const/4 v9, 0x0

    .line 143
    :goto_2
    if-ge v9, v7, :cond_4

    .line 144
    .line 145
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v10

    .line 149
    add-int/lit8 v9, v9, 0x1

    .line 150
    .line 151
    check-cast v10, Le80;

    .line 152
    .line 153
    iget-object v11, v10, Le80;->k:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v4, v11, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_4
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    check-cast v1, La80;

    .line 164
    .line 165
    if-nez v1, :cond_5

    .line 166
    .line 167
    return-void

    .line 168
    :cond_5
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 169
    .line 170
    .line 171
    iget-object v2, v1, La80;->j:Ljava/util/ArrayList;

    .line 172
    .line 173
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    const/4 v5, 0x0

    .line 178
    :cond_6
    :goto_3
    iget-object v7, v0, Lz70;->l:Ls7;

    .line 179
    .line 180
    const/4 v9, 0x2

    .line 181
    if-ge v5, v4, :cond_a

    .line 182
    .line 183
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v10

    .line 187
    add-int/lit8 v5, v5, 0x1

    .line 188
    .line 189
    check-cast v10, Ljava/lang/String;

    .line 190
    .line 191
    iget-object v11, v3, Ler0;->m:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast v11, Ljava/util/HashMap;

    .line 194
    .line 195
    invoke-virtual {v11, v10}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    check-cast v10, Le80;

    .line 200
    .line 201
    if-eqz v10, :cond_6

    .line 202
    .line 203
    iget-object v11, v0, Lz70;->L:Lb80;

    .line 204
    .line 205
    iget-object v12, v10, Le80;->k:Ljava/lang/String;

    .line 206
    .line 207
    iget-object v11, v11, Lb80;->c:Ljava/util/HashMap;

    .line 208
    .line 209
    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v11

    .line 213
    check-cast v11, Lh70;

    .line 214
    .line 215
    if-eqz v11, :cond_8

    .line 216
    .line 217
    invoke-static {v9}, Lz70;->F(I)Z

    .line 218
    .line 219
    .line 220
    move-result v12

    .line 221
    if-eqz v12, :cond_7

    .line 222
    .line 223
    invoke-virtual {v11}, Lh70;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    :cond_7
    new-instance v12, Landroidx/fragment/app/a;

    .line 227
    .line 228
    invoke-direct {v12, v7, v3, v11, v10}, Landroidx/fragment/app/a;-><init>(Ls7;Ler0;Lh70;Le80;)V

    .line 229
    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_8
    new-instance v11, Landroidx/fragment/app/a;

    .line 233
    .line 234
    iget-object v7, v0, Lz70;->t:Lj70;

    .line 235
    .line 236
    iget-object v7, v7, Lj70;->y:Le6;

    .line 237
    .line 238
    invoke-virtual {v7}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 239
    .line 240
    .line 241
    move-result-object v14

    .line 242
    invoke-virtual {v0}, Lz70;->D()Lt70;

    .line 243
    .line 244
    .line 245
    move-result-object v15

    .line 246
    iget-object v12, v0, Lz70;->l:Ls7;

    .line 247
    .line 248
    iget-object v13, v0, Lz70;->c:Ler0;

    .line 249
    .line 250
    move-object/from16 v16, v10

    .line 251
    .line 252
    invoke-direct/range {v11 .. v16}, Landroidx/fragment/app/a;-><init>(Ls7;Ler0;Ljava/lang/ClassLoader;Lt70;Le80;)V

    .line 253
    .line 254
    .line 255
    move-object v12, v11

    .line 256
    :goto_4
    iget-object v7, v12, Landroidx/fragment/app/a;->c:Lh70;

    .line 257
    .line 258
    iput-object v0, v7, Lh70;->A:Lz70;

    .line 259
    .line 260
    invoke-static {v9}, Lz70;->F(I)Z

    .line 261
    .line 262
    .line 263
    move-result v9

    .line 264
    if-eqz v9, :cond_9

    .line 265
    .line 266
    invoke-virtual {v7}, Lh70;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    :cond_9
    iget-object v7, v0, Lz70;->t:Lj70;

    .line 270
    .line 271
    iget-object v7, v7, Lj70;->y:Le6;

    .line 272
    .line 273
    invoke-virtual {v7}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 274
    .line 275
    .line 276
    move-result-object v7

    .line 277
    invoke-virtual {v12, v7}, Landroidx/fragment/app/a;->m(Ljava/lang/ClassLoader;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v3, v12}, Ler0;->m(Landroidx/fragment/app/a;)V

    .line 281
    .line 282
    .line 283
    iget v7, v0, Lz70;->s:I

    .line 284
    .line 285
    iput v7, v12, Landroidx/fragment/app/a;->e:I

    .line 286
    .line 287
    goto :goto_3

    .line 288
    :cond_a
    iget-object v2, v0, Lz70;->L:Lb80;

    .line 289
    .line 290
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 291
    .line 292
    .line 293
    new-instance v4, Ljava/util/ArrayList;

    .line 294
    .line 295
    iget-object v2, v2, Lb80;->c:Ljava/util/HashMap;

    .line 296
    .line 297
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 305
    .line 306
    .line 307
    move-result v2

    .line 308
    const/4 v5, 0x0

    .line 309
    :goto_5
    const/4 v10, 0x1

    .line 310
    if-ge v5, v2, :cond_d

    .line 311
    .line 312
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    add-int/lit8 v5, v5, 0x1

    .line 317
    .line 318
    check-cast v11, Lh70;

    .line 319
    .line 320
    iget-object v12, v11, Lh70;->n:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {v6, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v12

    .line 326
    if-eqz v12, :cond_b

    .line 327
    .line 328
    goto :goto_5

    .line 329
    :cond_b
    invoke-static {v9}, Lz70;->F(I)Z

    .line 330
    .line 331
    .line 332
    move-result v12

    .line 333
    if-eqz v12, :cond_c

    .line 334
    .line 335
    invoke-virtual {v11}, Lh70;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    iget-object v12, v1, La80;->j:Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    :cond_c
    iget-object v12, v0, Lz70;->L:Lb80;

    .line 344
    .line 345
    invoke-virtual {v12, v11}, Lb80;->c(Lh70;)V

    .line 346
    .line 347
    .line 348
    iput-object v0, v11, Lh70;->A:Lz70;

    .line 349
    .line 350
    new-instance v12, Landroidx/fragment/app/a;

    .line 351
    .line 352
    invoke-direct {v12, v7, v3, v11}, Landroidx/fragment/app/a;-><init>(Ls7;Ler0;Lh70;)V

    .line 353
    .line 354
    .line 355
    iput v10, v12, Landroidx/fragment/app/a;->e:I

    .line 356
    .line 357
    invoke-virtual {v12}, Landroidx/fragment/app/a;->k()V

    .line 358
    .line 359
    .line 360
    iput-boolean v10, v11, Lh70;->u:Z

    .line 361
    .line 362
    invoke-virtual {v12}, Landroidx/fragment/app/a;->k()V

    .line 363
    .line 364
    .line 365
    goto :goto_5

    .line 366
    :cond_d
    iget-object v2, v1, La80;->k:Ljava/util/ArrayList;

    .line 367
    .line 368
    iget-object v4, v3, Ler0;->k:Ljava/lang/Object;

    .line 369
    .line 370
    check-cast v4, Ljava/util/ArrayList;

    .line 371
    .line 372
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 373
    .line 374
    .line 375
    if-eqz v2, :cond_10

    .line 376
    .line 377
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 378
    .line 379
    .line 380
    move-result v4

    .line 381
    const/4 v5, 0x0

    .line 382
    :goto_6
    if-ge v5, v4, :cond_10

    .line 383
    .line 384
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v6

    .line 388
    add-int/lit8 v5, v5, 0x1

    .line 389
    .line 390
    check-cast v6, Ljava/lang/String;

    .line 391
    .line 392
    invoke-virtual {v3, v6}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 393
    .line 394
    .line 395
    move-result-object v7

    .line 396
    if-eqz v7, :cond_f

    .line 397
    .line 398
    invoke-static {v9}, Lz70;->F(I)Z

    .line 399
    .line 400
    .line 401
    move-result v6

    .line 402
    if-eqz v6, :cond_e

    .line 403
    .line 404
    invoke-virtual {v7}, Lh70;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    :cond_e
    invoke-virtual {v3, v7}, Ler0;->b(Lh70;)V

    .line 408
    .line 409
    .line 410
    goto :goto_6

    .line 411
    :cond_f
    const-string v0, "No instantiated fragment for ("

    .line 412
    .line 413
    const-string v1, ")"

    .line 414
    .line 415
    invoke-static {v0, v6, v1}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    return-void

    .line 423
    :cond_10
    iget-object v2, v1, La80;->l:[Luf;

    .line 424
    .line 425
    if-eqz v2, :cond_18

    .line 426
    .line 427
    new-instance v2, Ljava/util/ArrayList;

    .line 428
    .line 429
    iget-object v4, v1, La80;->l:[Luf;

    .line 430
    .line 431
    array-length v4, v4

    .line 432
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 433
    .line 434
    .line 435
    iput-object v2, v0, Lz70;->d:Ljava/util/ArrayList;

    .line 436
    .line 437
    const/4 v2, 0x0

    .line 438
    :goto_7
    iget-object v4, v1, La80;->l:[Luf;

    .line 439
    .line 440
    array-length v5, v4

    .line 441
    if-ge v2, v5, :cond_17

    .line 442
    .line 443
    aget-object v4, v4, v2

    .line 444
    .line 445
    iget-object v5, v4, Luf;->k:Ljava/util/ArrayList;

    .line 446
    .line 447
    new-instance v6, Ltf;

    .line 448
    .line 449
    invoke-direct {v6, v0}, Ltf;-><init>(Lz70;)V

    .line 450
    .line 451
    .line 452
    iget-object v7, v4, Luf;->j:[I

    .line 453
    .line 454
    const/4 v11, 0x0

    .line 455
    const/4 v12, 0x0

    .line 456
    :goto_8
    array-length v13, v7

    .line 457
    if-ge v11, v13, :cond_13

    .line 458
    .line 459
    new-instance v13, Li80;

    .line 460
    .line 461
    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    .line 462
    .line 463
    .line 464
    add-int/lit8 v14, v11, 0x1

    .line 465
    .line 466
    aget v15, v7, v11

    .line 467
    .line 468
    iput v15, v13, Li80;->a:I

    .line 469
    .line 470
    invoke-static {v9}, Lz70;->F(I)Z

    .line 471
    .line 472
    .line 473
    move-result v15

    .line 474
    if-eqz v15, :cond_11

    .line 475
    .line 476
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    aget v15, v7, v14

    .line 480
    .line 481
    :cond_11
    invoke-static {}, Lwh0;->values()[Lwh0;

    .line 482
    .line 483
    .line 484
    move-result-object v15

    .line 485
    move/from16 p1, v9

    .line 486
    .line 487
    iget-object v9, v4, Luf;->l:[I

    .line 488
    .line 489
    aget v9, v9, v12

    .line 490
    .line 491
    aget-object v9, v15, v9

    .line 492
    .line 493
    iput-object v9, v13, Li80;->h:Lwh0;

    .line 494
    .line 495
    invoke-static {}, Lwh0;->values()[Lwh0;

    .line 496
    .line 497
    .line 498
    move-result-object v9

    .line 499
    iget-object v15, v4, Luf;->m:[I

    .line 500
    .line 501
    aget v15, v15, v12

    .line 502
    .line 503
    aget-object v9, v9, v15

    .line 504
    .line 505
    iput-object v9, v13, Li80;->i:Lwh0;

    .line 506
    .line 507
    add-int/lit8 v9, v11, 0x2

    .line 508
    .line 509
    aget v14, v7, v14

    .line 510
    .line 511
    if-eqz v14, :cond_12

    .line 512
    .line 513
    move v14, v10

    .line 514
    goto :goto_9

    .line 515
    :cond_12
    const/4 v14, 0x0

    .line 516
    :goto_9
    iput-boolean v14, v13, Li80;->c:Z

    .line 517
    .line 518
    add-int/lit8 v14, v11, 0x3

    .line 519
    .line 520
    aget v9, v7, v9

    .line 521
    .line 522
    iput v9, v13, Li80;->d:I

    .line 523
    .line 524
    add-int/lit8 v15, v11, 0x4

    .line 525
    .line 526
    aget v14, v7, v14

    .line 527
    .line 528
    iput v14, v13, Li80;->e:I

    .line 529
    .line 530
    add-int/lit8 v16, v11, 0x5

    .line 531
    .line 532
    aget v15, v7, v15

    .line 533
    .line 534
    iput v15, v13, Li80;->f:I

    .line 535
    .line 536
    add-int/lit8 v11, v11, 0x6

    .line 537
    .line 538
    aget v8, v7, v16

    .line 539
    .line 540
    iput v8, v13, Li80;->g:I

    .line 541
    .line 542
    iput v9, v6, Ltf;->b:I

    .line 543
    .line 544
    iput v14, v6, Ltf;->c:I

    .line 545
    .line 546
    iput v15, v6, Ltf;->d:I

    .line 547
    .line 548
    iput v8, v6, Ltf;->e:I

    .line 549
    .line 550
    invoke-virtual {v6, v13}, Ltf;->b(Li80;)V

    .line 551
    .line 552
    .line 553
    add-int/lit8 v12, v12, 0x1

    .line 554
    .line 555
    move/from16 v9, p1

    .line 556
    .line 557
    goto :goto_8

    .line 558
    :cond_13
    move/from16 p1, v9

    .line 559
    .line 560
    iget v7, v4, Luf;->n:I

    .line 561
    .line 562
    iput v7, v6, Ltf;->f:I

    .line 563
    .line 564
    iget-object v7, v4, Luf;->o:Ljava/lang/String;

    .line 565
    .line 566
    iput-object v7, v6, Ltf;->i:Ljava/lang/String;

    .line 567
    .line 568
    iput-boolean v10, v6, Ltf;->g:Z

    .line 569
    .line 570
    iget v7, v4, Luf;->q:I

    .line 571
    .line 572
    iput v7, v6, Ltf;->j:I

    .line 573
    .line 574
    iget-object v7, v4, Luf;->r:Ljava/lang/CharSequence;

    .line 575
    .line 576
    iput-object v7, v6, Ltf;->k:Ljava/lang/CharSequence;

    .line 577
    .line 578
    iget v7, v4, Luf;->s:I

    .line 579
    .line 580
    iput v7, v6, Ltf;->l:I

    .line 581
    .line 582
    iget-object v7, v4, Luf;->t:Ljava/lang/CharSequence;

    .line 583
    .line 584
    iput-object v7, v6, Ltf;->m:Ljava/lang/CharSequence;

    .line 585
    .line 586
    iget-object v7, v4, Luf;->u:Ljava/util/ArrayList;

    .line 587
    .line 588
    iput-object v7, v6, Ltf;->n:Ljava/util/ArrayList;

    .line 589
    .line 590
    iget-object v7, v4, Luf;->v:Ljava/util/ArrayList;

    .line 591
    .line 592
    iput-object v7, v6, Ltf;->o:Ljava/util/ArrayList;

    .line 593
    .line 594
    iget-boolean v7, v4, Luf;->w:Z

    .line 595
    .line 596
    iput-boolean v7, v6, Ltf;->p:Z

    .line 597
    .line 598
    iget v4, v4, Luf;->p:I

    .line 599
    .line 600
    iput v4, v6, Ltf;->s:I

    .line 601
    .line 602
    const/4 v4, 0x0

    .line 603
    :goto_a
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 604
    .line 605
    .line 606
    move-result v7

    .line 607
    if-ge v4, v7, :cond_15

    .line 608
    .line 609
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 610
    .line 611
    .line 612
    move-result-object v7

    .line 613
    check-cast v7, Ljava/lang/String;

    .line 614
    .line 615
    if-eqz v7, :cond_14

    .line 616
    .line 617
    iget-object v8, v6, Ltf;->a:Ljava/util/ArrayList;

    .line 618
    .line 619
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    move-result-object v8

    .line 623
    check-cast v8, Li80;

    .line 624
    .line 625
    invoke-virtual {v3, v7}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 626
    .line 627
    .line 628
    move-result-object v7

    .line 629
    iput-object v7, v8, Li80;->b:Lh70;

    .line 630
    .line 631
    :cond_14
    add-int/lit8 v4, v4, 0x1

    .line 632
    .line 633
    goto :goto_a

    .line 634
    :cond_15
    invoke-virtual {v6, v10}, Ltf;->c(I)V

    .line 635
    .line 636
    .line 637
    invoke-static/range {p1 .. p1}, Lz70;->F(I)Z

    .line 638
    .line 639
    .line 640
    move-result v4

    .line 641
    if-eqz v4, :cond_16

    .line 642
    .line 643
    invoke-virtual {v6}, Ltf;->toString()Ljava/lang/String;

    .line 644
    .line 645
    .line 646
    new-instance v4, Lpk0;

    .line 647
    .line 648
    invoke-direct {v4}, Lpk0;-><init>()V

    .line 649
    .line 650
    .line 651
    new-instance v5, Ljava/io/PrintWriter;

    .line 652
    .line 653
    invoke-direct {v5, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 654
    .line 655
    .line 656
    const-string v4, "  "

    .line 657
    .line 658
    const/4 v7, 0x0

    .line 659
    invoke-virtual {v6, v4, v5, v7}, Ltf;->f(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {v5}, Ljava/io/PrintWriter;->close()V

    .line 663
    .line 664
    .line 665
    goto :goto_b

    .line 666
    :cond_16
    const/4 v7, 0x0

    .line 667
    :goto_b
    iget-object v4, v0, Lz70;->d:Ljava/util/ArrayList;

    .line 668
    .line 669
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 670
    .line 671
    .line 672
    add-int/lit8 v2, v2, 0x1

    .line 673
    .line 674
    move/from16 v9, p1

    .line 675
    .line 676
    goto/16 :goto_7

    .line 677
    .line 678
    :cond_17
    const/4 v7, 0x0

    .line 679
    goto :goto_c

    .line 680
    :cond_18
    const/4 v7, 0x0

    .line 681
    const/4 v2, 0x0

    .line 682
    iput-object v2, v0, Lz70;->d:Ljava/util/ArrayList;

    .line 683
    .line 684
    :goto_c
    iget-object v2, v0, Lz70;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 685
    .line 686
    iget v4, v1, La80;->m:I

    .line 687
    .line 688
    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 689
    .line 690
    .line 691
    iget-object v2, v1, La80;->n:Ljava/lang/String;

    .line 692
    .line 693
    if-eqz v2, :cond_19

    .line 694
    .line 695
    invoke-virtual {v3, v2}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 696
    .line 697
    .line 698
    move-result-object v2

    .line 699
    iput-object v2, v0, Lz70;->w:Lh70;

    .line 700
    .line 701
    invoke-virtual {v0, v2}, Lz70;->q(Lh70;)V

    .line 702
    .line 703
    .line 704
    :cond_19
    iget-object v2, v1, La80;->o:Ljava/util/ArrayList;

    .line 705
    .line 706
    if-eqz v2, :cond_1a

    .line 707
    .line 708
    move v8, v7

    .line 709
    :goto_d
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 710
    .line 711
    .line 712
    move-result v3

    .line 713
    if-ge v8, v3, :cond_1a

    .line 714
    .line 715
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 716
    .line 717
    .line 718
    move-result-object v3

    .line 719
    check-cast v3, Ljava/lang/String;

    .line 720
    .line 721
    iget-object v4, v1, La80;->p:Ljava/util/ArrayList;

    .line 722
    .line 723
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object v4

    .line 727
    check-cast v4, Lvf;

    .line 728
    .line 729
    iget-object v5, v0, Lz70;->j:Ljava/util/Map;

    .line 730
    .line 731
    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 732
    .line 733
    .line 734
    add-int/lit8 v8, v8, 0x1

    .line 735
    .line 736
    goto :goto_d

    .line 737
    :cond_1a
    new-instance v2, Ljava/util/ArrayDeque;

    .line 738
    .line 739
    iget-object v1, v1, La80;->q:Ljava/util/ArrayList;

    .line 740
    .line 741
    invoke-direct {v2, v1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 742
    .line 743
    .line 744
    iput-object v2, v0, Lz70;->C:Ljava/util/ArrayDeque;

    .line 745
    .line 746
    return-void
.end method

.method public final R()Landroid/os/Bundle;
    .locals 13

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lz70;->e()Ljava/util/HashSet;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lhw;

    .line 26
    .line 27
    iget-boolean v4, v2, Lhw;->e:Z

    .line 28
    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    iput-boolean v3, v2, Lhw;->e:Z

    .line 32
    .line 33
    invoke-virtual {v2}, Lhw;->c()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Lz70;->e()Ljava/util/HashSet;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lhw;

    .line 56
    .line 57
    invoke-virtual {v2}, Lhw;->e()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const/4 v1, 0x1

    .line 62
    invoke-virtual {p0, v1}, Lz70;->y(Z)Z

    .line 63
    .line 64
    .line 65
    iput-boolean v1, p0, Lz70;->E:Z

    .line 66
    .line 67
    iget-object v2, p0, Lz70;->L:Lb80;

    .line 68
    .line 69
    iput-boolean v1, v2, Lb80;->h:Z

    .line 70
    .line 71
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    new-instance v2, Ljava/util/ArrayList;

    .line 77
    .line 78
    iget-object v1, v1, Ler0;->l:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v1, Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    const/4 v5, 0x0

    .line 102
    const/4 v6, 0x2

    .line 103
    if-eqz v4, :cond_f

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Landroidx/fragment/app/a;

    .line 110
    .line 111
    if-eqz v4, :cond_3

    .line 112
    .line 113
    iget-object v7, v4, Landroidx/fragment/app/a;->c:Lh70;

    .line 114
    .line 115
    new-instance v8, Le80;

    .line 116
    .line 117
    invoke-direct {v8, v7}, Le80;-><init>(Lh70;)V

    .line 118
    .line 119
    .line 120
    iget v9, v7, Lh70;->j:I

    .line 121
    .line 122
    const/4 v10, -0x1

    .line 123
    if-le v9, v10, :cond_d

    .line 124
    .line 125
    iget-object v9, v8, Le80;->v:Landroid/os/Bundle;

    .line 126
    .line 127
    if-nez v9, :cond_d

    .line 128
    .line 129
    new-instance v9, Landroid/os/Bundle;

    .line 130
    .line 131
    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v7, v9}, Lh70;->A(Landroid/os/Bundle;)V

    .line 135
    .line 136
    .line 137
    iget-object v10, v7, Lh70;->Z:Lo80;

    .line 138
    .line 139
    invoke-virtual {v10, v9}, Lo80;->e(Landroid/os/Bundle;)V

    .line 140
    .line 141
    .line 142
    iget-object v10, v7, Lh70;->C:Lz70;

    .line 143
    .line 144
    invoke-virtual {v10}, Lz70;->R()Landroid/os/Bundle;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    const-string v11, "android:support:fragments"

    .line 149
    .line 150
    invoke-virtual {v9, v11, v10}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 151
    .line 152
    .line 153
    iget-object v10, v4, Landroidx/fragment/app/a;->a:Ls7;

    .line 154
    .line 155
    invoke-virtual {v10, v3}, Ls7;->p(Z)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v9}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    if-eqz v10, :cond_4

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_4
    move-object v5, v9

    .line 166
    :goto_3
    iget-object v9, v7, Lh70;->N:Landroid/view/View;

    .line 167
    .line 168
    if-eqz v9, :cond_5

    .line 169
    .line 170
    invoke-virtual {v4}, Landroidx/fragment/app/a;->o()V

    .line 171
    .line 172
    .line 173
    :cond_5
    iget-object v9, v7, Lh70;->l:Landroid/util/SparseArray;

    .line 174
    .line 175
    if-eqz v9, :cond_7

    .line 176
    .line 177
    if-nez v5, :cond_6

    .line 178
    .line 179
    new-instance v5, Landroid/os/Bundle;

    .line 180
    .line 181
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 182
    .line 183
    .line 184
    :cond_6
    const-string v9, "android:view_state"

    .line 185
    .line 186
    iget-object v10, v7, Lh70;->l:Landroid/util/SparseArray;

    .line 187
    .line 188
    invoke-virtual {v5, v9, v10}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 189
    .line 190
    .line 191
    :cond_7
    iget-object v9, v7, Lh70;->m:Landroid/os/Bundle;

    .line 192
    .line 193
    if-eqz v9, :cond_9

    .line 194
    .line 195
    if-nez v5, :cond_8

    .line 196
    .line 197
    new-instance v5, Landroid/os/Bundle;

    .line 198
    .line 199
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 200
    .line 201
    .line 202
    :cond_8
    const-string v9, "android:view_registry_state"

    .line 203
    .line 204
    iget-object v10, v7, Lh70;->m:Landroid/os/Bundle;

    .line 205
    .line 206
    invoke-virtual {v5, v9, v10}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 207
    .line 208
    .line 209
    :cond_9
    iget-boolean v9, v7, Lh70;->P:Z

    .line 210
    .line 211
    if-nez v9, :cond_b

    .line 212
    .line 213
    if-nez v5, :cond_a

    .line 214
    .line 215
    new-instance v5, Landroid/os/Bundle;

    .line 216
    .line 217
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 218
    .line 219
    .line 220
    :cond_a
    const-string v9, "android:user_visible_hint"

    .line 221
    .line 222
    iget-boolean v10, v7, Lh70;->P:Z

    .line 223
    .line 224
    invoke-virtual {v5, v9, v10}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 225
    .line 226
    .line 227
    :cond_b
    iput-object v5, v8, Le80;->v:Landroid/os/Bundle;

    .line 228
    .line 229
    iget-object v9, v7, Lh70;->q:Ljava/lang/String;

    .line 230
    .line 231
    if-eqz v9, :cond_e

    .line 232
    .line 233
    if-nez v5, :cond_c

    .line 234
    .line 235
    new-instance v5, Landroid/os/Bundle;

    .line 236
    .line 237
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object v5, v8, Le80;->v:Landroid/os/Bundle;

    .line 241
    .line 242
    :cond_c
    const-string v9, "android:target_state"

    .line 243
    .line 244
    iget-object v10, v7, Lh70;->q:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v5, v9, v10}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget v5, v7, Lh70;->r:I

    .line 250
    .line 251
    if-eqz v5, :cond_e

    .line 252
    .line 253
    iget-object v9, v8, Le80;->v:Landroid/os/Bundle;

    .line 254
    .line 255
    const-string v10, "android:target_req_state"

    .line 256
    .line 257
    invoke-virtual {v9, v10, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 258
    .line 259
    .line 260
    goto :goto_4

    .line 261
    :cond_d
    iget-object v5, v7, Lh70;->k:Landroid/os/Bundle;

    .line 262
    .line 263
    iput-object v5, v8, Le80;->v:Landroid/os/Bundle;

    .line 264
    .line 265
    :cond_e
    :goto_4
    iget-object v4, v4, Landroidx/fragment/app/a;->b:Ler0;

    .line 266
    .line 267
    iget-object v5, v7, Lh70;->n:Ljava/lang/String;

    .line 268
    .line 269
    iget-object v4, v4, Ler0;->m:Ljava/lang/Object;

    .line 270
    .line 271
    check-cast v4, Ljava/util/HashMap;

    .line 272
    .line 273
    invoke-virtual {v4, v5, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    check-cast v4, Le80;

    .line 278
    .line 279
    iget-object v4, v7, Lh70;->n:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    invoke-static {v6}, Lz70;->F(I)Z

    .line 285
    .line 286
    .line 287
    move-result v4

    .line 288
    if-eqz v4, :cond_3

    .line 289
    .line 290
    invoke-virtual {v7}, Lh70;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    iget-object v4, v7, Lh70;->k:Landroid/os/Bundle;

    .line 294
    .line 295
    invoke-static {v4}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    goto/16 :goto_2

    .line 299
    .line 300
    :cond_f
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 301
    .line 302
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 303
    .line 304
    .line 305
    new-instance v4, Ljava/util/ArrayList;

    .line 306
    .line 307
    iget-object v1, v1, Ler0;->m:Ljava/lang/Object;

    .line 308
    .line 309
    check-cast v1, Ljava/util/HashMap;

    .line 310
    .line 311
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    if-eqz v1, :cond_10

    .line 323
    .line 324
    goto/16 :goto_a

    .line 325
    .line 326
    :cond_10
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 327
    .line 328
    iget-object v7, v1, Ler0;->k:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast v7, Ljava/util/ArrayList;

    .line 331
    .line 332
    monitor-enter v7

    .line 333
    :try_start_0
    iget-object v8, v1, Ler0;->k:Ljava/lang/Object;

    .line 334
    .line 335
    check-cast v8, Ljava/util/ArrayList;

    .line 336
    .line 337
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 338
    .line 339
    .line 340
    move-result v8

    .line 341
    if-eqz v8, :cond_11

    .line 342
    .line 343
    monitor-exit v7

    .line 344
    move-object v8, v5

    .line 345
    goto :goto_6

    .line 346
    :catchall_0
    move-exception p0

    .line 347
    goto/16 :goto_b

    .line 348
    .line 349
    :cond_11
    new-instance v8, Ljava/util/ArrayList;

    .line 350
    .line 351
    iget-object v9, v1, Ler0;->k:Ljava/lang/Object;

    .line 352
    .line 353
    check-cast v9, Ljava/util/ArrayList;

    .line 354
    .line 355
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 356
    .line 357
    .line 358
    move-result v9

    .line 359
    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 360
    .line 361
    .line 362
    iget-object v1, v1, Ler0;->k:Ljava/lang/Object;

    .line 363
    .line 364
    check-cast v1, Ljava/util/ArrayList;

    .line 365
    .line 366
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 367
    .line 368
    .line 369
    move-result v9

    .line 370
    move v10, v3

    .line 371
    :cond_12
    :goto_5
    if-ge v10, v9, :cond_13

    .line 372
    .line 373
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v11

    .line 377
    add-int/lit8 v10, v10, 0x1

    .line 378
    .line 379
    check-cast v11, Lh70;

    .line 380
    .line 381
    iget-object v12, v11, Lh70;->n:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    invoke-static {v6}, Lz70;->F(I)Z

    .line 387
    .line 388
    .line 389
    move-result v12

    .line 390
    if-eqz v12, :cond_12

    .line 391
    .line 392
    invoke-virtual {v11}, Lh70;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    goto :goto_5

    .line 396
    :cond_13
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    :goto_6
    iget-object v1, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 398
    .line 399
    if-eqz v1, :cond_15

    .line 400
    .line 401
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    if-lez v1, :cond_15

    .line 406
    .line 407
    new-array v7, v1, [Luf;

    .line 408
    .line 409
    move v9, v3

    .line 410
    :goto_7
    if-ge v9, v1, :cond_16

    .line 411
    .line 412
    new-instance v10, Luf;

    .line 413
    .line 414
    iget-object v11, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 415
    .line 416
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v11

    .line 420
    check-cast v11, Ltf;

    .line 421
    .line 422
    invoke-direct {v10, v11}, Luf;-><init>(Ltf;)V

    .line 423
    .line 424
    .line 425
    aput-object v10, v7, v9

    .line 426
    .line 427
    invoke-static {v6}, Lz70;->F(I)Z

    .line 428
    .line 429
    .line 430
    move-result v10

    .line 431
    if-eqz v10, :cond_14

    .line 432
    .line 433
    iget-object v10, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 434
    .line 435
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v10

    .line 439
    invoke-static {v10}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    :cond_14
    add-int/lit8 v9, v9, 0x1

    .line 443
    .line 444
    goto :goto_7

    .line 445
    :cond_15
    move-object v7, v5

    .line 446
    :cond_16
    new-instance v1, La80;

    .line 447
    .line 448
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 449
    .line 450
    .line 451
    iput-object v5, v1, La80;->n:Ljava/lang/String;

    .line 452
    .line 453
    new-instance v5, Ljava/util/ArrayList;

    .line 454
    .line 455
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 456
    .line 457
    .line 458
    iput-object v5, v1, La80;->o:Ljava/util/ArrayList;

    .line 459
    .line 460
    new-instance v6, Ljava/util/ArrayList;

    .line 461
    .line 462
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 463
    .line 464
    .line 465
    iput-object v6, v1, La80;->p:Ljava/util/ArrayList;

    .line 466
    .line 467
    iput-object v2, v1, La80;->j:Ljava/util/ArrayList;

    .line 468
    .line 469
    iput-object v8, v1, La80;->k:Ljava/util/ArrayList;

    .line 470
    .line 471
    iput-object v7, v1, La80;->l:[Luf;

    .line 472
    .line 473
    iget-object v2, p0, Lz70;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 474
    .line 475
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 476
    .line 477
    .line 478
    move-result v2

    .line 479
    iput v2, v1, La80;->m:I

    .line 480
    .line 481
    iget-object v2, p0, Lz70;->w:Lh70;

    .line 482
    .line 483
    if-eqz v2, :cond_17

    .line 484
    .line 485
    iget-object v2, v2, Lh70;->n:Ljava/lang/String;

    .line 486
    .line 487
    iput-object v2, v1, La80;->n:Ljava/lang/String;

    .line 488
    .line 489
    :cond_17
    iget-object v2, p0, Lz70;->j:Ljava/util/Map;

    .line 490
    .line 491
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 496
    .line 497
    .line 498
    iget-object v2, p0, Lz70;->j:Ljava/util/Map;

    .line 499
    .line 500
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 501
    .line 502
    .line 503
    move-result-object v2

    .line 504
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 505
    .line 506
    .line 507
    new-instance v2, Ljava/util/ArrayList;

    .line 508
    .line 509
    iget-object v5, p0, Lz70;->C:Ljava/util/ArrayDeque;

    .line 510
    .line 511
    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 512
    .line 513
    .line 514
    iput-object v2, v1, La80;->q:Ljava/util/ArrayList;

    .line 515
    .line 516
    const-string v2, "state"

    .line 517
    .line 518
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 519
    .line 520
    .line 521
    iget-object v1, p0, Lz70;->k:Ljava/util/Map;

    .line 522
    .line 523
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 532
    .line 533
    .line 534
    move-result v2

    .line 535
    if-eqz v2, :cond_18

    .line 536
    .line 537
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    check-cast v2, Ljava/lang/String;

    .line 542
    .line 543
    const-string v5, "result_"

    .line 544
    .line 545
    invoke-static {v5, v2}, Loq;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v5

    .line 549
    iget-object v6, p0, Lz70;->k:Ljava/util/Map;

    .line 550
    .line 551
    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object v2

    .line 555
    check-cast v2, Landroid/os/Bundle;

    .line 556
    .line 557
    invoke-virtual {v0, v5, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 558
    .line 559
    .line 560
    goto :goto_8

    .line 561
    :cond_18
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 562
    .line 563
    .line 564
    move-result p0

    .line 565
    :goto_9
    if-ge v3, p0, :cond_19

    .line 566
    .line 567
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    add-int/lit8 v3, v3, 0x1

    .line 572
    .line 573
    check-cast v1, Le80;

    .line 574
    .line 575
    new-instance v2, Landroid/os/Bundle;

    .line 576
    .line 577
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 578
    .line 579
    .line 580
    const-string v5, "state"

    .line 581
    .line 582
    invoke-virtual {v2, v5, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 583
    .line 584
    .line 585
    new-instance v5, Ljava/lang/StringBuilder;

    .line 586
    .line 587
    const-string v6, "fragment_"

    .line 588
    .line 589
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    iget-object v1, v1, Le80;->k:Ljava/lang/String;

    .line 593
    .line 594
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v1

    .line 601
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 602
    .line 603
    .line 604
    goto :goto_9

    .line 605
    :cond_19
    :goto_a
    return-object v0

    .line 606
    :goto_b
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 607
    throw p0
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 14
    .line 15
    iget-object v1, v1, Lj70;->z:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object v2, p0, Lz70;->M:Lu70;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 23
    .line 24
    iget-object v1, v1, Lj70;->z:Landroid/os/Handler;

    .line 25
    .line 26
    iget-object v2, p0, Lz70;->M:Lu70;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lz70;->Z()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    monitor-exit v0

    .line 38
    return-void

    .line 39
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p0
.end method

.method public final T(Lh70;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lz70;->C(Lh70;)Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p1, p0, Ll70;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Ll70;

    .line 12
    .line 13
    xor-int/lit8 p1, p2, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll70;->setDrawDisappearingViewsLast(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final U(Lh70;Lwh0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lh70;->n:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lh70;->B:Lj70;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lh70;->A:Lz70;

    .line 16
    .line 17
    if-ne v0, p0, :cond_1

    .line 18
    .line 19
    :cond_0
    iput-object p2, p1, Lh70;->V:Lwh0;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const-string p2, "Fragment "

    .line 23
    .line 24
    const-string v0, " is not an active fragment of FragmentManager "

    .line 25
    .line 26
    invoke-static {p2, p1, v0, p0}, Lo40;->m(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final V(Lh70;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lh70;->n:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Lh70;->B:Lj70;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p1, Lh70;->A:Lz70;

    .line 18
    .line 19
    if-ne v0, p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v0, "Fragment "

    .line 23
    .line 24
    const-string v1, " is not an active fragment of FragmentManager "

    .line 25
    .line 26
    invoke-static {v0, p1, v1, p0}, Lo40;->m(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    iget-object v0, p0, Lz70;->w:Lh70;

    .line 31
    .line 32
    iput-object p1, p0, Lz70;->w:Lh70;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lz70;->q(Lh70;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lz70;->w:Lh70;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lz70;->q(Lh70;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final W(Lh70;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lz70;->C(Lh70;)Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_7

    .line 6
    .line 7
    iget-object v0, p1, Lh70;->Q:Lg70;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    move v2, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v2, v0, Lg70;->b:I

    .line 15
    .line 16
    :goto_0
    if-nez v0, :cond_1

    .line 17
    .line 18
    move v3, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    iget v3, v0, Lg70;->c:I

    .line 21
    .line 22
    :goto_1
    add-int/2addr v3, v2

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    move v2, v1

    .line 26
    goto :goto_2

    .line 27
    :cond_2
    iget v2, v0, Lg70;->d:I

    .line 28
    .line 29
    :goto_2
    add-int/2addr v2, v3

    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    move v0, v1

    .line 33
    goto :goto_3

    .line 34
    :cond_3
    iget v0, v0, Lg70;->e:I

    .line 35
    .line 36
    :goto_3
    add-int/2addr v0, v2

    .line 37
    if-lez v0, :cond_7

    .line 38
    .line 39
    const v0, 0x7f090226

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-nez v2, :cond_4

    .line 47
    .line 48
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lh70;

    .line 56
    .line 57
    iget-object p1, p1, Lh70;->Q:Lg70;

    .line 58
    .line 59
    if-nez p1, :cond_5

    .line 60
    .line 61
    goto :goto_4

    .line 62
    :cond_5
    iget-boolean v1, p1, Lg70;->a:Z

    .line 63
    .line 64
    :goto_4
    iget-object p1, p0, Lh70;->Q:Lg70;

    .line 65
    .line 66
    if-nez p1, :cond_6

    .line 67
    .line 68
    goto :goto_5

    .line 69
    :cond_6
    invoke-virtual {p0}, Lh70;->f()Lg70;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-boolean v1, p0, Lg70;->a:Z

    .line 74
    .line 75
    :cond_7
    :goto_5
    return-void
.end method

.method public final X()V
    .locals 7

    .line 1
    iget-object v0, p0, Lz70;->c:Ler0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ler0;->j()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :cond_0
    :goto_0
    if-ge v3, v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    add-int/lit8 v3, v3, 0x1

    .line 20
    .line 21
    check-cast v4, Landroidx/fragment/app/a;

    .line 22
    .line 23
    iget-object v5, v4, Landroidx/fragment/app/a;->c:Lh70;

    .line 24
    .line 25
    iget-boolean v6, v5, Lh70;->O:Z

    .line 26
    .line 27
    if-eqz v6, :cond_0

    .line 28
    .line 29
    iget-boolean v6, p0, Lz70;->b:Z

    .line 30
    .line 31
    if-eqz v6, :cond_1

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    iput-boolean v4, p0, Lz70;->H:Z

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iput-boolean v2, v5, Lh70;->O:Z

    .line 38
    .line 39
    invoke-virtual {v4}, Landroidx/fragment/app/a;->k()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    return-void
.end method

.method public final Y(Ljava/lang/IllegalStateException;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lpk0;

    .line 5
    .line 6
    invoke-direct {v0}, Lpk0;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ljava/io/PrintWriter;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    const-string v4, "  "

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    :try_start_0
    new-array p0, v2, [Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, v0, Lj70;->B:Le6;

    .line 25
    .line 26
    invoke-virtual {v0, v4, v3, v1, p0}, Le6;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-array v0, v2, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v4, v3, v1, v0}, Lz70;->v(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :catch_0
    :goto_0
    throw p1
.end method

.method public final Z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lz70;->h:Lr70;

    .line 14
    .line 15
    iput-boolean v2, p0, Lr70;->a:Z

    .line 16
    .line 17
    iget-object p0, p0, Lr70;->c:Lp80;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v0, p0, Lz70;->h:Lr70;

    .line 30
    .line 31
    iget-object v1, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v1, v3

    .line 42
    :goto_0
    if-lez v1, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Lz70;->v:Lh70;

    .line 45
    .line 46
    invoke-static {p0}, Lz70;->J(Lh70;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move v2, v3

    .line 54
    :goto_1
    iput-boolean v2, v0, Lr70;->a:Z

    .line 55
    .line 56
    iget-object p0, v0, Lr70;->c:Lp80;

    .line 57
    .line 58
    if-eqz p0, :cond_4

    .line 59
    .line 60
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_4
    return-void

    .line 64
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw p0
.end method

.method public final a(Lh70;)Landroidx/fragment/app/a;
    .locals 3

    .line 1
    iget-object v0, p1, Lh70;->U:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, v0}, Lh80;->c(Lh70;Ljava/lang/String;)V

    .line 6
    .line 7
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
    invoke-virtual {p1}, Lh70;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0, p1}, Lz70;->f(Lh70;)Landroidx/fragment/app/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object p0, p1, Lh70;->A:Lz70;

    .line 23
    .line 24
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ler0;->m(Landroidx/fragment/app/a;)V

    .line 27
    .line 28
    .line 29
    iget-boolean v2, p1, Lh70;->I:Z

    .line 30
    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ler0;->b(Lh70;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    iput-boolean v1, p1, Lh70;->u:Z

    .line 38
    .line 39
    iget-object v2, p1, Lh70;->N:Landroid/view/View;

    .line 40
    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    iput-boolean v1, p1, Lh70;->R:Z

    .line 44
    .line 45
    :cond_2
    invoke-static {p1}, Lz70;->G(Lh70;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    iput-boolean p1, p0, Lz70;->D:Z

    .line 53
    .line 54
    :cond_3
    return-object v0
.end method

.method public final b(Lj70;Lju1;Lh70;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 2
    .line 3
    if-nez v0, :cond_15

    .line 4
    .line 5
    iput-object p1, p0, Lz70;->t:Lj70;

    .line 6
    .line 7
    iput-object p2, p0, Lz70;->u:Lju1;

    .line 8
    .line 9
    iput-object p3, p0, Lz70;->v:Lh70;

    .line 10
    .line 11
    iget-object p2, p0, Lz70;->m:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    new-instance v0, Lv70;

    .line 16
    .line 17
    invoke-direct {v0, p3}, Lv70;-><init>(Lh70;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    iget-object p2, p0, Lz70;->v:Lh70;

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lz70;->Z()V

    .line 34
    .line 35
    .line 36
    :cond_2
    if-eqz p1, :cond_4

    .line 37
    .line 38
    iget-object p2, p1, Lj70;->B:Le6;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroidx/activity/a;->i()Landroidx/activity/b;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iput-object p2, p0, Lz70;->g:Landroidx/activity/b;

    .line 45
    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    move-object v0, p3

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    move-object v0, p1

    .line 51
    :goto_1
    iget-object v1, p0, Lz70;->h:Lr70;

    .line 52
    .line 53
    invoke-virtual {p2, v0, v1}, Landroidx/activity/b;->a(Lci0;Lr70;)V

    .line 54
    .line 55
    .line 56
    :cond_4
    const/4 p2, 0x0

    .line 57
    const/4 v0, 0x1

    .line 58
    if-eqz p3, :cond_6

    .line 59
    .line 60
    iget-object p1, p3, Lh70;->A:Lz70;

    .line 61
    .line 62
    iget-object p1, p1, Lz70;->L:Lb80;

    .line 63
    .line 64
    iget-object v1, p1, Lb80;->d:Ljava/util/HashMap;

    .line 65
    .line 66
    iget-object v2, p3, Lh70;->n:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lb80;

    .line 73
    .line 74
    if-nez v2, :cond_5

    .line 75
    .line 76
    new-instance v2, Lb80;

    .line 77
    .line 78
    iget-boolean p1, p1, Lb80;->f:Z

    .line 79
    .line 80
    invoke-direct {v2, p1}, Lb80;-><init>(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p3, Lh70;->n:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    :cond_5
    iput-object v2, p0, Lz70;->L:Lb80;

    .line 89
    .line 90
    :goto_2
    move-object p1, v2

    .line 91
    goto/16 :goto_6

    .line 92
    .line 93
    :cond_6
    if-eqz p1, :cond_a

    .line 94
    .line 95
    iget-object p1, p1, Lj70;->B:Le6;

    .line 96
    .line 97
    invoke-virtual {p1}, Landroidx/activity/a;->d()Lhi1;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    sget-object v1, Ldt;->k:Ldt;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    const-class v2, Lb80;

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    if-eqz v3, :cond_9

    .line 116
    .line 117
    const-string v4, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 118
    .line 119
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    iget-object p1, p1, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    check-cast v4, Lfi1;

    .line 130
    .line 131
    invoke-virtual {v2, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_7

    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    goto :goto_5

    .line 141
    :cond_7
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 142
    .line 143
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 144
    .line 145
    .line 146
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v1, Ljava/util/LinkedHashMap;

    .line 149
    .line 150
    invoke-interface {v2, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 151
    .line 152
    .line 153
    sget-object v1, Lt11;->q:Lt11;

    .line 154
    .line 155
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :try_start_0
    new-instance v1, Lb80;

    .line 159
    .line 160
    invoke-direct {v1, v0}, Lb80;-><init>(Z)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    :goto_3
    move-object v4, v1

    .line 164
    goto :goto_4

    .line 165
    :catch_0
    new-instance v1, Lb80;

    .line 166
    .line 167
    invoke-direct {v1, v0}, Lb80;-><init>(Z)V

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :goto_4
    invoke-interface {p1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    check-cast p1, Lfi1;

    .line 176
    .line 177
    if-eqz p1, :cond_8

    .line 178
    .line 179
    invoke-virtual {p1}, Lfi1;->a()V

    .line 180
    .line 181
    .line 182
    :cond_8
    :goto_5
    move-object v2, v4

    .line 183
    check-cast v2, Lb80;

    .line 184
    .line 185
    iput-object v2, p0, Lz70;->L:Lb80;

    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_9
    const-string p0, "Local and anonymous classes can not be ViewModels"

    .line 189
    .line 190
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_a
    new-instance v2, Lb80;

    .line 195
    .line 196
    invoke-direct {v2, p2}, Lb80;-><init>(Z)V

    .line 197
    .line 198
    .line 199
    iput-object v2, p0, Lz70;->L:Lb80;

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :goto_6
    iget-boolean v1, p0, Lz70;->E:Z

    .line 203
    .line 204
    if-nez v1, :cond_c

    .line 205
    .line 206
    iget-boolean v1, p0, Lz70;->F:Z

    .line 207
    .line 208
    if-eqz v1, :cond_b

    .line 209
    .line 210
    goto :goto_7

    .line 211
    :cond_b
    move v1, p2

    .line 212
    goto :goto_8

    .line 213
    :cond_c
    :goto_7
    move v1, v0

    .line 214
    :goto_8
    iput-boolean v1, v2, Lb80;->h:Z

    .line 215
    .line 216
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 217
    .line 218
    iput-object p1, v1, Ler0;->n:Ljava/lang/Object;

    .line 219
    .line 220
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 221
    .line 222
    const/4 v1, 0x2

    .line 223
    if-eqz p1, :cond_d

    .line 224
    .line 225
    if-nez p3, :cond_d

    .line 226
    .line 227
    invoke-virtual {p1}, Lj70;->a()Lk6;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    new-instance v2, Lyl;

    .line 232
    .line 233
    invoke-direct {v2, v1, p0}, Lyl;-><init>(ILjava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    const-string v3, "android:support:fragments"

    .line 237
    .line 238
    invoke-virtual {p1, v3, v2}, Lk6;->e(Ljava/lang/String;Ly21;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, v3}, Lk6;->c(Ljava/lang/String;)Landroid/os/Bundle;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    if-eqz p1, :cond_d

    .line 246
    .line 247
    invoke-virtual {p0, p1}, Lz70;->Q(Landroid/os/Parcelable;)V

    .line 248
    .line 249
    .line 250
    :cond_d
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 251
    .line 252
    if-eqz p1, :cond_f

    .line 253
    .line 254
    iget-object p1, p1, Lj70;->B:Le6;

    .line 255
    .line 256
    iget-object p1, p1, Landroidx/activity/a;->s:Lam;

    .line 257
    .line 258
    if-eqz p3, :cond_e

    .line 259
    .line 260
    new-instance v2, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 263
    .line 264
    .line 265
    iget-object v3, p3, Lh70;->n:Ljava/lang/String;

    .line 266
    .line 267
    const-string v4, ":"

    .line 268
    .line 269
    invoke-static {v2, v3, v4}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    goto :goto_9

    .line 274
    :cond_e
    const-string v2, ""

    .line 275
    .line 276
    :goto_9
    const-string v3, "FragmentManager:"

    .line 277
    .line 278
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    const-string v3, "StartActivityForResult"

    .line 283
    .line 284
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    new-instance v4, Lj3;

    .line 289
    .line 290
    invoke-direct {v4, v0}, Lj3;-><init>(I)V

    .line 291
    .line 292
    .line 293
    new-instance v5, Lbv1;

    .line 294
    .line 295
    const/16 v6, 0x16

    .line 296
    .line 297
    invoke-direct {v5, v6, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p1, v3, v4, v5}, Lam;->b(Ljava/lang/String;Lst;Li3;)Ls7;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    iput-object v3, p0, Lz70;->z:Ls7;

    .line 305
    .line 306
    const-string v3, "StartIntentSenderForResult"

    .line 307
    .line 308
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    new-instance v4, Lj3;

    .line 313
    .line 314
    invoke-direct {v4, v1}, Lj3;-><init>(I)V

    .line 315
    .line 316
    .line 317
    new-instance v1, Lq70;

    .line 318
    .line 319
    invoke-direct {v1, p0, v0}, Lq70;-><init>(Lz70;I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p1, v3, v4, v1}, Lam;->b(Ljava/lang/String;Lst;Li3;)Ls7;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    iput-object v0, p0, Lz70;->A:Ls7;

    .line 327
    .line 328
    const-string v0, "RequestPermissions"

    .line 329
    .line 330
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    new-instance v1, Lj3;

    .line 335
    .line 336
    invoke-direct {v1, p2}, Lj3;-><init>(I)V

    .line 337
    .line 338
    .line 339
    new-instance v2, Lq70;

    .line 340
    .line 341
    invoke-direct {v2, p0, p2}, Lq70;-><init>(Lz70;I)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {p1, v0, v1, v2}, Lam;->b(Ljava/lang/String;Lst;Li3;)Ls7;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    iput-object p1, p0, Lz70;->B:Ls7;

    .line 349
    .line 350
    :cond_f
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 351
    .line 352
    if-eqz p1, :cond_10

    .line 353
    .line 354
    iget-object p2, p0, Lz70;->n:Lp70;

    .line 355
    .line 356
    iget-object p1, p1, Lj70;->B:Le6;

    .line 357
    .line 358
    invoke-virtual {p1, p2}, Landroidx/activity/a;->g(Lsp;)V

    .line 359
    .line 360
    .line 361
    :cond_10
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 362
    .line 363
    if-eqz p1, :cond_11

    .line 364
    .line 365
    iget-object p1, p1, Lj70;->B:Le6;

    .line 366
    .line 367
    iget-object p1, p1, Landroidx/activity/a;->u:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 368
    .line 369
    iget-object p2, p0, Lz70;->o:Lp70;

    .line 370
    .line 371
    invoke-virtual {p1, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    :cond_11
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 375
    .line 376
    if-eqz p1, :cond_12

    .line 377
    .line 378
    iget-object p1, p1, Lj70;->B:Le6;

    .line 379
    .line 380
    iget-object p1, p1, Landroidx/activity/a;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 381
    .line 382
    iget-object p2, p0, Lz70;->p:Lp70;

    .line 383
    .line 384
    invoke-virtual {p1, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    :cond_12
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 388
    .line 389
    if-eqz p1, :cond_13

    .line 390
    .line 391
    iget-object p1, p1, Lj70;->B:Le6;

    .line 392
    .line 393
    iget-object p1, p1, Landroidx/activity/a;->x:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 394
    .line 395
    iget-object p2, p0, Lz70;->q:Lp70;

    .line 396
    .line 397
    invoke-virtual {p1, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    .line 399
    .line 400
    :cond_13
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 401
    .line 402
    if-eqz p1, :cond_14

    .line 403
    .line 404
    if-nez p3, :cond_14

    .line 405
    .line 406
    iget-object p1, p1, Lj70;->B:Le6;

    .line 407
    .line 408
    iget-object p1, p1, Landroidx/activity/a;->l:Lc9;

    .line 409
    .line 410
    iget-object p2, p1, Lc9;->m:Ljava/lang/Object;

    .line 411
    .line 412
    check-cast p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 413
    .line 414
    iget-object p0, p0, Lz70;->r:Ls70;

    .line 415
    .line 416
    invoke-virtual {p2, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    iget-object p0, p1, Lc9;->l:Ljava/lang/Object;

    .line 420
    .line 421
    check-cast p0, Ljava/lang/Runnable;

    .line 422
    .line 423
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 424
    .line 425
    .line 426
    :cond_14
    return-void

    .line 427
    :cond_15
    const-string p0, "Already attached"

    .line 428
    .line 429
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    return-void
.end method

.method public final c(Lh70;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v1, p1, Lh70;->I:Z

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p1, Lh70;->I:Z

    .line 17
    .line 18
    iget-boolean v1, p1, Lh70;->t:Z

    .line 19
    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ler0;->b(Lh70;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lz70;->F(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Lh70;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-static {p1}, Lz70;->G(Lh70;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    iput-boolean p1, p0, Lz70;->D:Z

    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lz70;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e()Ljava/util/HashSet;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ler0;->j()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    :cond_0
    :goto_0
    if-ge v3, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    check-cast v4, Landroidx/fragment/app/a;

    .line 26
    .line 27
    iget-object v4, v4, Landroidx/fragment/app/a;->c:Lh70;

    .line 28
    .line 29
    iget-object v4, v4, Lh70;->M:Landroid/view/ViewGroup;

    .line 30
    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lz70;->E()Lt11;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-static {v4, v5}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-object v0
.end method

.method public final f(Lh70;)Landroidx/fragment/app/a;
    .locals 3

    .line 1
    iget-object v0, p1, Lh70;->n:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 4
    .line 5
    iget-object v2, v1, Ler0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroidx/fragment/app/a;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    new-instance v0, Landroidx/fragment/app/a;

    .line 19
    .line 20
    iget-object v2, p0, Lz70;->l:Ls7;

    .line 21
    .line 22
    invoke-direct {v0, v2, v1, p1}, Landroidx/fragment/app/a;-><init>(Ls7;Ler0;Lh70;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lz70;->t:Lj70;

    .line 26
    .line 27
    iget-object p1, p1, Lj70;->y:Le6;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Landroidx/fragment/app/a;->m(Ljava/lang/ClassLoader;)V

    .line 34
    .line 35
    .line 36
    iget p0, p0, Lz70;->s:I

    .line 37
    .line 38
    iput p0, v0, Landroidx/fragment/app/a;->e:I

    .line 39
    .line 40
    return-object v0
.end method

.method public final g(Lh70;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v1, p1, Lh70;->I:Z

    .line 12
    .line 13
    if-nez v1, :cond_3

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p1, Lh70;->I:Z

    .line 17
    .line 18
    iget-boolean v2, p1, Lh70;->t:Z

    .line 19
    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    invoke-static {v0}, Lz70;->F(I)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Lh70;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lz70;->c:Ler0;

    .line 32
    .line 33
    iget-object v2, v0, Ler0;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v2, Ljava/util/ArrayList;

    .line 36
    .line 37
    monitor-enter v2

    .line 38
    :try_start_0
    iget-object v0, v0, Ler0;->k:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p1, Lh70;->t:Z

    .line 48
    .line 49
    invoke-static {p1}, Lz70;->G(Lh70;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iput-boolean v1, p0, Lz70;->D:Z

    .line 56
    .line 57
    :cond_2
    invoke-virtual {p0, p1}, Lz70;->W(Lh70;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw p0

    .line 64
    :cond_3
    return-void
.end method

.method public final h(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Do not call dispatchConfigurationChanged() on host. Host implements OnConfigurationChangedProvider and automatically dispatches configuration changes to fragments."

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lz70;->Y(Ljava/lang/IllegalStateException;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0

    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lh70;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    iput-boolean v1, v0, Lh70;->L:Z

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lz70;->h(Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    return-void
.end method

.method public final i()Z
    .locals 4

    .line 1
    iget v0, p0, Lz70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lh70;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-boolean v3, v0, Lh70;->H:Z

    .line 33
    .line 34
    if-nez v3, :cond_2

    .line 35
    .line 36
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 37
    .line 38
    invoke-virtual {v0}, Lz70;->i()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move v0, v1

    .line 44
    :goto_0
    if-eqz v0, :cond_1

    .line 45
    .line 46
    return v2

    .line 47
    :cond_3
    :goto_1
    return v1
.end method

.method public final j()Z
    .locals 7

    .line 1
    iget v0, p0, Lz70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget-object v0, p0, Lz70;->c:Ler0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ler0;->l()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v3, 0x0

    .line 19
    move v4, v1

    .line 20
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_4

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    check-cast v5, Lh70;

    .line 31
    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    invoke-static {v5}, Lz70;->I(Lh70;)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_1

    .line 39
    .line 40
    iget-boolean v6, v5, Lh70;->H:Z

    .line 41
    .line 42
    if-nez v6, :cond_2

    .line 43
    .line 44
    iget-object v6, v5, Lh70;->C:Lz70;

    .line 45
    .line 46
    invoke-virtual {v6}, Lz70;->j()Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v6, v1

    .line 52
    :goto_1
    if-eqz v6, :cond_1

    .line 53
    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    new-instance v3, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    :cond_3
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move v4, v2

    .line 65
    goto :goto_0

    .line 66
    :cond_4
    iget-object v0, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 67
    .line 68
    if-eqz v0, :cond_7

    .line 69
    .line 70
    :goto_2
    iget-object v0, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ge v1, v0, :cond_7

    .line 77
    .line 78
    iget-object v0, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lh70;

    .line 85
    .line 86
    if-eqz v3, :cond_5

    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-nez v2, :cond_6

    .line 93
    .line 94
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_7
    iput-object v3, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 101
    .line 102
    return v4
.end method

.method public final k()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lz70;->G:Z

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lz70;->y(Z)Z

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lz70;->e()Ljava/util/HashSet;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lhw;

    .line 26
    .line 27
    invoke-virtual {v2}, Lhw;->e()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 32
    .line 33
    iget-object v2, p0, Lz70;->c:Ler0;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v0, v2, Ler0;->n:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v0, Lb80;

    .line 40
    .line 41
    iget-boolean v0, v0, Lb80;->g:Z

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    iget-object v1, v1, Lj70;->y:Le6;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    xor-int/2addr v0, v1

    .line 51
    :goto_1
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lz70;->j:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lvf;

    .line 74
    .line 75
    iget-object v1, v1, Lvf;->j:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    const/4 v4, 0x0

    .line 82
    :goto_2
    if-ge v4, v3, :cond_2

    .line 83
    .line 84
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    add-int/lit8 v4, v4, 0x1

    .line 89
    .line 90
    check-cast v5, Ljava/lang/String;

    .line 91
    .line 92
    iget-object v6, v2, Ler0;->n:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v6, Lb80;

    .line 95
    .line 96
    invoke-virtual {v6, v5}, Lb80;->b(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_3
    const/4 v0, -0x1

    .line 101
    invoke-virtual {p0, v0}, Lz70;->t(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 105
    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    iget-object v0, v0, Lj70;->B:Le6;

    .line 109
    .line 110
    iget-object v0, v0, Landroidx/activity/a;->u:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 111
    .line 112
    iget-object v1, p0, Lz70;->o:Lp70;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_4
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 118
    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    iget-object v0, v0, Lj70;->B:Le6;

    .line 122
    .line 123
    iget-object v0, v0, Landroidx/activity/a;->t:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 124
    .line 125
    iget-object v1, p0, Lz70;->n:Lp70;

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    :cond_5
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 131
    .line 132
    if-eqz v0, :cond_6

    .line 133
    .line 134
    iget-object v0, v0, Lj70;->B:Le6;

    .line 135
    .line 136
    iget-object v0, v0, Landroidx/activity/a;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 137
    .line 138
    iget-object v1, p0, Lz70;->p:Lp70;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    :cond_6
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 144
    .line 145
    if-eqz v0, :cond_7

    .line 146
    .line 147
    iget-object v0, v0, Lj70;->B:Le6;

    .line 148
    .line 149
    iget-object v0, v0, Landroidx/activity/a;->x:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 150
    .line 151
    iget-object v1, p0, Lz70;->q:Lp70;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    :cond_7
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 157
    .line 158
    if-eqz v0, :cond_9

    .line 159
    .line 160
    iget-object v0, v0, Lj70;->B:Le6;

    .line 161
    .line 162
    iget-object v0, v0, Landroidx/activity/a;->l:Lc9;

    .line 163
    .line 164
    iget-object v1, v0, Lc9;->m:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 167
    .line 168
    iget-object v2, p0, Lz70;->r:Ls70;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    iget-object v1, v0, Lc9;->k:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast v1, Ljava/util/HashMap;

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    if-nez v1, :cond_8

    .line 182
    .line 183
    iget-object v0, v0, Lc9;->l:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v0, Ljava/lang/Runnable;

    .line 186
    .line 187
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_8
    invoke-static {}, Lz0;->a()V

    .line 192
    .line 193
    .line 194
    :cond_9
    :goto_3
    const/4 v0, 0x0

    .line 195
    iput-object v0, p0, Lz70;->t:Lj70;

    .line 196
    .line 197
    iput-object v0, p0, Lz70;->u:Lju1;

    .line 198
    .line 199
    iput-object v0, p0, Lz70;->v:Lh70;

    .line 200
    .line 201
    iget-object v1, p0, Lz70;->g:Landroidx/activity/b;

    .line 202
    .line 203
    if-eqz v1, :cond_b

    .line 204
    .line 205
    iget-object v1, p0, Lz70;->h:Lr70;

    .line 206
    .line 207
    iget-object v1, v1, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-eqz v2, :cond_a

    .line 218
    .line 219
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    check-cast v2, Lsi;

    .line 224
    .line 225
    invoke-interface {v2}, Lsi;->cancel()V

    .line 226
    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_a
    iput-object v0, p0, Lz70;->g:Landroidx/activity/b;

    .line 230
    .line 231
    :cond_b
    iget-object v0, p0, Lz70;->z:Ls7;

    .line 232
    .line 233
    if-eqz v0, :cond_c

    .line 234
    .line 235
    invoke-virtual {v0}, Ls7;->K()V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lz70;->A:Ls7;

    .line 239
    .line 240
    invoke-virtual {v0}, Ls7;->K()V

    .line 241
    .line 242
    .line 243
    iget-object p0, p0, Lz70;->B:Ls7;

    .line 244
    .line 245
    invoke-virtual {p0}, Ls7;->K()V

    .line 246
    .line 247
    .line 248
    :cond_c
    return-void
.end method

.method public final l(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Do not call dispatchLowMemory() on host. Host implements OnTrimMemoryProvider and automatically dispatches low memory callbacks to fragments."

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lz70;->Y(Ljava/lang/IllegalStateException;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0

    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lh70;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    iput-boolean v1, v0, Lh70;->L:Z

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lz70;->l(Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    return-void
.end method

.method public final m(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Do not call dispatchMultiWindowModeChanged() on host. Host implements OnMultiWindowModeChangedProvider and automatically dispatches multi-window mode changes to fragments."

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lz70;->Y(Ljava/lang/IllegalStateException;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0

    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lh70;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Lz70;->m(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ler0;->k()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :cond_0
    :goto_0
    if-ge v1, v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    check-cast v2, Lh70;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Lh70;->q()Z

    .line 25
    .line 26
    .line 27
    iget-object v2, v2, Lh70;->C:Lz70;

    .line 28
    .line 29
    invoke-virtual {v2}, Lz70;->n()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public final o()Z
    .locals 4

    .line 1
    iget v0, p0, Lz70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lh70;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-boolean v3, v0, Lh70;->H:Z

    .line 33
    .line 34
    if-nez v3, :cond_2

    .line 35
    .line 36
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 37
    .line 38
    invoke-virtual {v0}, Lz70;->o()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move v0, v1

    .line 44
    :goto_0
    if-eqz v0, :cond_1

    .line 45
    .line 46
    return v2

    .line 47
    :cond_3
    :goto_1
    return v1
.end method

.method public final p()V
    .locals 2

    .line 1
    iget v0, p0, Lz70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lh70;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-boolean v1, v0, Lh70;->H:Z

    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 36
    .line 37
    invoke-virtual {v0}, Lz70;->p()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    :goto_1
    return-void
.end method

.method public final q(Lh70;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lh70;->n:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ler0;->e(Ljava/lang/String;)Lh70;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p1, Lh70;->A:Lz70;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lz70;->J(Lh70;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iget-object v0, p1, Lh70;->s:Ljava/lang/Boolean;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eq v0, p0, :cond_2

    .line 32
    .line 33
    :cond_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, p1, Lh70;->s:Ljava/lang/Boolean;

    .line 38
    .line 39
    iget-object p0, p1, Lh70;->C:Lz70;

    .line 40
    .line 41
    invoke-virtual {p0}, Lz70;->Z()V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lz70;->w:Lh70;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lz70;->q(Lh70;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public final r(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Do not call dispatchPictureInPictureModeChanged() on host. Host implements OnPictureInPictureModeChangedProvider and automatically dispatches picture-in-picture mode changes to fragments."

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lz70;->Y(Ljava/lang/IllegalStateException;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0

    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lh70;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Lz70;->r(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    return-void
.end method

.method public final s()Z
    .locals 5

    .line 1
    iget v0, p0, Lz70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ler0;->l()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    move v0, v1

    .line 19
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_3

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lh70;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-static {v3}, Lz70;->I(Lh70;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    iget-boolean v4, v3, Lh70;->H:Z

    .line 40
    .line 41
    if-nez v4, :cond_2

    .line 42
    .line 43
    iget-object v3, v3, Lh70;->C:Lz70;

    .line 44
    .line 45
    invoke-virtual {v3}, Lz70;->s()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    move v3, v1

    .line 51
    :goto_1
    if-eqz v3, :cond_1

    .line 52
    .line 53
    move v0, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    return v0
.end method

.method public final t(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lz70;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lz70;->c:Ler0;

    .line 6
    .line 7
    iget-object v2, v2, Ler0;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroidx/fragment/app/a;

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    iput p1, v3, Landroidx/fragment/app/a;->e:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, p1, v1}, Lz70;->K(IZ)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lz70;->e()Ljava/util/HashSet;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lhw;

    .line 58
    .line 59
    invoke-virtual {v2}, Lhw;->e()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    iput-boolean v1, p0, Lz70;->b:Z

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lz70;->y(Z)Z

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :goto_2
    iput-boolean v1, p0, Lz70;->b:Z

    .line 72
    .line 73
    throw p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "FragmentManager{"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " in "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lz70;->v:Lh70;

    .line 30
    .line 31
    const-string v2, "}"

    .line 32
    .line 33
    const-string v3, "{"

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lz70;->v:Lh70;

    .line 52
    .line 53
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lz70;->t:Lj70;

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    const-string p0, "null"

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    :goto_0
    const-string p0, "}}"

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method

.method public final u()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lz70;->H:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lz70;->H:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lz70;->X()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final v(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "    "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lz70;->c:Ler0;

    .line 19
    .line 20
    iget-object v2, v1, Ler0;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v2, Ljava/util/ArrayList;

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, "    "

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v1, v1, Ler0;->l:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v1, Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/4 v5, 0x0

    .line 50
    if-nez v4, :cond_1e

    .line 51
    .line 52
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string v4, "Active Fragments:"

    .line 56
    .line 57
    invoke-virtual {p3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_1e

    .line 73
    .line 74
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Landroidx/fragment/app/a;

    .line 79
    .line 80
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    if-eqz v4, :cond_1d

    .line 84
    .line 85
    iget-object v4, v4, Landroidx/fragment/app/a;->c:Lh70;

    .line 86
    .line 87
    invoke-virtual {p3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const-string v6, "mFragmentId=#"

    .line 94
    .line 95
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget v6, v4, Lh70;->E:I

    .line 99
    .line 100
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v6, " mContainerId=#"

    .line 108
    .line 109
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget v6, v4, Lh70;->F:I

    .line 113
    .line 114
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const-string v6, " mTag="

    .line 122
    .line 123
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object v6, v4, Lh70;->G:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v6, "mState="

    .line 135
    .line 136
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget v6, v4, Lh70;->j:I

    .line 140
    .line 141
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(I)V

    .line 142
    .line 143
    .line 144
    const-string v6, " mWho="

    .line 145
    .line 146
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object v6, v4, Lh70;->n:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    const-string v6, " mBackStackNesting="

    .line 155
    .line 156
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget v6, v4, Lh70;->z:I

    .line 160
    .line 161
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    const-string v6, "mAdded="

    .line 168
    .line 169
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-boolean v6, v4, Lh70;->t:Z

    .line 173
    .line 174
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 175
    .line 176
    .line 177
    const-string v6, " mRemoving="

    .line 178
    .line 179
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-boolean v6, v4, Lh70;->u:Z

    .line 183
    .line 184
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 185
    .line 186
    .line 187
    const-string v6, " mFromLayout="

    .line 188
    .line 189
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-boolean v6, v4, Lh70;->v:Z

    .line 193
    .line 194
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 195
    .line 196
    .line 197
    const-string v6, " mInLayout="

    .line 198
    .line 199
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-boolean v6, v4, Lh70;->w:Z

    .line 203
    .line 204
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Z)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    const-string v6, "mHidden="

    .line 211
    .line 212
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-boolean v6, v4, Lh70;->H:Z

    .line 216
    .line 217
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 218
    .line 219
    .line 220
    const-string v6, " mDetached="

    .line 221
    .line 222
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iget-boolean v6, v4, Lh70;->I:Z

    .line 226
    .line 227
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 228
    .line 229
    .line 230
    const-string v6, " mMenuVisible="

    .line 231
    .line 232
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-boolean v6, v4, Lh70;->K:Z

    .line 236
    .line 237
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 238
    .line 239
    .line 240
    const-string v6, " mHasMenu="

    .line 241
    .line 242
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Z)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    const-string v6, "mRetainInstance="

    .line 252
    .line 253
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-boolean v6, v4, Lh70;->J:Z

    .line 257
    .line 258
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Z)V

    .line 259
    .line 260
    .line 261
    const-string v6, " mUserVisibleHint="

    .line 262
    .line 263
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-boolean v6, v4, Lh70;->P:Z

    .line 267
    .line 268
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Z)V

    .line 269
    .line 270
    .line 271
    iget-object v6, v4, Lh70;->A:Lz70;

    .line 272
    .line 273
    if-eqz v6, :cond_0

    .line 274
    .line 275
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    const-string v6, "mFragmentManager="

    .line 279
    .line 280
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    iget-object v6, v4, Lh70;->A:Lz70;

    .line 284
    .line 285
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    :cond_0
    iget-object v6, v4, Lh70;->B:Lj70;

    .line 289
    .line 290
    if-eqz v6, :cond_1

    .line 291
    .line 292
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    const-string v6, "mHost="

    .line 296
    .line 297
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    iget-object v6, v4, Lh70;->B:Lj70;

    .line 301
    .line 302
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    :cond_1
    iget-object v6, v4, Lh70;->D:Lh70;

    .line 306
    .line 307
    if-eqz v6, :cond_2

    .line 308
    .line 309
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    const-string v6, "mParentFragment="

    .line 313
    .line 314
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    iget-object v6, v4, Lh70;->D:Lh70;

    .line 318
    .line 319
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 320
    .line 321
    .line 322
    :cond_2
    iget-object v6, v4, Lh70;->o:Landroid/os/Bundle;

    .line 323
    .line 324
    if-eqz v6, :cond_3

    .line 325
    .line 326
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    const-string v6, "mArguments="

    .line 330
    .line 331
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    iget-object v6, v4, Lh70;->o:Landroid/os/Bundle;

    .line 335
    .line 336
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 337
    .line 338
    .line 339
    :cond_3
    iget-object v6, v4, Lh70;->k:Landroid/os/Bundle;

    .line 340
    .line 341
    if-eqz v6, :cond_4

    .line 342
    .line 343
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    const-string v6, "mSavedFragmentState="

    .line 347
    .line 348
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-object v6, v4, Lh70;->k:Landroid/os/Bundle;

    .line 352
    .line 353
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 354
    .line 355
    .line 356
    :cond_4
    iget-object v6, v4, Lh70;->l:Landroid/util/SparseArray;

    .line 357
    .line 358
    if-eqz v6, :cond_5

    .line 359
    .line 360
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    const-string v6, "mSavedViewState="

    .line 364
    .line 365
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    iget-object v6, v4, Lh70;->l:Landroid/util/SparseArray;

    .line 369
    .line 370
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 371
    .line 372
    .line 373
    :cond_5
    iget-object v6, v4, Lh70;->m:Landroid/os/Bundle;

    .line 374
    .line 375
    if-eqz v6, :cond_6

    .line 376
    .line 377
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    const-string v6, "mSavedViewRegistryState="

    .line 381
    .line 382
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    iget-object v6, v4, Lh70;->m:Landroid/os/Bundle;

    .line 386
    .line 387
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    :cond_6
    invoke-virtual {v4, v5}, Lh70;->n(Z)Lh70;

    .line 391
    .line 392
    .line 393
    move-result-object v6

    .line 394
    if-eqz v6, :cond_7

    .line 395
    .line 396
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    const-string v7, "mTarget="

    .line 400
    .line 401
    invoke-virtual {p3, v7}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 405
    .line 406
    .line 407
    const-string v6, " mTargetRequestCode="

    .line 408
    .line 409
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    iget v6, v4, Lh70;->r:I

    .line 413
    .line 414
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 415
    .line 416
    .line 417
    :cond_7
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    const-string v6, "mPopDirection="

    .line 421
    .line 422
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 426
    .line 427
    if-nez v6, :cond_8

    .line 428
    .line 429
    move v6, v5

    .line 430
    goto :goto_1

    .line 431
    :cond_8
    iget-boolean v6, v6, Lg70;->a:Z

    .line 432
    .line 433
    :goto_1
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Z)V

    .line 434
    .line 435
    .line 436
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 437
    .line 438
    if-nez v6, :cond_9

    .line 439
    .line 440
    move v6, v5

    .line 441
    goto :goto_2

    .line 442
    :cond_9
    iget v6, v6, Lg70;->b:I

    .line 443
    .line 444
    :goto_2
    if-eqz v6, :cond_b

    .line 445
    .line 446
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    const-string v6, "getEnterAnim="

    .line 450
    .line 451
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 452
    .line 453
    .line 454
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 455
    .line 456
    if-nez v6, :cond_a

    .line 457
    .line 458
    move v6, v5

    .line 459
    goto :goto_3

    .line 460
    :cond_a
    iget v6, v6, Lg70;->b:I

    .line 461
    .line 462
    :goto_3
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 463
    .line 464
    .line 465
    :cond_b
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 466
    .line 467
    if-nez v6, :cond_c

    .line 468
    .line 469
    move v6, v5

    .line 470
    goto :goto_4

    .line 471
    :cond_c
    iget v6, v6, Lg70;->c:I

    .line 472
    .line 473
    :goto_4
    if-eqz v6, :cond_e

    .line 474
    .line 475
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    const-string v6, "getExitAnim="

    .line 479
    .line 480
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 484
    .line 485
    if-nez v6, :cond_d

    .line 486
    .line 487
    move v6, v5

    .line 488
    goto :goto_5

    .line 489
    :cond_d
    iget v6, v6, Lg70;->c:I

    .line 490
    .line 491
    :goto_5
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 492
    .line 493
    .line 494
    :cond_e
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 495
    .line 496
    if-nez v6, :cond_f

    .line 497
    .line 498
    move v6, v5

    .line 499
    goto :goto_6

    .line 500
    :cond_f
    iget v6, v6, Lg70;->d:I

    .line 501
    .line 502
    :goto_6
    if-eqz v6, :cond_11

    .line 503
    .line 504
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    const-string v6, "getPopEnterAnim="

    .line 508
    .line 509
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 513
    .line 514
    if-nez v6, :cond_10

    .line 515
    .line 516
    move v6, v5

    .line 517
    goto :goto_7

    .line 518
    :cond_10
    iget v6, v6, Lg70;->d:I

    .line 519
    .line 520
    :goto_7
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 521
    .line 522
    .line 523
    :cond_11
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 524
    .line 525
    if-nez v6, :cond_12

    .line 526
    .line 527
    move v6, v5

    .line 528
    goto :goto_8

    .line 529
    :cond_12
    iget v6, v6, Lg70;->e:I

    .line 530
    .line 531
    :goto_8
    if-eqz v6, :cond_14

    .line 532
    .line 533
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 534
    .line 535
    .line 536
    const-string v6, "getPopExitAnim="

    .line 537
    .line 538
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 539
    .line 540
    .line 541
    iget-object v6, v4, Lh70;->Q:Lg70;

    .line 542
    .line 543
    if-nez v6, :cond_13

    .line 544
    .line 545
    move v6, v5

    .line 546
    goto :goto_9

    .line 547
    :cond_13
    iget v6, v6, Lg70;->e:I

    .line 548
    .line 549
    :goto_9
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(I)V

    .line 550
    .line 551
    .line 552
    :cond_14
    iget-object v6, v4, Lh70;->M:Landroid/view/ViewGroup;

    .line 553
    .line 554
    if-eqz v6, :cond_15

    .line 555
    .line 556
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    const-string v6, "mContainer="

    .line 560
    .line 561
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    iget-object v6, v4, Lh70;->M:Landroid/view/ViewGroup;

    .line 565
    .line 566
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 567
    .line 568
    .line 569
    :cond_15
    iget-object v6, v4, Lh70;->N:Landroid/view/View;

    .line 570
    .line 571
    if-eqz v6, :cond_16

    .line 572
    .line 573
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    const-string v6, "mView="

    .line 577
    .line 578
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    iget-object v6, v4, Lh70;->N:Landroid/view/View;

    .line 582
    .line 583
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 584
    .line 585
    .line 586
    :cond_16
    invoke-virtual {v4}, Lh70;->i()Landroid/content/Context;

    .line 587
    .line 588
    .line 589
    move-result-object v6

    .line 590
    if-eqz v6, :cond_1c

    .line 591
    .line 592
    invoke-interface {v4}, Lii1;->d()Lhi1;

    .line 593
    .line 594
    .line 595
    move-result-object v6

    .line 596
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 597
    .line 598
    .line 599
    sget-object v7, Ldt;->k:Ldt;

    .line 600
    .line 601
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 602
    .line 603
    .line 604
    const-class v8, Lxj0;

    .line 605
    .line 606
    invoke-virtual {v8}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 607
    .line 608
    .line 609
    move-result-object v9

    .line 610
    if-eqz v9, :cond_1b

    .line 611
    .line 612
    const-string v10, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 613
    .line 614
    invoke-virtual {v10, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 615
    .line 616
    .line 617
    move-result-object v9

    .line 618
    iget-object v6, v6, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 619
    .line 620
    invoke-virtual {v6, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    .line 622
    .line 623
    move-result-object v10

    .line 624
    check-cast v10, Lfi1;

    .line 625
    .line 626
    invoke-virtual {v8, v10}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 627
    .line 628
    .line 629
    move-result v8

    .line 630
    if-eqz v8, :cond_17

    .line 631
    .line 632
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 633
    .line 634
    .line 635
    goto :goto_c

    .line 636
    :cond_17
    new-instance v8, Ljava/util/LinkedHashMap;

    .line 637
    .line 638
    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    .line 639
    .line 640
    .line 641
    iget-object v7, v7, Let;->j:Ljava/lang/Object;

    .line 642
    .line 643
    check-cast v7, Ljava/util/LinkedHashMap;

    .line 644
    .line 645
    invoke-interface {v8, v7}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 646
    .line 647
    .line 648
    sget-object v7, Lt11;->q:Lt11;

    .line 649
    .line 650
    invoke-interface {v8, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    :try_start_0
    new-instance v7, Lxj0;

    .line 654
    .line 655
    invoke-direct {v7}, Lxj0;-><init>()V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    .line 657
    .line 658
    :goto_a
    move-object v10, v7

    .line 659
    goto :goto_b

    .line 660
    :catch_0
    new-instance v7, Lxj0;

    .line 661
    .line 662
    invoke-direct {v7}, Lxj0;-><init>()V

    .line 663
    .line 664
    .line 665
    goto :goto_a

    .line 666
    :goto_b
    invoke-interface {v6, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object v6

    .line 670
    check-cast v6, Lfi1;

    .line 671
    .line 672
    if-eqz v6, :cond_18

    .line 673
    .line 674
    invoke-virtual {v6}, Lfi1;->a()V

    .line 675
    .line 676
    .line 677
    :cond_18
    :goto_c
    check-cast v10, Lxj0;

    .line 678
    .line 679
    iget-object v6, v10, Lxj0;->c:Lt81;

    .line 680
    .line 681
    iget v7, v6, Lt81;->l:I

    .line 682
    .line 683
    if-lez v7, :cond_1c

    .line 684
    .line 685
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 686
    .line 687
    .line 688
    const-string v7, "Loaders:"

    .line 689
    .line 690
    invoke-virtual {p3, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 691
    .line 692
    .line 693
    iget v7, v6, Lt81;->l:I

    .line 694
    .line 695
    if-gtz v7, :cond_19

    .line 696
    .line 697
    goto :goto_d

    .line 698
    :cond_19
    iget-object v4, v6, Lt81;->k:[Ljava/lang/Object;

    .line 699
    .line 700
    aget-object v4, v4, v5

    .line 701
    .line 702
    if-eqz v4, :cond_1a

    .line 703
    .line 704
    invoke-static {}, Lz0;->a()V

    .line 705
    .line 706
    .line 707
    goto/16 :goto_0

    .line 708
    .line 709
    :cond_1a
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 710
    .line 711
    .line 712
    const-string p0, "  #"

    .line 713
    .line 714
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 715
    .line 716
    .line 717
    iget-object p0, v6, Lt81;->j:[I

    .line 718
    .line 719
    aget p0, p0, v5

    .line 720
    .line 721
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(I)V

    .line 722
    .line 723
    .line 724
    const-string p0, ": "

    .line 725
    .line 726
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 727
    .line 728
    .line 729
    const/4 p0, 0x0

    .line 730
    throw p0

    .line 731
    :cond_1b
    const-string v4, "Local and anonymous classes can not be ViewModels"

    .line 732
    .line 733
    invoke-static {v4}, Lz0;->d(Ljava/lang/String;)V

    .line 734
    .line 735
    .line 736
    goto/16 :goto_0

    .line 737
    .line 738
    :cond_1c
    :goto_d
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 739
    .line 740
    .line 741
    new-instance v6, Ljava/lang/StringBuilder;

    .line 742
    .line 743
    const-string v7, "Child "

    .line 744
    .line 745
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 746
    .line 747
    .line 748
    iget-object v7, v4, Lh70;->C:Lz70;

    .line 749
    .line 750
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 751
    .line 752
    .line 753
    const-string v7, ":"

    .line 754
    .line 755
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 756
    .line 757
    .line 758
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 759
    .line 760
    .line 761
    move-result-object v6

    .line 762
    invoke-virtual {p3, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 763
    .line 764
    .line 765
    iget-object v4, v4, Lh70;->C:Lz70;

    .line 766
    .line 767
    const-string v6, "  "

    .line 768
    .line 769
    invoke-virtual {v3, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 770
    .line 771
    .line 772
    move-result-object v6

    .line 773
    invoke-virtual {v4, v6, p2, p3, p4}, Lz70;->v(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 774
    .line 775
    .line 776
    goto/16 :goto_0

    .line 777
    .line 778
    :cond_1d
    const-string v4, "null"

    .line 779
    .line 780
    invoke-virtual {p3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 781
    .line 782
    .line 783
    goto/16 :goto_0

    .line 784
    .line 785
    :cond_1e
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 786
    .line 787
    .line 788
    move-result p2

    .line 789
    if-lez p2, :cond_1f

    .line 790
    .line 791
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 792
    .line 793
    .line 794
    const-string p4, "Added Fragments:"

    .line 795
    .line 796
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 797
    .line 798
    .line 799
    move p4, v5

    .line 800
    :goto_e
    if-ge p4, p2, :cond_1f

    .line 801
    .line 802
    invoke-virtual {v2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    check-cast v1, Lh70;

    .line 807
    .line 808
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    const-string v3, "  #"

    .line 812
    .line 813
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 814
    .line 815
    .line 816
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    .line 817
    .line 818
    .line 819
    const-string v3, ": "

    .line 820
    .line 821
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 822
    .line 823
    .line 824
    invoke-virtual {v1}, Lh70;->toString()Ljava/lang/String;

    .line 825
    .line 826
    .line 827
    move-result-object v1

    .line 828
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 829
    .line 830
    .line 831
    add-int/lit8 p4, p4, 0x1

    .line 832
    .line 833
    goto :goto_e

    .line 834
    :cond_1f
    iget-object p2, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 835
    .line 836
    if-eqz p2, :cond_20

    .line 837
    .line 838
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 839
    .line 840
    .line 841
    move-result p2

    .line 842
    if-lez p2, :cond_20

    .line 843
    .line 844
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    const-string p4, "Fragments Created Menus:"

    .line 848
    .line 849
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    move p4, v5

    .line 853
    :goto_f
    if-ge p4, p2, :cond_20

    .line 854
    .line 855
    iget-object v1, p0, Lz70;->e:Ljava/util/ArrayList;

    .line 856
    .line 857
    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 858
    .line 859
    .line 860
    move-result-object v1

    .line 861
    check-cast v1, Lh70;

    .line 862
    .line 863
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 864
    .line 865
    .line 866
    const-string v2, "  #"

    .line 867
    .line 868
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 869
    .line 870
    .line 871
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    .line 872
    .line 873
    .line 874
    const-string v2, ": "

    .line 875
    .line 876
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 877
    .line 878
    .line 879
    invoke-virtual {v1}, Lh70;->toString()Ljava/lang/String;

    .line 880
    .line 881
    .line 882
    move-result-object v1

    .line 883
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 884
    .line 885
    .line 886
    add-int/lit8 p4, p4, 0x1

    .line 887
    .line 888
    goto :goto_f

    .line 889
    :cond_20
    iget-object p2, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 890
    .line 891
    if-eqz p2, :cond_21

    .line 892
    .line 893
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 894
    .line 895
    .line 896
    move-result p2

    .line 897
    if-lez p2, :cond_21

    .line 898
    .line 899
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 900
    .line 901
    .line 902
    const-string p4, "Back Stack:"

    .line 903
    .line 904
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    move p4, v5

    .line 908
    :goto_10
    if-ge p4, p2, :cond_21

    .line 909
    .line 910
    iget-object v1, p0, Lz70;->d:Ljava/util/ArrayList;

    .line 911
    .line 912
    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 913
    .line 914
    .line 915
    move-result-object v1

    .line 916
    check-cast v1, Ltf;

    .line 917
    .line 918
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 919
    .line 920
    .line 921
    const-string v2, "  #"

    .line 922
    .line 923
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 924
    .line 925
    .line 926
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    .line 927
    .line 928
    .line 929
    const-string v2, ": "

    .line 930
    .line 931
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 932
    .line 933
    .line 934
    invoke-virtual {v1}, Ltf;->toString()Ljava/lang/String;

    .line 935
    .line 936
    .line 937
    move-result-object v2

    .line 938
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 939
    .line 940
    .line 941
    const/4 v2, 0x1

    .line 942
    invoke-virtual {v1, v0, p3, v2}, Ltf;->f(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 943
    .line 944
    .line 945
    add-int/lit8 p4, p4, 0x1

    .line 946
    .line 947
    goto :goto_10

    .line 948
    :cond_21
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 949
    .line 950
    .line 951
    new-instance p2, Ljava/lang/StringBuilder;

    .line 952
    .line 953
    const-string p4, "Back Stack Index: "

    .line 954
    .line 955
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 956
    .line 957
    .line 958
    iget-object p4, p0, Lz70;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 959
    .line 960
    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 961
    .line 962
    .line 963
    move-result p4

    .line 964
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 965
    .line 966
    .line 967
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 968
    .line 969
    .line 970
    move-result-object p2

    .line 971
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 972
    .line 973
    .line 974
    iget-object p2, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 975
    .line 976
    monitor-enter p2

    .line 977
    :try_start_1
    iget-object p4, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 978
    .line 979
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    .line 980
    .line 981
    .line 982
    move-result p4

    .line 983
    if-lez p4, :cond_22

    .line 984
    .line 985
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 986
    .line 987
    .line 988
    const-string v0, "Pending Actions:"

    .line 989
    .line 990
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 991
    .line 992
    .line 993
    :goto_11
    if-ge v5, p4, :cond_22

    .line 994
    .line 995
    iget-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 996
    .line 997
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 998
    .line 999
    .line 1000
    move-result-object v0

    .line 1001
    check-cast v0, Lx70;

    .line 1002
    .line 1003
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1004
    .line 1005
    .line 1006
    const-string v1, "  #"

    .line 1007
    .line 1008
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(I)V

    .line 1012
    .line 1013
    .line 1014
    const-string v1, ": "

    .line 1015
    .line 1016
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1017
    .line 1018
    .line 1019
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1020
    .line 1021
    .line 1022
    add-int/lit8 v5, v5, 0x1

    .line 1023
    .line 1024
    goto :goto_11

    .line 1025
    :catchall_0
    move-exception p0

    .line 1026
    goto :goto_12

    .line 1027
    :cond_22
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1028
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1029
    .line 1030
    .line 1031
    const-string p2, "FragmentManager misc state:"

    .line 1032
    .line 1033
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1034
    .line 1035
    .line 1036
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1037
    .line 1038
    .line 1039
    const-string p2, "  mHost="

    .line 1040
    .line 1041
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1042
    .line 1043
    .line 1044
    iget-object p2, p0, Lz70;->t:Lj70;

    .line 1045
    .line 1046
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1047
    .line 1048
    .line 1049
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1050
    .line 1051
    .line 1052
    const-string p2, "  mContainer="

    .line 1053
    .line 1054
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1055
    .line 1056
    .line 1057
    iget-object p2, p0, Lz70;->u:Lju1;

    .line 1058
    .line 1059
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1060
    .line 1061
    .line 1062
    iget-object p2, p0, Lz70;->v:Lh70;

    .line 1063
    .line 1064
    if-eqz p2, :cond_23

    .line 1065
    .line 1066
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1067
    .line 1068
    .line 1069
    const-string p2, "  mParent="

    .line 1070
    .line 1071
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1072
    .line 1073
    .line 1074
    iget-object p2, p0, Lz70;->v:Lh70;

    .line 1075
    .line 1076
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 1077
    .line 1078
    .line 1079
    :cond_23
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1080
    .line 1081
    .line 1082
    const-string p2, "  mCurState="

    .line 1083
    .line 1084
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1085
    .line 1086
    .line 1087
    iget p2, p0, Lz70;->s:I

    .line 1088
    .line 1089
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    .line 1090
    .line 1091
    .line 1092
    const-string p2, " mStateSaved="

    .line 1093
    .line 1094
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1095
    .line 1096
    .line 1097
    iget-boolean p2, p0, Lz70;->E:Z

    .line 1098
    .line 1099
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    .line 1100
    .line 1101
    .line 1102
    const-string p2, " mStopped="

    .line 1103
    .line 1104
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1105
    .line 1106
    .line 1107
    iget-boolean p2, p0, Lz70;->F:Z

    .line 1108
    .line 1109
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    .line 1110
    .line 1111
    .line 1112
    const-string p2, " mDestroyed="

    .line 1113
    .line 1114
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1115
    .line 1116
    .line 1117
    iget-boolean p2, p0, Lz70;->G:Z

    .line 1118
    .line 1119
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Z)V

    .line 1120
    .line 1121
    .line 1122
    iget-boolean p2, p0, Lz70;->D:Z

    .line 1123
    .line 1124
    if-eqz p2, :cond_24

    .line 1125
    .line 1126
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1127
    .line 1128
    .line 1129
    const-string p1, "  mNeedMenuInvalidate="

    .line 1130
    .line 1131
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1132
    .line 1133
    .line 1134
    iget-boolean p0, p0, Lz70;->D:Z

    .line 1135
    .line 1136
    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->println(Z)V

    .line 1137
    .line 1138
    .line 1139
    :cond_24
    return-void

    .line 1140
    :goto_12
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1141
    throw p0
.end method

.method public final w(Lx70;Z)V
    .locals 2

    .line 1
    if-nez p2, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lz70;->G:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "FragmentManager has been destroyed"

    .line 12
    .line 13
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "FragmentManager has not been attached to a host."

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-boolean v0, p0, Lz70;->E:Z

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-boolean v0, p0, Lz70;->F:Z

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-string p0, "Can not perform this action after onSaveInstanceState"

    .line 33
    .line 34
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    :goto_0
    iget-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 39
    .line 40
    monitor-enter v0

    .line 41
    :try_start_0
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 42
    .line 43
    if-nez v1, :cond_5

    .line 44
    .line 45
    if-eqz p2, :cond_4

    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p1, "Activity has been destroyed"

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0

    .line 59
    :cond_5
    iget-object p2, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lz70;->S()V

    .line 65
    .line 66
    .line 67
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method

.method public final x(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lz70;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean p0, p0, Lz70;->G:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "FragmentManager has been destroyed"

    .line 14
    .line 15
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "FragmentManager has not been attached to a host."

    .line 20
    .line 21
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 30
    .line 31
    iget-object v1, v1, Lj70;->z:Landroid/os/Handler;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-ne v0, v1, :cond_5

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iget-boolean p1, p0, Lz70;->E:Z

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget-boolean p1, p0, Lz70;->F:Z

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string p0, "Can not perform this action after onSaveInstanceState"

    .line 51
    .line 52
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    :goto_0
    iget-object p1, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 57
    .line 58
    if-nez p1, :cond_4

    .line 59
    .line 60
    new-instance p1, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 66
    .line 67
    new-instance p1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 73
    .line 74
    :cond_4
    return-void

    .line 75
    :cond_5
    const-string p0, "Must be called from main thread of fragment host"

    .line 76
    .line 77
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_6
    const-string p0, "FragmentManager is already executing transactions"

    .line 82
    .line 83
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final y(Z)Z
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Lz70;->x(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    move v0, p1

    .line 6
    :goto_0
    iget-object v1, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v2, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 9
    .line 10
    iget-object v3, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    monitor-enter v3

    .line 13
    :try_start_0
    iget-object v4, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    move v6, p1

    .line 23
    goto :goto_2

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_4

    .line 26
    :cond_0
    :try_start_1
    iget-object v4, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    move v5, p1

    .line 33
    move v6, v5

    .line 34
    :goto_1
    iget-object v7, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 35
    .line 36
    if-ge v5, v4, :cond_1

    .line 37
    .line 38
    :try_start_2
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    check-cast v7, Lx70;

    .line 43
    .line 44
    invoke-interface {v7, v1, v2}, Lx70;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 45
    .line 46
    .line 47
    move-result v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 48
    or-int/2addr v6, v7

    .line 49
    add-int/lit8 v5, v5, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    goto :goto_3

    .line 54
    :cond_1
    :try_start_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lz70;->t:Lj70;

    .line 58
    .line 59
    iget-object v1, v1, Lj70;->z:Landroid/os/Handler;

    .line 60
    .line 61
    iget-object v2, p0, Lz70;->M:Lu70;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 67
    :goto_2
    if-eqz v6, :cond_2

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    iput-boolean v0, p0, Lz70;->b:Z

    .line 71
    .line 72
    :try_start_4
    iget-object v1, p0, Lz70;->I:Ljava/util/ArrayList;

    .line 73
    .line 74
    iget-object v2, p0, Lz70;->J:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0, v1, v2}, Lz70;->P(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lz70;->d()V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_2
    move-exception p1

    .line 84
    invoke-virtual {p0}, Lz70;->d()V

    .line 85
    .line 86
    .line 87
    throw p1

    .line 88
    :cond_2
    invoke-virtual {p0}, Lz70;->Z()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lz70;->u()V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 95
    .line 96
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast p0, Ljava/util/HashMap;

    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const/4 p1, 0x0

    .line 105
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p0, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    return v0

    .line 113
    :goto_3
    :try_start_5
    iget-object v0, p0, Lz70;->a:Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lz70;->t:Lj70;

    .line 119
    .line 120
    iget-object v0, v0, Lj70;->z:Landroid/os/Handler;

    .line 121
    .line 122
    iget-object p0, p0, Lz70;->M:Lu70;

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    throw p1

    .line 128
    :goto_4
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 129
    throw p0
.end method

.method public final z(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
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
    move/from16 v3, p4

    .line 8
    .line 9
    iget-object v4, v0, Lz70;->c:Ler0;

    .line 10
    .line 11
    move/from16 v5, p3

    .line 12
    .line 13
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    check-cast v6, Ltf;

    .line 18
    .line 19
    iget-boolean v6, v6, Ltf;->p:Z

    .line 20
    .line 21
    iget-object v7, v0, Lz70;->K:Ljava/util/ArrayList;

    .line 22
    .line 23
    if-nez v7, :cond_0

    .line 24
    .line 25
    new-instance v7, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v7, v0, Lz70;->K:Ljava/util/ArrayList;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v7, v0, Lz70;->K:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v4}, Ler0;->l()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    iget-object v7, v0, Lz70;->w:Lh70;

    .line 46
    .line 47
    move v9, v5

    .line 48
    const/4 v10, 0x0

    .line 49
    :goto_1
    const/4 v13, 0x1

    .line 50
    if-ge v9, v3, :cond_13

    .line 51
    .line 52
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v14

    .line 56
    check-cast v14, Ltf;

    .line 57
    .line 58
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v15

    .line 62
    check-cast v15, Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v15

    .line 68
    iget-object v12, v0, Lz70;->K:Ljava/util/ArrayList;

    .line 69
    .line 70
    if-nez v15, :cond_d

    .line 71
    .line 72
    iget-object v15, v14, Ltf;->a:Ljava/util/ArrayList;

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    :goto_2
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    .line 76
    .line 77
    .line 78
    move-result v11

    .line 79
    if-ge v8, v11, :cond_c

    .line 80
    .line 81
    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v11

    .line 85
    check-cast v11, Li80;

    .line 86
    .line 87
    iget v5, v11, Li80;->a:I

    .line 88
    .line 89
    if-eq v5, v13, :cond_b

    .line 90
    .line 91
    const/4 v13, 0x2

    .line 92
    if-eq v5, v13, :cond_5

    .line 93
    .line 94
    const/4 v13, 0x3

    .line 95
    if-eq v5, v13, :cond_4

    .line 96
    .line 97
    const/4 v13, 0x6

    .line 98
    if-eq v5, v13, :cond_4

    .line 99
    .line 100
    const/4 v13, 0x7

    .line 101
    if-eq v5, v13, :cond_3

    .line 102
    .line 103
    const/16 v13, 0x8

    .line 104
    .line 105
    if-eq v5, v13, :cond_1

    .line 106
    .line 107
    move/from16 v19, v6

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_1
    new-instance v5, Li80;

    .line 111
    .line 112
    move/from16 v19, v6

    .line 113
    .line 114
    const/16 v6, 0x9

    .line 115
    .line 116
    const/4 v13, 0x0

    .line 117
    invoke-direct {v5, v6, v7, v13}, Li80;-><init>(ILh70;I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v15, v8, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    const/4 v5, 0x1

    .line 124
    iput-boolean v5, v11, Li80;->c:Z

    .line 125
    .line 126
    add-int/lit8 v8, v8, 0x1

    .line 127
    .line 128
    iget-object v5, v11, Li80;->b:Lh70;

    .line 129
    .line 130
    move-object v7, v5

    .line 131
    :cond_2
    :goto_3
    move/from16 v22, v9

    .line 132
    .line 133
    move/from16 v21, v10

    .line 134
    .line 135
    const/4 v6, 0x1

    .line 136
    goto/16 :goto_9

    .line 137
    .line 138
    :cond_3
    move/from16 v19, v6

    .line 139
    .line 140
    const/4 v6, 0x1

    .line 141
    :goto_4
    move/from16 v22, v9

    .line 142
    .line 143
    move/from16 v21, v10

    .line 144
    .line 145
    goto/16 :goto_8

    .line 146
    .line 147
    :cond_4
    move/from16 v19, v6

    .line 148
    .line 149
    iget-object v5, v11, Li80;->b:Lh70;

    .line 150
    .line 151
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    iget-object v5, v11, Li80;->b:Lh70;

    .line 155
    .line 156
    if-ne v5, v7, :cond_2

    .line 157
    .line 158
    new-instance v6, Li80;

    .line 159
    .line 160
    const/16 v7, 0x9

    .line 161
    .line 162
    invoke-direct {v6, v7, v5}, Li80;-><init>(ILh70;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v15, v8, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    add-int/lit8 v8, v8, 0x1

    .line 169
    .line 170
    move/from16 v22, v9

    .line 171
    .line 172
    move/from16 v21, v10

    .line 173
    .line 174
    const/4 v6, 0x1

    .line 175
    const/4 v7, 0x0

    .line 176
    goto/16 :goto_9

    .line 177
    .line 178
    :cond_5
    move/from16 v19, v6

    .line 179
    .line 180
    iget-object v5, v11, Li80;->b:Lh70;

    .line 181
    .line 182
    iget v6, v5, Lh70;->F:I

    .line 183
    .line 184
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    .line 185
    .line 186
    .line 187
    move-result v13

    .line 188
    const/16 v17, 0x1

    .line 189
    .line 190
    add-int/lit8 v13, v13, -0x1

    .line 191
    .line 192
    const/16 v20, 0x0

    .line 193
    .line 194
    :goto_5
    if-ltz v13, :cond_9

    .line 195
    .line 196
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v21

    .line 200
    move/from16 v22, v9

    .line 201
    .line 202
    move-object/from16 v9, v21

    .line 203
    .line 204
    check-cast v9, Lh70;

    .line 205
    .line 206
    move/from16 v21, v10

    .line 207
    .line 208
    iget v10, v9, Lh70;->F:I

    .line 209
    .line 210
    if-ne v10, v6, :cond_8

    .line 211
    .line 212
    if-ne v9, v5, :cond_6

    .line 213
    .line 214
    move/from16 v18, v6

    .line 215
    .line 216
    const/4 v6, 0x1

    .line 217
    const/16 v20, 0x1

    .line 218
    .line 219
    goto :goto_7

    .line 220
    :cond_6
    if-ne v9, v7, :cond_7

    .line 221
    .line 222
    new-instance v7, Li80;

    .line 223
    .line 224
    move/from16 v18, v6

    .line 225
    .line 226
    const/16 v6, 0x9

    .line 227
    .line 228
    const/4 v10, 0x0

    .line 229
    invoke-direct {v7, v6, v9, v10}, Li80;-><init>(ILh70;I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v15, v8, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    add-int/lit8 v8, v8, 0x1

    .line 236
    .line 237
    const/4 v7, 0x0

    .line 238
    goto :goto_6

    .line 239
    :cond_7
    move/from16 v18, v6

    .line 240
    .line 241
    const/16 v6, 0x9

    .line 242
    .line 243
    const/4 v10, 0x0

    .line 244
    :goto_6
    new-instance v6, Li80;

    .line 245
    .line 246
    move-object/from16 v23, v7

    .line 247
    .line 248
    const/4 v7, 0x3

    .line 249
    invoke-direct {v6, v7, v9, v10}, Li80;-><init>(ILh70;I)V

    .line 250
    .line 251
    .line 252
    iget v7, v11, Li80;->d:I

    .line 253
    .line 254
    iput v7, v6, Li80;->d:I

    .line 255
    .line 256
    iget v7, v11, Li80;->f:I

    .line 257
    .line 258
    iput v7, v6, Li80;->f:I

    .line 259
    .line 260
    iget v7, v11, Li80;->e:I

    .line 261
    .line 262
    iput v7, v6, Li80;->e:I

    .line 263
    .line 264
    iget v7, v11, Li80;->g:I

    .line 265
    .line 266
    iput v7, v6, Li80;->g:I

    .line 267
    .line 268
    invoke-virtual {v15, v8, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    const/4 v6, 0x1

    .line 275
    add-int/2addr v8, v6

    .line 276
    move-object/from16 v7, v23

    .line 277
    .line 278
    goto :goto_7

    .line 279
    :cond_8
    move/from16 v18, v6

    .line 280
    .line 281
    const/4 v6, 0x1

    .line 282
    :goto_7
    add-int/lit8 v13, v13, -0x1

    .line 283
    .line 284
    move/from16 v6, v18

    .line 285
    .line 286
    move/from16 v10, v21

    .line 287
    .line 288
    move/from16 v9, v22

    .line 289
    .line 290
    goto :goto_5

    .line 291
    :cond_9
    move/from16 v22, v9

    .line 292
    .line 293
    move/from16 v21, v10

    .line 294
    .line 295
    const/4 v6, 0x1

    .line 296
    if-eqz v20, :cond_a

    .line 297
    .line 298
    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    add-int/lit8 v8, v8, -0x1

    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_a
    iput v6, v11, Li80;->a:I

    .line 305
    .line 306
    iput-boolean v6, v11, Li80;->c:Z

    .line 307
    .line 308
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    goto :goto_9

    .line 312
    :cond_b
    move/from16 v19, v6

    .line 313
    .line 314
    move v6, v13

    .line 315
    goto/16 :goto_4

    .line 316
    .line 317
    :goto_8
    iget-object v5, v11, Li80;->b:Lh70;

    .line 318
    .line 319
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    :goto_9
    add-int/2addr v8, v6

    .line 323
    move/from16 v5, p3

    .line 324
    .line 325
    move v13, v6

    .line 326
    move/from16 v6, v19

    .line 327
    .line 328
    move/from16 v10, v21

    .line 329
    .line 330
    move/from16 v9, v22

    .line 331
    .line 332
    goto/16 :goto_2

    .line 333
    .line 334
    :cond_c
    move/from16 v19, v6

    .line 335
    .line 336
    move/from16 v22, v9

    .line 337
    .line 338
    move/from16 v21, v10

    .line 339
    .line 340
    goto :goto_c

    .line 341
    :cond_d
    move/from16 v19, v6

    .line 342
    .line 343
    move/from16 v22, v9

    .line 344
    .line 345
    move/from16 v21, v10

    .line 346
    .line 347
    move v6, v13

    .line 348
    iget-object v5, v14, Ltf;->a:Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 351
    .line 352
    .line 353
    move-result v8

    .line 354
    sub-int/2addr v8, v6

    .line 355
    :goto_a
    if-ltz v8, :cond_10

    .line 356
    .line 357
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v9

    .line 361
    check-cast v9, Li80;

    .line 362
    .line 363
    iget v10, v9, Li80;->a:I

    .line 364
    .line 365
    const/4 v13, 0x3

    .line 366
    if-eq v10, v6, :cond_f

    .line 367
    .line 368
    if-eq v10, v13, :cond_e

    .line 369
    .line 370
    packed-switch v10, :pswitch_data_0

    .line 371
    .line 372
    .line 373
    goto :goto_b

    .line 374
    :pswitch_0
    iget-object v6, v9, Li80;->h:Lwh0;

    .line 375
    .line 376
    iput-object v6, v9, Li80;->i:Lwh0;

    .line 377
    .line 378
    goto :goto_b

    .line 379
    :pswitch_1
    iget-object v6, v9, Li80;->b:Lh70;

    .line 380
    .line 381
    move-object v7, v6

    .line 382
    goto :goto_b

    .line 383
    :pswitch_2
    const/4 v7, 0x0

    .line 384
    goto :goto_b

    .line 385
    :cond_e
    :pswitch_3
    iget-object v6, v9, Li80;->b:Lh70;

    .line 386
    .line 387
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    goto :goto_b

    .line 391
    :cond_f
    :pswitch_4
    iget-object v6, v9, Li80;->b:Lh70;

    .line 392
    .line 393
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    :goto_b
    add-int/lit8 v8, v8, -0x1

    .line 397
    .line 398
    const/4 v6, 0x1

    .line 399
    goto :goto_a

    .line 400
    :cond_10
    :goto_c
    if-nez v21, :cond_12

    .line 401
    .line 402
    iget-boolean v5, v14, Ltf;->g:Z

    .line 403
    .line 404
    if-eqz v5, :cond_11

    .line 405
    .line 406
    goto :goto_d

    .line 407
    :cond_11
    const/4 v10, 0x0

    .line 408
    goto :goto_e

    .line 409
    :cond_12
    :goto_d
    const/4 v10, 0x1

    .line 410
    :goto_e
    add-int/lit8 v9, v22, 0x1

    .line 411
    .line 412
    move/from16 v5, p3

    .line 413
    .line 414
    move/from16 v6, v19

    .line 415
    .line 416
    goto/16 :goto_1

    .line 417
    .line 418
    :cond_13
    move/from16 v19, v6

    .line 419
    .line 420
    iget-object v5, v0, Lz70;->K:Ljava/util/ArrayList;

    .line 421
    .line 422
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 423
    .line 424
    .line 425
    if-nez v19, :cond_16

    .line 426
    .line 427
    iget v5, v0, Lz70;->s:I

    .line 428
    .line 429
    const/4 v6, 0x1

    .line 430
    if-lt v5, v6, :cond_16

    .line 431
    .line 432
    move/from16 v5, p3

    .line 433
    .line 434
    :goto_f
    if-ge v5, v3, :cond_16

    .line 435
    .line 436
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v6

    .line 440
    check-cast v6, Ltf;

    .line 441
    .line 442
    iget-object v6, v6, Ltf;->a:Ljava/util/ArrayList;

    .line 443
    .line 444
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 445
    .line 446
    .line 447
    move-result v7

    .line 448
    const/4 v8, 0x0

    .line 449
    :cond_14
    :goto_10
    if-ge v8, v7, :cond_15

    .line 450
    .line 451
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    move-result-object v9

    .line 455
    add-int/lit8 v8, v8, 0x1

    .line 456
    .line 457
    check-cast v9, Li80;

    .line 458
    .line 459
    iget-object v9, v9, Li80;->b:Lh70;

    .line 460
    .line 461
    if-eqz v9, :cond_14

    .line 462
    .line 463
    iget-object v10, v9, Lh70;->A:Lz70;

    .line 464
    .line 465
    if-eqz v10, :cond_14

    .line 466
    .line 467
    invoke-virtual {v0, v9}, Lz70;->f(Lh70;)Landroidx/fragment/app/a;

    .line 468
    .line 469
    .line 470
    move-result-object v9

    .line 471
    invoke-virtual {v4, v9}, Ler0;->m(Landroidx/fragment/app/a;)V

    .line 472
    .line 473
    .line 474
    goto :goto_10

    .line 475
    :cond_15
    add-int/lit8 v5, v5, 0x1

    .line 476
    .line 477
    goto :goto_f

    .line 478
    :cond_16
    const-string v4, "Unknown cmd: "

    .line 479
    .line 480
    move/from16 v5, p3

    .line 481
    .line 482
    :goto_11
    const/4 v6, -0x1

    .line 483
    if-ge v5, v3, :cond_28

    .line 484
    .line 485
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v7

    .line 489
    check-cast v7, Ltf;

    .line 490
    .line 491
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v8

    .line 495
    check-cast v8, Ljava/lang/Boolean;

    .line 496
    .line 497
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 498
    .line 499
    .line 500
    move-result v8

    .line 501
    if-eqz v8, :cond_20

    .line 502
    .line 503
    invoke-virtual {v7, v6}, Ltf;->c(I)V

    .line 504
    .line 505
    .line 506
    iget-object v6, v7, Ltf;->q:Lz70;

    .line 507
    .line 508
    iget-object v8, v7, Ltf;->a:Ljava/util/ArrayList;

    .line 509
    .line 510
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 511
    .line 512
    .line 513
    move-result v9

    .line 514
    const/4 v10, 0x1

    .line 515
    sub-int/2addr v9, v10

    .line 516
    :goto_12
    if-ltz v9, :cond_27

    .line 517
    .line 518
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v11

    .line 522
    check-cast v11, Li80;

    .line 523
    .line 524
    iget-object v12, v11, Li80;->b:Lh70;

    .line 525
    .line 526
    if-eqz v12, :cond_1c

    .line 527
    .line 528
    iget-object v13, v12, Lh70;->Q:Lg70;

    .line 529
    .line 530
    if-nez v13, :cond_17

    .line 531
    .line 532
    goto :goto_13

    .line 533
    :cond_17
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 534
    .line 535
    .line 536
    move-result-object v13

    .line 537
    iput-boolean v10, v13, Lg70;->a:Z

    .line 538
    .line 539
    :goto_13
    iget v10, v7, Ltf;->f:I

    .line 540
    .line 541
    const/16 v13, 0x2002

    .line 542
    .line 543
    const/16 v14, 0x1001

    .line 544
    .line 545
    if-eq v10, v14, :cond_1a

    .line 546
    .line 547
    if-eq v10, v13, :cond_18

    .line 548
    .line 549
    const/16 v13, 0x1004

    .line 550
    .line 551
    const/16 v14, 0x2005

    .line 552
    .line 553
    if-eq v10, v14, :cond_1a

    .line 554
    .line 555
    const/16 v15, 0x1003

    .line 556
    .line 557
    if-eq v10, v15, :cond_19

    .line 558
    .line 559
    if-eq v10, v13, :cond_18

    .line 560
    .line 561
    const/4 v13, 0x0

    .line 562
    goto :goto_14

    .line 563
    :cond_18
    move v13, v14

    .line 564
    goto :goto_14

    .line 565
    :cond_19
    move v13, v15

    .line 566
    :cond_1a
    :goto_14
    iget-object v10, v12, Lh70;->Q:Lg70;

    .line 567
    .line 568
    if-nez v10, :cond_1b

    .line 569
    .line 570
    if-nez v13, :cond_1b

    .line 571
    .line 572
    goto :goto_15

    .line 573
    :cond_1b
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 574
    .line 575
    .line 576
    iget-object v10, v12, Lh70;->Q:Lg70;

    .line 577
    .line 578
    iput v13, v10, Lg70;->f:I

    .line 579
    .line 580
    :goto_15
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 581
    .line 582
    .line 583
    iget-object v10, v12, Lh70;->Q:Lg70;

    .line 584
    .line 585
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 586
    .line 587
    .line 588
    :cond_1c
    iget v10, v11, Li80;->a:I

    .line 589
    .line 590
    packed-switch v10, :pswitch_data_1

    .line 591
    .line 592
    .line 593
    :pswitch_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 594
    .line 595
    iget v1, v11, Li80;->a:I

    .line 596
    .line 597
    new-instance v2, Ljava/lang/StringBuilder;

    .line 598
    .line 599
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 600
    .line 601
    .line 602
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    throw v0

    .line 613
    :pswitch_6
    iget-object v10, v11, Li80;->h:Lwh0;

    .line 614
    .line 615
    invoke-virtual {v6, v12, v10}, Lz70;->U(Lh70;Lwh0;)V

    .line 616
    .line 617
    .line 618
    :cond_1d
    :goto_16
    const/4 v10, 0x1

    .line 619
    goto/16 :goto_17

    .line 620
    .line 621
    :pswitch_7
    invoke-virtual {v6, v12}, Lz70;->V(Lh70;)V

    .line 622
    .line 623
    .line 624
    goto :goto_16

    .line 625
    :pswitch_8
    const/4 v10, 0x0

    .line 626
    invoke-virtual {v6, v10}, Lz70;->V(Lh70;)V

    .line 627
    .line 628
    .line 629
    goto :goto_16

    .line 630
    :pswitch_9
    iget v10, v11, Li80;->d:I

    .line 631
    .line 632
    iget v13, v11, Li80;->e:I

    .line 633
    .line 634
    iget v14, v11, Li80;->f:I

    .line 635
    .line 636
    iget v11, v11, Li80;->g:I

    .line 637
    .line 638
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 639
    .line 640
    .line 641
    const/4 v10, 0x1

    .line 642
    invoke-virtual {v6, v12, v10}, Lz70;->T(Lh70;Z)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {v6, v12}, Lz70;->g(Lh70;)V

    .line 646
    .line 647
    .line 648
    goto :goto_16

    .line 649
    :pswitch_a
    iget v10, v11, Li80;->d:I

    .line 650
    .line 651
    iget v13, v11, Li80;->e:I

    .line 652
    .line 653
    iget v14, v11, Li80;->f:I

    .line 654
    .line 655
    iget v11, v11, Li80;->g:I

    .line 656
    .line 657
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 658
    .line 659
    .line 660
    invoke-virtual {v6, v12}, Lz70;->c(Lh70;)V

    .line 661
    .line 662
    .line 663
    goto :goto_16

    .line 664
    :pswitch_b
    iget v10, v11, Li80;->d:I

    .line 665
    .line 666
    iget v13, v11, Li80;->e:I

    .line 667
    .line 668
    iget v14, v11, Li80;->f:I

    .line 669
    .line 670
    iget v11, v11, Li80;->g:I

    .line 671
    .line 672
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 673
    .line 674
    .line 675
    const/4 v10, 0x1

    .line 676
    invoke-virtual {v6, v12, v10}, Lz70;->T(Lh70;Z)V

    .line 677
    .line 678
    .line 679
    const/16 v16, 0x2

    .line 680
    .line 681
    invoke-static/range {v16 .. v16}, Lz70;->F(I)Z

    .line 682
    .line 683
    .line 684
    move-result v11

    .line 685
    if-eqz v11, :cond_1e

    .line 686
    .line 687
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    :cond_1e
    iget-boolean v11, v12, Lh70;->H:Z

    .line 691
    .line 692
    if-nez v11, :cond_1d

    .line 693
    .line 694
    iput-boolean v10, v12, Lh70;->H:Z

    .line 695
    .line 696
    iget-boolean v11, v12, Lh70;->R:Z

    .line 697
    .line 698
    xor-int/2addr v11, v10

    .line 699
    iput-boolean v11, v12, Lh70;->R:Z

    .line 700
    .line 701
    invoke-virtual {v6, v12}, Lz70;->W(Lh70;)V

    .line 702
    .line 703
    .line 704
    goto :goto_16

    .line 705
    :pswitch_c
    iget v10, v11, Li80;->d:I

    .line 706
    .line 707
    iget v13, v11, Li80;->e:I

    .line 708
    .line 709
    iget v14, v11, Li80;->f:I

    .line 710
    .line 711
    iget v11, v11, Li80;->g:I

    .line 712
    .line 713
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 714
    .line 715
    .line 716
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 717
    .line 718
    .line 719
    const/16 v16, 0x2

    .line 720
    .line 721
    invoke-static/range {v16 .. v16}, Lz70;->F(I)Z

    .line 722
    .line 723
    .line 724
    move-result v10

    .line 725
    if-eqz v10, :cond_1f

    .line 726
    .line 727
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 728
    .line 729
    .line 730
    :cond_1f
    iget-boolean v10, v12, Lh70;->H:Z

    .line 731
    .line 732
    if-eqz v10, :cond_1d

    .line 733
    .line 734
    const/4 v13, 0x0

    .line 735
    iput-boolean v13, v12, Lh70;->H:Z

    .line 736
    .line 737
    iget-boolean v10, v12, Lh70;->R:Z

    .line 738
    .line 739
    const/16 v17, 0x1

    .line 740
    .line 741
    xor-int/lit8 v10, v10, 0x1

    .line 742
    .line 743
    iput-boolean v10, v12, Lh70;->R:Z

    .line 744
    .line 745
    goto :goto_16

    .line 746
    :pswitch_d
    iget v10, v11, Li80;->d:I

    .line 747
    .line 748
    iget v13, v11, Li80;->e:I

    .line 749
    .line 750
    iget v14, v11, Li80;->f:I

    .line 751
    .line 752
    iget v11, v11, Li80;->g:I

    .line 753
    .line 754
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 755
    .line 756
    .line 757
    invoke-virtual {v6, v12}, Lz70;->a(Lh70;)Landroidx/fragment/app/a;

    .line 758
    .line 759
    .line 760
    goto/16 :goto_16

    .line 761
    .line 762
    :pswitch_e
    iget v10, v11, Li80;->d:I

    .line 763
    .line 764
    iget v13, v11, Li80;->e:I

    .line 765
    .line 766
    iget v14, v11, Li80;->f:I

    .line 767
    .line 768
    iget v11, v11, Li80;->g:I

    .line 769
    .line 770
    invoke-virtual {v12, v10, v13, v14, v11}, Lh70;->J(IIII)V

    .line 771
    .line 772
    .line 773
    const/4 v10, 0x1

    .line 774
    invoke-virtual {v6, v12, v10}, Lz70;->T(Lh70;Z)V

    .line 775
    .line 776
    .line 777
    invoke-virtual {v6, v12}, Lz70;->O(Lh70;)V

    .line 778
    .line 779
    .line 780
    :goto_17
    add-int/lit8 v9, v9, -0x1

    .line 781
    .line 782
    goto/16 :goto_12

    .line 783
    .line 784
    :cond_20
    const/4 v10, 0x1

    .line 785
    invoke-virtual {v7, v10}, Ltf;->c(I)V

    .line 786
    .line 787
    .line 788
    iget-object v6, v7, Ltf;->q:Lz70;

    .line 789
    .line 790
    iget-object v8, v7, Ltf;->a:Ljava/util/ArrayList;

    .line 791
    .line 792
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 793
    .line 794
    .line 795
    move-result v9

    .line 796
    const/4 v10, 0x0

    .line 797
    :goto_18
    if-ge v10, v9, :cond_27

    .line 798
    .line 799
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 800
    .line 801
    .line 802
    move-result-object v11

    .line 803
    check-cast v11, Li80;

    .line 804
    .line 805
    iget-object v12, v11, Li80;->b:Lh70;

    .line 806
    .line 807
    if-eqz v12, :cond_23

    .line 808
    .line 809
    iget-object v13, v12, Lh70;->Q:Lg70;

    .line 810
    .line 811
    if-nez v13, :cond_21

    .line 812
    .line 813
    goto :goto_19

    .line 814
    :cond_21
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 815
    .line 816
    .line 817
    move-result-object v13

    .line 818
    const/4 v14, 0x0

    .line 819
    iput-boolean v14, v13, Lg70;->a:Z

    .line 820
    .line 821
    :goto_19
    iget v13, v7, Ltf;->f:I

    .line 822
    .line 823
    iget-object v14, v12, Lh70;->Q:Lg70;

    .line 824
    .line 825
    if-nez v14, :cond_22

    .line 826
    .line 827
    if-nez v13, :cond_22

    .line 828
    .line 829
    goto :goto_1a

    .line 830
    :cond_22
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 831
    .line 832
    .line 833
    iget-object v14, v12, Lh70;->Q:Lg70;

    .line 834
    .line 835
    iput v13, v14, Lg70;->f:I

    .line 836
    .line 837
    :goto_1a
    invoke-virtual {v12}, Lh70;->f()Lg70;

    .line 838
    .line 839
    .line 840
    iget-object v13, v12, Lh70;->Q:Lg70;

    .line 841
    .line 842
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 843
    .line 844
    .line 845
    :cond_23
    iget v13, v11, Li80;->a:I

    .line 846
    .line 847
    packed-switch v13, :pswitch_data_2

    .line 848
    .line 849
    .line 850
    :pswitch_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 851
    .line 852
    iget v1, v11, Li80;->a:I

    .line 853
    .line 854
    new-instance v2, Ljava/lang/StringBuilder;

    .line 855
    .line 856
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 857
    .line 858
    .line 859
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 860
    .line 861
    .line 862
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 863
    .line 864
    .line 865
    move-result-object v1

    .line 866
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 867
    .line 868
    .line 869
    throw v0

    .line 870
    :pswitch_10
    iget-object v11, v11, Li80;->i:Lwh0;

    .line 871
    .line 872
    invoke-virtual {v6, v12, v11}, Lz70;->U(Lh70;Lwh0;)V

    .line 873
    .line 874
    .line 875
    goto/16 :goto_1b

    .line 876
    .line 877
    :pswitch_11
    const/4 v13, 0x0

    .line 878
    invoke-virtual {v6, v13}, Lz70;->V(Lh70;)V

    .line 879
    .line 880
    .line 881
    goto/16 :goto_1b

    .line 882
    .line 883
    :pswitch_12
    const/4 v13, 0x0

    .line 884
    invoke-virtual {v6, v12}, Lz70;->V(Lh70;)V

    .line 885
    .line 886
    .line 887
    goto/16 :goto_1b

    .line 888
    .line 889
    :pswitch_13
    const/4 v13, 0x0

    .line 890
    iget v14, v11, Li80;->d:I

    .line 891
    .line 892
    iget v15, v11, Li80;->e:I

    .line 893
    .line 894
    iget v13, v11, Li80;->f:I

    .line 895
    .line 896
    iget v11, v11, Li80;->g:I

    .line 897
    .line 898
    invoke-virtual {v12, v14, v15, v13, v11}, Lh70;->J(IIII)V

    .line 899
    .line 900
    .line 901
    const/4 v13, 0x0

    .line 902
    invoke-virtual {v6, v12, v13}, Lz70;->T(Lh70;Z)V

    .line 903
    .line 904
    .line 905
    invoke-virtual {v6, v12}, Lz70;->c(Lh70;)V

    .line 906
    .line 907
    .line 908
    goto/16 :goto_1b

    .line 909
    .line 910
    :pswitch_14
    iget v13, v11, Li80;->d:I

    .line 911
    .line 912
    iget v14, v11, Li80;->e:I

    .line 913
    .line 914
    iget v15, v11, Li80;->f:I

    .line 915
    .line 916
    iget v11, v11, Li80;->g:I

    .line 917
    .line 918
    invoke-virtual {v12, v13, v14, v15, v11}, Lh70;->J(IIII)V

    .line 919
    .line 920
    .line 921
    invoke-virtual {v6, v12}, Lz70;->g(Lh70;)V

    .line 922
    .line 923
    .line 924
    goto/16 :goto_1b

    .line 925
    .line 926
    :pswitch_15
    iget v13, v11, Li80;->d:I

    .line 927
    .line 928
    iget v14, v11, Li80;->e:I

    .line 929
    .line 930
    iget v15, v11, Li80;->f:I

    .line 931
    .line 932
    iget v11, v11, Li80;->g:I

    .line 933
    .line 934
    invoke-virtual {v12, v13, v14, v15, v11}, Lh70;->J(IIII)V

    .line 935
    .line 936
    .line 937
    const/4 v13, 0x0

    .line 938
    invoke-virtual {v6, v12, v13}, Lz70;->T(Lh70;Z)V

    .line 939
    .line 940
    .line 941
    const/16 v16, 0x2

    .line 942
    .line 943
    invoke-static/range {v16 .. v16}, Lz70;->F(I)Z

    .line 944
    .line 945
    .line 946
    move-result v11

    .line 947
    if-eqz v11, :cond_24

    .line 948
    .line 949
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 950
    .line 951
    .line 952
    :cond_24
    iget-boolean v11, v12, Lh70;->H:Z

    .line 953
    .line 954
    if-eqz v11, :cond_26

    .line 955
    .line 956
    iput-boolean v13, v12, Lh70;->H:Z

    .line 957
    .line 958
    iget-boolean v11, v12, Lh70;->R:Z

    .line 959
    .line 960
    const/16 v17, 0x1

    .line 961
    .line 962
    xor-int/lit8 v11, v11, 0x1

    .line 963
    .line 964
    iput-boolean v11, v12, Lh70;->R:Z

    .line 965
    .line 966
    goto :goto_1b

    .line 967
    :pswitch_16
    iget v13, v11, Li80;->d:I

    .line 968
    .line 969
    iget v14, v11, Li80;->e:I

    .line 970
    .line 971
    iget v15, v11, Li80;->f:I

    .line 972
    .line 973
    iget v11, v11, Li80;->g:I

    .line 974
    .line 975
    invoke-virtual {v12, v13, v14, v15, v11}, Lh70;->J(IIII)V

    .line 976
    .line 977
    .line 978
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 979
    .line 980
    .line 981
    const/16 v16, 0x2

    .line 982
    .line 983
    invoke-static/range {v16 .. v16}, Lz70;->F(I)Z

    .line 984
    .line 985
    .line 986
    move-result v11

    .line 987
    if-eqz v11, :cond_25

    .line 988
    .line 989
    invoke-static {v12}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 990
    .line 991
    .line 992
    :cond_25
    iget-boolean v11, v12, Lh70;->H:Z

    .line 993
    .line 994
    if-nez v11, :cond_26

    .line 995
    .line 996
    const/4 v11, 0x1

    .line 997
    iput-boolean v11, v12, Lh70;->H:Z

    .line 998
    .line 999
    iget-boolean v13, v12, Lh70;->R:Z

    .line 1000
    .line 1001
    xor-int/2addr v13, v11

    .line 1002
    iput-boolean v13, v12, Lh70;->R:Z

    .line 1003
    .line 1004
    invoke-virtual {v6, v12}, Lz70;->W(Lh70;)V

    .line 1005
    .line 1006
    .line 1007
    goto :goto_1b

    .line 1008
    :pswitch_17
    iget v13, v11, Li80;->d:I

    .line 1009
    .line 1010
    iget v14, v11, Li80;->e:I

    .line 1011
    .line 1012
    iget v15, v11, Li80;->f:I

    .line 1013
    .line 1014
    iget v11, v11, Li80;->g:I

    .line 1015
    .line 1016
    invoke-virtual {v12, v13, v14, v15, v11}, Lh70;->J(IIII)V

    .line 1017
    .line 1018
    .line 1019
    invoke-virtual {v6, v12}, Lz70;->O(Lh70;)V

    .line 1020
    .line 1021
    .line 1022
    goto :goto_1b

    .line 1023
    :pswitch_18
    iget v13, v11, Li80;->d:I

    .line 1024
    .line 1025
    iget v14, v11, Li80;->e:I

    .line 1026
    .line 1027
    iget v15, v11, Li80;->f:I

    .line 1028
    .line 1029
    iget v11, v11, Li80;->g:I

    .line 1030
    .line 1031
    invoke-virtual {v12, v13, v14, v15, v11}, Lh70;->J(IIII)V

    .line 1032
    .line 1033
    .line 1034
    const/4 v13, 0x0

    .line 1035
    invoke-virtual {v6, v12, v13}, Lz70;->T(Lh70;Z)V

    .line 1036
    .line 1037
    .line 1038
    invoke-virtual {v6, v12}, Lz70;->a(Lh70;)Landroidx/fragment/app/a;

    .line 1039
    .line 1040
    .line 1041
    :cond_26
    :goto_1b
    add-int/lit8 v10, v10, 0x1

    .line 1042
    .line 1043
    goto/16 :goto_18

    .line 1044
    .line 1045
    :cond_27
    add-int/lit8 v5, v5, 0x1

    .line 1046
    .line 1047
    goto/16 :goto_11

    .line 1048
    .line 1049
    :cond_28
    add-int/lit8 v4, v3, -0x1

    .line 1050
    .line 1051
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v4

    .line 1055
    check-cast v4, Ljava/lang/Boolean;

    .line 1056
    .line 1057
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1058
    .line 1059
    .line 1060
    move-result v4

    .line 1061
    move/from16 v5, p3

    .line 1062
    .line 1063
    :goto_1c
    if-ge v5, v3, :cond_2d

    .line 1064
    .line 1065
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1066
    .line 1067
    .line 1068
    move-result-object v7

    .line 1069
    check-cast v7, Ltf;

    .line 1070
    .line 1071
    if-eqz v4, :cond_2a

    .line 1072
    .line 1073
    iget-object v8, v7, Ltf;->a:Ljava/util/ArrayList;

    .line 1074
    .line 1075
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 1076
    .line 1077
    .line 1078
    move-result v8

    .line 1079
    const/16 v17, 0x1

    .line 1080
    .line 1081
    add-int/lit8 v8, v8, -0x1

    .line 1082
    .line 1083
    :goto_1d
    if-ltz v8, :cond_2c

    .line 1084
    .line 1085
    iget-object v9, v7, Ltf;->a:Ljava/util/ArrayList;

    .line 1086
    .line 1087
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v9

    .line 1091
    check-cast v9, Li80;

    .line 1092
    .line 1093
    iget-object v9, v9, Li80;->b:Lh70;

    .line 1094
    .line 1095
    if-eqz v9, :cond_29

    .line 1096
    .line 1097
    invoke-virtual {v0, v9}, Lz70;->f(Lh70;)Landroidx/fragment/app/a;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v9

    .line 1101
    invoke-virtual {v9}, Landroidx/fragment/app/a;->k()V

    .line 1102
    .line 1103
    .line 1104
    :cond_29
    add-int/lit8 v8, v8, -0x1

    .line 1105
    .line 1106
    goto :goto_1d

    .line 1107
    :cond_2a
    iget-object v7, v7, Ltf;->a:Ljava/util/ArrayList;

    .line 1108
    .line 1109
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 1110
    .line 1111
    .line 1112
    move-result v8

    .line 1113
    const/4 v9, 0x0

    .line 1114
    :cond_2b
    :goto_1e
    if-ge v9, v8, :cond_2c

    .line 1115
    .line 1116
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1117
    .line 1118
    .line 1119
    move-result-object v10

    .line 1120
    add-int/lit8 v9, v9, 0x1

    .line 1121
    .line 1122
    check-cast v10, Li80;

    .line 1123
    .line 1124
    iget-object v10, v10, Li80;->b:Lh70;

    .line 1125
    .line 1126
    if-eqz v10, :cond_2b

    .line 1127
    .line 1128
    invoke-virtual {v0, v10}, Lz70;->f(Lh70;)Landroidx/fragment/app/a;

    .line 1129
    .line 1130
    .line 1131
    move-result-object v10

    .line 1132
    invoke-virtual {v10}, Landroidx/fragment/app/a;->k()V

    .line 1133
    .line 1134
    .line 1135
    goto :goto_1e

    .line 1136
    :cond_2c
    add-int/lit8 v5, v5, 0x1

    .line 1137
    .line 1138
    goto :goto_1c

    .line 1139
    :cond_2d
    iget v5, v0, Lz70;->s:I

    .line 1140
    .line 1141
    const/4 v10, 0x1

    .line 1142
    invoke-virtual {v0, v5, v10}, Lz70;->K(IZ)V

    .line 1143
    .line 1144
    .line 1145
    new-instance v5, Ljava/util/HashSet;

    .line 1146
    .line 1147
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 1148
    .line 1149
    .line 1150
    move/from16 v7, p3

    .line 1151
    .line 1152
    :goto_1f
    if-ge v7, v3, :cond_30

    .line 1153
    .line 1154
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1155
    .line 1156
    .line 1157
    move-result-object v8

    .line 1158
    check-cast v8, Ltf;

    .line 1159
    .line 1160
    iget-object v8, v8, Ltf;->a:Ljava/util/ArrayList;

    .line 1161
    .line 1162
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 1163
    .line 1164
    .line 1165
    move-result v9

    .line 1166
    const/4 v10, 0x0

    .line 1167
    :cond_2e
    :goto_20
    if-ge v10, v9, :cond_2f

    .line 1168
    .line 1169
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1170
    .line 1171
    .line 1172
    move-result-object v11

    .line 1173
    add-int/lit8 v10, v10, 0x1

    .line 1174
    .line 1175
    check-cast v11, Li80;

    .line 1176
    .line 1177
    iget-object v11, v11, Li80;->b:Lh70;

    .line 1178
    .line 1179
    if-eqz v11, :cond_2e

    .line 1180
    .line 1181
    iget-object v11, v11, Lh70;->M:Landroid/view/ViewGroup;

    .line 1182
    .line 1183
    if-eqz v11, :cond_2e

    .line 1184
    .line 1185
    invoke-virtual {v0}, Lz70;->E()Lt11;

    .line 1186
    .line 1187
    .line 1188
    move-result-object v12

    .line 1189
    invoke-static {v11, v12}, Lhw;->f(Landroid/view/ViewGroup;Lt11;)Lhw;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v11

    .line 1193
    invoke-virtual {v5, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1194
    .line 1195
    .line 1196
    goto :goto_20

    .line 1197
    :cond_2f
    add-int/lit8 v7, v7, 0x1

    .line 1198
    .line 1199
    goto :goto_1f

    .line 1200
    :cond_30
    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v0

    .line 1204
    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1205
    .line 1206
    .line 1207
    move-result v5

    .line 1208
    if-eqz v5, :cond_33

    .line 1209
    .line 1210
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1211
    .line 1212
    .line 1213
    move-result-object v5

    .line 1214
    check-cast v5, Lhw;

    .line 1215
    .line 1216
    iput-boolean v4, v5, Lhw;->d:Z

    .line 1217
    .line 1218
    iget-object v7, v5, Lhw;->b:Ljava/util/ArrayList;

    .line 1219
    .line 1220
    monitor-enter v7

    .line 1221
    :try_start_0
    invoke-virtual {v5}, Lhw;->g()V

    .line 1222
    .line 1223
    .line 1224
    const/4 v13, 0x0

    .line 1225
    iput-boolean v13, v5, Lhw;->e:Z

    .line 1226
    .line 1227
    iget-object v8, v5, Lhw;->b:Ljava/util/ArrayList;

    .line 1228
    .line 1229
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 1230
    .line 1231
    .line 1232
    move-result v8

    .line 1233
    const/16 v17, 0x1

    .line 1234
    .line 1235
    add-int/lit8 v8, v8, -0x1

    .line 1236
    .line 1237
    :goto_22
    if-ltz v8, :cond_32

    .line 1238
    .line 1239
    iget-object v9, v5, Lhw;->b:Ljava/util/ArrayList;

    .line 1240
    .line 1241
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v9

    .line 1245
    check-cast v9, Lw81;

    .line 1246
    .line 1247
    iget-object v10, v9, Lw81;->c:Lh70;

    .line 1248
    .line 1249
    iget-object v10, v10, Lh70;->N:Landroid/view/View;

    .line 1250
    .line 1251
    invoke-static {v10}, Lx81;->c(Landroid/view/View;)I

    .line 1252
    .line 1253
    .line 1254
    move-result v10

    .line 1255
    iget v11, v9, Lw81;->a:I

    .line 1256
    .line 1257
    const/4 v13, 0x2

    .line 1258
    if-ne v11, v13, :cond_31

    .line 1259
    .line 1260
    if-eq v10, v13, :cond_31

    .line 1261
    .line 1262
    iget-object v8, v9, Lw81;->c:Lh70;

    .line 1263
    .line 1264
    iget-object v8, v8, Lh70;->Q:Lg70;

    .line 1265
    .line 1266
    const/4 v14, 0x0

    .line 1267
    iput-boolean v14, v5, Lhw;->e:Z

    .line 1268
    .line 1269
    goto :goto_23

    .line 1270
    :catchall_0
    move-exception v0

    .line 1271
    goto :goto_24

    .line 1272
    :cond_31
    const/4 v14, 0x0

    .line 1273
    add-int/lit8 v8, v8, -0x1

    .line 1274
    .line 1275
    goto :goto_22

    .line 1276
    :cond_32
    const/4 v13, 0x2

    .line 1277
    const/4 v14, 0x0

    .line 1278
    :goto_23
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1279
    invoke-virtual {v5}, Lhw;->c()V

    .line 1280
    .line 1281
    .line 1282
    goto :goto_21

    .line 1283
    :goto_24
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1284
    throw v0

    .line 1285
    :cond_33
    move/from16 v0, p3

    .line 1286
    .line 1287
    :goto_25
    if-ge v0, v3, :cond_35

    .line 1288
    .line 1289
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1290
    .line 1291
    .line 1292
    move-result-object v4

    .line 1293
    check-cast v4, Ltf;

    .line 1294
    .line 1295
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1296
    .line 1297
    .line 1298
    move-result-object v5

    .line 1299
    check-cast v5, Ljava/lang/Boolean;

    .line 1300
    .line 1301
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1302
    .line 1303
    .line 1304
    move-result v5

    .line 1305
    if-eqz v5, :cond_34

    .line 1306
    .line 1307
    iget v5, v4, Ltf;->s:I

    .line 1308
    .line 1309
    if-ltz v5, :cond_34

    .line 1310
    .line 1311
    iput v6, v4, Ltf;->s:I

    .line 1312
    .line 1313
    :cond_34
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1314
    .line 1315
    .line 1316
    add-int/lit8 v0, v0, 0x1

    .line 1317
    .line 1318
    goto :goto_25

    .line 1319
    :cond_35
    return-void

    .line 1320
    nop

    .line 1321
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 1322
    .line 1323
    .line 1324
    .line 1325
    .line 1326
    .line 1327
    .line 1328
    .line 1329
    .line 1330
    .line 1331
    .line 1332
    .line 1333
    .line 1334
    .line 1335
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_e
        :pswitch_5
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 1336
    .line 1337
    .line 1338
    .line 1339
    .line 1340
    .line 1341
    .line 1342
    .line 1343
    .line 1344
    .line 1345
    .line 1346
    .line 1347
    .line 1348
    .line 1349
    .line 1350
    .line 1351
    .line 1352
    .line 1353
    .line 1354
    .line 1355
    .line 1356
    .line 1357
    .line 1358
    .line 1359
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_18
        :pswitch_f
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method
