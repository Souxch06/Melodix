.class public final Lqt1;
.super Lms1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final l:Ljava/util/ArrayList;

.field public final m:Ljava/util/ArrayList;

.field public final n:Ler0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;Ler0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lms1;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lqt1;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p4, p0, Lqt1;->n:Ler0;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 p4, 0x0

    .line 24
    :goto_0
    if-ge p4, p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    add-int/lit8 p4, p4, 0x1

    .line 31
    .line 32
    check-cast v0, Lst1;

    .line 33
    .line 34
    iget-object v1, p0, Lqt1;->l:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-interface {v0}, Lst1;->e()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lqt1;->m:Ljava/util/ArrayList;

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(Lqt1;)V
    .locals 2

    .line 52
    iget-object v0, p1, Lms1;->j:Ljava/lang/String;

    invoke-direct {p0, v0}, Lms1;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lqt1;->l:Ljava/util/ArrayList;

    .line 53
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lqt1;->l:Ljava/util/ArrayList;

    iget-object v1, p1, Lqt1;->l:Ljava/util/ArrayList;

    .line 54
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lqt1;->m:Ljava/util/ArrayList;

    .line 55
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lqt1;->m:Ljava/util/ArrayList;

    iget-object v1, p1, Lqt1;->m:Ljava/util/ArrayList;

    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p1, Lqt1;->n:Ler0;

    iput-object p1, p0, Lqt1;->n:Ler0;

    return-void
.end method


# virtual methods
.method public final a(Ler0;Ljava/util/List;)Lst1;
    .locals 7

    .line 1
    iget-object v0, p0, Lqt1;->n:Ler0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ler0;->y()Ler0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Ler0;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lxn0;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    iget-object v4, p0, Lqt1;->l:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    sget-object v6, Lst1;->b:Lzt1;

    .line 20
    .line 21
    if-ge v3, v5, :cond_1

    .line 22
    .line 23
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-ge v3, v5, :cond_0

    .line 28
    .line 29
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    check-cast v5, Lst1;

    .line 40
    .line 41
    iget-object v6, p1, Ler0;->l:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v6, Lxn0;

    .line 44
    .line 45
    invoke-virtual {v6, p1, v5}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v0, v4, v5}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v4, v6}, Ler0;->B(Ljava/lang/String;Lst1;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p0, p0, Lqt1;->m:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    :cond_2
    if-ge v2, p1, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    add-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    check-cast p2, Lst1;

    .line 80
    .line 81
    invoke-virtual {v1, v0, p2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    instance-of v4, v3, Ltt1;

    .line 86
    .line 87
    if-eqz v4, :cond_3

    .line 88
    .line 89
    invoke-virtual {v1, v0, p2}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    :cond_3
    instance-of p2, v3, Lbr1;

    .line 94
    .line 95
    if-eqz p2, :cond_2

    .line 96
    .line 97
    check-cast v3, Lbr1;

    .line 98
    .line 99
    iget-object p0, v3, Lbr1;->j:Lst1;

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_4
    return-object v6
.end method

.method public final p()Lst1;
    .locals 1

    .line 1
    new-instance v0, Lqt1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lqt1;-><init>(Lqt1;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
