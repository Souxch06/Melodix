.class public final Lyi0;
.super Lzi0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final a(JLjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lif0;

    .line 6
    .line 7
    check-cast p0, Lk0;

    .line 8
    .line 9
    iget-boolean p1, p0, Lk0;->j:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lk0;->j:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/Object;JLjava/lang/Object;)V
    .locals 3

    .line 1
    invoke-static {p2, p3, p1}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lif0;

    .line 6
    .line 7
    invoke-static {p2, p3, p4}, Lmf1;->j(JLjava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    check-cast p4, Lif0;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    if-lez v1, :cond_1

    .line 24
    .line 25
    move-object v2, p0

    .line 26
    check-cast v2, Lk0;

    .line 27
    .line 28
    iget-boolean v2, v2, Lk0;->j:Z

    .line 29
    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    add-int/2addr v1, v0

    .line 33
    invoke-interface {p0, v1}, Lif0;->g(I)Lif0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :cond_0
    invoke-interface {p0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    if-lez v0, :cond_2

    .line 41
    .line 42
    move-object p4, p0

    .line 43
    :cond_2
    invoke-static {p1, p2, p3, p4}, Lmf1;->p(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
