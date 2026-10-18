.class public final Lca;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lhl0;

.field public b:Lhl0;

.field public c:Ljl0;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lca;->d:I

    .line 2
    .line 3
    iput-object p2, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static h(Ljava/util/Set;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    instance-of v0, p1, Ljava/util/Set;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    check-cast p1, Ljava/util/Set;

    .line 9
    .line 10
    :try_start_0
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-interface {p1}, Ljava/util/Set;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :catch_0
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    invoke-virtual {p0}, Lha;->clear()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    check-cast p0, Lda;

    .line 15
    .line 16
    invoke-virtual {p0}, Lu71;->clear()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b(II)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    iget-object p0, p0, Lha;->k:[Ljava/lang/Object;

    .line 11
    .line 12
    aget-object p0, p0, p1

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    check-cast p0, Lda;

    .line 16
    .line 17
    iget-object p0, p0, Lu71;->k:[Ljava/lang/Object;

    .line 18
    .line 19
    shl-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    add-int/2addr p1, p2

    .line 22
    aget-object p0, p0, p1

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Ljava/util/Map;
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 7
    .line 8
    const-string v0, "not a map"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0

    .line 14
    :pswitch_0
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lda;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final d()I
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    iget p0, p0, Lha;->l:I

    .line 11
    .line 12
    return p0

    .line 13
    :pswitch_0
    check-cast p0, Lda;

    .line 14
    .line 15
    iget p0, p0, Lu71;->l:I

    .line 16
    .line 17
    return p0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lha;->e()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0, p1}, Lha;->d(ILjava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :goto_0
    return p0

    .line 26
    :pswitch_0
    check-cast p0, Lda;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lu71;->d(Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lha;->e()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0, p1}, Lha;->d(ILjava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :goto_0
    return p0

    .line 26
    :pswitch_0
    check-cast p0, Lda;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lu71;->f(Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final g(I)V
    .locals 1

    .line 1
    iget v0, p0, Lca;->d:I

    .line 2
    .line 3
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lha;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lha;->f(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    check-cast p0, Lda;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lu71;->h(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final i(I[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lca;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    array-length v1, p2

    .line 6
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, [Ljava/lang/Object;

    .line 21
    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    if-ge v1, v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v1, p1}, Lca;->b(II)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    aput-object v2, p2, v1

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    array-length p0, p2

    .line 35
    if-le p0, v0, :cond_2

    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    aput-object p0, p2, v0

    .line 39
    .line 40
    :cond_2
    return-object p2
.end method
