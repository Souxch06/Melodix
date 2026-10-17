.class public abstract Lly0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lgy0;

.field public b:Ljava/util/ArrayList;

.field public c:J

.field public d:J

.field public e:J

.field public f:J


# direct methods
.method public static b(Lmu0;)V
    .locals 2

    .line 1
    iget v0, p0, Lmu0;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lmu0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    and-int/lit8 v0, v0, 0x4

    .line 11
    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lmu0;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->D(Lmu0;)I

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public abstract a(Lmu0;Lmu0;Ltw0;Ltw0;)Z
.end method

.method public final c(Lmu0;)V
    .locals 9

    .line 1
    iget-object p0, p0, Lly0;->a:Lgy0;

    .line 2
    .line 3
    if-eqz p0, :cond_5

    .line 4
    .line 5
    iget-object p0, p0, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Lmu0;->o(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lmu0;->a:Landroid/view/View;

    .line 12
    .line 13
    iget-object v2, p1, Lmu0;->h:Lmu0;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v2, p1, Lmu0;->i:Lmu0;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iput-object v3, p1, Lmu0;->h:Lmu0;

    .line 23
    .line 24
    :cond_0
    iput-object v3, p1, Lmu0;->i:Lmu0;

    .line 25
    .line 26
    iget v2, p1, Lmu0;->j:I

    .line 27
    .line 28
    and-int/lit8 v2, v2, 0x10

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView;->k:Lvy0;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->Y()V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Lc9;

    .line 39
    .line 40
    iget-object v4, v3, Lc9;->l:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v4, Ldk;

    .line 43
    .line 44
    iget-object v5, v3, Lc9;->k:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v5, Lgy0;

    .line 47
    .line 48
    iget-object v6, v5, Lgy0;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 49
    .line 50
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    const/4 v7, -0x1

    .line 55
    const/4 v8, 0x0

    .line 56
    if-ne v6, v7, :cond_2

    .line 57
    .line 58
    invoke-virtual {v3, v1}, Lc9;->L(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {v4, v6}, Ldk;->d(I)Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    if-eqz v7, :cond_3

    .line 67
    .line 68
    invoke-virtual {v4, v6}, Ldk;->f(I)Z

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, v1}, Lc9;->L(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v6}, Lgy0;->a(I)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    move v0, v8

    .line 79
    :goto_0
    if-eqz v0, :cond_4

    .line 80
    .line 81
    invoke-static {v1}, Landroidx/recyclerview/widget/RecyclerView;->G(Landroid/view/View;)Lmu0;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v2, v3}, Lvy0;->j(Lmu0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, v3}, Lvy0;->g(Lmu0;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    xor-int/lit8 v2, v0, 0x1

    .line 92
    .line 93
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->Z(Z)V

    .line 94
    .line 95
    .line 96
    if-nez v0, :cond_5

    .line 97
    .line 98
    invoke-virtual {p1}, Lmu0;->k()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    invoke-virtual {p0, v1, v8}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    :cond_5
    :goto_1
    return-void
.end method

.method public abstract d(Lmu0;)V
.end method

.method public abstract e()V
.end method

.method public abstract f()Z
.end method
